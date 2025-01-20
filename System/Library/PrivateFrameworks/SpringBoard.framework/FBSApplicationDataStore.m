@interface FBSApplicationDataStore
@end

@implementation FBSApplicationDataStore

void __78__FBSApplicationDataStore_SceneStorage___createSceneStoreWithIdentifier_data___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BSDispatchQueueAssertMain();
  v4 = [WeakRetained _cachedSceneDataStores];
  id v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  if (v5 == v16)
  {
    if (!WeakRetained) {
      goto LABEL_6;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v14 = [WeakRetained _cachedSceneDataStores];
    v15 = [v14 objectForKey:*(void *)(a1 + 32)];
    [v10 handleFailureInMethod:v11, v12, @"FBSApplicationDataStore+SceneStorage.m", 128, @"Expected store (%p) for identifier: %@, but instead had store: (%p)", v16, v13, v15 object file lineNumber description];

    if (!WeakRetained) {
      goto LABEL_6;
    }
  }
  v6 = [v16 _data];
  uint64_t v7 = [v6 count];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    v9 = [v16 _data];
    [WeakRetained _modifyPersistentSceneData:1 identifier:v8 data:v9];
  }
  else
  {
    [WeakRetained _modifyPersistentSceneData:0 identifier:v8 data:0];
  }
LABEL_6:
}

@end