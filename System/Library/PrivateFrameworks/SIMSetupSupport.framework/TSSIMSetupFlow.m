@interface TSSIMSetupFlow
+ (id)_flowWithOptions:(id)a3;
+ (id)createTSRemotePlanWebsheetContext:(id)a3;
+ (id)flowWithOptions:(id)a3;
+ (id)initActivationCodeRequireSetup:(BOOL)a3;
+ (id)initWithActivationCodeOnlyFlow;
+ (id)initWithOptions:(id)a3;
+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4;
+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5;
+ (void)needsToRun:(id)a3;
+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4;
+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5;
- (BOOL)_needCustomizeBackAction:(id)a3;
- (BOOL)_startOver:(id)a3;
- (BOOL)isBootstrapAssertionRequired;
- (BOOL)isFlowFinished;
- (NSMutableDictionary)backOptions;
- (TSSIMSetupDelegate)delegate;
- (TSSIMSetupFlow)init;
- (TSSIMSetupFlow)parentFlow;
- (TSSetupFlowItem)nextViewController;
- (TSSetupFlowItem)topViewController;
- (UINavigationController)navigationController;
- (UIViewController)dismissingViewController;
- (UIViewController)firstViewControllerInstance;
- (id)firstViewController;
- (id)getRootFlow;
- (id)nextViewControllerFrom:(id)a3;
- (id)rootViewController;
- (unint64_t)flowType;
- (void)_maybeClearSubFlow;
- (void)_notifyFlowCompletion:(unint64_t)a3;
- (void)_popAllSIMSetupFlowViewControllers:(id)a3;
- (void)_pushStartOverViewController:(id)a3 from:(id)a4;
- (void)appBackgrounded;
- (void)appForegrounded;
- (void)attemptFailed;
- (void)cancelNextPane;
- (void)firstViewController:(id)a3;
- (void)getRootFlow;
- (void)maybeRegisterDismissHandler:(id)a3;
- (void)navigateToNextPaneFrom:(id)a3 navigationController:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)receivedResponse;
- (void)receivedResponseWithVC:(id)a3;
- (void)restartWith:(id)a3;
- (void)setBackOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissingViewController:(id)a3;
- (void)setFirstViewControllerInstance:(id)a3;
- (void)setFlowType:(unint64_t)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setIsFlowFinished:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setNextViewController:(id)a3;
- (void)setParentFlow:(id)a3;
- (void)setTopViewController:(id)a3;
- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4;
- (void)showLoadFailureAlert:(id)a3 error:(id)a4;
- (void)startOverWithFirstViewController:(id)a3;
- (void)userDidTapCancel;
- (void)viewControllerDidComplete:(id)a3;
- (void)waitForResponse:(id)a3;
@end

@implementation TSSIMSetupFlow

- (void)setTopViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26DC1B908]) {
    [v4 setDelegate:self];
  }
  objc_storeWeak((id *)&self->_topViewController, v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  if (WeakRetained)
  {
  }
  else if (+[TSUtilities inBuddy])
  {
    v6 = (UIViewController *)v4;
    firstViewControllerInstance = self->_firstViewControllerInstance;
    self->_firstViewControllerInstance = v6;
    goto LABEL_8;
  }
  firstViewControllerInstance = self->_firstViewControllerInstance;
  self->_firstViewControllerInstance = 0;
LABEL_8:

  v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2080;
    v17 = "-[TSSIMSetupFlow setTopViewController:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "inject back button action for : %@ @%s", (uint8_t *)&v14, 0x16u);
  }

  id v9 = objc_alloc(MEMORY[0x263F824A8]);
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"BACK" value:&stru_26DBE8E78 table:@"Localizable"];
  v12 = (void *)[v9 initWithTitle:v11 style:0 target:self action:sel_restartWith_];
  v13 = [v4 navigationItem];
  [v13 setBackBarButtonItem:v12];
}

- (TSSetupFlowItem)topViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topViewController);
  return (TSSetupFlowItem *)WeakRetained;
}

+ (void)needsToRun:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

+ (id)initWithOptions:(id)a3
{
  return +[TSSIMSetupFlow flowWithOptions:a3];
}

+ (id)createTSRemotePlanWebsheetContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(TSRemotePlanWebsheetContext);
  v5 = [v3 objectForKeyedSubscript:@"CarrierNameKey"];
  [(TSRemotePlanWebsheetContext *)v4 setCarrierName:v5];

  v6 = [v3 objectForKeyedSubscript:@"SubscriptionContextKey"];
  [(TSRemotePlanWebsheetContext *)v4 setSubscriptionContext:v6];

  v7 = [v3 valueForKey:@"FlowTypeKey"];
  -[TSRemotePlanWebsheetContext setFlowType:](v4, "setFlowType:", [v7 intValue]);

  v8 = [v3 objectForKeyedSubscript:@"Iccid"];
  if (v8)
  {
    id v9 = [v3 objectForKeyedSubscript:@"Iccid"];
    [(TSRemotePlanWebsheetContext *)v4 setIccid:v9];
  }
  else
  {
    [(TSRemotePlanWebsheetContext *)v4 setIccid:&stru_26DBE8E78];
  }

  [(TSRemotePlanWebsheetContext *)v4 setUseLiveID:0];
  v10 = [v3 objectForKeyedSubscript:@"WebsheetURLKey"];
  [(TSRemotePlanWebsheetContext *)v4 setUrl:v10];

  v11 = [v3 objectForKeyedSubscript:@"WebsheetPostdataKey"];
  [(TSRemotePlanWebsheetContext *)v4 setPostdata:v11];

  v12 = [v3 valueForKey:@"LiveIdEnabledKey"];
  v13 = v12;
  if (v12) {
    -[TSRemotePlanWebsheetContext setUseLiveID:](v4, "setUseLiveID:", [v12 BOOLValue]);
  }

  return v4;
}

