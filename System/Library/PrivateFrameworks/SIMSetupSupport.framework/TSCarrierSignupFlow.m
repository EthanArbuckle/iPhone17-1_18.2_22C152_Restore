@interface TSCarrierSignupFlow
- (TSCarrierSignupFlow)initWithPlan:(id)a3;
- (TSCarrierSignupFlow)initWithPlan:(id)a3 queriableFirstViewController:(BOOL)a4 hostViewController:(id)a5;
- (TSSIMSetupFlow)subFlow;
- (id)_getSFSafariViewControllerWithURL:(id)a3;
- (id)_handleCarrierInfoWithUrl:(id)a3 postdata:(id)a4 type:(id)a5 error:(id)a6;
- (id)nextViewControllerFrom:(id)a3;
- (void)dealloc;
- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7;
- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setSubFlow:(id)a3;
- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4;
- (void)startTimer:(int64_t)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSCarrierSignupFlow

- (TSCarrierSignupFlow)initWithPlan:(id)a3 queriableFirstViewController:(BOOL)a4 hostViewController:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!+[TSUtilities isPad])
  {
    v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:](v17);
    }
    goto LABEL_10;
  }
  if (!v9)
  {
    v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)TSCarrierSignupFlow;
  v11 = [(TSSIMSetupFlow *)&v26 init];
  if (v11)
  {
    v12 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v12 assertUserInPurchaseFlowStartOver:0 caller:v11];

    objc_storeStrong((id *)&v11->_hostViewController, a5);
    v11->_isQueriableFirstViewController = a4;
    uint64_t v13 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
    client = v11->_client;
    v11->_client = (CoreTelephonyClient *)v13;

    objc_storeStrong((id *)&v11->_plan, a3);
    postdata = v11->_postdata;
    v11->_postdata = 0;
  }
  self = v11;
  v16 = self;
LABEL_11:

  return v16;
}

- (TSCarrierSignupFlow)initWithPlan:(id)a3
{
  v26[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!+[TSUtilities isPad])
  {
    v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[TSCarrierSignupFlow initWithPlan:](v15);
    }
    goto LABEL_10;
  }
  if (!v5)
  {
    v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow initWithPlan:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v24.receiver = self;
  v24.super_class = (Class)TSCarrierSignupFlow;
  v6 = [(TSSIMSetupFlow *)&v24 init];
  if (v6)
  {
    v7 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v7 assertUserInPurchaseFlowStartOver:0 caller:v6];

    v6->_isQueriableFirstViewController = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
    client = v6->_client;
    v6->_client = (CoreTelephonyClient *)v8;

    objc_storeStrong((id *)&v6->_plan, a3);
    postdata = v6->_postdata;
    v6->_postdata = 0;

    v25[0] = @"FlowTypeKey";
    v25[1] = @"SkipActivatingPane";
    v26[0] = &unk_26DC14230;
    v26[1] = MEMORY[0x263EFFA80];
    v25[2] = @"DelayStartActivatingTimer";
    v26[2] = &unk_26DC14248;
    v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    uint64_t v12 = +[TSSIMSetupFlow flowWithOptions:v11];
    subFlow = v6->_subFlow;
    v6->_subFlow = (TSSIMSetupFlow *)v12;
  }
  self = v6;
  v14 = self;
LABEL_11:

  return v14;
}

- (void)dealloc
{
  v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSCarrierSignupFlow;
  [(TSCarrierSignupFlow *)&v4 dealloc];
}

