@interface SBUIPopoverExtensionRemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (SBUIPopoverExtension)extensionViewController;
- (SBUIPopoverExtensionRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SBUIPopoverExtensionHostInterface)hostService;
- (id)popoverExtensionContext;
- (void)_invalidateSBUIPopoverExtension;
- (void)_setupChildViewController:(id)a3;
- (void)_updateForBundleIdentifier:(id)a3;
- (void)_updateForWidgetConfiguration:(id)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)addChildViewController:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)dealloc;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setExtensionViewController:(id)a3;
- (void)setHostService:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBUIPopoverExtensionRemoteViewController

- (SBUIPopoverExtensionRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  v4 = [(SBUIPopoverExtensionRemoteViewController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    unsigned int add = atomic_fetch_add(__activeInstanceCount, 1u);
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    instanceIdentifier = v4->_instanceIdentifier;
    v4->_instanceIdentifier = (NSUUID *)v6;

    v8 = SBLogUIRemoteVC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v4->_instanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = (int)(add + 1);
      _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "%@!!> init; instance count %lu", buf, 0x16u);
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned int add = atomic_fetch_add(__activeInstanceCount, 0xFFFFFFFF);
  v4 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v8 = instanceIdentifier;
    __int16 v9 = 2048;
    uint64_t v10 = (int)(add - 1);
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "%@!!!> dealloc; instance count %lu", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  [(SBUIPopoverExtensionRemoteViewController *)&v6 dealloc];
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD19C58];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD20748];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel__updateForWidgetConfiguration_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateForBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    int v8 = 138412546;
    __int16 v9 = instanceIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> _updateForBundleIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = [(SBUIPopoverExtensionRemoteViewController *)self extensionViewController];
  [v7 updateForBundleIdentifier:v4];
}

- (void)_updateForWidgetConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    instanceIdentifier = self->_instanceIdentifier;
    int v8 = 138412546;
    __int16 v9 = instanceIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "%@> _updateForWidgetConfiguration: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = [(SBUIPopoverExtensionRemoteViewController *)self extensionViewController];
  [v7 updateForWidgetConfiguration:v4];
}

- (void)_invalidateSBUIPopoverExtension
{
  v3 = [(SBUIPopoverExtensionRemoteViewController *)self popoverExtensionContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SBUIPopoverExtensionRemoteViewController__invalidateSBUIPopoverExtension__block_invoke;
  v4[3] = &unk_1E5CCC6E8;
  v4[4] = self;
  [v3 completeRequestReturningItems:MEMORY[0x1E4F1CBF0] completionHandler:v4];
}

void __75__SBUIPopoverExtensionRemoteViewController__invalidateSBUIPopoverExtension__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 976);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "%@> Terminated Extension; expired? %{BOOL}d",
      (uint8_t *)&v6,
      0x12u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    int v9 = instanceIdentifier;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewWillAppear:%{BOOL}d", buf, 0x12u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    int v9 = instanceIdentifier;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewDidAppear:%{BOOL}d", buf, 0x12u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    int v9 = instanceIdentifier;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewWillDisappear:%{BOOL}d", buf, 0x12u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    int v9 = instanceIdentifier;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewDidDisappear:%{BOOL}d", buf, 0x12u);
  }
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    int v9 = 138412546;
    __int16 v10 = instanceIdentifier;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> _willAppearInRemoteViewController:%@", (uint8_t *)&v9, 0x16u);
  }

  [(SBUIPopoverExtensionRemoteViewController *)self setHostService:v4];
  objc_super v7 = [(SBUIPopoverExtensionRemoteViewController *)self popoverExtensionContext];
  __int16 v8 = [(SBUIPopoverExtensionRemoteViewController *)self hostService];
  [v7 setHostService:v8];
}

- (void)addChildViewController:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  [(SBUIPopoverExtensionRemoteViewController *)&v6 addChildViewController:v4];
  if ([v4 conformsToProtocol:&unk_1EFD5AFC0])
  {
    [(SBUIPopoverExtensionRemoteViewController *)self _setupChildViewController:v4];
  }
  else
  {
    uint64_t v5 = SBLogUIRemoteVC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBUIPopoverExtensionRemoteViewController addChildViewController:]((uint64_t)self, v5);
    }
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  [(SBUIPopoverExtensionRemoteViewController *)&v8 preferredContentSizeDidChangeForChildContentContainer:v4];
  [v4 preferredContentSize];
  -[SBUIPopoverExtensionRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    [v4 preferredContentSize];
    objc_super v7 = NSStringFromCGSize(v14);
    *(_DWORD *)buf = 138412546;
    __int16 v10 = instanceIdentifier;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> preferredContentSizeDidChangeForChildContentContainer; preferredContentSize: %{public}@",
      buf,
      0x16u);
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  [(SBUIPopoverExtensionRemoteViewController *)&v8 beginRequestWithExtensionContext:v4];
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    __int16 v10 = instanceIdentifier;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> beginRequestWithExtensionContext: %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v7 = SBLogUIRemoteVC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SBUIPopoverExtensionRemoteViewController *)(uint64_t)self beginRequestWithExtensionContext:v7];
    }
  }
}

- (id)popoverExtensionContext
{
  BOOL v3 = [(SBUIPopoverExtensionRemoteViewController *)self extensionContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(SBUIPopoverExtensionRemoteViewController *)self extensionContext];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)_setupChildViewController:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogUIRemoteVC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    int v9 = 138412546;
    __int16 v10 = instanceIdentifier;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "%@> _setupChildViewController:%@", (uint8_t *)&v9, 0x16u);
  }

  [(SBUIPopoverExtensionRemoteViewController *)self setExtensionViewController:v4];
  objc_super v7 = [(SBUIPopoverExtensionRemoteViewController *)self view];
  objc_super v8 = [v4 view];
  [v8 setAutoresizingMask:18];
  [v7 bounds];
  objc_msgSend(v8, "setFrame:");
  [v7 addSubview:v8];
}

- (_SBUIPopoverExtensionHostInterface)hostService
{
  return self->_hostService;
}

- (void)setHostService:(id)a3
{
}

- (SBUIPopoverExtension)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_hostService, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
}

- (void)addChildViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 976);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7607000, a2, OS_LOG_TYPE_ERROR, "%@> Tried to add a view controller that does not conform to SBUIPopverExtension.", (uint8_t *)&v3, 0xCu);
}

- (void)beginRequestWithExtensionContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 976);
  uint64_t v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_error_impl(&dword_1A7607000, a3, OS_LOG_TYPE_ERROR, "%@> Unexpected extension context class %@", (uint8_t *)&v7, 0x16u);
}

@end