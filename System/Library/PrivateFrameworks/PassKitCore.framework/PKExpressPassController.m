@interface PKExpressPassController
- (BOOL)deviceUsesAutomaticAuthorization;
- (BOOL)hasEligibleExpressUpgradeRequestForPass:(id)a3;
- (BOOL)isExpressModeSupportedForPass:(id)a3;
- (BOOL)supportsLowPowerExpressMode;
- (PKExpressPassController)initWithPaymentDataProvider:(id)a3 passLibraryDataProvider:(id)a4 isForWatch:(BOOL)a5;
- (id)eligibleExpressUpgradeRequestsForPass:(id)a3;
- (id)enabledExpressPasses;
- (id)existingExpressPassConfigurationForPass:(id)a3;
- (id)existingExpressPassInformationForPass:(id)a3;
- (id)expressModeSupportedForPass:(id)a3;
- (id)expressModeUpgradeRequestForPass:(id)a3;
- (id)expressState;
- (id)presentingViewController;
- (int64_t)apiVersion;
- (void)_disableExpressModeForPassWithUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)conflictingExpressPassesWithPassConfiguration:(id)a3 completion:(id)a4;
- (void)conflictingExpressPassesWithPassInformation:(id)a3 completion:(id)a4;
- (void)disableExpressModeForPass:(id)a3 withCompletion:(id)a4;
- (void)disableExpressModeForPassesWithUniqueIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)setApiVersion:(int64_t)a3;
- (void)setExpressModeWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setExpressModeWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setPresentingViewController:(id)a3;
- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 completion:(id)a5;
- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 resultHandler:(id)a5;
@end

@implementation PKExpressPassController

- (PKExpressPassController)initWithPaymentDataProvider:(id)a3 passLibraryDataProvider:(id)a4 isForWatch:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKExpressPassController;
  v10 = [(PKExpressPassController *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_paymentDataProvider, v8);
    objc_storeWeak((id *)&v11->_passLibraryDataProvider, v9);
    v11->_isForWatch = a5;
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
    v11->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck = objc_opt_respondsToSelector() & 1;

    id v13 = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
      v11->_apiVersion = [v15 apiVersion];
    }
    else
    {
      v11->_apiVersion = 0;
    }
  }

  return v11;
}

- (id)expressModeSupportedForPass:(id)a3
{
  id v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    v5 = [PKExpressPassInformation alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__PKExpressPassController_expressModeSupportedForPass___block_invoke;
    v9[3] = &unk_1E56F0620;
    v9[4] = self;
    id v6 = [(PKExpressPassInformation *)v5 initForPaymentPass:v4 withTechologyTest:v9];
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

uint64_t __55__PKExpressPassController_expressModeSupportedForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [WeakRetained supportsExpressForAutomaticSelectionTechnologyType:a2];

  return v4;
}

- (BOOL)isExpressModeSupportedForPass:(id)a3
{
  id v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    v5 = [PKExpressPassInformation alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKExpressPassController_isExpressModeSupportedForPass___block_invoke;
    v10[3] = &unk_1E56F0620;
    v10[4] = self;
    id v6 = [(PKExpressPassInformation *)v5 initForPaymentPass:v4 withTechologyTest:v10];
    BOOL v7 = v6 != 0;
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __57__PKExpressPassController_isExpressModeSupportedForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [WeakRetained supportsExpressForAutomaticSelectionTechnologyType:a2];

  return v4;
}

- (void)conflictingExpressPassesWithPassConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v7)
  {
    if (!self->_apiVersion) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    char v10 = objc_opt_respondsToSelector();

    id v11 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    if (v10)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke;
      v20[3] = &unk_1E56E46E8;
      v20[4] = self;
      v21 = v8;
      [v11 conflictingExpressPassIdentifiersForPassConfiguration:v6 withCompletion:v20];

      v12 = v21;
LABEL_8:

      goto LABEL_12;
    }
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
      id v15 = [v6 passInformation];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke_2;
      v18[3] = &unk_1E56E46E8;
      v18[4] = self;
      v19 = v8;
      [v14 conflictingExpressPassIdentifiersForPassInformation:v15 withCompletion:v18];

      v12 = v19;
      goto LABEL_8;
    }
    v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Unable to check for express mode conflicts", v17, 2u);
    }

    v8[2](v8, 0);
  }
