@interface CALayer(SUICCAUtilities)
- (__CFString)_suic_additiveAnimationKeyPrefixForKeyPath:()SUICCAUtilities;
- (id)_suic_addAdditiveAnimation:()SUICCAUtilities withKeyPath:;
- (id)_suic_nextAdditiveAnimationKeyWithKeyPath:()SUICCAUtilities;
- (uint64_t)_suic_addAdditiveAnimation:()SUICCAUtilities;
@end

@implementation CALayer(SUICCAUtilities)

- (__CFString)_suic_additiveAnimationKeyPrefixForKeyPath:()SUICCAUtilities
{
  id v3 = a3;
  v4 = @"com.apple.VoiceShorcutsUI.additive";
  if ([v3 length])
  {
    v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.VoiceShorcutsUI.additive", v3];
  }

  return v4;
}

- (id)_suic_nextAdditiveAnimationKeyWithKeyPath:()SUICCAUtilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, &_SUICAdditiveAnimationKeyPrefix);
  uint64_t v6 = [v5 unsignedIntegerValue];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [a1 animationKeys];
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
      if ([*(id *)(*((void *)&v17 + 1) + 8 * v11) hasPrefix:@"com.apple.VoiceShorcutsUI.additive"])break; {
      if (v9 == ++v11)
      }
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

  v12 = NSString;
  v13 = objc_msgSend(a1, "_suic_additiveAnimationKeyPrefixForKeyPath:", v4);
  v14 = [v12 stringWithFormat:@"%@.%lu", v13, v6];

  v15 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  objc_setAssociatedObject(a1, &_SUICAdditiveAnimationKeyPrefix, v15, (void *)0x303);

  return v14;
}

- (id)_suic_addAdditiveAnimation:()SUICCAUtilities withKeyPath:
{
  if (a3)
  {
    id v6 = a3;
    v7 = objc_msgSend(a1, "_suic_nextAdditiveAnimationKeyWithKeyPath:", a4);
    [a1 addAnimation:v6 forKey:v7];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_suic_addAdditiveAnimation:()SUICCAUtilities
{
  return objc_msgSend(a1, "_suic_addAdditiveAnimation:withKeyPath:", a3, 0);
}

@end