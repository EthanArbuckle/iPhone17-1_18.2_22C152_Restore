@interface UIContextMenuCommitAnimation
@end

@implementation UIContextMenuCommitAnimation

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  os_variant_has_internal_diagnostics();
  [*(id *)(a1 + 32) animationCount];
  if (![*(id *)(a1 + 32) animationCount])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
    id v3 = [*(id *)(a1 + 32) animationContainer];
    [v3 removeFromSuperview];
  }
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareSnapshots];
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_2(uint64_t a1)
{
  return +[UIView performWithoutAnimation:*(void *)(a1 + 32)];
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareAnimationViews];
}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) destination];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v31 = v10;
  double v32 = v6 + v10 * 0.5;
  double v33 = v4 + v8 * 0.5;
  v11 = [*(id *)(a1 + 32) sourceTransformView];
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v38.origin.x = v4;
  double v34 = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v13;
  v39.origin.y = v15;
  v39.size.width = v17;
  v39.size.height = v19;
  CGFloat v21 = Width / CGRectGetWidth(v39);
  v40.origin.x = v4;
  v40.origin.y = v6;
  v40.size.width = v8;
  v40.size.height = v31;
  CGRectGetHeight(v40);
  v41.origin.x = v13;
  v41.origin.y = v15;
  v41.size.width = v17;
  v41.size.height = v19;
  CGRectGetHeight(v41);
  CGAffineTransformMakeScale(&v37, v21, v21);
  v22 = [*(id *)(a1 + 32) sourceTransformView];
  CGAffineTransform v36 = v37;
  [v22 setTransform:&v36];

  v23 = [*(id *)(a1 + 32) sourceTransformView];
  objc_msgSend(v23, "setCenter:", v33, v32);

  v24 = [*(id *)(a1 + 32) destinationTransformView];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v35[0] = *MEMORY[0x1E4F1DAB8];
  v35[1] = v25;
  v35[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v24 setTransform:v35];

  v26 = [*(id *)(a1 + 32) destinationTransformView];
  objc_msgSend(v26, "setCenter:", v33, v32);

  [*(id *)(a1 + 32) destinationRadius];
  double v28 = v27;
  v29 = [*(id *)(a1 + 32) morphContainer];
  [v29 _setContinuousCornerRadius:v28];

  v30 = [*(id *)(a1 + 32) morphContainer];
  objc_msgSend(v30, "setBounds:", v34, v6, v8, v31);
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  uint64_t v2 = [*(id *)(a1 + 32) destination];
  [v2 center];
  double v4 = v3;
  double v6 = v5;
  double v7 = [*(id *)(a1 + 32) morphContainer];
  objc_msgSend(v7, "setCenter:", v4, v6);

  double v8 = [*(id *)(a1 + 32) destinationTransformView];
  [v8 setAlpha:1.0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_6;
  v11[3] = &unk_1E52D9F70;
  uint64_t v9 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  return +[UIView animateKeyframesWithDuration:v9 delay:v11 options:0 animations:0.0 completion:0.0];
}

uint64_t __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_6(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_7;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:v3 relativeDuration:0.3 animations:0.4];
}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sourceTransformView];
  [v1 setAlpha:0.0];
}

void __72___UIContextMenuCommitAnimation_animateWithAlongsideActions_completion___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) originalContentSnapshotView];
  [v1 setAlpha:0.0];
}

@end