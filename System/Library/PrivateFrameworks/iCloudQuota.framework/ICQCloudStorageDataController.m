@interface ICQCloudStorageDataController
+ (id)_requestQueue;
- (BOOL)iCloudDetailsPageShown;
- (BOOL)shouldIgnoreCache;
- (ICQCloudStorageDataController)initWithAccount:(id)a3;
- (ICQiCloudDetailsPageInfo)cachediCloudDetailsPage;
- (id)cachedStorageSummary;
- (void)fetchAppsSyncingToiCloudDriveWithCompletion:(id)a3;
- (void)fetchBackupinfoWithCompletion:(id)a3;
- (void)fetchStorageAppsWithCompletion:(id)a3;
- (void)fetchStorageByApp:(id)a3 completion:(id)a4;
- (void)fetchStorageSummaryWithCompletion:(id)a3;
- (void)sendTipState:(int64_t)a3 forTip:(id)a4 completion:(id)a5;
- (void)setICloudDetailsPageShown:(BOOL)a3;
- (void)setShouldIgnoreCache:(BOOL)a3;
@end

@implementation ICQCloudStorageDataController

+ (id)_requestQueue
{
  if (_requestQueue_onceToken_0 != -1) {
    dispatch_once(&_requestQueue_onceToken_0, &__block_literal_global_16);
  }
  v2 = (void *)_requestQueue_requestQueue_0;
  return v2;
}

void __46__ICQCloudStorageDataController__requestQueue__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.quota.storage.request", v0);
  v2 = (void *)_requestQueue_requestQueue_0;
  _requestQueue_requestQueue_0 = (uint64_t)v1;
}

- (ICQCloudStorageDataController)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQCloudStorageDataController;
  v6 = [(ICQCloudStorageDataController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_shouldIgnoreCache = 0;
  }

  return v7;
}

- (void)fetchStorageSummaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _requestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke;
    block[3] = &unk_1E6A52FB8;
    block[4] = self;
    id v11 = v4;
    id v10 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
    }

    v8 = ICQCreateError(12);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) shouldIgnoreCache];
    *(_DWORD *)buf = 67109120;
    int v29 = v3;
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
  }

  if (([*(id *)(a1 + 32) shouldIgnoreCache] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) cachedStorageSummary];
    id v5 = _ICQGetLogSystem();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Returning cached cloud storage summary result.", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_17;
    }
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
    }
  }
  v7 = _ICQSignpostLogSystem();
  v8 = objc_opt_new();
  os_signpost_id_t v9 = _ICQSignpostCreateWithObject(v7, v8);
  uint64_t v11 = v10;

  v12 = _ICQSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "StorageSummaryRequest", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_cold_1();
  }

  id v4 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24;
  v24[3] = &unk_1E6A52280;
  os_signpost_id_t v26 = v9;
  uint64_t v27 = v11;
  id v25 = *(id *)(a1 + 48);
  v15 = [v4 synchronousDaemonWithErrorHandler:v24];
  v16 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_26;
  v18[3] = &unk_1E6A53538;
  os_signpost_id_t v22 = v9;
  uint64_t v23 = v11;
  id v19 = v16;
  id v17 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = v17;
  [v15 fetchStorageSummaryForAltDSID:v19 completion:v18];

LABEL_17:
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24_cold_2();
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  BOOL v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)os_signpost_id_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageSummaryRequest", "", v9, 2u);
  }

  v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Cloud storage summary request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  v8 = _ICQSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageSummaryRequest", "", v16, 2u);
  }

  uint64_t v11 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24_cold_1();
  }

  if (v5)
  {
    v12 = +[ICQCloudStorageSummaryCache sharedInstance];
    [v12 setStorageSummary:v5 forAltDSID:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_26_cold_1();
    }

    uint64_t v14 = *(void *)(a1 + 48);
    v15 = [*(id *)(a1 + 40) cachedStorageSummary];
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v6);
  }
}

- (id)cachedStorageSummary
{
  id v3 = +[ICQCloudStorageSummaryCache sharedInstance];
  id v4 = [(ACAccount *)self->_account aa_altDSID];
  id v5 = [v3 storageSummaryForAltDSID:v4];

  return v5;
}

- (ICQiCloudDetailsPageInfo)cachediCloudDetailsPage
{
  id v3 = +[ICQCloudStorageSummaryCache sharedInstance];
  char v4 = [v3 hasDisplayedDetailsPage];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(ICQCloudStorageDataController *)self cachedStorageSummary];
    id v5 = [v6 iCloudDetailsPageInfo];
  }
  return (ICQiCloudDetailsPageInfo *)v5;
}

