@interface PXTilingControllerCompositionInvalidationContext
+ (id)defaultAnimationOptionsForTilingController:(id)a3 withInvalidationContexts:(id)a4;
- (NSObject)animationOptions;
- (PXTilingController)originatingTilingController;
- (id)description;
- (void)setAnimationOptions:(id)a3;
- (void)setOriginatingTilingController:(id)a3;
@end

@implementation PXTilingControllerCompositionInvalidationContext

+ (id)defaultAnimationOptionsForTilingController:(id)a3 withInvalidationContexts:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "originatingTilingController", (void)v16);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v5)
        {
          uint64_t v13 = [v11 animationOptions];
          if (v13)
          {
            v14 = (void *)v13;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingTilingController, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
}

- (void)setOriginatingTilingController:(id)a3
{
}

- (PXTilingController)originatingTilingController
{
  return self->_originatingTilingController;
}

- (void)setAnimationOptions:(id)a3
{
}

- (NSObject)animationOptions
{
  return self->_animationOptions;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, animationOptions=%@", objc_opt_class(), self, self->_animationOptions];
}

@end