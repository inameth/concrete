// RUN: concretecompiler --action=roundtrip %s 2>&1| FileCheck %s

/////////////////////////////////////////////////
// FHELinalg.add_eint_int
/////////////////////////////////////////////////

// 1D tensor
// CHECK: func @add_eint_int_1D(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<4xi3>) -> tensor<4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.add_eint_int"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<4xi3>) -> tensor<4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_int_1D(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<4xi3>) -> tensor<4x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint_int"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<4xi3>) -> tensor<4x!FHE.eint<2>>
  return %1: tensor<4x!FHE.eint<2>>
}

// 2D tensor
// CHECK: func @add_eint_int_2D(%[[a0:.*]]: tensor<2x4x!FHE.eint<2>>, %[[a1:.*]]: tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint_int"(%[[a0]], %[[a1]]) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_int_2D(%a0: tensor<2x4x!FHE.eint<2>>, %a1: tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint_int"(%a0, %a1) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>>
  return %1: tensor<2x4x!FHE.eint<2>>
}

// 10D tensor
// CHECK: func @add_eint_int_10D(%[[a0:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %[[a1:.*]]: tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint_int"(%[[a0]], %[[a1]]) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_int_10D(%a0: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %a1: tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint_int"(%a0, %a1) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
  return %1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
}

// Broadcasting with tensor with dimensions equals to one
// CHECK: func @add_eint_int_broadcast_1(%[[a0:.*]]: tensor<1x4x5x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint_int"(%[[a0]], %[[a1]]) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_int_broadcast_1(%a0: tensor<1x4x5x!FHE.eint<2>>, %a1: tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint_int"(%a0, %a1) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>>
  return %1: tensor<3x4x5x!FHE.eint<2>>
}

// Broadcasting with a tensor less dimensions of another
// CHECK: func @add_eint_int_broadcast_2(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint_int"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_int_broadcast_2(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>> {
 %1 ="FHELinalg.add_eint_int"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>>
 return %1: tensor<3x4x!FHE.eint<2>>
}

/////////////////////////////////////////////////
// FHELinalg.add_eint
/////////////////////////////////////////////////

// 1D tensor
// CHECK: func @add_eint_1D(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.add_eint"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_1D(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
  return %1: tensor<4x!FHE.eint<2>>
}

// 2D tensor
// CHECK: func @add_eint_2D(%[[a0:.*]]: tensor<2x4x!FHE.eint<2>>, %[[a1:.*]]: tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint"(%[[a0]], %[[a1]]) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_2D(%a0: tensor<2x4x!FHE.eint<2>>, %a1: tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint"(%a0, %a1) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>>
  return %1: tensor<2x4x!FHE.eint<2>>
}

// 10D tensor
// CHECK: func @add_eint_10D(%[[a0:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %[[a1:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint"(%[[a0]], %[[a1]]) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_10D(%a0: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %a1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint"(%a0, %a1) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
  return %1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
}

// Broadcasting with tensor with dimensions equals to one
// CHECK: func @add_eint_broadcast_1(%[[a0:.*]]: tensor<1x4x5x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4x1x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint"(%[[a0]], %[[a1]]) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_broadcast_1(%a0: tensor<1x4x5x!FHE.eint<2>>, %a1: tensor<3x4x1x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>> {
  %1 = "FHELinalg.add_eint"(%a0, %a1) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>>
  return %1: tensor<3x4x5x!FHE.eint<2>>
}

// Broadcasting with a tensor less dimensions of another
// CHECK: func @add_eint_broadcast_2(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.add_eint"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<3x4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @add_eint_broadcast_2(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<3x4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>> {
 %1 ="FHELinalg.add_eint"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<3x4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>>
 return %1: tensor<3x4x!FHE.eint<2>>
}


/////////////////////////////////////////////////
// FHELinalg.sub_eint_int
/////////////////////////////////////////////////

