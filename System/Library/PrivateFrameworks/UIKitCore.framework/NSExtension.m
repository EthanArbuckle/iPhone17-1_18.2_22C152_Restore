@interface NSExtension
@end

@implementation NSExtension

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2;
    block[3] = &unk_1E52ECC18;
    block[4] = *(void *)(a1 + 32);
    v8 = &v16;
    id v9 = v5;
    char v20 = *(unsigned char *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 56);
    id v16 = v9;
    uint64_t v19 = v10;
    v11 = &v17;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_5;
    v12[3] = &unk_1E52E3298;
    v12[4] = *(void *)(a1 + 32);
    v8 = &v13;
    id v13 = v6;
    v11 = &v14;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &NSExtensionHostAccessoryViewControllerClass_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v3;
    __int16 v30 = 2114;
    uint64_t v31 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Request completed for extension: %{public}@; contextToken: %{public}@",
      buf,
      0x16u);
  }
  id v5 = [[_UIRemoteViewService alloc] initWithExtension:*(void *)(a1 + 32) andContextToken:*(void *)(a1 + 40)];
  int v6 = *(unsigned __int8 *)(a1 + 72);
  id v7 = *(id *)(a1 + 32);
  v8 = [v7 infoDictionary];
  id v9 = [v8 objectForKey:@"NSExtension"];
  uint64_t v10 = v9;
  if (!v6)
  {
    v11 = [v9 objectForKey:@"NSExtensionViewControllerHostClass"];

    if (!v11)
    {
      v15 = [v7 infoDictionary];
      v11 = [v15 objectForKey:@"NSExtensionHostViewControllerClass"];

      if (!v11)
      {
        uint64_t v19 = [v7 infoDictionary];
        char v20 = [v19 objectForKey:@"NSExtension"];
        v11 = [v20 objectForKey:@"NSExtensionHostViewControllerClass"];

        if (!v11) {
          goto LABEL_7;
        }
        goto LABEL_11;
      }
    }
LABEL_10:

    goto LABEL_11;
  }
  v11 = [v9 objectForKey:@"NSExtensionHostAccessoryViewControllerClass"];

  if (v11) {
    goto LABEL_10;
  }
  v12 = [v7 infoDictionary];
  v11 = [v12 objectForKey:@"NSExtensionHostAccessoryViewControllerClass"];

  if (!v11)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"NSExtension accessory was requested, but no host class was specified. NSExtension: %@", *(void *)(a1 + 32) format];
LABEL_7:
    id v13 = objc_opt_class();
    v11 = 0;
    int v14 = 1;
    goto LABEL_12;
  }
LABEL_11:
  id v13 = NSClassFromString(v11);
  int v14 = 0;
LABEL_12:
  if (v13)
  {
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  v22 = v21;
  v23 = @"_UIRemoteViewController";
  if (!v14) {
    v23 = (__CFString *)v11;
  }
  [v21 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"NSExtension_UIKitAdditions.m", 79, @"Unable to instantiate class named %@ for host connection!", v23 object file lineNumber description];

  if ((v14 & 1) == 0)
  {
LABEL_14:
    if (([v13 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"NSExtension_UIKitAdditions.m", 80, @"Class %@ is not a subclass of _UIRemoteViewController!", v11 object file lineNumber description];
    }
  }
LABEL_16:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_29;
  v25[3] = &unk_1E52ECBF0;
  id v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  v25[4] = *(void *)(a1 + 32);
  id v26 = v16;
  id v27 = *(id *)(a1 + 56);
  id v18 = (id)[v13 requestViewControllerWithService:v5 traitCollection:v17 connectionHandler:v25];
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2_30;
    v9[3] = &unk_1E52E6948;
    id v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x1E4F14428], v9);
    (*(void (**)(void, void, id, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), v5, 0, v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2_30(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_3;
  v3[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  v2 = [*(id *)(a1 + 32) _extensionContextForUUID:*(void *)(a1 + 40)];
  [v2 _setRequestCleanUpBlock:v3];

  objc_destroyWeak(&v4);
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_4;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained disconnect];
}

uint64_t __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_5(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &NSExtensionHostAccessoryViewControllerClass_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Request completed for extension: %{public}@; with error: %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end