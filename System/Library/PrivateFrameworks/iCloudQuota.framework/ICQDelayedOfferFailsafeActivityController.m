@interface ICQDelayedOfferFailsafeActivityController
+ (void)_runWithDaemon:(id)a3 errorCallback:(id)a4;
+ (void)startActivityWithDelaySecs:(int64_t)a3 completion:(id)a4;
+ (void)stopActivityWithCompletion:(id)a3;
@end

@implementation ICQDelayedOfferFailsafeActivityController

+ (void)_runWithDaemon:(id)a3 errorCallback:(id)a4
{
  v5 = (void (**)(id, void *))a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v7 = (void *)getINDaemonConnectionClass_softClass_2;
  uint64_t v23 = getINDaemonConnectionClass_softClass_2;
  if (!getINDaemonConnectionClass_softClass_2)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getINDaemonConnectionClass_block_invoke_2;
    v18 = &unk_1E6A52090;
    v19 = &v20;
    __getINDaemonConnectionClass_block_invoke_2((uint64_t)buf);
    v7 = (void *)v21[3];
  }
  v8 = v7;
  _Block_object_dispose(&v20, 8);
  id v9 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke;
  v13[3] = &unk_1E6A52E78;
  id v14 = v6;
  id v10 = v6;
  v11 = [v9 daemonWithErrorHandler:v13];
  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully fetched the IND XPC Daemon.", buf, 2u);
  }

  v5[2](v5, v11);
}

void __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)startActivityWithDelaySecs:(int64_t)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v13 = a3;
    _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "[SUBD] Delayed offer failsafe will trigger in [%lld secs].", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke;
  v9[3] = &unk_1E6A537E0;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [a1 _runWithDaemon:v9 errorCallback:v8];
}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2;
  v4[3] = &unk_1E6A537B8;
  uint64_t v6 = v3;
  id v5 = *(id *)(a1 + 32);
  [a2 startDelayedOfferFailsafeActivityWithDelaySecs:v3 completion:v4];
}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _ICQGetLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully installed failsafe activity with delaySecs=[%lld].", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)stopActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Clearing up the failsafe activity because subd just called us.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke;
  v7[3] = &unk_1E6A53808;
  id v8 = v4;
  id v6 = v4;
  [a1 _runWithDaemon:v7 errorCallback:v6];
}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6A52E78;
  id v4 = *(id *)(a1 + 32);
  [a2 stopDelayedOfferFailsafeActivityWithCompletion:v3];
}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully stopped the failsafe activity.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__ICQDelayedOfferFailsafeActivityController__runWithDaemon_errorCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "[SUBD] XPC Error while fetching daemon for failsafe activity. error=[%@]", (uint8_t *)&v2, 0xCu);
}

void __83__ICQDelayedOfferFailsafeActivityController_startActivityWithDelaySecs_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "[SUBD] Failed to install failsafe activity with delaySecs=[%lld] with error=[%@]", (uint8_t *)&v4, 0x16u);
}

void __72__ICQDelayedOfferFailsafeActivityController_stopActivityWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "[SUBD] Failed to stop the failsafe activity with error=[%@].", (uint8_t *)&v2, 0xCu);
}

@end