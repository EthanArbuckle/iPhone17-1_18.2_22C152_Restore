@interface UIView
@end

@implementation UIView

void __75__UIView_PXVideoOverlayButton__px_videoOverlayButtonSizeWithConfiguration___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)px_videoOverlayButtonSizeWithConfiguration__cachedSizes;
  px_videoOverlayButtonSizeWithConfiguration__cachedSizes = (uint64_t)v0;
}

uint64_t __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_videoOverlayButtonSize");
}

id __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "px_videoOverlayButtonWithStyle:", *(void *)(a1 + 40));
}

void __53__UIView_PhotosUICore__px_convertTransform_fromView___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a2;
  v6 = v5;
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a3 + 16) = v8;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v7 + 32);
  if (*(id *)(a1 + 32) == v5)
  {
    v10 = v5;
  }
  else
  {
    do
    {
      if (v6) {
        [v6 transform];
      }
      else {
        memset(&t1, 0, sizeof(t1));
      }
      long long v9 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v11.a = *(_OWORD *)a3;
      *(_OWORD *)&v11.c = v9;
      *(_OWORD *)&v11.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &v11);
      v10 = [v6 superview];

      v6 = v10;
    }
    while (v10 != *(void **)(a1 + 32));
  }
}

uint64_t __47__UIView_PhotosUICore__px_ancestorViewOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __35__UIView_PhotosUICore__px_rootView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 superview];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __100__UIView_PhotosUICore__px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

void __100__UIView_PhotosUICore__px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.330000013, 0.0, 0.200000003, 1.0);
  v1 = (void *)px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__timingParameters;
  px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__timingParameters = v0;
}

uint64_t __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

uint64_t __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_21()
{
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_22(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_23()
{
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_24(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_25()
{
}

void __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_26(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __134__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:*(void *)(a1 + 40) initialSpringVelocity:a2 options:a3 animations:*(double *)(a1 + 32) completion:a4];
}

uint64_t __142__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:*(void *)(a1 + 56) delay:a2 usingSpringWithDamping:a3 initialSpringVelocity:*(double *)(a1 + 32) options:*(double *)(a1 + 40) animations:*(double *)(a1 + 48) completion:a4];
}

@end