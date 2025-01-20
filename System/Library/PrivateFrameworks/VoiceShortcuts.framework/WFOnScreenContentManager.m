@interface WFOnScreenContentManager
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (WFOnScreenContentManager)init;
- (id)visibleApplicationFetchCompletionHandler;
- (id)visibleApplicationsFromLayout:(id)a3;
- (os_unfair_lock_s)lock;
- (void)finishGettingVisibleApplicationsWithLayout:(id)a3;
- (void)getContentForLayoutElement:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5;
- (void)getNodeForGlobalUserActivityWithCompletionHandler:(id)a3;
- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4;
- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getVisibleApplicationsWithCompletionHandler:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setVisibleApplicationFetchCompletionHandler:(id)a3;
@end

@implementation WFOnScreenContentManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visibleApplicationFetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setVisibleApplicationFetchCompletionHandler:(id)a3
{
}

- (id)visibleApplicationFetchCompletionHandler
{
  return self->_visibleApplicationFetchCompletionHandler;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)getNodeForGlobalUserActivityWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB36C8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6541E18;
  id v7 = v3;
  id v5 = v3;
  [v4 currentUserActivityUUIDWithOptions:0 completionHandler:v6];
}

void __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E4FB36C8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E6541DF0;
    id v9 = *(id *)(a1 + 32);
    id v8 = v5;
    [v6 fetchUserActivityWithUUID:a2 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __78__WFOnScreenContentManager_getNodeForGlobalUserActivityWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_32;
  }
  id v7 = [v5 typeIdentifier];
  if ([v7 isEqualToString:@"com.apple.mobileslideshow.oneUp"]) {
    goto LABEL_5;
  }
  id v8 = [v5 typeIdentifier];
  if ([v8 isEqualToString:@"com.apple.Photos.oneUp"])
  {

LABEL_5:
    goto LABEL_6;
  }
  v22 = [v5 typeIdentifier];
  char v23 = [v22 isEqualToString:@"com.apple.screenshotservices.sirisharing"];

  if ((v23 & 1) == 0)
  {
    v24 = [v5 typeIdentifier];
    int v25 = [v24 isEqualToString:@"com.apple.Contacts.ViewingCard"];

    if (v25)
    {
      v26 = [v5 userInfo];
      v27 = [v26 objectForKey:@"contact-identifier"];

      if (v27)
      {
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x2050000000;
        v28 = (void *)getWFCNContactStoreClass_softClass;
        uint64_t v50 = getWFCNContactStoreClass_softClass;
        if (!getWFCNContactStoreClass_softClass)
        {
          uint64_t v42 = MEMORY[0x1E4F143A8];
          uint64_t v43 = 3221225472;
          v44 = __getWFCNContactStoreClass_block_invoke;
          v45 = &unk_1E6541E40;
          v46 = &v47;
          __getWFCNContactStoreClass_block_invoke((uint64_t)&v42);
          v28 = (void *)v48[3];
        }
        id v29 = v28;
        _Block_object_dispose(&v47, 8);
        v30 = objc_opt_new();
        v31 = [v30 contactWithIdentifier:v27];

        if (v31)
        {
          v14 = [getWFContentItemClass() itemWithObject:v31];
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }

      v32 = 0;
      v17 = 0;
    }
    else
    {
      v39 = [v5 typeIdentifier];
      int v40 = [v39 isEqualToString:@"com.apple.Messages"];

      if (v40)
      {
        v41 = [v5 userInfo];
        v32 = [v41 objectForKey:@"__kIMChatRegistryContinuityURLKey"];
      }
      else
      {
        v32 = 0;
      }
      v17 = 0;
      v14 = 0;
    }
    goto LABEL_24;
  }
LABEL_6:
  id v9 = [v5 userInfo];
  v10 = [v9 objectForKey:@"selectedUUIDs"];
  v11 = [v10 firstObject];

  if (v11)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2050000000;
    v12 = (void *)getWFPhotoMediaContentItemClass_softClass;
    uint64_t v50 = getWFPhotoMediaContentItemClass_softClass;
    if (!getWFPhotoMediaContentItemClass_softClass)
    {
      uint64_t v42 = MEMORY[0x1E4F143A8];
      uint64_t v43 = 3221225472;
      v44 = __getWFPhotoMediaContentItemClass_block_invoke;
      v45 = &unk_1E6541E40;
      v46 = &v47;
      __getWFPhotoMediaContentItemClass_block_invoke((uint64_t)&v42);
      v12 = (void *)v48[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v47, 8);
    v14 = [v13 itemWithAssetIdentifier:v11];
    v15 = [v14 asset];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 mainFileURL];

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E4F30420];
        v19 = [v16 mainFileURL];
        v20 = [v16 filename];
        v21 = [v16 uniformTypeIdentifier];
        v17 = [v18 fileWithFileURL:v19 filename:v20 typeIdentifier:v21];
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    v14 = 0;
  }

  v32 = 0;
LABEL_24:
  v33 = [v5 webpageURL];

  if (v33)
  {
    id WFContentItemClass = getWFContentItemClass();
    v35 = [v5 webpageURL];
    uint64_t v36 = [WFContentItemClass itemWithObject:v35];

    v14 = (void *)v36;
  }
  if (v14 || v17 || v32)
  {
    id v37 = objc_alloc(MEMORY[0x1E4FB4800]);
    v38 = (void *)[v37 initWithContentItem:v14 file:v17 applicationBundleIdentifier:*(void *)(a1 + 32) source:*MEMORY[0x1E4FB4D88]];
    [v38 setChatRegistryContinuityKey:v32];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_32:
}

- (id)visibleApplicationsFromLayout:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && ([v3 elements],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = [v4 elements];
    id v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_6806);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

