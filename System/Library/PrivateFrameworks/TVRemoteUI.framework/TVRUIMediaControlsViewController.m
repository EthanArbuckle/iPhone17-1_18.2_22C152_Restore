@interface TVRUIMediaControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_captionsButtonIsVisible;
- (BOOL)_shouldShowOverflowButton;
- (BOOL)enabled;
- (BOOL)isChannelButtonExpanded;
- (BOOL)isInfoButtonAvailable;
- (BOOL)wantsFastForwardButton;
- (CGRect)tipSourceRect;
- (NSArray)buttons;
- (TVRUIButton)guideButton;
- (TVRUIButton)infoButton;
- (TVRUIButton)skipBackwardButton;
- (TVRUIButton)skipForwardButton;
- (TVRUICaptionsButton)captionsButton;
- (TVRUIChannelButton)channelButton;
- (TVRUIDevice)device;
- (TVRUIStyleProvider)styleProvider;
- (TVRUITipManager)infoTipManager;
- (UIButton)overflowButton;
- (UIStackView)buttonStackView;
- (UIView)tipSourceView;
- (_TVRUIEventDelegate)buttonActionsDelegate;
- (id)_channelUpButtonView;
- (id)_overflowButtonMenu;
- (unint64_t)_enabledButtonCount;
- (unint64_t)availableButtons;
- (unint64_t)enabledButtons;
- (unint64_t)permittedArrowDirections;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_captionsTapped:(id)a3;
- (void)_createButtons;
- (void)_fastForwardTapped:(id)a3;
- (void)_infoButtonTapped:(id)a3;
- (void)_sendButtonPressed:(int64_t)a3;
- (void)_sendButtonReleased:(int64_t)a3;
- (void)_sendButtonTapped:(int64_t)a3;
- (void)_setupTipsControllerIfNeeded;
- (void)_skipBackwardLongPress:(id)a3;
- (void)_skipBackwardTapped:(id)a3;
- (void)_skipForwardLongPress:(id)a3;
- (void)_skipForwardTapped:(id)a3;
- (void)_updateButtonAvailability;
- (void)_updateButtonVisibilityWithCompletionHandler:(id)a3;
- (void)_updateInfoTipVisibility;
- (void)collapseChannelButton;
- (void)setAvailableButtons:(unint64_t)a3;
- (void)setAvailableButtons:(unint64_t)a3 enabledButtons:(unint64_t)a4;
- (void)setButtonActionsDelegate:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCaptionsButton:(id)a3;
- (void)setChannelButton:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledButtons:(unint64_t)a3;
- (void)setGuideButton:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setInfoTipManager:(id)a3;
- (void)setOverflowButton:(id)a3;
- (void)setSkipBackwardButton:(id)a3;
- (void)setSkipForwardButton:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setWantsFastForwardButton:(BOOL)a3;
- (void)updateButton:(unint64_t)a3 enabled:(BOOL)a4;
- (void)updateCaptionState:(BOOL)a3 buttonDisabled:(BOOL)a4;
- (void)updatePlaybackRate:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVRUIMediaControlsViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIMediaControlsViewController;
  [(TVRUIMediaControlsViewController *)&v5 viewDidLoad];
  [(TVRUIMediaControlsViewController *)self _createButtons];
  v3 = [MEMORY[0x263F825C8] clearColor];
  v4 = [(TVRUIMediaControlsViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(TVRUIMediaControlsViewController *)self _setupTipsControllerIfNeeded];
}

