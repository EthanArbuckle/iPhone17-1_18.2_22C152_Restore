@interface SKUIFamilyCircleController
+ (id)sharedController;
- (BOOL)hasLoaded;
- (FAFamilyCircle)iCloudFamily;
- (NSNumber)lastAccountID;
- (SKUIClientContext)clientContext;
- (SKUIFamilyCircleController)init;
- (SSFamilyCircle)familyCircle;
- (id)profilePictureForFamilyMember:(id)a3;
- (int64_t)reloadPromptStyle;
- (void)_accountStoreDidChange:(id)a3;
- (void)_reloadDataWithPromptStyle:(int64_t)a3;
- (void)_setITunesFamily:(id)a3 error:(id)a4 iCloudFamily:(id)a5 error:(id)a6;
- (void)_setProfilePicture:(id)a3 forMember:(id)a4;
- (void)dealloc;
- (void)init;
- (void)reloadData;
- (void)setClientContext:(id)a3;
- (void)setLastAccountID:(id)a3;
- (void)setReloadPromptStyle:(int64_t)a3;
@end

@implementation SKUIFamilyCircleController

+ (id)sharedController
{
  if (sharedController_sOnce_0 != -1) {
    dispatch_once(&sharedController_sOnce_0, &__block_literal_global_45);
  }
  v2 = (void *)sharedController_sInstance;

  return v2;
}

uint64_t __46__SKUIFamilyCircleController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SKUIFamilyCircleController);
  uint64_t v1 = sharedController_sInstance;
  sharedController_sInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (SKUIFamilyCircleController)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIFamilyCircleController init]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIFamilyCircleController;
  v3 = [(SKUIFamilyCircleController *)&v10 init];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4FA83B8];
    v6 = [MEMORY[0x1E4FA8100] defaultStore];
    [v4 addObserver:v3 selector:sel__accountStoreDidChange_ name:v5 object:v6];

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v3->_imageCache;
    v3->_imageCache = v7;

    v3->_reloadPromptStyle = -1;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FA83B8];
  uint64_t v5 = [MEMORY[0x1E4FA8100] defaultStore];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)SKUIFamilyCircleController;
  [(SKUIFamilyCircleController *)&v6 dealloc];
}

- (void)reloadData
{
  if ([(SKUIFamilyCircleController *)self reloadPromptStyle])
  {
    [(SKUIFamilyCircleController *)self _reloadDataWithPromptStyle:0];
  }
}

- (id)profilePictureForFamilyMember:(id)a3
{
  imageCache = self->_imageCache;
  uint64_t v4 = [a3 iCloudIdentifier];
  uint64_t v5 = [(NSCache *)imageCache objectForKey:v4];

  return v5;
}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SKUIFamilyCircleController__accountStoreDidChange___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(v4, block);
}

void __53__SKUIFamilyCircleController__accountStoreDidChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FA8100] defaultStore];
  v3 = [v2 activeAccount];
  id v5 = [v3 uniqueIdentifier];

  id v4 = [*(id *)(a1 + 32) lastAccountID];
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0) {
    [*(id *)(a1 + 32) _reloadDataWithPromptStyle:1000];
  }
}

