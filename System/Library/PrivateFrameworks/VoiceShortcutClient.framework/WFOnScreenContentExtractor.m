@interface WFOnScreenContentExtractor
- (CGRect)applicationFrame;
- (CGRect)applicationFrameForScene:(id)a3;
- (id)activityItemsConfigurationFromScene:(id)a3;
- (id)nodeWithContentCollection:(id)a3 file:(id)a4 linkPresentationMetadata:(id)a5;
- (id)responseWithError:(id)a3;
- (int64_t)applicationLevel;
- (void)handleAction:(id)a3 completionHandler:(id)a4;
- (void)loadActivityItemsConfigurationItemsForScene:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5;
- (void)setApplicationFrame:(CGRect)a3;
- (void)setApplicationLevel:(int64_t)a3;
@end

@implementation WFOnScreenContentExtractor

- (void)setApplicationLevel:(int64_t)a3
{
  self->_applicationLevel = a3;
}

- (int64_t)applicationLevel
{
  return self->_applicationLevel;
}

- (void)setApplicationFrame:(CGRect)a3
{
  self->_applicationFrame = a3;
}

- (CGRect)applicationFrame
{
  double x = self->_applicationFrame.origin.x;
  double y = self->_applicationFrame.origin.y;
  double width = self->_applicationFrame.size.width;
  double height = self->_applicationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)nodeWithContentCollection:(id)a3 file:(id)a4 linkPresentationMetadata:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 bundleIdentifier];

  v13 = [v8 items];
  v14 = [v13 firstObject];

  v15 = [v8 items];
  unint64_t v16 = [v15 count];

  if (v16 >= 2)
  {
    v42 = [v14 name];
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v18 = [v8 items];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v40 = v10;
      id v41 = v9;
      uint64_t v21 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          getWFStringContentItemClass();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v17 = 0;
            goto LABEL_12;
          }
          v24 = [v23 string];
          [v17 appendString:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v20) {
          continue;
        }
        break;
      }
LABEL_12:
      id v10 = v40;
      id v9 = v41;
    }

    if ([v17 length])
    {
      id WFStringContentItemClass = getWFStringContentItemClass();
      v26 = (void *)[v17 copy];
      uint64_t v27 = [WFStringContentItemClass itemWithObject:v26 named:v42];

      v14 = (void *)v27;
    }
  }
  v28 = [WFOnScreenContentNode alloc];
  [(WFOnScreenContentExtractor *)self applicationFrame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFOnScreenContentExtractor applicationLevel](self, "applicationLevel"));
  v38 = [(WFOnScreenContentNode *)v28 initWithContentItem:v14, v9, v12, v37, @"UIActivityItemsConfiguration", v10, v30, v32, v34, v36 file applicationBundleIdentifier applicationFrame applicationLevel source linkPresentationMetadata];

  return v38;
}

- (id)responseWithError:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F30468];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithNode:0 error:v4];

  return v5;
}

- (id)activityItemsConfigurationFromScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(v3, "windows", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 isKeyWindow])
        {
          id v11 = v10;

          v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  uint64_t v12 = [v7 _focusResponder];
  if (v12)
  {
    v13 = (void *)v12;
    while (1)
    {
      v14 = [v13 activityItemsConfiguration];

      if (v14) {
        break;
      }
      v15 = [v13 nextResponder];

      if (!v15) {
        goto LABEL_20;
      }
      v15 = [v13 nextResponder];

      v13 = v15;
      if (!v15) {
        goto LABEL_21;
      }
    }
    v15 = [v13 activityItemsConfiguration];
LABEL_20:
  }
  else
  {
    v15 = 0;
  }
LABEL_21:

  return v15;
}

