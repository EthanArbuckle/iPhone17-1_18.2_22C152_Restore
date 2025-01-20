@interface STSDetailTransitionAnimator
- (BOOL)presenting;
- (CGRect)presentedFrame;
- (CGRect)sourceFrame;
- (UIEdgeInsets)sourceInsets;
- (UIView)snapshotView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setPresentedFrame:(CGRect)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setSnapshotView:(id)a3;
- (void)setSourceFrame:(CGRect)a3;
- (void)setSourceInsets:(UIEdgeInsets)a3;
@end

@implementation STSDetailTransitionAnimator

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(STSDetailTransitionAnimator *)self presenting];
  double result = 0.4;
  if (!v3) {
    return 0.25;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v7 = [v6 view];
  [v7 setUserInteractionEnabled:0];

  v8 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v9 = [v8 view];
  [v9 setUserInteractionEnabled:0];

  if ([(STSDetailTransitionAnimator *)self presenting])
  {
    v10 = [v6 view];
    v11 = [v10 snapshotViewAfterScreenUpdates:1];

    v12 = [MEMORY[0x263F824D8] effectWithStyle:2];
    v13 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v12];
    [v11 frame];
    objc_msgSend(v13, "setFrame:");
    [v11 addSubview:v13];
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x263F82E00]);
    [v4 finalFrameForViewController:v8];
    v11 = objc_msgSend(v14, "initWithFrame:");
  }
  [v5 addSubview:v11];
  v15 = [(STSDetailTransitionAnimator *)self snapshotView];
  [v5 addSubview:v15];

  BOOL v16 = [(STSDetailTransitionAnimator *)self presenting];
  v17 = [(STSDetailTransitionAnimator *)self snapshotView];
  if (v16)
  {
    [(STSDetailTransitionAnimator *)self sourceFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(STSDetailTransitionAnimator *)self sourceInsets];
    objc_msgSend(v17, "setFrame:", v19 + v29, v21 + v26, v23 - (v29 + v27), v25 - (v26 + v28));

    v30 = (void *)MEMORY[0x263F82E00];
    [(STSDetailTransitionAnimator *)self transitionDuration:v4];
    double v32 = v31;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke;
    v62[3] = &unk_264A053F0;
    v62[4] = self;
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_2;
    v55[3] = &unk_264A05720;
    v56 = v6;
    id v57 = v8;
    id v58 = v4;
    id v59 = v5;
    v60 = self;
    id v61 = v11;
    id v33 = v4;
    id v34 = v8;
    id v35 = v6;
    [v30 animateWithDuration:0 delay:v62 usingSpringWithDamping:v55 initialSpringVelocity:v32 options:0.0 animations:0.7 completion:0.0];

    v36 = v56;
  }
  else
  {
    [(STSDetailTransitionAnimator *)self presentedFrame];
    objc_msgSend(v17, "setFrame:");

    v37 = (void *)MEMORY[0x263F82E00];
    [(STSDetailTransitionAnimator *)self transitionDuration:v4];
    double v39 = v38;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_3;
    v53[3] = &unk_264A053F0;
    id v40 = v6;
    id v54 = v40;
    [v37 animateWithDuration:v53 animations:v39];
    v41 = (void *)MEMORY[0x263F82E00];
    [(STSDetailTransitionAnimator *)self transitionDuration:v4];
    double v43 = v42;
    v51 = self;
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_4;
    v52[3] = &unk_264A053F0;
    v52[4] = self;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __49__STSDetailTransitionAnimator_animateTransition___block_invoke_5;
    v47[3] = &unk_264A05748;
    id v48 = v40;
    id v49 = v8;
    id v50 = v4;
    id v44 = v4;
    id v45 = v8;
    id v46 = v40;
    [v41 animateWithDuration:v52 animations:v47 completion:v43];

    v36 = v54;
  }
}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) snapshotView];
  [*(id *)(a1 + 32) presentedFrame];
  objc_msgSend(v2, "setFrame:");
}

uint64_t __49__STSDetailTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  BOOL v3 = [*(id *)(a1 + 40) view];
  [v3 setUserInteractionEnabled:1];

  id v4 = [*(id *)(a1 + 40) view];
  [*(id *)(a1 + 48) finalFrameForViewController:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setFrame:");

  v5 = *(void **)(a1 + 56);
  v6 = [*(id *)(a1 + 40) view];
  [v5 addSubview:v6];

  v7 = [*(id *)(a1 + 64) snapshotView];
  [v7 removeFromSuperview];

  [*(id *)(a1 + 72) removeFromSuperview];
  v8 = *(void **)(a1 + 48);

  return [v8 completeTransition:1];
}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void __49__STSDetailTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) snapshotView];
  [*(id *)(a1 + 32) sourceFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) sourceInsets];
  objc_msgSend(v14, "setFrame:", v3 + v13, v5 + v10, v7 - (v13 + v11), v9 - (v10 + v12));
}

uint64_t __49__STSDetailTransitionAnimator_animateTransition___block_invoke_5(id *a1)
{
  double v2 = [a1[4] view];
  [v2 setUserInteractionEnabled:1];

  double v3 = [a1[5] view];
  [v3 setUserInteractionEnabled:1];

  double v4 = [a1[4] view];
  [a1[6] finalFrameForViewController:a1[4]];
  objc_msgSend(v4, "setFrame:");

  double v5 = [a1[7] snapshotView];
  [v5 removeFromSuperview];

  id v6 = a1[6];

  return [v6 completeTransition:1];
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (CGRect)sourceFrame
{
  double x = self->_sourceFrame.origin.x;
  double y = self->_sourceFrame.origin.y;
  double width = self->_sourceFrame.size.width;
  double height = self->_sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (UIEdgeInsets)sourceInsets
{
  double top = self->_sourceInsets.top;
  double left = self->_sourceInsets.left;
  double bottom = self->_sourceInsets.bottom;
  double right = self->_sourceInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSourceInsets:(UIEdgeInsets)a3
{
  self->_sourceInsets = a3;
}

- (CGRect)presentedFrame
{
  double x = self->_presentedFrame.origin.x;
  double y = self->_presentedFrame.origin.y;
  double width = self->_presentedFrame.size.width;
  double height = self->_presentedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentedFrame:(CGRect)a3
{
  self->_presentedFrame = a3;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
}

@end