@interface PKPaymentSetupAssistantCoreController
+ (id)requiredPaymentSetupFileURLs;
- (BOOL)_bridgeNeedsToRun:(unint64_t *)a3;
- (BOOL)_hasManuallyAddedSecureElementPasses:(BOOL)a3;
- (BOOL)_macNeedsToRun:(unint64_t *)a3;
- (BOOL)_phoneNeedsToRun:(unint64_t *)a3;
- (BOOL)_setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupAssistantCoreController)initWithSetupAssistantContext:(id)a3;
- (id)_bridgeContextDefaultLocalCredential;
- (id)_defaultWebService;
- (id)_peerPaymentCredential;
- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5;
- (id)_provisioningControllerWithWebService:(id)a3;
- (id)_setupAssistantCredentialForPaymentCredential:(id)a3;
- (id)_setupAssistantCredentialForPaymentPass:(id)a3;
- (id)description;
- (unint64_t)_specialCaseSEPassCountInPassLibrary:(id)a3;
- (unint64_t)preflightState;
- (void)_expressCardRemovalProvisioningContext:(id)a3;
- (void)_expressSetupProvisioningContext:(id)a3;
- (void)_extendedSetupAssistantNeedsToRunWithCompletion:(id)a3;
- (void)_preflightPaymentSetupProvisioningController:(id)a3 completion:(id)a4;
- (void)_shouldRunAppleCashFlow:(BOOL *)a3 shouldRunPaymentSetupFlow:(BOOL *)a4 pairingFamilyMember:(id)a5 pairingPeerPaymentAccount:(id)a6 parentFamilyMember:(id)a7 parentPeerPaymentAccount:(id)a8;
@end

@implementation PKPaymentSetupAssistantCoreController

+ (id)requiredPaymentSetupFileURLs
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PKRequiredPaymentSetupFileURLs();
  v3 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 description];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Returning file URLS for payment setup iCloud restore: %@", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

- (PKPaymentSetupAssistantCoreController)initWithSetupAssistantContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupAssistantCoreController;
  int v6 = [(PKPaymentSetupAssistantCoreController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupAssistantContext, a3);
    v7->_preflightState = 0;
  }

  return v7;
}

- (void)_extendedSetupAssistantNeedsToRunWithCompletion:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  uint64_t v24 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  BOOL v23 = 0;
  BOOL v23 = [(PKPaymentSetupAssistantCoreController *)self _setupAssistantNeedsToRunReturningRequirements:&v24];
  if (!*((unsigned char *)v21 + 24))
  {
    BOOL v5 = 0;
    goto LABEL_10;
  }
  if ((v24 & 1) == 0)
  {
    BOOL v5 = 1;
LABEL_10:
    v4[2](v4, v5);
    goto LABEL_11;
  }
  if ([(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant] != 1)
  {
    BOOL v5 = *((unsigned char *)v21 + 24) != 0;
    goto LABEL_10;
  }
  int v6 = [(PKPaymentSetupAssistantCoreController *)self _defaultWebService];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke;
  aBlock[3] = &unk_1E56F2308;
  v18 = &v20;
  id v7 = v6;
  id v16 = v7;
  uint64_t v8 = v4;
  v17 = v8;
  uint64_t v19 = v24;
  objc_super v9 = (void (**)(void))_Block_copy(aBlock);
  if (PKNetworkConnectivityAvailable() && [v7 needsConfiguration])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke_47;
    v10[3] = &unk_1E56F2330;
    v11 = v9;
    v12 = v8;
    v13 = &v20;
    uint64_t v14 = v24;
    [v7 configurePaymentServiceWithCompletion:v10];
  }
  else
  {
    v9[2](v9);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);
}

uint64_t __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) paymentSetupSupportedInRegion] == 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantCoreController: performed extended needsToRun check and decided not to run", v4, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke_47(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 1 || a3) {
    return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), a1[7]);
  }
  else {
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
}

- (BOOL)_setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    setupAssistantContext = self->_setupAssistantContext;
    int v12 = 138543618;
    uint64_t v13 = (uint64_t)v7;
    __int16 v14 = 2112;
    v15 = setupAssistantContext;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant];
  if (v9 == 2) {
    return [(PKPaymentSetupAssistantCoreController *)self _bridgeNeedsToRun:a3];
  }
  if (v9 == 1) {
    return [(PKPaymentSetupAssistantCoreController *)self _phoneNeedsToRun:a3];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant];
    int v12 = 134217984;
    uint64_t v13 = v11;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error: _setupAssistantNeedsToRunReturningRequirements called with unsupported type %lu. File a radar!", (uint8_t *)&v12, 0xCu);
  }

  return 0;
}

