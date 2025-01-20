@interface UIView(NeutrinoAdditions)
+ (void)_recurseView:()NeutrinoAdditions filter:;
@end

@implementation UIView(NeutrinoAdditions)

+ (void)_recurseView:()NeutrinoAdditions filter:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v6 = a4;
  [a3 subviews];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
      if (v6[2](v6, v12)) {
        break;
      }
      objc_msgSend(a1, "_recurseView:filter:", v12, v6, (void)v13);
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end