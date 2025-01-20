@interface NPKPaymentPreflighter
+ (BOOL)watchConnected;
- (BOOL)authRandomSetIfNecessary;
- (BOOL)checkedCompanioniCloudStatus;
- (BOOL)checkedWatchPasscodeAndUnlockedStatus;
- (BOOL)checkedWatchiCloudStatus;
- (BOOL)checkedWristDetectionStatus;
- (BOOL)isPreflighting;
- (BOOL)needsCompanioniCloudAccount;
- (BOOL)needsPasscode;
- (BOOL)needsSetAuthRandom;
- (BOOL)needsUnlock;
- (BOOL)needsWatchiCloudAccount;
- (BOOL)needsWristDetection;
- (BOOL)spaceAvailableOnSecureElement;
- (BOOL)watchConnected;
- (NPKCompanionAgentConnection)companionAgentConnection;
- (NPKPaymentPreflighter)initWithWebService:(id)a3 targetDevice:(id)a4 companionAgentConnection:(id)a5;
- (NSDate)watchPasscodeAndUnlockedQueryDate;
- (NSSManager)systemSettingsManager;
- (PKPaymentWebService)webService;
- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (PUConnection)passcodeConnection;
- (id)_errorForCompanionAccountNeeded;
- (id)_errorForConnectionIssue;
- (id)_errorForGenericIssue;
- (id)_errorForGizmoAccountNeeded;
- (id)_errorForPasscodeNeeded;
- (id)_errorForUnlockNeeded;
- (id)_errorForWristDetectNeeded;
- (id)preflightCompletionHandler;
- (void)_checkCompanioniCloudAccount;
- (void)_checkPasscodeEnabledAndUnlockedState;
- (void)_checkPasscodeEnabledAndUnlockedStateRequiringPasscode:(BOOL)a3 requiringUnlock:(BOOL)a4;
- (void)_checkPasscodeEnabledState;
- (void)_checkSpaceAvailableOnSecureElement;
- (void)_checkWatchConnected;
- (void)_checkWatchiCloudAccount;
- (void)_checkWristDetectEnabledState;
- (void)_finishPresentingSetupControllerIfReadyWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_setAuthRandomIfNecessary;
- (void)addBiometricPassPreflightWithCompletion:(id)a3;
- (void)addCardPreflightWithCompletion:(id)a3;
- (void)addSecureElementPassPreflightWithCompletion:(id)a3;
- (void)setAuthRandomSetIfNecessary:(BOOL)a3;
- (void)setCheckedCompanioniCloudStatus:(BOOL)a3;
- (void)setCheckedWatchPasscodeAndUnlockedStatus:(BOOL)a3;
- (void)setCheckedWatchiCloudStatus:(BOOL)a3;
- (void)setCheckedWristDetectionStatus:(BOOL)a3;
- (void)setCompanionAgentConnection:(id)a3;
- (void)setNeedsCompanioniCloudAccount:(BOOL)a3;
- (void)setNeedsPasscode:(BOOL)a3;
- (void)setNeedsSetAuthRandom:(BOOL)a3;
- (void)setNeedsUnlock:(BOOL)a3;
- (void)setNeedsWatchiCloudAccount:(BOOL)a3;
- (void)setNeedsWristDetection:(BOOL)a3;
- (void)setPasscodeConnection:(id)a3;
- (void)setPreflightCompletionHandler:(id)a3;
- (void)setPreflighting:(BOOL)a3;
- (void)setSpaceAvailableOnSecureElement:(BOOL)a3;
- (void)setSystemSettingsManager:(id)a3;
- (void)setTargetDevice:(id)a3;
- (void)setWatchConnected:(BOOL)a3;
- (void)setWatchPasscodeAndUnlockedQueryDate:(id)a3;
- (void)setWebService:(id)a3;
- (void)transferToCompanionPreflightWithCompletion:(id)a3;
@end

@implementation NPKPaymentPreflighter

+ (BOOL)watchConnected
{
  int v2 = NPKIsRunningInNPKCompanionAgent();
  id v3 = objc_alloc(MEMORY[0x263F4A0C0]);
  if (v2) {
    v4 = @"com.apple.private.alloy.passbook.maintenance";
  }
  else {
    v4 = @"com.apple.private.alloy.passbook.provisioning";
  }
  v5 = (void *)[v3 initWithService:v4];
  char v6 = NPKIsConnectedToPairedOrPairingDeviceFromService(v5);

  return v6;
}

