@interface WLDaemonController
+ (id)sharedInstance;
- (WLDaemonConnection)connection;
- (WLDaemonController)init;
- (void)getLocalImportOptionsWithCompletion:(id)a3;
- (void)importLocalContent;
- (void)setConnection:(id)a3;
- (void)setStashDataLocally:(BOOL)a3;
@end

@implementation WLDaemonController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __36__WLDaemonController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(WLDaemonController);

  return MEMORY[0x270F9A758]();
}

- (WLDaemonController)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLDaemonController;
  v2 = [(WLDaemonController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(WLDaemonConnection);
    [(WLDaemonController *)v2 setConnection:v3];
  }
  return v2;
}

- (void)getLocalImportOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WLDaemonController *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke;
  v11[3] = &unk_264C65EC0;
  v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 daemonWithErrorHandler:v11];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke_2;
  v9[3] = &unk_264C65EE8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getLocalImportOptions:v9];
}

void __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x263EF8340];
  _WLLog(v8, 0, @"%@: XPC error attempting to get local import options - %@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  uint64_t v10 = *(void *)(a1 + 40);
  v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  v15[0] = @"Daemon interrupted";
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v13 = [v11 errorWithDomain:@"com.apple.welcomekit" code:1 userInfo:v12];
  (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v13);
}

uint64_t __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v13 = a4;
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v13) {
    _WLLog(v4, 0, @"%@: Error from daemon get local import options - %@", v7, v8, v9, v10, v11, *(void *)(a1 + 32));
  }

  return MEMORY[0x270F9A758](v6);
}

- (void)importLocalContent
{
  v3 = [(WLDaemonController *)self connection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__WLDaemonController_importLocalContent__block_invoke;
  v5[3] = &unk_264C65E50;
  v5[4] = self;
  uint64_t v4 = [v3 daemonWithErrorHandler:v5];

  [v4 importLocalContent];
}

void __40__WLDaemonController_importLocalContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WLLog(v8, 0, @"%@: XPC error attempting local import - %@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
}

- (void)setStashDataLocally:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(WLDaemonController *)self connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__WLDaemonController_setStashDataLocally___block_invoke;
  v7[3] = &unk_264C65E50;
  v7[4] = self;
  uint64_t v6 = [v5 daemonWithErrorHandler:v7];

  [v6 setStashDataLocally:v3];
}

void __42__WLDaemonController_setStashDataLocally___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WLLog(v8, 0, @"%@: XPC error attempting set stash data locally - %@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
}

- (WLDaemonConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end