+ (id)flowWithOptions:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[TSUtilities hasCellularBaseband])
  {
    id v4 = +[TSSIMSetupFlow _flowWithOptions:v3];
    if (v4)
    {
      v5 = [v3 valueForKey:@"FlowTypeKey"];
      objc_msgSend(v4, "setFlowType:", (int)objc_msgSend(v5, "intValue"));
    }
  }
  else
  {
    v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "+[TSSIMSetupFlow flowWithOptions:]";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "no cellular support!!! @%s", (uint8_t *)&v8, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)_flowWithOptions:(id)a3
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v115 = v4;
    __int16 v116 = 2080;
    v117 = "+[TSSIMSetupFlow _flowWithOptions:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "%@ @%s", buf, 0x16u);
  }

  v6 = [v4 valueForKey:@"FlowTypeKey"];
  int v7 = [v6 intValue];

  int v8 = 0;
  switch(v7)
  {
    case 1:
      uint64_t v10 = [v4 valueForKey:@"ConfirmationCodeRequiredKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = [v10 BOOLValue];
      }
      else {
        uint64_t v13 = 0;
      }
      v11 = [[TSUserResponseFlow alloc] initWithConfirmationCodeRequired:v13];
      goto LABEL_102;
    case 2:
      int v14 = [v4 objectForKeyedSubscript:@"Plan"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        __int16 v16 = [TSWebsheetSignupFlow alloc];
        v17 = [v4 objectForKeyedSubscript:@"Plan"];
        uint64_t v18 = [(TSWebsheetSignupFlow *)v16 initWithPlan:v17];
LABEL_86:
        int v8 = (TSTransferFlow *)v18;

        goto LABEL_104;
      }
      v74 = [v4 objectForKeyedSubscript:@"Iccid"];
      objc_opt_class();
      char v75 = objc_opt_isKindOfClass();

      if (v75)
      {
        v76 = [TSWebsheetSignupFlow alloc];
        v17 = [v4 objectForKeyedSubscript:@"Iccid"];
        uint64_t v18 = [(TSWebsheetSignupFlow *)v76 initWithIccid:v17];
        goto LABEL_86;
      }
      v100 = [v4 valueForKey:@"WebsheetURLKey"];
      objc_opt_class();
      char v101 = objc_opt_isKindOfClass();

      if ((v101 & 1) == 0)
      {
        int v8 = 0;
        goto LABEL_104;
      }
      v102 = [v4 valueForKey:@"RequestTypeKey"];
      uint64_t v10 = v102;
      if (v102) {
        uint64_t v103 = [v102 unsignedIntegerValue];
      }
      else {
        uint64_t v103 = 0;
      }
      v104 = [v4 valueForKey:@"SkipIntroPaneForWebsheetFlow"];
      id v27 = v104;
      if (v104) {
        uint64_t v105 = [v104 BOOLValue];
      }
      else {
        uint64_t v105 = 0;
      }
      v106 = [TSWebsheetSignupFlow alloc];
      v107 = [v4 valueForKey:@"WebsheetURLKey"];
      v108 = [v4 valueForKey:@"WebsheetPostdataKey"];
      int v8 = [(TSWebsheetSignupFlow *)v106 initWithRequestType:v103 skipIntroPaneForWebsheetFlow:v105 websheetURL:v107 postdata:v108];

      goto LABEL_80;
    case 3:
      uint64_t v10 = [v4 valueForKey:@"RequireSetupKey-DEBUG"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v19 = [v10 BOOLValue];
      }
      else {
        uint64_t v19 = 0;
      }
      id v27 = [v4 objectForKeyedSubscript:@"TransferBackPlan"];
      id v77 = [MEMORY[0x263EFF9D0] null];

      if (v27 == v77)
      {

        id v27 = 0;
      }
      v28 = [[TSActivationFlowWithSimSetupFlow alloc] initRequireSetup:v19 transferBackPlan:v27];
      goto LABEL_79;
    case 4:
      uint64_t v10 = [v4 valueForKey:@"RequireSetupKey-DEBUG"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = [v10 BOOLValue] ^ 1;
      }
      else {
        uint64_t v20 = 1;
      }
      id v27 = [v4 valueForKey:@"SetupNewIccidKey"];
      v78 = [v4 valueForKey:@"ForceDualSIMSetup"];
      v79 = [[TSSetupAssistantSIMSetupFlow alloc] initWithIccid:v27 showAddPlan:v20 forceDualSIMSetup:v78 != 0 allowDismiss:1];
      goto LABEL_118;
    case 5:
      uint64_t v10 = [v4 objectForKeyedSubscript:@"MessageSessionKey"];
      v21 = [v4 objectForKeyedSubscript:@"HasTransferablePlan"];
      uint64_t v22 = [v21 BOOLValue];

      v23 = [v4 objectForKeyedSubscript:@"IsStandaloneProximityTransfer"];
      uint64_t v24 = [v23 BOOLValue];

      v25 = [v4 objectForKeyedSubscript:@"TransferBackPlan"];
      v26 = [MEMORY[0x263EFF9D0] null];

      if (v25 == v26)
      {

        v25 = 0;
      }
      int v8 = [[TSTransferFlow alloc] initWithSession:v10 hasTransferablePlan:v22 isStandaloneProximityTransfer:v24 transferBackPlan:v25];

      goto LABEL_103;
    case 6:
    case 14:
    case 15:
      goto LABEL_104;
    case 7:
    case 8:
      id v9 = [TSRemotePlanSignUpFlow alloc];
      uint64_t v10 = [a1 createTSRemotePlanWebsheetContext:v4];
      v11 = [(TSRemotePlanSignUpFlow *)v9 initWithRemotePlanWebsheetContext:v10];
      goto LABEL_102;
    case 9:
      uint64_t v10 = [v4 objectForKeyedSubscript:@"CarrierNameKey"];
      id v27 = [v4 objectForKeyedSubscript:@"PhoneNumberKey"];
      v28 = [[TSOnDeviceConversionFlow alloc] initWithPhoneNumber:v27 carrierName:v10];
      goto LABEL_79;
    case 10:
      uint64_t v10 = [v4 objectForKeyedSubscript:@"ExternalizedContextKey"];
      id v27 = [v4 objectForKeyedSubscript:@"PlanDescriptorKey"];
      v29 = [v4 objectForKeyedSubscript:@"LocalConversionOngoing"];
      uint64_t v30 = [v29 BOOLValue];

      v28 = [[TSAuthFlow alloc] initWithExternalizedContext:v10 descriptor:v27 isLocalConvertFlow:v30];
      goto LABEL_79;
    case 11:
      uint64_t v10 = [v4 objectForKeyedSubscript:@"Iccid"];
      v11 = [[TSTransferQRCodeFlow alloc] initWithIccid:v10];
      goto LABEL_102;
    case 12:
      v31 = [v4 valueForKey:@"WaitForServiceKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v32 = [v31 BOOLValue];
      }
      else {
        uint64_t v32 = 0;
      }
      v80 = [v4 valueForKey:@"FallbackToActivationCodeKey"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v81 = [v80 BOOLValue];
      }
      else {
        uint64_t v81 = 0;
      }
      v17 = [v4 valueForKey:@"IgnoreTransportKey"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v86 = [v17 BOOLValue];
      }
      else {
        uint64_t v86 = 0;
      }
      uint64_t v18 = [[TSManagedDeviceInstallFlow alloc] initWith:v32 fallbackToActivationCode:v81 ignoreTransport:v86];
      goto LABEL_86;
    case 13:
      v33 = [v4 valueForKey:@"ProximitySetupStateKey"];
      uint64_t v10 = v33;
      if (v33) {
        uint64_t v34 = [v33 unsignedIntegerValue];
      }
      else {
        uint64_t v34 = 0;
      }
      v11 = [[TSTransferCloudFlow alloc] initWithProximitySetupState:v34];
      goto LABEL_102;
    case 16:
      v35 = [v4 objectForKeyedSubscript:@"SkipActivatingPane"];
      uint64_t v36 = [v35 BOOLValue];

      v37 = [v4 objectForKeyedSubscript:@"DelayStartActivatingTimer"];
      if (v37)
      {
        v38 = [v4 objectForKeyedSubscript:@"DelayStartActivatingTimer"];
        uint64_t v39 = (int)[v38 intValue];
      }
      else
      {
        uint64_t v39 = 1;
      }

      v91 = [v4 valueForKey:@"PlanSetupTypeKey"];
      if (v91)
      {
        v92 = [v4 valueForKey:@"PlanSetupTypeKey"];
        uint64_t v93 = (int)[v92 intValue];
      }
      else
      {
        uint64_t v93 = 2;
      }

      v94 = [v4 objectForKeyedSubscript:@"TransferBackPlan"];
      v95 = [MEMORY[0x263EFF9D0] null];

      if (v94 == v95)
      {

        v94 = 0;
      }
      v96 = [v4 objectForKeyedSubscript:@"CarrierNameKey"];
      v97 = [MEMORY[0x263EFF9D0] null];

      if (v96 == v97)
      {

        v96 = 0;
      }
      v98 = [v4 objectForKeyedSubscript:@"MaybeShowConfirmationCodePaneKey"];
      uint64_t v99 = [v98 BOOLValue];

      int v8 = [[TSCellularPlanActivatingFlow alloc] initWithSkipActivatingPane:v36 timerType:v39 transferBackPlan:v94 setupType:v93 carrierName:v96 maybeShowConfirmationCodePane:v99];
      goto LABEL_104;
    case 17:
      uint64_t v10 = [v4 objectForKeyedSubscript:@"HostViewController"];
      v40 = [TSCarrierSignupFlow alloc];
      if (v10)
      {
        id v27 = [v4 objectForKeyedSubscript:@"Plan"];
        v28 = [(TSCarrierSignupFlow *)v40 initWithPlan:v27 queriableFirstViewController:1 hostViewController:v10];
      }
      else
      {
        id v27 = [v4 valueForKey:@"Plan"];
        v28 = [(TSCarrierSignupFlow *)v40 initWithPlan:v27];
      }
      goto LABEL_79;
    case 18:
      v41 = [v4 objectForKeyedSubscript:@"CarrierNameKey"];
      uint64_t v10 = v41;
      if (!v41 || ![v41 length])
      {
        v42 = _TSLogDomain();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          +[TSSIMSetupFlow _flowWithOptions:](v42, v43, v44, v45, v46, v47, v48, v49);
        }
      }
      id v27 = [v4 valueForKey:@"RequireSetupKey-DEBUG"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v50 = [v27 BOOLValue];
      }
      else {
        uint64_t v50 = 0;
      }
      v82 = [TSSIMSetupPublicApiInstallFlow alloc];
      v83 = v10;
      uint64_t v84 = v50;
      uint64_t v85 = 0;
      goto LABEL_78;
    case 19:
      v51 = [v4 objectForKeyedSubscript:@"CarrierNameKey"];
      uint64_t v10 = v51;
      if (!v51 || ![v51 length])
      {
        v52 = _TSLogDomain();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          +[TSSIMSetupFlow _flowWithOptions:](v52, v53, v54, v55, v56, v57, v58, v59);
        }
      }
      id v27 = [v4 valueForKey:@"RequireSetupKey-DEBUG"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v60 = [v27 BOOLValue];
      }
      else {
        uint64_t v60 = 0;
      }
      v82 = [TSSIMSetupPublicApiInstallFlow alloc];
      v83 = v10;
      uint64_t v84 = v60;
      uint64_t v85 = 1;
