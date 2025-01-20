@interface UIPreviewTarget
+ (UIPreviewTarget)new;
+ (id)_targetWithContainer:(id)a3 center:(CGPoint)a4 transform3D:(CATransform3D *)a5;
- (BOOL)isEqual:(id)a3;
- (CATransform3D)_transform3D;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (UIPreviewTarget)init;
- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center;
- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center transform:(CGAffineTransform *)transform;
- (UIView)container;
- (double)_contentScale;
- (id)description;
- (void)_setContentScale:(double)a3;
@end

@implementation UIPreviewTarget

- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center transform:(CGAffineTransform *)transform
{
  CGFloat y = center.y;
  CGFloat x = center.x;
  v10 = container;
  v29.receiver = self;
  v29.super_class = (Class)UIPreviewTarget;
  v11 = [(UIPreviewTarget *)&v29 init];
  if (v11)
  {
    long long v12 = *(_OWORD *)&transform->c;
    *(_OWORD *)&m.a = *(_OWORD *)&transform->a;
    *(_OWORD *)&m.c = v12;
    *(_OWORD *)&m.tCGFloat x = *(_OWORD *)&transform->tx;
    CATransform3DMakeAffineTransform(&v28, &m);
    v13 = v10;
    if (!v13)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel__commonInitWithContainer_center_transform_, v11, @"UITargetedPreview.m", 45, @"Invalid parameter not satisfying: %@", @"container != nil" object file lineNumber description];
    }
    [(UIView *)v13 frame];
    if (CGRectIsNull(v30) || ([(UIView *)v13 frame], CGRectIsInfinite(v31)))
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:sel__commonInitWithContainer_center_transform_, v11, @"UITargetedPreview.m", 47, @"Attempting to create a UIPreviewTarget with an invalid container: %@", v13 object file lineNumber description];
    }
    if (dyld_program_sdk_at_least())
    {
      v14 = [(UIView *)v13 _window];

      if (!v14)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v16 = objc_opt_class();
        v17 = [(UIView *)v13 _conciseParentDescription];
        [v15 handleFailureInMethod:sel__commonInitWithContainer_center_transform_, v11, @"UITargetedPreview.m", 52, @"%@ requires that the container view is in a window, but it is not. (container: %@)", v16, v17 object file lineNumber description];
      }
    }
    objc_storeStrong((id *)&v11->_container, container);
    v11->_center3D.CGFloat x = x;
    v11->_center3D.CGFloat y = y;
    v11->_center3D.z = 0.0;
    long long v19 = *(_OWORD *)&v28.m41;
    long long v18 = *(_OWORD *)&v28.m43;
    long long v20 = *(_OWORD *)&v28.m33;
    *(_OWORD *)&v11->_transform3D.m31 = *(_OWORD *)&v28.m31;
    *(_OWORD *)&v11->_transform3D.m33 = v20;
    *(_OWORD *)&v11->_transform3D.m41 = v19;
    *(_OWORD *)&v11->_transform3D.m43 = v18;
    long long v22 = *(_OWORD *)&v28.m21;
    long long v21 = *(_OWORD *)&v28.m23;
    long long v23 = *(_OWORD *)&v28.m13;
    *(_OWORD *)&v11->_transform3D.m11 = *(_OWORD *)&v28.m11;
    *(_OWORD *)&v11->_transform3D.m13 = v23;
    *(_OWORD *)&v11->_transform3D.m21 = v22;
    *(_OWORD *)&v11->_transform3D.m23 = v21;
    v11->_contentScale = 1.0;
  }
  return v11;
}

- (UIPreviewTarget)initWithContainer:(UIView *)container center:(CGPoint)center
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return -[UIPreviewTarget initWithContainer:center:transform:](self, "initWithContainer:center:transform:", container, v6, center.x, center.y);
}

+ (id)_targetWithContainer:(id)a3 center:(CGPoint)a4 transform3D:(CATransform3D *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = (_OWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:center:", v9, x, y);

  long long v11 = *(_OWORD *)&a5->m11;
  long long v12 = *(_OWORD *)&a5->m13;
  long long v13 = *(_OWORD *)&a5->m23;
  v10[4] = *(_OWORD *)&a5->m21;
  v10[5] = v13;
  v10[2] = v11;
  v10[3] = v12;
  long long v14 = *(_OWORD *)&a5->m31;
  long long v15 = *(_OWORD *)&a5->m33;
  long long v16 = *(_OWORD *)&a5->m43;
  v10[8] = *(_OWORD *)&a5->m41;
  v10[9] = v16;
  v10[6] = v14;
  v10[7] = v15;
  return v10;
}

- (UIPreviewTarget)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UITargetedPreview.m" lineNumber:84 description:@"not implemented"];

  return 0;
}

