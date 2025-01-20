@interface SBFluidSwitcherItemContainerLayer
- (BOOL)positionAnimationsBeginFromModelState;
- (BOOL)transformAnimationsAreLegacyCounterRotations;
- (SBFluidSwitcherItemContainerLayer)init;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)setPosition:(CGPoint)a3;
- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3;
- (void)setTransform:(CATransform3D *)a3;
- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3;
@end

@implementation SBFluidSwitcherItemContainerLayer

- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3
{
  self->_transformAnimationsAreLegacyCounterRotations = a3;
}

- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3
{
  self->_positionAnimationsBeginFromModelState = a3;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_previousPosition = &self->_previousPosition;
  [(SBFluidSwitcherItemContainerLayer *)self position];
  p_previousPosition->double x = v7;
  p_previousPosition->double y = v8;
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  -[SBFluidSwitcherItemContainerLayer setPosition:](&v9, sel_setPosition_, x, y);
}

- (void)setTransform:(CATransform3D *)a3
{
  p_previousTransform = &self->_previousTransform;
  [(SBFluidSwitcherItemContainerLayer *)self transform];
  long long v6 = v34;
  *(_OWORD *)&p_previousTransform->m31 = v33;
  *(_OWORD *)&p_previousTransform->m33 = v6;
  long long v7 = v36;
  *(_OWORD *)&p_previousTransform->m41 = v35;
  *(_OWORD *)&p_previousTransform->m43 = v7;
  long long v8 = v30;
  *(_OWORD *)&p_previousTransform->m11 = v29;
  *(_OWORD *)&p_previousTransform->m13 = v8;
  long long v9 = v32;
  *(_OWORD *)&p_previousTransform->m21 = v31;
  *(_OWORD *)&p_previousTransform->m23 = v9;
  long long v10 = *(_OWORD *)&p_previousTransform->m33;
  long long v33 = *(_OWORD *)&p_previousTransform->m31;
  long long v34 = v10;
  long long v11 = *(_OWORD *)&p_previousTransform->m43;
  long long v35 = *(_OWORD *)&p_previousTransform->m41;
  long long v36 = v11;
  long long v12 = *(_OWORD *)&p_previousTransform->m13;
  long long v29 = *(_OWORD *)&p_previousTransform->m11;
  long long v30 = v12;
  long long v13 = *(_OWORD *)&p_previousTransform->m23;
  long long v31 = *(_OWORD *)&p_previousTransform->m21;
  long long v32 = v13;
  objc_super v14 = *(objc_super *)&a3->m33;
  v28[5] = *(objc_super *)&a3->m31;
  v28[6] = v14;
  objc_super v15 = *(objc_super *)&a3->m43;
  v28[7] = *(objc_super *)&a3->m41;
  v28[8] = v15;
  objc_super v16 = *(objc_super *)&a3->m13;
  v28[1] = *(objc_super *)&a3->m11;
  v28[2] = v16;
  objc_super v17 = *(objc_super *)&a3->m23;
  v28[3] = *(objc_super *)&a3->m21;
  v28[4] = v17;
  if (BSFloatEqualToFloat())
  {
    uint64_t v18 = 1;
    while (v18 != 16)
    {
      ++v18;
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        if ((unint64_t)(v18 - 2) > 0xE) {
          break;
        }
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    v28[0].receiver = self;
    v28[0].super_class = (Class)SBFluidSwitcherItemContainerLayer;
    long long v19 = *(_OWORD *)&a3->m33;
    long long v33 = *(_OWORD *)&a3->m31;
    long long v34 = v19;
    long long v20 = *(_OWORD *)&a3->m43;
    long long v35 = *(_OWORD *)&a3->m41;
    long long v36 = v20;
    long long v21 = *(_OWORD *)&a3->m13;
    long long v29 = *(_OWORD *)&a3->m11;
    long long v30 = v21;
    long long v22 = *(_OWORD *)&a3->m23;
    long long v31 = *(_OWORD *)&a3->m21;
    long long v32 = v22;
    [(objc_super *)v28 setTransform:&v29];
  }
  v23 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&p_previousTransform->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&p_previousTransform->m33 = v24;
  long long v25 = v23[7];
  *(_OWORD *)&p_previousTransform->m41 = v23[6];
  *(_OWORD *)&p_previousTransform->m43 = v25;
  long long v26 = v23[1];
  *(_OWORD *)&p_previousTransform->m11 = *v23;
  *(_OWORD *)&p_previousTransform->m13 = v26;
  long long v27 = v23[3];
  *(_OWORD *)&p_previousTransform->m21 = v23[2];
  *(_OWORD *)&p_previousTransform->m23 = v27;
}

- (SBFluidSwitcherItemContainerLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  result = [(SBFluidSwitcherItemContainerLayer *)&v8 init];
  if (result)
  {
    result->_previousPosition = (CGPoint)SBInvalidPoint;
    v3 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&result->_previousTransform.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&result->_previousTransform.m33 = v4;
    long long v5 = v3[7];
    *(_OWORD *)&result->_previousTransform.m41 = v3[6];
    *(_OWORD *)&result->_previousTransform.m43 = v5;
    long long v6 = v3[1];
    *(_OWORD *)&result->_previousTransform.m11 = *v3;
    *(_OWORD *)&result->_previousTransform.m13 = v6;
    long long v7 = v3[3];
    *(_OWORD *)&result->_previousTransform.m21 = v3[2];
    *(_OWORD *)&result->_previousTransform.m23 = v7;
  }
  return result;
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_positionAnimationsBeginFromModelState
    && [v7 isEqualToString:@"position"]
    && (self->_previousPosition.x == 1.79769313e308 ? (BOOL v9 = self->_previousPosition.y == 1.79769313e308) : (BOOL v9 = 0), !v9))
  {
    uint64_t v10 = objc_opt_class();
    long long v11 = SBSafeCast(v10, v6);
    long long v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 fromValue];
      if (v13)
      {
        objc_super v14 = (void *)v13;
        objc_super v15 = [v12 toValue];
        if (v15)
        {
        }
        else
        {
          long long v22 = [v12 byValue];

          if (!v22)
          {
            CGPoint previousPosition = self->_previousPosition;
            v23 = [MEMORY[0x1E4F29238] valueWithBytes:&previousPosition objCType:"{CGPoint=dd}"];
            [v12 setFromValue:v23];

            long long v24 = (void *)[v12 copy];
            [v24 setKeyPath:@"anchorPoint"];
            long long v25 = (void *)MEMORY[0x1E4F29238];
            [(SBFluidSwitcherItemContainerLayer *)self anchorPoint];
            v41[0] = v26;
            v41[1] = v27;
            v28 = [v25 valueWithBytes:v41 objCType:"{CGPoint=dd}"];
            [v24 setFromValue:v28];

            v40.receiver = self;
            v40.super_class = (Class)SBFluidSwitcherItemContainerLayer;
            [(SBFluidSwitcherItemContainerLayer *)&v40 addAnimation:v24 forKey:@"anchorPoint"];
          }
        }
      }
    }
  }
  else if (self->_transformAnimationsAreLegacyCounterRotations)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v8 isEqualToString:@"transform"])
      {
        long long v16 = *(_OWORD *)&self->_previousTransform.m33;
        v30[4] = *(_OWORD *)&self->_previousTransform.m31;
        v30[5] = v16;
        long long v17 = *(_OWORD *)&self->_previousTransform.m43;
        v30[6] = *(_OWORD *)&self->_previousTransform.m41;
        v30[7] = v17;
        long long v18 = *(_OWORD *)&self->_previousTransform.m13;
        v30[0] = *(_OWORD *)&self->_previousTransform.m11;
        v30[1] = v18;
        long long v19 = *(_OWORD *)&self->_previousTransform.m23;
        v30[2] = *(_OWORD *)&self->_previousTransform.m21;
        v30[3] = v19;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        [(SBFluidSwitcherItemContainerLayer *)self transform];
        v31[4] = v36;
        v31[5] = v37;
        v31[6] = v38;
        v31[7] = v39;
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        v31[3] = v35;
        uint64_t v20 = _UIInterfaceOrientationFromCATransform3D(v31);
        uint64_t v21 = _UIInterfaceOrientationFromCATransform3D(v30);
        _UIMakeBasicTransformAnimationUnambiguous(v6, v21, v20, 1, 0);
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  [(SBFluidSwitcherItemContainerLayer *)&v29 addAnimation:v6 forKey:v8];
}

- (BOOL)positionAnimationsBeginFromModelState
{
  return self->_positionAnimationsBeginFromModelState;
}

- (BOOL)transformAnimationsAreLegacyCounterRotations
{
  return self->_transformAnimationsAreLegacyCounterRotations;
}

@end