LABEL_78:
      v28 = [(TSSIMSetupPublicApiInstallFlow *)v82 initWithAppName:v83 requireSetup:v84 skipGeneralInstallConsent:v85];
      goto LABEL_79;
    case 20:
      v61 = TSIDSTransferFlow;
      goto LABEL_46;
    case 21:
      v61 = TSRecommendedCarrierAppsFlow;
LABEL_46:
      v62 = (TSQRCodeScanFlow *)objc_alloc_init(v61);
      goto LABEL_48;
    case 22:
      v63 = [v4 objectForKeyedSubscript:@"IsFirstViewKey"];
      int v64 = [v63 BOOLValue];

      v62 = [[TSQRCodeScanFlow alloc] initWithBackButton:v64 ^ 1u];
LABEL_48:
      int v8 = (TSTransferFlow *)v62;
      goto LABEL_104;
    case 23:
      v65 = [v4 objectForKeyedSubscript:@"TravelOptionsKey"];
      uint64_t v10 = (void *)[v65 mutableCopy];

      v66 = [v4 objectForKeyedSubscript:@"TravelOptionsKey"];
      v67 = [v66 allKeys];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v27 = v67;
      uint64_t v68 = [v27 countByEnumeratingWithState:&v109 objects:v113 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v110 != v70) {
              objc_enumerationMutation(v27);
            }
            uint64_t v72 = *(void *)(*((void *)&v109 + 1) + 8 * i);
            if ((objc_msgSend(&unk_26DC141E8, "containsObject:", v72, (void)v109) & 1) == 0) {
              [v10 removeObjectForKey:v72];
            }
          }
          uint64_t v69 = [v27 countByEnumeratingWithState:&v109 objects:v113 count:16];
        }
        while (v69);
      }

      v28 = [[TSTravelEducationFlow alloc] initWithOptions:v10];
      goto LABEL_79;
    default:
      if (v7 != 10002)
      {
        if (v7 != 10003) {
          goto LABEL_104;
        }
        id v12 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v10 = (void *)[v12 initWithDomain:*MEMORY[0x263F31920] code:46 userInfo:0];
        v11 = [[TSActivationPolicyMismatchFlow alloc] initWithPlanItemError:v10];
LABEL_102:
        int v8 = (TSTransferFlow *)v11;
        goto LABEL_103;
      }
      uint64_t v10 = [v4 valueForKey:@"IsClientKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v73 = [v10 BOOLValue];
      }
      else {
        int v73 = 0;
      }
      v87 = _TSLogDomain();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = "no";
        if (v73) {
          v88 = "yes";
        }
        *(_DWORD *)buf = 136315394;
        v115 = v88;
        __int16 v116 = 2080;
        v117 = "+[TSSIMSetupFlow _flowWithOptions:]";
        _os_log_impl(&dword_227A17000, v87, OS_LOG_TYPE_DEFAULT, "client ? %s @%s", buf, 0x16u);
      }

      if (!v73)
      {
        id v27 = [v4 objectForKeyedSubscript:@"TransferBackPlan"];
        id v89 = [MEMORY[0x263EFF9D0] null];

        if (v27 == v89)
        {

          id v27 = 0;
        }
        v28 = [[TSProximityTargetTransferFlow alloc] initWithTransferBackPlan:v27];
        goto LABEL_79;
      }
      id v27 = [v4 objectForKey:@"ResumeTransferProxCardKey"];
      if (v27)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v27 BOOLValue])
          {
            v28 = [[TSProximitySourceTransferFlow alloc] initForResumption];
LABEL_79:
            int v8 = (TSTransferFlow *)v28;
            goto LABEL_80;
          }
        }
      }
      v78 = [v4 objectForKeyedSubscript:@"PeerDeviceKey"];
      v79 = [[TSProximitySourceTransferFlow alloc] initWithPeerDevice:v78];
