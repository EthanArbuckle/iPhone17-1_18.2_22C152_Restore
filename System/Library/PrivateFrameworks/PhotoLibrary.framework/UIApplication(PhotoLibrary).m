@interface UIApplication(PhotoLibrary)
- (void)pl_firstKeyWindow;
@end

@implementation UIApplication(PhotoLibrary)

- (void)pl_firstKeyWindow
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[a1 connectedScenes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 activationState])
        {
          v7 = (void *)[v6 windows];
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v15;
LABEL_10:
            uint64_t v11 = 0;
            while (1)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
              if ([v12 isKeyWindow]) {
                break;
              }
              if (v9 == ++v11)
              {
                uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
                if (v9) {
                  goto LABEL_10;
                }
                goto LABEL_18;
              }
            }
            if (v12) {
              return v12;
            }
          }
        }
LABEL_18:
        ;
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v3);
  }
  return 0;
}

@end