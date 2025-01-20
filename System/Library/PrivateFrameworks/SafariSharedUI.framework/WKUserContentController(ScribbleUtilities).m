@interface WKUserContentController(ScribbleUtilities)
- (void)safari_updateScribbleStyleSheetForWebView:()ScribbleUtilities targets:forceScrollable:;
@end

@implementation WKUserContentController(ScribbleUtilities)

- (void)safari_updateScribbleStyleSheetForWebView:()ScribbleUtilities targets:forceScrollable:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  v26 = v9;
  v25 = objc_msgSend(v8, "safari_styleSheetForTargets:forceScrollable:", v9, a5);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v11 = [a1 _userStyleSheets];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = [v16 webView];
          v18 = (void *)v17;
          if (v17) {
            BOOL v19 = v17 == (void)v8;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19) {
            [v10 addObject:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  if (v25) {
    [a1 _addUserStyleSheet:v25];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        [a1 _removeUserStyleSheet:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v22);
  }
}

@end