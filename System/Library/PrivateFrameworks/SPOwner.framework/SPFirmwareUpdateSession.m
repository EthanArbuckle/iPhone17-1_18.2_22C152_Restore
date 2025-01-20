@interface SPFirmwareUpdateSession
- (FMFuture)sessionInvalidationFuture;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPFirmwareUpdateSession)init;
- (id)proxy;
- (id)remoteInterface;
- (id)serviceDescription;
- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)candidateBeaconsWithCompletion:(id)a3;
- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5;
- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4;
- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidationFuture:(id)a3;
- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7;
@end

@implementation SPFirmwareUpdateSession

- (SPFirmwareUpdateSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPFirmwareUpdateSession;
  v2 = [(SPFirmwareUpdateSession *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchparty.firmwareupdatesession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)candidateBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E601C400;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling firmwareUpdateCandidateBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke(id *a1)
{
  v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_2;
  block[3] = &unk_1E601CDC8;
  objc_copyWeak(&v6, a1 + 6);
  id v3 = a1[5];
  block[4] = a1[4];
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained proxy];

  id v4 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E601CA18;
  id v15 = a1[5];
  id v5 = (id)[v4 addCompletionBlock:v14];
  id v6 = [a1[4] sessionInvalidationFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_4;
  v12[3] = &unk_1E601CD78;
  id v7 = v4;
  id v13 = v7;
  id v8 = (id)[v6 addSuccessBlock:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_5;
  v10[3] = &unk_1E601CDA0;
  id v11 = v7;
  id v9 = v7;
  [v3 firmwareUpdateCandidateBeaconsWithCompletion:v10];
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

uint64_t __58__SPFirmwareUpdateSession_candidateBeaconsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke;
  v14[3] = &unk_1E601CE40;
  void v14[4] = self;
  objc_copyWeak(&v18, &location);
  id v16 = v9;
  id v17 = v10;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2;
  block[3] = &unk_1E601CE18;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v9 = v3;
  block[4] = v4;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v10);
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained proxy];

  uint64_t v4 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3;
  v16[3] = &unk_1E601CA18;
  id v17 = *(id *)(a1 + 56);
  id v5 = (id)[v4 addCompletionBlock:v16];
  id v6 = [*(id *)(a1 + 32) sessionInvalidationFuture];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4;
  v14[3] = &unk_1E601CD78;
  id v7 = v4;
  id v15 = v7;
  id v8 = (id)[v6 addSuccessBlock:v14];

  v18[0] = *(void *)(a1 + 40);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v10 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_5;
  v12[3] = &unk_1E601CDF0;
  id v13 = v7;
  id v11 = v7;
  [v3 commandKeysForUUIDs:v9 dateInterval:v10 completion:v12];
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_6;
  v6[3] = &unk_1E601CB30;
  id v7 = v4;
  id v5 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  [*(id *)(a1 + 32) finishWithResult:v5];
}

void __81__SPFirmwareUpdateSession_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:v5];
}

- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke;
  v20[3] = &unk_1E601CEE0;
  v20[4] = self;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a4;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v24 = v15;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling updateBeaconUUID:firmwareUpdateState:systemVersion:error:completion:", OS_ACTIVITY_FLAG_DEFAULT, v20);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_2;
  block[3] = &unk_1E601CEB8;
  objc_copyWeak(v13, (id *)(a1 + 72));
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v12 = v3;
  block[4] = v4;
  id v6 = v5;
  id v7 = *(void **)(a1 + 80);
  id v9 = v6;
  v13[1] = v7;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

  objc_destroyWeak(v13);
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [WeakRetained proxy];

  uint64_t v4 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_3;
  v18[3] = &unk_1E601CE68;
  id v19 = *(id *)(a1 + 64);
  id v5 = (id)[v4 addCompletionBlock:v18];
  id v6 = [*(id *)(a1 + 32) sessionInvalidationFuture];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_4;
  v16[3] = &unk_1E601CD78;
  id v7 = v4;
  id v17 = v7;
  id v8 = (id)[v6 addSuccessBlock:v16];

  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_5;
  v14[3] = &unk_1E601CE90;
  id v15 = v7;
  id v13 = v7;
  [v3 updateBeaconUUID:v10 firmwareUpdateState:v9 systemVersion:v11 error:v12 completion:v14];
}

uint64_t __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    [a2 BOOLValue];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

void __95__SPFirmwareUpdateSession_updateBeaconUUID_firmwareUpdateState_systemVersion_error_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke;
  v12[3] = &unk_1E601CF30;
  void v12[4] = self;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  id v13 = v8;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling beaconsInFirmwareUpdateState:since:completion:", OS_ACTIVITY_FLAG_DEFAULT, v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_2;
  block[3] = &unk_1E601CF08;
  objc_copyWeak(v9, (id *)(a1 + 56));
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  block[4] = v4;
  v9[1] = *(id *)(a1 + 64);
  id v7 = v5;
  dispatch_async(v2, block);

  objc_destroyWeak(v9);
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained proxy];

  uint64_t v4 = objc_opt_new();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_3;
  v16[3] = &unk_1E601CA18;
  id v17 = *(id *)(a1 + 48);
  id v5 = (id)[v4 addCompletionBlock:v16];
  id v6 = [*(id *)(a1 + 32) sessionInvalidationFuture];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_4;
  v14[3] = &unk_1E601CD78;
  id v7 = v4;
  id v15 = v7;
  id v8 = (id)[v6 addSuccessBlock:v14];

  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_5;
  v12[3] = &unk_1E601CDA0;
  id v13 = v7;
  id v11 = v7;
  [v3 beaconsInFirmwareUpdateState:v9 dateInterval:v10 completion:v12];
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

