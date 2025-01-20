@interface UIView(CALayer_PhotosUI)
- (id)_pu_referenceBasicAnimationForCurrentAnimation;
@end

@implementation UIView(CALayer_PhotosUI)

- (id)_pu_referenceBasicAnimationForCurrentAnimation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = [a1 layer];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(v1, "animationKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = [v1 animationForKey:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 beginTime];
        if (v8 == 0.0) {
          break;
        }
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v7 = 0;
  }

  return v7;
}

@end