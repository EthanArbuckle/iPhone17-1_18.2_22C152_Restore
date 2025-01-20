@interface TSCellularPlanActivatingFlow
- (BOOL)_isAppInBackground;
- (BOOL)_startedByFollowup;
- (BOOL)eSIMInstallFromWebsheetFlowStarted;
- (BOOL)maybeShowConfirmationCodePane;
- (BOOL)oneTimePasscodePaneShown;
- (BOOL)planActiveOnSource;
- (BOOL)shouldOfferFallbackOptionOnError:(id)a3;
- (BOOL)shouldShowCompletePaneOnTimeout;
- (BOOL)showConfirmationCodePane;
- (BOOL)skipActivatingPane;
- (BOOL)termsAndConditionsShown;
- (CTCellularPlanItem)updatePlanItem;
- (CoreTelephonyClient)client;
- (NSDictionary)websheetOptions;
- (NSError)failureWebsheetError;
- (NSError)planInstallError;
- (NSError)transferError;
- (NSNumber)waitForPhoneNumber;
- (NSString)carrierErrorCode;
- (NSString)carrierName;
- (NSString)installingPlanIdentifier;
- (NSString)phoneNumber;
- (NSString)planName;
- (NSString)sourceIccid;
- (NSString)subscriptionContextUUID;
- (NSTimer)activatingTimer;
- (TSCellularPlanActivatingFlow)initWithSkipActivatingPane:(BOOL)a3 timerType:(int64_t)a4 transferBackPlan:(id)a5 setupType:(unint64_t)a6 carrierName:(id)a7 maybeShowConfirmationCodePane:(BOOL)a8;
- (TSSIMSetupFlow)websheetFlow;
- (TSTermsAndConditionsViewController)termsAndConditionsViewController;
- (TSTransferOneTimeCodeViewController)oneTimeCodeViewController;
- (UIBarButtonItem)cancelButton;
- (UINavigationController)websheetRootViewController;
- (double)startTime;
- (id)_firstViewController;
- (id)firstViewController;
- (id)firstViewControllerCallback;
- (id)nextViewControllerFrom:(id)a3;
- (id)transferBackOldItem;
- (int64_t)timeoutReason;
- (int64_t)transferState;
- (unint64_t)backgroundTask;
- (unint64_t)currentActivatingState;
- (unint64_t)planSetupType;
- (void)_displayOneTimeCodeViewController:(id)a3 carrierName:(id)a4 usePin:(BOOL)a5;
- (void)_displayTermsAndConditionsViewController:(id)a3;
- (void)_handleActivatingExpiry;
- (void)_handleOtpStatusUpdate:(int64_t)a3;
- (void)_maybeDeleteTransferBackItem:(id)a3;
- (void)_maybeDismissAlert:(id)a3;
- (void)_maybeMoveToNextViewController;
- (void)_onESIMInstallFromWebSheetFlowStart;
- (void)_onTransferError:(id)a3;
- (void)_shouldWaitUntilPhoneNumberBeReady:(id)a3;
- (void)_startBackgroundTask;
- (void)_stopBackgroundTask;
- (void)_stopTimerWithBackgroundTaskState:(BOOL)a3;
- (void)_submitCellularPlanSetupDetails;
- (void)cancelFlow;
- (void)dealloc;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)launchWebsheet:(id)a3 completion:(id)a4;
- (void)offerFallbackOption;
- (void)planItemsUpdated:(id)a3 planListError:(id)a4;
- (void)redirectToBTFlow;
- (void)setActivatingTimer:(id)a3;
- (void)setBackgroundTask:(unint64_t)a3;
- (void)setCancelButton:(id)a3;
- (void)setCarrierErrorCode:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setClient:(id)a3;
- (void)setCurrentActivatingState:(unint64_t)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setESIMInstallFromWebsheetFlowStarted:(BOOL)a3;
- (void)setFailureWebsheetError:(id)a3;
- (void)setFirstViewControllerCallback:(id)a3;
- (void)setInstallingPlanIdentifier:(id)a3;
- (void)setMaybeShowConfirmationCodePane:(BOOL)a3;
- (void)setOneTimeCodeViewController:(id)a3;
- (void)setOneTimePasscodePaneShown:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPlanActiveOnSource:(BOOL)a3;
- (void)setPlanInstallError:(id)a3;
- (void)setPlanName:(id)a3;
- (void)setPlanSetupType:(unint64_t)a3;
- (void)setShouldShowCompletePaneOnTimeout:(BOOL)a3;
- (void)setShowConfirmationCodePane:(BOOL)a3;
- (void)setSkipActivatingPane:(BOOL)a3;
- (void)setSourceIccid:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setSubscriptionContextUUID:(id)a3;
- (void)setTermsAndConditionsShown:(BOOL)a3;
- (void)setTermsAndConditionsViewController:(id)a3;
- (void)setTimeoutReason:(int64_t)a3;
- (void)setTopViewController:(id)a3;
- (void)setTransferBackOldItem:(id)a3;
- (void)setTransferError:(id)a3;
- (void)setTransferState:(int64_t)a3;
- (void)setUpdatePlanItem:(id)a3;
- (void)setWaitForPhoneNumber:(id)a3;
- (void)setWebsheetFlow:(id)a3;
- (void)setWebsheetOptions:(id)a3;
- (void)setWebsheetRootViewController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)startTimer:(int64_t)a3;
- (void)transferEventUpdate:(id)a3;
- (void)userDidTapCancel;
@end

@implementation TSCellularPlanActivatingFlow

- (TSCellularPlanActivatingFlow)initWithSkipActivatingPane:(BOOL)a3 timerType:(int64_t)a4 transferBackPlan:(id)a5 setupType:(unint64_t)a6 carrierName:(id)a7 maybeShowConfirmationCodePane:(BOOL)a8
{
  id v15 = a5;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TSCellularPlanActivatingFlow;
  v17 = [(TSSIMSetupFlow *)&v27 init];
  v18 = v17;
  if (v17)
  {
    v17->_backgroundTask = *MEMORY[0x263F833E0];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v17 action:sel_userDidTapCancel];
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIBarButtonItem *)v19;

    v18->_currentActivatingState = 0;
    v18->_skipActivatingPane = a3;
    v18->_shouldShowCompletePaneOnTimeout = 0;
    v18->_planActiveOnSource = 1;
    v18->_transferState = 0;
    objc_storeStrong(&v18->_transferBackOldItem, a5);
    v18->_termsAndConditionsShown = 0;
    v18->_oneTimePasscodePaneShown = 0;
    v18->_maybeShowConfirmationCodePane = a8;
    v18->_showConfirmationCodePane = 0;
    v21 = +[TSCellularPlanManagerCache sharedInstance];
    [v21 setDelegate:v18];

    id v22 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v23 = [v22 initWithQueue:MEMORY[0x263EF83A0]];
    client = v18->_client;
    v18->_client = (CoreTelephonyClient *)v23;

    [(CoreTelephonyClient *)v18->_client setDelegate:v18];
    [(TSCellularPlanActivatingFlow *)v18 startTimer:a4];
    v18->_startTime = CFAbsoluteTimeGetCurrent();
    v18->_planSetupType = a6;
    objc_storeStrong((id *)&v18->_planName, a7);
    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v18 selector:sel__onTransferError_ name:@"transfer.failed" object:0];
  }
  return v18;
}

- (void)dealloc
{
  [(TSCellularPlanActivatingFlow *)self _stopTimerWithBackgroundTaskState:0];
  v3 = +[TSCellularPlanManagerCache sharedInstance];
  [v3 resetDelegate:self];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanActivatingFlow;
  [(TSCellularPlanActivatingFlow *)&v5 dealloc];
}

- (void)cancelFlow
{
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(TSCellularPlanActivatingFlow *)v2 firstViewController];
  }

  return 0;
}

