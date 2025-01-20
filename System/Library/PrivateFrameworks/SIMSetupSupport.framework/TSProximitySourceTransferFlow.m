@interface TSProximitySourceTransferFlow
- (BOOL)isAuthenticationCompleted;
- (BOOL)isFlowCompleted;
- (BOOL)isHiding;
- (BOOL)isRemotePeerClosed;
- (BOOL)isResumingAfterPause;
- (BOOL)isTransferCompleted;
- (CoreTelephonyClient)ctClient;
- (PRXCardContentProviding)secureIntentProxCard;
- (SSNFCAssertion)nfcAssertion;
- (SSProximityDevice)btClient;
- (TSCellularPlanProximityTransferController)proxTransferController;
- (TSProximitySourceTransferFlow)initWithPeerDevice:(id)a3;
- (id)firstViewController;
- (id)initForResumption;
- (id)nextViewControllerFrom:(id)a3;
- (int)passcodeType;
- (unsigned)remoteDeviceClass;
- (void)_assertNFC;
- (void)_bootstrapTransfer;
- (void)_deassertNFC;
- (void)_handleSKEvent:(id)a3;
- (void)_proxCardFlowDidDismiss;
- (void)_resetExtension:(id)a3;
- (void)_setupClient:(id)a3;
- (void)dealloc;
- (void)didComplete;
- (void)didRequestPresentationForProxCard:(id)a3;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)setBtClient:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setIsAuthenticationCompleted:(BOOL)a3;
- (void)setIsFlowCompleted:(BOOL)a3;
- (void)setIsHiding:(BOOL)a3;
- (void)setIsRemotePeerClosed:(BOOL)a3;
- (void)setIsResumingAfterPause:(BOOL)a3;
- (void)setIsTransferCompleted:(BOOL)a3;
- (void)setNfcAssertion:(id)a3;
- (void)setPasscodeType:(int)a3;
- (void)setProxTransferController:(id)a3;
- (void)setRemoteDeviceClass:(unsigned __int8)a3;
- (void)setSecureIntentProxCard:(id)a3;
- (void)transferEventUpdate:(id)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSProximitySourceTransferFlow

- (TSProximitySourceTransferFlow)initWithPeerDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TSProximitySourceTransferFlow;
  v5 = [(TSSIMSetupFlow *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_isAuthenticationCompleted = 0;
    v5->_isFlowCompleted = 0;
    v5->_isRemotePeerClosed = 0;
    v5->_passcodeType = 0;
    id v7 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v8 = [v7 initWithQueue:MEMORY[0x263EF83A0]];
    ctClient = v6->_ctClient;
    v6->_ctClient = (CoreTelephonyClient *)v8;

    [(CoreTelephonyClient *)v6->_ctClient setDelegate:v6];
    id v16 = 0;
    v10 = (void *)[objc_alloc(MEMORY[0x263EFEF20]) initWithDictionary:v4 error:&v16];
    id v11 = v16;
    if (v11)
    {
      v12 = _TSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TSProximitySourceTransferFlow initWithPeerDevice:]();
      }

      char v13 = 0;
    }
    else if ([v10 nearbyActionDeviceClass])
    {
      char v13 = [v10 nearbyActionDeviceClass];
    }
    else
    {
      v14 = _TSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TSProximitySourceTransferFlow initWithPeerDevice:]";
        _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "no device class from bluetooth, set as iPhone @%s", buf, 0xCu);
      }

      char v13 = 1;
    }
    v6->_remoteDeviceClass = v13;
    [(TSProximitySourceTransferFlow *)v6 _setupClient:v4];
    [(TSProximitySourceTransferFlow *)v6 _assertNFC];
  }
  return v6;
}

