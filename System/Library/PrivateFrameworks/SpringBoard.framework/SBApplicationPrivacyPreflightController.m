@interface SBApplicationPrivacyPreflightController
- (NSString)description;
- (SBApplicationPrivacyPreflightController)initWithPreflightManager:(id)a3 applicationIdentity:(id)a4;
- (void)_notePreflightFinishedWithResult:(unint64_t)a3 cancelToken:(id)a4;
- (void)addPendingCompletion:(id)a3 forSceneIdentifier:(id)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)notePreflightFinishedWithResult:(unint64_t)a3;
@end

@implementation SBApplicationPrivacyPreflightController

- (SBApplicationPrivacyPreflightController)initWithPreflightManager:(id)a3 applicationIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBApplicationPrivacyPreflightController;
  v9 = [(SBApplicationPrivacyPreflightController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privacyPreflightManager, a3);
    objc_storeStrong((id *)&v10->_applicationIdentity, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingCompletionsBySceneIdentifier = v10->_pendingCompletionsBySceneIdentifier;
    v10->_pendingCompletionsBySceneIdentifier = v11;
  }
  return v10;
}

- (void)addPendingCompletion:(id)a3 forSceneIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[SBApplicationPrivacyPreflightController addPendingCompletion:forSceneIdentifier:]"];
    [v17 handleFailureInFunction:v18 file:@"SBApplicationPrivacyPreflightController.m" lineNumber:35 description:@"this call must be made on the main thread"];
  }
  id v8 = [(NSMutableDictionary *)self->_pendingCompletionsBySceneIdentifier objectForKey:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_pendingCompletionsBySceneIdentifier setObject:v8 forKey:v7];
  }
  v9 = (void *)MEMORY[0x1D948C7A0](v6);
  [v8 addObject:v9];

  preflightCancelToken = self->_preflightCancelToken;
  if (preflightCancelToken)
  {
    [(PDCPreflightRequestCanceling *)preflightCancelToken cancel];
    v11 = self->_preflightCancelToken;
    self->_preflightCancelToken = 0;
  }
  uint64_t v20 = 0;
  v21 = (id *)&v20;
  uint64_t v22 = 0x3042000000;
  v23 = __Block_byref_object_copy__100;
  v24 = __Block_byref_object_dispose__100;
  id v25 = 0;
  privacyPreflightManager = self->_privacyPreflightManager;
  applicationIdentity = self->_applicationIdentity;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__SBApplicationPrivacyPreflightController_addPendingCompletion_forSceneIdentifier___block_invoke;
  v19[3] = &unk_1E6B0B3A0;
  v19[4] = self;
  v19[5] = &v20;
  objc_super v14 = [(PDCPreflightManager *)privacyPreflightManager preflightLaunchForApplication:applicationIdentity withCompletionHandler:v19];
  objc_storeWeak(v21 + 5, v14);

  WeakRetained = (PDCPreflightRequestCanceling *)objc_loadWeakRetained(v21 + 5);
  v16 = self->_preflightCancelToken;
  self->_preflightCancelToken = WeakRetained;

  _Block_object_dispose(&v20, 8);
  objc_destroyWeak(&v25);
}

void __83__SBApplicationPrivacyPreflightController_addPendingCompletion_forSceneIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2 * (a2 != 0);
  }
  v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v3 _notePreflightFinishedWithResult:v2 cancelToken:WeakRetained];
}

- (void)notePreflightFinishedWithResult:(unint64_t)a3
{
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __72__SBApplicationPrivacyPreflightController_appendDescriptionToFormatter___block_invoke;
  v10 = &unk_1E6AF5290;
  id v11 = v4;
  v12 = self;
  id v5 = v4;
  [v5 appendProem:self block:&v7];
  id v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_pendingCompletionsBySceneIdentifier, @"pendingCompletions", v7, v8, v9, v10);
}

void __72__SBApplicationPrivacyPreflightController_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 16) identityString];
  [v1 appendString:v2 withName:@"applicationIdentity"];
}

- (void)_notePreflightFinishedWithResult:(unint64_t)a3 cancelToken:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = (PDCPreflightRequestCanceling *)a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = [NSString stringWithUTF8String:"-[SBApplicationPrivacyPreflightController _notePreflightFinishedWithResult:cancelToken:]"];
    [v21 handleFailureInFunction:v22 file:@"SBApplicationPrivacyPreflightController.m" lineNumber:89 description:@"this call must be made on the main thread"];
  }
  if (self->_preflightCancelToken == v6)
  {
    v24 = v6;
    uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_pendingCompletionsBySceneIdentifier mutableCopy];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = self;
    obuint64_t j = self->_pendingCompletionsBySceneIdentifier;
    uint64_t v27 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v10 = [(NSMutableDictionary *)v7 objectForKey:v9];
          [(NSMutableDictionary *)v7 removeObjectForKey:v9];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = [v10 reverseObjectEnumerator];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void (***)(void *, unint64_t, BOOL))(*((void *)&v28 + 1) + 8 * j);
                v17 = [v10 lastObject];
                v16[2](v16, a3, v16 == v17);
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v13);
          }
        }
        uint64_t v27 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v27);
    }

    pendingCompletionsBySceneIdentifier = v23->_pendingCompletionsBySceneIdentifier;
    v23->_pendingCompletionsBySceneIdentifier = v7;
    v19 = v7;

    preflightCancelToken = v23->_preflightCancelToken;
    v23->_preflightCancelToken = 0;

    id v6 = v24;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightCancelToken, 0);
  objc_storeStrong((id *)&self->_pendingCompletionsBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_privacyPreflightManager, 0);
}

@end