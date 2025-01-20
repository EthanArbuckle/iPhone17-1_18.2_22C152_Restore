@interface PSViewController
- (BOOL)_isUndoSupportedInCurrentEnvironment;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isCallingHandleURLFromHandleURLWithCompletion;
- (BOOL)isURLHandlingDeferredForViewControllerContainment;
- (NSDictionary)urlResourceDictionaryPendingViewControllerContainment;
- (PSViewController)init;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (id)urlCompletionHandlerPendingViewControllerContainment;
- (int64_t)navigationItemLargeTitleDisplayMode;
- (void)addChildViewController:(id)a3;
- (void)handleCanBeShownFromSuspendedState:(id)a3;
- (void)handleURL:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)handleURLForPendingViewControllerContainmentIfNeeded;
- (void)rootController;
- (void)setCallingHandleURLFromHandleURLWithCompletion:(BOOL)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setUrlCompletionHandlerPendingViewControllerContainment:(id)a3;
- (void)setUrlHandlingDeferredForViewControllerContainment:(BOOL)a3;
- (void)setUrlResourceDictionaryPendingViewControllerContainment:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSViewController

- (PSViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSViewController;
  v2 = [(PSViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PSViewController *)v2 navigationItemLargeTitleDisplayMode];
    v5 = [(PSViewController *)v3 navigationItem];
    [v5 setLargeTitleDisplayMode:v4];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_handleCanBeShownFromSuspendedState_ name:*MEMORY[0x1E4F43660] object:0];
  }
  return v3;
}

- (int64_t)navigationItemLargeTitleDisplayMode
{
  return 2;
}

uint64_t __34__PSViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleURLForPendingViewControllerContainmentIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    v10 = [(PSViewController *)self viewIfLoaded];
    v11 = [v10 window];
    v12 = [(PSViewController *)self navigationController];
    v13 = [(PSViewController *)self parentViewController];
    v14 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2112;
    v29 = v12;
    __int16 v30 = 2160;
    uint64_t v31 = 1752392040;
    __int16 v32 = 2112;
    v33 = v13;
    __int16 v34 = 2160;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);
  }
}

- (id)rootController
{
  p_rootController = &self->_rootController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);

  if (!WeakRetained)
  {
    v5 = _PSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(PSViewController *)(uint64_t)self rootController];
    }
  }
  id v6 = objc_loadWeakRetained((id *)p_rootController);
  return v6;
}

- (void)viewDidLoad
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PSViewController;
  [(PSViewController *)&v18 viewDidLoad];
  uint64_t v4 = PKLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    objc_super v8 = [(PSViewController *)self viewIfLoaded];
    v9 = [v8 window];
    v10 = [(PSViewController *)self navigationController];
    v11 = [(PSViewController *)self parentViewController];
    v12 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545666;
    __int16 v20 = v6;
    __int16 v21 = 2114;
    __int16 v22 = v7;
    __int16 v23 = 2160;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2112;
    __int16 v26 = v9;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    __int16 v30 = v10;
    __int16 v31 = 2160;
    uint64_t v32 = 1752392040;
    __int16 v33 = 2112;
    __int16 v34 = v11;
    __int16 v35 = 2160;
    uint64_t v36 = 1752392040;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x66u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
  if (WeakRetained)
  {
    v14 = WeakRetained;
    objc_super v15 = [(PSViewController *)self rootController];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [(PSViewController *)self rootController];
      [v17 logSettingsPath];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PSViewController;
  -[PSViewController viewDidAppear:](&v16, sel_viewDidAppear_);
  id v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    v10 = [(PSViewController *)self viewIfLoaded];
    v11 = [v10 window];
    v12 = [(PSViewController *)self navigationController];
    v13 = [(PSViewController *)self parentViewController];
    v14 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545922;
    objc_super v18 = v8;
    __int16 v19 = 2114;
    __int16 v20 = v9;
    __int16 v21 = 1024;
    BOOL v22 = v3;
    __int16 v23 = 2160;
    uint64_t v24 = 1752392040;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    __int16 v31 = 2160;
    uint64_t v32 = 1752392040;
    __int16 v33 = 2112;
    __int16 v34 = v13;
    __int16 v35 = 2160;
    uint64_t v36 = 1752392040;
    __int16 v37 = 2112;
    uint64_t v38 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);
  }
  if ([(PSViewController *)self _isUndoSupportedInCurrentEnvironment]) {
    [(PSViewController *)self becomeFirstResponder];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PSViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E5C5D680;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)_isUndoSupportedInCurrentEnvironment
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];
    char v5 = [v4 isEqualToString:@"com.apple.Preferences"];

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewIsAppearing:](&v15, sel_viewIsAppearing_);
  id v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    v10 = [(PSViewController *)self viewIfLoaded];
    v11 = [v10 window];
    v12 = [(PSViewController *)self navigationController];
    v13 = [(PSViewController *)self parentViewController];
    v14 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2160;
    uint64_t v31 = 1752392040;
    __int16 v32 = 2112;
    __int16 v33 = v13;
    __int16 v34 = 2160;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    __int16 v37 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);
  }
}

