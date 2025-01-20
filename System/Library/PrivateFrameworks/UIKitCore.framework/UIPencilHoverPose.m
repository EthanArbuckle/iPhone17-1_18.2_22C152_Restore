@interface UIPencilHoverPose
- (CGPoint)location;
- (CGVector)azimuthUnitVector;
- (NSString)debugDescription;
- (UIPencilHoverPose)init;
- (double)altitudeAngle;
- (double)azimuthAngle;
- (double)rollAngle;
- (double)zOffset;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation UIPencilHoverPose

- (UIPencilHoverPose)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 237, @"%s: init is not allowed on %@", "-[UIPencilHoverPose init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (CGPoint)location
{
  double x = self->_location3D.x;
  double y = self->_location3D.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)[(UIPencilHoverPose *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(UIPencilHoverPose *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if (os_variant_has_internal_diagnostics())
  {
    id v7 = (id)objc_msgSend(v3, "ui_appendPoint3D:withName:", @"location3D", self->_location3D.x, self->_location3D.y, self->_location3D.z);
  }
  else
  {
    [(UIPencilHoverPose *)self location];
    id v4 = (id)objc_msgSend(v3, "appendPoint:withName:", @"location");
  }
  id v5 = (id)[v3 appendFloat:@"zOffset" withName:3 decimalPrecision:self->_zOffset];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilHoverPose *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UIPencilHoverPose *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

void __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __59__UIPencilHoverPose_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v4 = *(void **)(a1 + 32);
  v3 = *(double **)(a1 + 40);
  if (has_internal_diagnostics)
  {
    id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendPoint3D:withName:", @"location3D", v3[7], v3[8], v3[9]);
  }
  else
  {
    [v3 location];
    id v5 = (id)objc_msgSend(v4, "appendPoint:withName:", @"location");
  }
  id v6 = (id)[*(id *)(a1 + 32) appendFloat:@"zOffset" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 8)];
  id v7 = (id)[*(id *)(a1 + 32) appendFloat:@"azimuthAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 16)];
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendVector:withName:decimalPrecision:", @"azimuthUnitVector", 3, *(double *)(*(void *)(a1 + 40) + 40), *(double *)(*(void *)(a1 + 40) + 48));
  id v9 = (id)[*(id *)(a1 + 32) appendFloat:@"altitudeAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 24)];
  return (id)[*(id *)(a1 + 32) appendFloat:@"rollAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 32)];
}

- (double)zOffset
{
  return self->_zOffset;
}

- (double)azimuthAngle
{
  return self->_azimuthAngle;
}

- (CGVector)azimuthUnitVector
{
  ddouble x = self->_azimuthUnitVector.dx;
  ddouble y = self->_azimuthUnitVector.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (double)altitudeAngle
{
  return self->_altitudeAngle;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

@end