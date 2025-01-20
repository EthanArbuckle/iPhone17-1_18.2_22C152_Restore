@interface PBFEditingZoomUpAnimationController
- (BOOL)isAnimationFinished;
- (BOOL)isContentReady;
- (UIView)dimmingView;
- (UIView)zoomingView;
- (UIViewControllerContextTransitioning)transitionContext;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3;
- (void)finishTransitionIfPossible;
- (void)setAnimationFinished:(BOOL)a3;
- (void)setContentReady:(BOOL)a3;
- (void)setDimmingView:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setZoomingView:(id)a3;
@end

@implementation PBFEditingZoomUpAnimationController

- (double)transitionDuration:(id)a3
{
  int v3 = [a3 isAnimated];
  double result = 0.0;
  if (v3) {
    return 0.5;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    id v13 = v8;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    id v15 = v14;

    v16 = [v15 bottomViewController];

    uint64_t v17 = objc_opt_class();
    id v18 = v16;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    id v11 = v19;
  }
  v61 = [v5 view];
  v20 = [v8 view];
  v60 = [v61 window];
  v21 = [v61 traitCollection];
  [v21 displayCornerRadius];
  uint64_t v57 = v22;

  [v60 bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double rect = v29;
  [v11 setShowsContentWhenReady:1];
  [v11 addObserver:self];
  v58 = [(PBFEditingZoomAnimationController *)self previewView];
  v31 = [(PBFEditingZoomAnimationController *)self buildDimmingView];
  v32 = [(PBFEditingZoomAnimationController *)self complicationsView];
  -[PBFEditingZoomAnimationController buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:](self, "buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:", v58, v20, v32, v24, v26, v28, v30);
  v33 = v59 = v5;
  v34 = [v4 containerView];
  [v34 addSubview:v31];
  [v34 addSubview:v33];
  [v34 bounds];
  objc_msgSend(v31, "setFrame:");
  [v31 setAlpha:0.0];
  [(PBFEditingZoomAnimationController *)self previewFrame];
  CGFloat x = v74.origin.x;
  CGFloat y = v74.origin.y;
  CGFloat width = v74.size.width;
  CGFloat height = v74.size.height;
  double v39 = CGRectGetWidth(v74);
  v75.origin.CGFloat x = v24;
  v75.origin.CGFloat y = v26;
  v75.size.CGFloat width = v28;
  v75.size.CGFloat height = rect;
  sCGFloat x = v39 / CGRectGetWidth(v75);
  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = y;
  v76.size.CGFloat width = width;
  v76.size.CGFloat height = height;
  double v40 = CGRectGetHeight(v76);
  v77.origin.CGFloat x = v24;
  v77.origin.CGFloat y = v26;
  CGFloat v56 = v28;
  v77.size.CGFloat width = v28;
  v77.size.CGFloat height = rect;
  CGFloat v41 = v40 / CGRectGetHeight(v77);
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v28, rect);
  UIRectGetCenter();
  objc_msgSend(v33, "setCenter:");
  CGAffineTransformMakeScale(&v73, sx, v41);
  [v33 setTransform:&v73];
  [v33 bounds];
  objc_msgSend(v20, "setFrame:");
  [(PBFEditingZoomAnimationController *)self previewCornerRadius];
  [v33 _setContinuousCornerRadius:v42 / v41];
  [v32 bounds];
  double v44 = v43;
  double v46 = v45;
  v78.origin.CGFloat x = v24;
  v78.origin.CGFloat y = v26;
  v78.size.CGFloat width = v56;
  v78.size.CGFloat height = rect;
  CGFloat v47 = CGRectGetWidth(v78) / v44;
  v79.origin.CGFloat x = v24;
  v79.origin.CGFloat y = v26;
  v79.size.CGFloat width = v56;
  v79.size.CGFloat height = rect;
  CGFloat v48 = CGRectGetHeight(v79);
  CGAffineTransformMakeScale(&v72, v47, v48 / v46);
  [v32 setTransform:&v72];
  [v33 bounds];
  UIRectGetCenter();
  objc_msgSend(v32, "setCenter:");
  [(PBFEditingZoomUpAnimationController *)self setTransitionContext:v4];
  [(PBFEditingZoomUpAnimationController *)self setDimmingView:v31];
  [(PBFEditingZoomUpAnimationController *)self setZoomingView:v33];
  [(PBFEditingZoomUpAnimationController *)self transitionDuration:v4];
  double v50 = v49;
  v51 = v11;
  v52 = (void *)MEMORY[0x1E4FB1EB0];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke;
  v64[3] = &unk_1E69835C0;
  double v67 = v24;
  double v68 = v26;
  CGFloat v69 = v56;
  double v70 = rect;
  uint64_t v71 = v57;
  id v65 = v33;
  id v66 = v31;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke_2;
  v63[3] = &unk_1E69835E8;
  v63[4] = self;
  id v53 = v31;
  id v54 = v33;
  [v52 animateWithDuration:0 delay:v64 usingSpringWithDamping:v63 initialSpringVelocity:v50 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v6];
  id v4 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 80)];
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

uint64_t __57__PBFEditingZoomUpAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimationFinished:1];
  v2 = *(void **)(a1 + 32);
  return [v2 finishTransitionIfPossible];
}

- (void)finishTransitionIfPossible
{
  if ([(PBFEditingZoomUpAnimationController *)self isAnimationFinished]
    && [(PBFEditingZoomUpAnimationController *)self isContentReady])
  {
    id v8 = [(PBFEditingZoomUpAnimationController *)self transitionContext];
    long long v3 = [v8 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
    id v4 = [v3 view];
    v5 = [v8 containerView];
    v6 = [(PBFEditingZoomUpAnimationController *)self dimmingView];
    uint64_t v7 = [(PBFEditingZoomUpAnimationController *)self zoomingView];
    [v6 removeFromSuperview];
    [v7 removeFromSuperview];
    [v5 addSubview:v4];
    [v8 finalFrameForViewController:v3];
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v8, "completeTransition:", objc_msgSend(v8, "transitionWasCancelled") ^ 1);
  }
}

- (void)editingSceneViewControllerDidFinishShowingContent:(id)a3
{
  [(PBFEditingZoomUpAnimationController *)self setContentReady:1];
  [(PBFEditingZoomUpAnimationController *)self finishTransitionIfPossible];
}

- (BOOL)isContentReady
{
  return self->_contentReady;
}

- (void)setContentReady:(BOOL)a3
{
  self->_contentReadCGFloat y = a3;
}

- (BOOL)isAnimationFinished
{
  return self->_animationFinished;
}

- (void)setAnimationFinished:(BOOL)a3
{
  self->_animationFinished = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)zoomingView
{
  return self->_zoomingView;
}

- (void)setZoomingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomingView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end