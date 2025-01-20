@interface _UISceneOpenItemProvidersBSActionsHandler
- (BOOL)currentAppSupportsOpenInPlace;
- (BOOL)currentAppSupportsReceivingMultipleItems;
- (id)URLContextsFetchedFromItemProviders:(id)a3 collectionIdentifier:(id)a4 contentOwner:(int64_t)a5 payload:(id)a6;
- (id)URLContextsFromOpenItemProvidersActions:(id)a3 payload:(id)a4;
- (id)_UIActionTypesForSubstitution;
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)_substituteActionsForAction:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)bestUTIForAppFromProviderRegisteredTypeIdentifiers:(id)a3;
- (id)dragContinuationFromEndpoint:(id)a3;
- (id)itemCollectionFromDragContinuation:(id)a3;
- (id)itemProvidersFromPBItemCollection:(id)a3 userInfo:(id)a4;
- (id)openURLOptionsFromBasePayload:(id)a3 sourceProcessHandle:(id)a4 dragContentOwner:(int64_t)a5;
- (id)uniqueFileNameWithStakedClaims:(id)a3 hint:(id)a4 extension:(id)a5;
@end

@implementation _UISceneOpenItemProvidersBSActionsHandler

- (id)_UIActionTypesForSubstitution
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:59];
}

- (id)_substituteActionsForAction:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  if ([(id)UIApp _appSupportsSceneItemProviders])
  {
    v10 = 0;
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = v8;
    id v28 = v8;
    if ([v9 isUISubclass])
    {
      uint64_t v12 = [v9 payload];
    }
    else
    {
      uint64_t v12 = 0;
    }
    v27 = v11;
    v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    v26 = (void *)v12;
    v14 = [(_UISceneOpenItemProvidersBSActionsHandler *)self URLContextsFromOpenItemProvidersActions:v13 payload:v12];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v21 = [UIOpenURLAction alloc];
          v22 = [v20 URL];
          v23 = [v20 options];
          v24 = [(UIOpenURLAction *)v21 initWithURL:v22 openURLOptions:v23 workspaceOriginatingProcess:0 responder:0];
          [v10 addObject:v24];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    id v8 = v28;
  }

  return v10;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v31 = a4;
  id v32 = a5;
  id v36 = a6;
  int v11 = [(id)UIApp _appSupportsSceneItemProviders];
  uint64_t v34 = v10;
  v37 = [v10 objectsPassingTest:&__block_literal_global_380];
  if ([v36 isUISubclass])
  {
    v33 = [v36 payload];
  }
  else
  {
    v33 = 0;
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__140;
  v52 = __Block_byref_object_dispose__140;
  id v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_5;
  aBlock[3] = &unk_1E52DE488;
  aBlock[4] = &v48;
  v35 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  if (v11)
  {
    id newValue = [MEMORY[0x1E4F1CA80] set];
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v37;
    uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    v39 = (void *)v12;
    if (v13)
    {
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v17 = [v16 continuationEndpoint];
          uint64_t v18 = [(_UISceneOpenItemProvidersBSActionsHandler *)self dragContinuationFromEndpoint:v17];

          v19 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemCollectionFromDragContinuation:v18];
          v20 = [v16 userInfo];
          v21 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemProvidersFromPBItemCollection:v19 userInfo:v20];

          v22 = [[_UISceneOpenItemProvidersDataTransferSession alloc] initWithItemProviders:v21 itemCollection:v19 continuation:v18];
          v23 = +[_UISceneOpenItemProvidersDataTransferSessionManager sharedInstance];
          [v23 addSession:v22];

          [v39 addObject:v21];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_2;
          v41[3] = &unk_1E52D9F70;
          v24 = v22;
          v42 = v24;
          v25 = _Block_copy(v41);
          [newValue addObject:v25];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v13);
    }

    v26 = v39;
    v35[2](v35, v39, @"_UISceneConnectionOptionsItemProvidersKey");
  }
  else
  {
    v26 = [(_UISceneOpenItemProvidersBSActionsHandler *)self URLContextsFromOpenItemProvidersActions:v37 payload:v33];
    v35[2](v35, v26, @"_UISceneConnectionOptionsURLContextKey");
    id newValue = 0;
  }

  v27 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v27 setLaunchOptionsDictionary:v49[5]];
  id v28 = [MEMORY[0x1E4F1CA80] setWithSet:v34];
  [v28 minusSet:v37];
  [(_UISceneConnectionOptionsContext *)v27 setUnprocessedActions:v28];
  if (v27) {
    objc_setProperty_nonatomic_copy(v27, v29, newValue, 24);
  }

  _Block_object_dispose(&v48, 8);
  return v27;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 objectsPassingTest:&__block_literal_global_13_0];
  v38 = [MEMORY[0x1E4F1CA48] array];
  int v11 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = [v9 delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v35 = v9;
    id v36 = v8;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v34 = v10;
    id obj = v10;
    uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v44 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v19 = [v18 continuationEndpoint];
          v20 = [(_UISceneOpenItemProvidersBSActionsHandler *)self dragContinuationFromEndpoint:v19];

          v21 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemCollectionFromDragContinuation:v20];
          v22 = [v18 userInfo];
          v23 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemProvidersFromPBItemCollection:v21 userInfo:v22];

          v24 = [[_UISceneOpenItemProvidersDataTransferSession alloc] initWithItemProviders:v23 itemCollection:v21 continuation:v20];
          v25 = +[_UISceneOpenItemProvidersDataTransferSessionManager sharedInstance];
          [v25 addSession:v24];

          [v38 addObject:v24];
          [v11 addObject:v23];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v15);
    }

    id v9 = v35;
    if ([v11 count])
    {
      v26 = [v35 delegate];
      [v26 _scene:v35 openItemProviders:v11];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = v38;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * j) didFinishSendingRequests];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v29);
    }

    id v8 = v36;
    id v10 = v34;
  }
  id v32 = (void *)[v8 mutableCopy];
  [v32 minusSet:v10];

  return v32;
}

