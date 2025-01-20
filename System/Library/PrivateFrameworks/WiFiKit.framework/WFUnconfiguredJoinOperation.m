@interface WFUnconfiguredJoinOperation
- (AirPortAssistantController)airportController;
- (NSDictionary)parameters;
- (UINavigationController)navigationController;
- (UIViewController)rootViewController;
- (WFUnconfiguredJoinOperation)initWithParameters:(id)a3 rootViewController:(id)a4;
- (void)airPortAssistantComplete:(id)a3 result:(int)a4 context:(id)a5 animated:(BOOL)a6;
- (void)finish;
- (void)setAirportController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)start;
@end

@implementation WFUnconfiguredJoinOperation

- (WFUnconfiguredJoinOperation)initWithParameters:(id)a3 rootViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFUnconfiguredJoinOperation;
  v9 = [(WFUnconfiguredJoinOperation *)&v18 init];
  v10 = v9;
  if (!v8 || !v7 || !v9)
  {
LABEL_12:

    v10 = 0;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_parameters, a3);
  objc_storeStrong((id *)&v10->_rootViewController, a4);
  uint64_t v11 = [MEMORY[0x263F24AF0] assistantUIViewControllerWithParameters:v7];
  airportController = v10->_airportController;
  v10->_airportController = (AirPortAssistantController *)v11;

  v13 = v10->_airportController;
  if (!v13)
  {
    v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_226071000, v15, v16, "Unable to create AirPortAssistantController", v17, 2u);
    }

    goto LABEL_12;
  }
  [(AirPortAssistantController *)v13 setDelegate:v10];
LABEL_6:

  return v10;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)WFUnconfiguredJoinOperation;
  [(WFOperation *)&v12 start];
  id v3 = objc_alloc(MEMORY[0x263F1C7F8]);
  v4 = [(WFUnconfiguredJoinOperation *)self airportController];
  v5 = [v4 viewController];
  v6 = (void *)[v3 initWithRootViewController:v5];
  [(WFUnconfiguredJoinOperation *)self setNavigationController:v6];

  id v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = 2 * ([v7 userInterfaceIdiom] == 1);
  v9 = [(WFUnconfiguredJoinOperation *)self navigationController];
  [v9 setModalPresentationStyle:v8];

  v10 = [(WFUnconfiguredJoinOperation *)self rootViewController];
  uint64_t v11 = [(WFUnconfiguredJoinOperation *)self navigationController];
  [v10 presentViewController:v11 animated:1 completion:0];
}

- (void)finish
{
  v4.receiver = self;
  v4.super_class = (Class)WFUnconfiguredJoinOperation;
  [(WFOperation *)&v4 finish];
  id v3 = [(WFUnconfiguredJoinOperation *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)airPortAssistantComplete:(id)a3 result:(int)a4 context:(id)a5 animated:(BOOL)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (a4 == -6723)
  {
    v13 = [MEMORY[0x263F087E8] associationErrorWithReason:6];
    [(WFOperation *)self setError:v13];
LABEL_10:

    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v11 = [v9 configuredSSID];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      v13 = WFLogForCategory(0);
      os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          os_log_type_t v16 = [v9 configuredSSID];
          int v17 = 138412290;
          objc_super v18 = v16;
          _os_log_impl(&dword_226071000, v15, v14, "Successfully configured SSID %@", (uint8_t *)&v17, 0xCu);
        }
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  [(WFUnconfiguredJoinOperation *)self finish];
}

- (AirPortAssistantController)airportController
{
  return self->_airportController;
}

- (void)setAirportController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_airportController, 0);
}

@end