- (id)initForResumption
{
  v8.receiver = self;
  v8.super_class = (Class)TSProximitySourceTransferFlow;
  v2 = [(TSSIMSetupFlow *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_isAuthenticationCompleted = 1;
    v2->_isFlowCompleted = 0;
    v2->_isRemotePeerClosed = 0;
    id v4 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v5 = [v4 initWithQueue:MEMORY[0x263EF83A0]];
    ctClient = v3->_ctClient;
    v3->_ctClient = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v3->_ctClient setDelegate:v3];
    v3->_isResumingAfterPause = 1;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[TSProximitySourceTransferFlow dealloc]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "invalidate SKSetupSIMTransferClient @%s", buf, 0xCu);
  }

  if (self->_isHiding)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TSProximitySourceTransferFlow dealloc]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "TSProximitySourceTransferFlow hidden @%s", buf, 0xCu);
    }
  }
  else
  {
    btClient = self->_btClient;
    if (btClient)
    {
      [(SSProximityDevice *)btClient invalidate:0];
      v6 = self->_btClient;
      self->_btClient = 0;

      [(TSProximitySourceTransferFlow *)self _deassertNFC];
    }
    else
    {
      [(CoreTelephonyClient *)self->_ctClient invalidateProximityTransfer:1 force:1 completion:0];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TSProximitySourceTransferFlow;
  [(TSProximitySourceTransferFlow *)&v7 dealloc];
}

- (id)firstViewController
{
  *(void *)&v41[5] = *MEMORY[0x263EF8340];
  if (+[TSUtilities inBuddy])
  {
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(TSProximitySourceTransferFlow *)v3 firstViewController];
    }
LABEL_4:

LABEL_5:
    id v11 = 0;
    goto LABEL_36;
  }
  if (self->_isResumingAfterPause)
  {
    v12 = [TSPRXSIMTransferringViewController alloc];
    char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"PRXCARD_TRANSFERRING_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"PRXCARD_TRANSFERRING_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    id v11 = [(TSPRXSIMTransferringViewController *)v12 initWithTitle:v14 subtitle:v16 otpDetectorNeeded:0];

    [(TSSIMSetupFlow *)self setTopViewController:v11];
  }
  else
  {
    if (!self->_btClient)
    {
      v3 = _TSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(TSProximitySourceTransferFlow *)v3 firstViewController];
      }
      goto LABEL_4;
    }
    unsigned int v17 = MGGetSInt32Answer();
    if (v17 >= 0x10)
    {
      v18 = _TSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        [(TSProximitySourceTransferFlow *)v17 firstViewController];
      }

      unsigned int v17 = 0;
    }
    if (self->_remoteDeviceClass) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19 && v17 != self->_remoteDeviceClass)
    {
      v33 = _TSLogDomain();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int remoteDeviceClass = self->_remoteDeviceClass;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v40 = remoteDeviceClass;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v17;
        v41[0] = 2080;
        *(void *)&v41[1] = "-[TSProximitySourceTransferFlow firstViewController]";
        _os_log_impl(&dword_227A17000, v33, OS_LOG_TYPE_DEFAULT, "device class mismatch. remote(%d), local(%d) @%s", buf, 0x18u);
      }

      goto LABEL_5;
    }
    ctClient = self->_ctClient;
    id v38 = 0;
    int v22 = [(CoreTelephonyClient *)ctClient isAnyPlanTransferableFromThisDeviceOrError:&v38];
    id v23 = v38;
    id v11 = 0;
    if (v22)
    {
      if (+[TSUtilities isDeviceLocked])
      {
        v24 = _TSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)v40 = "-[TSProximitySourceTransferFlow firstViewController]";
          _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "device locked. unlock first. @%s", buf, 0xCu);
        }

        v25 = objc_alloc_init(TSPRXDeviceUnlockViewController);
      }
      else
      {
        v25 = [[TSPRXStartViewController alloc] initWithBtDevice:self->_btClient];
      }
      id v11 = (TSPRXSIMTransferringViewController *)v25;
      [(TSPRXDeviceUnlockViewController *)v25 setDelegate:self];
      [(TSSIMSetupFlow *)self setTopViewController:v11];
      v36 = _TSLogDomain();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v40 = v11;
        *(_WORD *)&v40[8] = 2080;
        *(void *)v41 = "-[TSProximitySourceTransferFlow firstViewController]";
        _os_log_impl(&dword_227A17000, v36, OS_LOG_TYPE_DEFAULT, "first view controller: %@ @%s", buf, 0x16u);
      }
    }
  }