LABEL_118:
      int v8 = (TSTransferFlow *)v79;

LABEL_80:
LABEL_103:

LABEL_104:
      return v8;
  }
}

+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:]";
    __int16 v11 = 2080;
    id v12 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v9, 0x16u);
  }

  int v7 = [[TSSetupAssistantSIMSetupFlow alloc] initWithIccid:v5 showAddPlan:v4 forceDualSIMSetup:0 allowDismiss:1];
  return v7;
}

+ (id)initWithSetupFlowWithIccid:(id)a3 showAddPlan:(BOOL)a4 forceDualSIMSetup:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    id v12 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:forceDualSIMSetup:]";
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    __int16 v17 = 2080;
    uint64_t v18 = "+[TSSIMSetupFlow initWithSetupFlowWithIccid:showAddPlan:forceDualSIMSetup:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "%s showAddPlan: %d forceDualSIMSetup: %d @%s", (uint8_t *)&v11, 0x22u);
  }

  int v9 = [[TSSetupAssistantSIMSetupFlow alloc] initWithIccid:v7 showAddPlan:v6 forceDualSIMSetup:v5 allowDismiss:1];
  return v9;
}

+ (id)initActivationCodeRequireSetup:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "+[TSSIMSetupFlow initActivationCodeRequireSetup:]";
    __int16 v9 = 2080;
    uint64_t v10 = "+[TSSIMSetupFlow initActivationCodeRequireSetup:]";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [[TSActivationFlowWithSimSetupFlow alloc] initRequireSetup:v3 transferBackPlan:0];
  return v5;
}

+ (id)initWithActivationCodeOnlyFlow
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    BOOL v6 = "+[TSSIMSetupFlow initWithActivationCodeOnlyFlow]";
    __int16 v7 = 2080;
    int v8 = "+[TSSIMSetupFlow initWithActivationCodeOnlyFlow]";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "%s @%s", (uint8_t *)&v5, 0x16u);
  }

  id v3 = [[TSActivationFlowWithSimSetupFlow alloc] initRequireSetup:0 transferBackPlan:0];
  return v3;
}

- (TSSIMSetupFlow)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)TSSIMSetupFlow;
  v2 = [(TSSIMSetupFlow *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_isFlowFinished = 0;
    BOOL v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [MEMORY[0x263F829A0] _useCustomBackButtonAction];
      *(_DWORD *)buf = 67109378;
      int v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[TSSIMSetupFlow init]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "use custom button action : %d @%s", buf, 0x12u);
    }

    [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:1];
    uint64_t v6 = objc_opt_new();
    backOptions = v3->_backOptions;
    v3->_backOptions = (NSMutableDictionary *)v6;

    int v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v3 selector:sel_appForegrounded name:*MEMORY[0x263F833B8] object:0];

    uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel_appBackgrounded name:*MEMORY[0x263F83330] object:0];
  }
  return v3;
}

- (BOOL)isBootstrapAssertionRequired
{
  return 1;
}

- (id)firstViewController
{
  return 0;
}

- (void)firstViewController:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (id)rootViewController
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_navigationController = &self->_navigationController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_topViewController);
    uint64_t v6 = [v5 navigationController];

    id v7 = objc_loadWeakRetained((id *)&self->_topViewController);
    int v8 = v7;
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v9 = [v7 navigationController];
    objc_storeWeak((id *)p_navigationController, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_navigationController);
  objc_super v11 = [v10 viewControllers];

  if ([v11 count])
  {
    uint64_t v12 = 0;
    while (1)
    {
      int v8 = [v11 objectAtIndex:v12];
      if ([v8 conformsToProtocol:&unk_26DC1B908])
      {
        int v13 = [v8 delegate];

        if (v13 == self) {
          break;
        }
      }

      if (++v12 >= (unint64_t)[v11 count]) {
        goto LABEL_9;
      }
    }
    __int16 v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      __int16 v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = self;
      __int16 v20 = 2080;
      v21 = "-[TSSIMSetupFlow rootViewController]";
      _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "root view controller %@ for flow %@ @%s", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
LABEL_9:
    int v8 = 0;
  }

LABEL_14:
  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!self->_isFlowFinished)
  {
    BOOL v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[TSSIMSetupFlow presentationControllerDidDismiss:]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "user swipe down to dismiss flow. quit @%s", (uint8_t *)&v5, 0xCu);
    }

    [(TSSIMSetupFlow *)self userDidTapCancel];
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (void)restartWith:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  p_navigationController = &self->_navigationController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  if (!WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_topViewController);
    uint64_t v7 = [v6 navigationController];
    objc_storeWeak((id *)p_navigationController, v7);
  }
  id v8 = objc_loadWeakRetained((id *)p_navigationController);
  uint64_t v9 = [v8 topViewController];

  if ([(TSSIMSetupFlow *)self _needCustomizeBackAction:v9])
  {
    [(TSSIMSetupFlow *)self _startOver:v9];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)p_navigationController);
    objc_super v11 = [v10 viewControllers];
    unint64_t v12 = [v11 count];

    if (v12 < 2)
    {
      __int16 v17 = 0;
    }
    else
    {
      id v13 = objc_loadWeakRetained((id *)p_navigationController);
      __int16 v14 = [v13 viewControllers];
      id v15 = objc_loadWeakRetained((id *)p_navigationController);
      int v16 = [v15 viewControllers];
      __int16 v17 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v16, "count") - 2);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = objc_loadWeakRetained((id *)p_navigationController);
        uint64_t v19 = [v18 viewControllers];
        unint64_t v20 = [v19 count];

        if (v20 < 3)
        {
          uint64_t v25 = 0;
        }
        else
        {
          id v21 = objc_loadWeakRetained((id *)p_navigationController);
          uint64_t v22 = [v21 viewControllers];
          id v23 = objc_loadWeakRetained((id *)p_navigationController);
          uint64_t v24 = [v23 viewControllers];
          uint64_t v25 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v24, "count") - 3);

          __int16 v17 = v21;
        }

        __int16 v17 = (void *)v25;
      }
    }
    v26 = _TSLogDomain();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412802;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v17;
      __int16 v34 = 2080;
      v35 = "-[TSSIMSetupFlow restartWith:]";
      _os_log_impl(&dword_227A17000, v26, OS_LOG_TYPE_DEFAULT, "normal back from : %@ -> %@ @%s", (uint8_t *)&v30, 0x20u);
    }

    if (v17)
    {
      id v27 = objc_loadWeakRetained((id *)p_navigationController);
      id v28 = (id)[v27 popToViewController:v17 animated:1];

      if ([v17 conformsToProtocol:&unk_26DC1B908])
      {
        objc_storeWeak((id *)&self->_topViewController, v17);
      }
      else
      {
        v29 = _TSLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[TSSIMSetupFlow restartWith:]();
        }
      }
    }
    else
    {
      [(TSSIMSetupFlow *)self _notifyFlowCompletion:1];
    }
  }
}

