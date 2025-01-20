@interface UIView(PGVibrancyEffects)
- (void)PG_recursivelyDisallowGroupBlending;
- (void)PG_removeVibrancyEffect;
- (void)PG_updateVibrancyEffectForTintColor;
@end

@implementation UIView(PGVibrancyEffects)

- (void)PG_updateVibrancyEffectForTintColor
{
  v2 = [a1 tintColor];
  int v3 = objc_msgSend(v2, "PG_wantsVibrancyEffect");

  if (v3)
  {
    v4 = [a1 layer];
    v5 = [v4 compositingFilter];
    uint64_t v6 = *MEMORY[0x1E4F3A2E8];
    char v7 = [v5 isEqualToString:*MEMORY[0x1E4F3A2E8]];

    if ((v7 & 1) == 0)
    {
      v8 = [a1 layer];
      [v8 setCompositingFilter:v6];

      objc_msgSend(a1, "PG_recursivelyDisallowGroupBlending");
    }
  }
  else
  {
    objc_msgSend(a1, "PG_removeVibrancyEffect");
  }
}

- (void)PG_removeVibrancyEffect
{
  v2 = [a1 layer];
  int v3 = [v2 compositingFilter];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F3A2E8]];

  if (v4)
  {
    id v5 = [a1 layer];
    [v5 setCompositingFilter:0];
  }
}

- (void)PG_recursivelyDisallowGroupBlending
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [a1 layer];
  [v2 setAllowsGroupBlending:0];

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v3 = objc_msgSend(a1, "subviews", 0);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "PG_recursivelyDisallowGroupBlending");
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end