- (void)_createButtons
{
  v186[7] = *MEMORY[0x263EF8340];
  v3 = [[TVRUIButton alloc] initWithType:6 hasTapAction:1 buttonLocation:1];
  [(TVRUIMediaControlsViewController *)self setSkipForwardButton:v3];

  v4 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v5 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v6 = [v5 layer];
  [v6 setBorderColor:0];

  v7 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v8 = [v7 layer];
  [v8 setBorderWidth:0.0];

  v9 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  [v9 setAlpha:0.0];

  v10 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  [v10 setHidden:1];

  v11 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__skipForwardTapped_];
  [v11 setCancelsTouchesInView:0];
  v12 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v179 = v11;
  [v12 addGestureRecognizer:v11];

  uint64_t v13 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__skipForwardLongPress_];
  v14 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v178 = (void *)v13;
  [v14 addGestureRecognizer:v13];

  v15 = [[TVRUICaptionsButton alloc] initWithCaptionsEnabled:0 buttonLocation:1];
  [(TVRUIMediaControlsViewController *)self setCaptionsButton:v15];

  v16 = [(TVRUIMediaControlsViewController *)self captionsButton];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v18 = [v17 layer];
  [v18 setBorderColor:0];

  v19 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v20 = [v19 layer];
  [v20 setBorderWidth:0.0];

  v21 = [(TVRUIMediaControlsViewController *)self captionsButton];
  [v21 setAlpha:0.0];

  v22 = [(TVRUIMediaControlsViewController *)self captionsButton];
  [v22 setHidden:1];

  v23 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__captionsTapped_];
  [v23 setCancelsTouchesInView:0];
  v24 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v177 = v23;
  [v24 addGestureRecognizer:v23];

  v25 = [[TVRUIButton alloc] initWithType:9992 hasTapAction:1 buttonLocation:1];
  [(TVRUIMediaControlsViewController *)self setInfoButton:v25];

  v26 = [(TVRUIMediaControlsViewController *)self infoButton];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(TVRUIMediaControlsViewController *)self infoButton];
  v28 = [v27 layer];
  [v28 setBorderColor:0];

  v29 = [(TVRUIMediaControlsViewController *)self infoButton];
  v30 = [v29 layer];
  [v30 setBorderWidth:0.0];

  v31 = [(TVRUIMediaControlsViewController *)self infoButton];
  [v31 setHidden:1];

  v32 = [(TVRUIMediaControlsViewController *)self infoButton];
  [v32 addTarget:self action:sel__infoButtonTapped_ forControlEvents:64];

  v33 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83628] scale:3];
  v34 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle" withConfiguration:v33];
  v35 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v35 setImage:v34 forState:0];
  v36 = [(TVRUIMediaControlsViewController *)self styleProvider];
  v37 = [v36 primaryTextAndGlyphColor];
  [v35 setTintColor:v37];

  [v35 setOverrideUserInterfaceStyle:2];
  v38 = [(TVRUIMediaControlsViewController *)self _overflowButtonMenu];
  [v35 setMenu:v38];

  [v35 setShowsMenuAsPrimaryAction:1];
  [v35 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  [(TVRUIMediaControlsViewController *)self setOverflowButton:v35];
  v39 = [(TVRUIMediaControlsViewController *)self overflowButton];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(TVRUIMediaControlsViewController *)self overflowButton];
  v41 = [v40 layer];
  [v41 setBorderColor:0];

  v42 = [(TVRUIMediaControlsViewController *)self overflowButton];
  v43 = [v42 layer];
  [v43 setBorderWidth:0.0];

  v44 = [(TVRUIMediaControlsViewController *)self overflowButton];
  [v44 setAlpha:0.0];

  v45 = [(TVRUIMediaControlsViewController *)self overflowButton];
  [v45 setHidden:1];

  v46 = [[TVRUIButton alloc] initWithType:7 hasTapAction:1 buttonLocation:1];
  [(TVRUIMediaControlsViewController *)self setSkipBackwardButton:v46];

  v47 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

  v48 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v49 = [v48 layer];
  [v49 setBorderColor:0];

  v50 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v51 = [v50 layer];
  [v51 setBorderWidth:0.0];

  v52 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  [v52 setAlpha:0.0];

  v53 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  [v53 setHidden:1];

  v54 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__skipBackwardTapped_];
  [v54 setCancelsTouchesInView:0];
  v55 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v176 = v54;
  [v55 addGestureRecognizer:v54];

  uint64_t v56 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__skipBackwardLongPress_];
  v57 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v175 = (void *)v56;
  [v57 addGestureRecognizer:v56];

  v58 = [[TVRUIButton alloc] initWithType:28 hasTapAction:0 buttonLocation:1];
  [(TVRUIMediaControlsViewController *)self setGuideButton:v58];

  v59 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v60 addTarget:self action:sel__buttonPressed_ forControlEvents:1];

  v61 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v61 addTarget:self action:sel__buttonReleased_ forControlEvents:448];

  v62 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v62 setAlpha:0.0];

  v63 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v63 setHidden:1];

  v64 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v65 = [v64 localizedStringForKey:@"TVRemoteUIPageButtonText" value:&stru_26DB4CAE0 table:@"Localizable"];

  unint64_t v66 = [(TVRUIStyleProvider *)self->_styleProvider maxPagingTitleLength];
  if ([v65 length] > v66)
  {
    v67 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
      -[TVRUIButtonPanelView initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:]((uint64_t)v65, v66, v67);
    }

    uint64_t v68 = objc_msgSend(v65, "substringWithRange:", 0, 4);

    v65 = (void *)v68;
  }
  v69 = [TVRUIChannelButton alloc];
  v70 = [(TVRUIMediaControlsViewController *)self styleProvider];
  v174 = v65;
  v71 = [(TVRUIChannelButton *)v69 initWithTitle:v65 styleProvider:v70];
  channelButton = self->_channelButton;
  self->_channelButton = v71;

  v73 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  [(TVRUIChannelButton *)self->_channelButton setButtonEventDelegate:v73];

  v74 = [(TVRUIMediaControlsViewController *)self channelButton];
  [v74 setTranslatesAutoresizingMaskIntoConstraints:0];

  v75 = [(TVRUIMediaControlsViewController *)self channelButton];
  [v75 setAlpha:0.0];

  v76 = [(TVRUIMediaControlsViewController *)self channelButton];
  [v76 setHidden:1];

  v77 = [(TVRUIMediaControlsViewController *)self guideButton];
  v186[0] = v77;
  v78 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v186[1] = v78;
  v79 = [(TVRUIMediaControlsViewController *)self infoButton];
  v186[2] = v79;
  v80 = [(TVRUIMediaControlsViewController *)self overflowButton];
  v186[3] = v80;
  v81 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v186[4] = v81;
  v82 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v186[5] = v82;
  v83 = [(TVRUIMediaControlsViewController *)self channelButton];
  v186[6] = v83;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v186 count:7];
  buttons = self->_buttons;
  self->_buttons = v84;

  id v86 = objc_alloc(MEMORY[0x263F82BF8]);
  v87 = [(TVRUIMediaControlsViewController *)self view];
  [v87 frame];
  v88 = (UIStackView *)objc_msgSend(v86, "initWithFrame:");
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v88;

  [(UIStackView *)self->_buttonStackView setDistribution:4];
  [(UIStackView *)self->_buttonStackView setAlignment:3];
  [(UIStackView *)self->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v90 = [(TVRUIMediaControlsViewController *)self view];
  [v90 addSubview:self->_buttonStackView];

  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  v91 = [(TVRUIMediaControlsViewController *)self buttons];
  uint64_t v92 = [v91 countByEnumeratingWithState:&v180 objects:v185 count:16];
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v181;
    do
    {
      uint64_t v95 = 0;
      do
      {
        if (*(void *)v181 != v94) {
          objc_enumerationMutation(v91);
        }
        uint64_t v96 = *(void *)(*((void *)&v180 + 1) + 8 * v95);
        v97 = [(TVRUIMediaControlsViewController *)self buttonStackView];
        [v97 addArrangedSubview:v96];

        ++v95;
      }
      while (v93 != v95);
      uint64_t v93 = [v91 countByEnumeratingWithState:&v180 objects:v185 count:16];
    }
    while (v93);
  }

  v145 = (void *)MEMORY[0x263F08938];
  v173 = [(TVRUIMediaControlsViewController *)self buttonStackView];
  v171 = [v173 leadingAnchor];
  v172 = [(TVRUIMediaControlsViewController *)self view];
  v170 = [v172 leadingAnchor];
  v169 = [v171 constraintEqualToAnchor:v170 constant:10.0];
  v184[0] = v169;
  v168 = [(TVRUIMediaControlsViewController *)self buttonStackView];
  v166 = [v168 trailingAnchor];
  v167 = [(TVRUIMediaControlsViewController *)self view];
  v165 = [v167 trailingAnchor];
  v164 = [v166 constraintEqualToAnchor:v165 constant:-10.0];
  v184[1] = v164;
  v163 = [(TVRUIMediaControlsViewController *)self buttonStackView];
  v161 = [v163 topAnchor];
  v162 = [(TVRUIMediaControlsViewController *)self view];
  v160 = [v162 topAnchor];
  v159 = [v161 constraintEqualToAnchor:v160];
  v184[2] = v159;
  v158 = [(TVRUIMediaControlsViewController *)self buttonStackView];
  v156 = [v158 bottomAnchor];
  v157 = [(TVRUIMediaControlsViewController *)self view];
  v155 = [v157 bottomAnchor];
  v154 = [v156 constraintEqualToAnchor:v155];
  v184[3] = v154;
  v153 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v151 = [v153 widthAnchor];
  v152 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v152 mediaControlsButtonSize];
  v150 = objc_msgSend(v151, "constraintEqualToConstant:");
  v184[4] = v150;
  v149 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  v147 = [v149 heightAnchor];
  v148 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v148 mediaControlsButtonSize];
  v146 = [v147 constraintEqualToConstant:v98];
  v184[5] = v146;
  v144 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v142 = [v144 widthAnchor];
  v143 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v143 mediaControlsButtonSize];
  v141 = objc_msgSend(v142, "constraintEqualToConstant:");
  v184[6] = v141;
  v140 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  v138 = [v140 heightAnchor];
  v139 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v139 mediaControlsButtonSize];
  v137 = [v138 constraintEqualToConstant:v99];
  v184[7] = v137;
  v136 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v134 = [v136 widthAnchor];
  v135 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v135 captionButtonSize];
  v133 = objc_msgSend(v134, "constraintEqualToConstant:");
  v184[8] = v133;
  v132 = [(TVRUIMediaControlsViewController *)self captionsButton];
  v130 = [v132 heightAnchor];
  v131 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v131 captionButtonSize];
  v129 = [v130 constraintEqualToConstant:v100];
  v184[9] = v129;
  v128 = [(TVRUIMediaControlsViewController *)self infoButton];
  v126 = [v128 widthAnchor];
  v127 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v127 mediaControlsButtonSize];
  v125 = objc_msgSend(v126, "constraintEqualToConstant:");
  v184[10] = v125;
  v124 = [(TVRUIMediaControlsViewController *)self infoButton];
  v122 = [v124 heightAnchor];
  v123 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v123 mediaControlsButtonSize];
  v121 = [v122 constraintEqualToConstant:v101];
  v184[11] = v121;
  v120 = [(TVRUIMediaControlsViewController *)self guideButton];
  v118 = [v120 widthAnchor];
  v119 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v119 mediaControlsButtonSize];
  v117 = objc_msgSend(v118, "constraintEqualToConstant:");
  v184[12] = v117;
  v116 = [(TVRUIMediaControlsViewController *)self guideButton];
  v114 = [v116 heightAnchor];
  v115 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v115 mediaControlsButtonSize];
  v103 = [v114 constraintEqualToConstant:v102];
  v184[13] = v103;
  v104 = [(TVRUIMediaControlsViewController *)self channelButton];
  v105 = [v104 widthAnchor];
  v106 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v106 mediaControlsButtonSize];
  v107 = objc_msgSend(v105, "constraintEqualToConstant:");
  v184[14] = v107;
  v108 = [(TVRUIMediaControlsViewController *)self channelButton];
  v109 = [v108 heightAnchor];
  v110 = [(TVRUIMediaControlsViewController *)self styleProvider];
  [v110 mediaControlsButtonSize];
  v112 = [v109 constraintEqualToConstant:v111];
  v184[15] = v112;
  v113 = [MEMORY[0x263EFF8C0] arrayWithObjects:v184 count:16];
  [v145 activateConstraints:v113];
}