LABEL_36:
  return v11;
}

- (void)firstViewController:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(TSSIMSetupFlow *)self delegate];
  int v6 = [v5 conformsToProtocol:&unk_26DC47120];

  if (v6)
  {
    uint64_t v7 = [(TSSIMSetupFlow *)self delegate];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__TSProximitySourceTransferFlow_firstViewController___block_invoke;
    v9[3] = &unk_2648279D0;
    v9[4] = self;
    [v7 setViewDisappearHandler:v9];
  }
  else
  {
    uint64_t v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[TSProximitySourceTransferFlow firstViewController:](v7);
    }
  }

  uint64_t v8 = [(TSProximitySourceTransferFlow *)self firstViewController];
  v4[2](v4, v8);
}

uint64_t __53__TSProximitySourceTransferFlow_firstViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _proxCardFlowDidDismiss];
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  if (self->_isRemotePeerClosed) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [[TSPRXPasscodeEntryViewController alloc] initWithBtDevice:self->_btClient passcodeType:self->_passcodeType];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!self->_isAuthenticationCompleted) {
        goto LABEL_2;
      }
      uint64_t v8 = [TSPRXSIMTransferringViewController alloc];
      uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v10 = [v9 localizedStringForKey:@"PRXCARD_TRANSFERRING_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"PRXCARD_TRANSFERRING_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      uint64_t v5 = [(TSPRXSIMTransferringViewController *)v8 initWithTitle:v10 subtitle:v12 otpDetectorNeeded:1];

      if (!v5) {
        goto LABEL_2;
      }
      goto LABEL_3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_2;
    }
    secureIntentProxCard = self->_secureIntentProxCard;
    if (secureIntentProxCard)
    {
      uint64_t v5 = secureIntentProxCard;
      goto LABEL_3;
    }
    if (!self->_isTransferCompleted)
    {
LABEL_2:
      self->_isFlowCompleted = 1;
      [(TSProximitySourceTransferFlow *)self _deassertNFC];
      [(TSSIMSetupFlow *)self setIdleTimerDisabled:0];
      uint64_t v5 = 0;
      goto LABEL_3;
    }
    [(TSProximitySourceTransferFlow *)self _deassertNFC];
    [(TSSIMSetupFlow *)self setIdleTimerDisabled:0];
    uint64_t v7 = objc_alloc_init(TSPRXSIMTransferCompleteViewController);
  }
  uint64_t v5 = (TSPRXSIMTransferringViewController *)v7;
  if (!v7) {
    goto LABEL_2;
  }
LABEL_3:

  return v5;
}

- (void)didRequestPresentationForProxCard:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke;
  block[3] = &unk_264827B08;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v6 = (uint64_t *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = *v6;
      id v8 = objc_loadWeakRetained(v2);
      [v8 setSecureIntentProxCard:v7];

      id v12 = objc_loadWeakRetained(v2);
      uint64_t v9 = [v12 topViewController];
      [v12 viewControllerDidComplete:v9];
    }
    else
    {
      id v11 = _TSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_1((uint64_t)v6, v11);
      }
    }
  }
  else
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_2(v2, v10);
    }
  }
}