id __58__WFOnScreenContentManager_visibleApplicationsFromLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isUIApplicationElement]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)finishGettingVisibleApplicationsWithLayout:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(WFOnScreenContentManager *)self layoutMonitor];
  [v4 invalidate];

  [(WFOnScreenContentManager *)self setLayoutMonitor:0];
  id v5 = [(WFOnScreenContentManager *)self visibleApplicationFetchCompletionHandler];

  if (v5)
  {
    uint64_t v6 = [(WFOnScreenContentManager *)self visibleApplicationFetchCompletionHandler];
    id v7 = [(WFOnScreenContentManager *)self visibleApplicationsFromLayout:v8];
    ((void (**)(void, void *, void))v6)[2](v6, v7, 0);

    [(WFOnScreenContentManager *)self setVisibleApplicationFetchCompletionHandler:0];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)getVisibleApplicationsWithCompletionHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(WFOnScreenContentManager *)self layoutMonitor];

  id v7 = [(WFOnScreenContentManager *)self visibleApplicationFetchCompletionHandler];

  os_unfair_lock_unlock(p_lock);
  if (v6 && v7) {
    [(WFOnScreenContentManager *)self finishGettingVisibleApplicationsWithLayout:0];
  }
  id v8 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__WFOnScreenContentManager_getVisibleApplicationsWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E6541DA8;
  v14[4] = self;
  [v8 setTransitionHandler:v14];
  [v8 setNeedsUserInteractivePriority:1];
  id v9 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v8];
  os_unfair_lock_lock(p_lock);
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v9;
  v11 = v9;

  v12 = (void *)[v5 copy];
  id visibleApplicationFetchCompletionHandler = self->_visibleApplicationFetchCompletionHandler;
  self->_id visibleApplicationFetchCompletionHandler = v12;

  os_unfair_lock_unlock(p_lock);
}

uint64_t __72__WFOnScreenContentManager_getVisibleApplicationsWithCompletionHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(result + 32), "finishGettingVisibleApplicationsWithLayout:");
  }
  return result;
}

- (void)getContentForLayoutElement:(id)a3 serviceOptions:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F30460];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [v10 identifier];
  id v13 = (void *)[v11 initWithSceneIdentifier:v12 serviceOptions:v9];

  id v14 = objc_alloc(MEMORY[0x1E4F302C0]);
  v15 = [v10 bundleIdentifier];

  v16 = (void *)[v14 initWithBundleIdentifier:v15 intentForwardingAction:v13];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__WFOnScreenContentManager_getContentForLayoutElement_serviceOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E6541D80;
  id v19 = v7;
  id v17 = v7;
  [v16 deliverIntentForwardingActionWithResponseHandler:v18];
}

void __88__WFOnScreenContentManager_getContentForLayoutElement_serviceOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v6 node];
    id v5 = [v6 error];
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
  }
  else
  {

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__WFOnScreenContentManager_getOnScreenContentWithOptions_completion___block_invoke;
  v8[3] = &unk_1E6541D58;
  id v9 = v6;
  id v7 = v6;
  [(WFOnScreenContentManager *)self getOnScreenContentWithOptions:a3 completionHandler:v8];
}

void __69__WFOnScreenContentManager_getOnScreenContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB47F8]);
    v4 = [v7 URL];
    id v5 = [v7 file];
    id v6 = (void *)[v3 initWithURL:v4 file:v5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E6541D30;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  [(WFOnScreenContentManager *)self getNodeForGlobalUserActivityWithCompletionHandler:v12];
}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6819;
  v19[4] = __Block_byref_object_dispose__6820;
  id v7 = v5;
  id v20 = v7;
  id v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_185;
  v12[3] = &unk_1E6541D08;
  id v17 = *(id *)(a1 + 56);
  v18 = v19;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v13 = v9;
  uint64_t v14 = v10;
  id v15 = v11;
  id v16 = *(id *)(a1 + 48);
  [v8 getVisibleApplicationsWithCompletionHandler:v12];

  _Block_object_dispose(v19, 8);
}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_185(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    v4 = [*(id *)(a1 + 32) applicationBundleIdentifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6541CB8;
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v14 = v4;
    uint64_t v15 = v5;
    id v16 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_3;
    v10[3] = &unk_1E6541CE0;
    long long v9 = *(_OWORD *)(a1 + 64);
    id v7 = (id)v9;
    long long v12 = v9;
    id v11 = *(id *)(a1 + 56);
    id v8 = v4;
    objc_msgSend(v3, "if_mapAsynchronously:completionHandler:", v13, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v27 = a2;
  id v6 = a4;
  if ([*(id *)(a1 + 32) length])
  {
    id v7 = [v27 bundleIdentifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      long long v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) chatRegistryContinuityKey];
      id v10 = objc_alloc(MEMORY[0x1E4FB4800]);
      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) contentItem];
      long long v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) file];
      id v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) applicationBundleIdentifier];
      [v27 frame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "level"));
      char v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) source];
      uint64_t v24 = objc_msgSend(v10, "initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:", v11, v12, v13, v22, v23, 0, v15, v17, v19, v21);
      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
      v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setChatRegistryContinuityKey:v9];
    }
  }
  [*(id *)(a1 + 40) getContentForLayoutElement:v27 serviceOptions:*(void *)(a1 + 48) completionHandler:v6];
}

void __76__WFOnScreenContentManager_getOnScreenContentWithOptions_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v12 = v3;
  if (v4)
  {
    id v5 = v3;
LABEL_5:
    [v4 addChildren:v5];
    goto LABEL_6;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB4800]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v5 = v12;
    goto LABEL_5;
  }
  if ([v12 count] == 1)
  {
    uint64_t v9 = [v12 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFOnScreenContentManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFOnScreenContentManager;
  id v2 = [(WFOnScreenContentManager *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

@end