- (BOOL)_phoneNeedsToRun:(unint64_t *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [PKSetupAssistantRequirementsChecker alloc];
  int v6 = +[PKPaymentWebServiceTargetDevice localTargetDevice];
  id v7 = [(PKSetupAssistantRequirementsChecker *)v5 initWithTargetDevice:v6];

  uint64_t v8 = [(PKSetupAssistantRequirementsChecker *)v7 checkPhoneRequirementsWithContext:self->_setupAssistantContext];
  uint64_t v9 = v8;
  if (a3) {
    *a3 = [v8 missingRequirements];
  }
  v10 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    __int16 v14 = v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Does Phone Apple Pay Buddy Need to Run?: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  char v11 = [v9 shouldRun];
  return v11;
}

- (BOOL)_bridgeNeedsToRun:(unint64_t *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext conformsToProtocol:&unk_1EE2EAE68])
  {
    int v6 = self->_setupAssistantContext;
    id v7 = [(PKPaymentSetupAssistantContextProtocol *)v6 parentFamilyMember];
    uint64_t v8 = [(PKPaymentSetupAssistantContextProtocol *)v6 pairingFamilyMember];
    if (v8) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      uint64_t v19 = [(Class)getNPKCompanionAgentConnectionClass_4[0]() watchPeerPaymentWebService];
      uint64_t v20 = +[PKPeerPaymentWebService sharedService];
      v32 = v19;
      v21 = [v19 targetDevice];
      uint64_t v22 = [v21 account];

      BOOL v23 = [v20 targetDevice];
      uint64_t v24 = [v23 account];

      v25 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v35 = v8;
        __int16 v36 = 2112;
        v37 = v7;
        __int16 v38 = 2112;
        v39 = v22;
        __int16 v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Checking if bridge setup assistant needs to run for pairing member %@, parent member %@, and pairingPeerPaymentAccount %@, parentFamilyMember %@", buf, 0x2Au);
      }

      __int16 v33 = 0;
      [(PKPaymentSetupAssistantCoreController *)self _shouldRunAppleCashFlow:&v33 shouldRunPaymentSetupFlow:(char *)&v33 + 1 pairingFamilyMember:v8 pairingPeerPaymentAccount:v22 parentFamilyMember:v7 parentPeerPaymentAccount:v24];
      if (a3) {
        *a3 = 0;
      }
      char v18 = (_BYTE)v33 != 0;
      if ((_BYTE)v33)
      {
        v27 = PKLogFacilityTypeGetObject(0x29uLL);
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_29:

          return v18;
        }
        NSStringFromSelector(a2);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        v29 = "%{public}@ returning YES for Apple Cash setup";
LABEL_28:
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

        goto LABEL_29;
      }
      if (!HIBYTE(v33))
      {
        v27 = PKLogFacilityTypeGetObject(0x29uLL);
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        NSStringFromSelector(a2);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        v29 = "%{public}@ returning NO due to bad configuration";
        goto LABEL_28;
      }
    }
  }
  if (!PKDaemonIsAvailable()
    || (PKStoreDemoModeEnabled() & 1) != 0
    || ![(Class)getNPKCompanionAgentConnectionClass_4[0]() isSetupAssistantProvisioningSupported])
  {
    unint64_t v16 = 0;
    char v18 = 0;
    if (!a3) {
      return v18;
    }
LABEL_20:
    *a3 = v16;
    return v18;
  }
  v10 = +[PKPaymentWebServiceTargetDevice localTargetDevice];
  char v11 = [v10 appleAccountInformation];

  int v12 = [v11 aidaAccountAvailable];
  int v13 = [v11 aaAlternateDSID];
  int v14 = PKIsBeneficiaryAccountWithAltDsid(v13);

  if (v14)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account is beneficiary account", buf, 2u);
    }
  }
  unint64_t v16 = v12 ^ 1u;
  if ([v11 isManagedAppleAccount])
  {
    v17 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account is managed", buf, 2u);
    }

    char v18 = 0;
  }
  else
  {
    char v18 = v14 ^ 1;
    v17 = PKLogFacilityTypeGetObject(0x29uLL);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v31 = @"NO";
    if (v12) {
      v31 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    v35 = v31;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account for primary Apple Account: %{public}@", buf, 0xCu);
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (__CFString *)(v12 ^ 1u);
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Does Bridge Apple Pay Buddy Need to Run?: YES (Requirements mask %li)", buf, 0xCu);
  }

  if (a3) {
    goto LABEL_20;
  }
  return v18;
}

