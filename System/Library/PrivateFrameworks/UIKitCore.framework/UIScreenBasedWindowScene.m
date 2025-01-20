@interface UIScreenBasedWindowScene
@end

@implementation UIScreenBasedWindowScene

void __70___UIScreenBasedWindowScene__unassociatedWindowSceneForScreen_create___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) displayIdentity];
  v3 = v2;
  if (!v2)
  {
    v3 = [*(id *)(a1 + 32) _name];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 64) unassociationCache];
  uint64_t v5 = [v4 objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(unsigned char *)(a1 + 72))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = [UISceneSession alloc];
    v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = [v12 UUIDString];
    id v16 = [(UISceneSession *)v11 _initWithPersistentIdentifier:v13 sessionRole:@"_UIScreenBasedSceneSession" configurationName:0];

    v14 = [v16 configuration];
    [v14 setSceneClass:0];
    [v14 setDelegateClass:0];
    [v14 setStoryboard:0];
    [v16 _updateConfiguration:v14];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSession:v16];
    v15 = [*(id *)(a1 + 64) unassociationCache];
    [v15 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

void __58___UIScreenBasedWindowScene_unassociationCacheAccessQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("unassociationCacheAccessQueue", 0);
  v1 = (void *)_MergedGlobals_15_0;
  _MergedGlobals_15_0 = (uint64_t)v0;
}

void __62___UIScreenBasedWindowScene_initWithScreen_session_lookupKey___block_invoke(uint64_t a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ED464328] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = NSStringFromClass(a3);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v6 handleFailureInMethod:v7, v8, @"_UIScreenBasedWindowScene.m", 242, @"class: \"%@\" included in baseSceneComponentClassDictionary of %@ but does not confirm to _UISceneComponentProviding!", v9, v11 object file lineNumber description];
  }
  id v12 = (id)[[a3 alloc] initWithScene:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _registerSceneComponent:v12 forKey:v5];
}

void __57___UIScreenBasedWindowScene__performInvalidationIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() unassociationCache];
  [v2 removeObjectForKey:*(void *)(*(void *)(a1 + 32) + 480)];
}

void __63___UIScreenBasedWindowScene__preventAutoInvalidationForReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _removeAutoInvalidationPreventionAssertion:v5];
  }
}

void __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained _hasInvalidated] & 1) == 0)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke_2;
    v12[3] = &unk_1E52E0520;
    v12[4] = &v13;
    [v3 _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:0 asCopy:0 stopped:0 withBlock:v12];
    if (!*((unsigned char *)v14 + 24))
    {
      *((unsigned char *)v3 + 505) = 1;
      v4 = *(id *)(__UILogGetCategoryCachedImpl("SceneAutoInvalidation", _UIScreenBasedSceneSession_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(id *)(a1 + 32);
        if (v5)
        {
          uint64_t v6 = NSString;
          uint64_t v7 = (objc_class *)objc_opt_class();
          uint64_t v8 = NSStringFromClass(v7);
          uint64_t v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
        }
        else
        {
          uint64_t v9 = @"(nil)";
        }

        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Marking scene as needing invalidation: %{public}@", buf, 0xCu);
      }
      id v10 = v3[65];
      v11 = v10;
      if (!v10 || ![v10 count]) {
        -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](v3);
      }
    }
    *((unsigned char *)v3 + 504) = 0;
    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 _extendsScreenSceneLifetime];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __69___UIScreenBasedWindowScene__addSubclassDebugDescriptionWithBuilder___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 520);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __64___UIScreenBasedWindowScene__openURL_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end