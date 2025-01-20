@interface FBSApplicationDataStore(SceneStorage)
- (id)_cachedSceneDataStores;
- (id)_createSceneStoreWithIdentifier:()SceneStorage data:;
- (id)sceneStoreForIdentifier:()SceneStorage creatingIfNecessary:;
- (uint64_t)_fetchPersistedSceneDataStores;
- (uint64_t)_removeAllPersistentSceneData;
- (uint64_t)removeAllSceneDataStores;
- (void)_modifyPersistentSceneData:()SceneStorage identifier:data:;
- (void)_setCachedSceneDataStores:()SceneStorage;
- (void)enumerateSceneStoresUsingBlock:()SceneStorage;
- (void)removeSceneStoreForIdentifier:()SceneStorage;
@end

@implementation FBSApplicationDataStore(SceneStorage)

- (id)sceneStoreForIdentifier:()SceneStorage creatingIfNecessary:
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  v7 = [a1 _cachedSceneDataStores];
  v8 = [v7 objectForKey:v6];
  if (!v8)
  {
    v9 = [a1 _fetchPersistedSceneDataStores];
    v10 = [v9 objectForKey:v6];
    if (v10)
    {
      id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    }
    else
    {
      if (!a4)
      {
        v8 = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v12 = v11;
    v8 = [a1 _createSceneStoreWithIdentifier:v6 data:v11];

    if (v8) {
      [v7 setObject:v8 forKey:v6];
    }
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (id)_cachedSceneDataStores
{
  v4 = objc_getAssociatedObject(a1, "__sceneDataStores");
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:a1 file:@"FBSApplicationDataStore+SceneStorage.m" lineNumber:108 description:@"Must have a data stores dictionary to end here."];
    }
    [a1 _setCachedSceneDataStores:v4];
  }
  return v4;
}

- (uint64_t)_fetchPersistedSceneDataStores
{
  uint64_t v2 = objc_opt_class();
  return [a1 safeObjectForKey:@"_SBScenes" ofType:v2];
}

- (id)_createSceneStoreWithIdentifier:()SceneStorage data:
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"FBSApplicationDataStore+SceneStorage.m", 120, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"FBSApplicationDataStore+SceneStorage.m", 121, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_3:
  objc_initWeak(&location, a1);
  v10 = [SBSceneDataStore alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__FBSApplicationDataStore_SceneStorage___createSceneStoreWithIdentifier_data___block_invoke;
  v16[3] = &unk_1E6AF61D0;
  objc_copyWeak(v19, &location);
  id v11 = v7;
  v19[1] = a2;
  id v17 = v11;
  v18 = a1;
  id v12 = [(SBSceneDataStore *)v10 _initWithIdentifier:v11 data:v9 changeHandler:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_modifyPersistentSceneData:()SceneStorage identifier:data:
{
  id v12 = a4;
  id v8 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v10 = [a1 _fetchPersistedSceneDataStores];
  id v11 = (void *)[v9 initWithDictionary:v10];

  if (a3 == 1)
  {
    [v11 setObject:v8 forKey:v12];
  }
  else if (!a3)
  {
    [v11 removeObjectForKey:v12];
  }
  [a1 setObject:v11 forKey:@"_SBScenes"];
}

- (void)removeSceneStoreForIdentifier:()SceneStorage
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v6 = [a1 _cachedSceneDataStores];
  v5 = [v6 objectForKey:v4];
  [v5 _invalidate];

  [v6 removeObjectForKey:v4];
  [a1 _modifyPersistentSceneData:0 identifier:v4 data:0];
}

- (uint64_t)removeAllSceneDataStores
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(a1, "_cachedSceneDataStores", 0);
  v3 = [v2 objectEnumerator];

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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) _invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [a1 _setCachedSceneDataStores:0];
  return [a1 _removeAllPersistentSceneData];
}

- (void)enumerateSceneStoresUsingBlock:()SceneStorage
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  char v27 = 0;
  uint64_t v5 = [a1 _cachedSceneDataStores];
  v21 = a1;
  uint64_t v6 = [a1 _fetchPersistedSceneDataStores];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 allKeys];
  uint64_t v22 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v22)
  {
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
      long long v11 = [v5 objectForKey:v10];
      if (v11) {
        goto LABEL_7;
      }
      uint64_t v12 = [v6 objectForKey:v10];
      if (v12)
      {
        v13 = (void *)v12;
        id v14 = v4;
        uint64_t v15 = v8;
        v16 = v5;
        id v17 = v7;
        v18 = v6;
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
        long long v11 = [v21 _createSceneStoreWithIdentifier:v10 data:v19];

        uint64_t v6 = v18;
        uint64_t v7 = v17;
        uint64_t v5 = v16;
        uint64_t v8 = v15;
        id v4 = v14;

        if (v11)
        {
LABEL_7:
          (*((void (**)(id, uint64_t, void *, char *))v4 + 2))(v4, v10, v11, &v27);
        }
      }
      if (v27) {
        break;
      }
      if (v22 == ++v9)
      {
        uint64_t v20 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        uint64_t v22 = v20;
        if (v20) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_setCachedSceneDataStores:()SceneStorage
{
}

- (uint64_t)_removeAllPersistentSceneData
{
  return [a1 removeObjectForKey:@"_SBScenes"];
}

@end