@interface TVRUIControlPanelViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)enabled;
- (NSMutableSet)allButtonPanels;
- (TVRUIButtonPanelView)currentButtonPanel;
- (TVRUIButtonPanelView)genericButtonPanel;
- (TVRUIButtonPanelView)legacyButtonPanel;
- (TVRUIButtonPanelView)legacyPanelWithKeyboardButton;
- (TVRUIButtonPanelView)panelWithKeyboardButton;
- (TVRUIButtonPanelView)touchpadButtonPanel;
- (TVRUIDevice)remoteDevice;
- (TVRUIStyleProvider)styleProvider;
- (UIView)backgroundView;
- (_TVRUIEventDelegate)buttonActionsDelegate;
- (id)_createPagedViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4;
- (id)_createViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4 rightButtonTypes:(id)a5;
- (void)_createButtonPanelWithKeyboard;
- (void)_createGenericControlButtonPanel;
- (void)_createLegacyButtonPanel;
- (void)_createLegacyPanelWithkeyboard;
- (void)_createTouchpadButtonPanel;
- (void)_disableControls;
- (void)_enableControls;
- (void)_transitionToButtonPanelAndCreateIfNeeded;
- (void)_transitionToPanelView:(id)a3;
- (void)_transitionToTouchpadPanelAndCreateIfNeeded;
- (void)_updateViewState;
- (void)disableSearchButton;
- (void)enableSearchButton;
- (void)hideKeyboardButton;
- (void)setAllButtonPanels:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setButtonActionsDelegate:(id)a3;
- (void)setCurrentButtonPanel:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGenericButtonPanel:(id)a3;
- (void)setLegacyButtonPanel:(id)a3;
- (void)setLegacyPanelWithKeyboardButton:(id)a3;
- (void)setPanelWithKeyboardButton:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTouchpadButtonPanel:(id)a3;
- (void)showKeyboardButton;
- (void)transitonToViewForDeviceType:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRUIControlPanelViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)TVRUIControlPanelViewController;
  [(TVRUIControlPanelViewController *)&v12 viewDidLoad];
  v3 = [(TVRUIControlPanelViewController *)self styleProvider];
  v4 = [v3 controlPanelBackgroundView];
  [(TVRUIControlPanelViewController *)self setBackgroundView:v4];

  v5 = [(TVRUIControlPanelViewController *)self backgroundView];

  if (v5)
  {
    v6 = [(TVRUIControlPanelViewController *)self view];
    v7 = [(TVRUIControlPanelViewController *)self backgroundView];
    [v6 addSubview:v7];
  }
  else
  {
    v6 = [(TVRUIControlPanelViewController *)self styleProvider];
    v7 = [v6 controlPanelBackgroundColor];
    v8 = [(TVRUIControlPanelViewController *)self view];
    [v8 setBackgroundColor:v7];
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [(TVRUIControlPanelViewController *)self setAllButtonPanels:v9];

  [(TVRUIControlPanelViewController *)self _createTouchpadButtonPanel];
  v10 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [v10 disableButtons:0];

  v11 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [(TVRUIControlPanelViewController *)self _transitionToPanelView:v11];
}

- (void)viewWillLayoutSubviews
{
  v68.receiver = self;
  v68.super_class = (Class)TVRUIControlPanelViewController;
  [(TVRUIControlPanelViewController *)&v68 viewWillLayoutSubviews];
  v3 = [(TVRUIControlPanelViewController *)self backgroundView];

  if (v3)
  {
    v4 = [(TVRUIControlPanelViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(TVRUIControlPanelViewController *)self backgroundView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
  v14 = [(TVRUIControlPanelViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(TVRUIControlPanelViewController *)self genericButtonPanel];

  if (v24)
  {
    v25 = [(TVRUIControlPanelViewController *)self view];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(TVRUIControlPanelViewController *)self genericButtonPanel];
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);
  }
  v35 = [(TVRUIControlPanelViewController *)self panelWithKeyboardButton];

  if (v35)
  {
    v36 = [(TVRUIControlPanelViewController *)self view];
    [v36 bounds];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v45 = [(TVRUIControlPanelViewController *)self panelWithKeyboardButton];
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);
  }
  v46 = [(TVRUIControlPanelViewController *)self legacyButtonPanel];

  if (v46)
  {
    v47 = [(TVRUIControlPanelViewController *)self view];
    [v47 bounds];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    v56 = [(TVRUIControlPanelViewController *)self legacyButtonPanel];
    objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);
  }
  v57 = [(TVRUIControlPanelViewController *)self legacyPanelWithKeyboardButton];

  if (v57)
  {
    v58 = [(TVRUIControlPanelViewController *)self view];
    [v58 bounds];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    v67 = [(TVRUIControlPanelViewController *)self legacyPanelWithKeyboardButton];
    objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);
  }
}

