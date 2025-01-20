@interface SSKSceneHostingDisplayController
- (SSKSceneHostingDisplayController)initWithProfileConfiguration:(id)a3 displayIdentity:(id)a4;
- (SSKSceneHostingDisplayControllerDelegate)delegate;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7;
- (void)displayAssertionDidGainControlOfDisplay:(id)a3;
- (void)displayAssertionDidLoseControlOfDisplay:(id)a3;
- (void)displayIdentityDidDisconnect:(id)a3;
- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SSKSceneHostingDisplayController

- (SSKSceneHostingDisplayController)initWithProfileConfiguration:(id)a3 displayIdentity:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SSKSceneHostingDisplayController.m", 53, @"Invalid parameter not satisfying: %@", @"profileConfiguration" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SSKSceneHostingDisplayController;
  v10 = [(SSKSceneHostingDisplayController *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_profileConfiguration, a3);
    adapter = v11->_adapter;
    v11->_adapter = 0;

    updateTransformsAdapter = v11->_updateTransformsAdapter;
    v11->_updateTransformsAdapter = 0;
  }
  return v11;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  v11 = (void *)MEMORY[0x263F08B88];
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  if (([v11 isMainThread] & 1) == 0)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSString stringWithUTF8String:"-[SSKSceneHostingDisplayController connectToDisplayIdentity:configuration:displayTransformUpdater:caDisplayQueue:assertion:]"];
    [v21 handleFailureInFunction:v22 file:@"SSKSceneHostingDisplayController.m" lineNumber:69 description:@"this call must be made on the main thread"];
  }
  objc_super v16 = [[SSKUpdateDisplayTransformsAdapter alloc] initWithDisplayConfiguration:v14 displayTransformUpdater:v13];

  updateTransformsAdapter = self->_updateTransformsAdapter;
  self->_updateTransformsAdapter = v16;

  v18 = [[SSKSceneHostingDisplayControllerAdapter alloc] initWithConfiguration:self->_profileConfiguration displayIdentity:v15 displayConfiguration:v14 updateTransformsAdapter:self->_updateTransformsAdapter];
  adapter = self->_adapter;
  self->_adapter = v18;

  v23 = objc_alloc_init(SSKDisplayAssertionPreferences);
  [(SSKDisplayAssertionPreferences *)v23 setWantsControlOfDisplay:1];
  if ([(SSKDisplayProfileConfiguration *)self->_profileConfiguration supportsCloning]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 2;
  }
  [(SSKDisplayAssertionPreferences *)v23 setCloneMirroringMode:v20];
  [v12 updateWithPreferences:v23];
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  id v10 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[SSKSceneHostingDisplayController displayIdentityDidUpdate:configuration:]"];
    [v7 handleFailureInFunction:v8 file:@"SSKSceneHostingDisplayController.m" lineNumber:87 description:@"this call must be made on the main thread"];
  }
  id v6 = v10;
  if (!v10)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKSceneHostingDisplayController.m", 88, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

    id v6 = 0;
  }
  [(SSKUpdateDisplayTransformsAdapter *)self->_updateTransformsAdapter displayUpdated:v6];
}

- (void)displayIdentityDidDisconnect:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[SSKSceneHostingDisplayController displayIdentityDidDisconnect:]"];
    [v4 handleFailureInFunction:v5 file:@"SSKSceneHostingDisplayController.m" lineNumber:93 description:@"this call must be made on the main thread"];
  }
  [(SSKSceneHostingDisplayControllerAdapter *)self->_adapter displayDisconnected:v6];
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SSKSceneHostingDisplayController displayAssertionDidGainControlOfDisplay:]"];
    [v5 handleFailureInFunction:v6 file:@"SSKSceneHostingDisplayController.m" lineNumber:100 description:@"this call must be made on the main thread"];
  }
  adapter = self->_adapter;
  [(SSKSceneHostingDisplayControllerAdapter *)adapter gainedControl];
}

- (void)displayAssertionDidLoseControlOfDisplay:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[SSKSceneHostingDisplayController displayAssertionDidLoseControlOfDisplay:]"];
    [v5 handleFailureInFunction:v6 file:@"SSKSceneHostingDisplayController.m" lineNumber:105 description:@"this call must be made on the main thread"];
  }
  adapter = self->_adapter;
  [(SSKSceneHostingDisplayControllerAdapter *)adapter lostControl];
}

- (SSKSceneHostingDisplayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKSceneHostingDisplayControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateTransformsAdapter, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_profileConfiguration, 0);
}

@end