- (void)loadActivityItemsConfigurationItemsForScene:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFOnScreenContentExtractor *)self activityItemsConfigurationFromScene:v8];
  uint64_t v12 = [v11 itemProvidersForActivityItemsConfiguration];
  if (v12)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__18591;
    v19[4] = __Block_byref_object_dispose__18592;
    v13 = [v9 supportedItemClasses];
    id v20 = (id)[v13 copy];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke;
    v14[3] = &unk_1E60794B0;
    long long v18 = v19;
    id v15 = v9;
    id v16 = v11;
    long long v17 = self;
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v14, v10);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  id v8 = (void *)getWFContentItemClass_softClass_18594;
  uint64_t v41 = getWFContentItemClass_softClass_18594;
  if (!getWFContentItemClass_softClass_18594)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __getWFContentItemClass_block_invoke_18595;
    v37[3] = &unk_1E6079C28;
    v37[4] = &v38;
    __getWFContentItemClass_block_invoke_18595((uint64_t)v37);
    id v8 = (void *)v39[3];
  }
  v25 = v7;
  id v9 = v8;
  _Block_object_dispose(&v38, 8);
  id v10 = [v9 itemWithObject:v6 named:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [v10 outputTypes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v34 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v15 string];
        char v17 = [v16 isEqualToString:@"public.rtf"];

        if (v17) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }

    if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:@"WFStringContentItem"])goto LABEL_16; {
    v42 = @"WFStringContentItem";
    }
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
LABEL_15:

LABEL_16:
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_2;
  v26[3] = &unk_1E6079488;
  uint64_t v20 = *(void *)(a1 + 56);
  id v31 = v25;
  uint64_t v32 = v20;
  id v27 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 48);
  id v28 = v21;
  uint64_t v29 = v22;
  id v30 = v10;
  id v23 = v10;
  id v24 = v25;
  [v23 preloadImportantItemsWithCompletionHandler:v26];
}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "if_compactMap:", &__block_literal_global_18601);
  id WFCoercionRequestClass = getWFCoercionRequestClass();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_4;
  v8[3] = &unk_1E6079460;
  id v13 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = [WFCoercionRequestClass requestForCoercingToContentClasses:v2 completionHandler:v8];
  [*(id *)(a1 + 56) performCoercion:v7];
}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 items];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id WFCoercionRequestClass = getWFCoercionRequestClass();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_5;
    v14[3] = &unk_1E6079438;
    id v15 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v16 = v11;
    uint64_t v17 = v12;
    id v18 = v6;
    id v19 = *(id *)(a1 + 64);
    id v13 = [WFCoercionRequestClass requestForCoercingToFileType:0 completionHandler:v14];
    [*(id *)(a1 + 56) performCoercion:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    id v8 = (void *)MEMORY[0x1E4F30420];
    uint64_t v9 = [v7 fileURL];
    id v10 = [v7 filename];
    id v11 = [v7 wfType];
    uint64_t v12 = [v11 string];
    id v13 = [v8 fileWithFileURL:v9 filename:v10 typeIdentifier:v12];

    if ([v7 deletesFileOnDeallocation]) {
      [v13 _setMarkedForDeletionOnDeallocation:1];
    }
    uint64_t v14 = [v7 fileURL];
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = [v7 fileURL];
      int v17 = [v16 isFileURL];

      if (v17)
      {
        id v18 = [v7 fileURL];
        id v19 = [v18 path];
        [v19 fileSystemRepresentation];
        uint64_t v20 = (const char *)sandbox_extension_issue_file();

        if (v20)
        {
          id v21 = *(void **)(a1 + 32);
          if (v21) {
            [v21 originatingProcessAuditToken];
          }
          else {
            memset(v32, 0, sizeof(v32));
          }
          [v13 _setAssociatedAuditToken:v32];
          uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v20 length:strlen(v20) + 1];
          id v23 = [v7 fileURL];
          MEMORY[0x1B3EC54C0](v23, v22);
        }
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v28 = 0;
    goto LABEL_19;
  }
  id v24 = *(void **)(a1 + 40);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v25 = (void *)getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr;
  uint64_t v41 = getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr;
  if (!getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    long long v35 = __getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_block_invoke;
    long long v36 = &unk_1E6079C28;
    v37 = &v38;
    v26 = UIKitLibrary();
    id v27 = dlsym(v26, "UIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata");
    *(void *)(v37[1] + 24) = v27;
    getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadataSymbolLoc_ptr = *(void *)(v37[1] + 24);
    v25 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (v25)
  {
    id v28 = [v24 activityItemsConfigurationMetadataForKey:*v25];
LABEL_19:
    uint64_t v29 = [*(id *)(a1 + 48) nodeWithContentCollection:*(void *)(a1 + 56) file:v13 linkPresentationMetadata:v28];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    return;
  }
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  id v31 = [NSString stringWithUTF8String:"UIActivityItemsConfigurationMetadataKey getUIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata(void)"];
  objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"WFOnScreenContentExtractor.m", 37, @"%s", dlerror());

  __break(1u);
}