- (BOOL)_macNeedsToRun:(unint64_t *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[PKPaymentWebServiceTargetDevice localTargetDevice];
  int v6 = [[PKSetupAssistantRequirementsChecker alloc] initWithTargetDevice:v5];
  id v7 = [(PKSetupAssistantRequirementsChecker *)v6 checkMacRequirementsWithContext:self->_setupAssistantContext];
  uint64_t v8 = v7;
  if (a3) {
    *a3 = [v7 missingRequirements];
  }
  BOOL v9 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    int v13 = v8;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Does Mac Apple Pay Buddy Need to Run?: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  char v10 = [v8 shouldRun];
  return v10;
}

- (void)_preflightPaymentSetupProvisioningController:(id)a3 completion:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v10);
  if (v9)
  {
    if (v8)
    {
      char v11 = [v8 webService];
      uint64_t v42 = v11;
      if (v11)
      {
        v41 = [v11 targetDevice];
        if ([(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant] != 2
          && (objc_opt_respondsToSelector() & 1) != 0
          && ([v41 currentPassbookState] & 2) != 0)
        {
          __int16 v38 = PKLogFacilityTypeGetObject(0x29uLL);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v73 = 138412290;
            *(void *)&v73[4] = v43;
            _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: Wallet deleted from device, we should not be presented during Buddy", v73, 0xCu);
          }

          (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
        }
        else
        {
          objc_storeStrong((id *)&self->_provisioningController, a3);
          self->_preflightState = 0;
          v65[0] = 0;
          v65[1] = v65;
          v65[2] = 0x2020000000;
          char v66 = 0;
          int v12 = MEMORY[0x1E4F14428];
          id v13 = MEMORY[0x1E4F14428];
          *(void *)v73 = 0;
          *(void *)&v73[8] = v73;
          *(void *)&v73[16] = 0x3032000000;
          v74 = __Block_byref_object_copy__71;
          v75 = __Block_byref_object_dispose__71;
          dispatch_source_t v76 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
          uint64_t v14 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant];
          uint64_t v15 = *(NSObject **)(*(void *)&v73[8] + 40);
          if (v14 == 2) {
            int64_t v16 = 80000000000;
          }
          else {
            int64_t v16 = 59000000000;
          }
          dispatch_time_t v17 = dispatch_time(0, v16);
          dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke;
          aBlock[3] = &unk_1E56F2358;
          objc_copyWeak(v63, &location);
          id v18 = v43;
          id v56 = v18;
          v63[1] = (id)a2;
          v61 = v73;
          v62 = v65;
          id v60 = v9;
          id v19 = v42;
          id v57 = v19;
          id v58 = v41;
          id v40 = v8;
          id v59 = v40;
          uint64_t v20 = _Block_copy(aBlock);
          v21 = *(NSObject **)(*(void *)&v73[8] + 40);
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_132;
          handler[3] = &unk_1E56F2380;
          id v22 = v18;
          id v52 = v22;
          v54 = v73;
          id v23 = v20;
          id v53 = v23;
          dispatch_source_set_event_handler(v21, handler);
          dispatch_resume(*(dispatch_object_t *)(*(void *)&v73[8] + 40));
          uint64_t v24 = [v19 supportedRegionFeatureOfType:14 didFailOSVersionRequirements:0];
          char v50 = 0;
          v25 = [v24 createProductsRequestWithIsFetchBlocked:&v50];
          if (v25 && !v50) {
            [v40 setFetchProductsFromStaticDataSource:1];
          }
          v26 = PKLogFacilityTypeGetObject(0x29uLL);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v25;
            v27 = v24;
            setupAssistantContext = self->_setupAssistantContext;
            v29 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            id v68 = v22;
            __int16 v69 = 2112;
            v70 = setupAssistantContext;
            __int16 v71 = 2112;
            v72 = v29;
            _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "%@ Start controller preflight with context %@. %@", buf, 0x20u);

            uint64_t v24 = v27;
            v25 = v39;
          }

          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_133;
          v44[3] = &unk_1E56F23D0;
          objc_copyWeak(v49, &location);
          id v30 = v22;
          v49[1] = (id)a2;
          id v45 = v30;
          v46 = self;
          id v31 = v23;
          id v48 = v31;
          id v47 = v40;
          [v47 preflightWithRequirements:173 completionRequirements:173 completion:v44];

          objc_destroyWeak(v49);
          objc_destroyWeak(v63);
          objc_destroyWeak(&location);
          _Block_object_dispose(v73, 8);

          _Block_object_dispose(v65, 8);
        }
      }
      else
      {
        __int16 v36 = PKLogFacilityTypeGetObject(0x29uLL);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = NSStringFromSelector(a2);
          *(_DWORD *)v73 = 138412546;
          *(void *)&v73[4] = v43;
          *(_WORD *)&v73[12] = 2112;
          *(void *)&v73[14] = v37;
          _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No webservice for Buddy provisioning preflight in %@", v73, 0x16u);
        }
        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
      }
    }
    else
    {
      v34 = PKLogFacilityTypeGetObject(0x29uLL);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = NSStringFromSelector(a2);
        *(_DWORD *)v73 = 138412546;
        *(void *)&v73[4] = v43;
        *(_WORD *)&v73[12] = 2112;
        *(void *)&v73[14] = v35;
        _os_log_impl(&dword_190E10000, v34, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No controller for Buddy provisioning preflight in %@", v73, 0x16u);
      }
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    v32 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v33 = NSStringFromSelector(a2);
      *(_DWORD *)v73 = 138412546;
      *(void *)&v73[4] = v43;
      *(_WORD *)&v73[12] = 2112;
      *(void *)&v73[14] = v33;
      _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No completion for Buddy provisioning preflight in %@", v73, 0x16u);
    }
  }
}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    BOOL v5 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)v35 = 138412546;
      *(void *)&v35[4] = v6;
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = v7;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%@ Preflight completion should be safe to finish, but unable to store preflight state as self no longer exists. %@", v35, 0x16u);
    }
  }
  id v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    char v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v11 + 24))
  {
    int v12 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)v35 = 138412546;
      *(void *)&v35[4] = v13;
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = v14;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "%@ Preflight already being handled. Bailing out. %@", v35, 0x16u);
    }
    goto LABEL_43;
  }
  *(unsigned char *)(v11 + 24) = 1;
  if (a2)
  {
    int v12 = [*(id *)(a1 + 40) context];
    uint64_t v15 = [*(id *)(a1 + 48) deviceRegion];
    int64_t v16 = [v12 configuration];
    if (([v16 buddyProvisioningEnabledForRegion:v15] & 1) == 0)
    {
      id v23 = PKLogFacilityTypeGetObject(0x29uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)v35 = 138412546;
        *(void *)&v35[4] = v24;
        *(_WORD *)&v35[12] = 2112;
        *(void *)&v35[14] = v15;
        v25 = "%@ Preflight. Buddy provisioning disabled for region: %@";
LABEL_40:
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, v25, v35, 0x16u);
      }