// 1D tensor
// CHECK: func @sub_int_eint_1D(%[[a0:.*]]: tensor<4xi3>, %[[a1:.*]]: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.sub_int_eint"(%[[a0]], %[[a1]]) : (tensor<4xi3>, tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x!FHE.eint<2>>
// CHECK-NEXT: }
func @sub_int_eint_1D(%a0: tensor<4xi3>, %a1: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
  %1 = "FHELinalg.sub_int_eint"(%a0, %a1) : (tensor<4xi3>, tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
  return %1: tensor<4x!FHE.eint<2>>
}

// 2D tensor
// CHECK: func @sub_int_eint_2D(%[[a0:.*]]: tensor<2x4xi3>, %[[a1:.*]]: tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.sub_int_eint"(%[[a0]], %[[a1]]) : (tensor<2x4xi3>, tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @sub_int_eint_2D(%a0: tensor<2x4xi3>, %a1: tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>> {
  %1 = "FHELinalg.sub_int_eint"(%a0, %a1) : (tensor<2x4xi3>, tensor<2x4x!FHE.eint<2>>) -> tensor<2x4x!FHE.eint<2>>
  return %1: tensor<2x4x!FHE.eint<2>>
}

// 10D tensor
// CHECK: func @sub_int_eint_10D(%[[a0:.*]]: tensor<1x2x3x4x5x6x7x8x9x10xi3>, %[[a1:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.sub_int_eint"(%[[a0]], %[[a1]]) : (tensor<1x2x3x4x5x6x7x8x9x10xi3>, tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: }
func @sub_int_eint_10D(%a0: tensor<1x2x3x4x5x6x7x8x9x10xi3>, %a1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
  %1 = "FHELinalg.sub_int_eint"(%a0, %a1) : (tensor<1x2x3x4x5x6x7x8x9x10xi3>, tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
  return %1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
}

// Broadcasting with tensor with dimensions equals to one
// CHECK: func @sub_int_eint_broadcast_1(%[[a0:.*]]: tensor<3x4x1xi3>, %[[a1:.*]]: tensor<1x4x5x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.sub_int_eint"(%[[a0]], %[[a1]]) : (tensor<3x4x1xi3>, tensor<1x4x5x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT: }
func @sub_int_eint_broadcast_1(%a0: tensor<3x4x1xi3>, %a1: tensor<1x4x5x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>> {
  %1 = "FHELinalg.sub_int_eint"(%a0, %a1) : (tensor<3x4x1xi3>, tensor<1x4x5x!FHE.eint<2>>) -> tensor<3x4x5x!FHE.eint<2>>
  return %1: tensor<3x4x5x!FHE.eint<2>>
}

// Broadcasting with a tensor less dimensions of another
// CHECK: func @sub_int_eint_broadcast_2(%[[a0:.*]]: tensor<3x4xi3>, %[[a1:.*]]: tensor<4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.sub_int_eint"(%[[a0]], %[[a1]]) : (tensor<3x4xi3>, tensor<4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @sub_int_eint_broadcast_2(%a0: tensor<3x4xi3>, %a1: tensor<4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>> {
 %1 ="FHELinalg.sub_int_eint"(%a0, %a1) : (tensor<3x4xi3>, tensor<4x!FHE.eint<2>>) -> tensor<3x4x!FHE.eint<2>>
 return %1: tensor<3x4x!FHE.eint<2>>
}


/////////////////////////////////////////////////
// FHELinalg.neg_eint
/////////////////////////////////////////////////

// 1D tensor
// CHECK: func @neg_eint_1D(%[[a0:.*]]: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.neg_eint"(%[[a0]]) : (tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x!FHE.eint<2>>
// CHECK-NEXT: }
func @neg_eint_1D(%a0: tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>> {
  %1 = "FHELinalg.neg_eint"(%a0) : (tensor<4x!FHE.eint<2>>) -> tensor<4x!FHE.eint<2>>
  return %1: tensor<4x!FHE.eint<2>>
}

// 1D tensor
// CHECK: func @neg_eint_2D(%[[a0:.*]]: tensor<4x4x!FHE.eint<2>>) -> tensor<4x4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.neg_eint"(%[[a0]]) : (tensor<4x4x!FHE.eint<2>>) -> tensor<4x4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @neg_eint_2D(%a0: tensor<4x4x!FHE.eint<2>>) -> tensor<4x4x!FHE.eint<2>> {
  %1 = "FHELinalg.neg_eint"(%a0) : (tensor<4x4x!FHE.eint<2>>) -> tensor<4x4x!FHE.eint<2>>
  return %1: tensor<4x4x!FHE.eint<2>>
}

// 10D tensor
// CHECK: func @neg_eint_10D(%[[a0:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.neg_eint"(%[[a0]]) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: }
func @neg_eint_10D(%a0: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
  %1 = "FHELinalg.neg_eint"(%a0) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
  return %1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
}


/////////////////////////////////////////////////
// FHELinalg.mul_eint_int
/////////////////////////////////////////////////

// 1D tensor
// CHECK: func @mul_eint_int_1D(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<4xi3>) -> tensor<4x!FHE.eint<2>> {
// CHECK-NEXT: %[[V0:.*]] = "FHELinalg.mul_eint_int"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<4xi3>) -> tensor<4x!FHE.eint<2>>
// CHECK-NEXT: return %[[V0]] : tensor<4x!FHE.eint<2>>
// CHECK-NEXT: }
func @mul_eint_int_1D(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<4xi3>) -> tensor<4x!FHE.eint<2>> {
  %1 = "FHELinalg.mul_eint_int"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<4xi3>) -> tensor<4x!FHE.eint<2>>
  return %1: tensor<4x!FHE.eint<2>>
}