Class __107__WFOnScreenContentExtractor_loadActivityItemsConfigurationItemsForScene_serviceOptions_completionHandler___block_invoke_3(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (CGRect)applicationFrameForScene:(id)a3
{
  id v3 = [a3 settings];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([v3 interfaceOrientation] == 1
    || [v3 interfaceOrientation] == 2
    || [v3 interfaceOrientation] != 4 && objc_msgSend(v3, "interfaceOrientation") != 3)
  {
    double v12 = v9;
    double v9 = v11;
  }
  else
  {
    double v12 = v11;
  }

  double v13 = v5;
  double v14 = v7;
  double v15 = v12;
  double v16 = v9;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)handleAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v28 = (void (**)(id, void *))a4;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2050000000;
  double v5 = (void *)getUIApplicationClass_softClass;
  uint64_t v50 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    uint64_t v39 = (uint64_t)__getUIApplicationClass_block_invoke;
    uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6079C28;
    uint64_t v41 = (void (*)(uint64_t))&v47;
    __getUIApplicationClass_block_invoke((uint64_t)&v37);
    double v5 = (void *)v48[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v47, 8);
  uint64_t v29 = [v6 sharedApplication];
  double v7 = [v29 connectedScenes];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (!v8)
  {

    uint64_t v33 = 0;
LABEL_23:
    id v27 = [(WFOnScreenContentExtractor *)self responseWithError:0];
    v28[2](v28, v27);

    double v9 = 0;
    goto LABEL_24;
  }
  uint64_t v33 = 0;
  double v9 = 0;
  uint64_t v10 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v44 != v10) {
        objc_enumerationMutation(obj);
      }
      double v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      uint64_t v47 = 0;
      uint64_t v48 = &v47;
      uint64_t v49 = 0x2050000000;
      double v13 = (void *)getUIWindowSceneClass_softClass;
      uint64_t v50 = getUIWindowSceneClass_softClass;
      if (!getUIWindowSceneClass_softClass)
      {
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        uint64_t v39 = (uint64_t)__getUIWindowSceneClass_block_invoke;
        uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6079C28;
        uint64_t v41 = (void (*)(uint64_t))&v47;
        __getUIWindowSceneClass_block_invoke((uint64_t)&v37);
        double v13 = (void *)v48[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v47, 8);
      if (objc_opt_isKindOfClass()) {
        double v15 = v12;
      }
      else {
        double v15 = 0;
      }
      id v16 = v15;
      int v17 = v16;
      if (v16)
      {
        id v18 = [v16 _FBSScene];
        id v19 = [v18 identifier];
        uint64_t v20 = [v32 sceneIdentifier];
        int v21 = [v19 isEqualToString:v20];

        if (v21)
        {
          id v22 = v17;

          id v23 = v18;
          uint64_t v33 = v23;
        }
        else
        {
          double v12 = v9;
        }

        double v9 = v12;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  }
  while (v8);

  if (!v9) {
    goto LABEL_23;
  }
  [(WFOnScreenContentExtractor *)self applicationFrameForScene:v33];
  -[WFOnScreenContentExtractor setApplicationFrame:](self, "setApplicationFrame:");
  id v24 = [v33 settings];
  [v24 level];
  [(WFOnScreenContentExtractor *)self setApplicationLevel:(uint64_t)v25];

  uint64_t v37 = 0;
  uint64_t v38 = (uint64_t)&v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__18591;
  uint64_t v41 = __Block_byref_object_dispose__18592;
  v42 = objc_alloc_init(WFOnScreenContentNode);
  v26 = [v32 serviceOptions];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__WFOnScreenContentExtractor_handleAction_completionHandler___block_invoke;
  v34[3] = &unk_1E60793F0;
  long long v36 = &v37;
  long long v35 = v28;
  [(WFOnScreenContentExtractor *)self loadActivityItemsConfigurationItemsForScene:v9 serviceOptions:v26 completionHandler:v34];

  _Block_object_dispose(&v37, 8);
LABEL_24:
}

void __61__WFOnScreenContentExtractor_handleAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ((unint64_t)[v11 count] >= 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addChildren:v11];
    goto LABEL_8;
  }
  if ([v11 count] == 1)
  {
    uint64_t v6 = [v11 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    if (v11) {
      goto LABEL_8;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }

LABEL_8:
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F30468]) initWithNode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end