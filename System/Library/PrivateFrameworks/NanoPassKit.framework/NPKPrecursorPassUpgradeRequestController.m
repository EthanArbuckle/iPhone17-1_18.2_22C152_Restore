@interface NPKPrecursorPassUpgradeRequestController
- (NPKPrecursorPassUpgradeRequestController)initWithPass:(id)a3;
- (NPKPrecursorPassUpgradeRequestControllerDelegate)delegate;
- (PKPrecursorPassUpgradeController)upgradeController;
- (id)pass;
- (id)upgradeRequestDescription;
- (void)fetchUpgradeRequestsWithCompletion:(id)a3;
- (void)precursorPassUpgradeRequestDidChange;
- (void)setDelegate:(id)a3;
- (void)setUpgradeController:(id)a3;
@end

@implementation NPKPrecursorPassUpgradeRequestController

- (NPKPrecursorPassUpgradeRequestController)initWithPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPrecursorPassUpgradeRequestController;
  v6 = [(NPKPrecursorPassUpgradeRequestController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (PKPrecursorPassUpgradeController)upgradeController
{
  upgradeController = self->_upgradeController;
  if (!upgradeController)
  {
    id v4 = objc_alloc(MEMORY[0x263F5C1D0]);
    pass = self->_pass;
    v6 = [MEMORY[0x263F5C128] sharedService];
    v7 = (PKPrecursorPassUpgradeController *)[v4 initWithPass:pass webService:v6];
    v8 = self->_upgradeController;
    self->_upgradeController = v7;

    [(PKPrecursorPassUpgradeController *)self->_upgradeController setDelegate:self];
    upgradeController = self->_upgradeController;
  }
  return upgradeController;
}

- (id)pass
{
  return self->_pass;
}

- (id)upgradeRequestDescription
{
  return self->_upgradeRequestDescription;
}

- (void)fetchUpgradeRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPrecursorPassUpgradeRequestController *)self upgradeController];
  v6 = [v5 devicePrimaryPrecursorRequest];

  objc_initWeak(&location, self);
  v7 = [(NPKPrecursorPassUpgradeRequestController *)self upgradeController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__NPKPrecursorPassUpgradeRequestController_fetchUpgradeRequestsWithCompletion___block_invoke;
  v9[3] = &unk_2644D4DD0;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v7 requestDescriptionFor:v6 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __79__NPKPrecursorPassUpgradeRequestController_fetchUpgradeRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 2, a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)precursorPassUpgradeRequestDidChange
{
  v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestController: Received precursor pass upgrade request did change.", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__NPKPrecursorPassUpgradeRequestController_precursorPassUpgradeRequestDidChange__block_invoke;
  v6[3] = &unk_2644D4DF8;
  objc_copyWeak(&v7, buf);
  [(NPKPrecursorPassUpgradeRequestController *)self fetchUpgradeRequestsWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __80__NPKPrecursorPassUpgradeRequestController_precursorPassUpgradeRequestDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 precursorPassUpgradeRequestsDidChangeForUpgradeController:WeakRetained];
}

- (NPKPrecursorPassUpgradeRequestControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKPrecursorPassUpgradeRequestControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setUpgradeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upgradeRequestDescription, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end