@interface SRRemoteAuthorizationPromptViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
+ (void)initialize;
+ (void)requestViewControllerWithCompletionHandler:(id)a3;
- (NSCopying)request;
- (NSExtension)weakExtension;
- (SRRemoteAuthorizationPromptViewControllerDelegate)delegate;
- (id)serviceViewControllerProxy;
- (void)authorizationRequestCompleted;
- (void)authorizationRequestDidDisappear;
- (void)authorizationRequestFailedWithError:(id)a3;
- (void)authorizationRequestWillDisappear;
- (void)authorizationUIReadyForDisplayModally:(BOOL)a3;
- (void)dealloc;
- (void)deleteAllSamples;
- (void)requestAuthorizationForBundle:(id)a3 services:(id)a4;
- (void)requestAuthorizationMigrationForBundle:(id)a3 services:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRequest:(id)a3;
- (void)setWeakExtension:(id)a3;
- (void)showAppsAndStudies;
- (void)showFirstRunOnboarding;
- (void)showResearchData;
- (void)showStudyAuthorizationForBundlePath:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SRRemoteAuthorizationPromptViewController

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRRemoteAuthorizationPromptViewController;
  [(_UIRemoteViewController *)&v4 viewWillDisappear:a3];
  [(SRRemoteAuthorizationPromptViewController *)self authorizationRequestWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRRemoteAuthorizationPromptViewController;
  [(_UIRemoteViewController *)&v4 viewDidDisappear:a3];
  [(SRRemoteAuthorizationPromptViewController *)self authorizationRequestDidDisappear];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogAuthorizationPromptViewController = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationPromptViewController");
  }
}

+ (void)requestViewControllerWithCompletionHandler:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  v11 = 0;
  objc_super v4 = (void *)[MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.SensorKit.SensorKitViewService" error:&v11];
  v5 = v11;
  if (v11)
  {
    v6 = SRLogAuthorizationPromptViewController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_error_impl(&dword_230B11000, v6, OS_LOG_TYPE_ERROR, "Error getting extension %@", (uint8_t *)location, 0xCu);
    }
  }
  else
  {
    v7 = v4;
    if (v4)
    {
      objc_initWeak(location, v4);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __88__SRRemoteAuthorizationPromptViewController_requestViewControllerWithCompletionHandler___block_invoke;
      v9[3] = &unk_264BA2F38;
      v9[4] = a3;
      objc_copyWeak(&v10, location);
      [v7 instantiateViewControllerWithInputItems:0 connectionHandler:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(location);
      return;
    }
    v8 = SRLogAuthorizationPromptViewController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_230B11000, v8, OS_LOG_TYPE_ERROR, "Got nil extension when requesting prompt extension", (uint8_t *)location, 2u);
    }
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
}

uint64_t __88__SRRemoteAuthorizationPromptViewController_requestViewControllerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a3 || a4)
  {
    uint64_t v10 = SRLogAuthorizationPromptViewController;
    if (!os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_ERROR)) {
      return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
    }
    int v14 = 138543362;
    v15 = a4;
    v11 = "Got nil extension when requesting prompt extension, error %{public}@";
    v12 = v10;
LABEL_12:
    _os_log_error_impl(&dword_230B11000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0xCu);
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = SRLogAuthorizationPromptViewController;
    if (!os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_ERROR)) {
      return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
    }
    int v14 = 138543362;
    v15 = a3;
    v11 = "Got view controller of wrong class: %{public}@";
    v12 = v13;
    goto LABEL_12;
  }
  [a3 setWeakExtension:objc_loadWeak((id *)(a1 + 40))];
  [a3 setRequest:a2];
  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v8();
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E566888];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E55E750];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F1D8B8]]) {
    BOOL v6 = [a3 code] == 1;
  }
  else {
    BOOL v6 = 0;
  }
  v7 = [(SRRemoteAuthorizationPromptViewController *)self delegate];
  v8 = SRLogAuthorizationPromptViewController;
  if (!a3 || v6)
  {
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_230B11000, v8, OS_LOG_TYPE_DEFAULT, "Prompt exited", (uint8_t *)&v9, 2u);
    }
    [(SRRemoteAuthorizationPromptViewControllerDelegate *)v7 authorizationRequestCompleted];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = a3;
      _os_log_error_impl(&dword_230B11000, v8, OS_LOG_TYPE_ERROR, "Prompt exited, %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(SRRemoteAuthorizationPromptViewControllerDelegate *)v7 authorizationRequestFailedWithError:a3];
  }
}

