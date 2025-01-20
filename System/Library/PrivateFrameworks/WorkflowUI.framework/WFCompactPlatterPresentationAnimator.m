@interface WFCompactPlatterPresentationAnimator
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)initForPresenting:(BOOL)a3;
- (void)_animateDismissalWithTransitionContext:(id)a3;
- (void)_animatePresentationWithTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation WFCompactPlatterPresentationAnimator

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)_animateDismissalWithTransitionContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 viewControllerForKey:*MEMORY[0x263F83C00]];
  v5 = [v4 presentationController];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  [v7 frameOfDismissedViewInContainerView];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  v16 = (void *)MEMORY[0x263F82E00];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke;
  v21[3] = &unk_2649CAFB8;
  id v22 = v4;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v13;
  uint64_t v26 = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke_2;
  v19[3] = &unk_2649CAFE0;
  id v20 = v3;
  id v17 = v3;
  id v18 = v4;
  [v16 _animateUsingSpringWithDampingRatio:0 response:v21 tracking:v19 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.998];
}

void __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) view];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke_2(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

- (void)_animatePresentationWithTransitionContext:(id)a3
{
  id v3 = a3;
  double v4 = [v3 viewControllerForKey:*MEMORY[0x263F83C10]];
  id v5 = [v4 presentationController];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v4 view];
  [v7 frameOfDismissedViewInContainerView];
  objc_msgSend(v8, "setFrame:");
  uint64_t v9 = [v3 containerView];
  [v9 addSubview:v8];

  [v7 frameOfPresentedViewInContainerView];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  id v18 = (void *)MEMORY[0x263F82E00];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke;
  v23[3] = &unk_2649CAFB8;
  id v24 = v8;
  uint64_t v25 = v11;
  uint64_t v26 = v13;
  uint64_t v27 = v15;
  uint64_t v28 = v17;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke_2;
  v21[3] = &unk_2649CAFE0;
  id v22 = v3;
  id v19 = v3;
  id v20 = v8;
  [v18 _animateUsingSpringWithDampingRatio:0 response:v23 tracking:v21 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.998];
}

uint64_t __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke_2(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([(WFCompactPlatterPresentationAnimator *)self isPresenting]) {
    [(WFCompactPlatterPresentationAnimator *)self _animatePresentationWithTransitionContext:v4];
  }
  else {
    [(WFCompactPlatterPresentationAnimator *)self _animateDismissalWithTransitionContext:v4];
  }
}

- (double)transitionDuration:(id)a3
{
  return 0.375;
}

- (id)initForPresenting:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterPresentationAnimator;
  id v4 = [(WFCompactPlatterPresentationAnimator *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_presenting = a3;
    v6 = v4;
  }

  return v5;
}

@end