- (void)didComplete
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__TSProximitySourceTransferFlow_didComplete__block_invoke;
  v2[3] = &unk_264827A20;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __44__TSProximitySourceTransferFlow_didComplete__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isRemotePeerClosed];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (!v3)
  {
    int v6 = [v4 secureIntentProxCard];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = objc_loadWeakRetained(v1);
      uint64_t v9 = [v8 secureIntentProxCard];

      if ([v9 isSecureIntentFailed])
      {
        uint64_t v10 = _TSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v38 = "-[TSProximitySourceTransferFlow didComplete]_block_invoke";
          _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "secure intent failed, cancel the flow @%s", buf, 0xCu);
        }

        id v11 = objc_loadWeakRetained(v1);
        [v11 _deassertNFC];

        id v12 = objc_loadWeakRetained(v1);
        [v12 userDidTapCancel];

LABEL_23:
        return;
      }
    }
    id v13 = objc_loadWeakRetained(v1);
    [v13 setSecureIntentProxCard:0];

    id v14 = objc_loadWeakRetained(v1);
    v15 = [v14 topViewController];
    uint64_t v9 = [v15 navigationController];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = [v9 viewControllers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = objc_loadWeakRetained(v1);
            [v29 setTopViewController:v21];

            id v30 = (id)[v9 popToViewController:v21 animated:1];
            goto LABEL_22;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v16 = _TSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __44__TSProximitySourceTransferFlow_didComplete__block_invoke_cold_1(v16, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_22:

    goto LABEL_23;
  }
  [v4 _deassertNFC];

  id v31 = objc_loadWeakRetained(v1);
  [v31 attemptFailed];
}

- (void)transferEventUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v4;
    __int16 v22 = 2080;
    uint64_t v23 = "-[TSProximitySourceTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", buf, 0x16u);
  }

  int v6 = [v4 objectForKey:@"kTransferConfirmation"];

  if (v6)
  {
    uint64_t v7 = [(TSSIMSetupFlow *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      self->_isTransferCompleted = 1;
      uint64_t v9 = [(TSSIMSetupFlow *)self topViewController];
      [(TSProximitySourceTransferFlow *)self viewControllerDidComplete:v9];
    }
  }
  uint64_t v10 = [v4 objectForKey:@"UpdateProxCardVisibility"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v10 BOOLValue])
      {
        id v11 = _TSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[TSProximitySourceTransferFlow transferEventUpdate:](v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
      else
      {
        self->_isHiding = 1;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __53__TSProximitySourceTransferFlow_transferEventUpdate___block_invoke;
        v19[3] = &unk_2648279D0;
        v19[4] = self;
        [(TSProximitySourceTransferFlow *)self _resetExtension:v19];
      }
    }
  }
}

uint64_t __53__TSProximitySourceTransferFlow_transferEventUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endFlowGracefully:2];
}

- (void)viewControllerDidComplete:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TSProximitySourceTransferFlow *)self didComplete];
  }
  else
  {
    id v5 = [(TSProximitySourceTransferFlow *)self nextViewControllerFrom:v4];

    if (v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSProximitySourceTransferFlow;
      [(TSSIMSetupFlow *)&v7 viewControllerDidComplete:v4];
    }
    else
    {
      int v6 = _TSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = "-[TSProximitySourceTransferFlow viewControllerDidComplete:]";
        _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "flow end, reset extension @%s", buf, 0xCu);
      }

      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__TSProximitySourceTransferFlow_viewControllerDidComplete___block_invoke;
      v8[3] = &unk_264827A70;
      id v9 = v4;
      uint64_t v10 = self;
      [(TSProximitySourceTransferFlow *)self _resetExtension:v8];
    }
  }
}

id __59__TSProximitySourceTransferFlow_viewControllerDidComplete___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TSProximitySourceTransferFlow;
  return objc_msgSendSuper2(&v3, sel_viewControllerDidComplete_, v1);
}