- (NPKPaymentPreflighter)initWithWebService:(id)a3 targetDevice:(id)a4 companionAgentConnection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPaymentPreflighter;
  v12 = [(NPKPaymentPreflighter *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webService, a3);
    objc_storeWeak((id *)&v13->_targetDevice, v10);
    objc_storeStrong((id *)&v13->_companionAgentConnection, a5);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v14 = (void *)getPUConnectionClass_softClass;
    uint64_t v25 = getPUConnectionClass_softClass;
    if (!getPUConnectionClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getPUConnectionClass_block_invoke;
      v21[3] = &unk_2644D30F8;
      v21[4] = &v22;
      __getPUConnectionClass_block_invoke((uint64_t)v21);
      v14 = (void *)v23[3];
    }
    v15 = v14;
    _Block_object_dispose(&v22, 8);
    id v16 = objc_alloc_init(v15);
    [(NPKPaymentPreflighter *)v13 setPasscodeConnection:v16];
    id v17 = objc_alloc(MEMORY[0x263F57790]);
    v18 = (void *)[v17 initWithQueue:MEMORY[0x263EF83A0]];
    [(NPKPaymentPreflighter *)v13 setSystemSettingsManager:v18];
    v13->_needsSetAuthRandom = 1;
  }
  return v13;
}

- (void)addCardPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__NPKPaymentPreflighter_addCardPreflightWithCompletion___block_invoke;
  v6[3] = &unk_2644D2E58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __56__NPKPaymentPreflighter_addCardPreflightWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreflighting:1];
  int v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setPreflightCompletionHandler:v2];

  [*(id *)(a1 + 32) _checkSpaceAvailableOnSecureElement];
  [*(id *)(a1 + 32) _checkWatchConnected];
  [*(id *)(a1 + 32) _checkCompanioniCloudAccount];
  [*(id *)(a1 + 32) _checkWatchiCloudAccount];
  [*(id *)(a1 + 32) _checkPasscodeEnabledAndUnlockedState];
  [*(id *)(a1 + 32) _checkWristDetectEnabledState];
  id v3 = *(void **)(a1 + 32);
  return [v3 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
}

- (void)transferToCompanionPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() watchConnected];
  char v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v7)
    {
      v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Transfer to companion preflight: watch is connected", buf, 2u);
      }
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke;
    v17[3] = &unk_2644D2B10;
    id v9 = &v18;
    id v18 = v4;
    id v10 = v4;
    id v11 = MEMORY[0x263EF83A0];
    v12 = v17;
  }
  else
  {
    if (v7)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Transfer to companion preflight: watch is not connected", buf, 2u);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke_54;
    block[3] = &unk_2644D3FF0;
    id v9 = &v16;
    block[4] = self;
    id v16 = v4;
    id v14 = v4;
    id v11 = MEMORY[0x263EF83A0];
    v12 = block;
  }
  dispatch_async(v11, v12);
}

uint64_t __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__NPKPaymentPreflighter_transferToCompanionPreflightWithCompletion___block_invoke_54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _errorForConnectionIssue];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)addSecureElementPassPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__NPKPaymentPreflighter_addSecureElementPassPreflightWithCompletion___block_invoke;
  v6[3] = &unk_2644D2E58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __69__NPKPaymentPreflighter_addSecureElementPassPreflightWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreflighting:1];
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setPreflightCompletionHandler:v2];

  [*(id *)(a1 + 32) _checkSpaceAvailableOnSecureElement];
  [*(id *)(a1 + 32) _checkWatchConnected];
  [*(id *)(a1 + 32) _checkCompanioniCloudAccount];
  [*(id *)(a1 + 32) _checkWatchiCloudAccount];
  [*(id *)(a1 + 32) _checkPasscodeEnabledState];
  [*(id *)(a1 + 32) _checkWristDetectEnabledState];
  id v3 = *(void **)(a1 + 32);
  return [v3 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
}

- (void)addBiometricPassPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__NPKPaymentPreflighter_addBiometricPassPreflightWithCompletion___block_invoke;
  v6[3] = &unk_2644D2E58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __65__NPKPaymentPreflighter_addBiometricPassPreflightWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreflighting:1];
  [*(id *)(a1 + 32) setNeedsSetAuthRandom:0];
  id v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setPreflightCompletionHandler:v2];

  [*(id *)(a1 + 32) _checkSpaceAvailableOnSecureElement];
  [*(id *)(a1 + 32) _checkWatchConnected];
  [*(id *)(a1 + 32) _checkCompanioniCloudAccount];
  [*(id *)(a1 + 32) _checkWatchiCloudAccount];
  [*(id *)(a1 + 32) _checkPasscodeEnabledAndUnlockedState];
  [*(id *)(a1 + 32) _checkWristDetectEnabledState];
  id v3 = *(void **)(a1 + 32);
  return [v3 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
}