// 2D tensor
// CHECK: func @mul_eint_int_2D(%[[a0:.*]]: tensor<2x4x!FHE.eint<2>>, %[[a1:.*]]: tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.mul_eint_int"(%[[a0]], %[[a1]]) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<2x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @mul_eint_int_2D(%a0: tensor<2x4x!FHE.eint<2>>, %a1: tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>> {
  %1 = "FHELinalg.mul_eint_int"(%a0, %a1) : (tensor<2x4x!FHE.eint<2>>, tensor<2x4xi3>) -> tensor<2x4x!FHE.eint<2>>
  return %1: tensor<2x4x!FHE.eint<2>>
}

// 10D tensor
// CHECK: func @mul_eint_int_10D(%[[a0:.*]]: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %[[a1:.*]]: tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.mul_eint_int"(%[[a0]], %[[a1]]) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
// CHECK-NEXT: }
func @mul_eint_int_10D(%a0: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, %a1: tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>> {
  %1 = "FHELinalg.mul_eint_int"(%a0, %a1) : (tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>, tensor<1x2x3x4x5x6x7x8x9x10xi3>) -> tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
  return %1: tensor<1x2x3x4x5x6x7x8x9x10x!FHE.eint<2>>
}

// Broadcasting with tensor with dimensions equals to one
// CHECK: func @mul_eint_int_broadcast_1(%[[a0:.*]]: tensor<1x4x5x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.mul_eint_int"(%[[a0]], %[[a1]]) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x5x!FHE.eint<2>>
// CHECK-NEXT: }
func @mul_eint_int_broadcast_1(%a0: tensor<1x4x5x!FHE.eint<2>>, %a1: tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>> {
  %1 = "FHELinalg.mul_eint_int"(%a0, %a1) : (tensor<1x4x5x!FHE.eint<2>>, tensor<3x4x1xi3>) -> tensor<3x4x5x!FHE.eint<2>>
  return %1: tensor<3x4x5x!FHE.eint<2>>
}

// Broadcasting with a tensor less dimensions of another
// CHECK: func @mul_eint_int_broadcast_2(%[[a0:.*]]: tensor<4x!FHE.eint<2>>, %[[a1:.*]]: tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>> {
// CHECK-NEXT:   %[[V0:.*]] = "FHELinalg.mul_eint_int"(%[[a0]], %[[a1]]) : (tensor<4x!FHE.eint<2>>, tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT:   return %[[V0]] : tensor<3x4x!FHE.eint<2>>
// CHECK-NEXT: }
func @mul_eint_int_broadcast_2(%a0: tensor<4x!FHE.eint<2>>, %a1: tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>> {
 %1 ="FHELinalg.mul_eint_int"(%a0, %a1) : (tensor<4x!FHE.eint<2>>, tensor<3x4xi3>) -> tensor<3x4x!FHE.eint<2>>
 return %1: tensor<3x4x!FHE.eint<2>>
}

/////////////////////////////////////////////////
// FHELinalg.apply_lookup_table
/////////////////////////////////////////////////

// CHECK-LABEL: func @apply_lookup_table(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
func @apply_lookup_table(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<4xi64>) -> tensor<2x3x4x!FHE.eint<2>> {
  // CHECK-NEXT: %[[V1:.*]] = "FHELinalg.apply_lookup_table"(%arg0, %arg1) : (tensor<2x3x4x!FHE.eint<2>>, tensor<4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
  // CHECK-NEXT: return %[[V1]] : tensor<2x3x4x!FHE.eint<2>>

  %1 = "FHELinalg.apply_lookup_table"(%arg0, %arg1): (tensor<2x3x4x!FHE.eint<2>>, tensor<4xi64>) -> (tensor<2x3x4x!FHE.eint<2>>)
  return %1: tensor<2x3x4x!FHE.eint<2>>
}

/////////////////////////////////////////////////
// FHELinalg.apply_multi_lookup_table
/////////////////////////////////////////////////

// CHECK-LABEL: func @apply_multi_lookup_table(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<2x3x4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
func @apply_multi_lookup_table(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<2x3x4xi64>) -> tensor<2x3x4x!FHE.eint<2>> {
  // CHECK-NEXT: %[[V1:.*]] = "FHELinalg.apply_multi_lookup_table"(%arg0, %arg1) : (tensor<2x3x4x!FHE.eint<2>>, tensor<2x3x4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
  // CHECK-NEXT: return %[[V1]] : tensor<2x3x4x!FHE.eint<2>>

  %1 = "FHELinalg.apply_multi_lookup_table"(%arg0, %arg1): (tensor<2x3x4x!FHE.eint<2>>, tensor<2x3x4xi64>) -> (tensor<2x3x4x!FHE.eint<2>>)
  return %1: tensor<2x3x4x!FHE.eint<2>>
}

// CHECK-LABEL: func @apply_multi_lookup_table_broadcast(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<2x4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
func @apply_multi_lookup_table_broadcast(%arg0: tensor<2x3x4x!FHE.eint<2>>, %arg1: tensor<2x4xi64>) -> tensor<2x3x4x!FHE.eint<2>> {
  // CHECK-NEXT: %[[V1:.*]] = "FHELinalg.apply_multi_lookup_table"(%arg0, %arg1) : (tensor<2x3x4x!FHE.eint<2>>, tensor<2x4xi64>) -> tensor<2x3x4x!FHE.eint<2>>
  // CHECK-NEXT: return %[[V1]] : tensor<2x3x4x!FHE.eint<2>>

  %1 = "FHELinalg.apply_multi_lookup_table"(%arg0, %arg1): (tensor<2x3x4x!FHE.eint<2>>, tensor<2x4xi64>) -> (tensor<2x3x4x!FHE.eint<2>>)
  return %1: tensor<2x3x4x!FHE.eint<2>>
}

/////////////////////////////////////////////////
// FHELinalg.apply_mapped_lookup_table
/////////////////////////////////////////////////

// CHECK-LABEL: func @apply_mapped_lookup_table(%arg0: tensor<2x3x4x!FHE.eint<7>>, %arg1: tensor<10x128xi64>, %arg2: tensor<2x3x4xindex>) -> tensor<2x3x4x!FHE.eint<7>> {
func @apply_mapped_lookup_table(
  %input: tensor<2x3x4x!FHE.eint<7>>,
  %luts: tensor<10x128xi64>,
  %map: tensor<2x3x4xindex>
) -> tensor<2x3x4x!FHE.eint<7>> {
  // CHECK-NEXT: %0 = "FHELinalg.apply_mapped_lookup_table"(%arg0, %arg1, %arg2) : (tensor<2x3x4x!FHE.eint<7>>, tensor<10x128xi64>, tensor<2x3x4xindex>) -> tensor<2x3x4x!FHE.eint<7>>
  // CHECK-NEXT: return %0 : tensor<2x3x4x!FHE.eint<7>>
  %0 = "FHELinalg.apply_mapped_lookup_table"(%input, %luts, %map): (tensor<2x3x4x!FHE.eint<7>>, tensor<10x128xi64>, tensor<2x3x4xindex>) -> (tensor<2x3x4x!FHE.eint<7>>)
  return %0: tensor<2x3x4x!FHE.eint<7>>
}

/////////////////////////////////////////////////
// FHELinalg.dot_eint_int
/////////////////////////////////////////////////

// CHECK-LABEL: func @dot_eint_int(%arg0: tensor<2x!FHE.eint<2>>, %arg1: tensor<2xi3>) -> !FHE.eint<2>
func @dot_eint_int(%arg0: tensor<2x!FHE.eint<2>>,
                   %arg1: tensor<2xi3>) -> !FHE.eint<2>
{
  // CHECK-NEXT: %[[RET:.*]] = "FHELinalg.dot_eint_int"(%arg0, %arg1) : (tensor<2x!FHE.eint<2>>, tensor<2xi3>) -> !FHE.eint<2>
  %ret = "FHELinalg.dot_eint_int"(%arg0, %arg1) :
    (tensor<2x!FHE.eint<2>>, tensor<2xi3>) -> !FHE.eint<2>

  //CHECK-NEXT: return %[[RET]] : !FHE.eint<2>
  return %ret : !FHE.eint<2>
}

/////////////////////////////////////////////////
// FHELinalg.conv2d
/////////////////////////////////////////////////

// CHECK:       func @conv2d(%[[ARG0:.*]]: tensor<100x3x28x28x!FHE.eint<2>>, %[[ARG1:.*]]: tensor<4x3x14x14xi3>, %[[ARG2:.*]]: tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
// CHECK-NEXT:    %[[V0:.*]] = "FHELinalg.conv2d"(%[[ARG0]], %[[ARG1]], %[[ARG2]]) {dilations = dense<1> : tensor<2xi64>, padding = dense<0> : tensor<4xi64>, strides = dense<1> : tensor<2xi64>} : (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>, tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:    return %[[V0]] : tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:  }
func @conv2d(%input: tensor<100x3x28x28x!FHE.eint<2>>, %weight: tensor<4x3x14x14xi3>, %bias: tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
  %1 = "FHELinalg.conv2d"(%input, %weight, %bias){strides = dense<[1,1]> : tensor<2xi64>, dilations = dense<[1,1]> : tensor<2xi64>, padding = dense<[0,0, 0, 0]> : tensor<4xi64>}: (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>, tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
  return %1 : tensor<100x4x15x15x!FHE.eint<2>>
}


// CHECK:       func @conv2d_without_attr(%[[ARG0:.*]]: tensor<100x3x28x28x!FHE.eint<2>>, %[[ARG1:.*]]: tensor<4x3x14x14xi3>, %[[ARG2:.*]]: tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
// CHECK-NEXT:    %[[V0:.*]] = "FHELinalg.conv2d"(%[[ARG0]], %[[ARG1]], %[[ARG2]]) : (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>, tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:    return %[[V0]] : tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:  }
func @conv2d_without_attr(%input: tensor<100x3x28x28x!FHE.eint<2>>, %weight: tensor<4x3x14x14xi3>, %bias: tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
  %1 = "FHELinalg.conv2d"(%input, %weight, %bias): (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>, tensor<4xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
  return %1 : tensor<100x4x15x15x!FHE.eint<2>>
}


// CHECK:       func @conv2d_without_bias(%[[ARG0:.*]]: tensor<100x3x28x28x!FHE.eint<2>>, %[[ARG1:.*]]: tensor<4x3x14x14xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
// CHECK-NEXT:    %[[V0:.*]] = "FHELinalg.conv2d"(%[[ARG0]], %[[ARG1]]) {dilations = dense<1> : tensor<2xi64>, padding = dense<0> : tensor<4xi64>, strides = dense<1> : tensor<2xi64>} : (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:    return %[[V0]] : tensor<100x4x15x15x!FHE.eint<2>>
// CHECK-NEXT:  }
func @conv2d_without_bias(%input: tensor<100x3x28x28x!FHE.eint<2>>, %weight: tensor<4x3x14x14xi3>) -> tensor<100x4x15x15x!FHE.eint<2>> {
  %1 = "FHELinalg.conv2d"(%input, %weight){strides = dense<[1,1]> : tensor<2xi64>, dilations = dense<[1,1]> : tensor<2xi64>, padding = dense<[0,0, 0, 0]> : tensor<4xi64>}: (tensor<100x3x28x28x!FHE.eint<2>>, tensor<4x3x14x14xi3>) -> tensor<100x4x15x15x!FHE.eint<2>>
  return %1 : tensor<100x4x15x15x!FHE.eint<2>>
}
