@interface UIView(SBUISystemApertureAnimationParameters)
+ (void)SBUISA_animateWithSettings:()SBUISystemApertureAnimationParameters animations:completion:;
+ (void)SBUISA_performWithoutAnimationOrRetargeting:()SBUISystemApertureAnimationParameters;
@end

@implementation UIView(SBUISystemApertureAnimationParameters)

+ (void)SBUISA_animateWithSettings:()SBUISystemApertureAnimationParameters animations:completion:
{
  id v12 = a3;
  id v7 = a4;
  v8 = a5;
  if ([v12 isAnimated])
  {
    int v9 = [v12 isRetargeted];
    v10 = (void *)MEMORY[0x1E4F42FF0];
    if (v9)
    {
      [MEMORY[0x1E4F42FF0] _animateByRetargetingAnimations:v7 completion:v8];
    }
    else
    {
      v11 = [v12 fluidBehaviorSettings];
      objc_msgSend(v10, "_animateUsingSpringBehavior:tracking:animations:completion:", v11, objc_msgSend(v12, "tracking"), v7, v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F42FF0], "SBUISA_performWithoutAnimationOrRetargeting:", v7);
    if (v8) {
      v8[2](v8, 1, 0);
    }
  }
}

+ (void)SBUISA_performWithoutAnimationOrRetargeting:()SBUISystemApertureAnimationParameters
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__UIView_SBUISystemApertureAnimationParameters__SBUISA_performWithoutAnimationOrRetargeting___block_invoke;
  v6[3] = &unk_1E5CCC698;
  id v7 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:v6];
}

@end