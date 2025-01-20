@interface PKCompactNavigationContainerControllerPresentationAnimator
- (PKCompactNavigationContainerControllerPresentationAnimator)initWithPresenting:(BOOL)a3;
- (double)transitionDuration:(id)a3;
- (void)_updateWithTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation PKCompactNavigationContainerControllerPresentationAnimator

- (PKCompactNavigationContainerControllerPresentationAnimator)initWithPresenting:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKCompactNavigationContainerControllerPresentationAnimator;
  v4 = [(PKCompactNavigationContainerControllerPresentationAnimator *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_presenting = a3;
    v6 = v4;
  }

  return v5;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)_updateWithTransitionContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  uint64_t v6 = *MEMORY[0x1E4FB30B8];
  uint64_t v7 = *MEMORY[0x1E4FB30C8];
  if (self->_presenting) {
    uint64_t v8 = *MEMORY[0x1E4FB30B8];
  }
  else {
    uint64_t v8 = *MEMORY[0x1E4FB30C8];
  }
  v9 = [v5 viewControllerForKey:v8];
  uint64_t v10 = *MEMORY[0x1E4FB30C0];
  uint64_t v11 = *MEMORY[0x1E4FB30D0];
  if (self->_presenting) {
    uint64_t v12 = *MEMORY[0x1E4FB30C0];
  }
  else {
    uint64_t v12 = *MEMORY[0x1E4FB30D0];
  }
  v13 = [v5 viewForKey:v12];
  objc_storeWeak((id *)&self->_presentingVC, v9);
  objc_storeWeak((id *)&self->_presentingView, v13);
  if (self->_presenting) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = v6;
  }
  v15 = [v5 viewControllerForKey:v14];
  if (self->_presenting) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = v10;
  }
  v17 = [v5 viewForKey:v16];
  objc_storeWeak((id *)&self->_presentedVC, v15);
  objc_storeWeak((id *)&self->_presentedView, v17);
  v18 = [(UIViewControllerContextTransitioning *)self->_transitionContext containerView];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke;
  aBlock[3] = &unk_1E59D0F68;
  id v35 = v5;
  id v19 = v5;
  v20 = _Block_copy(aBlock);
  v21 = (void *)MEMORY[0x1E4FB1EB0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke_2;
  v27[3] = &unk_1E59DB910;
  id v28 = v13;
  id v29 = v9;
  id v30 = v17;
  id v31 = v15;
  v32 = self;
  id v33 = v20;
  id v22 = v15;
  id v23 = v17;
  id v24 = v9;
  id v25 = v20;
  id v26 = v13;
  [v21 performWithoutAnimation:v27];
  [v18 addSubview:v26];
  [v18 addSubview:v23];
}

double __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) finalFrameForViewController:v5];
  double x = v14.origin.x;
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  if (CGRectEqualToRect(v14, v16))
  {
    [*(id *)(a1 + 32) initialFrameForViewController:v5];
    double x = v15.origin.x;
    v17.origin.double x = v8;
    v17.origin.y = v9;
    v17.size.width = v10;
    v17.size.height = v11;
    if (CGRectEqualToRect(v15, v17))
    {
      [v6 frame];
      double x = v12;
    }
  }

  return x;
}

uint64_t __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  objc_msgSend(v2, "setFrame:");
  v3 = *(void **)(a1 + 48);
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 56) setPresentingNavigationController:*(unsigned char *)(*(void *)(a1 + 64) + 16) == 0];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v4 = *(void **)(a1 + 48);

  return [v4 layoutIfNeeded];
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(PKCompactNavigationContainerControllerPresentationAnimator *)self _updateWithTransitionContext:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
  id v6 = objc_loadWeakRetained((id *)&self->_presentedView);
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  id v12 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke;
  v13[3] = &unk_1E59CA8E8;
  id v14 = WeakRetained;
  CGRect v15 = self;
  id v16 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke_2;
  v11[3] = &unk_1E59CB6D8;
  id v8 = v4;
  id v9 = v6;
  id v10 = WeakRetained;
  [v7 _animateUsingDefaultTimingWithOptions:134 animations:v13 completion:v11];
}

uint64_t __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentingNavigationController:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16)];
  v2 = *(void **)(a1 + 48);

  return [v2 layoutIfNeeded];
}

uint64_t __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_destroyWeak((id *)&self->_presentingVC);

  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end