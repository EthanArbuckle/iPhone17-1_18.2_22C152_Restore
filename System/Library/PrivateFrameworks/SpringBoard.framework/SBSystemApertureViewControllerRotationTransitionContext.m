@interface SBSystemApertureViewControllerRotationTransitionContext
+ (CGAffineTransform)transformForRotationToInterfaceOrientation:(SEL)a3;
- (CGAffineTransform)_affineTransform;
- (SBSystemApertureViewControllerRotationTransitionContext)initWithTargetOrientation:(int64_t)a3;
@end

@implementation SBSystemApertureViewControllerRotationTransitionContext

+ (CGAffineTransform)transformForRotationToInterfaceOrientation:(SEL)a3
{
  switch(a4)
  {
    case 1:
      double v4 = 0.0;
      break;
    case 3:
      double v4 = 1.57079633;
      break;
    case 4:
      double v4 = -1.57079633;
      break;
    default:
      double v4 = 3.14159265;
      if (a4 != 2) {
        double v4 = 0.0;
      }
      break;
  }
  return CGAffineTransformMakeRotation(retstr, v4);
}

- (SBSystemApertureViewControllerRotationTransitionContext)initWithTargetOrientation:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureViewControllerRotationTransitionContext;
  double v4 = [(_UIViewControllerTransitionContext *)&v10 init];
  if (v4)
  {
    v5 = objc_opt_class();
    if (v5)
    {
      [v5 transformForRotationToInterfaceOrientation:a3];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    *(_OWORD *)(v4 + 184) = v8;
    *(_OWORD *)(v4 + 200) = v9;
    *(_OWORD *)(v4 + 168) = v7;
  }
  return (SBSystemApertureViewControllerRotationTransitionContext *)v4;
}

- (CGAffineTransform)_affineTransform
{
  long long v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

@end