- (id)_overflowButtonMenu
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x263F82658];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke;
  v9[3] = &unk_264800DA0;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  v4 = [v3 elementWithUncachedProvider:v9];
  objc_super v5 = (void *)MEMORY[0x263F82940];
  v12[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  v7 = [v5 menuWithChildren:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    char v24 = [WeakRetained _captionsButtonIsVisible];
    v6 = [v5 captionsButton];
    uint64_t v7 = [v6 captionsEnabled];

    v8 = [v5 infoButton];
    char v9 = [v8 isEnabled];

    id v10 = [v5 styleProvider];
    v26 = [v10 iconForButtonType:9992];

    v11 = [v5 styleProvider];
    v25 = [v11 captionsButtonIcon:v7];

    v12 = (void *)MEMORY[0x263F823D0];
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"TVRUIViewInfo" value:&stru_26DB4CAE0 table:@"Localizable"];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_2;
    v29[3] = &unk_264800190;
    id location = &v30;
    objc_copyWeak(&v30, (id *)(a1 + 40));
    v15 = [v12 actionWithTitle:v14 image:v26 identifier:0 handler:v29];

    if ((v9 & 1) == 0) {
      objc_msgSend(v15, "setAttributes:", 1, &v30);
    }
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v7) {
      [v16 localizedStringForKey:@"TVRUIDisableCaptions" value:&stru_26DB4CAE0 table:@"Localizable"];
    }
    else {
    v17 = [v16 localizedStringForKey:@"TVRUIEnableCaptions" value:&stru_26DB4CAE0 table:@"Localizable"];
    }

    v18 = (void *)MEMORY[0x263F823D0];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_3;
    v27[3] = &unk_264800190;
    objc_copyWeak(&v28, (id *)(a1 + 40));
    v19 = [v18 actionWithTitle:v17 image:v25 identifier:0 handler:v27];
    v20 = v19;
    if ((v24 & 1) == 0) {
      [v19 setAttributes:1];
    }
    v31[0] = v20;
    v31[1] = v15;
    v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v31, 2, location);
    v3[2](v3, v21);

    objc_destroyWeak(&v28);
    objc_destroyWeak(locationa);
  }
  else
  {
    v3[2](v3, (void *)MEMORY[0x263EFFA68]);
  }
}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _infoButtonTapped:0];
}