LABEL_12:
}

void __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
          char v13 = objc_msgSend(WeakRetained, "passWithUniqueID:", v11, (void)v16);

          if (v13) {
            [v5 addObject:v13];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = (void *)[v5 copy];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
          char v13 = objc_msgSend(WeakRetained, "passWithUniqueID:", v11, (void)v16);

          if (v13) {
            [v5 addObject:v13];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = (void *)[v5 copy];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)conflictingExpressPassesWithPassInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (!self->_apiVersion) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
    uint64_t v10 = [v6 passUniqueIdentifier];
    uint64_t v11 = [WeakRetained passWithUniqueID:v10];
    v12 = [v11 secureElementPass];

    char v13 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v6 forSecureElementPass:v12];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__PKExpressPassController_conflictingExpressPassesWithPassInformation_completion___block_invoke;
    v14[3] = &unk_1E56E4710;
    id v15 = v8;
    [(PKExpressPassController *)self conflictingExpressPassesWithPassConfiguration:v13 completion:v14];
  }
}

uint64_t __82__PKExpressPassController_conflictingExpressPassesWithPassInformation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)existingExpressPassConfigurationForPass:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 uniqueID];
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v8 = objc_opt_respondsToSelector();

  id v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 expressPassConfigurations];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v11;
    char v13 = (PKExpressPassConfiguration *)[v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v13; i = (PKExpressPassConfiguration *)((char *)i + 1))
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v12);
          }
          long long v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v17 = [v16 passUniqueIdentifier];
          long long v18 = v17;
          if (v5 && v17)
          {
            char v19 = [v17 isEqual:v5];

            if (v19) {
              goto LABEL_29;
            }
          }
          else
          {

            if (v18 == v5)
            {
LABEL_29:
              v29 = v16;
              goto LABEL_32;
            }
          }
        }
        char v13 = (PKExpressPassConfiguration *)[v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
    {
      char v13 = 0;
      goto LABEL_34;
    }
    id v21 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    v22 = [v21 expressPassesInformation];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v22;
    char v13 = (PKExpressPassConfiguration *)[v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v13)
    {
      uint64_t v23 = *(void *)v32;
      while (2)
      {
        for (j = 0; j != v13; j = (PKExpressPassConfiguration *)((char *)j + 1))
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v12);
          }
          v25 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          v26 = objc_msgSend(v25, "passUniqueIdentifier", (void)v31);
          v27 = v26;
          if (v5 && v26)
          {
            char v28 = [v26 isEqual:v5];

            if (v28) {
              goto LABEL_31;
            }
          }
          else
          {

            if (v27 == v5)
            {
LABEL_31:
              v29 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v25 forSecureElementPass:v4];
LABEL_32:
              char v13 = v29;
              goto LABEL_33;
            }
          }
        }
        char v13 = (PKExpressPassConfiguration *)[v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
LABEL_33:

LABEL_34:
  return v13;
}

- (id)existingExpressPassInformationForPass:(id)a3
{
  id v3 = [(PKExpressPassController *)self existingExpressPassConfigurationForPass:a3];
  id v4 = [v3 passInformation];

  return v4;
}

- (BOOL)supportsLowPowerExpressMode
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v6 = [v5 supportsLowPowerExpressMode];

  return v6;
}

- (id)expressModeUpgradeRequestForPass:(id)a3
{
  id v3 = [(PKExpressPassController *)self eligibleExpressUpgradeRequestsForPass:a3];
  if ([v3 count])
  {
    char v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)eligibleExpressUpgradeRequestsForPass:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKExpressPassController_eligibleExpressUpgradeRequestsForPass___block_invoke;
    aBlock[3] = &unk_1E56F0620;
    aBlock[4] = self;
    id v5 = _Block_copy(aBlock);
    p_paymentDataProvider = &self->_paymentDataProvider;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    char v8 = [WeakRetained secureElementIdentifier];

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)p_paymentDataProvider);
        id v12 = [v11 deviceClass];
      }
      else
      {
        id v15 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Unable to get device class", buf, 2u);
        }

        id v12 = PKDeviceClass();
      }
      id v16 = objc_loadWeakRetained((id *)p_paymentDataProvider);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)p_paymentDataProvider);
        char v19 = [v18 deviceVersion];
      }
      else
      {
        char v20 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Unable to get device version", buf, 2u);
        }

        char v19 = +[PKOSVersionRequirement fromDeviceVersion];
      }
      v25[0] = v8;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      uint64_t v14 = [v4 eligibleExpressUpgradeRequestsForDeviceClass:v12 deviceSEIDs:v21 deviceVersion:v19 technologyTest:v5];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get device SEID", buf, 2u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    char v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __65__PKExpressPassController_eligibleExpressUpgradeRequestsForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [WeakRetained supportsExpressForAutomaticSelectionTechnologyType:a2];

  return v4;
}