- (void)showFirstViewControllerWithHostController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    client = self->_client;
    plan = self->_plan;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke;
    v18[3] = &unk_264827DE0;
    objc_copyWeak(&v22, &location);
    id v21 = v7;
    id v19 = v6;
    uint64_t v20 = self;
    [(CoreTelephonyClient *)client websheetInfoForPlan:plan completion:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow showFirstViewControllerWithHostController:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v14 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v15 = [WeakRetained _handleCarrierInfoWithUrl:v9 postdata:v10 type:v11 error:v12];
    if (v15)
    {
      objc_storeStrong(v14 + 13, a3);
      if ([v11 isEqualToString:@"buddyml"])
      {
        if ([*(id *)(a1 + 32) isInModalPresentation])
        {
          uint64_t v16 = [*(id *)(a1 + 32) navigationController];
        }
        else
        {
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithNibName:0 bundle:0];
          [v16 setModalInPresentation:1];
          [v16 setModalPresentationStyle:2];
        }
        uint64_t v23 = [[TSBuddyMLController alloc] initWithHostController:v16];
        id v24 = v14[14];
        v14[14] = v23;

        [v14[14] setDelegate:v14];
        id v25 = v14[14];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_3;
        v35[3] = &unk_264827D40;
        v35[4] = v14;
        id v36 = *(id *)(a1 + 32);
        id v26 = *(id *)(a1 + 48);
        id v37 = v16;
        id v38 = v26;
        id v21 = v16;
        [v25 loadRequest:v15 completion:v35];

        id v22 = v36;
        goto LABEL_12;
      }
      if ([v11 isEqualToString:@"Lite"])
      {
        uint64_t v18 = *(void **)(a1 + 40);
        id v19 = [v15 URL];
        uint64_t v20 = [v18 _getSFSafariViewControllerWithURL:v19];

        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_5;
        v31[3] = &unk_264827D68;
        id v34 = *(id *)(a1 + 48);
        id v32 = *(id *)(a1 + 32);
        id v33 = v20;
        id v21 = v20;
        dispatch_async(MEMORY[0x263EF83A0], v31);

        id v22 = v34;
LABEL_12:

LABEL_15:
        goto LABEL_16;
      }
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_6;
      v27[3] = &unk_264827DB8;
      v27[4] = v14;
      id v28 = v15;
      id v29 = *(id *)(a1 + 32);
      id v30 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x263EF83A0], v27);

      uint64_t v17 = v28;
    }
    else
    {
      [v14 showLoadFailureAlert:*(void *)(a1 + 32) error:v12];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_2;
      block[3] = &unk_264827CF0;
      id v40 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x263EF83A0], block);
      uint64_t v17 = v40;
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

uint64_t __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_3(id *a1, char a2)
{
  if (a2)
  {
    id v3 = a1[6];
    id v4 = [a1[5] navigationController];

    if (v3 != v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_4;
      block[3] = &unk_264827D18;
      id v7 = a1[6];
      id v8 = a1[5];
      id v9 = a1[7];
      dispatch_async(MEMORY[0x263EF83A0], block);

      return;
    }
    id v5 = (void (*)(void))*((void *)a1[7] + 2);
  }
  else
  {
    [a1[4] showLoadFailureAlert:a1[5] error:0];
    id v5 = (void (*)(void))*((void *)a1[7] + 2);
  }
  v5();
}