- (BOOL)_needCustomizeBackAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self)
  {
    int v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      *(void *)id v13 = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      uint64_t v7 = "[I] self is nil @%s";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 12;
LABEL_13:
      _os_log_impl(&dword_227A17000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
LABEL_14:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  if (self->_isFlowFinished)
  {
    int v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      *(void *)id v13 = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "back tapped after flow end. @%s", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v6) = 1;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      *(void *)id v13 = v4;
      *(_WORD *)&v13[8] = 2080;
      *(void *)&v13[10] = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
      uint64_t v7 = "%@ doesnot require customized back @%s";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 22;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  int v6 = [v4 isStartOverRequiredOnBackButtonTapped];
  int v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109378;
    *(_DWORD *)id v13 = v6;
    *(_WORD *)&v13[4] = 2080;
    *(void *)&v13[6] = "-[TSSIMSetupFlow _needCustomizeBackAction:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "is start over required : %d @%s", (uint8_t *)&v12, 0x12u);
  }
LABEL_15:

  return v6;
}

- (BOOL)_startOver:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TSSIMSetupFlow *)self waitForResponse:v4];
  int v5 = [(TSSIMSetupFlow *)self parentFlow];

  if (v5)
  {
    int v6 = [(TSSIMSetupFlow *)self parentFlow];
    char v7 = [v6 _startOver:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2080;
      unint64_t v20 = "-[TSSIMSetupFlow _startOver:]";
      _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "check start over vc for root flow : %@, vc : %@ @%s", buf, 0x20u);
    }

    os_log_type_t v9 = dispatch_get_global_queue(2, 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __29__TSSIMSetupFlow__startOver___block_invoke;
    v11[3] = &unk_264827E80;
    v11[4] = self;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    dispatch_async(v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    char v7 = 1;
  }

  return v7;
}

void __29__TSSIMSetupFlow__startOver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSSIMSetupFlow__startOver___block_invoke_2;
  v5[3] = &unk_264827EF8;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 startOverWithFirstViewController:v5];

  objc_destroyWeak(&v8);
}

void __29__TSSIMSetupFlow__startOver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSSIMSetupFlow__startOver___block_invoke_3;
  v5[3] = &unk_264827ED0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
}

void __29__TSSIMSetupFlow__startOver___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained receivedResponseWithVC:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 40))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = objc_loadWeakRetained(v2);
      int v5 = [*(id *)(a1 + 40) subFlow];
      [v5 setParentFlow:v4];
    }
    id v6 = objc_loadWeakRetained(v2);
    [v6 _pushStartOverViewController:*(void *)(a1 + 40) from:*(void *)(a1 + 32)];

    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[TSSIMSetupFlow _startOver:]_block_invoke";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "assert in purchase with startOver @%s", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v8 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v8 assertUserInPurchaseFlowStartOver:1 caller:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v10 = (char *)objc_loadWeakRetained(v2);
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2080;
      uint64_t v14 = "-[TSSIMSetupFlow _startOver:]_block_invoke_3";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "cannot start over, pop all views for flow : %@ @%s", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = objc_loadWeakRetained(v2);
    [v8 _popAllSIMSetupFlowViewControllers:*(void *)(a1 + 32)];
  }
}

- (void)_popAllSIMSetupFlowViewControllers:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = (char *)a3;
  int v5 = [(TSSIMSetupFlow *)self rootViewController];
  if (!v5)
  {
    int v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    id v20 = (id)[WeakRetained popViewControllerAnimated:1];
    goto LABEL_13;
  }
  p_navigationController = &self->_navigationController;
  id v7 = objc_loadWeakRetained((id *)&self->_navigationController);
  uint64_t v8 = [v7 viewControllers];
  uint64_t v9 = [v8 indexOfObject:v5];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_navigationController);
    uint64_t v22 = [v21 viewControllers];
    id WeakRetained = [v22 objectAtIndex:v9 - 1];

    id v23 = _TSLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412802;
      id v27 = v4;
      __int16 v28 = 2112;
      v29 = WeakRetained;
      __int16 v30 = 2080;
      v31 = "-[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:]";
      _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_DEFAULT, "pop all. from %@ to %@ @%s", (uint8_t *)&v26, 0x20u);
    }

    id v24 = objc_loadWeakRetained((id *)p_navigationController);
    id v25 = (id)[v24 popToViewController:WeakRetained animated:1];

LABEL_13:
    goto LABEL_14;
  }
  uint32_t v10 = _TSLogDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315138;
    id v27 = "-[TSSIMSetupFlow _popAllSIMSetupFlowViewControllers:]";
    _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "no previous view controller, cancel SS flow @%s", (uint8_t *)&v26, 0xCu);
  }

  [(TSSIMSetupFlow *)self userDidTapCancel];
LABEL_14:
}

- (void)_pushStartOverViewController:(id)a3 from:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412802;
    id v28 = v7;
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 2080;
    uint64_t v32 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "start over - back from %@ to %@ @%s", (uint8_t *)&v27, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  uint32_t v10 = [WeakRetained viewControllers];
  int v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(TSSIMSetupFlow *)self rootViewController];
  if (v12)
  {
    uint64_t v13 = [v11 indexOfObject:v12];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
    uint64_t v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[TSSIMSetupFlow _pushStartOverViewController:from:](v14);
    }
  }
  uint64_t v13 = 0;
