@interface _UITabBarTVTransitioner
- (BOOL)transitionFromRight;
- (UISpringTimingParameters)slideTimingParameters;
- (UIView)toViewXFlippedScreenShot;
- (UIViewControllerContextTransitioning)transitionContext;
- (_UITabBarTVTransitioner)init;
- (double)transitionDuration:(id)a3;
- (int64_t)transitionStyle;
- (void)animateTransition:(id)a3;
- (void)finishTransition;
- (void)setSlideTimingParameters:(id)a3;
- (void)setToViewXFlippedScreenShot:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionFromRight:(BOOL)a3;
- (void)setTransitionStyle:(int64_t)a3;
@end

@implementation _UITabBarTVTransitioner

- (_UITabBarTVTransitioner)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabBarTVTransitioner;
  result = [(_UITabBarTVTransitioner *)&v3 init];
  if (result) {
    result->_transitionStyle = 0;
  }
  return result;
}

- (void)finishTransition
{
  objc_super v3 = [(_UITabBarTVTransitioner *)self transitionContext];

  if (v3)
  {
    v4 = [(_UITabBarTVTransitioner *)self transitionContext];
    id v18 = [v4 viewForKey:@"UITransitionContextFromView"];

    v5 = [(_UITabBarTVTransitioner *)self transitionContext];
    v6 = [v5 viewForKey:@"UITransitionContextToView"];

    [v18 removeFromSuperview];
    [v18 setAlpha:1.0];
    BOOL fromViewOriginalShouldRasterize = self->_fromViewOriginalShouldRasterize;
    v8 = [v18 layer];
    [v8 setShouldRasterize:fromViewOriginalShouldRasterize];

    BOOL toViewOriginalShouldRasterize = self->_toViewOriginalShouldRasterize;
    v10 = [v6 layer];
    [v10 setShouldRasterize:toViewOriginalShouldRasterize];

    double fromViewLayerOriginalRasterizationScale = self->_fromViewLayerOriginalRasterizationScale;
    v12 = [v18 layer];
    [v12 setRasterizationScale:fromViewLayerOriginalRasterizationScale];

    double toViewLayerOriginalRasterizationScale = self->_toViewLayerOriginalRasterizationScale;
    v14 = [v6 layer];
    [v14 setRasterizationScale:toViewLayerOriginalRasterizationScale];

    v15 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];

    if (v15)
    {
      v16 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];
      [v16 removeFromSuperview];

      [(_UITabBarTVTransitioner *)self setToViewXFlippedScreenShot:0];
    }
    v17 = [(_UITabBarTVTransitioner *)self transitionContext];
    [v17 completeTransition:1];

    [(_UITabBarTVTransitioner *)self setTransitionContext:0];
  }
}