void __55__TVRUIMediaControlsViewController__overflowButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _captionsTapped:0];
}

- (void)setAvailableButtons:(unint64_t)a3 enabledButtons:(unint64_t)a4
{
  if ([(TVRUIMediaControlsViewController *)self availableButtons] != a3)
  {
    [(TVRUIMediaControlsViewController *)self setAvailableButtons:a3];
    [(TVRUIMediaControlsViewController *)self setEnabledButtons:a4];
    unint64_t v7 = [(TVRUIMediaControlsViewController *)self availableButtons];
    if (a3 || !v7)
    {
      [(TVRUIMediaControlsViewController *)self _updateButtonAvailability];
      [(TVRUIMediaControlsViewController *)self _updateButtonVisibilityWithCompletionHandler:0];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __71__TVRUIMediaControlsViewController_setAvailableButtons_enabledButtons___block_invoke;
      v8[3] = &unk_2647FFF70;
      v8[4] = self;
      [(TVRUIMediaControlsViewController *)self _updateButtonVisibilityWithCompletionHandler:v8];
    }
  }
}

uint64_t __71__TVRUIMediaControlsViewController_setAvailableButtons_enabledButtons___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonAvailability];
}

- (void)_updateInfoTipVisibility
{
  if ([(TVRUIMediaControlsViewController *)self enabled]
    && [(TVRUIMediaControlsViewController *)self isInfoButtonAvailable]
    && ([(TVRUIMediaControlsViewController *)self enabledButtons] & 8) != 0)
  {
    id v3 = [(TVRUIMediaControlsViewController *)self infoTipManager];
    [v3 activate];
  }
  else
  {
    id v3 = [(TVRUIMediaControlsViewController *)self infoTipManager];
    [v3 invalidate:1 completion:0];
  }
}

