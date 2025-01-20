@interface SUSUIAuthenticationAlertAction
- (BOOL)canDeferInstallation;
- (BOOL)forInstallTonight;
- (BSAction)baseAction;
- (Class)fallbackXPCEncodableClass;
- (SUAutoInstallForecast)autoInstallForecast;
- (SUDescriptor)descriptor;
- (SURollbackDescriptor)rollbackDescriptor;
- (SUSUIAuthenticationAlertAction)initWithDescriptor:(id)a3 autoInstallForecast:(id)a4 forInstallTonight:(BOOL)a5 canDeferInstallation:(BOOL)a6 completionQueue:(id)a7 completionBlock:(id)a8;
- (SUSUIAuthenticationAlertAction)initWithInfo:(id)a3 forBaseAction:(id)a4;
- (SUSUIAuthenticationAlertAction)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4 completionQueue:(id)a5 completionBlock:(id)a6;
- (unint64_t)alertType;
- (void)_loadIfNecessary;
- (void)fireCompletionIfNecessaryForResult:(BOOL)a3;
- (void)setBaseAction:(id)a3;
@end

@implementation SUSUIAuthenticationAlertAction

- (SUSUIAuthenticationAlertAction)initWithDescriptor:(id)a3 autoInstallForecast:(id)a4 forInstallTonight:(BOOL)a5 canDeferInstallation:(BOOL)a6 completionQueue:(id)a7 completionBlock:(id)a8
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  BOOL v33 = a5;
  BOOL v32 = a6;
  id v31 = 0;
  objc_storeStrong(&v31, a7);
  id v30 = 0;
  objc_storeStrong(&v30, a8);
  v36->_alertType = 0;
  id v29 = (id)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  if (location[0]) {
    [v29 encodeObject:location[0] forKey:@"_susDescriptor"];
  }
  if (v34) {
    [v29 encodeObject:v34 forKey:@"_susAutoInstallForecast"];
  }
  [v29 encodeBool:v33 forKey:@"_susForInstallTonight"];
  [v29 encodeBool:v32 forKey:@"_susCanDeferInstallation"];
  [v29 encodeInteger:v36->_alertType forKey:@"_susAlertType"];
  id v28 = (id)[v29 encodedData];
  id v27 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v27 setObject:v28 forSetting:SUSUIAuthenticationAlertActionInput];
  [v27 setObject:@"SUSUIAuthenticationAlertAction" forSetting:SUSUIAuthenticationAlertActionInputType];
  v11 = v36;
  id v12 = v27;
  char v25 = 0;
  if (v31)
  {
    id v10 = v31;
  }
  else
  {
    id v26 = MEMORY[0x263EF83A0];
    char v25 = 1;
    id v10 = v26;
  }
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  v22 = __144__SUSUIAuthenticationAlertAction_initWithDescriptor_autoInstallForecast_forInstallTonight_canDeferInstallation_completionQueue_completionBlock___block_invoke;
  v23 = &unk_26470ABC0;
  id v24 = v30;
  v36 = 0;
  v18.receiver = v11;
  v18.super_class = (Class)SUSUIAuthenticationAlertAction;
  v36 = [(SUSUIAuthenticationAlertAction *)&v18 initWithInfo:v12 timeout:v10 forResponseOnQueue:&v19 withHandler:0.0];
  objc_storeStrong((id *)&v36, v36);
  if (v25) {

  }
  objc_storeStrong((id *)&v36->_baseAction, 0);
  v36->_loaded = 1;
  v9 = v36;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v36, 0);
  return v9;
}

void __144__SUSUIAuthenticationAlertAction_initWithDescriptor_autoInstallForecast_forInstallTonight_canDeferInstallation_completionQueue_completionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = a1;
  id v4 = (id)[location[0] info];
  [v4 flagForSetting:SUSUIAuthenticationAlertActionOutputSuccess];
  char IsYes = BSSettingFlagIsYes();

  char v7 = IsYes & 1;
  os_log_t oslog = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      v2 = @"YES";
    }
    else {
      v2 = @"NO";
    }
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v2);
    _os_log_impl(&dword_224ECB000, oslog, OS_LOG_TYPE_DEFAULT, "SUSUIAuthenticationAlertAction got response:%@", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (SUSUIAuthenticationAlertAction)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = 0;
  objc_storeStrong(&v26, a6);
  v30->_alertType = 1;
  id v25 = (id)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  if (location[0]) {
    [v25 encodeObject:location[0] forKey:@"_susRollbackDescriptor"];
  }
  [v25 encodeBool:v28 forKey:@"_susCanDeferInstallation"];
  [v25 encodeInteger:v30->_alertType forKey:@"_susAlertType"];
  id v24 = (id)[v25 encodedData];
  id v23 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v23 setObject:v24 forSetting:SUSUIAuthenticationAlertActionInput];
  [v23 setObject:@"SUSUIAuthenticationAlertAction" forSetting:SUSUIAuthenticationAlertActionInputType];
  v9 = v30;
  id v10 = v23;
  char v21 = 0;
  if (v27)
  {
    id v8 = v27;
  }
  else
  {
    id v22 = MEMORY[0x263EF83A0];
    char v21 = 1;
    id v8 = v22;
  }
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  objc_super v18 = __114__SUSUIAuthenticationAlertAction_initWithRollbackDescriptor_canDeferInstallation_completionQueue_completionBlock___block_invoke;
  uint64_t v19 = &unk_26470ABC0;
  id v20 = v26;
  id v30 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)SUSUIAuthenticationAlertAction;
  id v30 = [(SUSUIAuthenticationAlertAction *)&v14 initWithInfo:v10 timeout:v8 forResponseOnQueue:&v15 withHandler:0.0];
  objc_storeStrong((id *)&v30, v30);
  if (v21) {

  }
  objc_storeStrong((id *)&v30->_baseAction, 0);
  v30->_loaded = 1;
  char v7 = v30;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v30, 0);
  return v7;
}

