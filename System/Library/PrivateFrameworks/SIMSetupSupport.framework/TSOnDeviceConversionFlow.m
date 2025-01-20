@interface TSOnDeviceConversionFlow
- (TSOnDeviceConversionFlow)initWithPhoneNumber:(id)a3 carrierName:(id)a4;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)firstViewController:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
@end

@implementation TSOnDeviceConversionFlow

- (TSOnDeviceConversionFlow)initWithPhoneNumber:(id)a3 carrierName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSOnDeviceConversionFlow;
  v9 = [(TSSIMSetupFlow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneNumber, a3);
    objc_storeStrong((id *)&v10->_carrierName, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v10 action:sel_userDidTapCancel];
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v11;
  }
  return v10;
}

- (id)firstViewController
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [[TSSinglePlanTransferViewController alloc] initWithLocalPhysical:self->_phoneNumber carrierName:self->_carrierName];
  [(TSSinglePlanTransferViewController *)v3 setDelegate:self];
  v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = objc_opt_class();
    __int16 v8 = 2080;
    v9 = "-[TSOnDeviceConversionFlow firstViewController]";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  [(TSSIMSetupFlow *)self setTopViewController:v3];
  return v3;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSOnDeviceConversionFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [TSSubFlowViewController alloc];
    v11[0] = @"FlowTypeKey";
    v11[1] = @"SkipActivatingPane";
    v12[0] = &unk_26DC145D8;
    v12[1] = MEMORY[0x263EFFA88];
    v11[2] = @"DelayStartActivatingTimer";
    v12[2] = &unk_26DC145F0;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    __int16 v8 = [(TSSIMSetupFlow *)self navigationController];
    v9 = [(TSSubFlowViewController *)v6 initWithOptions:v7 navigationController:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[TSUtilities isPad];
  id v6 = [v4 navigationItem];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setRightBarButtonItem:self->_cancelButton];
  }
  else
  {
    [v6 setHidesBackButton:1 animated:0];

    uint64_t v7 = [v4 navigationItem];
    [v7 setLeftBarButtonItem:self->_cancelButton];
  }

  id v10 = [v4 navigationController];

  __int16 v8 = [v10 navigationBar];
  v9 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v8 setBackgroundColor:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end