- (BOOL)_captionsButtonIsVisible
{
  return ([(TVRUIMediaControlsViewController *)self enabledButtons] >> 1) & 1;
}

- (BOOL)_shouldShowOverflowButton
{
  if ([(TVRUIMediaControlsViewController *)self _enabledButtonCount] < 5) {
    return 0;
  }
  return [(TVRUIMediaControlsViewController *)self isInfoButtonAvailable];
}

- (void)_setupTipsControllerIfNeeded
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(TVRUIMediaControlsViewController *)self infoTipManager];

  if (!v3)
  {
    v4 = _TVRUITipsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v5 = [MEMORY[0x263F086E0] mainBundle];
      v6 = [v5 bundleIdentifier];
      int v8 = 138412290;
      char v9 = v6;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Creating Info Tip Manager for: %@", (uint8_t *)&v8, 0xCu);
    }
    unint64_t v7 = [[TVRUITipManager alloc] initWithTipSourceViewProvider:self tipType:0];
    [(TVRUIMediaControlsViewController *)self setInfoTipManager:v7];
  }
}

- (void)updateButton:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(TVRUIMediaControlsViewController *)self availableButtons] & a3) != 0)
  {
    if (v4) {
      unint64_t v7 = [(TVRUIMediaControlsViewController *)self enabledButtons] | a3;
    }
    else {
      unint64_t v7 = [(TVRUIMediaControlsViewController *)self enabledButtons] & ~a3;
    }
    [(TVRUIMediaControlsViewController *)self setEnabledButtons:v7];
    [(TVRUIMediaControlsViewController *)self _updateButtonVisibilityWithCompletionHandler:0];
  }
}

- (BOOL)isChannelButtonExpanded
{
  v2 = [(TVRUIMediaControlsViewController *)self channelButton];
  char v3 = [v2 isExpanded];

  return v3;
}

- (void)updateCaptionState:(BOOL)a3 buttonDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(TVRUIMediaControlsViewController *)self captionsButton];
  [v7 setCaptionsEnabled:v5];

  [(TVRUIMediaControlsViewController *)self updateButton:2 enabled:!v4];
  int v8 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v5;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "enableCaptions %{BOOL}d, buttonDisabled: %{BOOL}d", (uint8_t *)v9, 0xEu);
  }
}

- (void)updatePlaybackRate:(id)a3
{
  [a3 doubleValue];
  if (!a3
    || ((v6 = fabs(v5 + -1.0), double v7 = fabs(v5), v6 >= 0.00000011920929) ? (v8 = v7 < 0.00000011920929) : (v8 = 1), v8))
  {
    [(TVRUIMediaControlsViewController *)self setWantsFastForwardButton:0];
    char v9 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
    [v9 _updateButtonType:6];

    BOOL v11 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
    id v13 = v11;
    uint64_t v12 = 7;
  }
  else
  {
    -[TVRUIMediaControlsViewController setWantsFastForwardButton:](self, "setWantsFastForwardButton:", 1, v7);
    __int16 v10 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
    [v10 _updateButtonType:9995];

    BOOL v11 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
    id v13 = v11;
    uint64_t v12 = 9996;
  }
  [v11 _updateButtonType:v12];
}

- (void)collapseChannelButton
{
  id v2 = [(TVRUIMediaControlsViewController *)self channelButton];
  [v2 collapse];
}