void __114__SUSUIAuthenticationAlertAction_initWithRollbackDescriptor_canDeferInstallation_completionQueue_completionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = a1;
  id v4 = (id)[location[0] info];
  [v4 flagForSetting:SUSUIAuthenticationAlertActionOutputSuccess];
  char IsYes = BSSettingFlagIsYes();

  char v7 = IsYes & 1;
  os_log_t oslog = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      v2 = @"YES";
    }
    else {
      v2 = @"NO";
    }
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v2);
    _os_log_impl(&dword_224ECB000, oslog, OS_LOG_TYPE_DEFAULT, "SUSUIAuthenticationAlertAction got response:%@", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (SUSUIAuthenticationAlertAction)initWithInfo:(id)a3 forBaseAction:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = (id)[location[0] objectForSetting:SUSUIAuthenticationAlertActionInputType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v9 isEqualToString:@"SUSUIAuthenticationAlertAction"] & 1) != 0)
  {
    id v4 = v12;
    id v12 = 0;
    v7.receiver = v4;
    v7.super_class = (Class)SUSUIAuthenticationAlertAction;
    id v12 = [(SUSUIAuthenticationAlertAction *)&v7 initWithInfo:location[0] responder:0];
    objc_storeStrong(&v12, v12);
    if (v12)
    {
      [v12 setBaseAction:v10];
      *((unsigned char *)v12 + 32) = 0;
    }
    v13 = (SUSUIAuthenticationAlertAction *)v12;
    int v8 = 1;
  }
  else
  {
    v13 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

- (SUDescriptor)descriptor
{
  [(SUSUIAuthenticationAlertAction *)self _loadIfNecessary];
  descriptor = self->_descriptor;

  return descriptor;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  [(SUSUIAuthenticationAlertAction *)self _loadIfNecessary];
  rollbackDescriptor = self->_rollbackDescriptor;

  return rollbackDescriptor;
}

- (SUAutoInstallForecast)autoInstallForecast
{
  [(SUSUIAuthenticationAlertAction *)self _loadIfNecessary];
  autoInstallForecast = self->_autoInstallForecast;

  return autoInstallForecast;
}

- (BOOL)forInstallTonight
{
  return self->_forInstallTonight;
}

- (BOOL)canDeferInstallation
{
  return self->_canDeferInstallation;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)fireCompletionIfNecessaryForResult:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id location = self;
  if (v9->_baseAction) {
    objc_storeStrong(&location, v9->_baseAction);
  }
  if ([location canSendResponse])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
    [v5 setFlag:BSSettingFlagForBool() forSetting:SUSUIAuthenticationAlertActionOutputSuccess];
    id v3 = location;
    id v4 = (id)[MEMORY[0x263F29BC0] responseWithInfo:v5];
    objc_msgSend(v3, "sendResponse:");

    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_loadIfNecessary
{
  uint64_t v15 = self;
  v14[1] = (id)a2;
  if (!self->_loaded)
  {
    id v12 = (id)[(SUSUIAuthenticationAlertAction *)v15 info];
    v14[0] = (id)[v12 objectForSetting:SUSUIAuthenticationAlertActionInput];

    id v2 = objc_alloc(MEMORY[0x263F08928]);
    id v13 = (id)objc_msgSend(v2, "initForReadingFromData:error:", v14[0]);
    id v3 = (SUDescriptor *)(id)[v13 decodeObjectOfClass:objc_opt_class() forKey:@"_susDescriptor"];
    descriptor = v15->_descriptor;
    v15->_descriptor = v3;

    id v5 = (SURollbackDescriptor *)(id)[v13 decodeObjectOfClass:objc_opt_class() forKey:@"_susRollbackDescriptor"];
    rollbackDescriptor = v15->_rollbackDescriptor;
    v15->_rollbackDescriptor = v5;

    BOOL v7 = (SUAutoInstallForecast *)(id)[v13 decodeObjectOfClass:objc_opt_class() forKey:@"_susAutoInstallForecast"];
    autoInstallForecast = v15->_autoInstallForecast;
    v15->_autoInstallForecast = v7;

    char v9 = [v13 decodeBoolForKey:@"_susForInstallTonight"];
    v15->_forInstallTonight = v9 & 1;
    char v10 = [v13 decodeBoolForKey:@"_susCanDeferInstallation"];
    v15->_canDeferInstallation = v10 & 1;
    uint64_t v11 = [v13 decodeIntegerForKey:@"_susAlertType"];
    v15->_alertType = v11;
    [v13 finishDecoding];
    v15->_loaded = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
  }
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (BSAction)baseAction
{
  return self->_baseAction;
}

- (void)setBaseAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end