- (void)_checkSpaceAvailableOnSecureElement
{
  if (PKEnableDynamicSEAllocation())
  {
    [(NPKPaymentPreflighter *)self setSpaceAvailableOnSecureElement:1];
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    id v3 = [(NPKPaymentPreflighter *)self companionAgentConnection];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke;
    v4[3] = &unk_2644D44A0;
    v4[4] = self;
    [v3 paymentPassUniqueIDsSynchronous:0 excludingDeactivated:1 reply:v4];
  }
}

void __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke_2;
  v6[3] = &unk_2644D2E08;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __60__NPKPaymentPreflighter__checkSpaceAvailableOnSecureElement__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  unint64_t v3 = NPKMaxPaymentCards();
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v6 = v4 || v2 < v3;
  [*(id *)(a1 + 40) setSpaceAvailableOnSecureElement:v6];
  if (v6 == 1)
  {
    id v7 = *(void **)(a1 + 40);
    [v7 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F08A30];
    id v9 = [NSNumber numberWithUnsignedInteger:NPKMaxPaymentCards()];
    id v13 = [v8 localizedStringFromNumber:v9 numberStyle:0];

    id v10 = PKLocalizedPaymentString(&cfstr_DeviceProvisio.isa);
    id v11 = PKLocalizedPaymentString(&cfstr_DeviceProvisio_0.isa, &stru_26CFEED98.isa, v13);
    v12 = PKDisplayableErrorCustom();
    [*(id *)(a1 + 40) _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v12];
  }
}

- (void)_checkWatchConnected
{
  unint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking watch connected state…", buf, 2u);
    }
  }
  uint64_t v6 = [(id)objc_opt_class() watchConnected];
  [(NPKPaymentPreflighter *)self setWatchConnected:v6];
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: gizmo connected", v13, 2u);
      }
    }
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    if (v8)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: gizmo not connected", v12, 2u);
      }
    }
    id v11 = [(NPKPaymentPreflighter *)self _errorForConnectionIssue];
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v11];
  }
}

- (void)_checkCompanioniCloudAccount
{
  unint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking companion iCloud account state…", buf, 2u);
    }
  }
  int v6 = PKHasVerifiedPrimaryAppleAccount();
  [(NPKPaymentPreflighter *)self setNeedsCompanioniCloudAccount:v6 == 0];
  [(NPKPaymentPreflighter *)self setCheckedCompanioniCloudStatus:1];
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: has companion account", v13, 2u);
      }
    }
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    if (v8)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: does not have companion account", v12, 2u);
      }
    }
    id v11 = [(NPKPaymentPreflighter *)self _errorForCompanionAccountNeeded];
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v11];
  }
}

- (void)_checkWatchiCloudAccount
{
  unint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Checking watch iCloud account state…", (uint8_t *)buf, 2u);
    }
  }
  if (NPKIsCurrentlyPairing())
  {
    int v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      BOOL v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Device is pairing", (uint8_t *)buf, 2u);
      }
    }
    [(NPKPaymentPreflighter *)self setCheckedWatchiCloudStatus:1];
    [(NPKPaymentPreflighter *)self setNeedsWatchiCloudAccount:0];
LABEL_17:
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
    return;
  }
  if (NPKPairedOrPairingDeviceIsTinker())
  {
    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Tinker devices are always signed in to iCloud.", (uint8_t *)buf, 2u);
      }
    }
    [(NPKPaymentPreflighter *)self setNeedsWatchiCloudAccount:0];
    [(NPKPaymentPreflighter *)self setCheckedWatchiCloudStatus:1];
    goto LABEL_17;
  }
  objc_initWeak(buf, self);
  v12 = [(NPKPaymentPreflighter *)self systemSettingsManager];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__NPKPaymentPreflighter__checkWatchiCloudAccount__block_invoke;
  v13[3] = &unk_2644D44C8;
  objc_copyWeak(&v14, buf);
  v13[4] = self;
  [v12 getiCloudInfo:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __49__NPKPaymentPreflighter__checkWatchiCloudAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v5;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Got iCloud info: %@ %@", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (!v6)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFB210]);
    v28 = objc_msgSend(v12, "aa_primaryAppleAccount");
    id v13 = objc_msgSend(v28, "aa_personID");
    [v5 objectForKeyedSubscript:*MEMORY[0x263F577B8]];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v26 = v12;
      id v27 = v5;
      uint64_t v17 = *(void *)v30;
      uint64_t v18 = *MEMORY[0x263F577A0];
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_super v20 = [*(id *)(*((void *)&v29 + 1) + 8 * i) objectForKeyedSubscript:v18];
          v21 = pk_Payment_log();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

          if (v22)
          {
            v23 = pk_Payment_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v35 = v20;
              __int16 v36 = 2112;
              id v37 = v28;
              _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Person ID: %@ Local account: %@", buf, 0x16u);
            }
          }
          char v24 = [v20 isEqualToString:v13];

          if (v24)
          {
            uint64_t v25 = 0;
            goto LABEL_22;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      uint64_t v25 = 1;
LABEL_22:
      id v6 = 0;
      id v5 = v27;
      id v12 = v26;
    }
    else
    {
      uint64_t v25 = 1;
    }

    [v11 setNeedsWatchiCloudAccount:v25];
    [v11 setCheckedWatchiCloudStatus:1];
    [v11 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];

    goto LABEL_25;
  }
  if (([WeakRetained checkedWatchiCloudStatus] & 1) == 0)
  {
    id v12 = [*(id *)(a1 + 32) _errorForConnectionIssue];
    [v11 _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v12];
LABEL_25:
  }
}

