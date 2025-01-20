@interface WBSApplicationManifestFetcher
+ (double)_longestEdgeForIcon:(id)a3;
+ (int64_t)_preferredPurposeForIcons:(id)a3;
+ (int64_t)_primaryPurposeForPurposes:(id)a3;
+ (void)downloadImagesForManifest:(id)a3 linkIconParameters:(id)a4 usingWebView:(id)a5 withCompletionHandler:(id)a6;
- (WBSApplicationManifestFetcher)initWithWebView:(id)a3;
- (void)getApplicationManifestWithCompletionHandler:(id)a3;
@end

@implementation WBSApplicationManifestFetcher

- (WBSApplicationManifestFetcher)initWithWebView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSApplicationManifestFetcher;
  v5 = [(WBSApplicationManifestFetcher *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)getApplicationManifestWithCompletionHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  int64_t state = self->_state;
  switch(state)
  {
    case 2:
      (*((void (**)(id, _WKApplicationManifest *))v4 + 2))(v4, self->_manifest);
      break;
    case 1:
      completionHandlers = self->_completionHandlers;
      v12 = (void *)MEMORY[0x1AD115160](v4);
      v13 = [(NSArray *)completionHandlers arrayByAddingObject:v12];
      v14 = self->_completionHandlers;
      self->_completionHandlers = v13;

      break;
    case 0:
      v7 = (void *)MEMORY[0x1AD115160](v4);
      v16[0] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      objc_super v9 = self->_completionHandlers;
      self->_completionHandlers = v8;

      self->_int64_t state = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E5E40A60;
      v15[4] = self;
      [WeakRetained _getApplicationManifestWithCompletionHandler:v15];

      break;
  }
}

void __77__WBSApplicationManifestFetcher_getApplicationManifestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  *(void *)(*(void *)(a1 + 32) + 32) = 2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

+ (void)downloadImagesForManifest:(id)a3 linkIconParameters:(id)a4 usingWebView:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = v13;
  if (v12)
  {
    dispatch_group_t v15 = dispatch_group_create();
    long long v16 = [v10 icons];
    uint64_t v17 = [a1 _preferredPurposeForIcons:v16];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke;
    v90[3] = &__block_descriptor_40_e36_B16__0___WKApplicationManifestIcon_8l;
    v90[4] = v17;
    uint64_t v18 = objc_msgSend(v16, "safari_filterObjectsUsingBlock:", v90);

    v63 = v11;
    if (![v18 count])
    {
      uint64_t v19 = [v10 icons];

      uint64_t v18 = (void *)v19;
    }
    v59 = v14;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2;
    v86[3] = &unk_1E5E40B48;
    dispatch_group_t group = v15;
    dispatch_group_t v87 = group;
    id v60 = v12;
    id v88 = v12;
    id v61 = v10;
    id v62 = v10;
    id v89 = v62;
    v20 = (void (**)(void, void, void, void))MEMORY[0x1AD115160](v86);
    v70 = [MEMORY[0x1E4F1CA48] array];
    v66 = [MEMORY[0x1E4F1CA48] array];
    v65 = [MEMORY[0x1E4F1CA48] array];
    v64 = [MEMORY[0x1E4F1CA48] array];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v18;
    uint64_t v21 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v83 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          v26 = [v25 purposes];
          uint64_t v27 = [v26 containsObject:&unk_1F0341418];

          v28 = [v25 src];
          ((void (**)(void, void *, void *, uint64_t))v20)[2](v20, v28, v70, v27);
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v22);
    }

    uint64_t v29 = [v62 startURL];
    v30 = [MEMORY[0x1E4F1CB10] URLWithString:@"/favicon.ico" relativeToURL:v29];
    v31 = [v30 absoluteURL];

    v32 = [MEMORY[0x1E4F1CB10] URLWithString:@"/apple-touch-icon.png" relativeToURL:v29];
    uint64_t v33 = [v32 absoluteURL];

    v57 = (void *)v29;
    v34 = [MEMORY[0x1E4F1CB10] URLWithString:@"/apple-touch-icon-precomposed.png" relativeToURL:v29];
    uint64_t v35 = [v34 absoluteURL];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v68 = v63;
    uint64_t v36 = [v68 countByEnumeratingWithState:&v78 objects:v91 count:16];
    v67 = (void *)v35;
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          v40 = (void *)v33;
          v41 = v31;
          if (*(void *)v79 != v38) {
            objc_enumerationMutation(v68);
          }
          v42 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          v43 = [v42 attributes];
          v44 = [v43 objectForKeyedSubscript:@"mask"];

          if (v44)
          {
            v31 = v41;
            uint64_t v33 = (uint64_t)v40;
            continue;
          }
          v45 = [v42 url];
          v46 = [v45 absoluteURL];

          uint64_t v47 = [v42 iconType];
          if (v47 == 2)
          {
            ((void (**)(void, void *, void *, void))v20)[2](v20, v46, v64, 0);
            v31 = v41;
            if ([v46 isEqual:v67])
            {

              v67 = 0;
            }
            uint64_t v33 = (uint64_t)v40;
            goto LABEL_31;
          }
          v31 = v41;
          if (v47 == 1)
          {
            uint64_t v33 = (uint64_t)v40;
            if ([v46 isEqual:v40])
            {

              uint64_t v33 = 0;
            }
            v48 = (void (*)(void, void *, void *, void))v20[2];
            v49 = v20;
            v50 = v46;
            v51 = v65;
            goto LABEL_27;
          }
          uint64_t v33 = (uint64_t)v40;
          if (!v47)
          {
            if ([v46 isEqual:v31])
            {

              v31 = 0;
            }
            v48 = (void (*)(void, void *, void *, void))v20[2];
            v49 = v20;
            v50 = v46;
            v51 = v66;
LABEL_27:
            v48(v49, v50, v51, 0);
          }
