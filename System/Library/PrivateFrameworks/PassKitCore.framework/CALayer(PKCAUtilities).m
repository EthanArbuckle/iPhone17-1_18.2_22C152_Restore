@interface CALayer(PKCAUtilities)
- (__CFString)pkui_additiveAnimationKeyPrefixForKeyPath:()PKCAUtilities;
- (double)pkui_animateToOpacity:()PKCAUtilities withCompletion:;
- (double)pkui_elapsedDurationForAnimation:()PKCAUtilities;
- (double)pkui_elapsedDurationForAnimationWithKey:()PKCAUtilities;
- (double)pkui_remainingDurationForAnimation:()PKCAUtilities;
- (double)pkui_remainingDurationForAnimationWithKey:()PKCAUtilities;
- (id)pkui_addAdditiveAnimation:()PKCAUtilities withKeyPath:;
- (uint64_t)_pkui_createNextAdditiveAnimationKeyWithKeyPath:()PKCAUtilities;
- (uint64_t)pkui_addAdditiveAnimation:()PKCAUtilities;
- (uint64_t)pkui_hasAdditiveAnimationForKeyPath:()PKCAUtilities;
@end

@implementation CALayer(PKCAUtilities)

- (double)pkui_animateToOpacity:()PKCAUtilities withCompletion:
{
  v6 = a4;
  double v7 = fmax(fmin(a2, 1.0), 0.0);
  [a1 opacity];
  double v9 = *(float *)&v8;
  if (v7 == *(float *)&v8)
  {
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else
  {
    *(float *)&double v8 = v7;
    [a1 setOpacity:v8];
    v10 = +[PKSpringAnimationFactory springAnimationWithKeyPath:@"opacity"];
    objc_msgSend(v10, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v9, v7);
    if (v6) {
      objc_msgSend(v10, "pkui_setCompletionHandler:", v6);
    }
    id v11 = (id)objc_msgSend(a1, "pkui_addAdditiveAnimation:", v10);
  }
  return v9;
}

- (id)pkui_addAdditiveAnimation:()PKCAUtilities withKeyPath:
{
  if (a3)
  {
    id v6 = a3;
    double v7 = objc_msgSend(a1, "_pkui_createNextAdditiveAnimationKeyWithKeyPath:", a4);
    [a1 addAnimation:v6 forKey:v7];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (uint64_t)_pkui_createNextAdditiveAnimationKeyWithKeyPath:()PKCAUtilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, &AdditiveAnimationKeyPrefix);
  uint64_t v6 = [v5 unsignedIntegerValue];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = [a1 animationKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      if ([*(id *)(*((void *)&v17 + 1) + 8 * v11) hasPrefix:@"com.apple.Passbook.additive"]) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v6 = 0;
  }

  id v12 = [NSString alloc];
  v13 = objc_msgSend(a1, "pkui_additiveAnimationKeyPrefixForKeyPath:", v4);
  uint64_t v14 = [v12 initWithFormat:@"%@.%lu", v13, v6];

  v15 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  objc_setAssociatedObject(a1, &AdditiveAnimationKeyPrefix, v15, (void *)0x303);

  return v14;
}

- (__CFString)pkui_additiveAnimationKeyPrefixForKeyPath:()PKCAUtilities
{
  id v3 = a3;
  id v4 = @"com.apple.Passbook.additive";
  if ([v3 length])
  {
    id v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.Passbook.additive", v3];
  }

  return v4;
}

- (uint64_t)pkui_addAdditiveAnimation:()PKCAUtilities
{
  return objc_msgSend(a1, "pkui_addAdditiveAnimation:withKeyPath:", a3, 0);
}

- (double)pkui_elapsedDurationForAnimationWithKey:()PKCAUtilities
{
  v2 = objc_msgSend(a1, "animationForKey:");
  objc_msgSend(a1, "pkui_elapsedDurationForAnimation:", v2);
  double v4 = v3;

  return v4;
}

- (double)pkui_elapsedDurationForAnimation:()PKCAUtilities
{
  if (!a3) {
    return 0.0;
  }
  id v4 = a3;
  [a1 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v6 = v5;
  [v4 beginTime];
  double v8 = v7;

  return v6 - v8;
}

- (double)pkui_remainingDurationForAnimationWithKey:()PKCAUtilities
{
  v2 = objc_msgSend(a1, "animationForKey:");
  objc_msgSend(a1, "pkui_remainingDurationForAnimation:", v2);
  double v4 = v3;

  return v4;
}

- (double)pkui_remainingDurationForAnimation:()PKCAUtilities
{
  if (!a3) {
    return 0.0;
  }
  id v4 = a3;
  [v4 duration];
  double v6 = v5;
  objc_msgSend(a1, "pkui_elapsedDurationForAnimation:", v4);
  double v8 = v7;

  return v6 - v8;
}

- (uint64_t)pkui_hasAdditiveAnimationForKeyPath:()PKCAUtilities
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "pkui_additiveAnimationKeyPrefixForKeyPath:");
  if (v2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    double v3 = objc_msgSend(a1, "animationKeys", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hasPrefix:v2])
          {
            uint64_t v4 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end