- (BOOL)iCloudDetailsPageShown
{
  v2 = +[ICQCloudStorageSummaryCache sharedInstance];
  char v3 = [v2 hasDisplayedDetailsPage];

  return v3;
}

- (void)setICloudDetailsPageShown:(BOOL)a3
{
  id v3 = +[ICQCloudStorageSummaryCache sharedInstance];
  [v3 setHasDisplayedDetailsPage:1];
}

- (void)fetchStorageAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];
  if (v5)
  {
    id v6 = _ICQSignpostLogSystem();
    os_signpost_id_t v7 = objc_opt_new();
    os_signpost_id_t v8 = _ICQSignpostCreateWithObject(v6, v7);
    uint64_t v10 = v9;

    uint64_t v11 = _ICQSignpostLogSystem();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StorageAppsRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v13 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICQCloudStorageDataController fetchStorageAppsWithCompletion:]();
    }

    id v14 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke;
    v22[3] = &unk_1E6A52280;
    os_signpost_id_t v24 = v8;
    uint64_t v25 = v10;
    id v15 = v4;
    id v23 = v15;
    v16 = [v14 daemonWithErrorHandler:v22];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_29;
    v18[3] = &unk_1E6A53560;
    os_signpost_id_t v20 = v8;
    uint64_t v21 = v10;
    id v19 = v15;
    [v16 fetchStorageAppsForAltDSID:v5 completion:v18];
  }
  else
  {
    id v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
    }

    ICQCreateError(12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v14);
  }
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_2();
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageAppsRequest", "", v9, 2u);
  }

  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_29(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Cloud storage apps request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[5];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageAppsRequest", "", v13, 2u);
  }

  uint64_t v11 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1();
  }

  if (!v5)
  {
    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_29_cold_1();
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (void)fetchStorageByApp:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = (void (**)(id, id, void))a4;
  os_signpost_id_t v8 = [(ACAccount *)self->_account aa_altDSID];
  uint64_t v9 = _ICQGetLogSystem();
  os_signpost_id_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v36 = [(ICQCloudStorageDataController *)self shouldIgnoreCache];
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
    }

    if (![(ICQCloudStorageDataController *)self shouldIgnoreCache])
    {
      uint64_t v11 = +[ICQAppCloudStorageCache sharedInstance];
      id v12 = [v11 cloudStorageByApp:v6 forAltDSID:v8];

      v13 = _ICQGetLogSystem();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Returning cached app cloud storage result.", buf, 2u);
        }

        v7[2](v7, v12, 0);
        goto LABEL_21;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
      }
    }
    id v15 = _ICQSignpostLogSystem();
    v16 = objc_opt_new();
    os_signpost_id_t v17 = _ICQSignpostCreateWithObject(v15, v16);
    uint64_t v19 = v18;

    os_signpost_id_t v20 = _ICQSignpostLogSystem();
    uint64_t v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "StorageByAppRequest", " enableTelemetry=YES ", buf, 2u);
    }

    os_signpost_id_t v22 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICQCloudStorageDataController fetchStorageByApp:completion:]();
    }

    id v12 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke;
    v31[3] = &unk_1E6A52280;
    os_signpost_id_t v33 = v17;
    uint64_t v34 = v19;
    id v23 = v7;
    id v32 = v23;
    os_signpost_id_t v24 = [v12 daemonWithErrorHandler:v31];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_32;
    v25[3] = &unk_1E6A53588;
    os_signpost_id_t v29 = v17;
    uint64_t v30 = v19;
    id v26 = v6;
    id v27 = v8;
    v28 = v23;
    [v24 fetchStorageByApp:v26 forAltDSID:v27 completion:v25];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
    }

    ICQCreateError(12);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v7)[2](v7, 0, v12);
  }