- (void)firstViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, TSCellularSetupActivatingViewController *))a3;
  if (v4)
  {
    if (_os_feature_enabled_impl())
    {
      if (self->_skipActivatingPane)
      {
        uint64_t v5 = _TSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315138;
          v14 = "-[TSCellularPlanActivatingFlow firstViewController:]";
          _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "cache firstViewController callback @%s", (uint8_t *)&v13, 0xCu);
        }

        uint64_t v6 = (void *)MEMORY[0x22A683B20](v4);
        id firstViewControllerCallback = self->_firstViewControllerCallback;
        self->_id firstViewControllerCallback = v6;

        uint64_t v8 = +[TSCellularPlanManagerCache sharedInstance];
        uint64_t v9 = [(TSCellularSetupActivatingViewController *)v8 planItems];
        [(TSCellularPlanActivatingFlow *)self planItemsUpdated:v9 planListError:0];
      }
      else
      {
        uint64_t v8 = objc_alloc_init(TSCellularSetupActivatingViewController);
        v11 = _TSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412546;
          v14 = (const char *)v8;
          __int16 v15 = 2080;
          id v16 = "-[TSCellularPlanActivatingFlow firstViewController:]";
          _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v13, 0x16u);
        }

        [(TSCellularSetupActivatingViewController *)v8 setDelegate:self];
        [(TSCellularPlanActivatingFlow *)self setTopViewController:v8];
        v4[2](v4, v8);
        uint64_t v9 = +[TSCellularPlanManagerCache sharedInstance];
        v12 = [v9 planItems];
        [(TSCellularPlanActivatingFlow *)self planItemsUpdated:v12 planListError:0];
      }
    }
    else
    {
      v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        v14 = "-[TSCellularPlanActivatingFlow firstViewController:]";
        _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/ProvisioningCompletion is disabled @%s", (uint8_t *)&v13, 0xCu);
      }

      v4[2](v4, 0);
    }
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(TSCellularPlanActivatingFlow *)self _stopTimerWithBackgroundTaskState:0];
    uint64_t v5 = 168;
    if (self->_transferError) {
      goto LABEL_4;
    }
    if (self->_showConfirmationCodePane)
    {
      uint64_t v7 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_planName];
      self->_showConfirmationCodePane = 0;
      if (v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    uint64_t v5 = 160;
    if (self->_planInstallError)
    {
LABEL_4:
      uint64_t v6 = [[TSMidOperationFailureViewController alloc] initWithPlanItemError:*(Class *)((char *)&self->super.super.isa + v5) updatePlanItem:self->_updatePlanItem withBackButton:+[TSUtilities inBuddy] forCarrier:self->_carrierName withCarrierErrorCode:self->_carrierErrorCode];
      goto LABEL_5;
    }
    unint64_t currentActivatingState = self->_currentActivatingState;
    if (currentActivatingState == 2)
    {
      uint64_t v6 = [[TSCellularSetupTimeoutFailureViewController alloc] initWithTimeoutReason:self->_timeoutReason];
LABEL_5:
      uint64_t v7 = (TSCellularPlanUserConsentViewController *)v6;
      if (v6) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    if (currentActivatingState == 1)
    {
      uint64_t v6 = [[TSCellularSetupCompleteViewController alloc] initWithPhoneNumber:self->_phoneNumber planName:self->_planName planActiveOnSource:self->_planActiveOnSource];
      goto LABEL_5;
    }
LABEL_19:
    [(TSCellularPlanActivatingFlow *)self _stopBackgroundTask];
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v8 = [v4 confirmationCode];
  uint64_t v9 = _TSLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    int v13 = v8;
    __int16 v14 = 2080;
    __int16 v15 = "-[TSCellularPlanActivatingFlow nextViewControllerFrom:]";
    _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "confirmationCode:%@ @%s", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v7 = [[TSCellularPlanUserConsentViewController alloc] initWithConfirmationCode:self->_planName consentType:4 requireAdditionalConsent:0 confirmationCode:v8 acceptButtonTapped:1];
  if (!v7) {
    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

- (void)setTopViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(TSCellularPlanActivatingFlow *)self _submitCellularPlanSetupDetails];
  }
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanActivatingFlow;
  [(TSSIMSetupFlow *)&v5 setTopViewController:v4];
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v82 = a3;
  uint64_t v6 = (char *)a4;
  uint64_t v7 = v6;
  p_planInstallError = &self->_planInstallError;
  if (self->_planInstallError)
  {
    uint64_t v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_planInstallError;
      *(_DWORD *)buf = 138412802;
      v102 = (const char *)v10;
      __int16 v103 = 2112;
      v104 = v7;
      __int16 v105 = 2080;
      v106 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "received error already : %@, new error: %@ @%s", buf, 0x20u);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (!v6)
  {
    if (!v82)
    {
      v24 = _TSLogDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:](v24, v25, v26, v27, v28, v29, v30, v31);
      }

      goto LABEL_5;
    }
    if (self->_currentActivatingState == 1)
    {
      uint64_t v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
        _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Already activated - early return @%s", buf, 0xCu);
      }
      goto LABEL_4;
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id obj = v82;
    uint64_t v32 = [obj countByEnumeratingWithState:&v85 objects:v109 count:16];
    if (!v32) {
      goto LABEL_71;
    }
    uint64_t v34 = *(void *)v86;
    *(void *)&long long v33 = 138412802;
    long long v80 = v33;
