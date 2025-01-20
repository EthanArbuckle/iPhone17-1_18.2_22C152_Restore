@interface UIView(SUPPT)
- (uint64_t)firstScrollViewDescendant;
- (void)_firstDescendantOfKind:()SUPPT;
@end

@implementation UIView(SUPPT)

- (void)_firstDescendantOfKind:()SUPPT
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)[a1 subviews];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if (objc_opt_isKindOfClass()) {
      return v9;
    }
    uint64_t v10 = [v9 _firstDescendantOfKind:a3];
    if (v10) {
      return (void *)v10;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v9 = 0;
      if (v6) {
        goto LABEL_3;
      }
      return v9;
    }
  }
}

- (uint64_t)firstScrollViewDescendant
{
  uint64_t v2 = objc_opt_class();

  return [a1 _firstDescendantOfKind:v2];
}

@end