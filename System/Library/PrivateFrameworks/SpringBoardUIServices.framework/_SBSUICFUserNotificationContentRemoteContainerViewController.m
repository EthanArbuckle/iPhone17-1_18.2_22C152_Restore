@interface _SBSUICFUserNotificationContentRemoteContainerViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (SBSUIUserNotificationContentProviding)extensionViewController;
- (id)userNotificationContentExtensionContext;
- (void)_trackChildViewController:(id)a3;
- (void)_updatePreferredContentSize;
- (void)addChildViewController:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)configureWithCompletion:(id)a3;
- (void)invalidateWithCompletion:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setExtensionViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _SBSUICFUserNotificationContentRemoteContainerViewController

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD5B2C0];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD44A78];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionViewController];
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_SBSUICFUserNotificationContentRemoteContainerViewController.m" lineNumber:52 description:@"Extension view controller must exist to continue."];
  }
  v7 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Received configuration request.", buf, 0xCu);
  }

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __88___SBSUICFUserNotificationContentRemoteContainerViewController_configureWithCompletion___block_invoke;
  v14 = &unk_1E5CCC670;
  v15 = self;
  id v8 = v5;
  id v16 = v8;
  v9 = (void (**)(void))MEMORY[0x1AD0CF1C0](&v11);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v11, v12, v13, v14, v15);
  if (objc_opt_respondsToSelector()) {
    [v6 configureWithCompletion:v9];
  }
  else {
    v9[2](v9);
  }
}

- (void)invalidateWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(SBSUIUserNotificationContentProviding *)self->_extensionViewController _appearState] - 1;
  if (v5 <= 1) {
    [(SBSUIUserNotificationContentProviding *)self->_extensionViewController beginAppearanceTransition:0 animated:0];
  }
  v6 = [(SBSUIUserNotificationContentProviding *)self->_extensionViewController parentViewController];

  if (v6) {
    [(SBSUIUserNotificationContentProviding *)self->_extensionViewController removeFromParentViewController];
  }
  if (v5 <= 1) {
    [(SBSUIUserNotificationContentProviding *)self->_extensionViewController endAppearanceTransition];
  }
  v7 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = self;
    _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Received invalidate.", buf, 0xCu);
  }

  id v8 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionViewController];
  if (objc_opt_respondsToSelector()) {
    [v8 invalidate];
  }
  v9 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89___SBSUICFUserNotificationContentRemoteContainerViewController_invalidateWithCompletion___block_invoke;
  v11[3] = &unk_1E5CCC6C0;
  id v12 = v4;
  id v10 = v4;
  [v9 completeRequestReturningItems:0 completionHandler:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v5 viewWillAppear:a3];
  id v4 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "<%p> View will appear.", buf, 0xCu);
  }

  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self _updatePreferredContentSize];
}

- (void)viewDidLoad
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v8 viewDidLoad];
  id v4 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v10 = self;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "<%p> View will load.", buf, 0xCu);
  }

  if (!self->_extensionViewController)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_SBSUICFUserNotificationContentRemoteContainerViewController.m" lineNumber:114 description:@"We require an extension view controller at viewDidLoad."];
  }
  objc_super v5 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self view];
  v6 = [(SBSUIUserNotificationContentProviding *)self->_extensionViewController view];
  [v5 addSubview:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    objc_super v8 = self;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "<%p> View did disappear.", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v3 viewDidLayoutSubviews];
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self _updatePreferredContentSize];
}

- (void)addChildViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  id v4 = a3;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v5 addChildViewController:v4];
  -[_SBSUICFUserNotificationContentRemoteContainerViewController _trackChildViewController:](self, "_trackChildViewController:", v4, v5.receiver, v5.super_class);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 preferredContentSize];
    objc_super v6 = NSStringFromCGSize(v13);
    *(_DWORD *)buf = 134218242;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Child content's preferred content size did change to %{public}@", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v7 preferredContentSizeDidChangeForChildContentContainer:v4];
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self _updatePreferredContentSize];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)&v6 beginRequestWithExtensionContext:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_SBSUICFUserNotificationContentRemoteContainerViewController beginRequestWithExtensionContext:]((uint64_t)v4, v5);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)userNotificationContentExtensionContext
{
  objc_super v3 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionContext];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)_trackChildViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_extensionViewController)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_SBSUICFUserNotificationContentRemoteContainerViewController.m", 169, @"Cannot have an existing extension view controller for this extension.  Existing = %@, New: %@", self->_extensionViewController, v5 object file lineNumber description];
  }
  [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self setExtensionViewController:v5];
  objc_super v6 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self userNotificationContentExtensionContext];
  objc_super v7 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self _remoteViewControllerProxy];
  [v6 setHostService:v7];

  char v8 = [v5 conformsToProtocol:&unk_1EFD3EED8];
  char v9 = [v5 conformsToProtocol:&unk_1EFD3EE50];
  if ((v8 & 1) == 0 && (v9 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_SBSUICFUserNotificationContentRemoteContainerViewController.m", 176, @"CFUserNotification content extension view controller (%@) must extend and support the current interface protocol: <SBSUIUserNotificationContentProviding>.", v5 object file lineNumber description];
  }
  self->_BOOL isLegacyContentViewController = v8;
  __int16 v10 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isLegacyContentViewController = self->_isLegacyContentViewController;
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 134218754;
    if (isLegacyContentViewController) {
      CGSize v13 = @"YES";
    }
    else {
      CGSize v13 = @"NO";
    }
    v17 = self;
    __int16 v18 = 2114;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    v21 = extensionViewController;
    __int16 v22 = 2112;
    v23 = extensionViewController;
    _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Extension view controller initialized (legacy=%{public}@): %p - %@", buf, 0x2Au);
  }
}

- (void)_updatePreferredContentSize
{
  objc_super v3 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionViewController];
  [v3 preferredContentSize];
  double v5 = v4;
  double v7 = v6;

  -[_SBSUICFUserNotificationContentRemoteContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  id v9 = [(_SBSUICFUserNotificationContentRemoteContainerViewController *)self extensionViewController];
  char v8 = [v9 view];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v7);
}

- (SBSUIUserNotificationContentProviding)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "Unexpected extension context class %@", (uint8_t *)&v5, 0xCu);
}

@end