uint64_t __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationBar];
  id v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v2 setBackgroundColor:v3];

  [*(id *)(a1 + 40) presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ([*(id *)(a1 + 32) isInModalPresentation])
  {
    v2 = [*(id *)(a1 + 32) navigationController];
    [v2 setNavigationBarHidden:1 animated:0];

    id v3 = [*(id *)(a1 + 32) navigationController];
    [v3 pushViewController:*(void *)(a1 + 40) animated:1];
  }
  else
  {
    id v3 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:*(void *)(a1 + 40)];
    [v3 setModalPresentationStyle:2];
    [v3 setNavigationBarHidden:1 animated:0];
    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_6(uint64_t a1)
{
  id v2 = [[TSWebsheetViewController alloc] initForRemotePlan:0 carrierName:0 skipUIDismissal:1];
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 setCallbackDelegate:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_7;
  v6[3] = &unk_264827D40;
  uint64_t v3 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v8 = v2;
  id v9 = v4;
  id v5 = v2;
  [v5 loadRequest:v3 completion:v6];
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_7(uint64_t a1, char a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_8;
    block[3] = &unk_264827D90;
    void block[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [*(id *)(a1 + 32) showLoadFailureAlert:*(void *)(a1 + 40) error:0];
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __76__TSCarrierSignupFlow_showFirstViewControllerWithHostController_completion___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setTopViewController:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) isInModalPresentation])
  {
    id v2 = [*(id *)(a1 + 48) navigationController];
    [v2 pushViewController:*(void *)(a1 + 40) animated:1];
  }
  else
  {
    id v2 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:*(void *)(a1 + 40)];
    [v2 setModalPresentationStyle:2];
    [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(TSBuddyMLController *)self->_buddyMLController url];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(TSBuddyMLController *)self->_buddyMLController type];
      int v8 = [v7 isEqualToString:@"Lite"];

      if (v8)
      {
        id v9 = [(TSCarrierSignupFlow *)self _getSFSafariViewControllerWithURL:v6];
      }
      else
      {
        id v9 = [[TSWebsheetViewController alloc] initForRemotePlan:0 carrierName:0 skipUIDismissal:1];
        [(TSSubFlowViewController *)v9 setDelegate:self];
        [(TSSubFlowViewController *)v9 setCallbackDelegate:self];
        uint64_t v13 = +[TSURLRequestFactory requestWithType:1 URL:v6 postdata:self->_postdata];
        [(TSSubFlowViewController *)v9 loadRequest:v13 completion:0];
      }
      goto LABEL_12;
    }
    [(TSSIMSetupFlow *)self showLoadFailureAlert:v4 error:0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 dismissCause] == 3)
    {
      id v10 = [TSSubFlowViewController alloc];
      subFlow = self->_subFlow;
      id v12 = [(TSSIMSetupFlow *)self navigationController];
      id v9 = [(TSSubFlowViewController *)v10 initWithFlow:subFlow navigationController:v12];

      goto LABEL_12;
    }
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v5 = v4;
  uint64_t v6 = [v5 dismissCause];
  if (!v6)
  {
    if (!self->_buddyMLController && !self->_isQueriableFirstViewController) {
      [(TSSIMSetupFlow *)self userDidTapCancel];
    }
    goto LABEL_8;
  }
  if (v6 != 1)
  {

LABEL_10:
    v7.receiver = self;
    v7.super_class = (Class)TSCarrierSignupFlow;
    [(TSSIMSetupFlow *)&v7 viewControllerDidComplete:v4];
    goto LABEL_11;
  }
  [(TSSIMSetupFlow *)self showLoadFailureAlert:v5 error:0];
LABEL_8:

LABEL_11:
}

- (void)startTimer:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subFlow = self->_subFlow;
    int v7 = 138412546;
    int v8 = subFlow;
    __int16 v9 = 2080;
    id v10 = "-[TSCarrierSignupFlow startTimer:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "start timer on subflow %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  [(TSSIMSetupFlow *)self->_subFlow startTimer:a3];
}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a6;
  id v15 = +[TSUtilities getByteRepresentationOf:a3];
  uint64_t v14 = [MEMORY[0x263F31978] sharedManager];
  [v14 didPurchasePlanForCsn:v15 iccid:v13 profileServer:v12 state:v11];
}

- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  id v11 = (void *)MEMORY[0x263F31978];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v11 sharedManager];
  [v17 didPurchasePlanForCarrier:v16 mnc:v15 gid1:v14 gid2:v13 state:v12];
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__TSCarrierSignupFlow_safariViewControllerDidFinish___block_invoke;
  v6[3] = &unk_264827A70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __53__TSCarrierSignupFlow_safariViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[TSCarrierSignupFlow safariViewControllerDidFinish:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "safariViewController did finish @%s", (uint8_t *)&v5, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    id v3 = (id)[*(id *)(*(void *)(a1 + 32) + 88) userDidExitWebsheetFlowForPlan:*(void *)(*(void *)(a1 + 32) + 96)];
  }
  return [*(id *)(a1 + 32) viewControllerDidComplete:*(void *)(a1 + 40)];
}

- (id)_handleCarrierInfoWithUrl:(id)a3 postdata:(id)a4 type:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:].cold.4((uint64_t)self, (uint64_t)v13, v14);
    }
