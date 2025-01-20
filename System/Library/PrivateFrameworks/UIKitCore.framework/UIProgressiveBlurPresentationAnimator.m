@interface UIProgressiveBlurPresentationAnimator
@end

@implementation UIProgressiveBlurPresentationAnimator

void __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 144)) {
    uint64_t v2 = 56;
  }
  else {
    uint64_t v2 = 72;
  }
  double v3 = 20.0;
  if (!*(unsigned char *)(a1 + 144)) {
    double v3 = 15.0;
  }
  double v4 = *(double *)(a1 + 64) * (v3 / *(double *)(a1 + v2));
  double v5 = *(double *)(a1 + 80);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_2;
  v16[3] = &unk_1E52E7948;
  uint64_t v6 = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  long long v18 = *(_OWORD *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 104);
  long long v20 = *(_OWORD *)(a1 + 120);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_3;
  v14[3] = &unk_1E52DC3A0;
  id v15 = *(id *)(a1 + 40);
  +[UIView _animateWithDuration:393248 delay:v6 options:v16 factory:v14 animations:v4 completion:v5];
  if (*(unsigned char *)(a1 + 144)) {
    uint64_t v7 = 56;
  }
  else {
    uint64_t v7 = 72;
  }
  double v8 = 15.0 / *(double *)(a1 + v7) * *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 80);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_4;
  v11[3] = &unk_1E52D9CD0;
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 136);
  +[UIView _animateWithDuration:393248 delay:v10 options:v11 factory:0 animations:v8 completion:v9];
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __60___UIProgressiveBlurPresentationAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

@end