- (id)URLContextsFromOpenItemProvidersActions:(id)a3 payload:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v20 = a4;
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      uint64_t v21 = v8;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v24 + 1) + 8 * v10);
        if ([v11 providerSource] == 1)
        {
          uint64_t v12 = [v11 continuationEndpoint];
          char v13 = [(_UISceneOpenItemProvidersBSActionsHandler *)self dragContinuationFromEndpoint:v12];

          uint64_t v14 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemCollectionFromDragContinuation:v13];
          if (objc_opt_respondsToSelector()) {
            [v14 setLoadsDataSynchronously:1];
          }
          uint64_t v15 = [(_UISceneOpenItemProvidersBSActionsHandler *)self itemProvidersFromPBItemCollection:v14 userInfo:0];
          uint64_t v16 = [v14 UUID];
          uint64_t v17 = [v16 UUIDString];
          uint64_t v18 = -[_UISceneOpenItemProvidersBSActionsHandler URLContextsFetchedFromItemProviders:collectionIdentifier:contentOwner:payload:](self, "URLContextsFetchedFromItemProviders:collectionIdentifier:contentOwner:payload:", v15, v17, [v14 originatorDataOwner], v20);

          [v13 dragContinuationDidFinishRequestingData];
          v6 = (void *)v18;
          uint64_t v8 = v21;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)bestUTIForAppFromProviderRegisteredTypeIdentifiers:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [(id)*MEMORY[0x1E4F44408] identifier];
  v39[0] = v4;
  id v5 = [(id)*MEMORY[0x1E4F44378] identifier];
  v39[1] = v5;
  v6 = [(id)*MEMORY[0x1E4F44370] identifier];
  v39[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];

  uint64_t v8 = [v3 arrayByExcludingObjectsInArray:v7];
  uint64_t v9 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  uint64_t v10 = v9;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__140;
  v37 = __Block_byref_object_dispose__140;
  id v38 = 0;
  if (v9)
  {
    id v11 = [v9 claimRecords];
  }
  else
  {
    id v11 = 0;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke;
  v29[3] = &unk_1E52FE1A8;
  id v12 = v11;
  id v30 = v12;
  id v13 = v7;
  id v31 = v13;
  id v32 = &v33;
  [v8 enumerateObjectsUsingBlock:v29];
  uint64_t v14 = (void *)v34[5];
  if (!v14)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_4;
    v25[3] = &unk_1E52FE1A8;
    id v15 = v12;
    id v26 = v15;
    id v16 = v13;
    id v27 = v16;
    uint64_t v28 = &v33;
    [v8 enumerateObjectsUsingBlock:v25];

    uint64_t v14 = (void *)v34[5];
    if (!v14)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_7;
      v21[3] = &unk_1E52FE1A8;
      id v22 = v15;
      id v23 = v16;
      long long v24 = &v33;
      [v8 enumerateObjectsUsingBlock:v21];

      uint64_t v14 = (void *)v34[5];
      if (!v14)
      {
        uint64_t v17 = [v3 firstObject];
        uint64_t v18 = (void *)v34[5];
        v34[5] = v17;

        uint64_t v14 = (void *)v34[5];
      }
    }
  }
  id v19 = v14;

  _Block_object_dispose(&v33, 8);
  return v19;
}

- (BOOL)currentAppSupportsReceivingMultipleItems
{
  return [(id)UIApp _appAdoptsUISceneLifecycle];
}

- (BOOL)currentAppSupportsOpenInPlace
{
  v2 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  id v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    char v5 = [v2 supportsOpenInPlace];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)openURLOptionsFromBasePayload:(id)a3 sourceProcessHandle:(id)a4 dragContentOwner:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [v8 mutableCopy];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = (void *)v10;
  id v12 = [NSNumber numberWithInteger:a5];
  [v11 setObject:v12 forKey:@"_UIApplicationOpenURLOptionsManagedContentKey"];

  uint64_t v13 = *MEMORY[0x1E4F22378];
  uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F22378]];
  char v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0)
  {
    id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_UISceneOpenItemProvidersBSActionsHandler currentAppSupportsOpenInPlace](self, "currentAppSupportsOpenInPlace"));
    [v11 setObject:v16 forKeyedSubscript:v13];
  }
  uint64_t v17 = +[UISceneOpenURLOptions _optionsFromPayload:v11 sourceProcessHandle:v9];

  return v17;
}