- (void)_setupClient:(id)a3
{
  id v4 = a3;
  if (self->_btClient)
  {
    id v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[TSProximitySourceTransferFlow _setupClient:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v13 = [SSProximityDevice alloc];
    uint64_t v14 = [(SSProximityDevice *)v13 initWithQueue:MEMORY[0x263EF83A0] endpoint:1 remoteInfo:v4];
    btClient = self->_btClient;
    self->_btClient = v14;

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__TSProximitySourceTransferFlow__setupClient___block_invoke;
    v16[3] = &unk_264828A40;
    objc_copyWeak(&v17, &location);
    [(SSProximityDevice *)self->_btClient setEventHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __46__TSProximitySourceTransferFlow__setupClient___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSKEvent:v3];
}

- (void)_handleSKEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    *(void *)uint64_t v23 = v4;
    *(_WORD *)&v23[8] = 2080;
    uint64_t v24 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "receive SKEvent: %@ @%s", (uint8_t *)&v22, 0x16u);
  }

  int v6 = [v4 eventType];
  if (v6 <= 40)
  {
    if (v6 != 20)
    {
      if (v6 == 40)
      {
        [(TSSIMSetupFlow *)self setIdleTimerDisabled:1];
        [(TSProximitySourceTransferFlow *)self _bootstrapTransfer];
      }
      goto LABEL_29;
    }
    uint64_t v15 = [v4 error];

    if (v15) {
      goto LABEL_29;
    }
    self->_isAuthenticationCompleted = 1;
    goto LABEL_19;
  }
  if (v6 == 41)
  {
    [(TSProximitySourceTransferFlow *)self _deassertNFC];
    [(TSSIMSetupFlow *)self setIdleTimerDisabled:0];
    uint64_t v16 = _TSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      *(void *)uint64_t v23 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
      _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "connection closed from remote peer @%s", (uint8_t *)&v22, 0xCu);
    }

    self->_isRemotePeerClosed = 1;
    id v17 = [(TSSIMSetupFlow *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_19:
      id v7 = [(TSSIMSetupFlow *)self topViewController];
      [(TSProximitySourceTransferFlow *)self viewControllerDidComplete:v7];
LABEL_28:
    }
  }
  else
  {
    if (v6 != 120) {
      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v4;
      uint64_t v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [v7 pairingFlags];
        int v10 = [v7 passwordType];
        int v11 = [v7 throttleSeconds];
        int v22 = 67109890;
        *(_DWORD *)uint64_t v23 = v9;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v10;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v11;
        HIWORD(v24) = 2080;
        uint64_t v25 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
        _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "flag:%d, type:%d, throttle:%d @%s", (uint8_t *)&v22, 0x1Eu);
      }

      self->_passcodeType = [v7 passwordType];
      uint64_t v12 = [(TSSIMSetupFlow *)self topViewController];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      uint64_t v14 = [(TSSIMSetupFlow *)self topViewController];
      if (v13)
      {
        [(TSProximitySourceTransferFlow *)self viewControllerDidComplete:v14];
      }
      else
      {
        objc_opt_class();
        char v20 = objc_opt_isKindOfClass();

        if ((v20 & 1) == 0) {
          goto LABEL_28;
        }
        id v21 = _TSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136315138;
          *(void *)uint64_t v23 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
          _os_log_impl(&dword_227A17000, v21, OS_LOG_TYPE_DEFAULT, "the PIN code is wrong, retry @%s", (uint8_t *)&v22, 0xCu);
        }

        uint64_t v14 = [(TSSIMSetupFlow *)self topViewController];
        [v14 retry];
      }

      goto LABEL_28;
    }
    uint64_t v19 = _TSLogDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[TSProximitySourceTransferFlow _handleSKEvent:](v4, v19);
    }
  }
LABEL_29:
}

