@interface NDOACController
+ (NDOACController)sharedController;
- (BOOL)isDefaultDevice;
- (NDOACController)initWithSerialNumber:(id)a3;
- (NDOSpecifierDataSource)ndoSpecifierDataSource;
- (NSArray)specifiers;
- (NSString)specifierIDToInsertAfter;
- (PSListController)parentViewController;
- (void)forceUpdateSpecifiersAndForceUpdateFollowup:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)setIsDefaultDevice:(BOOL)a3;
- (void)setNdoSpecifierDataSource:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSpecifierIDToInsertAfter:(id)a3;
- (void)updateSpecifiersWithCompletionHandler:(id)a3;
@end

@implementation NDOACController

+ (NDOACController)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedController_sharedController;
  return (NDOACController *)v2;
}

uint64_t __35__NDOACController_sharedController__block_invoke()
{
  sharedController_sharedController = [[NDOACController alloc] initWithSerialNumber:0];
  return MEMORY[0x270F9A758]();
}

- (NDOACController)initWithSerialNumber:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NDOACController;
  v5 = [(NDOACController *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(NDOACController *)v5 setSpecifierIDToInsertAfter:@"SerialNumber"];
    v7 = objc_opt_new();
    v8 = v7;
    if (v4)
    {
      v9 = [v7 defaultDevice];
      v10 = [v9 serialNumber];
      -[NDOACController setIsDefaultDevice:](v6, "setIsDefaultDevice:", [v10 isEqualToString:v4]);
    }
    else
    {
      [(NDOACController *)v6 setIsDefaultDevice:1];
    }
    v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [(NDOACController *)v6 isDefaultDevice];
      *(_DWORD *)buf = 136315650;
      v21 = "-[NDOACController initWithSerialNumber:]";
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 1024;
      BOOL v25 = v12;
      _os_log_impl(&dword_238845000, v11, OS_LOG_TYPE_DEFAULT, "%s: initWithSerialNumber: %@ %d", buf, 0x1Cu);
    }

    v13 = [[NDOSpecifierDataSource alloc] initWithDefaultDevice:[(NDOACController *)v6 isDefaultDevice]];
    [(NDOACController *)v6 setNdoSpecifierDataSource:v13];

    v14 = [(NDOACController *)v6 ndoSpecifierDataSource];
    [v14 setSerialNumber:v4];

    v15 = [(NDOACController *)v6 ndoSpecifierDataSource];
    [v15 setHostingController:v6];

    uint64_t v16 = [(NDOACController *)v6 isDefaultDevice];
    v17 = [(NDOACController *)v6 ndoSpecifierDataSource];
    [v17 setIsDefaultDevice:v16];
  }
  return v6;
}

- (NSArray)specifiers
{
  v3 = [(NDOACController *)self ndoSpecifierDataSource];
  [v3 loadSpecifiers];

  id v4 = [(NDOACController *)self ndoSpecifierDataSource];
  v5 = [v4 ndoSpecifiers];

  return (NSArray *)v5;
}

- (void)updateSpecifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NDOACController *)self ndoSpecifierDataSource];
  v6 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke;
  v9[3] = &unk_264D49770;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ndoManager];
  v3 = [v2 clientConfiguration];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264D499C0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__NDOACController_updateSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) generalAboutPolicy];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 updateNDOSpecifiersWithPolicy:v3 completion:v4];
}

- (void)forceUpdateSpecifiersAndForceUpdateFollowup:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(NDOACController *)self ndoSpecifierDataSource];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__NDOACController_forceUpdateSpecifiersAndForceUpdateFollowup_withCompletionHandler___block_invoke;
  v8[3] = &unk_264D49770;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 updateNDOSpecifiersWithPolicy:2 completion:v8];
}

void __85__NDOACController_forceUpdateSpecifiersAndForceUpdateFollowup_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ndoSpecifierDataSource];
  uint64_t v3 = [v2 ndoSpecifiers];
  id v6 = [v3 specifierForID:@"WARRANTY_OFFER"];

  if (v6)
  {
    uint64_t v4 = [v6 propertyForKey:@"NDODeviceInfo"];
    id v5 = [v4 warranty];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)specifierIDToInsertAfter
{
  return self->_specifierIDToInsertAfter;
}

- (void)setSpecifierIDToInsertAfter:(id)a3
{
}

- (PSListController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (PSListController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (NDOSpecifierDataSource)ndoSpecifierDataSource
{
  return self->_ndoSpecifierDataSource;
}

- (void)setNdoSpecifierDataSource:(id)a3
{
}

- (BOOL)isDefaultDevice
{
  return self->_isDefaultDevice;
}

- (void)setIsDefaultDevice:(BOOL)a3
{
  self->_isDefaultDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndoSpecifierDataSource, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_specifierIDToInsertAfter, 0);
}

@end