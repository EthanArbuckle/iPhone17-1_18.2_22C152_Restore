@interface WFLocationAccessResource
+ (BOOL)isSystemResource;
- (CLLocationManager)locationManager;
- (id)icon;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)makeAvailableCompletionHandler;
- (id)name;
- (id)workflow;
- (int)authorizationStatus;
- (unint64_t)status;
- (void)finishMakingAvailableWithSuccess:(BOOL)a3 error:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)setAuthorizationStatus:(int)a3;
- (void)setLocationManager:(id)a3;
- (void)setMakeAvailableCompletionHandler:(id)a3;
- (void)setWorkflow:(id)a3;
@end

@implementation WFLocationAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_makeAvailableCompletionHandler, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setMakeAvailableCompletionHandler:(id)a3
{
}

- (id)makeAvailableCompletionHandler
{
  return self->_makeAvailableCompletionHandler;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (id)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return WeakRetained;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  -[WFLocationAccessResource setAuthorizationStatus:](self, "setAuthorizationStatus:", [a3 authorizationStatus]);
  if ([(WFLocationAccessResource *)self authorizationStatus])
  {
    BOOL v4 = [(WFLocationAccessResource *)self authorizationStatus] == 3
      || [(WFLocationAccessResource *)self authorizationStatus] == 4;
    [(WFLocationAccessResource *)self finishMakingAvailableWithSuccess:v4 error:0];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
}

- (void)finishMakingAvailableWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  v6 = [(WFLocationAccessResource *)self locationManager];
  [v6 stopUpdatingLocation];

  [(WFResource *)self refreshAvailabilityWithForcedNotification];
  v7 = [(WFLocationAccessResource *)self makeAvailableCompletionHandler];

  if (v7)
  {
    v8 = [(WFLocationAccessResource *)self makeAvailableCompletionHandler];
    ((void (**)(void, BOOL, id))v8)[2](v8, v4, v9);
  }
  [(WFLocationAccessResource *)self setMakeAvailableCompletionHandler:0];
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  block[3] = &unk_1E6557D28;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMakeAvailableCompletionHandler:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 40) isRunningWithSiriUI])
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4FB4900]) initWithNeedsPreciseLocation:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v5[3] = &unk_1E6550838;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    [v3 performSiriRequest:v2 completionHandler:v5];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) locationManager];
    [v4 requestWhenInUseAuthorization];
  }
}

void __77__WFLocationAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v8;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 didAuthorize];
  id v7 = [v8 error];

  [v5 finishMakingAvailableWithSuccess:v6 error:v7];
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
  id v6 = [(WFLocationAccessResource *)self workflow];
  uint64_t v4 = [v6 environment];
  v5 = WFCLLocationManagerWithOptions(v4, self, MEMORY[0x1E4F14428]);
  [(WFLocationAccessResource *)self setLocationManager:v5];
}

- (unint64_t)status
{
  int v3 = [(WFLocationAccessResource *)self authorizationStatus];
  if (!v3)
  {
    uint64_t v4 = [(WFLocationAccessResource *)self workflow];
    int v3 = WFCLLocationManagerAuthorizationStatusForWorkflowEnvironment([v4 environment]);
  }
  if ((v3 - 1) > 3) {
    return 1;
  }
  else {
    return qword_1C856C798[v3 - 1];
  }
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"your location", @"your location");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)icon
{
  return (id)[MEMORY[0x1E4FB4770] workflowKitImageNamed:@"Location"];
}

- (id)name
{
  return WFLocalizedString(@"Location");
}

@end