- (BOOL)isInfoButtonAvailable
{
  return ([(TVRUIMediaControlsViewController *)self availableButtons] >> 3) & 1;
}

- (void)_updateButtonAvailability
{
  BOOL v3 = ([(TVRUIMediaControlsViewController *)self availableButtons] & 1) == 0;
  BOOL v4 = [(TVRUIMediaControlsViewController *)self skipBackwardButton];
  [v4 setHidden:v3];

  double v5 = [(TVRUIMediaControlsViewController *)self skipForwardButton];
  [v5 setHidden:v3];

  BOOL v6 = ([(TVRUIMediaControlsViewController *)self availableButtons] & 2) == 0;
  double v7 = [(TVRUIMediaControlsViewController *)self captionsButton];
  [v7 setHidden:v6];

  BOOL v8 = ([(TVRUIMediaControlsViewController *)self availableButtons] & 4) == 0;
  char v9 = [(TVRUIMediaControlsViewController *)self guideButton];
  [v9 setHidden:v8];

  __int16 v10 = [(TVRUIMediaControlsViewController *)self channelButton];
  [v10 setHidden:v8];

  uint64_t v11 = [(TVRUIMediaControlsViewController *)self isInfoButtonAvailable] ^ 1;
  uint64_t v12 = [(TVRUIMediaControlsViewController *)self infoButton];
  [v12 setHidden:v11];

  if ([(TVRUIMediaControlsViewController *)self _shouldShowOverflowButton])
  {
    id v13 = [(TVRUIMediaControlsViewController *)self infoButton];
    [v13 setHidden:1];

    v14 = [(TVRUIMediaControlsViewController *)self captionsButton];
    [v14 setHidden:1];

    v15 = [(TVRUIMediaControlsViewController *)self overflowButton];
    id v17 = v15;
    uint64_t v16 = 0;
  }
  else
  {
    v15 = [(TVRUIMediaControlsViewController *)self overflowButton];
    id v17 = v15;
    uint64_t v16 = 1;
  }
  [v15 setHidden:v16];
}

- (unint64_t)_enabledButtonCount
{
  uint64_t v3 = 0;
  for (uint64_t i = 0; i != 32; ++i)
    v3 += ([(TVRUIMediaControlsViewController *)self availableButtons] >> i) & 1;
  return ([(TVRUIMediaControlsViewController *)self availableButtons] & 1) + v3;
}

- (void)_updateButtonVisibilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVRUIMediaControlsViewController *)self enabled] ^ 1;
  BOOL v6 = [(TVRUIMediaControlsViewController *)self view];
  [v6 setHidden:v5];

  BOOL v7 = [(TVRUIMediaControlsViewController *)self enabled];
  BOOL v8 = [(TVRUIMediaControlsViewController *)self view];
  [v8 setUserInteractionEnabled:v7];

  char v9 = (void *)MEMORY[0x263F82E00];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke;
  v13[3] = &unk_2647FFF70;
  v13[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_264800DC8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 animateWithDuration:v13 animations:v11 completion:0.2];
}

void __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) enabledButtons];
  if (v3)
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      int v4 = 0;
      double v5 = 1.0;
    }
    else
    {
      v1 = [*(id *)(a1 + 32) styleProvider];
      [v1 disabledButtonAlpha];
      double v5 = v6;
      int v4 = 1;
    }
  }
  else
  {
    int v4 = 0;
    double v5 = 0.0;
  }
  BOOL v7 = [*(id *)(a1 + 32) skipBackwardButton];
  [v7 setAlpha:v5];

  if (v4) {
  if (v3)
  }
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      int v8 = 0;
      double v9 = 1.0;
    }
    else
    {
      uint64_t v3 = [*(id *)(a1 + 32) styleProvider];
      [(id)v3 disabledButtonAlpha];
      double v9 = v10;
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 0;
    double v9 = 0.0;
  }
  uint64_t v11 = [*(id *)(a1 + 32) skipForwardButton];
  [v11 setAlpha:v9];

  if (v8) {
  uint64_t v12 = [*(id *)(a1 + 32) availableButtons];
  }
  unint64_t v13 = [*(id *)(a1 + 32) enabledButtons];
  if ((v13 & 2) != 0) {
    uint64_t v14 = [*(id *)(a1 + 32) enabled];
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = [*(id *)(a1 + 32) captionsButton];
  [v15 setEnabled:v14];

  if ([*(id *)(a1 + 32) enabled])
  {
    uint64_t v16 = [*(id *)(a1 + 32) captionsButton];
    char v17 = [v16 isEnabled];

    if ((v17 & 1) == 0)
    {
      v18 = [*(id *)(a1 + 32) captionsButton];
      [v18 setCaptionsEnabled:0];
    }
  }
  if ((v13 & 2) != 0)
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      LODWORD(v19) = 0;
      BOOL v20 = 0;
      double v21 = 1.0;
      goto LABEL_27;
    }
  }
  else if ((v12 & 2) == 0)
  {
    LODWORD(v19) = 0;
    BOOL v20 = 0;
    double v21 = 0.0;
    goto LABEL_27;
  }
  uint64_t v12 = [*(id *)(a1 + 32) styleProvider];
  uint64_t v19 = (v13 >> 1) & 1;
  BOOL v20 = (v13 & 2) == 0;
  [(id)v12 disabledButtonAlpha];
  double v21 = v22;