LABEL_41:

      __int16 v33 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_42:
      v33();

LABEL_43:
      goto LABEL_44;
    }
    if (![v16 buddyManualProvisioningEnabledForRegion:v15])
    {
LABEL_31:
      v29 = objc_msgSend(*(id *)(a1 + 56), "associatedCredentials", *(_OWORD *)v35);
      uint64_t v30 = [v29 count];

      if (v30)
      {
        if (WeakRetained)
        {
          uint64_t v27 = 2;
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      id v23 = PKLogFacilityTypeGetObject(0x29uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        *(_DWORD *)v35 = 138412546;
        *(void *)&v35[4] = v34;
        *(_WORD *)&v35[12] = 2112;
        *(void *)&v35[14] = v15;
        v25 = "%@ Preflight. Manual provisioning disabled for region: %@, and 0 cards on file.";
        goto LABEL_40;
      }
      goto LABEL_41;
    }
    if ([*(id *)(a1 + 56) isCurrentUserUnder13] == 1)
    {
      dispatch_time_t v17 = PKLogFacilityTypeGetObject(0x29uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(void *)&v35[4] = v18;
        id v19 = "%@ Preflight. Manual provisioning disabled for because user is child.";
LABEL_29:
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v19, v35, 0xCu);
      }
    }
    else
    {
      if (![v16 browseProvisioningBankAppsEnabledForRegion:v15])
      {
        if ([*(id *)(a1 + 40) paymentSetupSupportedInRegion] == 1)
        {
          if (WeakRetained)
          {
            uint64_t v27 = 6;
LABEL_34:
            WeakRetained[3] |= v27;
          }
LABEL_35:
          id v31 = PKLogFacilityTypeGetObject(0x29uLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = *(void *)(a1 + 32);
            *(_DWORD *)v35 = 138412290;
            *(void *)&v35[4] = v32;
            _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "%@ Preflight completed successfully!", v35, 0xCu);
          }

          __int16 v33 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
          goto LABEL_42;
        }
        dispatch_time_t v17 = PKLogFacilityTypeGetObject(0x29uLL);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        uint64_t v28 = *(void *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(void *)&v35[4] = v28;
        id v19 = "%@ Preflight. Manual provisioning disabled because region is not supported.";
        goto LABEL_29;
      }
      dispatch_time_t v17 = PKLogFacilityTypeGetObject(0x29uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(void *)&v35[4] = v26;
        id v19 = "%@ Preflight. Manual provisioning disabled because region has browse banks enabled.";
        goto LABEL_29;
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v20 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = NSStringFromSelector(*(SEL *)(a1 + 96));
    *(_DWORD *)v35 = 138412546;
    *(void *)&v35[4] = v21;
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = v22;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "%@ Preflight did not succeed, return. %@", v35, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_44:
}

uint64_t __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_132(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "%@ Error: Preflight timeout called", (uint8_t *)&v9, 0xCu);
  }

  v4 = [(objc_class *)_MergedGlobals_184() sharedInstance];
  BOOL v5 = off_1EB402518();
  [v4 didCompleteFlow:v5];

  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_133(uint64_t a1, char a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    *((void *)WeakRetained + 3) |= 1uLL;
    id v8 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138413058;
      uint64_t v36 = v9;
      __int16 v37 = 2112;
      __int16 v38 = v10;
      __int16 v39 = 2112;
      id v40 = v5;
      __int16 v41 = 2112;
      uint64_t v42 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ Controller preflighted with context %@. Error: %@. %@", buf, 0x2Au);
    }
    if (v5 || (a2 & 1) == 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(void **)(a1 + 32);
        uint64_t v26 = NSStringFromSelector(*(SEL *)(a1 + 72));
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v25;
        __int16 v37 = 2112;
        __int16 v38 = v26;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ Preflight failed, return. %@", buf, 0x16u);
      }
      uint64_t v27 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_23;
    }
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 8) setupAssistant];
    if (v12 == 2)
    {
      uint64_t v28 = [*(id *)(a1 + 48) associatedCredentials];
      if ([v28 count])
      {
      }
      else
      {
        char v29 = [*(id *)(a1 + 48) isProvisioningForAltAccount];

        if ((v29 & 1) == 0)
        {
          uint64_t v13 = [v7 _bridgeContextDefaultLocalCredential];
LABEL_9:
          uint64_t v14 = (void *)v13;
          if (v13)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v14 longDescription];
              int64_t v16 = *(void **)(a1 + 32);
              dispatch_time_t v17 = NSStringFromSelector(*(SEL *)(a1 + 72));
              *(_DWORD *)buf = 138412802;
              uint64_t v36 = v15;
              __int16 v37 = 2112;
              __int16 v38 = v16;
              __int16 v39 = 2112;
              id v40 = v17;
              _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@ Preflight, associating credentials %@. %@", buf, 0x20u);
            }
            uint64_t v18 = *(void **)(a1 + 48);
            uint64_t v34 = v14;
            id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_135;
            v30[3] = &unk_1E56F23A8;
            id v20 = *(id *)(a1 + 32);
            uint64_t v21 = *(void *)(a1 + 72);
            id v31 = v20;
            uint64_t v33 = v21;
            id v32 = *(id *)(a1 + 56);
            [v18 associateCredentials:v19 withCompletionHandler:v30];

            goto LABEL_24;
          }
        }
      }
    }
    else if (v12 == 1)
    {
      uint64_t v13 = [v7 _peerPaymentCredential];
      goto LABEL_9;
    }
    uint64_t v27 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_23:
    v27();
    goto LABEL_24;
  }
  id v22 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = *(void **)(a1 + 32);
    uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 72));
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v23;
    __int16 v37 = 2112;
    __int16 v38 = v24;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "%@ Preflight failed with unexpected error, return. %@", buf, 0x16u);
  }