- (BOOL)hasEligibleExpressUpgradeRequestForPass:(id)a3
{
  id v3 = [(PKExpressPassController *)self eligibleExpressUpgradeRequestsForPass:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKExpressPassController_upgradeExpressModeForPass_withCredential_completion___block_invoke;
  v10[3] = &unk_1E56F0648;
  id v11 = v8;
  id v9 = v8;
  [(PKExpressPassController *)self upgradeExpressModeForPass:a3 withCredential:a4 resultHandler:v10];
}

uint64_t __79__PKExpressPassController_upgradeExpressModeForPass_withCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if ([WeakRetained isDeviceInRestrictedMode])
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(location[0]) = 0;
    char v13 = "Device in restricted mode, skipping pass upgrade.";
    goto LABEL_13;
  }
  if (self->_isForWatch)
  {
    id v14 = objc_loadWeakRetained(&self->_presentingViewController);

    if (!v14)
    {
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      LOWORD(location[0]) = 0;
      char v13 = "Missing presenting view controller, skipping pass upgrade.";
LABEL_13:
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)location, 2u);
LABEL_14:

      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
      goto LABEL_21;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v12 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(location[0]) = 0;
    char v13 = "PKPaymentDataProvider is missing passUpgradeWithRequest:pass:visibleViewController:completion:, skipping pass upgrade.";
    goto LABEL_13;
  }
  id v15 = [(PKExpressPassController *)self expressModeUpgradeRequestForPass:v8];
  if (v15)
  {
    objc_initWeak(location, self);
    id v16 = objc_loadWeakRetained(&self->_presentingViewController);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke;
    v18[3] = &unk_1E56F0670;
    objc_copyWeak(&v21, location);
    id v20 = v10;
    v18[4] = self;
    id v19 = v9;
    [WeakRetained passUpgradeWithRequest:v15 pass:v8 visibleViewController:v16 completion:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    char v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Missing upgrade request for pass, skipping pass upgrade.", (uint8_t *)location, 2u);
    }

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }

LABEL_21:
}

void __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 && v6)
    {
      id v8 = [*(id *)(a1 + 32) expressModeSupportedForPass:v6];
      if (v8)
      {
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
        {
          char v17 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v8 forSecureElementPass:v6];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke_49;
          v19[3] = &unk_1E56E46E8;
          uint64_t v18 = *(void *)(a1 + 40);
          id v21 = *(id *)(a1 + 48);
          id v20 = v6;
          [WeakRetained setExpressModeWithPassConfiguration:v17 credential:v18 completion:v19];

          goto LABEL_21;
        }
        uint64_t v9 = *(void *)(a1 + 48);
        if (!v9)
        {
LABEL_21:

          goto LABEL_22;
        }
        id v10 = *(void (**)(void))(v9 + 16);
      }
      else
      {
        id v15 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Upgraded pass cannot be made express, skipping setting express pass.", buf, 2u);
        }

        uint64_t v16 = *(void *)(a1 + 48);
        if (!v16) {
          goto LABEL_21;
        }
        id v10 = *(void (**)(void))(v16 + 16);
      }
      v10();
      goto LABEL_21;
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      char v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_14;
    }
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed (%@, %@) but instance was invalidated, skipping setting express pass.", buf, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      char v13 = *(void (**)(void))(v12 + 16);
LABEL_14:
      v13();
    }
  }
LABEL_22:
}

void __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed setting express pass after pass upgrade.", v6, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), 0);
  }
}

