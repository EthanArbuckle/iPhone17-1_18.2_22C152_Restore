@interface PKPassUpgradeControllerBase
- (PKPassUpgradeControllerBase)init;
- (PKPassUpgradeControllerBase)initWithWebService:(id)a3 addPaymentPassToLibrary:(id)a4;
- (PKPaymentWebService)paymentWebService;
- (void)appletsDidUpdate;
- (void)completePassUpgradeForPassUniqueID:(id)a3 withError:(id)a4;
- (void)downloadUpgradedPassForPassUniqueID:(id)a3 atURL:(id)a4;
- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6;
- (void)setPaymentWebService:(id)a3;
@end

@implementation PKPassUpgradeControllerBase

- (PKPassUpgradeControllerBase)init
{
  return 0;
}

- (PKPassUpgradeControllerBase)initWithWebService:(id)a3 addPaymentPassToLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPassUpgradeControllerBase;
  v9 = [(PKPassUpgradeControllerBase *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentWebService, a3);
    v11 = _Block_copy(v8);
    id addPaymentPassToLibrary = v10->_addPaymentPassToLibrary;
    v10->_id addPaymentPassToLibrary = v11;

    v10->_pass_upgrade_lock._os_unfair_lock_opaque = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingPassUpgrades = v10->_pendingPassUpgrades;
    v10->_pendingPassUpgrades = v13;
  }
  return v10;
}

- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v14 = [v11 uniqueID];
    v15 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = [v10 type];
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Requesting pass upgrade with reason %lu for pass %@", buf, 0x16u);
    }

    p_pass_upgrade_lock = &self->_pass_upgrade_lock;
    os_unfair_lock_lock(&self->_pass_upgrade_lock);
    uint64_t v17 = [(NSMutableDictionary *)self->_pendingPassUpgrades objectForKey:v14];
    if (v17)
    {
      v18 = (PKPendingPassUpgrade *)v17;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)v14;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Coalescing pass upgrade requests for pass %@", buf, 0xCu);
      }

      v19 = [(PKPendingPassUpgrade *)v18 completionHandlers];
      v20 = _Block_copy(v13);
      [v19 addObject:v20];

      os_unfair_lock_unlock(p_pass_upgrade_lock);
    }
    else
    {
      v18 = [[PKPendingPassUpgrade alloc] initWithRequest:v10 completionHandler:v13];
      [(NSMutableDictionary *)self->_pendingPassUpgrades setObject:v18 forKeyedSubscript:v14];
      os_unfair_lock_unlock(&self->_pass_upgrade_lock);
      v21 = [[PKPaymentRequestPassUpdateRequest alloc] initWithPaymentPass:v11 updateRequest:v10];
      v22 = v21;
      if (v12) {
        [(PKWebServiceRequest *)v21 addDiagnosticReason:v12];
      }
      paymentWebService = self->_paymentWebService;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __83__PKPassUpgradeControllerBase_requestPassUpgrade_pass_diagnosticReason_completion___block_invoke;
      v24[3] = &unk_1E56F4E80;
      v24[4] = self;
      id v25 = v14;
      [(PKPaymentWebService *)paymentWebService passUpgradeWithRequest:v22 completion:v24];
    }
  }
}

void __83__PKPassUpgradeControllerBase_requestPassUpgrade_pass_diagnosticReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    v24 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v25;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) request failed with error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) completePassUpgradeForPassUniqueID:*(void *)(a1 + 40) withError:v5];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [v6 passURL];
    id v10 = [v8 URLWithString:v9];

    uint64_t v11 = [v7 appletState];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    id v12 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
    [v12 setWebRequestFinished:1];
    [v12 setRequiresAppletUpgrade:v11 == 1];
    [v12 setUpgradePassURL:v10];
    unsigned int v13 = [v12 appletDidUpgrade];
    if (v11 == 1) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 1;
    }
    [v12 setPassUpgradeInProgress:v14];
    int v15 = [v12 upgradeIsComplete];
    uint64_t v16 = *(void *)(a1 + 32);
    if (v15)
    {
      [*(id *)(v16 + 24) removeObjectForKey:*(void *)(a1 + 40)];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
      uint64_t v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v18;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed early for pass %@", buf, 0xCu);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v19 = objc_msgSend(v12, "completionHandlers", 0);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * v23++) + 16))();
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 16));
      if (v14)
      {
        if (v10)
        {
          [*(id *)(a1 + 32) downloadUpgradedPassForPassUniqueID:*(void *)(a1 + 40) atURL:v10];
        }
        else
        {
          __int16 v28 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v29;
            _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) has no required work?", buf, 0xCu);
          }

          [*(id *)(a1 + 32) completePassUpgradeForPassUniqueID:*(void *)(a1 + 40) withError:0];
        }
      }
      else
      {
        v26 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v27;
          _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Pass upgrade waiting for applet update (%@)", buf, 0xCu);
        }
      }
    }
  }
}

