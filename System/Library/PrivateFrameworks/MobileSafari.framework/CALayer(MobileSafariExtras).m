@interface CALayer(MobileSafariExtras)
- (id)safari_presentationOrSelf;
- (void)safari_copyAnimationsFromLayer:()MobileSafariExtras applyingModifications:;
@end

@implementation CALayer(MobileSafariExtras)

- (id)safari_presentationOrSelf
{
  v2 = [a1 presentationLayer];
  v3 = v2;
  if (!v2) {
    v2 = a1;
  }
  id v4 = v2;

  return v4;
}

- (void)safari_copyAnimationsFromLayer:()MobileSafariExtras applyingModifications:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  v8 = [v6 animationKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v14 = [v6 animationForKey:v13];
        v15 = (void *)[v14 copy];
        if (v15)
        {
          if (v7) {
            v7[2](v7, v14, v15);
          }
          [a1 addAnimation:v15 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

@end