LABEL_40:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v86 != v34) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v85 + 1) + 8 * v35);
      if (objc_msgSend(v36, "isInstalling", v80))
      {
        if (![(NSString *)self->_planName length])
        {
          v53 = [v36 carrierName];
          planName = self->_planName;
          self->_planName = v53;
        }
        v55 = [v36 iccid];
        BOOL v56 = [v55 length] == 0;

        if (!v56)
        {
          v57 = [v36 iccid];
          installingPlanIdentifier = self->_installingPlanIdentifier;
          self->_installingPlanIdentifier = v57;
        }
        objc_storeStrong((id *)&self->_updatePlanItem, v36);
        v59 = _TSLogDomain();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = self->_installingPlanIdentifier;
          v61 = [(CTCellularPlanItem *)self->_updatePlanItem phoneNumber];
          v62 = self->_planName;
          *(_DWORD *)buf = 138413058;
          v102 = (const char *)v60;
          __int16 v103 = 2112;
          v104 = v61;
          __int16 v105 = 2112;
          v106 = (const char *)v62;
          __int16 v107 = 2080;
          v108 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
          _os_log_impl(&dword_227A17000, v59, OS_LOG_TYPE_DEFAULT, "installing -> plan iccid:%@, phone number:%@, carrier name:%@ @%s", buf, 0x2Au);
        }
        v63 = [MEMORY[0x263F08A00] defaultCenter];
        v99 = @"InstallStateKey";
        v100 = @"Install";
        v64 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        [v63 postNotificationName:@"esim.install.state.changed" object:0 userInfo:v64];

        goto LABEL_71;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = self->_installingPlanIdentifier;
        v38 = [v36 iccid];
        LODWORD(v37) = [(NSString *)v37 isEqualToString:v38];

        if (v37) {
          [(TSCellularPlanActivatingFlow *)self _maybeDeleteTransferBackItem:obj];
        }
      }
      v39 = [v36 plan];
      BOOL v40 = [v39 status] == 14;

      if (v40)
      {
        v41 = self->_installingPlanIdentifier;
        if (!v41)
        {
          v44 = _TSLogDomain();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:](v97, &v98, v44);
          }
          goto LABEL_60;
        }
        v42 = [v36 iccid];
        BOOL v43 = [(NSString *)v41 isEqualToString:v42];

        if (v43)
        {
          v44 = [MEMORY[0x263F08A00] defaultCenter];
          v95 = @"InstallStateKey";
          v96 = @"PostInstall";
          v45 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          [v44 postNotificationName:@"esim.install.state.changed" object:0 userInfo:v45];

LABEL_60:
        }
      }
      else
      {
        v46 = [v36 plan];
        BOOL v47 = [v46 status] == 0;

        if (v47)
        {
          v48 = self->_installingPlanIdentifier;
          if (v48)
          {
            v49 = [v36 iccid];
            BOOL v50 = [(NSString *)v48 isEqualToString:v49];

            if (v50)
            {
              if (!+[TSUtilities isPad])
              {
                v65 = [v36 phoneNumber];
                phoneNumber = self->_phoneNumber;
                self->_phoneNumber = v65;
              }
              if (![(NSString *)self->_planName length])
              {
                v67 = [v36 carrierName];
                v68 = self->_planName;
                self->_planName = v67;

                v69 = _TSLogDomain();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v70 = self->_planName;
                  *(_DWORD *)buf = 138412546;
                  v102 = (const char *)v70;
                  __int16 v103 = 2080;
                  v104 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v69, OS_LOG_TYPE_DEFAULT, "%@ plan installed. @%s", buf, 0x16u);
                }
              }
              self->_shouldShowCompletePaneOnTimeout = 1;
              if ([v36 isSelected])
              {
                waitForPhoneNumber = self->_waitForPhoneNumber;
                if (waitForPhoneNumber && [(NSNumber *)waitForPhoneNumber BOOLValue])
                {
                  if ([(NSString *)self->_phoneNumber length])
                  {
                    self->_unint64_t currentActivatingState = 1;
                    [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
                  }
                }
                else
                {
                  if (self->_subscriptionContextUUID) {
                    goto LABEL_99;
                  }
                  v75 = +[TSCellularPlanManagerCache sharedInstance];
                  v76 = [v75 getSubscriptionContextUUIDforPlan:v36];
                  subscriptionContextUUID = self->_subscriptionContextUUID;
                  self->_subscriptionContextUUID = v76;

                  if (self->_subscriptionContextUUID)
                  {
LABEL_99:
                    if (!self->_waitForPhoneNumber)
                    {
                      objc_initWeak((id *)buf, self);
                      v83[0] = MEMORY[0x263EF8330];
                      v83[1] = 3221225472;
                      v83[2] = __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke;
                      v83[3] = &unk_264827958;
                      objc_copyWeak(&v84, (id *)buf);
                      v83[4] = self;
                      [(TSCellularPlanActivatingFlow *)self _shouldWaitUntilPhoneNumberBeReady:v83];
                      objc_destroyWeak(&v84);
                      objc_destroyWeak((id *)buf);
                    }
                  }
                  else
                  {
                    v79 = _TSLogDomain();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                      _os_log_impl(&dword_227A17000, v79, OS_LOG_TYPE_DEFAULT, "Subscription context UUID is not ready @%s", buf, 0xCu);
                    }
                  }
                }
              }
              else if (self->_transferBackOldItem)
              {
                v72 = [MEMORY[0x263F31978] sharedManager];
                v73 = [v72 didSelectPlanItem:v36 isEnable:1];

                v74 = _TSLogDomain();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v102 = v73;
                  __int16 v103 = 2080;
                  v104 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v74, OS_LOG_TYPE_DEFAULT, "transfer back, enable the item. error:%@ @%s", buf, 0x16u);
                }
              }
              else
              {
                v78 = _TSLogDomain();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v102 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v78, OS_LOG_TYPE_DEFAULT, "SIM is not enabled - early return @%s", buf, 0xCu);
                }

                self->_unint64_t currentActivatingState = 1;
                self->_planActiveOnSource = 0;
                [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
              }
              goto LABEL_71;
            }
            v44 = _TSLogDomain();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v51 = self->_installingPlanIdentifier;
              v52 = [v36 iccid];
              *(_DWORD *)buf = v80;
              v102 = (const char *)v51;
              __int16 v103 = 2112;
              v104 = v52;
              __int16 v105 = 2080;
              v106 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
              _os_log_debug_impl(&dword_227A17000, v44, OS_LOG_TYPE_DEBUG, "[Db] active plan is not the provisioning plan. expect:%@, actual:%@ @%s", buf, 0x20u);
            }
          }
          else
          {
            v44 = _TSLogDomain();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:](v93, &v94, v44);
            }
          }
          goto LABEL_60;
        }
      }
      if (v32 == ++v35)
      {
        uint64_t v32 = [obj countByEnumeratingWithState:&v85 objects:v109 count:16];
        if (v32) {
          goto LABEL_40;
        }
LABEL_71:

        goto LABEL_5;
      }
    }
  }
  v11 = [v6 domain];
  uint64_t v12 = *MEMORY[0x263F31920];
  if ([v11 isEqualToString:*MEMORY[0x263F31920]])
  {
    uint64_t v13 = [v7 code];

    if (v13 == 47) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  if (self->_maybeShowConfirmationCodePane)
  {
    __int16 v14 = [v7 domain];
    if ([v14 isEqualToString:v12])
    {
      uint64_t v15 = [v7 code];

      if (v15 == 19)
      {
        if ([v82 count])
        {
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v16 = v82;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v89 objects:v110 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v90;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v90 != v18) {
                  objc_enumerationMutation(v16);
                }
                v20 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                if ([v20 isInstalling] && !-[NSString length](self->_planName, "length"))
                {
                  v21 = [v20 carrierName];
                  id v22 = self->_planName;
                  self->_planName = v21;
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v89 objects:v110 count:16];
            }
            while (v17);
          }

          self->_showConfirmationCodePane = 1;
          [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
        }
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  objc_storeStrong((id *)&self->_planInstallError, a4);
  uint64_t v23 = _TSLogDomain();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[TSCellularPlanActivatingFlow planItemsUpdated:planListError:].cold.4((uint64_t)v7, v23);
  }

  [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
LABEL_5:
}

void __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[13] != 1)
    {
      uint64_t v14 = [NSNumber numberWithBool:a2];
      uint64_t v15 = (void *)*((void *)v5 + 28);
      *((void *)v5 + 28) = v14;

      if (a2)
      {
        if (![*((id *)v5 + 19) length]) {
          goto LABEL_17;
        }
        id v16 = _TSLogDomain();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
          _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "Phone number is already available @%s", (uint8_t *)&v20, 0xCu);
        }

        *((void *)v5 + 13) = 1;
        uint64_t v17 = *(void **)(a1 + 32);
      }
      else
      {
        uint64_t v18 = _TSLogDomain();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
          _os_log_impl(&dword_227A17000, v18, OS_LOG_TYPE_DEFAULT, "Skip waiting for phone number to be ready @%s", (uint8_t *)&v20, 0xCu);
        }

        uint64_t v19 = (void *)*((void *)v5 + 19);
        *((void *)v5 + 19) = &stru_26DBE8E78;

        *((void *)v5 + 13) = 1;
        uint64_t v17 = v5;
      }
      [v17 _maybeMoveToNextViewController];
      goto LABEL_17;
    }
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      v21 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]_block_invoke";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Already activated and return @%s", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

LABEL_17:
}

- (void)transferEventUpdate:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138412546;
    v39 = v4;
    __int16 v40 = 2080;
    v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v38, 0x16u);
  }

  if (self->_failureWebsheetError)
  {
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315138;
      v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "already launch failure url, ignore @%s", (uint8_t *)&v38, 0xCu);
    }
    goto LABEL_43;
  }
  planInstallError = self->_planInstallError;
  self->_planInstallError = 0;

  self->_uint64_t transferState = 0;
  uint64_t v6 = [v4 objectForKey:@"TransferState"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t transferState = [v6 integerValue];
    self->_uint64_t transferState = transferState;
  }
  else
  {
    uint64_t transferState = self->_transferState;
  }
  uint64_t v9 = _TSLogDomain();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (transferState == 3)
  {
    if (v10)
    {
      int v38 = 136315138;
      v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "transfer state launch websheet @%s", (uint8_t *)&v38, 0xCu);
    }

    uint64_t v11 = [v4 objectForKey:@"TransferErrorCode"];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !+[TSUtilities inBuddy])
      {
        objc_msgSend(MEMORY[0x263F31968], "errorForCode:", (int)-[NSObject intValue](v11, "intValue"));
        uint64_t v12 = (NSError *)objc_claimAutoreleasedReturnValue();
        failureWebsheetError = self->_failureWebsheetError;
        self->_failureWebsheetError = v12;

        uint64_t v14 = _TSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = self->_failureWebsheetError;
          int v38 = 138412546;
          v39 = (const char *)v15;
          __int16 v40 = 2080;
          v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "transfer abort, require to launch websheet : %@ @%s", (uint8_t *)&v38, 0x16u);
        }