LABEL_21:
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_2();
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "StorageByAppRequest", "", v9, 2u);
  }

  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_32(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "App cloud storage request has been completed.", buf, 2u);
  }

  _ICQSignpostGetNanoseconds(a1[7], a1[8]);
  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StorageByAppRequest", "", v16, 2u);
  }

  uint64_t v11 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1();
  }

  if (v5)
  {
    id v12 = +[ICQAppCloudStorageCache sharedInstance];
    [v12 setCloudStorage:v5 byApp:a1[4] forAltDSID:a1[5]];

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_32_cold_1();
    }

    BOOL v14 = +[ICQAppCloudStorageCache sharedInstance];
    id v15 = [v14 cloudStorageByApp:a1[4] forAltDSID:a1[5]];

    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)fetchBackupinfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];

  id v6 = _ICQGetLogSystem();
  os_signpost_id_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to fetch backup info.", buf, 2u);
    }

    os_signpost_id_t v8 = _ICQSignpostLogSystem();
    uint64_t v9 = objc_opt_new();
    os_signpost_id_t v10 = _ICQSignpostCreateWithObject(v8, v9);
    uint64_t v12 = v11;

    v13 = _ICQSignpostLogSystem();
    BOOL v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BackupInfoRequest", " enableTelemetry=YES ", buf, 2u);
    }

    id v15 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ICQCloudStorageDataController fetchBackupinfoWithCompletion:]();
    }

    id v16 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke;
    v24[3] = &unk_1E6A52280;
    id v17 = v4;
    id v25 = v17;
    os_signpost_id_t v26 = v10;
    uint64_t v27 = v12;
    uint64_t v18 = [v16 daemonWithErrorHandler:v24];
    uint64_t v19 = [(ACAccount *)self->_account aa_altDSID];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_34;
    v20[3] = &unk_1E6A535B0;
    os_signpost_id_t v22 = v10;
    uint64_t v23 = v12;
    id v21 = v17;
    [v18 fetchBackupInfoForAltDSID:v19 completion:v20];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
    }

    ICQCreateError(12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v16);
  }
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_2();
  }

  (*(void (**)(void))(a1[4] + 16))();
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "BackupInfoRequest", "", v9, 2u);
  }

  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1();
  }
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_34(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  os_signpost_id_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "fetchBackupInfo request completed.", buf, 2u);
  }

  if (v5)
  {
    os_signpost_id_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_34_cold_2();
    }
  }
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v9 = _ICQSignpostLogSystem();
  os_signpost_id_t v10 = v9;
  os_signpost_id_t v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v10, OS_SIGNPOST_INTERVAL_END, v11, "BackupInfoRequest", "", v13, 2u);
  }

  uint64_t v12 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)sendTipState:(int64_t)a3 forTip:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_signpost_id_t v10 = [(ACAccount *)self->_account aa_altDSID];

  os_signpost_id_t v11 = _ICQGetLogSystem();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to send tip state.", buf, 2u);
    }

    v13 = _ICQSignpostLogSystem();
    BOOL v14 = objc_opt_new();
    os_signpost_id_t v15 = _ICQSignpostCreateWithObject(v13, v14);
    uint64_t v17 = v16;

    uint64_t v18 = _ICQSignpostLogSystem();
    uint64_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "TipStateRequest", " enableTelemetry=YES ", buf, 2u);
    }

    os_signpost_id_t v20 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ICQCloudStorageDataController sendTipState:forTip:completion:]();
    }

    id v21 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke;
    v33[3] = &unk_1E6A52280;
    os_signpost_id_t v35 = v15;
    uint64_t v36 = v17;
    id v22 = v9;
    id v34 = v22;
    uint64_t v23 = [v21 daemonWithErrorHandler:v33];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_36;
    os_signpost_id_t v29 = &unk_1E6A52280;
    os_signpost_id_t v31 = v15;
    uint64_t v32 = v17;
    id v30 = v22;
    os_signpost_id_t v24 = _Block_copy(&v26);
    if (a3 == 1)
    {
      id v25 = [(ACAccount *)self->_account aa_altDSID];
      [v23 sendTipDismissedNetworkRequestForAltDSID:v25 tip:v8 completion:v24];
    }
    else
    {
      if (a3)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v25 = [(ACAccount *)self->_account aa_altDSID];
      [v23 sendTipDisplayedNetworkRequestForAltDSID:v25 tip:v8 completion:v24];
    }

    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
  }

  ICQCreateError(12);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))v9 + 2))(v9, v21);