LABEL_9:
  uint64_t v15 = _TSLogDomain();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v11;
    __int16 v29 = 2080;
    __int16 v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_227A17000, v15, OS_LOG_TYPE_DEFAULT, "before shrink. view controllers : %@ @%s", (uint8_t *)&v27, 0x16u);
  }

  [v11 insertObject:v6 atIndex:v13];
  uint64_t v16 = _TSLogDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v11;
    __int16 v29 = 2080;
    __int16 v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "after insert: vcs:%@ @%s", (uint8_t *)&v27, 0x16u);
  }

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v6 takeScreenShot:v7];
    id v17 = objc_loadWeakRetained((id *)&self->_navigationController);
    [v17 setViewControllers:v11 animated:0];

    id v18 = objc_loadWeakRetained((id *)&self->_navigationController);
    __int16 v19 = v18;
    id v20 = v6;
    uint64_t v21 = 0;
  }
  else
  {
    id v22 = objc_loadWeakRetained((id *)&self->_navigationController);
    [v22 setViewControllers:v11 animated:0];

    id v18 = objc_loadWeakRetained((id *)&self->_navigationController);
    __int16 v19 = v18;
    id v20 = v6;
    uint64_t v21 = 1;
  }
  id v23 = (id)[v18 popToViewController:v20 animated:v21];

  id v24 = _TSLogDomain();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = objc_loadWeakRetained((id *)&self->_navigationController);
    int v26 = [v25 viewControllers];
    int v27 = 138412546;
    id v28 = v26;
    __int16 v29 = 2080;
    __int16 v30 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
    _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "after pop to new root. view controllers : %@ @%s", (uint8_t *)&v27, 0x16u);
  }
  [(TSSIMSetupFlow *)self setIsFlowFinished:0];
  [(TSSIMSetupFlow *)self setTopViewController:v6];
}

- (void)startOverWithFirstViewController:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[TSSIMSetupFlow startOverWithFirstViewController:]((uint64_t)self, v5);
  }

  v4[2](v4, 0);
}

- (void)navigateToNextPaneFrom:(id)a3 navigationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&self->_navigationController, v7);
      firstViewControllerInstance = self->_firstViewControllerInstance;
      self->_firstViewControllerInstance = 0;
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke;
  block[3] = &unk_264827D90;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke(id *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1[4];
  v2 = a1 + 4;
  id v4 = [a1[5] dismissingViewController];

  if (v3 == v4)
  {
    int v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_cold_1((uint64_t)v2, v5, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    [a1[5] setDismissingViewController:a1[4]];
    int v5 = [a1[5] nextViewControllerFrom:a1[4]];
    [a1[5] setNextViewController:v5];
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      uint64_t v8 = v7;
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = objc_opt_class();
      id v12 = a1[5];
      *(_DWORD *)buf = 138413570;
      v35 = v7;
      __int16 v36 = 2112;
      v37 = v9;
      __int16 v38 = 2048;
      uint64_t v39 = (const char *)v5;
      __int16 v40 = 2112;
      uint64_t v41 = v11;
      __int16 v42 = 2048;
      id v43 = v12;
      __int16 v44 = 2080;
      uint64_t v45 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "current view: %@ next view: %@<%p>, flow: %@<%p> @%s", buf, 0x3Eu);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = a1[5];
      uint64_t v14 = v5;
      id v15 = [v14 subFlow];
      [v15 setParentFlow:v13];
    }
    if (v5)
    {
      if ([v5 conformsToProtocol:&unk_26DC1B908]) {
        [v5 setDelegate:a1[5]];
      }
      if (objc_opt_respondsToSelector())
      {
        [a1[5] waitForResponse:*v2];
        BOOL v16 = (objc_opt_respondsToSelector() & 1) != 0
           && [*v2 performSelector:sel_userInteractionEnabled] != 0;
        int v27 = [a1[6] topViewController];
        id v28 = [v27 view];
        [v28 setUserInteractionEnabled:v16];

        objc_initWeak((id *)buf, a1[5]);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_153;
        v29[3] = &unk_264827F20;
        objc_copyWeak(&v33, (id *)buf);
        int v5 = v5;
        __int16 v30 = v5;
        id v31 = a1[4];
        id v32 = a1[6];
        [v5 prepare:v29];

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else if (([a1[5] isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        [a1[6] pushViewController:v5 animated:1];
        id v23 = _TSLogDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [a1[5] topViewController];
          *(_DWORD *)buf = 138412802;
          v35 = v5;
          __int16 v36 = 2112;
          v37 = v24;
          __int16 v38 = 2080;
          uint64_t v39 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
          _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_DEFAULT, "push %@ onto %@ @%s", buf, 0x20u);
        }
        id v26 = a1[5];
        id v25 = a1 + 5;
        [v26 setTopViewController:v5];
        [*v25 setDismissingViewController:0];
        [*v25 setNextViewController:0];
      }
    }
    else
    {
      [a1[5] _notifyFlowCompletion:2];
    }
  }
}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_153(uint64_t a1, int a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [WeakRetained nextViewController];
  id v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    id v12 = objc_loadWeakRetained(v4);
    [v12 receivedResponseWithVC:*(void *)(a1 + 40)];

    id v13 = [*(id *)(a1 + 48) topViewController];
    uint64_t v14 = [v13 view];
    [v14 setUserInteractionEnabled:1];

    if (a2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = *(void **)(a1 + 48);
        id v16 = *(id *)(a1 + 32);
        uint64_t v17 = [v15 visibleViewController];
        [v16 takeScreenShot:v17];

        [*(id *)(a1 + 48) pushViewController:v16 animated:0];
      }
      else
      {
        [*(id *)(a1 + 48) pushViewController:*(void *)(a1 + 32) animated:1];
      }
      uint64_t v18 = _TSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void **)(a1 + 32);
        id v20 = objc_loadWeakRetained(v4);
        uint64_t v21 = [v20 topViewController];
        *(_DWORD *)buf = 138412802;
        id v28 = v19;
        __int16 v29 = 2112;
        __int16 v30 = v21;
        __int16 v31 = 2080;
        id v32 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
        _os_log_impl(&dword_227A17000, v18, OS_LOG_TYPE_DEFAULT, "push %@ onto %@ @%s", buf, 0x20u);
      }
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = objc_loadWeakRetained(v4);
      [v23 setTopViewController:v22];

      id v24 = objc_loadWeakRetained(v4);
      [v24 setDismissingViewController:0];

      id v25 = objc_loadWeakRetained(v4);
      [v25 setNextViewController:0];
    }
    else
    {
      id v26 = objc_loadWeakRetained(v4);
      [v26 navigateToNextPaneFrom:*(void *)(a1 + 32) navigationController:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained(v4);
      id v10 = [v9 nextViewController];
      uint64_t v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v28 = v10;
      __int16 v29 = 2112;
      __int16 v30 = v11;
      __int16 v31 = 2080;
      id v32 = "-[TSSIMSetupFlow navigateToNextPaneFrom:navigationController:]_block_invoke";
      _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "next vc mismatch. expect:%@, real:%@ @%s", buf, 0x20u);
    }
  }
}