LABEL_41:
      }
    }
    goto LABEL_42;
  }
  if (v10)
  {
    int64_t v16 = self->_transferState;
    int v38 = 134218242;
    v39 = (const char *)v16;
    __int16 v40 = 2080;
    v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
    _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "transfer state : %ld @%s", (uint8_t *)&v38, 0x16u);
  }

  int64_t v17 = self->_transferState;
  switch(v17)
  {
    case 4:
      if (self->_transferError)
      {
        uint64_t v11 = _TSLogDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          transferError = self->_transferError;
          int v38 = 138412546;
          v39 = (const char *)transferError;
          __int16 v40 = 2080;
          v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "Already received transfer error: [%@]. Ignoring this event @%s", (uint8_t *)&v38, 0x16u);
        }
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v11 = [v4 objectForKey:@"TransferErrorCode"];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(MEMORY[0x263F31968], "errorForCode:", (int)-[NSObject intValue](v11, "intValue"));
          uint64_t v27 = (NSError *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = self->_transferError;
          self->_transferError = v27;

          uint64_t v29 = _TSLogDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = self->_transferError;
            int v38 = 138412546;
            v39 = (const char *)v30;
            __int16 v40 = 2080;
            v41 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
            _os_log_impl(&dword_227A17000, v29, OS_LOG_TYPE_DEFAULT, "Received transfer error: %@ @%s", (uint8_t *)&v38, 0x16u);
          }

          if ([(TSCellularPlanActivatingFlow *)self shouldOfferFallbackOptionOnError:self->_transferError])
          {
            [(TSCellularPlanActivatingFlow *)self offerFallbackOption];
            goto LABEL_42;
          }
        }
      }
      uint64_t v35 = [v4 objectForKey:@"CarrierName"];
      if (v35)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&self->_carrierName, v35);
        }
      }
      v36 = [v4 objectForKey:@"CarrierErrorCode"];
      if (v36)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v36 length]) {
            objc_storeStrong((id *)&self->_carrierErrorCode, v36);
          }
        }
      }

      int64_t v17 = self->_transferState;
LABEL_52:
      if ((unint64_t)(v17 - 1) <= 1)
      {
        [(TSCellularPlanActivatingFlow *)self startTimer:1];
        v37 = [MEMORY[0x263F08A00] defaultCenter];
        [v37 postNotificationName:@"transfer.consent.on.source" object:0 userInfo:0];
        goto LABEL_54;
      }
      if ([(NSError *)self->_transferError code] == 45)
      {
        if (!self->_termsAndConditionsShown && !self->_oneTimePasscodePaneShown)
        {
          [(TSCellularPlanActivatingFlow *)self userDidTapCancel];
          goto LABEL_43;
        }
        v37 = _TSLogDomain();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 136315138;
          v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
          _os_log_impl(&dword_227A17000, v37, OS_LOG_TYPE_DEFAULT, "cancel event already handled @%s", (uint8_t *)&v38, 0xCu);
        }
LABEL_54:

        goto LABEL_43;
      }
      if (self->_transferError && self->_firstViewControllerCallback) {
        [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
      }
LABEL_43:

      return;
    case 5:
      uint64_t v19 = [v4 objectForKey:@"Iccid"];
      sourceIccid = self->_sourceIccid;
      self->_sourceIccid = v19;

      uint64_t v11 = [v4 objectForKey:@"TCMainTextKey"];
      [(TSCellularPlanActivatingFlow *)self _displayTermsAndConditionsViewController:v11];
      goto LABEL_42;
    case 6:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

      if (!WeakRetained)
      {
        uint64_t v31 = [v4 objectForKey:@"Iccid"];
        uint64_t v32 = self->_sourceIccid;
        self->_sourceIccid = v31;

        uint64_t v11 = [v4 objectForKey:@"CarrierName"];
        uint64_t v14 = [v4 objectForKey:@"PhoneNumberKey"];
        long long v33 = [v4 objectForKey:@"UsePinKey"];
        uint64_t v34 = [v33 BOOLValue];

        [(TSCellularPlanActivatingFlow *)self _displayOneTimeCodeViewController:v14 carrierName:v11 usePin:v34];
        goto LABEL_41;
      }
      uint64_t v22 = _TSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315138;
        v39 = "-[TSCellularPlanActivatingFlow transferEventUpdate:]";
        _os_log_impl(&dword_227A17000, v22, OS_LOG_TYPE_DEFAULT, "OneTimeViewController active. Updating OTP state. @%s", (uint8_t *)&v38, 0xCu);
      }

      uint64_t v23 = self;
      uint64_t v24 = 0;
LABEL_33:
      [(TSCellularPlanActivatingFlow *)v23 _handleOtpStatusUpdate:v24];
      goto LABEL_43;
    case 7:
      uint64_t v25 = [v4 objectForKey:@"OtpStateKey"];
      int v26 = [v25 BOOLValue];

      if (v26) {
        uint64_t v24 = 2;
      }
      else {
        uint64_t v24 = 1;
      }
      uint64_t v23 = self;
      goto LABEL_33;
    default:
      goto LABEL_52;
  }
}

- (BOOL)_startedByFollowup
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 infoDictionary];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFFB68]];

  LOBYTE(v2) = [@"SIMSetupUIService" isEqualToString:v4];
  return (char)v2;
}

- (BOOL)_isAppInBackground
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v3 = [v2 applicationState] != 0;

  return v3;
}