- (void)_checkPasscodeEnabledAndUnlockedState
{
}

- (void)_checkPasscodeEnabledState
{
}

- (void)_checkPasscodeEnabledAndUnlockedStateRequiringPasscode:(BOOL)a3 requiringUnlock:(BOOL)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v7 = [MEMORY[0x263EFF910] date];
  int v8 = NPKIsCurrentlyPairing();
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Device is pairing", buf, 2u);
      }
    }
    [(NPKPaymentPreflighter *)self setCheckedWatchPasscodeAndUnlockedStatus:1];
    [(NPKPaymentPreflighter *)self setNeedsPasscode:0];
    [(NPKPaymentPreflighter *)self setNeedsUnlock:0];
    [(NPKPaymentPreflighter *)self setAuthRandomSetIfNecessary:1];
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    if (v10)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = v7;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Checking passcode enabled and unlocked state with query date: %@", buf, 0xCu);
      }
    }
    [(NPKPaymentPreflighter *)self setWatchPasscodeAndUnlockedQueryDate:v7];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke;
    v34[3] = &unk_2644D4518;
    v34[4] = self;
    BOOL v35 = a3;
    BOOL v36 = a4;
    id v13 = (void *)MEMORY[0x223C37380](v34);
    int IsTinker = NPKPairedOrPairingDeviceIsTinker();
    uint64_t v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (IsTinker)
    {
      if (v16)
      {
        uint64_t v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Fetching passcode state for tinker device", buf, 2u);
        }
      }
      uint64_t v18 = [(NPKPaymentPreflighter *)self webService];
      v19 = [v18 targetDevice];
      objc_super v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        id v21 = [(NPKPaymentPreflighter *)self targetDevice];
      }
      char v24 = v21;

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_71;
      v32[3] = &unk_2644D4540;
      id v33 = v13;
      [v24 fetchRemoteDevicePasscodeStateWithCompletion:v32];
    }
    else
    {
      if (v16)
      {
        BOOL v22 = pk_Payment_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Fetching passcode state for classic device", buf, 2u);
        }
      }
      v23 = [(NPKPaymentPreflighter *)self passcodeConnection];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_72;
      v30[3] = &unk_2644D4568;
      id v31 = v13;
      [v23 getRemoteDeviceState:v30];

      char v24 = v31;
    }

    objc_initWeak((id *)buf, self);
    dispatch_time_t v25 = dispatch_time(0, 45000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2_74;
    block[3] = &unk_2644D34F0;
    objc_copyWeak(&v29, (id *)buf);
    id v27 = v7;
    v28 = self;
    dispatch_after(v25, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2;
  block[3] = &unk_2644D44F0;
  char v13 = a2;
  char v14 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  __int16 v15 = *(_WORD *)(a1 + 40);
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 48);
      int v6 = *(unsigned __int8 *)(a1 + 49);
      uint64_t v7 = *(void *)(a1 + 32);
      v15[0] = 67109634;
      v15[1] = v5;
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: passcode enabled %d device passcode locked %d error %@", (uint8_t *)v15, 0x18u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    if (([*(id *)(a1 + 40) checkedWatchPasscodeAndUnlockedStatus] & 1) == 0)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = [v8 _errorForConnectionIssue];
      [v8 _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v9];
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 50)) {
      BOOL v10 = *(unsigned char *)(a1 + 48) == 0;
    }
    else {
      BOOL v10 = 0;
    }
    [*(id *)(a1 + 40) setNeedsPasscode:v10];
    if (*(unsigned char *)(a1 + 51)) {
      BOOL v11 = *(unsigned char *)(a1 + 49) != 0;
    }
    else {
      BOOL v11 = 0;
    }
    [*(id *)(a1 + 40) setNeedsUnlock:v11];
    [*(id *)(a1 + 40) setCheckedWatchPasscodeAndUnlockedStatus:1];
    [*(id *)(a1 + 40) _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
    if (([*(id *)(a1 + 40) needsPasscode] & 1) == 0
      && ([*(id *)(a1 + 40) needsUnlock] & 1) == 0)
    {
      uint64_t v12 = pk_Payment_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        char v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Setting auth random if necessary…", (uint8_t *)v15, 2u);
        }
      }
      [*(id *)(a1 + 40) _setAuthRandomIfNecessary];
    }
  }
}