LABEL_27:
  v23 = [*(id *)(a1 + 32) captionsButton];
  [v23 setAlpha:v21];

  if (v20) {
  if (v19)
  }

  uint64_t v24 = [*(id *)(a1 + 32) enabledButtons];
  if ((v24 & 4) != 0)
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      int v25 = 0;
      double v26 = 1.0;
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 32) styleProvider];
      [(id)v12 disabledButtonAlpha];
      double v26 = v27;
      int v25 = 1;
    }
  }
  else
  {
    int v25 = 0;
    double v26 = 0.0;
  }
  id v28 = [*(id *)(a1 + 32) guideButton];
  [v28 setAlpha:v26];

  if (v25) {
  if ((v24 & 4) != 0)
  }
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      int v29 = 0;
      double v30 = 1.0;
    }
    else
    {
      uint64_t v24 = [*(id *)(a1 + 32) styleProvider];
      [(id)v24 disabledButtonAlpha];
      double v30 = v31;
      int v29 = 1;
    }
  }
  else
  {
    int v29 = 0;
    double v30 = 0.0;
  }
  v32 = [*(id *)(a1 + 32) channelButton];
  [v32 setAlpha:v30];

  if (v29) {
  uint64_t v33 = [*(id *)(a1 + 32) availableButtons];
  }
  unint64_t v34 = [*(id *)(a1 + 32) enabledButtons];
  if ((v34 & 8) != 0)
  {
    uint64_t v33 = [*(id *)(a1 + 32) enabled];
    v35 = [*(id *)(a1 + 32) infoButton];
    [v35 setEnabled:v33];

    if ([*(id *)(a1 + 32) enabled])
    {
      LODWORD(v36) = 0;
      BOOL v37 = 0;
      double v38 = 1.0;
      goto LABEL_51;
    }
  }
  else
  {
    v39 = [*(id *)(a1 + 32) infoButton];
    [v39 setEnabled:0];

    if ((v33 & 8) == 0)
    {
      LODWORD(v36) = 0;
      BOOL v37 = 0;
      double v38 = 0.0;
      goto LABEL_51;
    }
  }
  uint64_t v33 = [*(id *)(a1 + 32) styleProvider];
  uint64_t v36 = (v34 >> 3) & 1;
  BOOL v37 = (v34 & 8) == 0;
  [(id)v33 disabledButtonAlpha];
  double v38 = v40;
LABEL_51:
  v41 = [*(id *)(a1 + 32) infoButton];
  [v41 setAlpha:v38];

  if (v37) {
  if (v36)
  }

  uint64_t v42 = [*(id *)(a1 + 32) _shouldShowOverflowButton];
  v43 = [*(id *)(a1 + 32) overflowButton];
  [v43 setEnabled:v42];

  if (v42)
  {
    if ([*(id *)(a1 + 32) enabled])
    {
      LODWORD(v42) = 0;
      double v44 = 1.0;
    }
    else
    {
      id v47 = [*(id *)(a1 + 32) styleProvider];
      [v47 disabledButtonAlpha];
      double v44 = v45;
      LODWORD(v42) = 1;
    }
  }
  else
  {
    double v44 = 0.0;
  }
  v46 = [*(id *)(a1 + 32) overflowButton];
  [v46 setAlpha:v44];

  if (v42)
  {
  }
}

uint64_t __81__TVRUIMediaControlsViewController__updateButtonVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateInfoTipVisibility];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_skipForwardTapped:(id)a3
{
  if ([(TVRUIMediaControlsViewController *)self wantsFastForwardButton]) {
    uint64_t v4 = 15;
  }
  else {
    uint64_t v4 = 6;
  }
  [(TVRUIMediaControlsViewController *)self _sendButtonTapped:v4];
}

- (void)_fastForwardTapped:(id)a3
{
}

- (void)_skipForwardLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(TVRUIMediaControlsViewController *)self _sendButtonPressed:15];
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    [(TVRUIMediaControlsViewController *)self _sendButtonReleased:15];
  }
}

- (void)_infoButtonTapped:(id)a3
{
}

