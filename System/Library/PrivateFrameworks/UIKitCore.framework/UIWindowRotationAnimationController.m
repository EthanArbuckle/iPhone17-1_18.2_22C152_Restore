@interface UIWindowRotationAnimationController
@end

@implementation UIWindowRotationAnimationController

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

id __58___UIWindowRotationAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  v2 = [(id)UIApp keyWindow];
  v3 = [v2 firstResponder];

  v4 = [v3 _window];
  v5 = [*(id *)(a1 + 32) animations];
  v5[2]();

  if (dyld_program_sdk_at_least())
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_3;
    v12[3] = &unk_1E52D9F70;
    id v13 = *(id *)(a1 + 40);
    +[UIView animateWithDuration:0 delay:v12 options:0 animations:0.0 completion:0.0];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");
  }
  v6 = *(void **)(a1 + 48);
  if (v6 != v4)
  {
    v7 = [(id)UIApp keyWindow];

    if (v6 != v7) {
      goto LABEL_8;
    }
  }
  v8 = [(id)UIApp keyWindow];
  v9 = [v8 firstResponder];

  if (v3 != v9) {
    id v10 = v4;
  }
  else {
LABEL_8:
  }
    id v10 = 0;

  return v10;
}

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_5(uint64_t a1)
{
  return 0;
}

void __58___UIWindowRotationAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_2;
  v13[3] = &unk_1E52EAA78;
  v2 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v2;
  id v15 = *(id *)(a1 + 48);
  v3 = [*(id *)(a1 + 48) windowScene];
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v13, v3);

  if (!*(unsigned char *)(a1 + 88))
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
    v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"UIWindowNewOrientationUserInfoKey", 0);
    [v4 postNotificationName:@"UIWindowWillAnimateRotationNotification" object:v5 userInfo:v8];
  }
  if (*(unsigned char *)(a1 + 89) && *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    v9 = [*(id *)(a1 + 48) windowScene];
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = [*(id *)(a1 + 56) isAnimated];
    double v12 = 0.0;
    if (v11) {
      double v12 = *(double *)(a1 + 80);
    }
    [v9 _updateClientSettingsToInterfaceOrientation:v10 withAnimationDuration:v12];
  }
}

void __58___UIWindowRotationAnimationController_animateTransition___block_invoke_4(id *a1)
{
  [a1[4] setAnimations:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_5;
  v3[3] = &unk_1E52DE548;
  id v4 = a1[5];
  v2 = [a1[6] windowScene];
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v3, v2);

  [a1[5] _setAnimator:0];
  [a1[6] _setAnimationController:0];
}

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_6(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048621, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end