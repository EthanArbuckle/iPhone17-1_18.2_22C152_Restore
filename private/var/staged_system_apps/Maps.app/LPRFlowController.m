@interface LPRFlowController
- (int64_t)scenario;
- (void)didCancelConfiguringLPRForVehicle:(id)a3;
- (void)didFinishConfiguringLPRForVehicle:(id)a3;
- (void)presentLPRFlowWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6;
- (void)setScenario:(int64_t)a3;
@end

@implementation LPRFlowController

- (void)presentLPRFlowWithVehicle:(id)a3 scenario:(int64_t)a4 presenter:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  [(LPRFlowController *)self setScenario:a4];
  if (![(LPRFlowController *)self scenario])
  {
    id v12 = 0;
    v11 = off_1012D33F8;
    goto LABEL_5;
  }
  if ((id)[(LPRFlowController *)self scenario] == (id)1)
  {
    v11 = &off_1012D3400;
    id v12 = v9;
LABEL_5:
    v13 = [objc_alloc(*v11) initWithScenario:a4 vehicle:v12 delegate:self];
    v14 = (OBNavigationController *)[objc_alloc((Class)OBNavigationController) initWithRootViewController:v13];
    navigationController = self->_navigationController;
    self->_navigationController = v14;

    [(OBNavigationController *)self->_navigationController setModalPresentationStyle:2];
    v16 = [(OBNavigationController *)self->_navigationController navigationItem];
    v17 = [v16 rightBarButtonItem];
    [v17 setAccessibilityIdentifier:@"RightBarButtonItem"];

    v18 = [(OBNavigationController *)self->_navigationController navigationItem];
    v19 = [v18 leftBarButtonItem];
    [v19 setAccessibilityIdentifier:@"LeftBarButtonItem"];

    [v10 _maps_topMostPresentViewController:self->_navigationController animated:1 completion:0];
    goto LABEL_6;
  }
  v13 = sub_1000519B4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v20 = 134217984;
    int64_t v21 = [(LPRFlowController *)self scenario];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid scenario: %ld aborting presentation of LPR", (uint8_t *)&v20, 0xCu);
  }
LABEL_6:
}

- (void)didFinishConfiguringLPRForVehicle:(id)a3
{
  id v4 = a3;
  v5 = sub_1000519B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 displayName];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = [(LPRFlowController *)self scenario];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@ in scenario: %lu", (uint8_t *)&v9, 0x16u);
  }
  v7 = [(OBNavigationController *)self->_navigationController presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  navigationController = self->_navigationController;
  self->_navigationController = 0;
}

- (void)didCancelConfiguringLPRForVehicle:(id)a3
{
  id v4 = a3;
  v5 = sub_1000519B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 displayName];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = [(LPRFlowController *)self scenario];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@ in scenario: %lu", (uint8_t *)&v9, 0x16u);
  }
  v7 = [(OBNavigationController *)self->_navigationController presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  navigationController = self->_navigationController;
  self->_navigationController = 0;
}

- (int64_t)scenario
{
  return self->_scenario;
}

- (void)setScenario:(int64_t)a3
{
  self->_scenario = a3;
}

- (void).cxx_destruct
{
}

@end