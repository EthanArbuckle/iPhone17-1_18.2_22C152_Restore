@interface SidecarServiceViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)active;
- (BOOL)allowsDisplaySleep;
- (BOOL)backgrounded;
- (BOOL)waitForReconnect;
- (BOOL)waitForServiceReady;
- (BOOL)wantsVolumeButtonEvents;
- (FBSSceneIdentityToken)sceneIdentityToken;
- (NSString)sceneIdentifier;
- (SidecarRequest)request;
- (SidecarServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)backgroundStyle;
- (int64_t)requestCompleted;
- (void)_notifyServiceAndTerminate:(int64_t)a3;
- (void)completeRequest:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestDidFinish:(id)a3;
- (void)serviceReady;
- (void)setActive:(BOOL)a3;
- (void)setAllowsDisplaySleep:(BOOL)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSceneIdentityToken:(id)a3;
- (void)setWantsVolumeButtonEvents:(BOOL)a3;
- (void)sidecarRequest:(id)a3 receivedItems:(id)a4;
- (void)sidecarServiceCancel;
- (void)sidecarServiceProviderHandleRequest:(id)a3;
- (void)sidecarServiceProviderTerminate;
- (void)sidecarServiceSetSceneIdentifier:(id)a3;
- (void)sidecarServiceSetSceneIdentityToken:(id)a3;
- (void)sidecarServiceShouldPresentWithCompletion:(id)a3;
- (void)sidecarServiceUpdateSupportedOrientations;
- (void)viewDidLoad;
@end

@implementation SidecarServiceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)waitForReconnect
{
  return self->_waitForReconnect;
}

- (BOOL)wantsVolumeButtonEvents
{
  return self->_wantsVolumeButtonEvents;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentityToken:(id)a3
{
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (BOOL)backgrounded
{
  return self->_backgrounded;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)allowsDisplaySleep
{
  return self->_allowsDisplaySleep;
}

- (void)sidecarServiceSetSceneIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (NSString *)a3;
  sceneIdentifier = self->_sceneIdentifier;
  if (sceneIdentifier != v4
    && (!sceneIdentifier || ![(NSString *)sceneIdentifier isEqualToString:v4]))
  {
    v6 = SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEFAULT);
    v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_22C7FB000, v7, OS_LOG_TYPE_DEFAULT, "Setting scene ID to [%@]", (uint8_t *)&v10, 0xCu);
    }
    v8 = (NSString *)[(NSString *)v4 copy];
    v9 = self->_sceneIdentifier;
    self->_sceneIdentifier = v8;
  }
}

- (void)sidecarServiceSetSceneIdentityToken:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (FBSSceneIdentityToken *)a3;
  sceneIdentityToken = self->_sceneIdentityToken;
  if (sceneIdentityToken != v4
    && (!sceneIdentityToken || ([(FBSSceneIdentityToken *)sceneIdentityToken isEqual:v4] & 1) == 0))
  {
    v6 = SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEFAULT);
    v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_22C7FB000, v7, OS_LOG_TYPE_DEFAULT, "Setting scene identity token to [%@]", (uint8_t *)&v10, 0xCu);
    }
    v8 = (FBSSceneIdentityToken *)[(FBSSceneIdentityToken *)v4 copy];
    v9 = self->_sceneIdentityToken;
    self->_sceneIdentityToken = v8;
  }
}

- (void)sidecarServiceCancel
{
}

- (void)sidecarServiceShouldPresentWithCompletion:(id)a3
{
}

- (void)setAllowsDisplaySleep:(BOOL)a3
{
  if (self->_allowsDisplaySleep != a3)
  {
    BOOL v3 = a3;
    self->_allowsDisplaySleep = a3;
    id v4 = [(SidecarServiceViewController *)self hostProxy];
    [v4 sidecarServiceDisableDisplaySleep:!v3];
  }
}

- (void)sidecarServiceUpdateSupportedOrientations
{
  BOOL v3 = [(SidecarServiceViewController *)self hostProxy];

  if (v3)
  {
    [(SidecarServiceViewController *)self _supportedInterfaceOrientationsDidChange];
    id v4 = [(SidecarServiceViewController *)self hostProxy];
    [v4 sidecarServiceOrientationChanged];
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    v5 = [(SidecarServiceViewController *)self hostProxy];
    [v5 sidecarServiceViewControllerBackgroundStyle:a3];

    self->_backgroundStyle = a3;
  }
}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  if (self->_wantsVolumeButtonEvents != a3)
  {
    BOOL v3 = a3;
    v5 = [(SidecarServiceViewController *)self hostProxy];
    [v5 sidecarServiceViewControllerWantsVolumeButtonEvents:v3];

    self->_wantsVolumeButtonEvents = v3;
  }
}

