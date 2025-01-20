@interface TSCellularPlanProximityTransferController
- (CoreTelephonyClient)client;
- (ESIMProxTransferControllerDelegate)delegate;
- (TSCellularPlanProximityTransferController)initWithESIMDelegate:(id)a3;
- (void)attemptFailed;
- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userDidTapCancel;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSCellularPlanProximityTransferController

- (TSCellularPlanProximityTransferController)initWithESIMDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSCellularPlanProximityTransferController;
  v5 = [(TSCellularPlanProximityTransferController *)&v10 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v7 = [v6 initWithQueue:MEMORY[0x263EF83A0]];
    client = v5->_client;
    v5->_client = (CoreTelephonyClient *)v7;

    [(CoreTelephonyClient *)v5->_client setDelegate:v5];
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)viewControllerDidComplete:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = _TSLogDomain();
  WeakRetained = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[TSCellularPlanProximityTransferController viewControllerDidComplete:]";
      _os_log_impl(&dword_227A17000, WeakRetained, OS_LOG_TYPE_DEFAULT, "view did complete @%s", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didComplete];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[TSCellularPlanProximityTransferController viewControllerDidComplete:](WeakRetained);
  }
}

- (void)userDidTapCancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TSCellularPlanProximityTransferController userDidTapCancel]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "user canceled secure intent flow @%s", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didComplete];
}

- (void)attemptFailed
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TSCellularPlanProximityTransferController attemptFailed]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "secure intent attempt failed @%s", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didComplete];
}

- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (+[TSUtilities isSecureIntentUIRequired:v10])
  {
    v13 = [[TSSecureIntentGestureViewController alloc] initWithExternalizedContext:v10 descriptor:v11 isLocalConvertFlow:v7];
    [(TSSecureIntentGestureViewController *)v13 setDelegate:self];
    v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      v19 = (const char *)v13;
      __int16 v20 = 2080;
      v21 = "-[TSCellularPlanProximityTransferController launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "present %@ @%s", (uint8_t *)&v18, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didRequestPresentationForProxCard:v13];

    v12[2](v12, 1);
    v12 = (void (**)(id, uint64_t))v13;
  }
  else
  {
    v16 = _TSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[TSCellularPlanProximityTransferController launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "secure intent gesture is not required. skip @%s", (uint8_t *)&v18, 0xCu);
    }

    id v17 = (id)[(CoreTelephonyClient *)self->_client updateSecureIntentData:v10];
    v12[2](v12, 1);
  }
}

- (ESIMProxTransferControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ESIMProxTransferControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewControllerDidComplete:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSCellularPlanProximityTransferController viewControllerDidComplete:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid view controller @%s", (uint8_t *)&v1, 0xCu);
}

@end