@interface TVRUITopButtonPanelViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)enabled;
- (NSArray)buttons;
- (TVRUIButton)guideButton;
- (TVRUIButton)muteButton;
- (TVRUIButton)powerButton;
- (TVRUIDevice)device;
- (TVRUIStyleProvider)styleProvider;
- (_TVRUIEventDelegate)buttonEventDelegate;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_updateButtonsShapes;
- (void)_updateViewState;
- (void)setButtonEventDelegate:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGuideButton:(id)a3;
- (void)setMuteButton:(id)a3;
- (void)setPowerButton:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setVolumeControlAvailable:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVRUITopButtonPanelViewController

- (void)viewDidLoad
{
  v96[3] = *MEMORY[0x263EF8340];
  v93.receiver = self;
  v93.super_class = (Class)TVRUITopButtonPanelViewController;
  [(TVRUITopButtonPanelViewController *)&v93 viewDidLoad];
  v3 = [[TVRUIButton alloc] initWithType:29 hasTapAction:0];
  [(TVRUITopButtonPanelViewController *)self setMuteButton:v3];

  v4 = [[TVRUIButton alloc] initWithType:28 hasTapAction:0];
  [(TVRUITopButtonPanelViewController *)self setGuideButton:v4];

  v5 = [[TVRUIButton alloc] initWithType:30 hasTapAction:0];
  [(TVRUITopButtonPanelViewController *)self setPowerButton:v5];

  v6 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v96[0] = v6;
  v7 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v96[1] = v7;
  v8 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v96[2] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:3];
  [(TVRUITopButtonPanelViewController *)self setButtons:v9];

  [(TVRUITopButtonPanelViewController *)self _updateButtonsShapes];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v10 = [(TVRUITopButtonPanelViewController *)self buttons];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v90 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v16 = [(TVRUITopButtonPanelViewController *)self view];
        [v16 addSubview:v15];

        [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v15 addTarget:self action:sel__buttonPressed_ forControlEvents:1];
        [v15 addTarget:self action:sel__buttonReleased_ forControlEvents:448];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v12);
  }

  v17 = [(TVRUITopButtonPanelViewController *)self styleProvider];
  [v17 controlPanelInsets];
  double v19 = v18;
  double v21 = v20;

  v61 = (void *)MEMORY[0x263F08938];
  v87 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v85 = [v87 leftAnchor];
  v86 = [(TVRUITopButtonPanelViewController *)self view];
  v84 = [v86 leftAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:v19];
  v94[0] = v83;
  v82 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v80 = [v82 centerYAnchor];
  v81 = [(TVRUITopButtonPanelViewController *)self view];
  v79 = [v81 centerYAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v94[1] = v78;
  v77 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v75 = [v77 heightAnchor];
  v76 = [(TVRUITopButtonPanelViewController *)self view];
  v74 = [v76 heightAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v94[2] = v73;
  v72 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v70 = [v72 widthAnchor];
  v71 = [(TVRUITopButtonPanelViewController *)self muteButton];
  v69 = [v71 heightAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v94[3] = v68;
  v67 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v65 = [v67 centerXAnchor];
  v66 = [(TVRUITopButtonPanelViewController *)self view];
  v64 = [v66 centerXAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v94[4] = v63;
  v62 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v59 = [v62 centerYAnchor];
  v60 = [(TVRUITopButtonPanelViewController *)self view];
  v58 = [v60 centerYAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v94[5] = v57;
  v56 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v54 = [v56 heightAnchor];
  v55 = [(TVRUITopButtonPanelViewController *)self view];
  v53 = [v55 heightAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v94[6] = v52;
  v51 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v49 = [v51 widthAnchor];
  v50 = [(TVRUITopButtonPanelViewController *)self guideButton];
  v48 = [v50 heightAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v94[7] = v47;
  v46 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v44 = [v46 rightAnchor];
  v45 = [(TVRUITopButtonPanelViewController *)self view];
  v43 = [v45 rightAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:-v21];
  v94[8] = v42;
  v41 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v39 = [v41 centerYAnchor];
  v40 = [(TVRUITopButtonPanelViewController *)self view];
  v38 = [v40 centerYAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v94[9] = v37;
  v36 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v35 = [v36 heightAnchor];
  v22 = [(TVRUITopButtonPanelViewController *)self view];
  v23 = [v22 heightAnchor];
  v24 = [v35 constraintEqualToAnchor:v23];
  v94[10] = v24;
  v25 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v26 = [v25 widthAnchor];
  v27 = [(TVRUITopButtonPanelViewController *)self powerButton];
  v28 = [v27 heightAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  v94[11] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:12];
  [v61 activateConstraints:v30];

  v31 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v32 = *MEMORY[0x263F8B158];
  v33 = [MEMORY[0x263F08A48] mainQueue];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __48__TVRUITopButtonPanelViewController_viewDidLoad__block_invoke;
  v88[3] = &unk_264800A88;
  v88[4] = self;
  id v34 = (id)[v31 addObserverForName:v32 object:0 queue:v33 usingBlock:v88];
}

uint64_t __48__TVRUITopButtonPanelViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonsShapes];
}

- (void)setDevice:(id)a3
{
  v5 = (TVRUIDevice *)a3;
  p_device = &self->_device;
  if (self->_device != v5)
  {
    uint64_t v13 = v5;
    objc_storeStrong((id *)&self->_device, a3);
    uint64_t v7 = [(TVRUIDevice *)*p_device supportsMute];
    v8 = [(TVRUITopButtonPanelViewController *)self muteButton];
    [v8 setEnabled:v7];

    uint64_t v9 = [(TVRUIDevice *)*p_device supportsGuide];
    v10 = [(TVRUITopButtonPanelViewController *)self guideButton];
    [v10 setEnabled:v9];

    uint64_t v11 = [(TVRUIDevice *)*p_device supportsPower];
    uint64_t v12 = [(TVRUITopButtonPanelViewController *)self powerButton];
    [v12 setEnabled:v11];

    v5 = v13;
  }
}

- (void)setStyleProvider:(id)a3
{
  v5 = (TVRUIStyleProvider *)a3;
  p_styleProvider = &self->_styleProvider;
  if (self->_styleProvider != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_styleProvider, a3);
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_styleProvider, v5);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(TVRUITopButtonPanelViewController *)self _updateViewState];
  }
}

- (void)_updateViewState
{
  double v3 = 1.0;
  if (![(TVRUITopButtonPanelViewController *)self enabled])
  {
    v4 = [(TVRUITopButtonPanelViewController *)self styleProvider];
    [v4 disabledButtonAlpha];
    double v3 = v5;
  }
  v6 = [(TVRUITopButtonPanelViewController *)self view];
  [v6 setAlpha:v3];

  uint64_t v7 = [(TVRUITopButtonPanelViewController *)self muteButton];
  [v7 setAlpha:v3];

  v8 = [(TVRUITopButtonPanelViewController *)self guideButton];
  [v8 setAlpha:v3];

  id v9 = [(TVRUITopButtonPanelViewController *)self powerButton];
  [v9 setAlpha:v3];
}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v7 = [(TVRUITopButtonPanelViewController *)self device];
    uint64_t v5 = [v7 supportsMute];
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = [(TVRUITopButtonPanelViewController *)self muteButton];
  [v6 setEnabled:v5];

  if (v3)
  {
  }
}

- (void)_buttonPressed:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonReleased:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    v6 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(TVRUITopButtonPanelViewController *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_updateButtonsShapes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(TVRUITopButtonPanelViewController *)self buttons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        [v8 setHasButtonShape:_AXSButtonShapesEnabled() != 0];
        if ([v8 hasButtonShape])
        {
          id v9 = [(TVRUITopButtonPanelViewController *)self styleProvider];
          v10 = [v9 buttonBackgroundColor];
          [v8 setBackgroundColor:v10];
        }
        else
        {
          [v8 setBackgroundColor:0];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonEventDelegate:(id)a3
{
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (TVRUIButton)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
}

- (TVRUIButton)guideButton
{
  return self->_guideButton;
}

- (void)setGuideButton:(id)a3
{
}

- (TVRUIButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_guideButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end