LABEL_24:
}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_135(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = 138413058;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    int64_t v16 = v8;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@ Preflight, associated credentials. success: %d, displayableError: %@. %@", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_bridgeContextDefaultLocalCredential
{
  v2 = objc_alloc_init(PKPaymentService);
  uint64_t v3 = [(PKPaymentService *)v2 defaultPaymentPassUniqueIdentifier];
  if (v3)
  {
    v4 = +[PKPassLibrary sharedInstance];
    id v5 = [v4 peerPaymentPassUniqueID];
    id v6 = v3;
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      if (!v7)
      {

        goto LABEL_13;
      }
      int v9 = [v6 isEqualToString:v7];

      if (!v9)
      {
LABEL_13:
        int v12 = [v4 passWithUniqueID:v6];
        __int16 v11 = [v12 paymentPass];

        if (v11
          && [v11 supportsSerialNumberBasedProvisioning]&& ([v11 requiresTransferSerialNumberBasedProvisioning] & 1) == 0)
        {
          uint64_t v10 = [[PKPaymentLocalPassCredential alloc] initWithPaymentPass:v11];
          goto LABEL_20;
        }
        __int16 v13 = PKLogFacilityTypeGetObject(0x29uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v15 = 0;
          _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "No valid default pass for Bridge", v15, 2u);
        }

LABEL_19:
        uint64_t v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    __int16 v11 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v16 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Default phone pass is Apple Cash, do not offer it", v16, 2u);
    }
    goto LABEL_19;
  }
  v4 = PKLogFacilityTypeGetObject(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "No default pass from the phone to offer Bridge for setup", buf, 2u);
  }
  uint64_t v10 = 0;