- (void)_bootstrapTransfer
{
  if (!self->_proxTransferController)
  {
    id v3 = [[TSCellularPlanProximityTransferController alloc] initWithESIMDelegate:self];
    proxTransferController = self->_proxTransferController;
    self->_proxTransferController = v3;
  }
  id v5 = [(SSProximityDevice *)self->_btClient templateSession];
  objc_initWeak(&location, self);
  ctClient = self->_ctClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke;
  v7[3] = &unk_264828A68;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  [(CoreTelephonyClient *)ctClient bootstrapPlanTransferForEndpoint:1 usingMessageSession:v5 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_cold_1();
    }

    id v5 = +[TSUtilities getErrorTitleDetail:v3 forCarrier:0];
    int v6 = (void *)MEMORY[0x263F82418];
    id v7 = [v5 objectForKeyedSubscript:@"ErrorHeader"];
    id v8 = [v5 objectForKeyedSubscript:@"ErrorDetail"];
    int v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    int v10 = (void *)MEMORY[0x263F82400];
    int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_118;
    v19[3] = &unk_264827A48;
    char v13 = (id *)(a1 + 40);
    objc_copyWeak(&v20, v13);
    uint64_t v14 = [v10 actionWithTitle:v12 style:1 handler:v19];
    [v9 addAction:v14];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_2;
    block[3] = &unk_264827B08;
    objc_copyWeak(&v18, v13);
    id v17 = v9;
    id v15 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
  }
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_118(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained btClient];
  [v3 invalidate:1];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setBtClient:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 _deassertNFC];

  id v6 = objc_loadWeakRetained(v1);
  [v6 userDidTapCancel];
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained topViewController];
  [v2 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

- (void)_resetExtension:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (objc_opt_respondsToSelector())
  {
    ctClient = self->_ctClient;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__TSProximitySourceTransferFlow__resetExtension___block_invoke;
    v14[3] = &unk_264827FE8;
    id v15 = v4;
    [(CoreTelephonyClient *)ctClient resetProximityTransportExtension:v14];
  }
  else
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSProximitySourceTransferFlow _resetExtension:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v4[2](v4);
  }
}

void __49__TSProximitySourceTransferFlow__resetExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__TSProximitySourceTransferFlow__resetExtension___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_proxCardFlowDidDismiss
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(TSSIMSetupFlow *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isFlowCompleted = self->_isFlowCompleted;
      BOOL isAuthenticationCompleted = self->_isAuthenticationCompleted;
      int v9 = 67109634;
      *(_DWORD *)uint64_t v10 = isFlowCompleted;
      *(_WORD *)&v10[4] = 1024;
      *(_DWORD *)&v10[6] = isAuthenticationCompleted;
      __int16 v11 = 2080;
      uint64_t v12 = "-[TSProximitySourceTransferFlow _proxCardFlowDidDismiss]";
      _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "flow dismiss. flow.complete:%d, auth.complete:%d @%s", (uint8_t *)&v9, 0x18u);
    }

    if (!self->_isFlowCompleted)
    {
      uint64_t v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        *(void *)uint64_t v10 = "-[TSProximitySourceTransferFlow _proxCardFlowDidDismiss]";
        _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "prox card being dismissed @%s", (uint8_t *)&v9, 0xCu);
      }

      [(TSSIMSetupFlow *)self attemptFailed];
      [(TSProximitySourceTransferFlow *)self _deassertNFC];
    }
  }
}

- (void)_assertNFC
{
  if (!self->_nfcAssertion)
  {
    self->_nfcAssertion = objc_alloc_init(SSNFCAssertion);
    MEMORY[0x270F9A758]();
  }
}

- (void)_deassertNFC
{
  self->_nfcAssertion = 0;
  MEMORY[0x270F9A758]();
}

- (SSProximityDevice)btClient
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBtClient:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCtClient:(id)a3
{
}

- (BOOL)isAuthenticationCompleted
{
  return self->_isAuthenticationCompleted;
}

- (void)setIsAuthenticationCompleted:(BOOL)a3
{
  self->_BOOL isAuthenticationCompleted = a3;
}

- (BOOL)isFlowCompleted
{
  return self->_isFlowCompleted;
}

- (void)setIsFlowCompleted:(BOOL)a3
{
  self->_BOOL isFlowCompleted = a3;
}

- (BOOL)isRemotePeerClosed
{
  return self->_isRemotePeerClosed;
}

