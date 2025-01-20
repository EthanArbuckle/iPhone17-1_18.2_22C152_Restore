@interface UIView(PKUIUtilities)
+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities animations:completion:;
+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities delay:animations:completion:;
+ (void)pkui_animateUsingFactory:()PKUIUtilities withDelay:options:animations:completion:;
+ (void)pkui_animateUsingOptions:()PKUIUtilities delay:velocity:animations:completion:;
- (BOOL)pkui_readableContentBoundsWithMargins:()PKUIUtilities;
- (id)pkui_translationAnimation;
- (id)pkui_viewControllerFromResponderChain;
- (uint64_t)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:;
- (uint64_t)pkui_setBoundsAndPositionFromFrame:()PKUIUtilities;
- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts;
- (void)addDefaultTransformSpringWithStartTime:()PKUIUtilities;
- (void)addDefaultTranslationSpringWithVelocity:()PKUIUtilities startTime:;
- (void)addTransformSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:;
- (void)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:velocity:timing:;
- (void)pkui_setExcludedFromScreenCapture:()PKUIUtilities andBroadcasting:;
- (void)pkui_shakeWithCompletion:()PKUIUtilities;
- (void)pkui_smallShakeWithCompletion:()PKUIUtilities;
@end

@implementation UIView(PKUIUtilities)

+ (void)pkui_animateUsingOptions:()PKUIUtilities delay:velocity:animations:completion:
{
  v12 = (void *)MEMORY[0x1E4F88168];
  id v13 = a7;
  id v14 = a6;
  id v15 = (id)[v12 createDefaultFactory];
  [v15 setVelocity:a3];
  objc_msgSend(a1, "pkui_animateUsingFactory:withDelay:options:animations:completion:", v15, a5, v14, v13, a2);
}

+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities delay:animations:completion:
{
  return objc_msgSend(a1, "pkui_animateUsingOptions:delay:velocity:animations:completion:", a3, 0.0);
}

+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities animations:completion:
{
  return objc_msgSend(a1, "pkui_animateUsingOptions:delay:animations:completion:", 0.0);
}

+ (void)pkui_animateUsingFactory:()PKUIUtilities withDelay:options:animations:completion:
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = v13;
  if (!v13) {
    v11 = (void *)[MEMORY[0x1E4F88168] createDefaultFactory];
  }
  v12 = (void *)MEMORY[0x1E4FB1EB0];
  id v14 = v11;
  [v11 duration];
  objc_msgSend(v12, "_animateWithDuration:delay:options:factory:animations:completion:", a4, v14, v9, v10);
}

- (void)pkui_shakeWithCompletion:()PKUIUtilities
{
  id v7 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_shakeAnimation");
  if (v7) {
    objc_msgSend(v4, "pkui_setCompletionHandler:", v7);
  }
  v5 = [a1 layer];
  id v6 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v4);
}

- (void)pkui_smallShakeWithCompletion:()PKUIUtilities
{
  id v7 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_smallShakeAnimation");
  if (v7) {
    objc_msgSend(v4, "pkui_setCompletionHandler:", v7);
  }
  v5 = [a1 layer];
  id v6 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v4);
}

- (void)addDefaultTranslationSpringWithVelocity:()PKUIUtilities startTime:
{
  PKMagicCurve();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addTranslationSpringWithMass:v6 stiffness:2.0 damping:300.0 startTime:400.0 velocity:a3 timing:a2];
}

- (uint64_t)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:
{
  return objc_msgSend(a1, "addTranslationSpringWithMass:stiffness:damping:startTime:velocity:timing:", a3, a4, a5, a6, 0.0);
}

- (void)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:velocity:timing:
{
  id v14 = (void *)MEMORY[0x1E4F39C90];
  id v15 = a8;
  id v19 = [v14 animationWithKeyPath:@"position"];
  [v19 setVelocity:a6];
  [v19 setRemovedOnCompletion:1];
  [v19 setMass:a2];
  [v19 setStiffness:a3];
  [v19 setDamping:a4];
  v16 = [a1 layer];
  v17 = [v16 valueForKey:@"position"];
  [v19 setFromValue:v17];

  [v19 setFillMode:*MEMORY[0x1E4F39F98]];
  [v19 setTimingFunction:v15];

  [v19 setBeginTime:a5];
  [v19 durationForEpsilon:0.00100000005];
  objc_msgSend(v19, "setDuration:");
  v18 = [a1 layer];
  [v18 addAnimation:v19 forKey:@"position"];
}

- (void)addDefaultTransformSpringWithStartTime:()PKUIUtilities
{
  PKMagicCurve();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addTransformSpringWithMass:v4 stiffness:2.0 damping:300.0 startTime:400.0 timing:a2];
}

- (void)addTransformSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:
{
  v12 = (void *)MEMORY[0x1E4F39C90];
  id v13 = a7;
  id v17 = [v12 animationWithKeyPath:@"transform"];
  [v17 setRemovedOnCompletion:1];
  [v17 setMass:a2];
  [v17 setStiffness:a3];
  [v17 setDamping:a4];
  id v14 = [a1 layer];
  id v15 = [v14 valueForKey:@"transform"];
  [v17 setFromValue:v15];

  [v17 setFillMode:*MEMORY[0x1E4F39F98]];
  [v17 setTimingFunction:v13];

  [v17 setBeginTime:a5];
  [v17 durationForEpsilon:0.00100000005];
  objc_msgSend(v17, "setDuration:");
  v16 = [a1 layer];
  [v16 addAnimation:v17 forKey:@"transform"];
}

- (id)pkui_translationAnimation
{
  v1 = [a1 layer];
  v2 = [v1 animationForKey:@"position"];

  return v2;
}

- (id)pkui_viewControllerFromResponderChain
{
  v2 = (void *)MEMORY[0x1A6224460]();
  id v3 = a1;
  while (1)
  {
    id v4 = v3;
    id v3 = [v3 nextResponder];

    if (!v3) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      break;
    }
  }

  return v3;
}

- (BOOL)pkui_readableContentBoundsWithMargins:()PKUIUtilities
{
  [a1 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = a3 + v12;
  CGFloat v14 = v8 + 0.0;
  CGFloat v16 = v15 - (a3 + a5);
  id v17 = [a1 readableContentGuide];
  [v17 layoutFrame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v11;
  v25.origin.x = v19;
  v25.origin.y = v9;
  v25.size.width = v21;
  v25.size.height = v11;
  CGRect v24 = CGRectIntersection(v23, v25);
  return CGRectIsNull(v24);
}

- (void)pkui_setExcludedFromScreenCapture:()PKUIUtilities andBroadcasting:
{
  id v10 = [a1 layer];
  int v6 = [v10 disableUpdateMask];
  int v7 = PKSensitiveFieldBroadcastingEnabled() ^ 1;
  if ((v7 & a4) != 0) {
    int v8 = 16;
  }
  else {
    int v8 = 0;
  }
  if ((v7 & a3) != 0) {
    int v9 = 2;
  }
  else {
    int v9 = 0;
  }
  [v10 setDisableUpdateMask:v8 | v6 & 0xFFFFFFED | v9];
}

- (uint64_t)pkui_setBoundsAndPositionFromFrame:()PKUIUtilities
{
  objc_msgSend(a1, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  double MidX = CGRectGetMidX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  double MidY = CGRectGetMidY(v15);

  return objc_msgSend(a1, "setCenter:", MidX, MidY);
}

- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts
{
  v1 = [a1 traitCollection];
  unint64_t v2 = [v1 userInterfaceIdiom];
  uint64_t v3 = (v2 < 7) & (0x62u >> v2);

  return v3;
}

@end