LABEL_21:

  return v10;
}

- (unint64_t)_specialCaseSEPassCountInPassLibrary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 passesOfType:1];
  uint64_t v18 = v3;
  id v5 = [v3 peerPaymentPassUniqueID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v19 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v12 isHomeKeyPass])
        {
          __int16 v13 = PKLogFacilityTypeGetObject(0x29uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Home Key card is present but ignoring as it is always automatically ingested.", buf, 2u);
          }
LABEL_9:

          ++v9;
          continue;
        }
        if ([v12 hasAssociatedPeerPaymentAccount])
        {
          id v14 = [v12 uniqueID];
          int v15 = [v14 isEqualToString:v5];

          if (v15)
          {
            if ([v12 passActivationState] == 4)
            {
              __int16 v13 = PKLogFacilityTypeGetObject(0x29uLL);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Apple Cash card is present but ignoring as it has been automatically ingested.", buf, 2u);
              }
              char v19 = 1;
              goto LABEL_9;
            }
            char v19 = 1;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (!v8) {
        goto LABEL_21;
      }
    }
  }
  char v19 = 0;
  unint64_t v9 = 0;
LABEL_21:

  if (v5 && (v19 & 1) == 0)
  {
    int64_t v16 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Peer payment passID %@ found but no pass found in library", buf, 0xCu);
    }
  }
  return v9;
}

- (id)_peerPaymentCredential
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[PKPeerPaymentWebService sharedService];
  id v3 = [v2 targetDevice];
  v4 = [v3 account];

  uint64_t v5 = [v4 state];
  uint64_t v6 = [v4 stage];
  if (v5 == 1 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    int v12 = [[PKPeerPaymentCredential alloc] initWithPeerPaymentAccount:v4];
    if (v12) {
      goto LABEL_11;
    }
    unint64_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Could not generate peer payment credential", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    uint64_t v8 = v6;
    unint64_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = PKPeerPaymentAccountStateToString(v5);
      __int16 v11 = PKPeerPaymentAccountStageToString(v8);
      int v14 = 138543618;
      int v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Could not return peer payment credential because account state was: %{public}@ stage was: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }

  int v12 = 0;
LABEL_11:

  return v12;
}

- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [[PKPaymentSetupAssistantCoreProvisioningContext alloc] initWithProvisioningController:v8 setupAssistantCredentials:v7 maximumSelectable:a5];

  return v9;
}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  id v3 = a3;
  v4 = [[PKPaymentSetupAssistantCoreCredential alloc] initWithPaymentCredential:v3];

  return v4;
}

- (id)_setupAssistantCredentialForPaymentPass:(id)a3
{
  id v3 = a3;
  v4 = [[PKPaymentSetupAssistantCoreCredential alloc] initWithPaymentPass:v3];

  return v4;
}

- (id)_defaultWebService
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant];
  if (v3 == 2)
  {
    v4 = [(Class)getNPKCompanionAgentConnectionClass_4[0]() watchPaymentWebService];
  }
  else if (v3 == 1)
  {
    v4 = +[PKPaymentWebService sharedService];
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext setupAssistant];
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error: _defaultWebService called with unsupported type %lu. File a radar!", (uint8_t *)&v8, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)_provisioningControllerWithWebService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PKPaymentProvisioningController alloc] initWithWebService:v4];

  uint64_t v6 = [(PKPaymentSetupAssistantContextProtocol *)self->_setupAssistantContext externalizedContext];
  [(PKPaymentProvisioningController *)v5 storeExternalizedAuth:v6];

  return v5;
}

