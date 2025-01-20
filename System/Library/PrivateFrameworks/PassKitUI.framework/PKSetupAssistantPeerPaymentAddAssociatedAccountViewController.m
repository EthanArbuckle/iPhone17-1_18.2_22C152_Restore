@interface PKSetupAssistantPeerPaymentAddAssociatedAccountViewController
+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3;
+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4;
+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3;
+ (id)defaultWebServiceForContext:(int64_t)a3;
- (PKSetupAssistantPeerPaymentAddAssociatedAccountViewController)initWithPairingFamilyMember:(id)a3 parentFamilyMember:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8;
- (void)addPeerPaymentAssociatedAccountDidSkipSetupForFamilyMember:(id)a3;
- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5;
- (void)preflightWithCompletion:(id)a3;
@end

@implementation PKSetupAssistantPeerPaymentAddAssociatedAccountViewController

+ (BOOL)bridgeSetupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  v4 = [(PKSetupAssistantContext *)[PKBridgeSetupAssistantContext alloc] initWithSetupAssistant:2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F84C48]) initWithSetupAssistantContext:v4];
  LOBYTE(a3) = [v5 _setupAssistantNeedsToRunReturningRequirements:a3];

  return (char)a3;
}

+ (BOOL)bridgeSetupAssistantNeedsToRunWithContext:(id)a3 returningRequirements:(unint64_t *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F84C48];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithSetupAssistantContext:v6];

  LOBYTE(a4) = [v7 _setupAssistantNeedsToRunReturningRequirements:a4];
  return (char)a4;
}

+ (BOOL)setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  return 0;
}

+ (id)defaultWebServiceForContext:(int64_t)a3
{
  if (PKPaymentSetupContextIsBridge()) {
    [(objc_class *)getNPKCompanionAgentConnectionClass_5() watchPeerPaymentWebService];
  }
  else {
  v3 = [MEMORY[0x1E4F84E10] sharedService];
  }

  return v3;
}

- (PKSetupAssistantPeerPaymentAddAssociatedAccountViewController)initWithPairingFamilyMember:(id)a3 parentFamilyMember:(id)a4 webService:(id)a5 passLibraryDataProvider:(id)a6 delegate:(id)a7 context:(int64_t)a8
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  v14 = (objc_class *)MEMORY[0x1E4F84708];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[[v14 alloc] initWithFAFamilyMember:v18];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F84708]) initWithFAFamilyMember:v17];
  id v21 = objc_alloc(MEMORY[0x1E4F84710]);
  v28[0] = v19;
  v28[1] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v23 = (void *)[v21 initWithFamilyMembers:v22];

  v27.receiver = self;
  v27.super_class = (Class)PKSetupAssistantPeerPaymentAddAssociatedAccountViewController;
  v24 = [(PKPeerPaymentAddAssociatedAccountViewController *)&v27 initWithFamilyMember:v19 familyCollection:v23 webService:v16 passLibraryDataProvider:v15 delegate:self context:a8 setupType:0];

  if (v24) {
    objc_storeWeak((id *)&v24->_setupAssistantDelegate, v13);
  }

  return v24;
}

- (void)preflightWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  }
}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  BOOL v5 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v5)
  {
    v8 = [(objc_class *)getNPKCompanionAgentConnectionClass_5() watchPeerPaymentWebService];
    v9 = [v8 targetDevice];
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Request register peer payment service targetDevice:%@", (uint8_t *)&v12, 0xCu);
    }

    [v9 peerPaymentReRegisterWithURL:0 pushToken:0 peerPaymentWebService:v8 completion:&__block_literal_global_217];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupAssistantDelegate);
  [WeakRetained peerPaymentAddAssociatedAccountViewController:self didFinishWithSuccess:v5 updatedPeerPaymentAccount:v7];
}

void __152__PKSetupAssistantPeerPaymentAddAssociatedAccountViewController_addPeerPaymentAssociatedAccountSetupCompletedWithSucess_updatedAccount_forFamilyMember___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (a2) {
      id v6 = @"YES";
    }
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = a3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Finish request register peer payment service success:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)addPeerPaymentAssociatedAccountDidSkipSetupForFamilyMember:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupAssistantDelegate);
  [WeakRetained peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:self];
}

- (void).cxx_destruct
{
}

@end