- (void)launchWebsheet:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v35 = v6;
    __int16 v36 = 2080;
    v37 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "handle CoreTelephonyClient launchwebsheet request:%@ @%s", buf, 0x16u);
  }

  BOOL v9 = +[TSUtilities inBuddy];
  BOOL v10 = _TSLogDomain();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
      _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "Not launching websheet in buddy @%s", buf, 0xCu);
    }

    v7[2](v7, 0);
    goto LABEL_24;
  }
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v13 = [v12 infoDictionary];
    uint64_t v14 = [v13 objectForKey:*MEMORY[0x263EFFB68]];
    uint64_t v15 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v16 = [v15 applicationState];
    *(_DWORD *)buf = 138412802;
    uint64_t v35 = v14;
    __int16 v36 = 2048;
    v37 = (const char *)v16;
    __int16 v38 = 2080;
    v39 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
    _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "App name is %@ status is %ld @%s", buf, 0x20u);
  }
  if ([(TSCellularPlanActivatingFlow *)self _startedByFollowup])
  {
    if (+[TSUtilities isDeviceLocked])
    {
      int64_t v17 = _TSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
        _os_log_impl(&dword_227A17000, v17, OS_LOG_TYPE_DEFAULT, "screen is locked, skip in-line launch websheet @%s", buf, 0xCu);
      }
LABEL_13:

      v7[2](v7, 0);
      goto LABEL_24;
    }
  }
  else if ([(TSCellularPlanActivatingFlow *)self _isAppInBackground])
  {
    int64_t v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v35 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]";
      _os_log_impl(&dword_227A17000, v17, OS_LOG_TYPE_DEFAULT, "app is not in forground. skip in-line launch websheet @%s", buf, 0xCu);
    }
    goto LABEL_13;
  }
  uint64_t v18 = (void *)[v6 mutableCopy];
  [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"SkipIntroPaneForWebsheetFlow"];
  uint64_t v19 = (NSDictionary *)[v18 copy];
  websheetOptions = self->_websheetOptions;
  self->_websheetOptions = v19;

  v21 = [(TSSIMSetupFlow *)self navigationController];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    uint64_t v23 = _TSLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanActivatingFlow launchWebsheet:completion:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

    v7[2](v7, 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke;
    v31[3] = &unk_2648279A8;
    objc_copyWeak(&v33, (id *)buf);
    v31[4] = self;
    uint64_t v32 = v7;
    [(TSCellularPlanActivatingFlow *)self _maybeDismissAlert:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

LABEL_24:
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained websheetOptions];
  id v5 = +[TSSIMSetupFlow flowWithOptions:v4];
  id v6 = objc_loadWeakRetained(v2);
  [v6 setWebsheetFlow:v5];

  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v7 websheetFlow];
  [v8 setParentFlow:v7];

  id v9 = objc_loadWeakRetained(v2);
  BOOL v10 = [v9 websheetFlow];
  [v10 setDelegate:v9];

  id v11 = objc_loadWeakRetained(v2);
  uint64_t v12 = [v11 websheetFlow];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2;
  v14[3] = &unk_264827980;
  objc_copyWeak(&v16, v2);
  id v13 = *(id *)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  [v12 firstViewController:v14];

  objc_destroyWeak(&v16);
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained navigationController];
  id v6 = [v5 topViewController];

  id v7 = _TSLogDomain();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      BOOL v10 = [v9 navigationController];
      id v11 = [v10 topViewController];
      int v26 = 138412802;
      id v27 = v3;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      __int16 v30 = 2080;
      uint64_t v31 = "-[TSCellularPlanActivatingFlow launchWebsheet:completion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "present : %@ on cur : %@ @%s", (uint8_t *)&v26, 0x20u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_loadWeakRetained((id *)(a1 + 48));
      [v12 setWebsheetRootViewController:v3];
    }
    else
    {
      id v12 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v12 setModalPresentationStyle:2];
      id v21 = objc_loadWeakRetained((id *)(a1 + 48));
      [v21 setWebsheetRootViewController:v12];
    }
    [*(id *)(a1 + 32) _stopTimerWithBackgroundTaskState:0];
    BOOL v22 = [MEMORY[0x263F08A00] defaultCenter];
    id v23 = objc_loadWeakRetained((id *)(a1 + 48));
    [v22 addObserver:v23 selector:sel__onESIMInstallFromWebSheetFlowStart name:@"transfer.websheet.install.started" object:0];

    id v24 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v25 = [v24 websheetRootViewController];
    [v6 presentViewController:v25 animated:1 completion:0];

    int v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2_cold_1(v8, v13, v14, v15, v16, v17, v18, v19);
    }

    int v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v20();
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"transfer.websheet.install.started" object:0];

  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL eSIMInstallFromWebsheetFlowStarted = self->_eSIMInstallFromWebsheetFlowStarted;
    *(_DWORD *)buf = 67109378;
    BOOL v10 = eSIMInstallFromWebsheetFlowStarted;
    __int16 v11 = 2080;
    id v12 = "-[TSCellularPlanActivatingFlow simSetupFlowCompleted:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted, has received notification? %d @%s", buf, 0x12u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke;
  v8[3] = &unk_2648279F8;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) websheetFlow];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2080;
    uint64_t v13 = "-[TSCellularPlanActivatingFlow simSetupFlowCompleted:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "websheet flow %@ completed with type:%ld @%s", buf, 0x20u);
  }
  [*(id *)(a1 + 32) setWebsheetFlow:0];
  id v5 = [*(id *)(a1 + 32) websheetRootViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke_73;
  v7[3] = &unk_2648279D0;
  v7[4] = *(void *)(a1 + 32);
  [v5 dismissViewControllerAnimated:1 completion:v7];

  return [*(id *)(a1 + 32) setWebsheetRootViewController:0];
}

void __54__TSCellularPlanActivatingFlow_simSetupFlowCompleted___block_invoke_73(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) eSIMInstallFromWebsheetFlowStarted];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setESIMInstallFromWebsheetFlowStarted:0];
    [*(id *)(a1 + 32) startTimer:1];
    if ([*(id *)(a1 + 32) currentActivatingState] == 1)
    {
      uint64_t v4 = *(void **)(a1 + 32);
      [v4 _maybeMoveToNextViewController];
    }
  }
  else
  {
    id v5 = [v3 firstViewControllerCallback];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) firstViewControllerCallback];
      v6[2](v6, 0);

      id v7 = *(void **)(a1 + 32);
      [v7 setFirstViewControllerCallback:0];
    }
  }
}

- (void)startTimer:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v4 = 180.0;
  if (a3)
  {
    if (a3 == 2) {
      return;
    }
    if (a3 == 1)
    {
      uint64_t v5 = 2;
      double v4 = 120.0;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v15 = v4;
    __int16 v16 = 2080;
    uint64_t v17 = "-[TSCellularPlanActivatingFlow startTimer:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "start timer: %f @%s", buf, 0x16u);
  }

  self->_timeoutReason = 0;
  [(NSTimer *)self->_activatingTimer invalidate];
  id v7 = (void *)MEMORY[0x263EFFA20];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", v5, @"timeoutReason");
  uint64_t v13 = v8;
  id v9 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  __int16 v10 = [v7 scheduledTimerWithTimeInterval:self target:sel__handleActivatingExpiry selector:v9 userInfo:0 repeats:v4];
  activatingTimer = self->_activatingTimer;
  self->_activatingTimer = v10;

  [(TSCellularPlanActivatingFlow *)self _startBackgroundTask];
}

- (void)_onESIMInstallFromWebSheetFlowStart
{
}

- (void)_onTransferError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v4 = [a3 object];
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "transfer failed : %@ @%s", (uint8_t *)&v16, 0x16u);
  }

  if (self->_transferError)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
      id v7 = "transfer error already set, ignore @%s";
LABEL_9:
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (self->_failureWebsheetError)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[TSCellularPlanActivatingFlow _onTransferError:]";
      id v7 = "ignore the error, launch error Websheet instead @%s";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v8 = [(TSSIMSetupFlow *)self navigationController];
  id v9 = [v8 visibleViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v12 = [v11 visibleViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v4 code];

      if (v13 == 4097) {
        goto LABEL_17;
      }
    }
    else
    {
    }
LABEL_19:
    uint64_t v14 = v4;
    goto LABEL_20;
  }
  uint64_t v10 = [v4 code];

  if (v10 != 4097) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F31920] code:4097 userInfo:0];
LABEL_20:
  transferError = self->_transferError;
  self->_transferError = v14;

  if (self->_transferError && self->_firstViewControllerCallback) {
    [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
  }
LABEL_11:
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v8 = a3;
  if (+[TSUtilities isPad])
  {
    BOOL v4 = +[TSUtilities inBuddy];
    uint64_t v5 = [v8 navigationItem];
    id v6 = v5;
    if (v4) {
      [v5 setHidesBackButton:1 animated:0];
    }
    else {
      [v5 setRightBarButtonItem:self->_cancelButton];
    }
  }
  else
  {
    id v7 = [v8 navigationItem];
    [v7 setHidesBackButton:1 animated:0];

    if (+[TSUtilities inBuddy]) {
      goto LABEL_8;
    }
    id v6 = [v8 navigationItem];
    [v6 setLeftBarButtonItem:self->_cancelButton];
  }

LABEL_8:
  MEMORY[0x270F9A758]();
}

- (void)_maybeMoveToNextViewController
{
  id v3 = [(TSCellularPlanActivatingFlow *)self websheetFlow];

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __62__TSCellularPlanActivatingFlow__maybeMoveToNextViewController__block_invoke;
    v4[3] = &unk_264827A20;
    objc_copyWeak(&v5, &location);
    [(TSCellularPlanActivatingFlow *)self _maybeDismissAlert:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __62__TSCellularPlanActivatingFlow__maybeMoveToNextViewController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained firstViewControllerCallback];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3)
  {
    id v17 = [v4 _firstViewController];

    id v6 = objc_loadWeakRetained(v1);
    id v7 = [v6 firstViewControllerCallback];
    ((void (**)(void, id))v7)[2](v7, v17);

    id v8 = objc_loadWeakRetained(v1);
    [v8 setFirstViewControllerCallback:0];
LABEL_7:

    return;
  }
  id v9 = [v4 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = objc_loadWeakRetained(v1);
    uint64_t v12 = [v11 topViewController];
    [v11 viewControllerDidComplete:v12];
  }
  id v13 = objc_loadWeakRetained(v1);
  uint64_t v14 = [v13 topViewController];
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    id v8 = objc_loadWeakRetained(v1);
    int v16 = [v8 topViewController];
    [v8 viewControllerDidComplete:v16];

    id v17 = v8;
    goto LABEL_7;
  }
}