- (void)_shouldRunAppleCashFlow:(BOOL *)a3 shouldRunPaymentSetupFlow:(BOOL *)a4 pairingFamilyMember:(id)a5 pairingPeerPaymentAccount:(id)a6 parentFamilyMember:(id)a7 parentPeerPaymentAccount:(id)a8
{
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  if (PKDaemonIsAvailable()) {
    char v16 = PKStoreDemoModeEnabled() ^ 1;
  }
  else {
    char v16 = 0;
  }
  if ([v14 isMe]) {
    char v17 = [v14 isOrganizer];
  }
  else {
    char v17 = 0;
  }
  uint64_t v18 = [v13 altDSID];
  if (!v13 || !v14)
  {
    long long v21 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Cannot run add associated account in companion setup without parent and pairing family member", v26, 2u);
    }
    char v16 = 0;
LABEL_42:

    BOOL v25 = 0;
    if (!a3) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  if ((v17 & 1) == 0)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion setup without parent being the organizer";
      goto LABEL_34;
    }
LABEL_35:

    char v16 = 0;
    goto LABEL_36;
  }
  if (!v15)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion setup because the parent doesnt have a peer payment account";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (a6)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion setup when an account is already defined";
LABEL_34:
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, v20, v26, 2u);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  long long v22 = [v15 peerPaymentAccountWithAltDSID:v18];

  if (v22)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion since there is already and associated account for the pairing"
            " member on the parent members account.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  long long v23 = [v15 accountInvitationWithAltDSID:v18];
  uint64_t v24 = [v23 status];

  if (v24 == 1)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion since there is already a pending invitation for the pairing m"
            "ember on the parent members account.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (![v13 memberType] || objc_msgSend(v13, "memberType") == -1)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion setup when the pairing member is an adult.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (([v15 supportsFamilySharing] & 1) == 0)
  {
    char v19 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      long long v20 = "Cannot run add associated account in companion setup because family sharing feature is not supported.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
LABEL_36:
  if (objc_msgSend(v14, "memberType", *(void *)v26) || (objc_msgSend(v14, "isParent") & 1) == 0)
  {
    long long v21 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Cannot run regular payment setup flow as family member is not parent/adult.", v26, 2u);
    }
    goto LABEL_42;
  }
  BOOL v25 = 1;
  if (a3) {
LABEL_43:
  }
    *a3 = v16;
LABEL_44:
  if (a4) {
    *a4 = v25;
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; setupAssistantContext: '%@';>",
               objc_opt_class(),
               self,
               self->_setupAssistantContext);
}

- (BOOL)_hasManuallyAddedSecureElementPasses:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke;
  aBlock[3] = &unk_1E56F23F8;
  void aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke_150;
  v8[3] = &unk_1E56D8360;
  uint64_t v5 = v4;
  id v9 = v5;
  if (qword_1E92D9B78 != -1)
  {
    dispatch_once(&qword_1E92D9B78, v8);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    char v6 = _MergedGlobals_5 != 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  char v6 = v5[2](v5);
LABEL_6:

  return v6;
}

uint64_t __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke(uint64_t a1)
{
  v2 = +[PKPassLibrary sharedInstance];
  unint64_t v3 = [v2 countPassesOfType:1];
  if (!v3)
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  if (v3 <= [*(id *)(a1 + 32) _specialCaseSEPassCountInPassLibrary:v2])
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0x29uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Only special case passes are present, ignoring pass count so Apple pay setup will be offered.", v7, 2u);
    }

    goto LABEL_7;
  }
  uint64_t v4 = 1;
LABEL_8:

  return v4;
}

uint64_t __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke_150(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  _MergedGlobals_5 = result;
  return result;
}

- (void)_expressSetupProvisioningContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke;
    v7[3] = &unk_1E56F2490;
    v7[4] = self;
    id v8 = v4;
    [(PKPaymentSetupAssistantCoreController *)self _extendedSetupAssistantNeedsToRunWithCompletion:v7];
  }
  else
  {
    char v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[PKPaymentSetupAssistantCoreController _expressSetupProvisioningContext:]";
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%s Error: No completion provided", buf, 0xCu);
    }
  }
}