- (void)_notifyServiceAndTerminate:(int64_t)a3
{
  if (!self->_terminationRequested)
  {
    self->_terminationRequested = 1;
    SidecarOptOutOfReconnect();
  }
}

void __59__SidecarServiceViewController__notifyServiceAndTerminate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hostProxy];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) hostProxy];
    [v4 sidecarServiceViewControllerAnimate:*(void *)(a1 + 40) completion:&__block_literal_global];
  }
  else
  {
    BOOL v3 = (void *)*MEMORY[0x263F1D020];
    [v3 terminateWithSuccess];
  }
}

uint64_t __59__SidecarServiceViewController__notifyServiceAndTerminate___block_invoke_2()
{
  return [(id)*MEMORY[0x263F1D020] terminateWithSuccess];
}

- (int64_t)requestCompleted
{
  return 1;
}

- (void)completeRequest:(int64_t)a3
{
  id v5 = [(SidecarServiceViewController *)self request];
  if (v5 && ([v5 isFinished] & 1) == 0)
  {
    [v5 removeObserver:self forKeyPath:@"finished"];
    [v5 cancel];
  }
  [(SidecarServiceViewController *)self _notifyServiceAndTerminate:a3];
}

- (void)requestDidFinish:(id)a3
{
  int64_t v4 = [(SidecarServiceViewController *)self requestCompleted];

  [(SidecarServiceViewController *)self completeRequest:v4];
}

- (void)serviceReady
{
  if (!self->_calledServiceReady)
  {
    self->_calledServiceReady = 1;
    id v3 = [(SidecarServiceViewController *)self extensionContext];
    v2 = [v3 _UUID];
    SidecarServiceProviderReady();
  }
}

- (void)sidecarRequest:(id)a3 receivedItems:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SidecarServiceViewController_sidecarRequest_receivedItems___block_invoke;
  v7[3] = &unk_26491E0A8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __61__SidecarServiceViewController_sidecarRequest_receivedItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) receivedItems:*(void *)(a1 + 40)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"finished"])
  {
    id v13 = v11;
    if ([v13 isFinished])
    {
      v14 = SidecarPresenterLogSubsystem(OS_LOG_TYPE_DEBUG);
      v15 = v14;
      if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v13;
        _os_log_impl(&dword_22C7FB000, v15, OS_LOG_TYPE_DEBUG, "=== Request Finished === %{public}@", buf, 0xCu);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__SidecarServiceViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_26491E0A8;
      block[4] = self;
      block[5] = v13;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SidecarServiceViewController;
    [(SidecarServiceViewController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __79__SidecarServiceViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestDidFinish:*(void *)(a1 + 40)];
}

- (void)sidecarServiceProviderTerminate
{
}

- (void)sidecarServiceProviderHandleRequest:(id)a3
{
  id v4 = a3;
  [(SidecarServiceViewController *)self setRequest:v4];
  [(SidecarServiceViewController *)self requestDidStart:v4];
}

- (void)setRequest:(id)a3
{
  id v4 = (SidecarRequest *)a3;
  [(SidecarRequest *)self->_request removeObserver:self forKeyPath:@"finished"];
  id v5 = [(SidecarRequest *)self->_request session];
  [v5 setDelegate:0];

  request = self->_request;
  self->_request = v4;
  v7 = v4;

  [(SidecarRequest *)v7 addObserver:self forKeyPath:@"finished" options:0 context:0];
}

- (SidecarRequest)request
{
  return self->_request;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SidecarServiceViewController;
  [(SidecarServiceViewController *)&v3 viewDidLoad];
  if (![(SidecarServiceViewController *)self waitForServiceReady]) {
    [(SidecarServiceViewController *)self serviceReady];
  }
}

- (BOOL)waitForServiceReady
{
  return 0;
}

- (SidecarServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)SidecarServiceViewController;
  id v4 = [(SidecarServiceViewController *)&v10 initWithNibName:a3 bundle:a4];
  id v5 = SidecarPresenterLogSubsystem(OS_LOG_TYPE_INFO);
  id v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = [MEMORY[0x263F086E0] mainBundle];
    id v8 = [v7 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    _os_log_impl(&dword_22C7FB000, v6, OS_LOG_TYPE_INFO, "=== Registering Service Provider (%{public}@) ===", buf, 0xCu);
  }
  SidecarRegisterServiceProvider();
  v4->_allowsDisplaySleep = 1;

  return v4;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DFEB5F0];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DFEEA70];
}

@end