uint64_t __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__NPKPaymentPreflighter__checkPasscodeEnabledAndUnlockedStateRequiringPasscode_requiringUnlock___block_invoke_2_74(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [WeakRetained watchPasscodeAndUnlockedQueryDate];
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      BOOL v13 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: query date %@ now %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = [*(id *)(a1 + 40) watchPasscodeAndUnlockedQueryDate];
  if (![v8 isEqual:*(void *)(a1 + 32)]) {
    goto LABEL_8;
  }
  char v9 = [WeakRetained checkedWatchPasscodeAndUnlockedStatus];

  if ((v9 & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 40) _errorForConnectionIssue];
    [WeakRetained _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v8];
LABEL_8:
  }
}

- (void)_checkWristDetectEnabledState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = NPKPairedOrPairingDevice();
  BOOL v4 = [v3 valueForProperty:*MEMORY[0x263F57598]];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Watch has SEP: %d", buf, 8u);
    }
  }
  if (v5)
  {
    [(NPKPaymentPreflighter *)self setNeedsWristDetection:0];
  }
  else
  {
    char v9 = NPKDomainAccessorForDomain(@"com.apple.Carousel");
    -[NPKPaymentPreflighter setNeedsWristDetection:](self, "setNeedsWristDetection:", [v9 BOOLForKey:@"DisableWristDetection"]);
  }
  [(NPKPaymentPreflighter *)self setCheckedWristDetectionStatus:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKPaymentPreflighter__checkWristDetectEnabledState__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__NPKPaymentPreflighter__checkWristDetectEnabledState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
}

- (void)_setAuthRandomIfNecessary
{
  BOOL v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Setting auth random if necessary at the beginning of the provisioning flow", buf, 2u);
    }
  }
  if ([(NPKPaymentPreflighter *)self needsSetAuthRandom])
  {
    uint64_t v6 = [(NPKPaymentPreflighter *)self webService];
    BOOL v7 = [v6 targetDevice];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(NPKPaymentPreflighter *)self targetDevice];
    }
    int v10 = v9;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke;
    v11[3] = &unk_2644D4590;
    v11[4] = self;
    [v10 setNewAuthRandomIfNecessaryAtBeginningOfProvisioningFlow:v11];
  }
  else
  {
    [(NPKPaymentPreflighter *)self setAuthRandomSetIfNecessary:1];
    [(NPKPaymentPreflighter *)self _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
}

void __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = a2;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Auth random set if necessary (success %d)", buf, 8u);
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke_81;
  v7[3] = &unk_2644D2938;
  char v8 = a2;
  v7[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __50__NPKPaymentPreflighter__setAuthRandomIfNecessary__block_invoke_81(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setAuthRandomSetIfNecessary:1];
    BOOL v3 = *(void **)(a1 + 32);
    [v3 _finishPresentingSetupControllerIfReadyWithSuccess:1 error:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _errorForGenericIssue];
    [v1 _finishPresentingSetupControllerIfReadyWithSuccess:0 error:v4];
  }
}