- (id)_firstViewController
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(TSCellularPlanActivatingFlow *)self _stopTimerWithBackgroundTaskState:0];
  if (self->_showConfirmationCodePane)
  {
    id v3 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_planName];
    self->_showConfirmationCodePane = 0;
    goto LABEL_13;
  }
  unint64_t currentActivatingState = self->_currentActivatingState;
  if (currentActivatingState == 2)
  {
    id v5 = [[TSCellularSetupTimeoutFailureViewController alloc] initWithTimeoutReason:self->_timeoutReason];
    goto LABEL_12;
  }
  if (currentActivatingState == 1)
  {
    id v5 = [[TSCellularSetupCompleteViewController alloc] initWithPhoneNumber:self->_phoneNumber planName:self->_planName planActiveOnSource:self->_planActiveOnSource];
LABEL_12:
    id v3 = v5;
    goto LABEL_13;
  }
  if (self->_transferError)
  {
    id v6 = [TSMidOperationFailureViewController alloc];
    transferError = self->_transferError;
    updatePlanItem = self->_updatePlanItem;
    BOOL v9 = +[TSUtilities inBuddy];
    carrierName = self->_carrierName;
    carrierErrorCode = self->_carrierErrorCode;
    uint64_t v12 = v6;
    planInstallError = transferError;
    uint64_t v14 = updatePlanItem;
LABEL_11:
    id v5 = [(TSMidOperationFailureViewController *)v12 initWithPlanItemError:planInstallError updatePlanItem:v14 withBackButton:v9 forCarrier:carrierName withCarrierErrorCode:carrierErrorCode];
    goto LABEL_12;
  }
  if (self->_planInstallError)
  {
    uint64_t v12 = [TSMidOperationFailureViewController alloc];
    planInstallError = self->_planInstallError;
    uint64_t v14 = self->_updatePlanItem;
    carrierName = self->_carrierName;
    carrierErrorCode = self->_carrierErrorCode;
    BOOL v9 = 0;
    goto LABEL_11;
  }
  id v3 = 0;
LABEL_13:
  char v15 = _TSLogDomain();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2080;
    uint64_t v20 = "-[TSCellularPlanActivatingFlow _firstViewController]";
    _os_log_impl(&dword_227A17000, v15, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v17, 0x16u);
  }

  [(TSCellularSetupTimeoutFailureViewController *)v3 setDelegate:self];
  [(TSCellularPlanActivatingFlow *)self setTopViewController:v3];
  return v3;
}

- (void)_handleActivatingExpiry
{
  *(void *)&v13[5] = *MEMORY[0x263EF8340];
  activatingTimer = self->_activatingTimer;
  if (activatingTimer)
  {
    id v4 = [(NSTimer *)activatingTimer userInfo];
    id v5 = [v4 objectForKey:@"timeoutReason"];
    self->_timeoutReason = [v5 integerValue];
  }
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_timeoutReason == 1) {
      int v7 = 180;
    }
    else {
      int v7 = 120;
    }
    int v12 = 67109378;
    v13[0] = v7;
    LOWORD(v13[1]) = 2080;
    *(void *)((char *)&v13[1] + 2) = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "handle %ds activating timer expired @%s", (uint8_t *)&v12, 0x12u);
  }

  BOOL shouldShowCompletePaneOnTimeout = self->_shouldShowCompletePaneOnTimeout;
  BOOL v9 = _TSLogDomain();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (shouldShowCompletePaneOnTimeout)
  {
    if (v10)
    {
      int v12 = 136315138;
      *(void *)id v13 = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "activation complete @%s", (uint8_t *)&v12, 0xCu);
    }
    unint64_t v11 = 1;
  }
  else
  {
    if (v10)
    {
      int v12 = 136315138;
      *(void *)id v13 = "-[TSCellularPlanActivatingFlow _handleActivatingExpiry]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "activation timed out @%s", (uint8_t *)&v12, 0xCu);
    }
    unint64_t v11 = 2;
  }

  self->_unint64_t currentActivatingState = v11;
  [(TSCellularPlanActivatingFlow *)self _stopBackgroundTask];
  [(TSCellularPlanActivatingFlow *)self _maybeMoveToNextViewController];
}

- (void)_startBackgroundTask
{
  if (self->_backgroundTask == *MEMORY[0x263F833E0])
  {
    objc_initWeak(&location, self);
    id v3 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v4 = MEMORY[0x263EF8330];
    uint64_t v5 = 3221225472;
    id v6 = __52__TSCellularPlanActivatingFlow__startBackgroundTask__block_invoke;
    int v7 = &unk_264827A20;
    objc_copyWeak(&v8, &location);
    self->_backgroundTask = [v3 beginBackgroundTaskWithExpirationHandler:&v4];

    -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 1, v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __52__TSCellularPlanActivatingFlow__startBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[TSCellularPlanActivatingFlow _startBackgroundTask]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "background task expired @%s", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopBackgroundTask];
}

- (void)_stopBackgroundTask
{
  unint64_t v3 = *MEMORY[0x263F833E0];
  if (self->_backgroundTask != *MEMORY[0x263F833E0])
  {
    int v4 = [MEMORY[0x263F82438] sharedApplication];
    [v4 endBackgroundTask:self->_backgroundTask];

    self->_backgroundTask = v3;
  }
  [(TSSIMSetupFlow *)self setIdleTimerDisabled:0];
}

- (void)_stopTimerWithBackgroundTaskState:(BOOL)a3
{
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:](v5);
  }

  if (!a3) {
    [(TSCellularPlanActivatingFlow *)self _stopBackgroundTask];
  }
  [(NSTimer *)self->_activatingTimer invalidate];
  activatingTimer = self->_activatingTimer;
  self->_activatingTimer = 0;
}

- (BOOL)shouldOfferFallbackOptionOnError:(id)a3
{
  id v3 = a3;
  BOOL v4 = !+[TSUtilities isPad](TSUtilities, "isPad") && [v3 code] == 50;

  return v4;
}

- (void)_maybeDismissAlert:(id)a3
{
  BOOL v10 = (void (**)(void))a3;
  BOOL v4 = [(TSSIMSetupFlow *)self navigationController];
  uint64_t v5 = [v4 topViewController];
  uint64_t v6 = [v5 presentedViewController];

  if (v6)
  {
    int v7 = [(TSSIMSetupFlow *)self navigationController];
    id v8 = [v7 topViewController];
    BOOL v9 = [v8 presentedViewController];
    [v9 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    v10[2]();
  }
}

- (void)offerFallbackOption
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke;
  v3[3] = &unk_264827A98;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  [(TSCellularPlanActivatingFlow *)self _maybeDismissAlert:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v16 = [v2 localizedStringForKey:@"FALLBACK_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v15 = [v3 localizedStringForKey:@"FALLBACK_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  id v4 = [MEMORY[0x263F82418] alertControllerWithTitle:v16 message:v15 preferredStyle:1];
  uint64_t v5 = (void *)MEMORY[0x263F82400];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_2;
  v21[3] = &unk_264827A48;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  id v8 = [v5 actionWithTitle:v7 style:1 handler:v21];
  [v4 addAction:v8];

  BOOL v9 = (void *)MEMORY[0x263F82400];
  BOOL v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v11 = [v10 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DBE8E78 table:@"Localizable"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_3;
  v19[3] = &unk_264827A48;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  int v12 = [v9 actionWithTitle:v11 style:0 handler:v19];
  [v4 addAction:v12];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_4;
  block[3] = &unk_264827A70;
  block[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v18 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v14 = _TSLogDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v24 = "-[TSCellularPlanActivatingFlow offerFallbackOption]_block_invoke";
    _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "stop timer when alert for ids error is shown @%s", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _stopTimerWithBackgroundTaskState:0];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 simSetupFlowCompleted:1];
}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained redirectToBTFlow];
}