- (id)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return WeakRetained;
}

- (void)setRootController:(id)a3
{
}

- (void)setParentController:(id)a3
{
}

- (void)setSpecifier:(id)a3
{
  if (self->_specifier != a3) {
    objc_storeStrong((id *)&self->_specifier, a3);
  }
  MEMORY[0x1F41817F8]();
}

- (void)addChildViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSViewController;
  [(PSViewController *)&v8 addChildViewController:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if ([(PSViewController *)self isURLHandlingDeferredForViewControllerContainment]&& v7)
  {
    objc_msgSend(v7, "setUrlHandlingDeferredForViewControllerContainment:", -[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment"));
  }
}

- (void)handleURLForPendingViewControllerContainmentIfNeeded
{
  if ([(PSViewController *)self isURLHandlingDeferredForViewControllerContainment])
  {
    BOOL v3 = [(PSViewController *)self urlResourceDictionaryPendingViewControllerContainment];

    if (v3)
    {
      id v7 = [(PSViewController *)self urlCompletionHandlerPendingViewControllerContainment];
      [(PSViewController *)self setUrlCompletionHandlerPendingViewControllerContainment:0];
      id v4 = [(PSViewController *)self urlResourceDictionaryPendingViewControllerContainment];
      [(PSViewController *)self setUrlResourceDictionaryPendingViewControllerContainment:0];
      id v5 = v7;
      if (v7
        || (NSClassFromString(&cfstr_Pslistcontroll_6.isa),
            char isKindOfClass = objc_opt_isKindOfClass(),
            id v5 = 0,
            (isKindOfClass & 1) != 0))
      {
        [(PSViewController *)self handleURL:v4 withCompletion:v5];
      }
      else
      {
        [(PSViewController *)self handleURL:v4];
      }
    }
  }
}

- (BOOL)isURLHandlingDeferredForViewControllerContainment
{
  return self->_urlHandlingDeferredForViewControllerContainment;
}

- (void)handleCanBeShownFromSuspendedState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(PSViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  int v6 = [v5 containsObject:self];

  if (v6 && ![(PSViewController *)self canBeShownFromSuspendedState])
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v14 = 136315394;
      objc_super v15 = "-[PSViewController handleCanBeShownFromSuspendedState:]";
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@ canBeShownFromSuspendedState is NO, popping/dismissing controller.", (uint8_t *)&v14, 0x16u);
    }
    v10 = [(PSViewController *)self navigationController];
    id v11 = (id)[v10 popToViewController:self animated:0];

    v12 = [(PSViewController *)self navigationController];
    id v13 = (id)[v12 popViewControllerAnimated:0];

    [(PSViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:a3];
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v8 = [(PSViewController *)self navigationController];
  v9 = [v8 childViewControllers];

  if ([v9 containsObject:v7])
  {
    v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSViewController showController:animate:](v10);
    }

    id v11 = _PSLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PSRootController showController:animate:]();
    }

    v12 = _PSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PSRootController showController:animate:]();
    }
  }
  id v13 = PKLogForCategory(3);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (objc_class *)objc_opt_class();
    objc_super v15 = NSStringFromClass(v14);
    __int16 v16 = NSStringFromSelector(a2);
    int v18 = 138544386;
    __int16 v19 = v15;
    __int16 v20 = 2114;
    BOOL v21 = v16;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 1024;
    BOOL v27 = v4;
    _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ called with %{mask.hash}@, %{BOOL}d", (uint8_t *)&v18, 0x30u);
  }
  if (v4)
  {
    [(PSViewController *)self showViewController:v7 sender:self];
  }
  else
  {
    v17 = [(PSViewController *)self navigationController];
    [v17 pushViewController:v7 animated:0];
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  int v6 = (void (**)(void))a4;
  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment")&& (-[PSViewController viewIfLoaded](self, "viewIfLoaded"), v7 = objc_claimAutoreleasedReturnValue(), [v7 window], objc_super v8 = objc_claimAutoreleasedReturnValue(), v8, v7, !v8))
  {
    [(PSViewController *)self setUrlResourceDictionaryPendingViewControllerContainment:v9];
    [(PSViewController *)self setUrlCompletionHandlerPendingViewControllerContainment:v6];
  }
  else
  {
    [(PSViewController *)self setCallingHandleURLFromHandleURLWithCompletion:1];
    [(PSViewController *)self handleURL:v9];
    [(PSViewController *)self setCallingHandleURLFromHandleURLWithCompletion:0];
    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)handleURL:(id)a3
{
  id v6 = a3;
  if (![(PSViewController *)self isCallingHandleURLFromHandleURLWithCompletion])
  {
    if ([(PSViewController *)self isURLHandlingDeferredForViewControllerContainment])
    {
      BOOL v4 = [(PSViewController *)self viewIfLoaded];
      id v5 = [v4 window];

      if (!v5) {
        [(PSViewController *)self setUrlResourceDictionaryPendingViewControllerContainment:v6];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  id v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    v10 = [(PSViewController *)self viewIfLoaded];
    id v11 = [v10 window];
    v12 = [(PSViewController *)self navigationController];
    id v13 = [(PSViewController *)self parentViewController];
    int v14 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2160;
    uint64_t v31 = 1752392040;
    __int16 v32 = 2112;
    __int16 v33 = v13;
    __int16 v34 = 2160;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    __int16 v37 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);
  }
  if ([(PSViewController *)self _isUndoSupportedInCurrentEnvironment]) {
    [(PSViewController *)self resignFirstResponder];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewDidDisappear:](&v15, sel_viewDidDisappear_);
  id v6 = PKLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    v10 = [(PSViewController *)self viewIfLoaded];
    id v11 = [v10 window];
    v12 = [(PSViewController *)self navigationController];
    id v13 = [(PSViewController *)self parentViewController];
    int v14 = [(PSViewController *)self parentController];
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2160;
    uint64_t v27 = 1752392040;
    __int16 v28 = 2112;
    __int16 v29 = v12;
    __int16 v30 = 2160;
    uint64_t v31 = 1752392040;
    __int16 v32 = 2112;
    __int16 v33 = v13;
    __int16 v34 = 2160;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    __int16 v37 = v14;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)setUrlHandlingDeferredForViewControllerContainment:(BOOL)a3
{
  self->_urlHandlingDeferredForViewControllerContainment = a3;
}

- (BOOL)isCallingHandleURLFromHandleURLWithCompletion
{
  return self->_callingHandleURLFromHandleURLWithCompletion;
}

- (void)setCallingHandleURLFromHandleURLWithCompletion:(BOOL)a3
{
  self->_callingHandleURLFromHandleURLWithCompletion = a3;
}

- (NSDictionary)urlResourceDictionaryPendingViewControllerContainment
{
  return self->_urlResourceDictionaryPendingViewControllerContainment;
}

- (void)setUrlResourceDictionaryPendingViewControllerContainment:(id)a3
{
}

- (id)urlCompletionHandlerPendingViewControllerContainment
{
  return self->_urlCompletionHandlerPendingViewControllerContainment;
}

- (void)setUrlCompletionHandlerPendingViewControllerContainment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlCompletionHandlerPendingViewControllerContainment, 0);
  objc_storeStrong((id *)&self->_urlResourceDictionaryPendingViewControllerContainment, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);
  objc_destroyWeak((id *)&self->_parentController);
}

- (void)rootController
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  int v5 = 136315394;
  id v6 = "-[PSViewController rootController]";
  __int16 v7 = 2112;
  objc_super v8 = v4;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "%s: %@'s .rootController was accessed, but rootController will be nil for most controllers. This usage of rootController should be replaced by PSViewController's methods, or by accessing .navigationController", (uint8_t *)&v5, 0x16u);
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[PSViewController showController:animate:]";
  _os_log_error_impl(&dword_1A6597000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
}

@end