LABEL_31:
        }
        uint64_t v37 = [v68 countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v37);
    }

    ((void (**)(void, void *, void *, void))v20)[2](v20, v31, v66, 0);
    ((void (**)(void, uint64_t, void *, void))v20)[2](v20, v33, v65, 0);
    ((void (**)(void, void *, void *, void))v20)[2](v20, v67, v64, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_100;
    block[3] = &unk_1E5E40B70;
    id v72 = v70;
    id v73 = v62;
    id v74 = v66;
    id v75 = v65;
    id v76 = v64;
    long long v14 = v59;
    id v77 = v59;
    id v52 = v64;
    id v53 = v65;
    id v54 = v66;
    v55 = (void *)v33;
    id v56 = v70;
    dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

    id v12 = v60;
    id v10 = v61;
    id v11 = v63;
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v10);
  }
}

BOOL __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 purposes];
  id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  if ([v4 containsObject:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v3 purposes];
    if ([v7 count]) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = *(void *)(a1 + 32) == 1;
    }
  }
  return v6;
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a3;
  if (a2)
  {
    id v8 = *(NSObject **)(a1 + 32);
    id v9 = a2;
    dispatch_group_enter(v8);
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E5E40B20;
    id v11 = *(void **)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    char v16 = a4;
    id v14 = *(id *)(a1 + 48);
    id v15 = v7;
    [v11 _dataTaskWithRequest:v10 completionHandler:v12];
  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1;
  v15[4] = __Block_byref_object_dispose__1;
  id v16 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_78;
  v14[3] = &unk_1E5E40AA8;
  v14[4] = v15;
  [v4 setDidReceiveData:v14];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2_80;
  id v8 = &unk_1E5E40AF8;
  id v12 = v15;
  id v9 = *(id *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v4 setDidCompleteWithError:&v5];
  objc_msgSend(v3, "setDelegate:", v4, v5, v6, v7, v8);

  _Block_object_dispose(v15, 8);
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "appendData:");
  }
  else
  {
    uint64_t v5 = [a3 mutableCopy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_2_80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 || !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v5);
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3_82;
      block[3] = &unk_1E5E40AD0;
      char v11 = *(unsigned char *)(a1 + 64);
      id v7 = *(id *)(a1 + 40);
      id v8 = v4;
      id v9 = *(id *)(a1 + 48);
      id v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_3_82(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) themeColor];
    objc_msgSend(*(id *)(a1 + 40), "safari_setThemeColor:", v2);
  }
  [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v3);
}