- (void)setIsRemotePeerClosed:(BOOL)a3
{
  self->_isRemotePeerClosed = a3;
}

- (BOOL)isTransferCompleted
{
  return self->_isTransferCompleted;
}

- (void)setIsTransferCompleted:(BOOL)a3
{
  self->_isTransferCompleted = a3;
}

- (BOOL)isHiding
{
  return self->_isHiding;
}

- (void)setIsHiding:(BOOL)a3
{
  self->_isHiding = a3;
}

- (BOOL)isResumingAfterPause
{
  return self->_isResumingAfterPause;
}

- (void)setIsResumingAfterPause:(BOOL)a3
{
  self->_isResumingAfterPause = a3;
}

- (int)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(int)a3
{
  self->_passcodeType = a3;
}

- (TSCellularPlanProximityTransferController)proxTransferController
{
  return (TSCellularPlanProximityTransferController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setProxTransferController:(id)a3
{
}

- (PRXCardContentProviding)secureIntentProxCard
{
  return (PRXCardContentProviding *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSecureIntentProxCard:(id)a3
{
}

- (unsigned)remoteDeviceClass
{
  return self->_remoteDeviceClass;
}

- (void)setRemoteDeviceClass:(unsigned __int8)a3
{
  self->_int remoteDeviceClass = a3;
}

- (SSNFCAssertion)nfcAssertion
{
  return (SSNFCAssertion *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNfcAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcAssertion, 0);
  objc_storeStrong((id *)&self->_secureIntentProxCard, 0);
  objc_storeStrong((id *)&self->_proxTransferController, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_btClient, 0);
}

- (void)initWithPeerDevice:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  id v3 = "-[TSProximitySourceTransferFlow initWithPeerDevice:]";
  OUTLINED_FUNCTION_2_1(&dword_227A17000, v0, v1, "[E]invalid cb device : %@ @%s", v2);
}

- (void)firstViewController
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  uint64_t v4 = "-[TSProximitySourceTransferFlow firstViewController]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]invalid device class read from mobile gestalt : %d @%s", (uint8_t *)v2, 0x12u);
}

- (void)firstViewController:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 138412546;
  v2 = &unk_26DC47120;
  __int16 v3 = 2080;
  uint64_t v4 = "-[TSProximitySourceTransferFlow firstViewController:]";
  _os_log_fault_impl(&dword_227A17000, log, OS_LOG_TYPE_FAULT, "[F]delegate not conforms to protocol : %@ @%s", (uint8_t *)&v1, 0x16u);
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = "-[TSProximitySourceTransferFlow didRequestPresentationForProxCard:]_block_invoke";
  OUTLINED_FUNCTION_2_1(&dword_227A17000, a2, v3, "[E]invalid secure intent prox card:%@ @%s", v4);
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v4 = [WeakRetained topViewController];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = "-[TSProximitySourceTransferFlow didRequestPresentationForProxCard:]_block_invoke";
  OUTLINED_FUNCTION_2_1(&dword_227A17000, a2, v5, "[E]invalid current view controller:%@ @%s", v6);
}

void __44__TSProximitySourceTransferFlow_didComplete__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transferEventUpdate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setupClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleSKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = 67109634;
  v4[1] = [a1 eventType];
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint64_t v8 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]invalid SKEvent class for event : %d : %@ @%s", (uint8_t *)v4, 0x1Cu);
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v3 = "-[TSProximitySourceTransferFlow _bootstrapTransfer]_block_invoke";
  OUTLINED_FUNCTION_2_1(&dword_227A17000, v0, v1, "[E]bootstrap plan transfer failed : %@ @%s", v2);
}

- (void)_resetExtension:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__TSProximitySourceTransferFlow__resetExtension___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v3 = "-[TSProximitySourceTransferFlow _resetExtension:]_block_invoke";
  OUTLINED_FUNCTION_2_1(&dword_227A17000, v0, v1, "[E]resetCBExtension failed : %@ @%s", v2);
}

@end