- (void)_finishPresentingSetupControllerIfReadyWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(NPKPaymentPreflighter *)self isPreflighting];
  if (!v7 || !v4)
  {
    if (!v7) {
      goto LABEL_41;
    }
    goto LABEL_30;
  }
  if ([(NPKPaymentPreflighter *)self checkedWristDetectionStatus]
    && [(NPKPaymentPreflighter *)self needsWristDetection])
  {
    uint64_t v8 = [(NPKPaymentPreflighter *)self _errorForWristDetectNeeded];
LABEL_29:
    id v9 = (void *)v8;

    BOOL v4 = 0;
    id v6 = v9;
    goto LABEL_30;
  }
  if ([(NPKPaymentPreflighter *)self checkedCompanioniCloudStatus]
    && [(NPKPaymentPreflighter *)self needsCompanioniCloudAccount])
  {
    uint64_t v8 = [(NPKPaymentPreflighter *)self _errorForCompanionAccountNeeded];
    goto LABEL_29;
  }
  if ([(NPKPaymentPreflighter *)self checkedWatchiCloudStatus]
    && [(NPKPaymentPreflighter *)self needsWatchiCloudAccount])
  {
    uint64_t v8 = [(NPKPaymentPreflighter *)self _errorForGizmoAccountNeeded];
    goto LABEL_29;
  }
  if ([(NPKPaymentPreflighter *)self checkedWatchPasscodeAndUnlockedStatus]
    && ([(NPKPaymentPreflighter *)self needsPasscode]
     || [(NPKPaymentPreflighter *)self needsUnlock]))
  {
    if ([(NPKPaymentPreflighter *)self needsPasscode]) {
      [(NPKPaymentPreflighter *)self _errorForPasscodeNeeded];
    }
    else {
    uint64_t v8 = [(NPKPaymentPreflighter *)self _errorForUnlockNeeded];
    }
    goto LABEL_29;
  }
  if (![(NPKPaymentPreflighter *)self checkedWatchPasscodeAndUnlockedStatus]
    || ![(NPKPaymentPreflighter *)self checkedCompanioniCloudStatus]
    || ![(NPKPaymentPreflighter *)self checkedWatchiCloudStatus]
    || ![(NPKPaymentPreflighter *)self checkedWristDetectionStatus]
    || ![(NPKPaymentPreflighter *)self watchConnected]
    || ![(NPKPaymentPreflighter *)self spaceAvailableOnSecureElement]
    || ![(NPKPaymentPreflighter *)self authRandomSetIfNecessary])
  {
    goto LABEL_41;
  }
  BOOL v4 = 1;
LABEL_30:
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67112450;
      *(_DWORD *)uint64_t v19 = v4;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v6;
      __int16 v20 = 1024;
      BOOL v21 = [(NPKPaymentPreflighter *)self isPreflighting];
      __int16 v22 = 1024;
      BOOL v23 = [(NPKPaymentPreflighter *)self checkedWatchPasscodeAndUnlockedStatus];
      __int16 v24 = 1024;
      BOOL v25 = [(NPKPaymentPreflighter *)self checkedCompanioniCloudStatus];
      __int16 v26 = 1024;
      BOOL v27 = [(NPKPaymentPreflighter *)self checkedWatchiCloudStatus];
      __int16 v28 = 1024;
      BOOL v29 = [(NPKPaymentPreflighter *)self checkedWristDetectionStatus];
      __int16 v30 = 1024;
      BOOL v31 = [(NPKPaymentPreflighter *)self needsPasscode];
      __int16 v32 = 1024;
      BOOL v33 = [(NPKPaymentPreflighter *)self needsUnlock];
      __int16 v34 = 1024;
      BOOL v35 = [(NPKPaymentPreflighter *)self needsWatchiCloudAccount];
      __int16 v36 = 1024;
      BOOL v37 = [(NPKPaymentPreflighter *)self needsWristDetection];
      __int16 v38 = 1024;
      BOOL v39 = [(NPKPaymentPreflighter *)self watchConnected];
      __int16 v40 = 1024;
      BOOL v41 = [(NPKPaymentPreflighter *)self spaceAvailableOnSecureElement];
      __int16 v42 = 1024;
      BOOL v43 = [(NPKPaymentPreflighter *)self authRandomSetIfNecessary];
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Preflight complete!\n\tsuccess: %d\n\terror: %@\n\tpreflighting: %d\n\tchecked passcode/unlocked: %d\n\tchecked companion iCloud account: %d\n\tchecked watch iCloud account: %d\n\tchecked wrist detect: %d\n\tneedsPasscode: %d\n\tneedsUnlock: %d\n\tneedsGizmoiCloudAccount: %d\n\tneedsWristDetection: %d\n\tgizmo connected: %d\n\tspace available on SE: %d\n\tauth random set if necessary: %d", buf,
        0x5Au);
    }
  }
  uint64_t v13 = [(NPKPaymentPreflighter *)self preflightCompletionHandler];
  uint64_t v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, BOOL, id))(v13 + 16))(v13, v4, v6);
    [(NPKPaymentPreflighter *)self setPreflightCompletionHandler:0];
    [(NPKPaymentPreflighter *)self setPreflighting:0];
  }
  else
  {
    __int16 v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      int v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v19 = "-[NPKPaymentPreflighter _finishPresentingSetupControllerIfReadyWithSuccess:error:]";
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Warning: %s Unexpected. No completion handler available", buf, 0xCu);
      }
    }
  }

LABEL_41:
}