- (void)_createTouchpadButtonPanel
{
  if (+[TVRUIFeatures swapBackPlayPauseButtonsEnabled])
  {
    v3 = &unk_26DB65B90;
    v4 = &unk_26DB65BA8;
    double v5 = self;
    uint64_t v6 = 5;
  }
  else
  {
    v3 = &unk_26DB65BC0;
    v4 = &unk_26DB65BD8;
    double v5 = self;
    uint64_t v6 = 2;
  }
  double v7 = [(TVRUIControlPanelViewController *)v5 _createViewWithPrimaryButtonType:v6 leftButtonTypes:v3 rightButtonTypes:v4];
  [(TVRUIControlPanelViewController *)self setTouchpadButtonPanel:v7];

  double v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Created touchpad button panel WITHOUT page buttons", v11, 2u);
  }

  double v9 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  double v10 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [v9 addObject:v10];
}

- (void)_createGenericControlButtonPanel
{
  v3 = [(TVRUIControlPanelViewController *)self _createViewWithPrimaryButtonType:23 leftButtonTypes:&unk_26DB65BF0 rightButtonTypes:&unk_26DB65C08];
  [(TVRUIControlPanelViewController *)self setGenericButtonPanel:v3];

  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Created generic tv button panel", v7, 2u);
  }

  double v5 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v6 = [(TVRUIControlPanelViewController *)self genericButtonPanel];
  [v5 addObject:v6];
}

- (void)_createButtonPanelWithKeyboard
{
  v3 = [(TVRUIControlPanelViewController *)self _createViewWithPrimaryButtonType:2 leftButtonTypes:&unk_26DB65C20 rightButtonTypes:&unk_26DB65C38];
  [(TVRUIControlPanelViewController *)self setPanelWithKeyboardButton:v3];

  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Created button panel with keyboard buttons and page buttons", v7, 2u);
  }

  double v5 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v6 = [(TVRUIControlPanelViewController *)self panelWithKeyboardButton];
  [v5 addObject:v6];
}

- (void)_createLegacyButtonPanel
{
  v3 = [(TVRUIControlPanelViewController *)self _createViewWithPrimaryButtonType:2 leftButtonTypes:&unk_26DB65C50 rightButtonTypes:&unk_26DB65C68];
  [(TVRUIControlPanelViewController *)self setLegacyButtonPanel:v3];

  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Created legacy button panel", v7, 2u);
  }

  double v5 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v6 = [(TVRUIControlPanelViewController *)self legacyButtonPanel];
  [v5 addObject:v6];
}

- (void)_createLegacyPanelWithkeyboard
{
  v3 = [(TVRUIControlPanelViewController *)self _createViewWithPrimaryButtonType:2 leftButtonTypes:&unk_26DB65C80 rightButtonTypes:&unk_26DB65C98];
  [(TVRUIControlPanelViewController *)self setLegacyPanelWithKeyboardButton:v3];

  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Created legacy button panel with keyboard button", v7, 2u);
  }

  double v5 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v6 = [(TVRUIControlPanelViewController *)self legacyPanelWithKeyboardButton];
  [v5 addObject:v6];
}

- (id)_createViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4 rightButtonTypes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [TVRUIButtonPanelView alloc];
  double v11 = [(TVRUIControlPanelViewController *)self styleProvider];
  double v12 = [(TVRUIButtonPanelView *)v10 initWithPrimaryButtonType:a3 secondaryLeftButtons:v9 secondaryRightButtons:v8 styleProvider:v11];

  [(TVRUIButtonPanelView *)v12 setAutoresizingMask:18];
  v13 = [(TVRUIControlPanelViewController *)self buttonActionsDelegate];
  [(TVRUIButtonPanelView *)v12 setButtonEventDelegate:v13];

  return v12;
}