void __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a3 || !a2)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _defaultWebService];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _provisioningControllerWithWebService:v4];
      objc_initWeak(&location, *(id *)(a1 + 32));
      char v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2;
      v9[3] = &unk_1E56F2468;
      objc_copyWeak(v13, &location);
      id v12 = *(id *)(a1 + 40);
      v13[1] = 0;
      id v7 = v5;
      id v10 = v7;
      id v11 = v4;
      [v6 _preflightPaymentSetupProvisioningController:v7 completion:v9];

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    char v6 = WeakRetained;
    id v7 = [*(id *)(a1 + 32) associatedCredentials];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v15 = [v14 remoteCredential];
          char v16 = v15;
          if (!v15
            || ((uint64_t v17 = [v15 status], (unint64_t)(v17 + 1) <= 5)
              ? (BOOL v18 = ((1 << (v17 + 1)) & 0x33) == 0)
              : (BOOL v18 = 1),
                v18))
          {
            uint64_t v19 = [v6 _setupAssistantCredentialForPaymentCredential:v14];

            [v8 safelyAddObject:v19];
            id v11 = (void *)v19;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }

    if ([v8 count])
    {
      long long v20 = PKLastBackedUpDefaultPaymentPassSerialNumber();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_152;
      v31[3] = &unk_1E56F2420;
      id v21 = v20;
      id v32 = v21;
      [v8 sortUsingComparator:v31];
      uint64_t v5 = v6;
      if (PKDisableDynamicSEAllocation())
      {
        uint64_t v22 = [*(id *)(a1 + 32) availableSecureElementPassSpaces];
        if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v22 = [v8 count];
        }
      }
      else
      {
        uint64_t v22 = 0;
      }
      uint64_t v24 = *(void *)(a1 + 32);
      BOOL v25 = (void *)[v8 copy];
      uint64_t v26 = [v6 _provisioningContextWithProvisioningController:v24 setupAssistantCredentials:v25 maximumSelectable:v22];

      if (PKEnableBuddyBackgroundProvisioning())
      {
        uint64_t v27 = [v26 selectedCredentials];
        uint64_t v28 = objc_msgSend(v27, "pk_objectsPassingTest:", &__block_literal_global_192);

        char v29 = [[PKPaymentPrepareToProvisionRequest alloc] initWithCredentials:v28];
        [*(id *)(a1 + 40) prepareToProvisionForRequest:v29 completion:0];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      long long v23 = PKLogFacilityTypeGetObject(0x29uLL);
      uint64_t v5 = v6;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = obj;
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "No provisionable associated credentials found in %@. Returning nil setup assistant provisioning context.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  char v6 = [a2 credential];
  id v7 = [v5 credential];

  uint64_t v8 = [v6 compare:v7 withBackedUpDefaultPaymentPassSerialNumber:*(void *)(a1 + 32)];
  return v8;
}

uint64_t __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2_154(uint64_t a1, void *a2)
{
  return [a2 supportsSuperEasyProvisioning] ^ 1;
}

- (void)_expressCardRemovalProvisioningContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  if (v5)
  {
    char v6 = +[PKPassLibrary sharedInstance];
    id v7 = [v6 passesOfType:1];
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v9 = [v6 peerPaymentPassUniqueID];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__PKPaymentSetupAssistantCoreController__expressCardRemovalProvisioningContext___block_invoke;
    v26[3] = &unk_1E56F24B8;
    id v21 = v9;
    id v27 = v21;
    uint64_t v10 = [v7 sortedArrayUsingComparator:v26];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) paymentPass];
          if (v16)
          {
            uint64_t v17 = [(PKPaymentSetupAssistantCoreController *)self _setupAssistantCredentialForPaymentPass:v16];
            [v8 safelyAddObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v13);
    }

    BOOL v18 = (void *)[v8 copy];
    uint64_t v19 = -[PKPaymentSetupAssistantCoreController _provisioningContextWithProvisioningController:setupAssistantCredentials:maximumSelectable:](self, "_provisioningContextWithProvisioningController:setupAssistantCredentials:maximumSelectable:", 0, v18, [v8 count]);

    v5[2](v5, v19);
  }
  else
  {
    char v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v20;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%@ Error: No completion provided", buf, 0xCu);
    }
  }
}

uint64_t __80__PKPaymentSetupAssistantCoreController__expressCardRemovalProvisioningContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_12;
  }
  if ([v5 hasAssociatedPeerPaymentAccount])
  {
    id v7 = [v5 uniqueID];
    char v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (([v6 hasAssociatedPeerPaymentAccount] & 1) == 0)
    {
LABEL_10:
      if (v8)
      {
        uint64_t v11 = -1;
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v12 = [v5 ingestedDate];
      uint64_t v13 = [v6 ingestedDate];
      uint64_t v11 = [v12 compare:v13];

      goto LABEL_13;
    }
  }
  else
  {
    if (([v6 hasAssociatedPeerPaymentAccount] & 1) == 0) {
      goto LABEL_12;
    }
    char v8 = 0;
  }
  uint64_t v9 = [v6 uniqueID];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (!v10) {
    goto LABEL_10;
  }
  if (v8) {
    goto LABEL_12;
  }
  uint64_t v11 = 1;
LABEL_13:

  return v11;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (unint64_t)preflightState
{
  return self->_preflightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_setupAssistantContext, 0);
}

@end