LABEL_18:
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_2();
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TipStateRequest", "", v9, 2u);
  }

  id v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_36(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_36_cold_2();
    }
  }
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TipStateRequest", "", v9, 2u);
  }

  id v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)fetchAppsSyncingToiCloudDriveWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self->_account aa_altDSID];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() _requestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke;
    block[3] = &unk_1E6A52D40;
    block[4] = self;
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    os_signpost_id_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICQCloudStorageDataController fetchStorageSummaryWithCompletion:]();
    }

    id v8 = ICQCreateError(12);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) shouldIgnoreCache];
    *(_DWORD *)buf = 67109120;
    int v28 = v3;
    _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "Should ignore cache: %d", buf, 8u);
  }

  if (([*(id *)(a1 + 32) shouldIgnoreCache] & 1) == 0)
  {
    id v4 = +[ICQAppsSyncingToDriveCache sharedInstance];
    id v5 = [v4 appsSyncingToDriveforAltDSID:*(void *)(a1 + 40)];

    id v6 = _ICQGetLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Returning cached apps syncing to drive result.", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_23;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "No cache exist. Reaching out to daemon to fetch the result from server.", buf, 2u);
    }
  }
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Reaching out to daemon to fetch apps syncing to icloud drive", buf, 2u);
  }

  id v9 = _ICQSignpostLogSystem();
  id v10 = objc_opt_new();
  os_signpost_id_t v11 = _ICQSignpostCreateWithObject(v9, v10);
  uint64_t v13 = v12;

  BOOL v14 = _ICQSignpostLogSystem();
  os_signpost_id_t v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AppsSyncingToiCloudDrive", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v16 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_2();
  }

  id v5 = objc_alloc_init((Class)getINDaemonConnectionClass_0());
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38;
  v23[3] = &unk_1E6A52280;
  os_signpost_id_t v25 = v11;
  uint64_t v26 = v13;
  id v24 = *(id *)(a1 + 48);
  uint64_t v17 = [v5 daemonWithErrorHandler:v23];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = *(void **)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_41;
    v20[3] = &unk_1E6A535D8;
    id v21 = v18;
    id v22 = *(id *)(a1 + 48);
    [v17 fetchAppsSyncingToiCloudDriveForAltDSID:v21 completion:v20];

    uint64_t v19 = v21;
  }
  else
  {
    uint64_t v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_1();
    }
  }

LABEL_23:
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38_cold_2();
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  id v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AppsSyncingToiCloudDrive", "", v9, 2u);
  }

  id v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    os_signpost_id_t v7 = +[ICQAppsSyncingToDriveCache sharedInstance];
    [v7 setAppsSyncingToDrive:v5 forAltDSID:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_41_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = +[ICQAppsSyncingToDriveCache sharedInstance];
    os_signpost_id_t v11 = [v10 appsSyncingToDriveforAltDSID:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v6);
  }
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (void).cxx_destruct
{
}

- (void)fetchStorageSummaryWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "Invalid account. No altDSID found.", v2, v3, v4, v5, v6);
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageSummaryRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageSummaryRequest ", v2, v3, v4, v5, v6);
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_24_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "XPC Error while fetching storage summary.", v2, v3, v4, v5, v6);
}

void __67__ICQCloudStorageDataController_fetchStorageSummaryWithCompletion___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to fetch cloud storage summary with error: %@. Returning cached results.", v2, v3, v4, v5, v6);
}

- (void)fetchStorageAppsWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageAppsRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageAppsRequest ", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "XPC Error while fetching storage apps: %@", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_fetchStorageAppsWithCompletion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to fetch cloud storage apps with error: %@.", v2, v3, v4, v5, v6);
}

- (void)fetchStorageByApp:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: StorageByAppRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) StorageByAppRequest ", v2, v3, v4, v5, v6);
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "XPC Error while fetching storage detail.", v2, v3, v4, v5, v6);
}

void __62__ICQCloudStorageDataController_fetchStorageByApp_completion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to fetch app cloud storage with error: %@, returning cached result.", v2, v3, v4, v5, v6);
}

- (void)fetchBackupinfoWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: BackupInfoRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) BackupInfoRequest ", v2, v3, v4, v5, v6);
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "XPC Error while backup info.", v2, v3, v4, v5, v6);
}

void __63__ICQCloudStorageDataController_fetchBackupinfoWithCompletion___block_invoke_34_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to fetch backup info with error: %@", v2, v3, v4, v5, v6);
}

- (void)sendTipState:forTip:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: TipStateRequest  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) TipStateRequest ", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "XPC Error while reaching out to daemon to send tip state.", v2, v3, v4, v5, v6);
}

void __64__ICQCloudStorageDataController_sendTipState_forTip_completion___block_invoke_36_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to send tip state with error: %@", v2, v3, v4, v5, v6);
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "Method [INDaemon fetchAppsSyncingToiCloudDriveForAltDSID] not implemented yet.", v2, v3, v4, v5, v6);
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1D5851000, v0, v1, "SIGNPOST BEGIN [id: %hu]: AppsSyncingToiCloudDrive  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D5851000, v0, v1, "SIGNPOST END   [id: %hu]: (%.4fs) AppsSyncingToiCloudDrive ", v2, v3, v4, v5, v6);
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_38_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D5851000, v0, v1, "XPC Error while reaching out to daemon to fetch apps syncing to iCloud Drive", v2, v3, v4, v5, v6);
}

void __77__ICQCloudStorageDataController_fetchAppsSyncingToiCloudDriveWithCompletion___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D5851000, v0, v1, "Failed to fetch Apps Syncing to iCloud Drive with error: %@ returning cached result.", v2, v3, v4, v5, v6);
}

@end