- (id)_createPagedViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4
{
  id v6 = a4;
  double v7 = [TVRUIButtonPanelView alloc];
  id v8 = [(TVRUIControlPanelViewController *)self styleProvider];
  id v9 = [(TVRUIButtonPanelView *)v7 initPagedPanelWithPrimaryButtonType:a3 secondaryLeftButtons:v6 styleProvider:v8];

  [v9 setAutoresizingMask:18];
  double v10 = [(TVRUIControlPanelViewController *)self buttonActionsDelegate];
  [v9 setButtonEventDelegate:v10];

  return v9;
}

- (void)showKeyboardButton
{
  if ([(TVRUIDevice *)self->_remoteDevice isLegacyAppleTV])
  {
    v3 = [(TVRUIControlPanelViewController *)self legacyPanelWithKeyboardButton];

    if (!v3) {
      [(TVRUIControlPanelViewController *)self _createLegacyPanelWithkeyboard];
    }
    uint64_t v4 = [(TVRUIControlPanelViewController *)self legacyPanelWithKeyboardButton];
  }
  else
  {
    double v5 = [(TVRUIControlPanelViewController *)self panelWithKeyboardButton];

    if (!v5) {
      [(TVRUIControlPanelViewController *)self _createButtonPanelWithKeyboard];
    }
    uint64_t v4 = [(TVRUIControlPanelViewController *)self panelWithKeyboardButton];
  }
  id v6 = (void *)v4;
  double v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Requesting transition to keyboard button panel", v8, 2u);
  }

  [(TVRUIControlPanelViewController *)self _transitionToPanelView:v6];
}

- (void)hideKeyboardButton
{
  v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Hiding keyboard button panel and requesting transition to touchpad buttonpanel", v5, 2u);
  }

  if ([(TVRUIDevice *)self->_remoteDevice isLegacyAppleTV]) {
    [(TVRUIControlPanelViewController *)self legacyButtonPanel];
  }
  else {
  uint64_t v4 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  }
  [(TVRUIControlPanelViewController *)self _transitionToPanelView:v4];
}

- (void)enableSearchButton
{
  id v2 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [v2 enableSearchButton];
}

- (void)disableSearchButton
{
  id v2 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [v2 disableSearchButton];
}

- (void)_transitionToPanelView:(id)a3
{
  id v4 = a3;
  [(TVRUIControlPanelViewController *)self setCurrentButtonPanel:v4];
  double v5 = [(TVRUIControlPanelViewController *)self view];
  id v6 = [v5 subviews];
  if ([v6 count])
  {
    double v7 = [(TVRUIControlPanelViewController *)self view];
    id v8 = [v7 subviews];
    id v9 = [v8 objectAtIndexedSubscript:0];
    char v10 = [v9 isEqual:v4];

    if ((v10 & 1) == 0)
    {
      double v11 = (void *)MEMORY[0x263F82E00];
      double v12 = [(TVRUIControlPanelViewController *)self view];
      v13 = [v12 subviews];
      v14 = [v13 objectAtIndexedSubscript:0];
      [v11 transitionFromView:v14 toView:v4 duration:5242880 options:&__block_literal_global_9 completion:0.3];

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {
  }
  double v15 = [(TVRUIControlPanelViewController *)self view];
  double v16 = [v15 subviews];
  uint64_t v17 = [v16 count];

  if (!v17)
  {
    double v18 = [(TVRUIControlPanelViewController *)self view];
    [v18 addSubview:v4];

    double v12 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v19 = 0;
      _os_log_impl(&dword_227326000, v12, OS_LOG_TYPE_DEFAULT, "Adding buttonpanel as subview. not performing transition.", v19, 2u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __58__TVRUIControlPanelViewController__transitionToPanelView___block_invoke()
{
  v0 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_227326000, v0, OS_LOG_TYPE_DEFAULT, "Requested buttonpanel transition complete", v1, 2u);
  }
}

- (void)setDevice:(id)a3
{
  id v4 = a3;
  if ([v4 supportsTouchEvents])
  {
    double v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Device supports touch events. transitioning to touchpad buttonpanel", buf, 2u);
    }

    uint64_t v6 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
LABEL_11:
    double v11 = (void *)v6;
    [(TVRUIControlPanelViewController *)self _transitionToPanelView:v6];

    goto LABEL_15;
  }
  int v7 = [v4 isLegacyAppleTV];
  id v8 = _TVRUIViewControllerLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Device is legacy apple tv. transitioning to legacy buttonpanel", v14, 2u);
    }

    char v10 = [(TVRUIControlPanelViewController *)self legacyButtonPanel];

    if (!v10) {
      [(TVRUIControlPanelViewController *)self _createLegacyButtonPanel];
    }
    uint64_t v6 = [(TVRUIControlPanelViewController *)self legacyButtonPanel];
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Device does not support touch events. transitioning to generic button panel", v13, 2u);
  }

  [(TVRUIControlPanelViewController *)self _transitionToButtonPanelAndCreateIfNeeded];
LABEL_15:
  remoteDevice = self->_remoteDevice;
  self->_remoteDevice = (TVRUIDevice *)v4;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(TVRUIControlPanelViewController *)self _updateViewState];
  }
}