+ (UIPreviewTarget)new
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UITargetedPreview.m" lineNumber:90 description:@"not implemented"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = [v5 container];
    v7 = [(UIPreviewTarget *)self container];
    if (v6 == v7)
    {
      [v5 center];
      double v10 = v9;
      double v12 = v11;
      [(UIPreviewTarget *)self center];
      BOOL v8 = 0;
      if (v10 == v14 && v12 == v13)
      {
        long long v15 = v5[7];
        *(_OWORD *)&a.m31 = v5[6];
        *(_OWORD *)&a.m33 = v15;
        long long v16 = v5[9];
        *(_OWORD *)&a.m41 = v5[8];
        *(_OWORD *)&a.m43 = v16;
        long long v17 = v5[3];
        *(_OWORD *)&a.m11 = v5[2];
        *(_OWORD *)&a.m13 = v17;
        long long v18 = v5[5];
        *(_OWORD *)&a.m21 = v5[4];
        *(_OWORD *)&a.m23 = v18;
        long long v19 = *(_OWORD *)&self->_transform3D.m33;
        *(_OWORD *)&v24.m31 = *(_OWORD *)&self->_transform3D.m31;
        *(_OWORD *)&v24.m33 = v19;
        long long v20 = *(_OWORD *)&self->_transform3D.m43;
        *(_OWORD *)&v24.m41 = *(_OWORD *)&self->_transform3D.m41;
        *(_OWORD *)&v24.m43 = v20;
        long long v21 = *(_OWORD *)&self->_transform3D.m13;
        *(_OWORD *)&v24.m11 = *(_OWORD *)&self->_transform3D.m11;
        *(_OWORD *)&v24.m13 = v21;
        long long v22 = *(_OWORD *)&self->_transform3D.m23;
        *(_OWORD *)&v24.m21 = *(_OWORD *)&self->_transform3D.m21;
        *(_OWORD *)&v24.m23 = v22;
        BOOL v8 = CATransform3DEqualToTransform(&a, &v24);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  v5 = [(UIPreviewTarget *)self container];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    double v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    double v9 = @"(nil)";
  }
  [(UIPreviewTarget *)self center];
  uint64_t v11 = v10;
  [(UIPreviewTarget *)self center];
  double v13 = [v3 stringWithFormat:@"<%@: %p container = %@; center = (%g %g)", v4, self, v9, v11, v12];;

  [(UIPreviewTarget *)self transform];
  if (!CGAffineTransformIsIdentity(&v17))
  {
    [(UIPreviewTarget *)self transform];
    double v14 = NSStringFromCGAffineTransform(&transform);
    [v13 appendFormat:@"; transforCGAffineTransform m = %@", v14];
  }
  [v13 appendString:@">"];
  return v13;
}

- (CGPoint)center
{
  double x = self->_center3D.x;
  double y = self->_center3D.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->_transform3D.m33;
  *(_OWORD *)&v8.m31 = *(_OWORD *)&self->_transform3D.m31;
  *(_OWORD *)&v8.m33 = v3;
  long long v4 = *(_OWORD *)&self->_transform3D.m43;
  *(_OWORD *)&v8.m41 = *(_OWORD *)&self->_transform3D.m41;
  *(_OWORD *)&v8.m43 = v4;
  long long v5 = *(_OWORD *)&self->_transform3D.m13;
  *(_OWORD *)&v8.m11 = *(_OWORD *)&self->_transform3D.m11;
  *(_OWORD *)&v8.m13 = v5;
  long long v6 = *(_OWORD *)&self->_transform3D.m23;
  *(_OWORD *)&v8.m21 = *(_OWORD *)&self->_transform3D.m21;
  *(_OWORD *)&v8.m23 = v6;
  return CATransform3DGetAffineTransform(retstr, &v8);
}

- (CATransform3D)_transform3D
{
  long long v3 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m41;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)_setContentScale:(double)a3
{
  if (vabdd_f64(a3, self->_contentScale) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    _UICATransform3DCombiningScale(v8);
    long long v4 = v8[5];
    *(_OWORD *)&self->_transform3D.m31 = v8[4];
    *(_OWORD *)&self->_transform3D.m33 = v4;
    long long v5 = v8[7];
    *(_OWORD *)&self->_transform3D.m41 = v8[6];
    *(_OWORD *)&self->_transform3D.m43 = v5;
    long long v6 = v8[1];
    *(_OWORD *)&self->_transform3D.m11 = v8[0];
    *(_OWORD *)&self->_transform3D.m13 = v6;
    long long v7 = v8[3];
    *(_OWORD *)&self->_transform3D.m21 = v8[2];
    *(_OWORD *)&self->_transform3D.m23 = v7;
  }
}

- (double)_contentScale
{
  return self->_contentScale;
}

- (UIView)container
{
  return self->_container;
}

- (void).cxx_destruct
{
}

@end