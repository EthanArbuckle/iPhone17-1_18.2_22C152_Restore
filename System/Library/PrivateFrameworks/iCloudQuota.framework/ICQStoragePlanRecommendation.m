@interface ICQStoragePlanRecommendation
+ (id)_requestQueue;
- (ACAccount)account;
- (ICQStoragePlanRecommendation)initWithAccount:(id)a3;
- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4;
- (void)setAccount:(id)a3;
@end

@implementation ICQStoragePlanRecommendation

- (ICQStoragePlanRecommendation)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQStoragePlanRecommendation;
  v6 = [(ICQStoragePlanRecommendation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

+ (id)_requestQueue
{
  if (_requestQueue_onceToken != -1) {
    dispatch_once(&_requestQueue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_requestQueue_requestQueue;
  return v2;
}

void __45__ICQStoragePlanRecommendation__requestQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("quota.plan.recommendation.request", v2);
  v1 = (void *)_requestQueue_requestQueue;
  _requestQueue_requestQueue = (uint64_t)v0;
}

- (void)calculateExtraQuotaNeededToSyncIsAccountFull:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(id)objc_opt_class() _requestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke;
  block[3] = &unk_1E6A522D0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke(uint64_t a1)
{
  v2 = +[ICQStoragePlanRecommendationCache sharedInstance];
  v3 = [v2 extraQuotaNeeded];

  v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Returning cached storage recommendation data.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v4, OS_LOG_TYPE_DEFAULT, "Cache does not exist or expired. Reaching out to daemon to calculate and return estimated total quota usage after turning on all apps.", buf, 2u);
    }

    id v6 = _ICQSignpostLogSystem();
    v7 = objc_opt_new();
    os_signpost_id_t v8 = _ICQSignpostCreateWithObject(v6, v7);
    uint64_t v10 = v9;

    BOOL v11 = _ICQSignpostLogSystem();
    v12 = v11;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TotalQuotaUsageAfterTurnOnSync", " enableTelemetry=YES ", buf, 2u);
    }

    v13 = _ICQSignpostLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(v8, v13);
    }

    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2050000000;
    v14 = (void *)getINDaemonConnectionClass_softClass;
    uint64_t v37 = getINDaemonConnectionClass_softClass;
    if (!getINDaemonConnectionClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __getINDaemonConnectionClass_block_invoke;
      v32 = &unk_1E6A52090;
      v33 = &v34;
      __getINDaemonConnectionClass_block_invoke((uint64_t)buf);
      v14 = (void *)v35[3];
    }
    v15 = v14;
    _Block_object_dispose(&v34, 8);
    id v16 = objc_alloc_init(v15);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3;
    v25[3] = &unk_1E6A52280;
    os_signpost_id_t v27 = v8;
    uint64_t v28 = v10;
    id v26 = *(id *)(a1 + 40);
    v17 = [v16 synchronousDaemonWithErrorHandler:v25];
    v18 = [*(id *)(a1 + 32) account];
    v19 = objc_msgSend(v18, "aa_altDSID");
    uint64_t v20 = *(unsigned __int8 *)(a1 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5;
    v21[3] = &unk_1E6A522A8;
    os_signpost_id_t v23 = v8;
    uint64_t v24 = v10;
    id v22 = *(id *)(a1 + 40);
    [v17 calculateExtraQuotaNeededToSyncForAccountWithID:v19 isAccountFull:v20 completion:v21];
  }
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_2(v4);
  }

  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  BOOL v5 = _ICQSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v6, OS_SIGNPOST_INTERVAL_END, v7, "TotalQuotaUsageAfterTurnOnSync", "", v9, 2u);
  }

  os_signpost_id_t v8 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[ICQStoragePlanRecommendation calculateExtraQuotaNeededToSyncIsAccountFull:completion:]_block_invoke";
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "%s request completed.", (uint8_t *)&v15, 0xCu);
  }

  if (v6)
  {
    os_signpost_id_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5_cold_2((uint64_t)v6, v8);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    os_signpost_id_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    uint64_t v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = (const char *)v8;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Caching storage recommendation result with expiry: %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v10 = +[ICQStoragePlanRecommendationCache sharedInstance];
    [v10 setExtraQuotaNeeded:v5 expiry:v8];

    goto LABEL_10;
  }
LABEL_11:
  _ICQSignpostGetNanoseconds(a1[5], a1[6]);
  BOOL v11 = _ICQSignpostLogSystem();
  v12 = v11;
  os_signpost_id_t v13 = a1[5];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v12, OS_SIGNPOST_INTERVAL_END, v13, "TotalQuotaUsageAfterTurnOnSync", "", (uint8_t *)&v15, 2u);
  }

  v14 = _ICQSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_cold_1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "SIGNPOST BEGIN [id: %hu]: TotalQuotaUsageAfterTurnOnSync  enableTelemetry=YES ", (uint8_t *)v2, 8u);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1D5851000, v0, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) TotalQuotaUsageAfterTurnOnSync ", v1, 0x12u);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_3_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "XPC Error while fetching total quota usage.", v1, 2u);
}

void __88__ICQStoragePlanRecommendation_calculateExtraQuotaNeededToSyncIsAccountFull_completion___block_invoke_5_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch total quota usage with error: %@", (uint8_t *)&v2, 0xCu);
}

@end