- (double)transitionDuration:(id)a3
{
  if (self->_transitionStyle != 1) {
    return 0.5;
  }
  objc_super v3 = [(_UITabBarTVTransitioner *)self slideTimingParameters];
  [v3 settlingDuration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 viewForKey:@"UITransitionContextFromView"];
  v6 = [v4 viewForKey:@"UITransitionContextToView"];
  v7 = [v4 containerView];
  int v8 = [v4 isAnimated];
  if (v6)
  {
    [v6 setAlpha:0.0];
    [v7 addSubview:v6];
  }
  if (v8)
  {
    v9 = [v5 layer];
    self->_BOOL fromViewOriginalShouldRasterize = [v9 shouldRasterize];

    v10 = [v5 layer];
    [v10 rasterizationScale];
    self->_double fromViewLayerOriginalRasterizationScale = v11;

    v12 = [v6 layer];
    self->_BOOL toViewOriginalShouldRasterize = [v12 shouldRasterize];

    v13 = [v6 layer];
    [v13 rasterizationScale];
    self->_double toViewLayerOriginalRasterizationScale = v14;

    int v15 = _AXSReduceMotionEnabled();
    if (self->_transitionStyle != 1 || v15)
    {
      v25 = [v5 layer];
      [v25 setShouldRasterize:0];

      v26 = [v6 layer];
      [v26 setShouldRasterize:0];

      [(_UITabBarTVTransitioner *)self setTransitionContext:v4];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_5;
      v81[3] = &unk_1E52D9F98;
      id v82 = v5;
      id v83 = v6;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_6;
      v80[3] = &unk_1E52DC3A0;
      v80[4] = self;
      +[UIView animateWithDuration:v81 animations:v80 completion:0.5];

      v27 = v82;
    }
    else
    {
      uint64_t v16 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];
      v77 = (void *)v16;
      if (v16)
      {
        [v4 finalFrameForViewController:v16];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
      }
      else
      {
        CGFloat v18 = *MEMORY[0x1E4F1DB28];
        CGFloat v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      BOOL v28 = [(_UITabBarTVTransitioner *)self transitionFromRight];
      v29 = [v6 snapshotViewAfterScreenUpdates:1];
      [(_UITabBarTVTransitioner *)self setToViewXFlippedScreenShot:v29];

      v30 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];

      if (v30)
      {
        double v78 = v24;
        double v31 = v22;
        double v32 = v20;
        double v33 = v18;
        CATransform3DMakeScale(&v98, -1.0, 1.0, 1.0);
        v34 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];
        v35 = [v34 layer];
        CATransform3D v97 = v98;
        [v35 setTransform:&v97];

        v36 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];
        [v36 frame];
        CGFloat v38 = v37;
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;

        CGFloat v45 = v38;
        double v46 = v40;
        double v47 = v42;
        double v48 = v44;
        if (v28)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v45);
          v99.origin.x = v38;
          v99.origin.y = v40;
          v99.size.width = v42;
          v99.size.height = v44;
          double MaxX = MinX - CGRectGetMaxX(v99);
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v45);
        }
        v51 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];
        objc_msgSend(v51, "setFrame:", MaxX, v40, v42, v44);

        v52 = [(_UITabBarTVTransitioner *)self toViewXFlippedScreenShot];
        [v6 addSubview:v52];

        CGFloat v18 = v33;
        CGFloat v20 = v32;
        CGFloat v22 = v31;
        CGFloat v24 = v78;
      }
      if (v28) {
        double v53 = 113.0;
      }
      else {
        double v53 = -113.0;
      }
      v100.origin.x = v18;
      v100.origin.y = v20;
      v100.size.width = v22;
      v100.size.height = v24;
      CGRect v101 = CGRectOffset(v100, v53, 0.0);
      objc_msgSend(v6, "setFrame:", v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
      v54 = [v5 layer];
      [v54 setShouldRasterize:1];

      v55 = [v5 layer];
      v56 = [v7 traitCollection];
      [v56 displayScale];
      objc_msgSend(v55, "setRasterizationScale:");

      v57 = [v6 layer];
      [v57 setShouldRasterize:1];

      v58 = [v6 layer];
      v59 = [v7 traitCollection];
      [v59 displayScale];
      objc_msgSend(v58, "setRasterizationScale:");

      LODWORD(v60) = 1051260355;
      LODWORD(v61) = 1059816735;
      LODWORD(v62) = 1.0;
      v76 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v60 :0.0 :v61 :v62];
      v79 = v7;
      v75 = [[UICubicTimingParameters alloc] initWithCustomCurve:v76];
      v74 = [[UIViewPropertyAnimator alloc] initWithDuration:v75 timingParameters:0.15];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke;
      v95[3] = &unk_1E52D9F70;
      id v63 = v5;
      id v96 = v63;
      [(UIViewPropertyAnimator *)v74 addAnimations:v95];
      v73 = [[UIViewPropertyAnimator alloc] initWithDuration:v75 timingParameters:0.37];
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_2;
      v93[3] = &unk_1E52D9F70;
      id v64 = v6;
      id v94 = v64;
      [(UIViewPropertyAnimator *)v73 addAnimations:v93];
      [(_UITabBarTVTransitioner *)self setTransitionContext:v4];
      v65 = [UIViewPropertyAnimator alloc];
      [(_UITabBarTVTransitioner *)self slideTimingParameters];
      v66 = v5;
      v68 = BOOL v67 = v28;
      [v68 settlingDuration];
      double v70 = v69;
      v71 = [(_UITabBarTVTransitioner *)self slideTimingParameters];
      v72 = [(UIViewPropertyAnimator *)v65 initWithDuration:v71 timingParameters:v70];

      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_3;
      v85[3] = &unk_1E52DF1E0;
      id v86 = v63;
      BOOL v92 = v67;
      double v5 = v66;
      id v87 = v64;
      CGFloat v88 = v18;
      CGFloat v89 = v20;
      CGFloat v90 = v22;
      CGFloat v91 = v24;
      [(UIViewPropertyAnimator *)v72 addAnimations:v85];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __45___UITabBarTVTransitioner_animateTransition___block_invoke_4;
      v84[3] = &unk_1E52DC698;
      v84[4] = self;
      [(UIViewPropertyAnimator *)v72 addCompletion:v84];
      [(UIViewPropertyAnimator *)v74 startAnimation];
      [(UIViewPropertyAnimator *)v73 startAnimation];
      [(UIViewPropertyAnimator *)v72 startAnimation];

      v7 = v79;
      v27 = v77;
    }
  }
  else
  {
    [v5 removeFromSuperview];
    [v6 setAlpha:1.0];
    [v4 completeTransition:1];
  }
}

- (UISpringTimingParameters)slideTimingParameters
{
  slideTimingParameters = self->_slideTimingParameters;
  if (!slideTimingParameters)
  {
    id v4 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 100.0, 30.0, 0.0, 0.0);
    double v5 = self->_slideTimingParameters;
    self->_slideTimingParameters = v4;

    slideTimingParameters = self->_slideTimingParameters;
  }
  return slideTimingParameters;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (BOOL)transitionFromRight
{
  return self->_transitionFromRight;
}

- (void)setTransitionFromRight:(BOOL)a3
{
  self->_transitionFromRight = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (void)setSlideTimingParameters:(id)a3
{
}

- (UIView)toViewXFlippedScreenShot
{
  return self->_toViewXFlippedScreenShot;
}

- (void)setToViewXFlippedScreenShot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewXFlippedScreenShot, 0);
  objc_storeStrong((id *)&self->_slideTimingParameters, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end