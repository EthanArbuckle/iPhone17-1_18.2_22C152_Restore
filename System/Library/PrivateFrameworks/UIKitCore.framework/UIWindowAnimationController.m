@interface UIWindowAnimationController
@end

@implementation UIWindowAnimationController

void __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) snapshotView];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(v2, "setAutoresizingMask:", objc_msgSend(*(id *)(a1 + 40), "autoresizingMask"));
  v3 = [*(id *)(a1 + 48) view];
  [v3 insertSubview:v2 below:*(void *)(a1 + 40)];

  [*(id *)(a1 + 56) transitionDuration:*(void *)(a1 + 64)];
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 64) _completionCurve] << 16;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2;
  v15[3] = &unk_1E52DCB30;
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_3;
  v8[3] = &unk_1E52E9238;
  id v9 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 96);
  long long v12 = *(_OWORD *)(a1 + 80);
  long long v13 = v7;
  long long v14 = *(_OWORD *)(a1 + 112);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 64);
  +[UIView animateWithDuration:v6 delay:v15 options:v8 animations:v5 completion:0.0];
}

uint64_t __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  double v4 = [v3 viewControllerForKey:@"UITransitionContextToViewController"];
  [v3 finalFrameForViewController:v4];
  objc_msgSend(v2, "setFrame:");

  double v5 = (void *)a1[6];
  return [v5 setAlpha:0.0];
}

uint64_t __98___UIWindowAnimationController__performCrossfadeAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_3(uint64_t a1)
{
  +[UIWindow _synchronizeDrawing];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 88);
  [v2 setTransform:v7];
  [*(id *)(a1 + 40) setHidden:1];
  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(void **)(v4 + 560);
  *(void *)(v4 + 560) = 0;

  [*(id *)(a1 + 48) completeTransition:1];
  [*(id *)(a1 + 48) _setAnimator:0];
  return [*(id *)(a1 + 32) _setAnimationController:0];
}

uint64_t __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "__runAlongsideAnimations");
}

uint64_t __95___UIWindowAnimationController__performLayoutAnimationWithContext_windowGeometryUpdatingBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeTransition:1];
  [*(id *)(a1 + 32) _setAnimator:0];
  v2 = *(void **)(a1 + 40);
  return [v2 _setAnimationController:0];
}

uint64_t __50___UIWindowAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end