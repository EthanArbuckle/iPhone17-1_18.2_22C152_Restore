@interface WKWebView(ScribbleUtilities)
- (WBSScribbleStyleSheet)safari_styleSheetForTargets:()ScribbleUtilities forceScrollable:;
- (double)safari_zoomScale;
@end

@implementation WKWebView(ScribbleUtilities)

- (double)safari_zoomScale
{
  v1 = [a1 scrollView];
  [v1 zoomScale];
  double v3 = v2;

  return v3;
}

- (WBSScribbleStyleSheet)safari_styleSheetForTargets:()ScribbleUtilities forceScrollable:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 URL];
  v8 = [v7 host];

  if ([v8 length])
  {
    int v25 = a4;
    v24 = a1;
    v26 = v8;
    v9 = objc_opt_new();
    v10 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v6;
    id obj = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        uint64_t v14 = 0;
        uint64_t v28 = v12;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "safari_isOutOfFlow") & 1) == 0)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            v16 = objc_msgSend(v15, "safari_selectorsForStyleSheetRules");
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v31 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                  if (([v10 containsObject:v21] & 1) == 0)
                  {
                    [v10 addObject:v21];
                    [v9 appendFormat:@"%@{display:none!important;}", v21];
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v18);
            }

            uint64_t v12 = v28;
          }
          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v12);
    }

    if (v25) {
      [v9 appendString:@"body,html{overflow:scroll!important;pointer-events:auto!important;}body{position:static!important;}"];
    }
    v8 = v26;
    if ([v9 length]) {
      v22 = [[WBSScribbleStyleSheet alloc] initWithSource:v9 webView:v24 host:v26];
    }
    else {
      v22 = 0;
    }
    id v6 = v27;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end