- (void)authorizationRequestCompleted
{
  v3 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Prompt completed", v4, 2u);
  }
  [(SRRemoteAuthorizationPromptViewControllerDelegate *)[(SRRemoteAuthorizationPromptViewController *)self delegate] authorizationRequestCompleted];
}

- (void)authorizationRequestFailedWithError:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEFAULT, "Prompt failed, %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(SRRemoteAuthorizationPromptViewControllerDelegate *)[(SRRemoteAuthorizationPromptViewController *)self delegate] authorizationRequestFailedWithError:a3];
}

- (void)authorizationUIReadyForDisplayModally:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEFAULT, "Prompt UI ready", v6, 2u);
  }
  [(SRRemoteAuthorizationPromptViewControllerDelegate *)[(SRRemoteAuthorizationPromptViewController *)self delegate] authorizationUIReadyForDisplayModally:v3];
}

- (void)authorizationRequestWillDisappear
{
  v2 = [(SRRemoteAuthorizationPromptViewController *)self delegate];
  [(SRRemoteAuthorizationPromptViewControllerDelegate *)v2 authorizationRequestWillDisappear];
}

- (void)authorizationRequestDidDisappear
{
  v2 = [(SRRemoteAuthorizationPromptViewController *)self delegate];
  [(SRRemoteAuthorizationPromptViewControllerDelegate *)v2 authorizationRequestDidDisappear];
}

- (id)serviceViewControllerProxy
{
  v3.receiver = self;
  v3.super_class = (Class)SRRemoteAuthorizationPromptViewController;
  return [(_UIRemoteViewController *)&v3 serviceViewControllerProxy];
}

- (void)requestAuthorizationForBundle:(id)a3 services:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = a4;
    _os_log_impl(&dword_230B11000, v7, OS_LOG_TYPE_DEFAULT, "Requesting authorization for services %{public}@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "requestAuthorizationForBundle:services:", a3, a4);
}

- (void)requestAuthorizationMigrationForBundle:(id)a3 services:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = a4;
    _os_log_impl(&dword_230B11000, v7, OS_LOG_TYPE_DEFAULT, "Requesting authorization migration for services %{public}@", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "requestAuthorizationMigrationForBundle:services:", a3, a4);
}

- (void)showAppsAndStudies
{
  objc_super v3 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Trying to display apps and studies view", v4, 2u);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "showAppsAndStudies");
}

- (void)showStudyAuthorizationForBundlePath:(id)a3
{
  v5 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEFAULT, "Trying to display study's authorization", v6, 2u);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "showStudyAuthorizationForBundlePath:", a3);
}

- (void)showResearchData
{
  objc_super v3 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Trying to display research data view", v4, 2u);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "showResearchData");
}

- (void)showFirstRunOnboarding
{
  objc_super v3 = SRLogAuthorizationPromptViewController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Trying to display first run onboarding", v4, 2u);
  }
  objc_msgSend(-[SRRemoteAuthorizationPromptViewController serviceViewControllerProxy](self, "serviceViewControllerProxy"), "showFirstRunOnboarding");
}

- (void)deleteAllSamples
{
  id v2 = [(SRRemoteAuthorizationPromptViewController *)self serviceViewControllerProxy];
  [v2 deleteAllSamples];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [(SRRemoteAuthorizationPromptViewController *)self weakExtension];
  if (v3)
  {
    objc_super v4 = v3;
    if ([(SRRemoteAuthorizationPromptViewController *)self request])
    {
      v5 = SRLogAuthorizationPromptViewController;
      if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptViewController, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        int v8 = v4;
        __int16 v9 = 2112;
        uint64_t v10 = [(SRRemoteAuthorizationPromptViewController *)self request];
        _os_log_debug_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEBUG, "Cancel extension %@ for request %@", buf, 0x16u);
      }
      [(NSExtension *)v4 cancelExtensionRequestWithIdentifier:[(SRRemoteAuthorizationPromptViewController *)self request]];
    }
  }
  [(SRRemoteAuthorizationPromptViewController *)self setRequest:0];
  v6.receiver = self;
  v6.super_class = (Class)SRRemoteAuthorizationPromptViewController;
  [(_UIRemoteViewController *)&v6 dealloc];
}

- (SRRemoteAuthorizationPromptViewControllerDelegate)delegate
{
  return (SRRemoteAuthorizationPromptViewControllerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSCopying)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSExtension)weakExtension
{
  return (NSExtension *)objc_loadWeak((id *)&self->_weakExtension);
}

- (void)setWeakExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakExtension);
  objc_destroyWeak((id *)&self->_delegate);
}

@end