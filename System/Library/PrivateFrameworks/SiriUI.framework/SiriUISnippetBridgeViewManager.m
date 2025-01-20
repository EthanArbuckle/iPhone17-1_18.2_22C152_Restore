@interface SiriUISnippetBridgeViewManager
+ (id)sharedInstance;
- (void)insertBridgeViewIfNecessaryForCell:(id)a3 controller:(id)a4 currentSnippet:(id)a5 previousSnippet:(id)a6 bridgeSize:(CGSize)a7;
- (void)removeBridgeViewsFromView:(id)a3;
@end

@implementation SiriUISnippetBridgeViewManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __48__SiriUISnippetBridgeViewManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SiriUISnippetBridgeViewManager);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)insertBridgeViewIfNecessaryForCell:(id)a3 controller:(id)a4 currentSnippet:(id)a5 previousSnippet:(id)a6 bridgeSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ((SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = -[SiriUISnippetBridgeView initWithFrame:]([SiriUISnippetBridgeView alloc], "initWithFrame:", 0.0, -height, width, height);
        v16 = objc_msgSend(MEMORY[0x263F1C550], "siriui_snippetBackgroundColor");
        [(SiriUISnippetBridgeView *)v15 setBackgroundColor:v16];

        v17 = +[SiriUIKeyline keylineWithKeylineType:2];
        v18 = [MEMORY[0x263F1C920] mainScreen];
        [v18 scale];
        objc_msgSend(v17, "setFrame:", 0.0, 0.0, width, 1.0 / v19);

        [(SiriUISnippetBridgeView *)v15 addSubview:v17];
        v20 = [v21 contentView];
        [v20 addSubview:v15];
        [v21 setShowBackgroundView:0];
        [v12 setManageBackgroundColor:1];
      }
    }
  }
}

- (void)removeBridgeViewsFromView:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 removeFromSuperview];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end