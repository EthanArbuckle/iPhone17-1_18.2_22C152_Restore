@interface PRQuickActionEditingViewController
- (BOOL)isGalleryPresented;
- (CCUISConfiguredControl)leadingControl;
- (CCUISConfiguredControl)trailingControl;
- (CSProminentButtonsView)prominentButtonsView;
- (PRQuickActionEditingViewController)initWithQuickActionsConfiguration:(id)a3;
- (PRQuickActionEditingViewControllerDelegate)delegate;
- (id)_configureEditingReticleViewWithTapGesture:(id)a3;
- (id)_configureRemoveButtonWithAction:(id)a3;
- (id)_controlViewForControl:(id)a3;
- (id)_validateControl:(id)a3;
- (void)_handleRemoveButtonActionForQuickActionPosition:(int64_t)a3;
- (void)_leadingActionDidFire;
- (void)_presentWidgetIntentConfigurationForControlWithPosition:(int64_t)a3;
- (void)_trailingActionDidFire;
- (void)_updateActiveReticleForPosition:(int64_t)a3;
- (void)_updateButtonsVisibility;
- (void)setDelegate:(id)a3;
- (void)setGalleryPresented:(BOOL)a3;
- (void)setLeadingControl:(id)a3;
- (void)setProminentButtonsView:(id)a3;
- (void)setTrailingControl:(id)a3;
- (void)validateControls;
- (void)viewDidLoad;
@end

@implementation PRQuickActionEditingViewController

- (PRQuickActionEditingViewController)initWithQuickActionsConfiguration:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRQuickActionEditingViewController;
  v5 = [(PRQuickActionEditingViewController *)&v17 init];
  if (v5)
  {
    v6 = [v4 leadingControl];
    v7 = [v4 trailingControl];
    if ([v6 category] == 3)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F5AE80]);
      v9 = [v6 identity];
      v10 = objc_msgSend(v8, "initWithIdentity:type:", v9, objc_msgSend(v6, "type"));
    }
    else
    {
      v10 = 0;
    }
    if ([v7 category] == 3)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F5AE80]);
      v12 = [v7 identity];
      v13 = objc_msgSend(v11, "initWithIdentity:type:", v12, objc_msgSend(v7, "type"));
    }
    else
    {
      v13 = 0;
    }
    [(PRQuickActionEditingViewController *)v5 setLeadingControl:v10];
    [(PRQuickActionEditingViewController *)v5 setTrailingControl:v13];
    uint64_t v14 = PRSharedWidgetExtensionProvider();
    extensionProvider = v5->_extensionProvider;
    v5->_extensionProvider = (CHSWidgetExtensionProvider *)v14;
  }
  return v5;
}

- (void)viewDidLoad
{
  v57[4] = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)PRQuickActionEditingViewController;
  [(PRQuickActionEditingViewController *)&v56 viewDidLoad];
  if (PRLockPickIsActive())
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F5E4B0]);
    [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v46 setClickSuppressed:1];
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E4FB13F0];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke;
    v53[3] = &unk_1E54DADA8;
    objc_copyWeak(&v54, &location);
    uint64_t v4 = [v3 actionWithHandler:v53];
    [v46 addAction:v4 forControlEvents:64];

    v5 = [(PRQuickActionEditingViewController *)self leadingControl];
    LOBYTE(v4) = v5 == 0;

    if (v4)
    {
      [v46 setHidden:1];
    }
    else
    {
      v6 = [(PRQuickActionEditingViewController *)self leadingControl];
      v7 = [(PRQuickActionEditingViewController *)self _controlViewForControl:v6];
      [v46 setGlyphView:v7];
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F5E4B0]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setClickSuppressed:1];
    v45 = v8;
    v9 = (void *)MEMORY[0x1E4FB13F0];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_2;
    v51[3] = &unk_1E54DADA8;
    objc_copyWeak(&v52, &location);
    uint64_t v10 = [v9 actionWithHandler:v51];
    [v45 addAction:v10 forControlEvents:64];

    id v11 = [(PRQuickActionEditingViewController *)self trailingControl];
    LOBYTE(v10) = v11 == 0;

    if (v10)
    {
      [v45 setHidden:1];
    }
    else
    {
      v12 = [(PRQuickActionEditingViewController *)self trailingControl];
      v13 = [(PRQuickActionEditingViewController *)self _controlViewForControl:v12];
      [v45 setGlyphView:v13];
    }
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F5E4B8]) initWithLeadingButton:v46 trailingButton:v45];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__leadingActionDidFire];
    v16 = [(PRQuickActionEditingViewController *)self _configureEditingReticleViewWithTapGesture:v15];
    [v14 setLeadingReticle:v16];

    objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__trailingActionDidFire];
    v18 = [(PRQuickActionEditingViewController *)self _configureEditingReticleViewWithTapGesture:v17];
    [v14 setTrailingReticle:v18];

    v19 = (void *)MEMORY[0x1E4FB13F0];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_3;
    v49[3] = &unk_1E54DADA8;
    objc_copyWeak(&v50, &location);
    v20 = [v19 actionWithHandler:v49];
    v44 = [(PRQuickActionEditingViewController *)self _configureRemoveButtonWithAction:v20];

    v21 = (void *)MEMORY[0x1E4FB13F0];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_4;
    v47[3] = &unk_1E54DADA8;
    objc_copyWeak(&v48, &location);
    v22 = [v21 actionWithHandler:v47];
    v43 = [(PRQuickActionEditingViewController *)self _configureRemoveButtonWithAction:v22];

    [v14 setLeadingRemoveButton:v44];
    [v14 setTrailingRemoveButton:v43];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(PRQuickActionEditingViewController *)self view];
    [v23 addSubview:v14];

    v33 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [v14 bottomAnchor];
    v42 = [(PRQuickActionEditingViewController *)self view];
    v40 = [v42 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v57[0] = v39;
    v37 = [v14 topAnchor];
    v38 = [(PRQuickActionEditingViewController *)self view];
    v36 = [v38 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v57[1] = v35;
    v34 = [v14 leadingAnchor];
    v24 = [(PRQuickActionEditingViewController *)self view];
    v25 = [v24 leadingAnchor];
    v26 = [v34 constraintEqualToAnchor:v25];
    v57[2] = v26;
    v27 = [v14 trailingAnchor];
    v28 = [(PRQuickActionEditingViewController *)self view];
    v29 = [v28 trailingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    v57[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
    [v33 activateConstraints:v31];

    prominentButtonsView = self->_prominentButtonsView;
    self->_prominentButtonsView = (CSProminentButtonsView *)v14;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
  [(PRQuickActionEditingViewController *)self _updateButtonsVisibility];
}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentWidgetIntentConfigurationForControlWithPosition:1];
}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentWidgetIntentConfigurationForControlWithPosition:2];
}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoveButtonActionForQuickActionPosition:1];
}

