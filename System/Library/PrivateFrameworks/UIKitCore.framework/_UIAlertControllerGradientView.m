@interface _UIAlertControllerGradientView
+ (Class)layerClass;
- (void)setGradientColors:(id)a3;
@end

@implementation _UIAlertControllerGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setGradientColors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v13 + 1) + 8 * v10);
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "CGColor", (void)v13));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = [(UIView *)self layer];
  [v12 setColors:v5];
}

@end