- (id)_errorForWristDetectNeeded
{
  v21[2] = *MEMORY[0x263EF8340];
  int IsTinker = NPKPairedOrPairingDeviceIsTinker();
  BOOL v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F5C538];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x263F08338];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"WRIST_DETECT_REQUIRED_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v21[0] = v6;
    v20[1] = *MEMORY[0x263F08348];
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"WRIST_DETECT_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v21[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    int v10 = [v3 errorWithDomain:v4 code:0 userInfo:v9];
  }
  else
  {
    v18[0] = *MEMORY[0x263F08338];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v16 = v3;
    id v6 = [v5 localizedStringForKey:@"WRIST_DETECT_REQUIRED_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v19[0] = v6;
    v18[1] = *MEMORY[0x263F08348];
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"WRIST_DETECT_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v19[1] = v8;
    v18[2] = *MEMORY[0x263F08340];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v11 = [v9 localizedStringForKey:@"WRIST_DETECT_REQUIRED_ALERT_BUTTON" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    int v17 = v11;
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v19[2] = v12;
    v18[3] = *MEMORY[0x263F5C588];
    uint64_t v13 = [NSURL URLWithString:@"bridge:root=PASSCODE_ID"];
    v19[3] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    int v10 = [v16 errorWithDomain:v4 code:0 userInfo:v14];
  }
  return v10;
}

- (id)_errorForGizmoAccountNeeded
{
  v21[2] = *MEMORY[0x263EF8340];
  int IsTinker = NPKPairedOrPairingDeviceIsTinker();
  BOOL v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F5C538];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x263F08338];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"GIZMO_ACCOUNT_REQUIRED_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v21[0] = v6;
    v20[1] = *MEMORY[0x263F08348];
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"GIZMO_ACCOUNT_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v21[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    int v10 = [v3 errorWithDomain:v4 code:0 userInfo:v9];
  }
  else
  {
    v18[0] = *MEMORY[0x263F08338];
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v16 = v3;
    id v6 = [v5 localizedStringForKey:@"GIZMO_ACCOUNT_REQUIRED_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v19[0] = v6;
    v18[1] = *MEMORY[0x263F08348];
    BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"GIZMO_ACCOUNT_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v19[1] = v8;
    v18[2] = *MEMORY[0x263F08340];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v11 = [v9 localizedStringForKey:@"GIZMO_ACCOUNT_REQUIRED_ALERT_BUTTON" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    int v17 = v11;
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    v19[2] = v12;
    v18[3] = *MEMORY[0x263F5C588];
    uint64_t v13 = [NSURL URLWithString:@"bridge:root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK"];
    v19[3] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    int v10 = [v16 errorWithDomain:v4 code:0 userInfo:v14];
  }
  return v10;
}

- (id)_errorForPasscodeNeeded
{
  v21[2] = *MEMORY[0x263EF8340];
  int IsTinker = NPKPairedOrPairingDeviceIsTinker();
  BOOL v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F5C538];
  if (IsTinker)
  {
    v20[0] = *MEMORY[0x263F08338];
    BOOL v5 = PKLocalizedPaymentString(&cfstr_PasscodeRequir.isa);
    v21[0] = v5;
    v20[1] = *MEMORY[0x263F08348];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"PASSCODE_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v21[1] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v9 = [v3 errorWithDomain:v4 code:0 userInfo:v8];
  }
  else
  {
    v18[0] = *MEMORY[0x263F08338];
    BOOL v5 = PKLocalizedPaymentString(&cfstr_PasscodeRequir.isa);
    v19[0] = v5;
    v18[1] = *MEMORY[0x263F08348];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v7 = [v6 localizedStringForKey:@"PASSCODE_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    v19[1] = v7;
    v18[2] = *MEMORY[0x263F08340];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v10 = [v8 localizedStringForKey:@"PASSCODE_REQUIRED_ALERT_BUTTON" value:&stru_26CFEBA18 table:@"NanoPassKit"];
    int v17 = v10;
    BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    uint64_t v12 = *MEMORY[0x263F5C540];
    v19[2] = v11;
    v19[3] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263F5C588];
    v18[3] = v12;
    void v18[4] = v13;
    uint64_t v14 = [NSURL URLWithString:@"bridge:root=PASSCODE_ID"];
    void v19[4] = v14;
    __int16 v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
    id v9 = [v3 errorWithDomain:v4 code:0 userInfo:v15];
  }
  return v9;
}

