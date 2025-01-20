@interface UISceneOpenItemProvidersBSActionsHandler
@end

@implementation UISceneOpenItemProvidersBSActionsHandler

uint64_t __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v6)
    {
      [v6 setObject:v10 forKey:v5];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v10 forKey:v5];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

uint64_t __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFinishSendingRequests];
}

uint64_t __107___UISceneOpenItemProvidersBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_2;
  v9[3] = &unk_1E52FE180;
  uint64_t v7 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)*MEMORY[0x1E4F224A8];
  uint64_t v7 = [v5 handlerRank];
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    id v8 = [v5 typeIdentifiers];
    v9 = [v8 arrayByExcludingObjectsInArray:*(void *)(a1 + 32)];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_3;
    v13[3] = &unk_1E52FE158;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = a3;
    uint64_t v17 = v12;
    [v9 enumerateObjectsUsingBlock:v13];
  }
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  id v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(a1 + 32)];
  if (v8 && [v6 conformsToType:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    uint64_t v7 = *(unsigned char **)(a1 + 48);
    **(unsigned char **)(a1 + 56) = 1;
    *uint64_t v7 = 1;
    *a4 = 1;
  }
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_5;
  v9[3] = &unk_1E52FE180;
  uint64_t v7 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 typeIdentifiers];
  id v6 = [v5 arrayByExcludingObjectsInArray:*(void *)(a1 + 32)];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_6;
  v10[3] = &unk_1E52FE158;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = a3;
  uint64_t v14 = v9;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    id v6 = *(unsigned char **)(a1 + 48);
    **(unsigned char **)(a1 + 56) = 1;
    unsigned char *v6 = 1;
    *a4 = 1;
  }
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_8;
  v9[3] = &unk_1E52FE180;
  id v7 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 typeIdentifiers];
  id v6 = [v5 arrayByExcludingObjectsInArray:*(void *)(a1 + 32)];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_9;
  v10[3] = &unk_1E52FE158;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = a3;
  uint64_t v14 = v9;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  id v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(a1 + 32)];
  if (v8 && [v6 conformsToType:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    id v7 = *(unsigned char **)(a1 + 48);
    **(unsigned char **)(a1 + 56) = 1;
    *id v7 = 1;
    *a4 = 1;
  }
}

void __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__140;
  v27 = __Block_byref_object_dispose__140;
  id v9 = v7;
  id v28 = v9;
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    uint64_t v11 = v24[5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_2;
    v14[3] = &unk_1E52FE1D0;
    char v22 = a3;
    long long v15 = *(_OWORD *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    v20 = &v23;
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 88);
    id v18 = v12;
    uint64_t v21 = v13;
    id v19 = *(id *)(a1 + 72);
    [v10 coordinateReadingItemAtURL:v11 options:1 error:0 byAccessor:v14];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
  _Block_object_dispose(&v23, 8);
}

void __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 96)) {
    goto LABEL_12;
  }
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  id v6 = [v4 path];

  id v7 = [v6 lastPathComponent];
  id v8 = [v7 pathExtension];

  id v9 = [*(id *)(a1 + 32) _sanitizedSuggestedName];
  id v10 = [v9 pathExtension];
  if ([v8 length])
  {
    if (([v10 isEqualToString:v8] & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([v10 length])
  {
    id v11 = v10;

    id v8 = v11;
LABEL_7:
    uint64_t v12 = [v9 stringByDeletingPathExtension];

    id v9 = (void *)v12;
  }
LABEL_8:
  uint64_t v13 = [*(id *)(a1 + 40) uniqueFileNameWithStakedClaims:*(void *)(a1 + 48) hint:v9 extension:v8];

  [*(id *)(a1 + 48) addObject:v13];
  uint64_t v14 = [NSString stringWithFormat:@"Dropped Document Session %@", *(void *)(a1 + 56)];
  long long v15 = NSTemporaryDirectory();
  id v16 = [v15 stringByAppendingPathComponent:v14];

  [v5 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:0];
  id v17 = [v16 stringByAppendingPathComponent:v13];
  if (v17)
  {
    [v5 removeItemAtPath:v17 error:0];
    id v24 = 0;
    [v5 copyItemAtPath:v6 toPath:v17 error:&v24];
    id v18 = v24;
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
  uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

LABEL_12:
  char v22 = [*(id *)(a1 + 40) openURLOptionsFromBasePayload:*(void *)(a1 + 64) sourceProcessHandle:0 dragContentOwner:*(void *)(a1 + 88)];
  uint64_t v23 = [[UIOpenURLContext alloc] initWithURL:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) options:v22];
  [*(id *)(a1 + 72) addObject:v23];
}

uint64_t __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88___UISceneOpenItemProvidersBSActionsHandler_itemProvidersFromPBItemCollection_userInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setMetadataValue:a3 forKey:a2];
}

void __74___UISceneOpenItemProvidersBSActionsHandler_dragContinuationFromEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __80___UISceneOpenItemProvidersBSActionsHandler_itemCollectionFromDragContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDataProviderEndpoint:v7];
}

@end