LABEL_12:

    id v17 = 0;
    goto LABEL_13;
  }
  if (!v10 || ![v10 length])
  {
    id v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]((uint64_t)self, v14);
    }
    goto LABEL_12;
  }
  if (v11 && [v11 count])
  {
    if ([v12 isEqualToString:@"websheet"])
    {
      id v15 = [NSURL URLWithString:v10];
      uint64_t v16 = 1;
    }
    else if ([v12 isEqualToString:@"buddyml"])
    {
      id v15 = [NSURL URLWithString:v10];
      uint64_t v16 = 5;
    }
    else if ([v12 isEqualToString:@"entitlements"])
    {
      id v15 = [NSURL URLWithString:v10];
      uint64_t v16 = 2;
    }
    else
    {
      if (![v12 isEqualToString:@"Lite"])
      {
        id v14 = _TSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]((uint64_t)v12, (uint64_t)self, v14);
        }
        goto LABEL_12;
      }
      id v15 = [NSURL URLWithString:v10];
      uint64_t v16 = 6;
    }
    id v17 = +[TSURLRequestFactory requestWithType:v16 URL:v15 postdata:v11];
  }
  else
  {
    id v19 = _TSLogDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]((uint64_t)v10, v19);
    }

    uint64_t v20 = (void *)MEMORY[0x263F089E0];
    id v21 = [NSURL URLWithString:v10];
    id v17 = [v20 requestWithURL:v21];

    [v17 _setNonAppInitiated:1];
  }
LABEL_13:

  return v17;
}

- (id)_getSFSafariViewControllerWithURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F16988];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setEntersReaderIfAvailable:0];
  [v6 _setEphemeral:1];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "set_isBeingUsedForCellularServiceBootstrap:", 1);
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F16980]) initWithURL:v5 configuration:v6];

  [v7 setDelegate:self];
  [v7 _setShowingLinkPreview:0];
  [v7 _setShowingLinkPreviewWithMinimalUI:0];
  [v7 setDismissButtonStyle:0];

  return v7;
}

- (TSSIMSetupFlow)subFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSubFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFlow, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_signUpViewController, 0);
  objc_storeStrong((id *)&self->_buddyMLController, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithPlan:(uint64_t)a3 queriableFirstViewController:(uint64_t)a4 hostViewController:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPlan:(os_log_t)log queriableFirstViewController:hostViewController:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[TSCarrierSignupFlow initWithPlan:queriableFirstViewController:hostViewController:]";
  _os_log_fault_impl(&dword_227A17000, log, OS_LOG_TYPE_FAULT, "[F]WARNING: Creating flow for unsupported hardware - unexpected behaviour will be seen @%s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithPlan:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPlan:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[TSCarrierSignupFlow initWithPlan:]";
  _os_log_fault_impl(&dword_227A17000, log, OS_LOG_TYPE_FAULT, "[F]WARNING: Creating flow for unsupported hardware - unexpected behaviour will be seen @%s", (uint8_t *)&v1, 0xCu);
}

- (void)showFirstViewControllerWithHostController:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleCarrierInfoWithUrl:(uint64_t)a1 postdata:(NSObject *)a2 type:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 96);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  id v6 = "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Missing URL for signup info: %@ @%s", (uint8_t *)&v3, 0x16u);
}

- (void)_handleCarrierInfoWithUrl:(uint64_t)a1 postdata:(NSObject *)a2 type:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  __int16 v5 = "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]No postdata for: %@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)_handleCarrierInfoWithUrl:(NSObject *)a3 postdata:type:error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 96);
  *(_WORD *)&v3[22] = 2080;
  OUTLINED_FUNCTION_1(&dword_227A17000, a2, a3, "[E]invalid request type: %@ for %@ @%s", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]");
}

- (void)_handleCarrierInfoWithUrl:(NSObject *)a3 postdata:type:error:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412802;
  *(void *)&v3[4] = *(void *)(a1 + 96);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  *(_WORD *)&v3[22] = 2080;
  OUTLINED_FUNCTION_1(&dword_227A17000, a2, a3, "[E]Signup info for: %@ failed: %@ @%s", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], "-[TSCarrierSignupFlow _handleCarrierInfoWithUrl:postdata:type:error:]");
}

@end