@interface REMReminderServiceViewController
- (NSError)deferredErrorDuringPresentation;
- (REMReminderCreationRemoteViewController)remoteViewController;
- (REMReminderCreationViewServiceViewController)viewServiceViewController;
- (_UIResilientRemoteViewContainerViewController)childViewController;
- (void)setChildViewController:(id)a3;
- (void)setDeferredErrorDuringPresentation:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation REMReminderServiceViewController

- (void)viewDidLoad
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21820B000, v0, OS_LOG_TYPE_DEBUG, "Loading extension %@", v1, 0xCu);
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F62ED8] ui];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_2();
  }

  if (v7)
  {
    v9 = [MEMORY[0x263F62ED8] ui];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_1(a1, (uint64_t)v7, v9);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDelayingDisplayOfRemoteController];
    [*(id *)(a1 + 32) setDeferredErrorDuringPresentation:v7];
  }
  else
  {
    [v6 setPublicViewController:*(void *)(a1 + 32)];
    v10 = [v6 serviceViewControllerProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__REMReminderServiceViewController_viewDidLoad__block_invoke_3;
    v11[3] = &unk_26430E9F0;
    long long v12 = *(_OWORD *)(a1 + 32);
    [(id)v12 remoteViewControllerDidLoad:v10 setupCompletion:v11];
  }
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, double a3, double a4)
{
  id v10 = a2;
  id v7 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v8 = [v7 _presentationSemanticContext];

  if (v8 != 3) {
    objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", a3, a4);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDelayingDisplayOfRemoteController];
  v9 = v10;
  if (v10)
  {
    [*(id *)(a1 + 32) setDeferredErrorDuringPresentation:v10];
    v9 = v10;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminderServiceViewController;
  [(REMReminderServiceViewController *)&v7 viewDidAppear:a3];
  v4 = [(REMReminderServiceViewController *)self deferredErrorDuringPresentation];

  if (v4)
  {
    v5 = [(REMReminderServiceViewController *)self deferredErrorDuringPresentation];
    [(REMReminderServiceViewController *)self setDeferredErrorDuringPresentation:0];
    id v6 = [MEMORY[0x263F62ED8] ui];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMReminderServiceViewController viewDidAppear:]();
    }

    [(REMReminderServiceViewController *)self viewServiceDidFailWithError:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMReminderServiceViewController;
  [(REMReminderServiceViewController *)&v6 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F62ED8] ui];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[REMReminderServiceViewController viewDidDisappear:](v4);
  }

  v5 = [(REMReminderServiceViewController *)self remoteViewController];
  [v5 viewHostDidDismiss];
}

- (void)setChildViewController:(id)a3
{
  v26[4] = *MEMORY[0x263EF8340];
  v4 = (_UIResilientRemoteViewContainerViewController *)a3;
  if (self->_childViewController)
  {
    v17 = [MEMORY[0x263F62ED8] ui];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[REMReminderServiceViewController setChildViewController:](v17);
    }
  }
  childViewController = self->_childViewController;
  self->_childViewController = v4;
  objc_super v6 = v4;

  objc_super v7 = [(REMReminderServiceViewController *)self view];
  [(_UIResilientRemoteViewContainerViewController *)v6 view];
  uint64_t v8 = self;
  v9 = v25 = self;
  [(_UIResilientRemoteViewContainerViewController *)v6 beginAppearanceTransition:1 animated:0];
  [(REMReminderServiceViewController *)v8 addChildViewController:v6];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v9];
  v19 = (void *)MEMORY[0x263F08938];
  v24 = [v9 leadingAnchor];
  v23 = [v7 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v26[0] = v22;
  v21 = [v9 trailingAnchor];
  v20 = [v7 trailingAnchor];
  v18 = [v21 constraintEqualToAnchor:v20];
  v26[1] = v18;
  id v10 = [v9 topAnchor];
  v11 = [v7 topAnchor];
  long long v12 = [v10 constraintEqualToAnchor:v11];
  v26[2] = v12;
  v13 = [v9 bottomAnchor];
  v14 = [v7 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  [v19 activateConstraints:v16];

  [(_UIResilientRemoteViewContainerViewController *)v6 didMoveToParentViewController:v25];
  [(_UIResilientRemoteViewContainerViewController *)v6 endAppearanceTransition];
}

- (REMReminderCreationViewServiceViewController)viewServiceViewController
{
  uint64_t v2 = [(REMReminderServiceViewController *)self remoteViewController];
  v3 = [v2 viewServiceViewController];

  return (REMReminderCreationViewServiceViewController *)v3;
}

- (REMReminderCreationRemoteViewController)remoteViewController
{
  return (REMReminderCreationRemoteViewController *)[(_UIResilientRemoteViewContainerViewController *)self->_childViewController remoteViewController];
}

- (_UIResilientRemoteViewContainerViewController)childViewController
{
  return self->_childViewController;
}

- (NSError)deferredErrorDuringPresentation
{
  return self->_deferredErrorDuringPresentation;
}

- (void)setDeferredErrorDuringPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredErrorDuringPresentation, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v6 = v5;
  _os_log_error_impl(&dword_21820B000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", v7, 0x16u);
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21820B000, v0, OS_LOG_TYPE_DEBUG, "_UIResilientRemoteViewContainerViewController initialized (%@)", v1, 0xCu);
}

- (void)viewDidAppear:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21820B000, v0, OS_LOG_TYPE_ERROR, "REMReminderServiceViewController: encountered error during presentation {error: %{public}@}", v1, 0xCu);
}

- (void)viewDidDisappear:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21820B000, log, OS_LOG_TYPE_DEBUG, "-[REMReminderServiceViewController viewDidDisappear]", v1, 2u);
}

- (void)setChildViewController:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[REMReminderServiceViewController setChildViewController:]";
  _os_log_fault_impl(&dword_21820B000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (_childViewController != nil) -- %s: remote view controller can only be set once", (uint8_t *)&v1, 0xCu);
}

@end