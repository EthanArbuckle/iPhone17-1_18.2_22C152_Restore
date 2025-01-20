@interface UIView(SBPIPVibrancyEffects)
- (void)SBPIP_recursivelyDisallowGroupBlending;
- (void)SBPIP_removeVibrancyEffect;
- (void)SBPIP_updateVibrancyEffectForTintColorWithFilter:()SBPIPVibrancyEffects;
@end

@implementation UIView(SBPIPVibrancyEffects)

- (void)SBPIP_updateVibrancyEffectForTintColorWithFilter:()SBPIPVibrancyEffects
{
  id v10 = a3;
  v4 = [a1 tintColor];
  int v5 = objc_msgSend(v4, "SBPIP_wantsVibrancyEffect");

  if (v10 && v5)
  {
    v6 = [a1 layer];
    v7 = [v6 compositingFilter];
    char v8 = [v7 isEqualToString:v10];

    if ((v8 & 1) == 0)
    {
      v9 = [a1 layer];
      [v9 setCompositingFilter:v10];

      objc_msgSend(a1, "SBPIP_recursivelyDisallowGroupBlending");
    }
  }
  else
  {
    objc_msgSend(a1, "SBPIP_removeVibrancyEffect");
  }
}

- (void)SBPIP_removeVibrancyEffect
{
  v2 = [a1 layer];
  v3 = [v2 compositingFilter];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F3A2E8]];

  if (v4)
  {
    id v5 = [a1 layer];
    [v5 setCompositingFilter:0];
  }
}

- (void)SBPIP_recursivelyDisallowGroupBlending
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [a1 layer];
  [v2 setAllowsGroupBlending:0];

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = objc_msgSend(a1, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "SBPIP_recursivelyDisallowGroupBlending");
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end