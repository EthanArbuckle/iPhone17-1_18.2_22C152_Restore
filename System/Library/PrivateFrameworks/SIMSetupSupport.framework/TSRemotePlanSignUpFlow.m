@interface TSRemotePlanSignUpFlow
- (TSRemotePlanSignUpFlow)initWithRemotePlanWebsheetContext:(id)a3;
- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)accountCancelled;
- (void)accountPendingRelease;
- (void)dealloc;
- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8;
- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9;
- (void)firstViewController:(id)a3;
- (void)setRemotePlanWebsheetContext:(id)a3;
@end

@implementation TSRemotePlanSignUpFlow

- (TSRemotePlanSignUpFlow)initWithRemotePlanWebsheetContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSRemotePlanSignUpFlow;
  v5 = [(TSSIMSetupFlow *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(TSRemotePlanSignUpFlow *)v5 setRemotePlanWebsheetContext:v4];
    v7 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v7 assertUserInPurchaseFlowStartOver:0 caller:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSRemotePlanSignUpFlow;
  [(TSRemotePlanSignUpFlow *)&v4 dealloc];
}

- (id)firstViewController
{
  v3 = [TSCellularSetupLoadingViewController alloc];
  objc_super v4 = [(TSRemotePlanSignUpFlow *)self remotePlanWebsheetContext];
  v5 = [(TSCellularSetupLoadingViewController *)v3 initWithRemotePlanWebsheetContext:v4 isRemotePlan:1];

  [(TSCellularSetupLoadingViewController *)v5 setDelegate:self];
  [(TSSIMSetupFlow *)self setTopViewController:v5];
  return v5;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSRemotePlanSignUpFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [TSWebsheetViewController alloc];
    id v6 = [(TSRemotePlanSignUpFlow *)self remotePlanWebsheetContext];
    v7 = [v6 carrierName];
    id v8 = [(TSWebsheetViewController *)v5 initForRemotePlan:1 carrierName:v7 viewController:v4];

    [v8 setCallbackDelegate:self];
    id v9 = v8;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke;
    v12[3] = &unk_264827A70;
    id v13 = v4;
    id v14 = v9;
    id v10 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  v3 = [v2 postdata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F31960]];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }
  dispatch_time_t v6 = dispatch_time(0, 500000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke_2;
  block[3] = &unk_264827B58;
  char v11 = v5;
  id v9 = v2;
  id v10 = *(id *)(a1 + 40);
  id v7 = v2;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

void __49__TSRemotePlanSignUpFlow_nextViewControllerFrom___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 2;
  }
  v3 = [*(id *)(a1 + 32) carrierURL];
  id v4 = [*(id *)(a1 + 32) postdata];
  id v5 = +[TSURLRequestFactory requestWithType:v2 URL:v3 postdata:v4];

  if (([*(id *)(a1 + 32) isProcessCanceled] & 1) == 0) {
    [*(id *)(a1 + 40) loadRequest:v5 completion:0];
  }
}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  v12 = (void *)MEMORY[0x263F31978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 sharedManager];
  [v18 didPurchaseRemotePlanForEid:v17 imei:v16 meid:v15 iccid:v14 alternateSmdpFqdn:v13 completion:&__block_literal_global_13];
}

void __97__TSRemotePlanSignUpFlow_didPurchasePlanSuccessfullyWithEid_imei_meid_iccid_alternateSDMP_state___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _TSLogDomain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[TSRemotePlanSignUpFlow didPurchasePlanSuccessfullyWithEid:imei:meid:iccid:alternateSDMP:state:]_block_invoke";
    _os_log_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEFAULT, "Callback after purchase @%s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  int v17 = [a9 isEqualToString:@"pending-profile-release"];
  id v18 = [MEMORY[0x263F31978] sharedManager];
  v19 = v18;
  if (v17) {
    [v18 pendingReleaseRemotePlan];
  }
  else {
    [v18 didPurchaseRemotePlanForEid:v20 imei:v13 meid:v14 iccid:v15 alternateSmdpFqdn:v16 completion:&__block_literal_global_29];
  }
}

void __106__TSRemotePlanSignUpFlow_didTransferPlanSuccessfullyWithEid_imei_meid_iccid_srcIccid_alternateSDMP_state___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = _TSLogDomain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[TSRemotePlanSignUpFlow didTransferPlanSuccessfullyWithEid:imei:meid:iccid:srcIccid:alternateSDMP:state:]_block_invoke";
    _os_log_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEFAULT, "Callback after transfer @%s", (uint8_t *)&v1, 0xCu);
  }
}

- (void)accountCancelled
{
  id v2 = [MEMORY[0x263F31978] sharedManager];
  [v2 didCancelRemotePlan];
}

- (void)accountPendingRelease
{
  id v2 = [MEMORY[0x263F31978] sharedManager];
  [v2 pendingReleaseRemotePlan];
}

- (TSRemotePlanWebsheetContext)remotePlanWebsheetContext
{
  return (TSRemotePlanWebsheetContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRemotePlanWebsheetContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlanWebsheetContext, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end