- (void)_skipBackwardTapped:(id)a3
{
  if ([(TVRUIMediaControlsViewController *)self wantsFastForwardButton]) {
    uint64_t v4 = 14;
  }
  else {
    uint64_t v4 = 7;
  }
  [(TVRUIMediaControlsViewController *)self _sendButtonTapped:v4];
}

- (void)_skipBackwardLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(TVRUIMediaControlsViewController *)self _sendButtonPressed:14];
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    [(TVRUIMediaControlsViewController *)self _sendButtonReleased:14];
  }
}

- (void)_captionsTapped:(id)a3
{
  id v4 = [(TVRUIMediaControlsViewController *)self captionsButton];
  int v5 = [v4 captionsEnabled];

  if (v5) {
    uint64_t v6 = 18;
  }
  else {
    uint64_t v6 = 17;
  }
  [(TVRUIMediaControlsViewController *)self _sendButtonTapped:v6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TVRUIMediaControlsViewController__captionsTapped___block_invoke;
  v7[3] = &unk_264800DF0;
  v7[4] = self;
  char v8 = v5;
  objc_msgSend(MEMORY[0x263F158F8], "bs_performAfterSynchronizedCommit:", v7);
}

void __52__TVRUIMediaControlsViewController__captionsTapped___block_invoke(uint64_t a1)
{
  BOOL v1 = *(unsigned char *)(a1 + 40) == 0;
  id v2 = [*(id *)(a1 + 32) captionsButton];
  [v2 setCaptionsEnabled:v1];
}

- (void)_sendButtonTapped:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:0 buttonType:a3];
  uint64_t v4 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  if (v4)
  {
    int v5 = (void *)v4;
    uint64_t v6 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_sendButtonPressed:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:a3];
  uint64_t v4 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  if (v4)
  {
    int v5 = (void *)v4;
    uint64_t v6 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_sendButtonReleased:(int64_t)a3
{
  id v9 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:a3];
  uint64_t v4 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  if (v4)
  {
    int v5 = (void *)v4;
    uint64_t v6 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonPressed:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  if (v4)
  {
    int v5 = (void *)v4;
    uint64_t v6 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonReleased:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
  if (v4)
  {
    int v5 = (void *)v4;
    uint64_t v6 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(TVRUIMediaControlsViewController *)self buttonActionsDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"enabled";
    if (self->_enabled) {
      char v7 = @"enabled";
    }
    else {
      char v7 = @"disabled";
    }
    if (!v3) {
      uint64_t v6 = @"disabled";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Setting media controls from %@ to %@", (uint8_t *)&v8, 0x16u);
  }

  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    [(TVRUIMediaControlsViewController *)self _updateButtonAvailability];
    [(TVRUIMediaControlsViewController *)self _updateButtonVisibilityWithCompletionHandler:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_channelUpButtonView
{
  id v2 = [(TVRUIMediaControlsViewController *)self channelButton];
  BOOL v3 = [v2 _channelUpButton];

  return v3;
}

- (UIView)tipSourceView
{
  id v2 = [(TVRUIMediaControlsViewController *)self infoButton];
  BOOL v3 = [v2 imageView];

  return (UIView *)v3;
}

- (CGRect)tipSourceRect
{
  id v2 = [(TVRUIMediaControlsViewController *)self infoButton];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)permittedArrowDirections
{
  return 2;
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

- (unint64_t)availableButtons
{
  return self->_availableButtons;
}

- (void)setAvailableButtons:(unint64_t)a3
{
  self->_availableButtons = a3;
}

- (unint64_t)enabledButtons
{
  return self->_enabledButtons;
}

- (void)setEnabledButtons:(unint64_t)a3
{
  self->_enabledButtons = a3;
}

- (TVRUIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
}

- (TVRUIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
}

- (TVRUICaptionsButton)captionsButton
{
  return self->_captionsButton;
}

- (void)setCaptionsButton:(id)a3
{
}

- (TVRUIButton)guideButton
{
  return self->_guideButton;
}

- (void)setGuideButton:(id)a3
{
}

- (TVRUIChannelButton)channelButton
{
  return self->_channelButton;
}

- (void)setChannelButton:(id)a3
{
}

- (TVRUIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
}

- (UIButton)overflowButton
{
  return self->_overflowButton;
}

- (void)setOverflowButton:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (BOOL)wantsFastForwardButton
{
  return self->_wantsFastForwardButton;
}

- (void)setWantsFastForwardButton:(BOOL)a3
{
  self->_wantsFastForwardButton = a3;
}

- (TVRUITipManager)infoTipManager
{
  return self->_infoTipManager;
}

- (void)setInfoTipManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoTipManager, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_overflowButton, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_channelButton, 0);
  objc_storeStrong((id *)&self->_guideButton, 0);
  objc_storeStrong((id *)&self->_captionsButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end