void __51__TSCellularPlanActivatingFlow_offerFallbackOption__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)redirectToBTFlow
{
  id v3 = [(TSSIMSetupFlow *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(TSSIMSetupFlow *)self delegate];
    [v7 setIsOfferFallbackFlow:1];
    id firstViewControllerCallback = (void (**)(id, void))self->_firstViewControllerCallback;
    if (firstViewControllerCallback)
    {
      firstViewControllerCallback[2](firstViewControllerCallback, 0);
      id v6 = self->_firstViewControllerCallback;
      self->_id firstViewControllerCallback = 0;
    }
  }
}

- (void)_shouldWaitUntilPhoneNumberBeReady:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = +[TSCoreTelephonyClientCache sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke;
  v7[3] = &unk_264827AC0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 getSubscriptionInfo:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v27 = a1;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v5 = [v3 subscriptions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          unint64_t v11 = [v10 uuid];
          int v12 = [v11 UUIDString];
          int v13 = [v12 isEqualToString:*((void *)WeakRetained + 27)];

          if (v13)
          {
            uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
            char v15 = (void *)[*((id *)WeakRetained + 17) copyCarrierBundleValue:v10 keyHierarchy:&unk_26DC141D0 bundleType:v14 error:0];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v16 = [v15 BOOLValue];
            }
            else {
              int v16 = 0;
            }
            uint64_t v25 = _TSLogDomain();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              int v26 = @"NO";
              if (v16) {
                int v26 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              id v33 = v26;
              __int16 v34 = 2080;
              uint64_t v35 = "-[TSCellularPlanActivatingFlow _shouldWaitUntilPhoneNumberBeReady:]_block_invoke";
              _os_log_impl(&dword_227A17000, v25, OS_LOG_TYPE_DEFAULT, "Wait until phone number to be ready: %@ @%s", buf, 0x16u);
            }

            (*(void (**)(void))(*(void *)(v27 + 32) + 16))();
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    int v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_maybeDeleteTransferBackItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412546;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "transferredStatus", v18))
        {
          if (([v10 isInstalling] & 1) == 0)
          {
            unint64_t v11 = [v10 plan];
            int v12 = [v11 status];

            if (!v12)
            {
              int v13 = [self->_transferBackOldItem iccid];
              uint64_t v14 = [v10 iccid];
              int v15 = [v13 isEqualToPhoneNumber:v14];

              if (v15)
              {
                int v16 = _TSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v18;
                  uint64_t v24 = v10;
                  __int16 v25 = 2080;
                  int v26 = "-[TSCellularPlanActivatingFlow _maybeDeleteTransferBackItem:]";
                  _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "remove transfer back item : %@ @%s", buf, 0x16u);
                }

                int v17 = [MEMORY[0x263F31978] sharedManager];
                [v17 didDeletePlanItem:v10 completion:&__block_literal_global_0];
              }
            }
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
}

void __61__TSCellularPlanActivatingFlow__maybeDeleteTransferBackItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109634;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    __int16 v9 = 2080;
    BOOL v10 = "-[TSCellularPlanActivatingFlow _maybeDeleteTransferBackItem:]_block_invoke";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "remote item : %d, error : %@ @%s", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)_submitCellularPlanSetupDetails
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  if (*(_OWORD *)&self->_planInstallError == 0)
  {
    unint64_t currentActivatingState = self->_currentActivatingState;
    if (currentActivatingState == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2 * (currentActivatingState == 2);
    }
  }
  else
  {
    uint64_t v4 = 3;
  }
  double v5 = Current - self->_startTime;
  long long v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t planSetupType = self->_planSetupType;
    int v11 = 134218754;
    unint64_t v12 = planSetupType;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2048;
    double v16 = v5;
    __int16 v17 = 2080;
    long long v18 = "-[TSCellularPlanActivatingFlow _submitCellularPlanSetupDetails]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Time to complete activating for plan type %tu with result %tu : %f  @%s", (uint8_t *)&v11, 0x2Au);
  }

  id v8 = +[TSCoreTelephonyClientCache sharedInstance];
  __int16 v9 = objc_msgSend(objc_alloc(MEMORY[0x263F02CB8]), "initWithInBuddy:carrierName:setupType:setupResult:duration:", +[TSUtilities inBuddy](TSUtilities, "inBuddy"), self->_planName, self->_planSetupType, v4, (unint64_t)v5);
  [v8 submitPlanSetupDetails:v9];
}

- (void)_displayTermsAndConditionsViewController:(id)a3
{
  id v4 = a3;
  double v5 = [(TSSIMSetupFlow *)self navigationController];

  if (v5)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke;
    v14[3] = &unk_264827B08;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    [(TSCellularPlanActivatingFlow *)self _maybeDismissAlert:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanActivatingFlow _displayTermsAndConditionsViewController:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained navigationController];
  double v5 = [v4 topViewController];

  if (v5)
  {
    long long v6 = [TSTermsAndConditionsViewController alloc];
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 sourceIccid];
    uint64_t v9 = [(TSTermsAndConditionsViewController *)v6 initWithSourceIccid:v8 mainText:*(void *)(a1 + 32)];

    id v10 = objc_loadWeakRetained(v2);
    [v10 setTermsAndConditionsViewController:v9];

    id v11 = objc_loadWeakRetained(v2);
    uint64_t v12 = [v11 termsAndConditionsViewController];
    [v12 setDelegate:v11];

    id v13 = objc_loadWeakRetained(v2);
    [v13 setTermsAndConditionsShown:1];

    uint64_t v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_loadWeakRetained(v2);
      id v16 = [v15 termsAndConditionsViewController];
      id v17 = objc_loadWeakRetained(v2);
      long long v18 = [v17 navigationController];
      uint64_t v19 = [v18 topViewController];
      int v29 = 138412802;
      long long v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      __int16 v33 = 2080;
      __int16 v34 = "-[TSCellularPlanActivatingFlow _displayTermsAndConditionsViewController:]_block_invoke";
      _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "present : %@ on cur : %@ @%s", (uint8_t *)&v29, 0x20u);
    }
    long long v20 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
    [v20 setModalPresentationStyle:2];
    id v21 = objc_loadWeakRetained(v2);
    [v21 _stopTimerWithBackgroundTaskState:1];

    [v5 presentViewController:v20 animated:1 completion:0];
  }
  else
  {
    uint64_t v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke_cold_1(v9, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

- (void)_displayOneTimeCodeViewController:(id)a3 carrierName:(id)a4 usePin:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TSSIMSetupFlow *)self navigationController];

  if (v10)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke;
    v19[3] = &unk_264827B30;
    objc_copyWeak(&v22, &location);
    id v20 = v8;
    id v21 = v9;
    BOOL v23 = a5;
    [(TSCellularPlanActivatingFlow *)self _maybeDismissAlert:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanActivatingFlow _displayOneTimeCodeViewController:carrierName:usePin:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained navigationController];
  double v5 = [v4 topViewController];

  if (v5)
  {
    long long v6 = [TSTransferOneTimeCodeViewController alloc];
    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 sourceIccid];
    id v9 = [(TSTransferOneTimeCodeViewController *)v6 initWithSourceIccid:v8 phoneNumber:*(void *)(a1 + 32) carrierName:*(void *)(a1 + 40) usePin:*(unsigned __int8 *)(a1 + 56)];

    id v10 = objc_loadWeakRetained(v2);
    [v10 setOneTimeCodeViewController:v9];

    id v11 = objc_loadWeakRetained(v2);
    uint64_t v12 = [v11 oneTimeCodeViewController];
    [v12 setDelegate:v11];

    id v13 = objc_loadWeakRetained(v2);
    [v13 setOneTimePasscodePaneShown:1];

    id v14 = objc_loadWeakRetained(v2);
    [v14 _stopTimerWithBackgroundTaskState:1];

    id v15 = objc_loadWeakRetained(v2);
    uint64_t v16 = [v15 oneTimeCodeViewController];
    [v15 setTopViewController:v16];

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_119;
    v26[3] = &unk_264827B08;
    objc_copyWeak(&v28, v2);
    uint64_t v27 = v9;
    uint64_t v17 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v26);

    objc_destroyWeak(&v28);
  }
  else
  {
    uint64_t v18 = _TSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_119(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained oneTimeCodeViewController];
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    long long v6 = [v5 navigationController];
    id v7 = [v6 topViewController];
    int v10 = 138412802;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2080;
    id v15 = "-[TSCellularPlanActivatingFlow _displayOneTimeCodeViewController:carrierName:usePin:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "push : %@ on : %@ @%s", (uint8_t *)&v10, 0x20u);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v8 navigationController];
  [v9 pushViewController:*(void *)(a1 + 32) animated:1];
}

