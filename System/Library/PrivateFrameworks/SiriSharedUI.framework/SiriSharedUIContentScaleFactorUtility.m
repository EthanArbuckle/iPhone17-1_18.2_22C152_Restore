@interface SiriSharedUIContentScaleFactorUtility
+ (void)siriSharedUIApplyContentScale:(double)a3 toLabel:(id)a4;
+ (void)siriSharedUIApplyContentScale:(double)a3 toView:(id)a4;
@end

@implementation SiriSharedUIContentScaleFactorUtility

+ (void)siriSharedUIApplyContentScale:(double)a3 toView:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    [(id)objc_opt_class() siriSharedUIApplyContentScale:v6 toLabel:a3];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = objc_msgSend(v5, "subviews", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(id)objc_opt_class() siriSharedUIApplyContentScale:*(void *)(*((void *)&v12 + 1) + 8 * v11++) toView:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)siriSharedUIApplyContentScale:(double)a3 toLabel:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  [v5 setContentScaleFactor:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = objc_msgSend(v5, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8 * v10);
        [(id)objc_opt_class() siriSharedUIApplyContentScale:v11 toLabel:a3];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

@end