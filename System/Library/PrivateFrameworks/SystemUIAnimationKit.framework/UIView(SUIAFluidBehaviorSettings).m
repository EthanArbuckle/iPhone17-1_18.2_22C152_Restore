@interface UIView(SUIAFluidBehaviorSettings)
+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings interactive:animations:completion:;
+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings mode:animations:completion:;
- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:interactive:;
- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:mode:;
@end

@implementation UIView(SUIAFluidBehaviorSettings)

+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings interactive:animations:completion:
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  if ((unint64_t)[v13 behaviorType] <= 1)
  {
    v11 = (void *)MEMORY[0x263F82E00];
    v12 = _SUIAModifyFrameRateForAnimationBlockFromSettings(v9, v13);
    [v11 _animateUsingSpringBehavior:v13 tracking:a4 animations:v12 completion:v10];
  }
}

+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings mode:animations:completion:
{
  id v18 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (void (**)(void, void, void))v11;
  switch(a4)
  {
    case 0:
      if (v11) {
        (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
      }
      break;
    case 1:
      v10[2](v10);
      if (v12) {
        goto LABEL_7;
      }
      break;
    case 2:
      [MEMORY[0x263F82E00] _performWithoutRetargetingAnimations:v10];
      if (v12) {
LABEL_7:
      }
        v12[2](v12, 1, 0);
      break;
    case 3:
      id v13 = a1;
      id v14 = v18;
      uint64_t v15 = 0;
      goto LABEL_11;
    case 4:
      v16 = (void *)MEMORY[0x263F82E00];
      v17 = _SUIAModifyFrameRateForAnimationBlockFromSettings(v10, v18);
      [v16 _animateByRetargetingAnimations:v17 completion:v12];

      break;
    case 5:
      id v13 = a1;
      id v14 = v18;
      uint64_t v15 = 1;
LABEL_11:
      objc_msgSend(v13, "suia_animateWithSettings:interactive:animations:completion:", v14, v15, v10, v12);
      break;
    default:
      break;
  }
}

- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:mode:
{
  id v10 = a3;
  id v8 = a4;
  if (a5 == 5)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (a5 != 3) {
      goto LABEL_6;
    }
    uint64_t v9 = 0;
  }
  objc_msgSend(a1, "suia_replaceInProcessAnimationForKeyPath:settings:interactive:", v10, v8, v9);
LABEL_6:
}

- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:interactive:
{
  id v9 = a3;
  id v8 = a4;
  if (unint64_t)[v8 behaviorType] <= 1 && (objc_opt_respondsToSelector()) {
    [a1 _replaceInProcessAnimationForKey:v9 behavior:v8 interactive:a5];
  }
}

@end