uint64_t __80__SPFirmwareUpdateSession_beaconsInFirmwareUpdateState_dateInterval_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke;
  v6[3] = &unk_1E601C400;
  void v6[4] = self;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke(id *a1)
{
  id v2 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_2;
  block[3] = &unk_1E601CDC8;
  objc_copyWeak(&v6, a1 + 6);
  id v3 = a1[5];
  block[4] = a1[4];
  id v5 = v3;
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained proxy];

  id v4 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E601CE68;
  id v15 = a1[5];
  id v5 = (id)[v4 addCompletionBlock:v14];
  id v6 = [a1[4] sessionInvalidationFuture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_4;
  v12[3] = &unk_1E601CD78;
  id v7 = v4;
  id v13 = v7;
  id v8 = (id)[v6 addSuccessBlock:v12];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_5;
  v10[3] = &unk_1E601CE90;
  id v11 = v7;
  id v9 = v7;
  [v3 initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:v10];
}

uint64_t __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    [a2 BOOLValue];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

void __85__SPFirmwareUpdateSession_initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke;
  activity_block[3] = &unk_1E601CFD0;
  activity_block[4] = self;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  _os_activity_initiate(&dword_1B2FD8000, "SPFirmwareUpdateSession: Calling firmwareUpdateStateForBeaconUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_2;
  v6[3] = &unk_1E601CFA8;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void v6[4] = v4;
  id v7 = v5;
  dispatch_async(v2, v6);

  objc_destroyWeak(&v9);
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained proxy];

  uint64_t v4 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_3;
  v15[3] = &unk_1E601CF58;
  id v16 = *(id *)(a1 + 48);
  id v5 = (id)[v4 addCompletionBlock:v15];
  id v6 = [*(id *)(a1 + 32) sessionInvalidationFuture];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_4;
  v13[3] = &unk_1E601CD78;
  id v7 = v4;
  id v14 = v7;
  id v8 = (id)[v6 addSuccessBlock:v13];

  uint64_t v9 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_5;
  v11[3] = &unk_1E601CF80;
  id v12 = v7;
  id v10 = v7;
  [v3 firmwareUpdateStateForBeaconUUID:v9 completion:v11];
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  id v6 = objc_opt_new();
  [v6 setState:-1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.searchpartyd.SPFirmwareUpdate.ErrorDomain" code:2 userInfo:0];
  [v1 finishWithError:v2];
}

uint64_t __71__SPFirmwareUpdateSession_firmwareUpdateStateForBeaconUUID_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (id)proxy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPFirmwareUpdateSession *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SPFirmwareUpdateSession *)self session];

  if (!v4)
  {
    id v5 = [(SPFirmwareUpdateSession *)self serviceDescription];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F61590]) initWithServiceDescription:v5];
    [(SPFirmwareUpdateSession *)self setSession:v6];

    id v7 = LogCategory_FirmwareUpdate();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 machService];
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPFirmwareUpdateSession: Establishing XPC connection to %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = [(SPFirmwareUpdateSession *)self session];
    [v9 resume];
  }
  id v10 = [(SPFirmwareUpdateSession *)self session];
  id v11 = [v10 proxy];

  return v11;
}

- (id)serviceDescription
{
  id v3 = objc_opt_new();
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, v3);
  id v4 = objc_alloc(MEMORY[0x1E4F61588]);
  id v5 = [(SPFirmwareUpdateSession *)self remoteInterface];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SPFirmwareUpdateSession_serviceDescription__block_invoke;
  v11[3] = &unk_1E601B8D0;
  id v12 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v9[2] = __45__SPFirmwareUpdateSession_serviceDescription__block_invoke_2;
  v9[3] = &unk_1E601B8D0;
  id v10 = v12;
  id v6 = v12;
  id v7 = (void *)[v4 initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconmanager" options:0 remoteObjectInterface:v5 interruptionHandler:v11 invalidationHandler:v9];

  return v7;
}

void __45__SPFirmwareUpdateSession_serviceDescription__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  FMEmptyResult();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2];
}

void __45__SPFirmwareUpdateSession_serviceDescription__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  FMEmptyResult();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2];
}

- (id)remoteInterface
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44050];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_commandKeysForUUIDs_dateInterval_completion_ argumentIndex:0 ofReply:1];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_firmwareUpdateCandidateBeaconsWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_beaconsInFirmwareUpdateState_dateInterval_completion_ argumentIndex:0 ofReply:1];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  id v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_firmwareUpdateStateForBeaconUUID_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMFuture)sessionInvalidationFuture
{
  return self->_sessionInvalidationFuture;
}

- (void)setSessionInvalidationFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end