- (void)downloadUpgradedPassForPassUniqueID:(id)a3 atURL:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Downloading new pass for pass upgrade (%@) at url: %@", buf, 0x16u);
  }

  paymentWebService = self->_paymentWebService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke;
  v11[3] = &unk_1E56F4EF8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(PKPaymentWebService *)paymentWebService passAtURL:v7 completion:v11];
}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 == 1 && v5)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 32) targetDevice];
    id v8 = [v7 secureElementIdentifiers];

    v9 = +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_2;
    v14[3] = &unk_1E56F4ED0;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v6;
    id v16 = *(id *)(a1 + 40);
    [v15 downloadRemoteAssetsWithConfiguration:v9 completion:v14];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v11;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed downloading new pass for pass upgrade (%@)", buf, 0xCu);
    }

    unsigned int v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:a2 userInfo:0];
    [v13 completePassUpgradeForPassUniqueID:v12 withError:v8];
  }
}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_2(id *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if (v5)
    {
      id v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = a1[6];
        *(_DWORD *)buf = 138412546;
        id v16 = v8;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Downloading new pass assets for pass upgrade (%@) failed: %@", buf, 0x16u);
      }

      [a1[4] completePassUpgradeForPassUniqueID:a1[6] withError:v6];
    }
    else
    {
      v9 = a1[4];
      id v10 = a1[5];
      uint64_t v11 = v9[1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_3;
      v12[3] = &unk_1E56F4EA8;
      v12[4] = v9;
      id v13 = a1[6];
      id v14 = a1[5];
      (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v10, v12);
    }
  }
}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_3(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
  v4 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  [v4 setUpgradedPass:a1[6]];
  int v5 = [v4 upgradeIsComplete];
  uint64_t v6 = a1[4];
  if (v5)
  {
    [*(id *)(v6 + 24) removeObjectForKey:a1[5]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed for pass %@", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = objc_msgSend(v4, "completionHandlers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if (v3) {
            uint64_t v14 = 0;
          }
          else {
            uint64_t v14 = a1[6];
          }
          (*(void (**)(void, id, uint64_t))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * i), v3, v14);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
  }
}

- (void)completePassUpgradeForPassUniqueID:(id)a3 withError:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_pass_upgrade_lock);
  uint64_t v8 = [(NSMutableDictionary *)self->_pendingPassUpgrades objectForKey:v6];
  [(NSMutableDictionary *)self->_pendingPassUpgrades removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_pass_upgrade_lock);
  v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 upgradedPass];
    *(_DWORD *)buf = 138412802;
    id v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v10 != 0;
    __int16 v25 = 1024;
    int v26 = [v8 appletDidUpgrade];
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) failed: pass upgrade %d, applet updated %d", buf, 0x18u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = objc_msgSend(v8, "completionHandlers", 0);
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

- (void)appletsDidUpdate
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass Upgrade: Applets did update", buf, 2u);
  }

  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  locuint64_t k = &self->_pass_upgrade_lock;
  os_unfair_lock_lock(&self->_pass_upgrade_lock);
  v4 = (void *)[(NSMutableDictionary *)self->_pendingPassUpgrades copy];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v60;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v59 + 1) + 8 * v9);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        if ([v11 requiresAppletUpgrade]
          && ([v11 appletDidUpgrade] & 1) == 0)
        {
          [v11 setAppletDidUpgrade:1];
          if ([v11 upgradeIsComplete])
          {
            [v46 setObject:v11 forKeyedSubscript:v10];
            [(NSMutableDictionary *)self->_pendingPassUpgrades removeObjectForKey:v10];
            goto LABEL_18;
          }
          uint64_t v12 = self;
          uint64_t v13 = [v11 upgradePassURL];
          if (!v13
            || (uint64_t v14 = (void *)v13,
                [v11 upgradedPass],
                uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                v15,
                v14,
                v15))
          {
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v10;
              _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass upgrade %@ in invalid state", buf, 0xCu);
            }

            goto LABEL_17;
          }
          if (([v11 passUpgradeInProgress] & 1) == 0)
          {
            [v11 setPassUpgradeInProgress:1];
            [v41 setObject:v11 forKeyedSubscript:v10];
LABEL_17:
            self = v12;
            goto LABEL_18;
          }
          self = v12;
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v10;
            _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass download already in progress for pass upgrade (%@)", buf, 0xCu);
          }
        }
LABEL_18:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v16 = [v5 countByEnumeratingWithState:&v59 objects:v68 count:16];
      uint64_t v7 = v16;
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
  id v45 = v5;
  if ([v46 count])
  {
    v40 = self;
    long long v17 = [v46 allKeys];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v17;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Applet update occured for pass upgrades: %@", buf, 0xCu);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      os_unfair_lock_t locka = *(os_unfair_lock_t *)v56;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(os_unfair_lock_t *)v56 != locka) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v22 = [v46 objectForKeyedSubscript:v21];
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v21;
            _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed for pass %@", buf, 0xCu);
          }
          __int16 v23 = v3;

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          BOOL v24 = [v22 completionHandlers];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v52;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v52 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v51 + 1) + 8 * j);
                long long v30 = [v22 upgradedPass];
                (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
            }
            while (v26);
          }

          id v5 = v45;
          id v3 = v23;
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v19);
    }

    self = v40;
  }
  if ([v41 count])
  {
    long long v31 = [v41 allKeys];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v31;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Starting new pass downloads for pass upgrades: %@", buf, 0xCu);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v48 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v47 + 1) + 8 * k);
          v38 = [v41 objectForKeyedSubscript:v37];
          uint64_t v39 = [v38 upgradePassURL];
          [(PKPassUpgradeControllerBase *)self downloadUpgradedPassForPassUniqueID:v37 atURL:v39];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }
      while (v34);
    }

    id v5 = v45;
  }
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_pendingPassUpgrades, 0);
  objc_storeStrong(&self->_addPaymentPassToLibrary, 0);
}

@end