- (void)_reloadDataWithPromptStyle:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4FA8100] defaultStore];
  objc_super v6 = [v5 activeAccount];
  v7 = [v6 uniqueIdentifier];
  [(SKUIFamilyCircleController *)self setLastAccountID:v7];

  [(SKUIFamilyCircleController *)self setReloadPromptStyle:a3];
  objc_initWeak(&location, self);
  v8 = [(SKUIClientContext *)self->_clientContext URLBag];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke;
  v9[3] = &unk_1E6429068;
  v10[1] = (id)a3;
  v9[4] = self;
  objc_copyWeak(v10, &location);
  [v8 loadValueForKey:@"shared-purchases-enabled" completionBlock:v9];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue])
  {
    v3 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2;
    block[3] = &unk_1E64236A0;
    uint64_t v4 = *(void *)(a1 + 32);
    v9[1] = *(id *)(a1 + 48);
    block[4] = v4;
    id v5 = v9;
    objc_copyWeak(v9, (id *)(a1 + 40));
    dispatch_async(v3, block);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_4;
    v6[3] = &unk_1E6422160;
    v6[4] = *(void *)(a1 + 32);
    id v5 = &v7;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
  objc_destroyWeak(v5);
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2(uint64_t a1)
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__75;
  v25[4] = __Block_byref_object_dispose__75;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__75;
  v23[4] = __Block_byref_object_dispose__75;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__75;
  v21[4] = __Block_byref_object_dispose__75;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__75;
  v19[4] = __Block_byref_object_dispose__75;
  id v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = objc_alloc_init(MEMORY[0x1E4FA81C8]);
  [v4 setAuthenticationPromptStyle:*(void *)(a1 + 48)];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_46;
  v15[3] = &unk_1E6428FF0;
  v17 = v25;
  v18 = v23;
  id v5 = v2;
  v16 = v5;
  [v4 startWithResponseBlock:v15];
  uint64_t v6 = SKUIFamilyCircleFramework();
  id v7 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Fafetchfamilyc.isa, v6));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2_51;
  v11[3] = &unk_1E6429018;
  v13 = v21;
  v14 = v19;
  v8 = v3;
  v12 = v8;
  [v7 startRequestWithCompletionHandler:v11];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_3;
  v9[3] = &unk_1E6429040;
  v9[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  void v9[5] = v25;
  v9[6] = v23;
  v9[7] = v21;
  v9[8] = v19;
  dispatch_async(MEMORY[0x1E4F14428], v9);
  objc_destroyWeak(&v10);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 familyCircle];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2_51(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setReloadPromptStyle:-1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _setITunesFamily:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) iCloudFamily:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setReloadPromptStyle:-1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setITunesFamily:0 error:0 iCloudFamily:0 error:0];
}

- (void)_setITunesFamily:(id)a3 error:(id)a4 iCloudFamily:(id)a5 error:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v20 = a5;
  self->_hasLoaded = 1;
  objc_storeStrong((id *)&self->_iTunesFamily, a3);
  objc_storeStrong((id *)&self->_iCloudFamily, a5);
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"SKUIFamilyCircleDidChangeNotification" object:self];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [(SSFamilyCircle *)self->_iTunesFamily familyMembers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        imageCache = self->_imageCache;
        v17 = [v15 iCloudIdentifier];
        v18 = [(NSCache *)imageCache objectForKey:v17];

        if (!v18)
        {
          objc_initWeak(&location, self);
          v19 = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke;
          block[3] = &unk_1E6422160;
          block[4] = v15;
          objc_copyWeak(&v23, &location);
          dispatch_async(v19, block);

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

void __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) firstName];
  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) lastName];
  id v4 = [*(id *)(a1 + 32) iCloudAccountName];
  id v5 = [*(id *)(a1 + 32) iCloudIdentifier];
  id v6 = SKUIGetFamilyMemberImage(v2, v3, v4, v5);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setProfilePicture:*(void *)(a1 + 32) forMember:*(void *)(a1 + 40)];
}

- (void)_setProfilePicture:(id)a3 forMember:(id)a4
{
  imageCache = self->_imageCache;
  id v7 = a3;
  id v8 = [a4 iCloudIdentifier];
  [(NSCache *)imageCache setObject:v7 forKey:v8];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"SKUIFamilyCircleProfilePictureDidChangeNotification" object:self];
}

- (SSFamilyCircle)familyCircle
{
  return self->_iTunesFamily;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (FAFamilyCircle)iCloudFamily
{
  return self->_iCloudFamily;
}

- (NSNumber)lastAccountID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastAccountID:(id)a3
{
}

- (int64_t)reloadPromptStyle
{
  return self->_reloadPromptStyle;
}

- (void)setReloadPromptStyle:(int64_t)a3
{
  self->_reloadPromptStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccountID, 0);
  objc_storeStrong((id *)&self->_iCloudFamily, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_iTunesFamily, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIFamilyCircleController init]";
}

@end