@interface UIView
@end

@implementation UIView

uint64_t __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeIfNeeded];
}

uint64_t __143__UIView_PUAnimationGroup__pu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:*(void *)(a1 + 56) delay:*(void *)(a1 + 32) options:a2 mass:*(double *)(a1 + 40) stiffness:*(double *)(a1 + 48) damping:*(double *)(a1 + 64) initialVelocity:*(double *)(a1 + 72) animations:*(double *)(a1 + 80) completion:*(double *)(a1 + 88)];
}

uint64_t __130__UIView_PUAnimationGroup__pu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:*(void *)(a1 + 56) initialSpringVelocity:*(void *)(a1 + 32) options:a2 animations:*(double *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

uint64_t __138__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:*(void *)(a1 + 72) delay:*(void *)(a1 + 32) usingSpringWithDamping:a2 initialSpringVelocity:*(double *)(a1 + 40) options:*(double *)(a1 + 48) animations:*(double *)(a1 + 56) completion:*(double *)(a1 + 64)];
}

uint64_t __93__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_options_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:*(void *)(a1 + 56) delay:*(void *)(a1 + 32) options:a2 animations:*(double *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E4F1DAB8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_20(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E4F1DAB8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_22(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v2, PUComposeTransform(MEMORY[0x1E4F1DAB8], (uint64_t)v2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72)));
}

void __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_24(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __158__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v12 = *(void *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 arrayWithObjects:&v12 count:1];
  objc_msgSend(v7, "pu_animateViews:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v11, *(void *)(a1 + 56), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), a4, v12, v13);
}

void __139__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v12 = *(void *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 arrayWithObjects:&v12 count:1];
  objc_msgSend(v7, "pu_animateViews:usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", v11, *(void *)(a1 + 48), v10, v9, *(double *)(a1 + 40), a4, v12, v13);
}

void __147__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v12 = *(void *)(a1 + 32);
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = a2;
  v11 = [v8 arrayWithObjects:&v12 count:1];
  objc_msgSend(v7, "pu_animateViews:withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v11, *(void *)(a1 + 64), v10, v9, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), a4, v12, v13);
}

uint64_t __75__UIView_PhotosUI___pu_animateWithDuration_enforced_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end