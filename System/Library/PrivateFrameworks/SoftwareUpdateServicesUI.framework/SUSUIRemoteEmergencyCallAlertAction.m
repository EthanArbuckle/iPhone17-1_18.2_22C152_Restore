@interface SUSUIRemoteEmergencyCallAlertAction
- (SUSUIRemoteEmergencyCallAlertAction)initWithCompletionBlock:(id)a3;
- (void)fireCompletionIfNecessaryForResult:(BOOL)a3;
@end

@implementation SUSUIRemoteEmergencyCallAlertAction

- (SUSUIRemoteEmergencyCallAlertAction)initWithCompletionBlock:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v15;
  id v5 = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __63__SUSUIRemoteEmergencyCallAlertAction_initWithCompletionBlock___block_invoke;
  v12 = &unk_26470ABC0;
  id v13 = location[0];
  v15 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)SUSUIRemoteEmergencyCallAlertAction;
  v15 = -[SUSUIRemoteEmergencyCallAlertAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v7, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, 0, v5, 0.0);
  objc_storeStrong((id *)&v15, v15);

  v6 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v6;
}

void __63__SUSUIRemoteEmergencyCallAlertAction_initWithCompletionBlock___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[location[0] info];
  [v2 flagForSetting:SUSUIEmergencyCallAlertActionOutputSuccess];
  BSSettingFlagIsYes();

  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (void)fireCompletionIfNecessaryForResult:(BOOL)a3
{
  uint64_t v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  if ([(SUSUIRemoteEmergencyCallAlertAction *)self canSendResponse])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
    [v5 setFlag:BSSettingFlagForBool() forSetting:SUSUIEmergencyCallAlertActionOutputSuccess];
    v3 = v8;
    id v4 = (id)[MEMORY[0x263F29BC0] responseWithInfo:v5];
    -[SUSUIRemoteEmergencyCallAlertAction sendResponse:](v3, "sendResponse:");

    objc_storeStrong(&v5, 0);
  }
}

@end