- (id)URLContextsFetchedFromItemProviders:(id)a3 collectionIdentifier:(id)a4 contentOwner:(int64_t)a5 payload:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v36 = a4;
  id v35 = a6;
  uint64_t v34 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = dispatch_group_create();
  if ([v9 count]
    && ![(_UISceneOpenItemProvidersBSActionsHandler *)self currentAppSupportsReceivingMultipleItems])
  {
    uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", 0, 1);

    id v9 = (id)v11;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    uint64_t v29 = &v41;
    id v30 = v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "registeredTypeIdentifiers", v29, v30);
        uint64_t v18 = [(_UISceneOpenItemProvidersBSActionsHandler *)self bestUTIForAppFromProviderRegisteredTypeIdentifiers:v17];

        if (v18)
        {
          dispatch_group_enter(v10);
          BOOL v19 = [(_UISceneOpenItemProvidersBSActionsHandler *)self currentAppSupportsOpenInPlace];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke;
          aBlock[3] = &unk_1E52FE1F8;
          aBlock[4] = v16;
          void aBlock[5] = self;
          id v43 = v33;
          id v44 = v36;
          id v45 = v35;
          int64_t v48 = a5;
          id v46 = v34;
          v47 = v10;
          id v20 = _Block_copy(aBlock);
          uint64_t v21 = v20;
          if (v19)
          {
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v40[0] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_3;
            v40[1] = &unk_1E52FE220;
            long long v41 = v20;
            id v22 = v20;
            id v23 = (id)[v16 loadInPlaceFileRepresentationForTypeIdentifier:v18 completionHandler:v39];
            long long v24 = v29;
          }
          else
          {
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_4;
            v37[3] = &unk_1E52FE248;
            id v38 = v20;
            id v25 = v20;
            id v26 = (id)[v16 loadFileRepresentationForTypeIdentifier:v18 completionHandler:v37];
            long long v24 = &v38;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v13);
  }

  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v27 = (void *)[v34 copy];

  return v27;
}

- (id)uniqueFileNameWithStakedClaims:(id)a3 hint:(id)a4 extension:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    if ([v9 length])
    {
      id v10 = [v8 stringByAppendingPathExtension:v9];
    }
    else
    {
      id v10 = v8;
    }
    uint64_t v13 = v10;
    if ([v7 containsObject:v10])
    {
      LODWORD(v19) = 0;
      do
      {
        if (v19)
        {
          uint64_t v19 = (v19 + 1);
          id v20 = [NSString stringWithFormat:@"%@ %d", v8, v19];

          if ([v9 length])
          {
            uint64_t v13 = [v20 stringByAppendingPathExtension:v9];
          }
          else
          {
            uint64_t v13 = v20;
          }
        }
        else
        {
          LODWORD(v19) = 1;
        }
      }
      while (([v7 containsObject:v13] & 1) != 0);
    }
  }
  else
  {
    uint64_t v11 = _UIKitBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"DROPPED_DOCUMENT" value:@"Dropped Document" table:@"Localizable"];

    id v22 = v12;
    uint64_t v13 = [v12 stringByAppendingPathExtension:v9];
    if ([v7 containsObject:v13])
    {
      LODWORD(v14) = 0;
      do
      {
        if (v14)
        {
          char v15 = NSString;
          id v16 = _UIKitBundle();
          uint64_t v17 = [v16 localizedStringForKey:@"DROPPED_DOCUMENT_N" value:@"Dropped Document %d" table:@"Localizable"];
          uint64_t v14 = (v14 + 1);
          uint64_t v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v14);

          if ([v9 length])
          {
            uint64_t v13 = [v18 stringByAppendingPathExtension:v9];
          }
          else
          {
            uint64_t v13 = v18;
          }
        }
        else
        {
          LODWORD(v14) = 1;
        }
      }
      while (([v7 containsObject:v13] & 1) != 0);
    }
  }
  return v13;
}

- (id)itemProvidersFromPBItemCollection:(id)a3 userInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v8 = [v5 items];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v5 items];
  uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = [[UIItemProvider alloc] initWithPBItem:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __88___UISceneOpenItemProvidersBSActionsHandler_itemProvidersFromPBItemCollection_userInfo___block_invoke;
        v18[3] = &unk_1E52DDE90;
        uint64_t v19 = v14;
        char v15 = v14;
        [v6 enumerateKeysAndObjectsUsingBlock:v18];
        [v9 addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v9;
}

- (id)dragContinuationFromEndpoint:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29268];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithListenerEndpoint:v4];

  id v6 = _DUINewDragContinuationInterface();
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_57];

  return v7;
}

- (id)itemCollectionFromDragContinuation:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__140;
  uint64_t v11 = __Block_byref_object_dispose__140;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80___UISceneOpenItemProvidersBSActionsHandler_itemCollectionFromDragContinuation___block_invoke;
  v6[3] = &unk_1E52FE270;
  v6[4] = &v7;
  [v3 requestItemCollectionWithReply:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end