void __113__WBSApplicationManifestFetcher_downloadImagesForManifest_linkIconParameters_usingWebView_withCompletionHandler___block_invoke_100(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_setIconKind:", @"Manifest");
    objc_msgSend(*(id *)(a1 + 40), "safari_setImages:", *(void *)(a1 + 32));
  }
  v2 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_largestSizedBitmapImageOrSVGFromImages:", *(void *)(a1 + 48));
  id v3 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_largestSizedBitmapImageOrSVGFromImages:", *(void *)(a1 + 56));
  id v4 = (id *)(a1 + 64);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_largestSizedBitmapImageOrSVGFromImages:", *(void *)(a1 + 64));
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "safari_isSVGImage") && !objc_msgSend(v3, "safari_isSVGImage"))
  {
    id v9 = v6;
    goto LABEL_10;
  }
  objc_msgSend(v6, "safari_longestEdgeInPixels");
  double v8 = v7;
  objc_msgSend(v3, "safari_longestEdgeInPixels");
  id v9 = v6;
  if (v8 <= v10)
  {
LABEL_7:
    id v4 = (id *)(a1 + 56);
    id v9 = v3;
    if (!v3)
    {
      id v11 = 0;
      id v12 = 0;
      id v29 = 0;
      goto LABEL_11;
    }
  }
LABEL_10:
  id v12 = @"Touch";
  id v29 = *v4;
  id v11 = v9;
LABEL_11:
  if ((objc_msgSend(v11, "safari_isSVGImage") & 1) == 0)
  {
    objc_msgSend(v11, "safari_longestEdgeInPixels");
    double v14 = v13;
    objc_msgSend(v2, "safari_longestEdgeInPixels");
    double v16 = v15;
    double v17 = 64.0;
    if (v16 <= 64.0) {
      objc_msgSend(v2, "safari_longestEdgeInPixels");
    }
    if (v14 < v17)
    {
      uint64_t v18 = @"Favicon";

      id v19 = *(id *)(a1 + 48);
      id v20 = v2;

      id v11 = v20;
      id v12 = v18;
      id v29 = v19;
    }
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_largestSizedBitmapImageOrSVGFromImages:", *(void *)(a1 + 32));
  objc_msgSend(v21, "safari_longestEdgeInPixels");
  double v23 = v22;
  objc_msgSend(v11, "safari_longestEdgeInPixels");
  double v25 = v24;
  uint64_t v26 = objc_msgSend(v11, "safari_transparencyAnalysisResult");
  uint64_t v27 = objc_msgSend(v21, "safari_themeColor");
  if (v27)
  {
  }
  else if (objc_msgSend(v21, "safari_transparencyAnalysisResult") == 2 && v26 != 2)
  {
    double v28 = 128.0;
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  double v28 = v23 * 0.7;
  if (!v11) {
    goto LABEL_24;
  }
LABEL_19:
  if (!v21 || fabs(v25 + -512.0) <= 2.22044605e-16 || (objc_msgSend(v21, "safari_isSVGImage") & 1) == 0 && v25 >= v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_setIconKind:", v12);
    objc_msgSend(*(id *)(a1 + 40), "safari_setImages:", v29);
  }
LABEL_24:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

+ (double)_longestEdgeForIcon:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a3, "sizes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) floatValue];
        double v10 = v9;
        if (v7 < v10) {
          double v7 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (int64_t)_preferredPurposeForIcons:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    int64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [a1 _longestEdgeForIcon:v11];
        if (v12 >= v8)
        {
          double v13 = v12;
          long long v14 = [v11 purposes];
          uint64_t v15 = [a1 _primaryPurposeForPurposes:v14];

          if (v13 != v8 || v15 >= v9)
          {
            double v8 = v13;
            int64_t v9 = v15;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

+ (int64_t)_primaryPurposeForPurposes:(id)a3
{
  id v3 = a3;
  if ([v3 containsObject:&unk_1F0341430])
  {
    int64_t v4 = 4;
  }
  else if ([v3 containsObject:&unk_1F0341418])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end