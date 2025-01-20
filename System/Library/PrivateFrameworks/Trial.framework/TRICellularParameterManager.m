@interface TRICellularParameterManager
+ (id)sharedInstance;
- (NSString)carrierBundleIdentifier;
- (NSString)carrierCountryIsoCode;
- (TRICellularParameterManager)init;
- (id)_dispatchQueueForCarrierInfoGathering;
- (id)_fetchCarrierBundleIdentifier:(id)a3;
- (id)_fetchCarrierCountryIsoCode:(id)a3;
- (void)_updateSystemInfo;
- (void)carrierBundleChange:(id)a3;
- (void)preferredDataSimChanged:(id)a3;
- (void)setCarrierBundleIdentifier:(id)a3;
- (void)setCarrierCountryIsoCode:(id)a3;
- (void)subscriberCountryCodeDidChange:(id)a3;
@end

@implementation TRICellularParameterManager

- (TRICellularParameterManager)init
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)TRICellularParameterManager;
  v3 = [(TRICellularParameterManager *)&v25 init];
  if (v3)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v4 = (void *)getCoreTelephonyClientClass_softClass;
    uint64_t v29 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v31 = __getCoreTelephonyClientClass_block_invoke;
      v32 = &unk_1E596AD58;
      v33 = &v26;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&buf);
      v4 = (void *)v27[3];
    }
    v5 = v4;
    _Block_object_dispose(&v26, 8);
    if (!v5)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v3 file:@"TRICellularParameterManager.m" lineNumber:60 description:@"Unable to load soft-linked CoreTelephonyClient class"];
    }
    id v6 = [v5 alloc];
    v7 = [(TRICellularParameterManager *)v3 _dispatchQueueForCarrierInfoGathering];
    uint64_t v8 = [v6 initWithQueue:v7];
    telephonyClient = v3->_telephonyClient;
    v3->_telephonyClient = (CoreTelephonyClient *)v8;

    v10 = v3->_telephonyClient;
    id v24 = 0;
    v11 = [(CoreTelephonyClient *)v10 getPreferredDataSubscriptionContextSync:&v24];
    id v12 = v24;
    if (!v11)
    {
      v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    v14 = objc_opt_new();
    uint64_t v15 = [(TRICellularParameterManager *)v3 _fetchCarrierBundleIdentifier:v11];
    v16 = (void *)v14[1];
    v14[1] = v15;

    uint64_t v17 = [(TRICellularParameterManager *)v3 _fetchCarrierCountryIsoCode:v11];
    v18 = (void *)v14[2];
    v14[2] = v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v14];
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v19;

    [(CoreTelephonyClient *)v3->_telephonyClient setDelegate:v3];
    v21 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19D909000, v21, OS_LOG_TYPE_DEFAULT, "Set up TRICellularParameterManager", (uint8_t *)&buf, 2u);
    }
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1EB3B78E0 != -1) {
    dispatch_once(&qword_1EB3B78E0, &__block_literal_global_19);
  }
  v2 = (void *)_MergedGlobals_15;
  return v2;
}

void __45__TRICellularParameterManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = objc_alloc_init(TRICellularParameterManager);
  v2 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v1;
}

- (id)_dispatchQueueForCarrierInfoGathering
{
  if (qword_1EB3B78F0 != -1) {
    dispatch_once(&qword_1EB3B78F0, &__block_literal_global_24);
  }
  v2 = (void *)qword_1EB3B78E8;
  return v2;
}

void __68__TRICellularParameterManager__dispatchQueueForCarrierInfoGathering__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.system-config.carrier" qosClass:17];
  v2 = (void *)qword_1EB3B78E8;
  qword_1EB3B78E8 = v1;
}

- (NSString)carrierBundleIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = &stru_1EEFB6D68;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__TRICellularParameterManager_carrierBundleIdentifier__block_invoke;
  v5[3] = &unk_1E596B270;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __54__TRICellularParameterManager_carrierBundleIdentifier__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (NSString)carrierCountryIsoCode
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = &stru_1EEFB6D68;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__TRICellularParameterManager_carrierCountryIsoCode__block_invoke;
  v5[3] = &unk_1E596B270;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __52__TRICellularParameterManager_carrierCountryIsoCode__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)_fetchCarrierBundleIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    uint64_t v6 = (void *)getCTBundleClass_softClass;
    uint64_t v22 = getCTBundleClass_softClass;
    if (!getCTBundleClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v24 = __getCTBundleClass_block_invoke;
      objc_super v25 = &unk_1E596AD58;
      uint64_t v26 = &v19;
      __getCTBundleClass_block_invoke((uint64_t)&buf);
      uint64_t v6 = (void *)v20[3];
    }
    v7 = v6;
    _Block_object_dispose(&v19, 8);
    if (!v7)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"TRICellularParameterManager.m" lineNumber:117 description:@"Unable to load soft-linked CTBundle class"];
    }
    uint64_t v8 = (void *)[[v7 alloc] initWithBundleType:1];
    telephonyClient = self->_telephonyClient;
    id v18 = 0;
    v10 = (__CFString *)[(CoreTelephonyClient *)telephonyClient copyBundleIdentifier:v5 bundleType:v8 error:&v18];
    v11 = v18;
    id v12 = TRILogCategory_ClientFramework();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Unable to get carrier bundle identifier: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v14 = &stru_1EEFB6D68;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_19D909000, v13, OS_LOG_TYPE_DEFAULT, "Fetched Carrier bundle identifier from CoreTelephony: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v15 = &stru_1EEFB6D68;
      if (v10) {
        uint64_t v15 = v10;
      }
      v14 = v15;
    }
  }
  else
  {
    v11 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context", (uint8_t *)&buf, 2u);
    }
    v14 = &stru_1EEFB6D68;
  }

  return v14;
}

