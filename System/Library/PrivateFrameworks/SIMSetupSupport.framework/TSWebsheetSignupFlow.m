@interface TSWebsheetSignupFlow
- (TSWebsheetSignupFlow)init;
- (TSWebsheetSignupFlow)initWithIccid:(id)a3;
- (TSWebsheetSignupFlow)initWithPlan:(id)a3;
- (TSWebsheetSignupFlow)initWithRequestType:(unint64_t)a3 skipIntroPaneForWebsheetFlow:(BOOL)a4 websheetURL:(id)a5 postdata:(id)a6;
- (id)firstViewController;
- (id)getWebsheetViewController;
- (id)nextViewControllerFrom:(id)a3;
- (unint64_t)_translateRequestType:(id)a3;
- (void)_createURLRequest:(id)a3;
- (void)_showFailureAlert:(id)a3 completion:(id)a4;
- (void)accountCancelled;
- (void)accountPendingRelease;
- (void)dealloc;
- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7;
- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8;
- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9;
- (void)firstViewController:(id)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSWebsheetSignupFlow

- (TSWebsheetSignupFlow)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSWebsheetSignupFlow;
  v2 = [(TSSIMSetupFlow *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v3;

    v5 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v5 assertUserInPurchaseFlowStartOver:0 caller:v2];
  }
  return v2;
}

- (TSWebsheetSignupFlow)initWithRequestType:(unint64_t)a3 skipIntroPaneForWebsheetFlow:(BOOL)a4 websheetURL:(id)a5 postdata:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  v13 = [(TSWebsheetSignupFlow *)self init];
  if (v13)
  {
    v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      uint64_t v19 = [v11 UTF8String];
      __int16 v20 = 2112;
      id v21 = v12;
      __int16 v22 = 2080;
      v23 = "-[TSWebsheetSignupFlow initWithRequestType:skipIntroPaneForWebsheetFlow:websheetURL:postdata:]";
      _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "websheet: [%s] %@ @%s", (uint8_t *)&v18, 0x20u);
    }

    plan = v13->_plan;
    v13->_plan = 0;

    iccid = v13->_iccid;
    v13->_iccid = 0;

    objc_storeStrong((id *)&v13->_websheetURL, a5);
    objc_storeStrong((id *)&v13->_postdata, a6);
    v13->_requestType = a3;
    v13->_skipIntroPaneForWebsheetFlow = a4;
  }

  return v13;
}

- (TSWebsheetSignupFlow)initWithPlan:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(TSWebsheetSignupFlow *)self init];
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2080;
      v14 = "-[TSWebsheetSignupFlow initWithPlan:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Websheet flow: %@ @%s", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)&v6->_plan, a3);
    iccid = v6->_iccid;
    v6->_iccid = 0;

    websheetURL = v6->_websheetURL;
    v6->_websheetURL = 0;

    v6->_skipIntroPaneForWebsheetFlow = 1;
  }

  return v6;
}

- (TSWebsheetSignupFlow)initWithIccid:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(TSWebsheetSignupFlow *)self init];
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2080;
      v14 = "-[TSWebsheetSignupFlow initWithIccid:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Websheet flow: ICCID %@ @%s", (uint8_t *)&v11, 0x16u);
    }

    plan = v6->_plan;
    v6->_plan = 0;

    objc_storeStrong((id *)&v6->_iccid, a3);
    websheetURL = v6->_websheetURL;
    v6->_websheetURL = 0;

    v6->_skipIntroPaneForWebsheetFlow = 1;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSWebsheetSignupFlow;
  [(TSWebsheetSignupFlow *)&v4 dealloc];
}

- (id)firstViewController
{
  if (self->_skipIntroPaneForWebsheetFlow)
  {
    uint64_t v3 = [(TSWebsheetSignupFlow *)self getWebsheetViewController];
  }
  else
  {
    uint64_t v3 = [[TSAddCellularPlanViewController alloc] initWithType:2 allowDismiss:1];
    [(TSAddCellularPlanViewController *)v3 setDelegate:self];
  }
  [(TSSIMSetupFlow *)self setTopViewController:v3];
  return v3;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSWebsheetSignupFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [[TSWebsheetViewController alloc] initForRemotePlan:0 carrierName:0 skipUIDismissal:0];
    [v6 setCallbackDelegate:self];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke;
    v9[3] = &unk_264828AB8;
    id v7 = v6;
    id v10 = v7;
    [(TSWebsheetSignupFlow *)self _createURLRequest:v9];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke_2;
  v5[3] = &unk_264827A70;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __47__TSWebsheetSignupFlow_nextViewControllerFrom___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRequest:*(void *)(a1 + 40)];
}

