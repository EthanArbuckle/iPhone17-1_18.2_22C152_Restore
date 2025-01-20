@interface TSTravelEducationFlow
- (BOOL)isBootstrapAssertionRequired;
- (BOOL)returnHome;
- (NSDictionary)options;
- (TSTravelEducationFlow)initWithOptions:(id)a3;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReturnHome:(BOOL)a3;
@end

@implementation TSTravelEducationFlow

- (TSTravelEducationFlow)initWithOptions:(id)a3
{
  v4 = (NSDictionary *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TSTravelEducationFlow;
  v5 = [(TSSIMSetupFlow *)&v8 init];
  options = v5->_options;
  v5->_options = v4;

  return v5;
}

- (BOOL)isBootstrapAssertionRequired
{
  return 0;
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[TSTravelEducationFlow firstViewController](v2);
  }

  return 0;
}

- (void)firstViewController:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, TSTravelEducationIntroViewController *))a3;
  if (v4)
  {
    v5 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v6 = [v5 getSupportedFlowTypes];

    if (v6)
    {
      v7 = [[TSTravelEducationIntroViewController alloc] initWithOptions:self->_options];
      objc_super v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        options = self->_options;
        int v10 = 138412546;
        v11 = options;
        __int16 v12 = 2080;
        v13 = "-[TSTravelEducationFlow firstViewController:]";
        _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_DEFAULT, "options: %@ @%s", (uint8_t *)&v10, 0x16u);
      }

      [(TSTravelEducationIntroViewController *)v7 setDelegate:self];
      [(TSSIMSetupFlow *)self setTopViewController:v7];
      v4[2](v4, v7);
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 isRoamingTapped])
    {
      v5 = off_264827688;
    }
    else if ([v4 isExistingPlanTapped])
    {
      v5 = off_264827670;
    }
    else
    {
      if (![v4 isPurchaseLocalPlanTapped])
      {
        uint64_t v6 = 0;
        goto LABEL_13;
      }
      v5 = off_264827450;
    }
    uint64_t v6 = (TSSubFlowViewController *)objc_alloc_init(*v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_14;
    }
    id v4 = v3;
    uint64_t v6 = [v4 selectedCarrierItem];

    if (v6)
    {
      v7 = [TSSubFlowViewController alloc];
      v14[0] = &unk_26DC14590;
      v13[0] = @"FlowTypeKey";
      v13[1] = @"Plan";
      objc_super v8 = [v4 selectedCarrierItem];
      v9 = [v8 plan];
      v13[2] = @"HostViewController";
      v14[1] = v9;
      v14[2] = v4;
      int v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
      v11 = [v4 navigationController];
      uint64_t v6 = [(TSSubFlowViewController *)v7 initWithOptions:v10 navigationController:v11];
    }
  }
LABEL_13:

LABEL_14:
  return v6;
}

- (BOOL)returnHome
{
  return self->_returnHome;
}

- (void)setReturnHome:(BOOL)a3
{
  self->_returnHome = a3;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)firstViewController
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSTravelEducationFlow firstViewController]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E](UIViewController *)firstViewController is deprecated, please use (void)firstViewController:(void (^)(UIViewController *))completion @%s", (uint8_t *)&v1, 0xCu);
}

@end