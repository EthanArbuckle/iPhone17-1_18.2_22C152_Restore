@interface _UIProgressiveBlurPresentationAnimator
+ (id)alphaAnimationFactory;
+ (id)transformAnimationFactory;
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)initForPresenting:(BOOL)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _UIProgressiveBlurPresentationAnimator

- (id)initForPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationAnimator;
  id result = [(_UIProgressiveBlurPresentationAnimator *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(_UIProgressiveBlurPresentationAnimator *)self isPresenting];
  double result = 0.7;
  if (!v3) {
    return 0.5;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIProgressiveBlurPresentationAnimator *)self isPresenting];
  v6 = [v4 viewForKey:@"UITransitionContextToView"];
  uint64_t v7 = [v4 viewForKey:@"UITransitionContextFromView"];
  v8 = (void *)v7;
  if (v5) {
    v9 = v6;
  }
  else {
    v9 = (void *)v7;
  }
  id v10 = v9;
  v11 = [v4 containerView];
  [v11 bounds];
  objc_msgSend(v10, "setFrame:");
  [v11 addSubview:v10];
  memset(&v40, 0, sizeof(v40));
  if (v5)
  {
    CGAffineTransformMakeScale(&v40, 0.9, 0.9);
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v39.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v39.c = v12;
    *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v13 = 0.0;
    double v14 = 1.0;
  }
  else
  {
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v40.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v40.c = v15;
    *(_OWORD *)&v40.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, 0.9, 0.9);
    double v13 = 1.0;
    double v14 = 0.0;
  }
  CGAffineTransform v38 = v40;
  [v10 setTransform:&v38];
  [v10 setAlpha:v13];
  [(_UIProgressiveBlurPresentationAnimator *)self transitionDuration:v4];
  double v17 = v16;
  if ([(_UIProgressiveBlurPresentationAnimator *)self isPresenting]) {
    double v18 = v17 * 0.4;
  }
  else {
    double v18 = 0.0;
  }
  v19 = [(id)objc_opt_class() alphaAnimationFactory];
  v20 = [(id)objc_opt_class() transformAnimationFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  CGAffineTransform v35 = v39;
  v27[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke;
  v27[3] = &unk_1E52E7970;
  BOOL v37 = v5;
  double v32 = v17;
  uint64_t v33 = 0x403E000000000000;
  id v28 = v20;
  id v29 = v10;
  id v30 = v19;
  uint64_t v31 = 0x4045000000000000;
  double v34 = v18;
  double v36 = v14;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_5;
  v25[3] = &unk_1E52DC3A0;
  id v26 = v4;
  id v21 = v4;
  id v22 = v19;
  id v23 = v10;
  id v24 = v20;
  +[UIView _animateWithDuration:393248 delay:v22 options:v27 factory:v25 animations:v17 completion:0.0];
}

+ (id)alphaAnimationFactory
{
  v2 = [[_UIProgressiveBlurPresentationAnimationFactory alloc] initWithCurve:0];
  return v2;
}

+ (id)transformAnimationFactory
{
  v2 = [[_UIProgressiveBlurPresentationAnimationFactory alloc] initWithCurve:1];
  return v2;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end