@interface SBSceneHandleBlockObserver
- (id)observeCreate:(id)a3;
- (id)observeDestroy:(id)a3;
- (id)observeDidUpdateClientSettings:(id)a3;
- (id)observeDidUpdateContentState:(id)a3;
- (id)observeDidUpdatePairingStatusForExternalIdentifiers:(id)a3;
- (id)observeDidUpdateSettings:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserverForToken:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
@end

@implementation SBSceneHandleBlockObserver

- (id)observeDidUpdateClientSettings:(id)a3
{
  id v4 = a3;
  if (!self->_didUpdateClientSettingsBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    didUpdateClientSettingsBlocks = self->_didUpdateClientSettingsBlocks;
    self->_didUpdateClientSettingsBlocks = v5;
  }
  v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_didUpdateClientSettingsBlocks];
  v8 = self->_didUpdateClientSettingsBlocks;
  v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (id)observeDidUpdateSettings:(id)a3
{
  id v4 = a3;
  if (!self->_didUpdateSettingsBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    didUpdateSettingsBlocks = self->_didUpdateSettingsBlocks;
    self->_didUpdateSettingsBlocks = v5;
  }
  v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_didUpdateSettingsBlocks];
  v8 = self->_didUpdateSettingsBlocks;
  v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (id)observeCreate:(id)a3
{
  id v4 = a3;
  if (!self->_createBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    createBlocks = self->_createBlocks;
    self->_createBlocks = v5;
  }
  v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_createBlocks];
  v8 = self->_createBlocks;
  v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(NSMutableDictionary *)self->_didUpdateSettingsBlocks allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(NSMutableDictionary *)self->_didUpdateClientSettingsBlocks allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(NSMutableDictionary *)self->_didUpdateContentStateBlocks allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_createBlocks allValues];
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
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSceneHandleBlockObserver.m" lineNumber:52 description:@"Cannot deallocate a SBSceneHandleBlockObserver without invalidating first."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSceneHandleBlockObserver;
  [(SBSceneHandleBlockObserver *)&v5 dealloc];
}

- (id)observeDestroy:(id)a3
{
  id v4 = a3;
  if (!self->_destroyBlocks)
  {
    objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    destroyBlocks = self->_destroyBlocks;
    self->_destroyBlocks = v5;
  }
  id v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_destroyBlocks];
  uint64_t v8 = self->_destroyBlocks;
  uint64_t v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (id)observeDidUpdateContentState:(id)a3
{
  id v4 = a3;
  if (!self->_didUpdateContentStateBlocks)
  {
    objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    didUpdateContentStateBlocks = self->_didUpdateContentStateBlocks;
    self->_didUpdateContentStateBlocks = v5;
  }
  id v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_didUpdateContentStateBlocks];
  uint64_t v8 = self->_didUpdateContentStateBlocks;
  uint64_t v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (id)observeDidUpdatePairingStatusForExternalIdentifiers:(id)a3
{
  id v4 = a3;
  if (!self->_didUpdatePairingStatusBlocks)
  {
    objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    didUpdatePairingStatusBlocks = self->_didUpdatePairingStatusBlocks;
    self->_didUpdatePairingStatusBlocks = v5;
  }
  id v7 = [[_SBSceneHandleObserverToken alloc] initWithOwner:self->_didUpdatePairingStatusBlocks];
  uint64_t v8 = self->_didUpdatePairingStatusBlocks;
  uint64_t v9 = (void *)[v4 copy];
  [(NSMutableDictionary *)v8 setObject:v9 forKey:v7];

  return v7;
}

- (void)removeObserverForToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 owner];
    [v4 removeObjectForKey:v3];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    createBlocks = self->_createBlocks;
    self->_createBlocks = 0;

    destroyBlocks = self->_destroyBlocks;
    self->_destroyBlocks = 0;

    didUpdateContentStateBlocks = self->_didUpdateContentStateBlocks;
    self->_didUpdateContentStateBlocks = 0;

    didUpdateSettingsBlocks = self->_didUpdateSettingsBlocks;
    self->_didUpdateSettingsBlocks = 0;

    didUpdateClientSettingsBlocks = self->_didUpdateClientSettingsBlocks;
    self->_didUpdateClientSettingsBlocks = 0;

    didUpdatePairingStatusBlocks = self->_didUpdatePairingStatusBlocks;
    self->_didUpdatePairingStatusBlocks = 0;
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_destroyBlocks allValues];
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
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_didUpdatePairingStatusBlocks allValues];
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
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didUpdatePairingStatusBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateClientSettingsBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateSettingsBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateContentStateBlocks, 0);
  objc_storeStrong((id *)&self->_destroyBlocks, 0);

  objc_storeStrong((id *)&self->_createBlocks, 0);
}

@end