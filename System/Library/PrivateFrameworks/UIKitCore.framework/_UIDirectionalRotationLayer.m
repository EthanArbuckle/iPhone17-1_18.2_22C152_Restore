@interface _UIDirectionalRotationLayer
- (BOOL)isCounterTransformLayer;
- (BOOL)isInverseTransformLayer;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)setCounterTransformLayer:(BOOL)a3;
- (void)setInverseTransformLayer:(BOOL)a3;
- (void)setTransform:(CATransform3D *)a3;
@end

@implementation _UIDirectionalRotationLayer

- (void)setTransform:(CATransform3D *)a3
{
  p_previousTransform = &self->_previousTransform;
  [(_UIDirectionalRotationLayer *)self transform];
  long long v6 = v25;
  *(_OWORD *)&p_previousTransform->m31 = v24;
  *(_OWORD *)&p_previousTransform->m33 = v6;
  long long v7 = v27;
  *(_OWORD *)&p_previousTransform->m41 = v26;
  *(_OWORD *)&p_previousTransform->m43 = v7;
  long long v8 = v21;
  *(_OWORD *)&p_previousTransform->m11 = v20;
  *(_OWORD *)&p_previousTransform->m13 = v8;
  long long v9 = v23;
  *(_OWORD *)&p_previousTransform->m21 = v22;
  *(_OWORD *)&p_previousTransform->m23 = v9;
  v19.receiver = self;
  v19.super_class = (Class)_UIDirectionalRotationLayer;
  long long v10 = *(_OWORD *)&a3->m33;
  long long v24 = *(_OWORD *)&a3->m31;
  long long v25 = v10;
  long long v11 = *(_OWORD *)&a3->m43;
  long long v26 = *(_OWORD *)&a3->m41;
  long long v27 = v11;
  long long v12 = *(_OWORD *)&a3->m13;
  long long v20 = *(_OWORD *)&a3->m11;
  long long v21 = v12;
  long long v13 = *(_OWORD *)&a3->m23;
  long long v22 = *(_OWORD *)&a3->m21;
  long long v23 = v13;
  [(_UIDirectionalRotationLayer *)&v19 setTransform:&v20];
  v14 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&p_previousTransform->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&p_previousTransform->m33 = v15;
  long long v16 = v14[7];
  *(_OWORD *)&p_previousTransform->m41 = v14[6];
  *(_OWORD *)&p_previousTransform->m43 = v16;
  long long v17 = v14[1];
  *(_OWORD *)&p_previousTransform->m11 = *v14;
  *(_OWORD *)&p_previousTransform->m13 = v17;
  long long v18 = v14[3];
  *(_OWORD *)&p_previousTransform->m21 = v14[2];
  *(_OWORD *)&p_previousTransform->m23 = v18;
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isEqualToString:@"transform"])
  {
    long long v8 = [(_UIDirectionalRotationLayer *)self presentationLayer];
    long long v9 = v8;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    if (v8)
    {
      [v8 transform];
    }
    else
    {
      long long v10 = *(_OWORD *)&self->_previousTransform.m33;
      long long v37 = *(_OWORD *)&self->_previousTransform.m31;
      long long v38 = v10;
      long long v11 = *(_OWORD *)&self->_previousTransform.m43;
      long long v39 = *(_OWORD *)&self->_previousTransform.m41;
      long long v40 = v11;
      long long v12 = *(_OWORD *)&self->_previousTransform.m13;
      long long v33 = *(_OWORD *)&self->_previousTransform.m11;
      long long v34 = v12;
      long long v13 = *(_OWORD *)&self->_previousTransform.m23;
      long long v35 = *(_OWORD *)&self->_previousTransform.m21;
      long long v36 = v13;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    [(_UIDirectionalRotationLayer *)self transform];
    long long v21 = v29;
    long long v22 = v30;
    long long v23 = v31;
    long long v24 = v32;
    long long v17 = v25;
    long long v18 = v26;
    long long v19 = v27;
    long long v20 = v28;
    uint64_t v14 = _UIInterfaceOrientationFromCATransform3D(&v17);
    long long v21 = v37;
    long long v22 = v38;
    long long v23 = v39;
    long long v24 = v40;
    long long v17 = v33;
    long long v18 = v34;
    long long v19 = v35;
    long long v20 = v36;
    uint64_t v15 = _UIInterfaceOrientationFromCATransform3D(&v17);
    _UIMakeBasicTransformAnimationUnambiguousWithOrientations(v6, v15, v14, [(_UIDirectionalRotationLayer *)self isCounterTransformLayer], [(_UIDirectionalRotationLayer *)self isInverseTransformLayer]);
  }
  v16.receiver = self;
  v16.super_class = (Class)_UIDirectionalRotationLayer;
  [(_UIDirectionalRotationLayer *)&v16 addAnimation:v6 forKey:v7];
}

- (BOOL)isCounterTransformLayer
{
  return self->_counterTransformLayer;
}

- (void)setCounterTransformLayer:(BOOL)a3
{
  self->_counterTransformLayer = a3;
}

- (BOOL)isInverseTransformLayer
{
  return self->_inverseTransformLayer;
}

- (void)setInverseTransformLayer:(BOOL)a3
{
  self->_inverseTransformLayer = a3;
}

@end