@interface PBFEditingZoomDownAnimationController
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation PBFEditingZoomDownAnimationController

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
  v43 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v5 = [v43 view];
  v6 = [v5 window];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v5 traitCollection];
  [v15 displayCornerRadius];
  double v17 = v16;

  v18 = [(PBFEditingZoomAnimationController *)self previewView];
  v19 = [(PBFEditingZoomAnimationController *)self buildDimmingView];
  v20 = [(PBFEditingZoomAnimationController *)self complicationsView];
  CGFloat rect_8 = v12;
  v21 = -[PBFEditingZoomAnimationController buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:](self, "buildZoomingViewWithPreviewView:previewFrame:editingView:complicationsView:", v18, v5, v20, v8, v10, v12, v14);
  [v21 _setContinuousCornerRadius:v17];
  v22 = [v4 containerView];
  [v22 addSubview:v19];
  [v22 addSubview:v21];
  [v22 bounds];
  objc_msgSend(v19, "setFrame:");
  CGFloat v23 = v10;
  objc_msgSend(v21, "setFrame:", v8, v10, v12, v14);
  [v21 bounds];
  objc_msgSend(v5, "setFrame:");
  [(PBFEditingZoomAnimationController *)self previewFrame];
  CGFloat x = v59.origin.x;
  CGFloat y = v59.origin.y;
  CGFloat width = v59.size.width;
  CGFloat height = v59.size.height;
  CGFloat rect_16 = v59.size.height;
  double v28 = CGRectGetWidth(v59);
  v60.origin.CGFloat x = v8;
  v60.origin.CGFloat y = v23;
  v60.size.CGFloat width = rect_8;
  v60.size.CGFloat height = v14;
  double rect_24 = v28 / CGRectGetWidth(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double v29 = CGRectGetHeight(v61);
  v62.origin.CGFloat x = v8;
  v62.origin.CGFloat y = v23;
  v62.size.CGFloat width = rect_8;
  v62.size.CGFloat height = v14;
  double v30 = v29 / CGRectGetHeight(v62);
  [(PBFEditingZoomAnimationController *)self previewCornerRadius];
  uint64_t v32 = v31;
  [(PBFEditingZoomDownAnimationController *)self transitionDuration:v4];
  double v34 = v33;
  v35 = (void *)MEMORY[0x1E4FB1EB0];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke;
  v48[3] = &unk_1E6983610;
  id v49 = v21;
  CGFloat v52 = x;
  CGFloat v53 = y;
  CGFloat v54 = width;
  CGFloat v55 = rect_16;
  double v56 = rect_24;
  double v57 = v30;
  uint64_t v58 = v32;
  id v50 = v19;
  id v51 = v5;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke_2;
  v44[3] = &unk_1E6983638;
  id v45 = v50;
  id v46 = v49;
  id v47 = v4;
  id v36 = v4;
  id v37 = v49;
  id v38 = v50;
  id v39 = v5;
  [v35 animateWithDuration:0 delay:v48 usingSpringWithDamping:v44 initialSpringVelocity:v34 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  int v3 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
  [v3 setTransform:&v5];
  [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 104) / *(double *)(a1 + 96)];
  [*(id *)(a1 + 40) setAlpha:0.0];
  return [*(id *)(a1 + 48) setAlpha:0.0];
}

uint64_t __59__PBFEditingZoomDownAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;
  return [v2 completeTransition:v3];
}

@end