- (void)setExpressModeWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (self->_isForWatch)
  {
    id v12 = objc_loadWeakRetained(&self->_presentingViewController);

    if (!v12)
    {
      id v15 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Missing presenting view controller, skipping setting express pass.", buf, 2u);
      }

      if (v10) {
        v10[2](v10, 0);
      }
      goto LABEL_14;
    }
    if (objc_opt_respondsToSelector())
    {
      id v13 = objc_loadWeakRetained(&self->_presentingViewController);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke;
      v22[3] = &unk_1E56E4910;
      id v23 = v10;
      [WeakRetained setExpressWithPassConfiguration:v8 visibleViewController:v13 requiresAuth:1 completion:v22];

      uint64_t v14 = v23;
LABEL_13:

LABEL_14:
      return;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [v8 passInformation];
      id v17 = objc_loadWeakRetained(&self->_presentingViewController);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_2;
      v20[3] = &unk_1E56E48E8;
      v20[4] = self;
      id v21 = v10;
      [WeakRetained setExpressWithPassInformation:v16 visibleViewController:v17 requiresAuth:1 completion:v20];

      uint64_t v14 = v21;
      goto LABEL_13;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_4;
    v18[3] = &unk_1E56E4910;
    id v19 = v10;
    [WeakRetained setExpressWithPassConfiguration:v8 credential:v9 completion:v18];
    uint64_t v14 = v19;
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!a2) {
      a3 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (a2)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_3;
      v9[3] = &unk_1E56F0698;
      v9[4] = *(void *)(a1 + 32);
      id v8 = objc_msgSend(v5, "pk_setBySafelyApplyingBlock:", v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      (*(void (**)(void, void))(v7 + 16))(*(void *)(a1 + 40), 0);
    }
  }
}

PKExpressPassConfiguration *__85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 passUniqueIdentifier];
  id v6 = [WeakRetained passWithUniqueID:v5];
  uint64_t v7 = [v6 secureElementPass];

  id v8 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v3 forSecureElementPass:v7];
  return v8;
}

uint64_t __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)setExpressModeWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  id v12 = [v10 passUniqueIdentifier];
  id v13 = [WeakRetained passWithUniqueID:v12];
  uint64_t v14 = [v13 secureElementPass];

  id v15 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v10 forSecureElementPass:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke;
  v17[3] = &unk_1E56E4710;
  id v18 = v8;
  id v16 = v8;
  [(PKExpressPassController *)self setExpressModeWithPassConfiguration:v15 credential:v9 completion:v17];
}

void __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "pk_setByApplyingBlock:", &__block_literal_global_172);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 passInformation];
}

- (void)_disableExpressModeForPassWithUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (self->_isForWatch)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = objc_loadWeakRetained(&self->_presentingViewController);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke;
      v15[3] = &unk_1E56E48E8;
      id v10 = &v16;
      v15[4] = self;
      id v16 = v7;
      id v11 = v7;
      [WeakRetained removeExpressPassWithUniqueIdentifier:v6 visibleViewController:v9 completion:v15];

LABEL_6:
      return;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_3;
    v13[3] = &unk_1E56E4910;
    id v10 = &v14;
    id v14 = v7;
    id v12 = v7;
    [WeakRetained removeExpressPassWithUniqueIdentifier:v6 completion:v13];
    goto LABEL_6;
  }
  __break(1u);
}

void __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (a2)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_2;
      v9[3] = &unk_1E56F0698;
      v9[4] = *(void *)(a1 + 32);
      id v8 = objc_msgSend(v5, "pk_setBySafelyApplyingBlock:", v9);
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      (*(void (**)(void, void))(v7 + 16))(*(void *)(a1 + 40), 0);
    }
  }
}

PKExpressPassConfiguration *__89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 passUniqueIdentifier];
  id v6 = [WeakRetained passWithUniqueID:v5];
  uint64_t v7 = [v6 secureElementPass];

  id v8 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v3 forSecureElementPass:v7];
  return v8;
}

uint64_t __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)disableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 uniqueID];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke;
  v10[3] = &unk_1E56E4710;
  id v11 = v6;
  id v9 = v6;
  [(PKExpressPassController *)self disableExpressModeForPassesWithUniqueIdentifiers:v8 withCompletion:v10];
}