void __49__PRQuickActionEditingViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoveButtonActionForQuickActionPosition:2];
}

- (void)validateControls
{
  id v4 = [(PRQuickActionEditingViewController *)self _validateControl:self->_leadingControl];
  v3 = [(PRQuickActionEditingViewController *)self _validateControl:self->_trailingControl];
  if ((BSEqualObjects() & 1) == 0) {
    [(PRQuickActionEditingViewController *)self setLeadingControl:v4];
  }
  if ((BSEqualObjects() & 1) == 0) {
    [(PRQuickActionEditingViewController *)self setTrailingControl:v3];
  }
}

- (id)_validateControl:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 identity];
    v7 = [v6 extensionIdentity];
    id v8 = [v7 containerBundleIdentifier];
    v9 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v8];
    if (([v9 isLocked] & 1) != 0 || objc_msgSend(v9, "isHidden"))
    {
      uint64_t v10 = PRLogEditing();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        __int16 v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_18C1C4000, v10, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing control %{public}@ with containerBundleIdentifier %{public}@ because app was hidden or locked", buf, 0x16u);
      }
      id v11 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [(CHSWidgetExtensionProvider *)self->_extensionProvider controlDescriptorForControl:v6];
    if (v10)
    {
      id v11 = v5;
LABEL_7:

      goto LABEL_9;
    }
    id v17 = 0;
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v17];
    id v14 = v17;
    if (v14)
    {
      v15 = PRLogEditing();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PRQuickActionEditingViewController _validateControl:]();
      }
    }
    else
    {
      v16 = PRLogEditing();
      v15 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PRQuickActionEditingViewController _validateControl:]();
        }

        id v11 = v5;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v5;
        _os_log_impl(&dword_18C1C4000, v15, OS_LOG_TYPE_DEFAULT, "[Quick Action] removing button for %{public}@ because application was not found", buf, 0xCu);
      }
    }

    id v11 = 0;
LABEL_22:

    goto LABEL_7;
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (void)setLeadingControl:(id)a3
{
  id v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingControl, a3);
    if (v9)
    {
      v5 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
      v6 = [v5 leadingButton];
      v7 = [(PRQuickActionEditingViewController *)self _controlViewForControl:v9];
      [v6 setGlyphView:v7];

      [(PRQuickActionEditingViewController *)self _updateActiveReticleForPosition:0];
    }
    id v8 = [(PRQuickActionEditingViewController *)self delegate];
    [v8 quickActionEditingViewController:self didSetControl:v9 forPosition:1];

    [(PRQuickActionEditingViewController *)self _updateButtonsVisibility];
  }
}

- (void)setTrailingControl:(id)a3
{
  id v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingControl, a3);
    if (v9)
    {
      v5 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
      v6 = [v5 trailingButton];
      v7 = [(PRQuickActionEditingViewController *)self _controlViewForControl:v9];
      [v6 setGlyphView:v7];

      [(PRQuickActionEditingViewController *)self _updateActiveReticleForPosition:0];
    }
    id v8 = [(PRQuickActionEditingViewController *)self delegate];
    [v8 quickActionEditingViewController:self didSetControl:v9 forPosition:2];

    [(PRQuickActionEditingViewController *)self _updateButtonsVisibility];
  }
}