- (void)_maybeClearSubFlow
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(TSSIMSetupFlow *)self nextViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[TSSIMSetupFlow _maybeClearSubFlow]";
      _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "clear nextVC @%s", (uint8_t *)&v10, 0xCu);
    }

    id v6 = [(TSSIMSetupFlow *)self nextViewController];
    id v7 = [v6 subFlow];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [v6 subFlow];
      [v9 performSelector:sel_cancelFlow];
    }
    [v6 setSubFlow:0];
    [(TSSIMSetupFlow *)self setNextViewController:0];
  }
}

- (void)_notifyFlowCompletion:(unint64_t)a3
{
  self->_isFlowFinished = 1;
  firstViewControllerInstance = self->_firstViewControllerInstance;
  self->_firstViewControllerInstance = 0;

  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TSSIMSetupFlow _notifyFlowCompletion:]();
  }

  [(TSSIMSetupFlow *)self setDismissingViewController:0];
  [(NSMutableDictionary *)self->_backOptions removeAllObjects];
  id v7 = [(TSSIMSetupFlow *)self delegate];

  if (!v7)
  {
    char v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TSSIMSetupFlow _notifyFlowCompletion:]();
    }
  }
  id v9 = [(TSSIMSetupFlow *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [(TSSIMSetupFlow *)self delegate];
  uint64_t v12 = v11;
  if (v10) {
    [v11 simSetupFlowCompleted:a3];
  }
  else {
    [v11 simSetupFlowCompleted];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlow);
  if (!WeakRetained)
  {
    uint64_t v14 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v14 deassertUserInPurchaseFlowWithForce:1 caller:self];
  }
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [v4 navigationController];
  [(TSSIMSetupFlow *)self navigateToNextPaneFrom:v4 navigationController:v5];
}

- (void)userDidTapCancel
{
  p_topViewController = &self->_topViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topViewController);
  id v5 = [WeakRetained presentedViewController];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_topViewController);
    id v7 = [v6 presentedViewController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__TSSIMSetupFlow_userDidTapCancel__block_invoke;
    v8[3] = &unk_2648279D0;
    v8[4] = self;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    [(TSSIMSetupFlow *)self _maybeClearSubFlow];
    [(TSSIMSetupFlow *)self _notifyFlowCompletion:1];
  }
}

uint64_t __34__TSSIMSetupFlow_userDidTapCancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidTapCancel];
}

- (void)waitForResponse:(id)a3
{
  id v15 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ![v15 performSelector:sel_customizeSpinner])
  {
    id v4 = +[TSNavigationBarSpinnerManager sharedManager];
    id v5 = [v15 navigationItem];
    [v4 startSpinnerInNavigationItem:v5 withIdentifier:@"waiting"];
  }
  id v6 = [v15 view];
  [v6 setUserInteractionEnabled:0];

  id v7 = objc_alloc_init(ViewControllerBackOption);
  char v8 = [v15 navigationItem];
  int v9 = [v8 hidesBackButton];

  if (v9)
  {
    [(ViewControllerBackOption *)v7 setHidesBackButton:1];
    char v10 = [v15 navigationItem];
    uint64_t v11 = [v10 leftBarButtonItems];
    [(ViewControllerBackOption *)v7 setLeftBarButtonItems:v11];

    uint64_t v12 = [v15 navigationItem];
    [v12 setLeftBarButtonItem:0 animated:0];
  }
  else
  {
    [(ViewControllerBackOption *)v7 setHidesBackButton:0];
    uint64_t v12 = [v15 navigationItem];
    [v12 setHidesBackButton:1];
  }

  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v15);
  uint64_t v14 = [(NSMutableDictionary *)self->_backOptions objectForKeyedSubscript:v13];

  if (!v14) {
    [(NSMutableDictionary *)self->_backOptions setObject:v7 forKeyedSubscript:v13];
  }
}

- (void)receivedResponse
{
  id v2 = +[TSNavigationBarSpinnerManager sharedManager];
  [v2 stopSpinnerForIdentifier:@"waiting"];
}

- (void)receivedResponseWithVC:(id)a3
{
  id v13 = a3;
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v13);
  id v5 = [(NSMutableDictionary *)self->_backOptions objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_backOptions objectForKeyedSubscript:v4];
    id v7 = v6;
    if (v6)
    {
      if (([v6 hidesBackButton] & 1) == 0)
      {
        int v9 = [v13 navigationItem];
        [v9 setHidesBackButton:0];
        goto LABEL_7;
      }
      char v8 = [v7 leftBarButtonItems];

      if (v8)
      {
        int v9 = [v13 navigationItem];
        char v10 = [v7 leftBarButtonItems];
        [v9 setLeftBarButtonItems:v10 animated:0];

LABEL_7:
      }
    }
    [(NSMutableDictionary *)self->_backOptions removeObjectForKey:v4];
  }
  uint64_t v11 = [v13 view];
  [v11 setUserInteractionEnabled:1];

  uint64_t v12 = +[TSNavigationBarSpinnerManager sharedManager];
  [v12 stopSpinnerForIdentifier:@"waiting"];
}

- (void)attemptFailed
{
  [(TSSIMSetupFlow *)self _maybeClearSubFlow];
  [(TSSIMSetupFlow *)self _notifyFlowCompletion:3];
}

- (void)cancelNextPane
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    char v8 = "-[TSSIMSetupFlow cancelNextPane]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "cancel next pane @%s", (uint8_t *)&v7, 0xCu);
  }

  [(TSSIMSetupFlow *)self setDismissingViewController:0];
  id v4 = [(TSSIMSetupFlow *)self nextViewController];
  [v4 setDelegate:0];

  [(TSSIMSetupFlow *)self _maybeClearSubFlow];
  [(TSSIMSetupFlow *)self setNextViewController:0];
  id v5 = [(TSSIMSetupFlow *)self topViewController];
  id v6 = [v5 view];
  [v6 setUserInteractionEnabled:1];
}