- (id)_fetchCarrierCountryIsoCode:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    telephonyClient = self->_telephonyClient;
    id v16 = 0;
    id v5 = (void *)[(CoreTelephonyClient *)telephonyClient copyLastKnownMobileSubscriberCountryCode:a3 error:&v16];
    uint64_t v6 = v16;
    if (v5)
    {
      v7 = self->_telephonyClient;
      uint64_t v15 = v6;
      uint64_t v8 = [(CoreTelephonyClient *)v7 copyMobileSubscriberIsoCountryCode:v5 error:&v15];
      v9 = v15;

      v10 = TRILogCategory_ClientFramework();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v18 = v9;
          _os_log_error_impl(&dword_19D909000, v11, OS_LOG_TYPE_ERROR, "Unable to get carrier country code: %{public}@", buf, 0xCu);
        }

        id v12 = &stru_1EEFB6D68;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v18 = v8;
          _os_log_impl(&dword_19D909000, v11, OS_LOG_TYPE_DEFAULT, "Fetched Carrier country code from CoreTelephony: %{public}@", buf, 0xCu);
        }

        v13 = &stru_1EEFB6D68;
        if (v8) {
          v13 = (__CFString *)v8;
        }
        id v12 = v13;
        v9 = 0;
      }
    }
    else
    {
      uint64_t v8 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v18 = v6;
        _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "Unable to get last known mobile subscriber country code: %{public}@", buf, 0xCu);
      }
      id v12 = &stru_1EEFB6D68;
      v9 = v6;
    }
  }
  else
  {
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Unable to get preferred data subscription context", buf, 2u);
    }
    id v12 = &stru_1EEFB6D68;
  }

  return v12;
}

- (void)preferredDataSimChanged:(id)a3
{
  id v5 = a3;
  uint64_t v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: preferredDataSimChanged", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__TRICellularParameterManager_preferredDataSimChanged___block_invoke;
  id v12 = &unk_1E596B298;
  v13 = self;
  id v14 = v5;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:&v9];
  [(TRICellularParameterManager *)self _updateSystemInfo];
}

void __55__TRICellularParameterManager_preferredDataSimChanged___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = a2;
  uint64_t v5 = [v2 _fetchCarrierBundleIdentifier:v3];
  id v6 = (id)v4[1];
  v4[1] = v5;
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
  id v5 = a3;
  id v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: subscriberCountryCodeDidChange", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __62__TRICellularParameterManager_subscriberCountryCodeDidChange___block_invoke;
  id v12 = &unk_1E596B298;
  v13 = self;
  id v14 = v5;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:&v9];
  [(TRICellularParameterManager *)self _updateSystemInfo];
}

void __62__TRICellularParameterManager_subscriberCountryCodeDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = a2;
  uint64_t v5 = [v2 _fetchCarrierCountryIsoCode:v3];
  id v6 = (id)v4[2];
  v4[2] = v5;
}

- (void)carrierBundleChange:(id)a3
{
  id v5 = a3;
  id v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "Received delegate callback: carrierBundleChange", buf, 2u);
  }

  objc_storeStrong((id *)&self->_subscriptionContext, a3);
  lock = self->_lock;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __51__TRICellularParameterManager_carrierBundleChange___block_invoke;
  id v12 = &unk_1E596B298;
  v13 = self;
  id v14 = v5;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:&v9];
  [(TRICellularParameterManager *)self _updateSystemInfo];
}

void __51__TRICellularParameterManager_carrierBundleChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = a2;
  uint64_t v5 = [v2 _fetchCarrierBundleIdentifier:v3];
  id v6 = (id)v4[1];
  v4[1] = v5;
}

- (void)_updateSystemInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (+[TRIProcessInfo hostingProcessIsTriald])
  {
    v2 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19D909000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to update System info due to cellular parameter change", (uint8_t *)&v10, 2u);
    }

    uint64_t v3 = +[TRIClient clientWithIdentifier:1];
    v4 = +[TRISystemInfo createSystemInfoWithFactorProvider:v3];
    uint64_t v5 = v4;
    if (v4 && ([v4 save] & 1) != 0)
    {
      id v6 = +[TRIStandardPaths sharedSystemPaths];
      v7 = [[TRISystemConfiguration alloc] initWithPaths:v6];
      id v8 = [(TRISystemConfiguration *)v7 reloadSystemInfo];

      uint64_t v9 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_DEFAULT, "System info update successful", (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      id v6 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        v11 = @"TRICellularParameterManager failed to update system info";
        _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)setCarrierBundleIdentifier:(id)a3
{
}

- (void)setCarrierCountryIsoCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end