- (void)_updateViewState
{
  if ([(TVRUIControlPanelViewController *)self enabled])
  {
    [(TVRUIControlPanelViewController *)self _enableControls];
  }
  else
  {
    [(TVRUIControlPanelViewController *)self _disableControls];
  }
}

- (void)_disableControls
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) disableButtons:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  int v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Disabled all buttonpanels", v8, 2u);
  }
}

- (void)_enableControls
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(TVRUIControlPanelViewController *)self allButtonPanels];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) enableButtonsForDevice:self->_remoteDevice];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Enabled all buttonpanels", v9, 2u);
  }
}

- (void)transitonToViewForDeviceType:(int64_t)a3
{
  [(TVRUIControlPanelViewController *)self loadViewIfNeeded];
  uint64_t v5 = _TVRUIViewControllerLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 == 2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Generic TV type. Requesting transition to generic button panel.", buf, 2u);
    }

    [(TVRUIControlPanelViewController *)self _transitionToButtonPanelAndCreateIfNeeded];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Requesting transition to touch button panel", v7, 2u);
    }

    [(TVRUIControlPanelViewController *)self _transitionToTouchpadPanelAndCreateIfNeeded];
  }
}

- (void)_transitionToButtonPanelAndCreateIfNeeded
{
  uint64_t v3 = [(TVRUIControlPanelViewController *)self genericButtonPanel];

  if (!v3) {
    [(TVRUIControlPanelViewController *)self _createGenericControlButtonPanel];
  }
  id v4 = [(TVRUIControlPanelViewController *)self genericButtonPanel];
  [(TVRUIControlPanelViewController *)self _transitionToPanelView:v4];
}

- (void)_transitionToTouchpadPanelAndCreateIfNeeded
{
  uint64_t v3 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];

  if (!v3) {
    [(TVRUIControlPanelViewController *)self _createTouchpadButtonPanel];
  }
  id v4 = [(TVRUIControlPanelViewController *)self touchpadButtonPanel];
  [(TVRUIControlPanelViewController *)self _transitionToPanelView:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)buttonActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonActionsDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonActionsDelegate:(id)a3
{
}

- (TVRUIButtonPanelView)currentButtonPanel
{
  return self->_currentButtonPanel;
}

- (void)setCurrentButtonPanel:(id)a3
{
}

- (TVRUIButtonPanelView)touchpadButtonPanel
{
  return self->_touchpadButtonPanel;
}

- (void)setTouchpadButtonPanel:(id)a3
{
}

- (TVRUIButtonPanelView)genericButtonPanel
{
  return self->_genericButtonPanel;
}

- (void)setGenericButtonPanel:(id)a3
{
}

- (TVRUIButtonPanelView)panelWithKeyboardButton
{
  return self->_panelWithKeyboardButton;
}

- (void)setPanelWithKeyboardButton:(id)a3
{
}

- (TVRUIButtonPanelView)legacyButtonPanel
{
  return self->_legacyButtonPanel;
}

- (void)setLegacyButtonPanel:(id)a3
{
}

- (TVRUIButtonPanelView)legacyPanelWithKeyboardButton
{
  return self->_legacyPanelWithKeyboardButton;
}

- (void)setLegacyPanelWithKeyboardButton:(id)a3
{
}

- (TVRUIDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSMutableSet)allButtonPanels
{
  return self->_allButtonPanels;
}

- (void)setAllButtonPanels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allButtonPanels, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_legacyPanelWithKeyboardButton, 0);
  objc_storeStrong((id *)&self->_legacyButtonPanel, 0);
  objc_storeStrong((id *)&self->_panelWithKeyboardButton, 0);
  objc_storeStrong((id *)&self->_genericButtonPanel, 0);
  objc_storeStrong((id *)&self->_touchpadButtonPanel, 0);
  objc_storeStrong((id *)&self->_currentButtonPanel, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end