- (void)maybeRegisterDismissHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!+[TSUtilities inBuddy])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlow);

    if (!WeakRetained)
    {
      id v6 = [v4 navigationController];

      if (!v6)
      {
        id v13 = _TSLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[TSSIMSetupFlow maybeRegisterDismissHandler:](v13, v17, v18, v19, v20, v21, v22, v23);
        }
        goto LABEL_14;
      }
      int v7 = [v4 navigationController];
      char v8 = [v7 presentationController];
      uint64_t v9 = [v8 delegate];

      if (!v9)
      {
        id v24 = _TSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v4 navigationController];
          id v26 = [v25 presentationController];
          int v27 = 138412802;
          id v28 = v26;
          __int16 v29 = 2112;
          __int16 v30 = self;
          __int16 v31 = 2080;
          id v32 = "-[TSSIMSetupFlow maybeRegisterDismissHandler:]";
          _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "register UIAdaptivePresentationControllerDelegate for %@. self = %@ @%s", (uint8_t *)&v27, 0x20u);
        }
        id v13 = [v4 navigationController];
        uint64_t v14 = [v13 presentationController];
        [v14 setDelegate:self];
        goto LABEL_13;
      }
      char v10 = [v4 navigationController];
      uint64_t v11 = [v10 presentationController];
      uint64_t v12 = [v11 delegate];

      if (v12 != self)
      {
        id v13 = _TSLogDomain();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_14:

          goto LABEL_15;
        }
        uint64_t v14 = [v4 navigationController];
        id v15 = [v14 presentationController];
        id v16 = [v15 delegate];
        int v27 = 138412802;
        id v28 = v16;
        __int16 v29 = 2112;
        __int16 v30 = self;
        __int16 v31 = 2080;
        id v32 = "-[TSSIMSetupFlow maybeRegisterDismissHandler:]";
        _os_log_impl(&dword_227A17000, v13, OS_LOG_TYPE_DEFAULT, "UIAdaptivePresentationControllerDelegate:%@ is not self:%@ @%s", (uint8_t *)&v27, 0x20u);

LABEL_13:
        goto LABEL_14;
      }
    }
  }
LABEL_15:
}

- (void)appForegrounded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(TSSIMSetupFlow *)self isBootstrapAssertionRequired])
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[TSSIMSetupFlow appForegrounded]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_INFO, "[I] app in foreground, assert bootstrap @%s", (uint8_t *)&v5, 0xCu);
    }

    id v4 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v4 assertUserInPurchaseFlowStartOver:0 caller:self];
  }
}

- (void)appBackgrounded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(TSSIMSetupFlow *)self isBootstrapAssertionRequired])
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[TSSIMSetupFlow appBackgrounded]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_INFO, "[I] app in background, deassert bootstrap @%s", (uint8_t *)&v5, 0xCu);
    }

    id v4 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v4 deassertUserInPurchaseFlowWithForce:1 caller:self];
  }
}

- (void)showLoadFailureAlert:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke;
  block[3] = &unk_264827D90;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 && [v2 code] == 67)
  {
    BOOL v3 = +[TSUtilities isGreenTeaCapable];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v5 = v4;
    if (v3) {
      id v6 = @"NOT_CONNECTED_TO_WLAN";
    }
    else {
      id v6 = @"NOT_CONNECTED_TO_WIFI";
    }
    id v7 = [v4 localizedStringForKey:v6 value:&stru_26DBE8E78 table:@"Localizable"];

    BOOL v8 = +[TSUtilities isGreenTeaCapable];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = v9;
    if (v8) {
      id v11 = @"TURN_ON_WLAN_TO_PURCHASE_PLAN";
    }
    else {
      id v11 = @"TURN_ON_WIFI_TO_PURCHASE_PLAN";
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v12 localizedStringForKey:@"Connection Failed" value:&stru_26DBE8E78 table:@"Localizable"];

    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = v9;
    id v11 = @"The connection to the server was lost.  Please try again later.";
  }
  id v13 = [v9 localizedStringForKey:v11 value:&stru_26DBE8E78 table:@"Localizable"];

  uint64_t v14 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v13 preferredStyle:1];
  id v15 = (void *)MEMORY[0x263F82400];
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke_2;
  v19[3] = &unk_264827F48;
  v19[4] = *(void *)(a1 + 40);
  uint64_t v18 = [v15 actionWithTitle:v17 style:0 handler:v19];
  [v14 addAction:v18];

  [*(id *)(a1 + 48) presentViewController:v14 animated:1 completion:0];
}

uint64_t __45__TSSIMSetupFlow_showLoadFailureAlert_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyFlowCompletion:3];
}

- (id)getRootFlow
{
  id v2 = self;
  BOOL v3 = [(TSSIMSetupFlow *)v2 parentFlow];

  if (v3)
  {
    do
    {
      id v4 = [(TSSIMSetupFlow *)v2 parentFlow];

      int v5 = [(TSSIMSetupFlow *)v4 parentFlow];

      id v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TSSIMSetupFlow getRootFlow]();
  }

  return v4;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(TSSIMSetupFlow *)self getRootFlow];
  id v4 = [v7 delegate];
  int v5 = [v4 conformsToProtocol:&unk_26DC47120];

  if (v5) {
    [v7 delegate];
  }
  else {
  id v6 = [MEMORY[0x263F82438] sharedApplication];
  }
  [v6 setIdleTimerDisabled:v3];
}

- (TSSIMSetupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TSSIMSetupFlow)parentFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFlow);
  return (TSSIMSetupFlow *)WeakRetained;
}

- (void)setParentFlow:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (UIViewController)dismissingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDismissingViewController:(id)a3
{
}

- (TSSetupFlowItem)nextViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextViewController);
  return (TSSetupFlowItem *)WeakRetained;
}

- (void)setNextViewController:(id)a3
{
}

- (UIViewController)firstViewControllerInstance
{
  return (UIViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFirstViewControllerInstance:(id)a3
{
}

- (BOOL)isFlowFinished
{
  return self->_isFlowFinished;
}

- (void)setIsFlowFinished:(BOOL)a3
{
  self->_isFlowFinished = a3;
}

- (NSMutableDictionary)backOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBackOptions:(id)a3
{
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(unint64_t)a3
{
  self->_flowType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backOptions, 0);
  objc_storeStrong((id *)&self->_firstViewControllerInstance, 0);
  objc_destroyWeak((id *)&self->_nextViewController);
  objc_destroyWeak((id *)&self->_dismissingViewController);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_parentFlow);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_topViewController);
}

+ (void)_flowWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_flowWithOptions:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)restartWith:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]back to non SIMSetupFlow ViewController : %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_popAllSIMSetupFlowViewControllers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_pushStartOverViewController:(os_log_t)log from:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TSSIMSetupFlow _pushStartOverViewController:from:]";
  _os_log_fault_impl(&dword_227A17000, log, OS_LOG_TYPE_FAULT, "[F]cannot found old root view controller index @%s", (uint8_t *)&v1, 0xCu);
}

- (void)startOverWithFirstViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = "-[TSSIMSetupFlow startOverWithFirstViewController:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]%@ doesnot support start over @%s", v3, 0x16u);
}

void __62__TSSIMSetupFlow_navigateToNextPaneFrom_navigationController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_notifyFlowCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]invalid delegate for the flow : %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_notifyFlowCompletion:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[TSSIMSetupFlow _notifyFlowCompletion:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] flow %@ finished @%s", v1, 0x16u);
}

- (void)maybeRegisterDismissHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getRootFlow
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[TSSIMSetupFlow getRootFlow]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] Root flow : %@ @%s", v1, 0x16u);
}

@end