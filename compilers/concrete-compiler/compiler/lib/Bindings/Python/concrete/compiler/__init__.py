#  Part of the Concrete Compiler Project, under the BSD3 License with Zama Exceptions.
#  See https://github.com/zama-ai/concrete/blob/main/LICENSE.txt for license information.

"""Compiler submodule."""
import atexit

# pylint: disable=no-name-in-module,import-error
from mlir._mlir_libs._concretelang._compiler import (
    terminate_df_parallelization as _terminate_df_parallelization,
    init_df_parallelization as _init_df_parallelization,
)
from mlir._mlir_libs._concretelang._compiler import round_trip as _round_trip
from mlir._mlir_libs._concretelang._compiler import (
    set_llvm_debug_flag,
    set_compiler_logging,
)

# pylint: enable=no-name-in-module,import-error

from .compilation_options import CompilationOptions, Encoding
from .compilation_context import CompilationContext
from .key_set_cache import KeySetCache
from .client_parameters import ClientParameters
from .compilation_feedback import ProgramCompilationFeedback, CircuitCompilationFeedback
from .key_set import KeySet
from .public_result import PublicResult
from .public_arguments import PublicArguments
from .lambda_argument import LambdaArgument
from .library_compilation_result import LibraryCompilationResult
from .library_lambda import LibraryLambda
from .client_support import ClientSupport
from .library_support import LibrarySupport
from .evaluation_keys import EvaluationKeys
from .value import Value
from .value_decrypter import ValueDecrypter
from .value_exporter import ValueExporter
from .simulated_value_decrypter import SimulatedValueDecrypter
from .simulated_value_exporter import SimulatedValueExporter
from .parameter import Parameter


def init_dfr():
    """Initialize dataflow parallelization.

    It is not always required to initialize the dataflow runtime as it can be implicitely done
    during compilation. However, it is required in case no compilation has previously been done
    and the runtime is needed"""
    _init_df_parallelization()


# Cleanly terminate the dataflow runtime if it has been initialized
# (does nothing otherwise)
atexit.register(_terminate_df_parallelization)


def round_trip(mlir_str: str) -> str:
    """Parse the MLIR input, then return it back.

    Useful to check the validity of an MLIR representation

    Args:
        mlir_str (str): textual representation of an MLIR code

    Raises:
        TypeError: if mlir_str is not of type str

    Returns:
        str: textual representation of the MLIR code after parsing
    """
    if not isinstance(mlir_str, str):
        raise TypeError(f"mlir_str must be of type str, not {type(mlir_str)}")
    return _round_trip(mlir_str)