- (id)_errorForUnlockNeeded
{
  v12[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F5C538];
  v11[0] = *MEMORY[0x263F08338];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = [v4 localizedStringForKey:@"UNLOCK_REQUIRED_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
  v12[0] = v5;
  v11[1] = *MEMORY[0x263F08348];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"UNLOCK_REQUIRED_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
  v12[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [v2 errorWithDomain:v3 code:0 userInfo:v8];

  return v9;
}

- (id)_errorForCompanionAccountNeeded
{
  return (id)PKDisplayableErrorForCommonType();
}

- (id)_errorForGenericIssue
{
  return (id)PKDisplayableErrorForCommonType();
}

- (id)_errorForConnectionIssue
{
  v12[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F5C538];
  v11[0] = *MEMORY[0x263F08338];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = [v4 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_TITLE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
  v12[0] = v5;
  v11[1] = *MEMORY[0x263F08348];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_MESSAGE" value:&stru_26CFEBA18 table:@"NanoPassKit"];
  v12[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [v2 errorWithDomain:v3 code:0 userInfo:v8];

  return v9;
}

- (PUConnection)passcodeConnection
{
  return self->_passcodeConnection;
}

- (void)setPasscodeConnection:(id)a3
{
}

- (NSSManager)systemSettingsManager
{
  return self->_systemSettingsManager;
}

- (void)setSystemSettingsManager:(id)a3
{
}

- (BOOL)checkedWatchPasscodeAndUnlockedStatus
{
  return self->_checkedWatchPasscodeAndUnlockedStatus;
}

- (void)setCheckedWatchPasscodeAndUnlockedStatus:(BOOL)a3
{
  self->_checkedWatchPasscodeAndUnlockedStatus = a3;
}

- (BOOL)checkedCompanioniCloudStatus
{
  return self->_checkedCompanioniCloudStatus;
}

- (void)setCheckedCompanioniCloudStatus:(BOOL)a3
{
  self->_checkedCompanioniCloudStatus = a3;
}

- (BOOL)checkedWatchiCloudStatus
{
  return self->_checkedWatchiCloudStatus;
}

- (void)setCheckedWatchiCloudStatus:(BOOL)a3
{
  self->_checkedWatchiCloudStatus = a3;
}

- (BOOL)checkedWristDetectionStatus
{
  return self->_checkedWristDetectionStatus;
}

- (void)setCheckedWristDetectionStatus:(BOOL)a3
{
  self->_checkedWristDetectionStatus = a3;
}

- (BOOL)authRandomSetIfNecessary
{
  return self->_authRandomSetIfNecessary;
}

- (void)setAuthRandomSetIfNecessary:(BOOL)a3
{
  self->_authRandomSetIfNecessary = a3;
}

- (BOOL)watchConnected
{
  return self->_watchConnected;
}

- (void)setWatchConnected:(BOOL)a3
{
  self->_watchConnected = a3;
}

- (BOOL)spaceAvailableOnSecureElement
{
  return self->_spaceAvailableOnSecureElement;
}

- (void)setSpaceAvailableOnSecureElement:(BOOL)a3
{
  self->_spaceAvailableOnSecureElement = a3;
}

- (BOOL)needsPasscode
{
  return self->_needsPasscode;
}

- (void)setNeedsPasscode:(BOOL)a3
{
  self->_needsPasscode = a3;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  self->_needsUnlock = a3;
}

- (BOOL)needsCompanioniCloudAccount
{
  return self->_needsCompanioniCloudAccount;
}

- (void)setNeedsCompanioniCloudAccount:(BOOL)a3
{
  self->_needsCompanioniCloudAccount = a3;
}

- (BOOL)needsWatchiCloudAccount
{
  return self->_needsWatchiCloudAccount;
}

- (void)setNeedsWatchiCloudAccount:(BOOL)a3
{
  self->_needsWatchiCloudAccount = a3;
}

- (BOOL)needsWristDetection
{
  return self->_needsWristDetection;
}

- (void)setNeedsWristDetection:(BOOL)a3
{
  self->_needsWristDetection = a3;
}

- (BOOL)needsSetAuthRandom
{
  return self->_needsSetAuthRandom;
}

- (void)setNeedsSetAuthRandom:(BOOL)a3
{
  self->_needsSetAuthRandom = a3;
}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDevice);
  return (PKPaymentWebServiceTargetDeviceProtocol *)WeakRetained;
}

- (void)setTargetDevice:(id)a3
{
}

- (NPKCompanionAgentConnection)companionAgentConnection
{
  return self->_companionAgentConnection;
}

- (void)setCompanionAgentConnection:(id)a3
{
}

- (BOOL)isPreflighting
{
  return self->_preflighting;
}

- (void)setPreflighting:(BOOL)a3
{
  self->_preflighting = a3;
}

- (NSDate)watchPasscodeAndUnlockedQueryDate
{
  return self->_watchPasscodeAndUnlockedQueryDate;
}

- (void)setWatchPasscodeAndUnlockedQueryDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchPasscodeAndUnlockedQueryDate, 0);
  objc_storeStrong((id *)&self->_companionAgentConnection, 0);
  objc_destroyWeak((id *)&self->_targetDevice);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
  objc_storeStrong((id *)&self->_systemSettingsManager, 0);
  objc_storeStrong((id *)&self->_passcodeConnection, 0);
}

@end