void __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "pk_setByApplyingBlock:", &__block_literal_global_65);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 passInformation];
}

- (void)disableExpressModeForPassesWithUniqueIdentifiers:(id)a3 withCompletion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  id v18 = WeakRetained;
  if (!self->_isForWatch)
  {
LABEL_5:
    id v21 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    *(void *)buf = 0;
    long long v32 = buf;
    uint64_t v33 = 0x3032000000;
    long long v34 = __Block_byref_object_copy__60;
    long long v35 = __Block_byref_object_dispose__60;
    id v36 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v19;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * v13);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          void v25[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_69;
          v25[3] = &unk_1E56E2B58;
          objc_copyWeak(&v26, &location);
          v25[4] = v14;
          v25[5] = buf;
          [(PKAsyncUnaryOperationComposer *)v21 addOperation:v25];
          objc_destroyWeak(&v26);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }
      while (v11);
    }

    id v15 = [MEMORY[0x1E4F1CA98] null];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_3;
    v22[3] = &unk_1E56DF088;
    id v23 = v20;
    __int16 v24 = buf;
    id v16 = [(PKAsyncUnaryOperationComposer *)v21 evaluateWithInput:v15 completion:v22];

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);

    goto LABEL_17;
  }
  uint64_t v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&self->_presentingViewController);

  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = objc_loadWeakRetained(&self->_presentingViewController);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke;
      v38[3] = &unk_1E56E4910;
      id v39 = v20;
      [v7 removeExpressPassesWithUniqueIdentifiers:v19 visibleViewController:v9 completion:v38];

      goto LABEL_17;
    }
    goto LABEL_5;
  }
  id v17 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Missing presenting view controller when removing express passes.", buf, 2u);
  }

  if (v20) {
    (*((void (**)(id, void))v20 + 2))(v20, 0);
  }
LABEL_17:
}

uint64_t __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (!a2) {
      a3 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_2;
  v13[3] = &unk_1E56E9268;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [WeakRetained _disableExpressModeForPassWithUniqueIdentifier:v10 withCompletion:v13];
}

void __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (id)enabledExpressPasses
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 expressPassConfigurations];
LABEL_5:

    goto LABEL_7;
  }
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    uint64_t v10 = [v7 expressPassesInformation];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __47__PKExpressPassController_enabledExpressPasses__block_invoke;
    v25[3] = &unk_1E56F0698;
    v25[4] = self;
    id v8 = objc_msgSend(v10, "pk_setBySafelyApplyingBlock:", v25);

    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "passUniqueIdentifier", (void)v21);
        if (v18) {
          [v11 setObject:v17 forKey:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }

  id v19 = (void *)[v11 copy];
  return v19;
}

PKExpressPassConfiguration *__47__PKExpressPassController_enabledExpressPasses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [v3 passUniqueIdentifier];
  id v6 = [WeakRetained passWithUniqueID:v5];
  id v7 = [v6 secureElementPass];

  id v8 = [[PKExpressPassConfiguration alloc] initWithPassInformation:v3 forSecureElementPass:v7];
  return v8;
}

- (id)expressState
{
  uint64_t v2 = [(PKExpressPassController *)self enabledExpressPasses];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PKExpressPassController_expressState__block_invoke;
  v7[3] = &unk_1E56F06C0;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  char v5 = (void *)[v4 copy];

  return v5;
}

void __39__PKExpressPassController_expressState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 passInformation];
  [v4 setObject:v6 forKey:v5];
}

- (BOOL)deviceUsesAutomaticAuthorization
{
  char v8 = 0;
  uint64_t v7 = 0;
  BOOL v3 = +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:3 byHardware:&v8 outError:&v7];
  BOOL result = 0;
  if (v8) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !v3;
  }
  if (!v5 && v7 == 0) {
    return !self->_isForWatch;
  }
  return result;
}

- (id)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained(&self->_presentingViewController);
  return WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (int64_t)apiVersion
{
  return self->_apiVersion;
}

- (void)setApiVersion:(int64_t)a3
{
  self->_apiVersion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_destroyWeak((id *)&self->_paymentDataProvider);
}

@end