- (void)_handleOtpStatusUpdate:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_oneTimeCodeViewController = &self->_oneTimeCodeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

  if (WeakRetained)
  {
    if (a3 != 2) {
      [(TSCellularPlanActivatingFlow *)self _stopTimerWithBackgroundTaskState:1];
    }
    id v8 = objc_loadWeakRetained((id *)p_oneTimeCodeViewController);
    [v8 updateOtpState:a3];
  }
  else
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "-[TSCellularPlanActivatingFlow _handleOtpStatusUpdate:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "OneTimeCodeViewController nil @%s", buf, 0xCu);
    }
  }
}

- (void)userDidTapCancel
{
  p_oneTimeCodeViewController = &self->_oneTimeCodeViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_oneTimeCodeViewController);
    [v5 disableButtonsAndHideSpinnerText];
  }
  objc_storeWeak((id *)&self->_termsAndConditionsViewController, 0);
  objc_storeWeak((id *)p_oneTimeCodeViewController, 0);
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanActivatingFlow;
  [(TSSIMSetupFlow *)&v6 userDidTapCancel];
}

- (NSDictionary)websheetOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWebsheetOptions:(id)a3
{
}

- (unint64_t)currentActivatingState
{
  return self->_currentActivatingState;
}

- (void)setCurrentActivatingState:(unint64_t)a3
{
  self->_unint64_t currentActivatingState = a3;
}

- (BOOL)eSIMInstallFromWebsheetFlowStarted
{
  return self->_eSIMInstallFromWebsheetFlowStarted;
}

- (void)setESIMInstallFromWebsheetFlowStarted:(BOOL)a3
{
  self->_BOOL eSIMInstallFromWebsheetFlowStarted = a3;
}

- (BOOL)skipActivatingPane
{
  return self->_skipActivatingPane;
}

- (void)setSkipActivatingPane:(BOOL)a3
{
  self->_skipActivatingPane = a3;
}

- (BOOL)shouldShowCompletePaneOnTimeout
{
  return self->_shouldShowCompletePaneOnTimeout;
}

- (void)setShouldShowCompletePaneOnTimeout:(BOOL)a3
{
  self->_BOOL shouldShowCompletePaneOnTimeout = a3;
}

- (BOOL)planActiveOnSource
{
  return self->_planActiveOnSource;
}

- (void)setPlanActiveOnSource:(BOOL)a3
{
  self->_planActiveOnSource = a3;
}

- (BOOL)maybeShowConfirmationCodePane
{
  return self->_maybeShowConfirmationCodePane;
}

- (void)setMaybeShowConfirmationCodePane:(BOOL)a3
{
  self->_maybeShowConfirmationCodePane = a3;
}

- (BOOL)showConfirmationCodePane
{
  return self->_showConfirmationCodePane;
}

- (void)setShowConfirmationCodePane:(BOOL)a3
{
  self->_showConfirmationCodePane = a3;
}

- (CTCellularPlanItem)updatePlanItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUpdatePlanItem:(id)a3
{
}

- (NSTimer)activatingTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setActivatingTimer:(id)a3
{
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClient:(id)a3
{
}

- (NSString)planName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPlanName:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSError)planInstallError
{
  return (NSError *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPlanInstallError:(id)a3
{
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTransferError:(id)a3
{
}

- (NSError)failureWebsheetError
{
  return (NSError *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFailureWebsheetError:(id)a3
{
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)carrierErrorCode
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCarrierErrorCode:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (NSString)installingPlanIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInstallingPlanIdentifier:(id)a3
{
}

- (NSString)subscriptionContextUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSubscriptionContextUUID:(id)a3
{
}

- (NSNumber)waitForPhoneNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWaitForPhoneNumber:(id)a3
{
}

- (id)firstViewControllerCallback
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setFirstViewControllerCallback:(id)a3
{
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_uint64_t transferState = a3;
}

- (TSSIMSetupFlow)websheetFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWebsheetFlow:(id)a3
{
}

- (UINavigationController)websheetRootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_websheetRootViewController);
  return (UINavigationController *)WeakRetained;
}

- (void)setWebsheetRootViewController:(id)a3
{
}

- (TSTermsAndConditionsViewController)termsAndConditionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_termsAndConditionsViewController);
  return (TSTermsAndConditionsViewController *)WeakRetained;
}

- (void)setTermsAndConditionsViewController:(id)a3
{
}

- (TSTransferOneTimeCodeViewController)oneTimeCodeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneTimeCodeViewController);
  return (TSTransferOneTimeCodeViewController *)WeakRetained;
}

- (void)setOneTimeCodeViewController:(id)a3
{
}

- (BOOL)termsAndConditionsShown
{
  return self->_termsAndConditionsShown;
}

- (void)setTermsAndConditionsShown:(BOOL)a3
{
  self->_termsAndConditionsShown = a3;
}

- (BOOL)oneTimePasscodePaneShown
{
  return self->_oneTimePasscodePaneShown;
}

- (void)setOneTimePasscodePaneShown:(BOOL)a3
{
  self->_oneTimePasscodePaneShown = a3;
}

- (NSString)sourceIccid
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSourceIccid:(id)a3
{
}

- (id)transferBackOldItem
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setTransferBackOldItem:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)planSetupType
{
  return self->_planSetupType;
}

- (void)setPlanSetupType:(unint64_t)a3
{
  self->_unint64_t planSetupType = a3;
}

- (int64_t)timeoutReason
{
  return self->_timeoutReason;
}

- (void)setTimeoutReason:(int64_t)a3
{
  self->_timeoutReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackOldItem, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_destroyWeak((id *)&self->_oneTimeCodeViewController);
  objc_destroyWeak((id *)&self->_termsAndConditionsViewController);
  objc_destroyWeak((id *)&self->_websheetRootViewController);
  objc_storeStrong((id *)&self->_websheetFlow, 0);
  objc_storeStrong(&self->_firstViewControllerCallback, 0);
  objc_storeStrong((id *)&self->_waitForPhoneNumber, 0);
  objc_storeStrong((id *)&self->_subscriptionContextUUID, 0);
  objc_storeStrong((id *)&self->_installingPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierErrorCode, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_failureWebsheetError, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_planName, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activatingTimer, 0);
  objc_storeStrong((id *)&self->_updatePlanItem, 0);
  objc_storeStrong((id *)&self->_websheetOptions, 0);
}

- (void)firstViewController
{
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)planItemsUpdated:(os_log_t)log planListError:.cold.2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] wait provisioning plan @%s", buf, 0xCu);
}

- (void)planItemsUpdated:(uint64_t)a1 planListError:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSCellularPlanActivatingFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]provisioning error:%@ @%s", (uint8_t *)&v2, 0x16u);
}

void __63__TSCellularPlanActivatingFlow_planItemsUpdated_planListError___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)launchWebsheet:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__TSCellularPlanActivatingFlow_launchWebsheet_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_stopTimerWithBackgroundTaskState:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[TSCellularPlanActivatingFlow _stopTimerWithBackgroundTaskState:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] stop timer @%s", (uint8_t *)&v1, 0xCu);
}

void __67__TSCellularPlanActivatingFlow__shouldWaitUntilPhoneNumberBeReady___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_displayTermsAndConditionsViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__TSCellularPlanActivatingFlow__displayTermsAndConditionsViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_displayOneTimeCodeViewController:(uint64_t)a3 carrierName:(uint64_t)a4 usePin:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __85__TSCellularPlanActivatingFlow__displayOneTimeCodeViewController_carrierName_usePin___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end