- (id)getWebsheetViewController
{
  id v3 = [[TSWebsheetViewController alloc] initForRemotePlan:0 carrierName:0 skipUIDismissal:0];
  [v3 setDelegate:self];
  [v3 setCallbackDelegate:self];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke;
  v6[3] = &unk_264828AB8;
  id v4 = v3;
  id v7 = v4;
  [(TSWebsheetSignupFlow *)self _createURLRequest:v6];

  return v4;
}

void __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke_2;
  v5[3] = &unk_264827A70;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __49__TSWebsheetSignupFlow_getWebsheetViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendRequest:*(void *)(a1 + 40)];
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 dismissCause] == 1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__TSWebsheetSignupFlow_viewControllerDidComplete___block_invoke;
    v6[3] = &unk_264827A70;
    void v6[4] = self;
    id v7 = v4;
    [(TSWebsheetSignupFlow *)self _showFailureAlert:v7 completion:v6];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWebsheetSignupFlow;
    [(TSSIMSetupFlow *)&v5 viewControllerDidComplete:v4];
  }
}

void __50__TSWebsheetSignupFlow_viewControllerDidComplete___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 navigationController];
  [v1 navigateToNextPaneFrom:v2 navigationController:v3];
}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = +[TSCellularPlanManagerCache sharedInstance];
  [v15 didPurchasePlanForEid:v14 iccid:v13 smdpURL:v12 state:v11];
}

- (void)didPurchasePlanSuccessfullyWithCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[TSCellularPlanManagerCache sharedInstance];
  [v16 didPurchasePlanForCarrier:v15 mnc:v14 gid1:v13 gid2:v12 state:v11];
}

- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9
{
  id v13 = a9;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = +[TSCellularPlanManagerCache sharedInstance];
  [v18 didTransferPlanForEid:v17 iccid:v16 srcIccid:v15 smdpURL:v14 state:v13];
}

- (void)accountCancelled
{
}

- (void)accountPendingRelease
{
}

- (void)_createURLRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void (**)(void, void))v4;
  if (self->_websheetURL)
  {
    unint64_t requestType = self->_requestType;
    id v7 = objc_msgSend(NSURL, "URLWithString:");
    v8 = +[TSURLRequestFactory requestWithType:requestType URL:v7 postdata:self->_postdata];
    ((void (**)(void, void *))v5)[2](v5, v8);

    goto LABEL_8;
  }
  plan = self->_plan;
  if (plan)
  {
    client = self->_client;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__TSWebsheetSignupFlow__createURLRequest___block_invoke;
    v24[3] = &unk_264828AE0;
    v24[4] = self;
    id v25 = v4;
    [(CoreTelephonyClient *)client websheetInfoForPlan:plan completion:v24];
    id v11 = v25;
LABEL_7:

    goto LABEL_8;
  }
  iccid = self->_iccid;
  if (iccid)
  {
    id v13 = self->_client;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __42__TSWebsheetSignupFlow__createURLRequest___block_invoke_2;
    v22[3] = &unk_264828AE0;
    v22[4] = self;
    id v23 = v4;
    [(CoreTelephonyClient *)v13 websheetInfoForIccid:iccid completion:v22];
    id v11 = v23;
    goto LABEL_7;
  }
  id v14 = _TSLogDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[TSWebsheetSignupFlow _createURLRequest:](v14, v15, v16, v17, v18, v19, v20, v21);
  }

  v5[2](v5, 0);
LABEL_8:
}

void __42__TSWebsheetSignupFlow__createURLRequest___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v14 = a2;
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 40);
  if (a5)
  {
    (*(void (**)(void, void))(v10 + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) _translateRequestType:a4];
    id v12 = [NSURL URLWithString:v14];
    id v13 = +[TSURLRequestFactory requestWithType:v11 URL:v12 postdata:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
  }
}

void __42__TSWebsheetSignupFlow__createURLRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v14 = a2;
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 40);
  if (a5)
  {
    (*(void (**)(void, void))(v10 + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) _translateRequestType:a4];
    id v12 = [NSURL URLWithString:v14];
    id v13 = +[TSURLRequestFactory requestWithType:v11 URL:v12 postdata:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
  }
}

- (void)_showFailureAlert:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"Connection Failed" value:&stru_26DBE8E78 table:@"Localizable"];

  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"The connection to the server was lost.  Please try again later." value:&stru_26DBE8E78 table:@"Localizable"];

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __53__TSWebsheetSignupFlow__showFailureAlert_completion___block_invoke;
  v27[3] = &unk_264827C30;
  id v15 = v6;
  id v28 = v15;
  uint64_t v16 = [v12 actionWithTitle:v14 style:0 handler:v27];
  [v11 addObject:v16];

  uint64_t v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v10 preferredStyle:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(v17, "addAction:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v20);
  }

  [v5 presentViewController:v17 animated:1 completion:0];
}

uint64_t __53__TSWebsheetSignupFlow__showFailureAlert_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_translateRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"buddyml"]) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"websheet"];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetURL, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_createURLRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end