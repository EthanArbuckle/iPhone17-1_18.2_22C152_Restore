@interface UIView(SBFFluidBehaviorSettings)
+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings interactive:animations:completion:;
+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings mode:animations:completion:;
@end

@implementation UIView(SBFFluidBehaviorSettings)

+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings mode:animations:completion:
{
  id v19 = a3;
  v11 = a5;
  v12 = a6;
  switch(a4)
  {
    case 0:
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, a1, @"UIView+SBFFluidBehaviorSettings.m", 43, @"sb_animateWithSettings needs a explicit update mode, not SBAnimationUpdateModeUnspecified" object file lineNumber description];

      break;
    case 1:
      v11[2](v11);
      if (v12) {
        goto LABEL_6;
      }
      break;
    case 2:
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v11];
      if (v12) {
LABEL_6:
      }
        v12[2](v12, 1, 0);
      break;
    case 3:
      v14 = a1;
      id v15 = v19;
      uint64_t v16 = 0;
      goto LABEL_10;
    case 4:
      v17 = (void *)MEMORY[0x1E4F42FF0];
      v18 = _SBModifyFrameRateForAnimationBlockFromSettings(v11, v19);
      [v17 _animateByRetargetingAnimations:v18 completion:v12];

      break;
    case 5:
      v14 = a1;
      id v15 = v19;
      uint64_t v16 = 1;
LABEL_10:
      objc_msgSend(v14, "sb_animateWithSettings:interactive:animations:completion:", v15, v16, v11, v12);
      break;
    default:
      break;
  }
}

+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings interactive:animations:completion:
{
  id v15 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v15 behaviorType];
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11) {
      goto LABEL_6;
    }
    v14 = (void *)MEMORY[0x1E4F42FF0];
    v13 = _SBModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    [v14 _animateWithFrictionBounceAnimations:v13 completion:v10];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F42FF0];
    v13 = _SBModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    [v12 _animateUsingSpringBehavior:v15 tracking:a4 animations:v13 completion:v10];
  }

LABEL_6:
}

@end