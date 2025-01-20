@interface ICQFamilySharingHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (FACircleStateController)familyCircleStateController;
- (ICQFamilySharingHook)initWithFlowDelegate:(id)a3;
- (ICQServerHookDelegate)flowDelegate;
- (RUIServerHookDelegate)delegate;
- (id)continuationResponseBody;
- (void)_beginFamilySharingFlowWithCompletion:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFamilyCircleStateController:(id)a3;
- (void)setFlowDelegate:(id)a3;
@end

@implementation ICQFamilySharingHook

- (ICQFamilySharingHook)initWithFlowDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQFamilySharingHook;
  v5 = [(ICQFamilySharingHook *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_flowDelegate, v4);
  }

  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ICQActionFamilySetup"];

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"OPEN_FAMILY_SETUP"];

  return v5;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
}

- (id)continuationResponseBody
{
  return 0;
}

- (void)_beginFamilySharingFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained presentationContextForHook:self];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v7 = (void *)getFACircleStateControllerClass_softClass_0;
  uint64_t v31 = getFACircleStateControllerClass_softClass_0;
  if (!getFACircleStateControllerClass_softClass_0)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getFACircleStateControllerClass_block_invoke_0;
    v26 = &unk_264921E58;
    v27 = &v28;
    __getFACircleStateControllerClass_block_invoke_0((uint64_t)&location);
    v7 = (void *)v29[3];
  }
  objc_super v8 = v7;
  _Block_object_dispose(&v28, 8);
  v9 = (FACircleStateController *)[[v8 alloc] initWithPresenter:v6];
  familyCircleStateController = self->_familyCircleStateController;
  self->_familyCircleStateController = v9;

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v11 = (void *)getFACircleContextClass_softClass_0;
  uint64_t v31 = getFACircleContextClass_softClass_0;
  if (!getFACircleContextClass_softClass_0)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getFACircleContextClass_block_invoke_0;
    v26 = &unk_264921E58;
    v27 = &v28;
    __getFACircleContextClass_block_invoke_0((uint64_t)&location);
    v11 = (void *)v29[3];
  }
  v12 = v11;
  _Block_object_dispose(&v28, 8);
  id v13 = [v12 alloc];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  v14 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  uint64_t v31 = getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_0)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getFACircleEventTypeInitiateSymbolLoc_block_invoke_0;
    v26 = &unk_264921E58;
    v27 = &v28;
    v15 = (void *)FamilyCircleUILibrary_0();
    v16 = dlsym(v15, "FACircleEventTypeInitiate");
    *(void *)(v27[1] + 24) = v16;
    getFACircleEventTypeInitiateSymbolLoc_ptr_0 = *(void *)(v27[1] + 24);
    v14 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v14) {
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:]();
  }
  v17 = (void *)[v13 initWithEventType:*v14];
  [v17 setClientName:@"iCloudStorage"];
  objc_initWeak(&location, self);
  v18 = self->_familyCircleStateController;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__ICQFamilySharingHook__beginFamilySharingFlowWithCompletion___block_invoke;
  v20[3] = &unk_264922B48;
  objc_copyWeak(&v22, &location);
  id v19 = v4;
  id v21 = v19;
  [(FACircleStateController *)v18 performOperationWithContext:v17 completion:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __62__ICQFamilySharingHook__beginFamilySharingFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Family sharing flow completed with success: %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_super v8 = [WeakRetained flowDelegate];
  [v8 dismissUpgradeFlowWithSuccess:a2];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICQServerHookDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  return (ICQServerHookDelegate *)WeakRetained;
}

- (void)setFlowDelegate:(id)a3
{
}

- (FACircleStateController)familyCircleStateController
{
  return (FACircleStateController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFamilyCircleStateController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCircleStateController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_beginFamilySharingFlowWithCompletion:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  -[ICQBackupStatusView _sizeToFitWidth:inTableView:](v0);
}

@end