- (id)_controlViewForControl:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [PRQuickActionControlView alloc];
    v5 = [v3 identity];
    uint64_t v6 = [v3 type];

    v7 = [(PRQuickActionControlView *)v4 initWithControl:v5 type:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_leadingActionDidFire
{
  id v3 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
  id v4 = [v3 leadingButton];
  [v4 setSelected:0];

  id v5 = [(PRQuickActionEditingViewController *)self delegate];
  [v5 quickActionEditingViewController:self didTapAddForPosition:1];
}

- (void)_trailingActionDidFire
{
  id v3 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
  id v4 = [v3 trailingButton];
  [v4 setSelected:0];

  id v5 = [(PRQuickActionEditingViewController *)self delegate];
  [v5 quickActionEditingViewController:self didTapAddForPosition:2];
}

- (void)_presentWidgetIntentConfigurationForControlWithPosition:(int64_t)a3
{
  if ([(PRQuickActionEditingViewController *)self isGalleryPresented] || !a3) {
    return;
  }
  if (a3 == 2)
  {
    uint64_t v5 = [(PRQuickActionEditingViewController *)self trailingControl];
  }
  else
  {
    if (a3 != 1)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v5 = [(PRQuickActionEditingViewController *)self leadingControl];
  }
  id v7 = (id)v5;
LABEL_10:
  uint64_t v6 = [(PRQuickActionEditingViewController *)self delegate];
  [v6 quickActionEditingViewController:self didRequestIntentConfigurationForControl:v7 withPosition:a3];
}

- (void)_handleRemoveButtonActionForQuickActionPosition:(int64_t)a3
{
  if (a3 == 2)
  {
    [(PRQuickActionEditingViewController *)self setTrailingControl:0];
  }
  else if (a3 == 1)
  {
    [(PRQuickActionEditingViewController *)self setLeadingControl:0];
  }
}

- (id)_configureEditingReticleViewWithTapGesture:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PRQuickActionsEditingReticleView);
  uint64_t v5 = [(PRQuickActionsEditingReticleView *)v4 layer];
  [v5 setHitTestsAsOpaque:1];

  [(PRQuickActionsEditingReticleView *)v4 addGestureRecognizer:v3];
  return v4;
}

- (id)_configureRemoveButtonWithAction:(id)a3
{
  id v3 = a3;
  id v4 = [PREditingMinusCloseBoxButton alloc];
  uint64_t v5 = -[PREditingButton initWithStyle:frame:primaryAction:](v4, "initWithStyle:frame:primaryAction:", 0, v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  uint64_t v6 = [(PREditingMinusCloseBoxButton *)v5 configuration];
  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [(PREditingMinusCloseBoxButton *)v5 setConfiguration:v6];

  return v5;
}

- (void)_updateActiveReticleForPosition:(int64_t)a3
{
  id v6 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
  id v4 = [v6 leadingReticle];
  [v4 setActive:a3 == 1];

  uint64_t v5 = [v6 trailingReticle];
  [v5 setActive:a3 == 2];
}

- (void)_updateButtonsVisibility
{
  id v11 = [(PRQuickActionEditingViewController *)self prominentButtonsView];
  BOOL v3 = self->_leadingControl == 0;
  BOOL v4 = self->_trailingControl == 0;
  uint64_t v5 = [v11 leadingButton];
  [v5 setHidden:v3];

  id v6 = [v11 trailingButton];
  [v6 setHidden:v4];

  id v7 = [v11 leadingRemoveButton];
  [v7 setHidden:v3];

  id v8 = [v11 leadingReticle];
  [v8 setShowsEmptyView:v3];

  id v9 = [v11 trailingRemoveButton];
  [v9 setHidden:v4];

  uint64_t v10 = [v11 trailingReticle];
  [v10 setShowsEmptyView:v4];
}

- (PRQuickActionEditingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRQuickActionEditingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isGalleryPresented
{
  return self->_galleryPresented;
}

- (void)setGalleryPresented:(BOOL)a3
{
  self->_galleryPresented = a3;
}

- (CCUISConfiguredControl)leadingControl
{
  return self->_leadingControl;
}

- (CCUISConfiguredControl)trailingControl
{
  return self->_trailingControl;
}

- (CSProminentButtonsView)prominentButtonsView
{
  return self->_prominentButtonsView;
}

- (void)setProminentButtonsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentButtonsView, 0);
  objc_storeStrong((id *)&self->_trailingControl, 0);
  objc_storeStrong((id *)&self->_leadingControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

- (void)_validateControl:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "[Quick Action] keeping control %{public}@ with nil control descriptor because found application with containerBundleIdentifier %{public}@");
}

- (void)_validateControl:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_18C1C4000, v0, v1, "[Quick Action] removing control %{public}@ because failed to look up application record with error %{public}@");
}

@end