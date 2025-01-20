@interface TVRUIDevicePickerViewController
- (BOOL)_accessibilityFontSizesEnabled;
- (BOOL)_canShowWhileLocked;
- (BOOL)canPresentTip;
- (BOOL)contextMenuNeedsUpdate;
- (BOOL)enabled;
- (BOOL)isDevicePickerShowing;
- (BOOL)tipSourceSupportsSiri;
- (CGRect)_preferredTableViewFrameWhenExpanded:(BOOL)a3;
- (CGRect)tipSourceRect;
- (NSArray)buttons;
- (NSArray)devices;
- (NSArray)suggestedDevices;
- (NSIndexPath)connectedDeviceIndex;
- (NSString)deviceTitle;
- (TVREventHaptic)eventHaptic;
- (TVRUIButton)muteButton;
- (TVRUIButton)powerButton;
- (TVRUICubicSpringAnimator)hideAnimator;
- (TVRUICubicSpringAnimator)showAnimator;
- (TVRUIDevice)device;
- (TVRUIDevicePickerDelegate)delegate;
- (TVRUIMenuProvider)menuProvider;
- (TVRUIStyleProvider)styleProvider;
- (TVRUITitleView)deviceTitleView;
- (UIButton)muteButtonOverride;
- (UIButton)titleButton;
- (UITableView)tableView;
- (UIView)nearbySectionTitleView;
- (UIView)tableViewBottomSeperator;
- (UIView)tableViewTopSeperator;
- (UIView)tipSourceView;
- (UIView)titleView;
- (_TVRUIEventDelegate)buttonEventDelegate;
- (_TVRUITableViewWrapperView)tableViewWrapper;
- (double)_calculatedContentHeight;
- (double)_contentHeightForPreferredContentSizeCategory;
- (double)_defaultCalculatedContentHeight;
- (double)_expandedContentHeight;
- (double)baseHeight;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_lastVisibleCellSupportingFindMy;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)permittedArrowDirections;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_device:(id)a3 updatedFindMySupported:(BOOL)a4;
- (void)_setupAnimators;
- (void)_setupButtons;
- (void)_setupDeviceList;
- (void)_setupDeviceTitleView;
- (void)_setupTitleButtonIfNeeded;
- (void)_sortAndReloadDevices;
- (void)_titleWasLongPressed:(id)a3;
- (void)_toggleState;
- (void)_updateButtonsShapes;
- (void)_updateDevice;
- (void)_updateDeviceNameAutomationIdentifier:(id)a3;
- (void)_updateDevicesWithSuggestionsAndReload;
- (void)_updateTableFrame:(BOOL)a3;
- (void)_updateTitleViewForDevice:(id)a3;
- (void)_updateViewState;
- (void)collapseDeviceList;
- (void)didChangeToExpanded:(BOOL)a3;
- (void)didTapWrapperView:(id)a3;
- (void)expandDeviceList;
- (void)loadView;
- (void)resetSelectedDevice;
- (void)setBaseHeight:(double)a3;
- (void)setButtonEventDelegate:(id)a3;
- (void)setButtons:(id)a3;
- (void)setConnectedDeviceIndex:(id)a3;
- (void)setContextMenuNeedsUpdate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDevicePickerShowing:(BOOL)a3;
- (void)setDeviceTitle:(id)a3;
- (void)setDeviceTitleView:(id)a3;
- (void)setDevices:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEventHaptic:(id)a3;
- (void)setHideAnimator:(id)a3;
- (void)setMenuProvider:(id)a3;
- (void)setMuteButton:(id)a3;
- (void)setMuteButtonOverride:(id)a3;
- (void)setNearbySectionTitleView:(id)a3;
- (void)setPowerButton:(id)a3;
- (void)setShowAnimator:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setSuggestedDevices:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewBottomSeperator:(id)a3;
- (void)setTableViewTopSeperator:(id)a3;
- (void)setTableViewWrapper:(id)a3;
- (void)setTitleButton:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setVolumeControlAvailable:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRUIDevicePickerViewController

- (void)loadView
{
  id v3 = [[_TVRUIDevicePickerView alloc] _initWithViewController:self];
  [(TVRUIDevicePickerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUIDevicePickerViewController;
  [(TVRUIDevicePickerViewController *)&v7 viewDidLoad];
  [(TVRUIDevicePickerViewController *)self _setupDeviceTitleView];
  [(TVRUIDevicePickerViewController *)self _setupButtons];
  [(TVRUIDevicePickerViewController *)self resetSelectedDevice];
  [(TVRUIDevicePickerViewController *)self _setupDeviceList];
  [(TVRUIDevicePickerViewController *)self _setupAnimators];
  id v3 = objc_alloc_init(TVREventHaptic);
  [(TVRUIDevicePickerViewController *)self setEventHaptic:v3];

  v4 = [(TVRUIDevicePickerViewController *)self titleButton];
  v5 = [(TVRUIDevicePickerViewController *)self styleProvider];
  v6 = [v5 defaultDeviceTitle];
  [v4 setTitle:v6 forState:0];
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v12 topControlPanelInsets];
  double v14 = v13;
  double v16 = v15;

  double v17 = self->_baseHeight * 0.5 + -24.0;
  v18 = [(TVRUIDevicePickerViewController *)self muteButton];
  objc_msgSend(v18, "setFrame:", v14, v17, 48.0, 48.0);

  v19 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
  objc_msgSend(v19, "setFrame:", v14, v17, 48.0, 48.0);

  v20 = [(TVRUIDevicePickerViewController *)self view];
  [v20 bounds];
  CGFloat v21 = CGRectGetMaxX(v56) - v16 + -48.0;
  CGFloat v22 = v5;
  v57.origin.x = v5;
  CGFloat v23 = v7;
  v57.origin.y = v7;
  CGFloat v24 = v9;
  v57.size.width = v9;
  CGFloat v25 = v11;
  v57.size.height = v11;
  CGFloat v26 = CGRectGetMidY(v57) + -24.0;
  v27 = [(TVRUIDevicePickerViewController *)self powerButton];
  objc_msgSend(v27, "setFrame:", v21, v26, 48.0, 48.0);

  v28 = [(TVRUIDevicePickerViewController *)self powerButton];
  [v28 frame];
  CGFloat v29 = CGRectGetMinX(v58) + -10.0;
  v30 = [(TVRUIDevicePickerViewController *)self muteButton];
  [v30 frame];
  CGFloat v31 = v29 - (CGRectGetMaxX(v59) + 10.0);

  v32 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
  v33 = [(TVRUIDevicePickerViewController *)self muteButton];
  [v33 frame];
  objc_msgSend(v32, "setFrame:", CGRectGetMaxX(v60) + 10.0, 0.0, v31, self->_baseHeight);

  v34 = [(TVRUIDevicePickerViewController *)self tableViewTopSeperator];
  v35 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v35 touchpadInsets];
  double v37 = v36;
  v61.origin.x = v22;
  v61.origin.y = v23;
  v61.size.width = v24;
  v61.size.height = v25;
  double Height = CGRectGetHeight(v61);
  v39 = [(TVRUIDevicePickerViewController *)self view];
  [v39 bounds];
  double Width = CGRectGetWidth(v62);
  v41 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v41 touchpadInsets];
  double v43 = Width - v42;
  v44 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v44 touchpadInsets];
  objc_msgSend(v34, "setFrame:", v37, Height, v43 - v45, 1.0);

  id v54 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
  v63.origin.x = v22;
  v63.origin.y = v23;
  v63.size.width = v24;
  v63.size.height = v25;
  CGFloat v46 = CGRectGetMaxY(v63) + 2.0;
  v47 = [(TVRUIDevicePickerViewController *)self view];
  [v47 bounds];
  double v48 = CGRectGetWidth(v64);
  v49 = [(TVRUIDevicePickerViewController *)self view];
  [v49 bounds];
  double v50 = CGRectGetHeight(v65);
  v66.origin.x = v22;
  v66.origin.y = v23;
  v66.size.width = v24;
  v66.size.height = v25;
  double v51 = v50 - CGRectGetHeight(v66) + -2.0;
  v52 = [(TVRUIDevicePickerViewController *)self view];
  [v52 safeAreaInsets];
  objc_msgSend(v54, "setFrame:", 0.0, v46, v48, v51 - v53);
}

- (void)_setupButtons
{
  v38[2] = *MEMORY[0x263EF8340];
  id v3 = [[TVRUIButton alloc] initWithType:29 hasTapAction:0];
  [(TVRUIDevicePickerViewController *)self setMuteButton:v3];

  double v4 = [[TVRUIButton alloc] initWithType:30 hasTapAction:0];
  [(TVRUIDevicePickerViewController *)self setPowerButton:v4];

  CGFloat v5 = [(TVRUIDevicePickerViewController *)self muteButton];
  v38[0] = v5;
  double v6 = [(TVRUIDevicePickerViewController *)self powerButton];
  v38[1] = v6;
  CGFloat v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
  [(TVRUIDevicePickerViewController *)self setButtons:v7];

  [(TVRUIDevicePickerViewController *)self _updateButtonsShapes];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v8 = [(TVRUIDevicePickerViewController *)self buttons];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v14 = [(TVRUIDevicePickerViewController *)self view];
        [v14 addSubview:v13];

        [v13 addTarget:self action:sel__buttonPressed_ forControlEvents:1];
        [v13 addTarget:self action:sel__buttonReleased_ forControlEvents:448];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  if (+[TVRUIFeatures replaceMuteButtonWithContextMenu])
  {
    double v15 = [MEMORY[0x263F824E8] buttonWithType:1];
    muteButtonOverride = self->_muteButtonOverride;
    self->_muteButtonOverride = v15;

    double v17 = [(TVRUIDevicePickerViewController *)self styleProvider];
    v18 = [v17 primaryTextAndGlyphColor];
    v19 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
    [v19 setTintColor:v18];

    v20 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
    CGFloat v21 = [(TVRUIDevicePickerViewController *)self styleProvider];
    CGFloat v22 = [v21 symbolImageForButtonPanelNamed:@"ellipsis.circle"];
    [v20 setImage:v22 forState:0];

    CGFloat v23 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
    [v23 setShowsMenuAsPrimaryAction:1];

    CGFloat v24 = [(TVRUIDevicePickerViewController *)self muteButton];
    [v24 setHidden:1];

    CGFloat v25 = [(TVRUIDevicePickerViewController *)self muteButton];
    [v25 setAlpha:0.0];

    CGFloat v26 = [(TVRUIDevicePickerViewController *)self view];
    v27 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
    [v26 addSubview:v27];
  }
  v28 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v29 = *MEMORY[0x263F8B158];
  v30 = [MEMORY[0x263F08A48] mainQueue];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __48__TVRUIDevicePickerViewController__setupButtons__block_invoke;
  v32[3] = &unk_264800A88;
  v32[4] = self;
  id v31 = (id)[v28 addObserverForName:v29 object:0 queue:v30 usingBlock:v32];
}

uint64_t __48__TVRUIDevicePickerViewController__setupButtons__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonsShapes];
}

- (void)_updateButtonsShapes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(TVRUIDevicePickerViewController *)self buttons];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setHasButtonShape:_AXSButtonShapesEnabled() != 0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_setupDeviceTitleView
{
  uint64_t v3 = [(TVRUIDevicePickerViewController *)self deviceTitleView];

  if (!v3)
  {
    uint64_t v4 = [TVRUITitleView alloc];
    uint64_t v5 = [(TVRUIDevicePickerViewController *)self styleProvider];
    uint64_t v6 = [(TVRUITitleView *)v4 initWithStyleProvider:v5];
    [(TVRUIDevicePickerViewController *)self setDeviceTitleView:v6];

    long long v7 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
    [v7 setUserInteractionEnabled:1];

    id v13 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__toggleState];
    [v13 setCancelsTouchesInView:0];
    long long v8 = [(TVRUIDevicePickerViewController *)self view];
    long long v9 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
    [v8 addSubview:v9];

    long long v10 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
    [v10 addGestureRecognizer:v13];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__titleWasLongPressed_];
    [v11 setMinimumPressDuration:1.2];
    uint64_t v12 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
    [v12 addGestureRecognizer:v11];
  }
}

- (void)_setupTitleButtonIfNeeded
{
  uint64_t v3 = [(TVRUIDevicePickerViewController *)self titleButton];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:0];
    [(TVRUIDevicePickerViewController *)self setTitleButton:v4];

    uint64_t v5 = [(TVRUIDevicePickerViewController *)self titleButton];
    uint64_t v6 = [v5 titleLabel];
    long long v7 = [(TVRUIDevicePickerViewController *)self styleProvider];
    long long v8 = [v7 fontForDeviceTitle];
    [v6 setFont:v8];

    long long v9 = [(TVRUIDevicePickerViewController *)self titleButton];
    long long v10 = [v9 titleLabel];
    [v10 setAdjustsFontForContentSizeCategory:1];

    uint64_t v11 = [(TVRUIDevicePickerViewController *)self titleButton];
    uint64_t v12 = [v11 titleLabel];
    [v12 setAdjustsFontSizeToFitWidth:1];

    id v13 = [(TVRUIDevicePickerViewController *)self titleButton];
    double v14 = [v13 titleLabel];
    double v15 = [(TVRUIDevicePickerViewController *)self styleProvider];
    double v16 = [v15 textColorForDeviceTitle];
    [v14 setTextColor:v16];

    double v17 = [(TVRUIDevicePickerViewController *)self titleButton];
    v18 = [(TVRUIDevicePickerViewController *)self styleProvider];
    v19 = [v18 primaryTextAndGlyphColor];
    [v17 setTintColor:v19];

    v20 = [(TVRUIDevicePickerViewController *)self styleProvider];
    id v37 = [v20 chevronImage];

    CGFloat v21 = [(TVRUIDevicePickerViewController *)self titleButton];
    [v21 setImage:v37 forState:0];

    CGFloat v22 = [(TVRUIDevicePickerViewController *)self titleButton];
    CGFloat v23 = [v22 imageView];
    [v23 setContentMode:1];

    CGFloat v24 = [(TVRUIDevicePickerViewController *)self titleButton];
    CGFloat v25 = [v24 imageView];
    CGFloat v26 = [(TVRUIDevicePickerViewController *)self styleProvider];
    v27 = [v26 tintColorForChevronImage];
    [v25 setTintColor:v27];

    v28 = [(TVRUIDevicePickerViewController *)self titleButton];
    [v28 addTarget:self action:sel__toggleState forControlEvents:64];

    uint64_t v29 = [(TVRUIDevicePickerViewController *)self titleButton];
    [v29 setContentHorizontalAlignment:0];

    v30 = (void *)MEMORY[0x263F82E00];
    id v31 = [(TVRUIDevicePickerViewController *)self view];
    uint64_t v32 = objc_msgSend(v30, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v31, "semanticContentAttribute"));

    long long v33 = [(TVRUIDevicePickerViewController *)self titleButton];
    long long v34 = v33;
    if (v32) {
      uint64_t v35 = 3;
    }
    else {
      uint64_t v35 = 4;
    }
    [v33 setSemanticContentAttribute:v35];

    long long v36 = [(TVRUIDevicePickerViewController *)self titleButton];
    [v36 setPointerStyleProvider:&__block_literal_global_11];
  }
}

id __60__TVRUIDevicePickerViewController__setupTitleButtonIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 titleLabel];
  uint64_t v4 = [v2 titleLabel];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;

  id v13 = [v2 imageView];

  [v13 bounds];
  CGFloat v14 = v10 + CGRectGetWidth(v27) + 8.0;

  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v14;
  v28.size.double height = v12;
  CGRect v29 = CGRectInset(v28, -16.0, -8.0);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  CGFloat v19 = CGRectGetHeight(v29) * 0.5;
  id v20 = objc_alloc_init(MEMORY[0x263F82AD0]);
  CGFloat v21 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v19);
  [v20 setVisiblePath:v21];
  CGFloat v22 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v3 parameters:v20];
  CGFloat v23 = [MEMORY[0x263F82A68] effectWithPreview:v22];
  CGFloat v24 = [MEMORY[0x263F82A90] styleWithEffect:v23 shape:0];

  return v24;
}

- (void)_titleWasLongPressed:(id)a3
{
  id v5 = [(TVRUIDevicePickerViewController *)self delegate];
  uint64_t v4 = [(TVRUIDevicePickerViewController *)self device];
  [v5 devicePickerTitleWasLongPressedForDevice:v4];
}

- (void)setDeviceTitle:(id)a3
{
  id v5 = a3;
  if (![(NSString *)self->_deviceTitle isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_deviceTitle, a3);
    CGFloat v6 = (void *)MEMORY[0x263F82E00];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__TVRUIDevicePickerViewController_setDeviceTitle___block_invoke;
    v7[3] = &unk_264800638;
    v7[4] = self;
    id v8 = v5;
    [v6 performWithoutAnimation:v7];
  }
}

void __50__TVRUIDevicePickerViewController_setDeviceTitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) titleButton];
  [v2 setTitle:*(void *)(a1 + 40) forState:0];

  id v3 = [*(id *)(a1 + 32) titleButton];
  [v3 layoutIfNeeded];
}

- (void)setMenuProvider:(id)a3
{
  objc_storeWeak((id *)&self->_menuProvider, a3);
  [(TVRUIDevicePickerViewController *)self setContextMenuNeedsUpdate:1];
  [(TVRUIDevicePickerViewController *)self _updateViewState];
}

- (void)_setupDeviceList
{
  id v3 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];

  if (!v3)
  {
    uint64_t v4 = [(TVRUIDevicePickerViewController *)self styleProvider];
    [v4 deviceListRowHeight];
    -[TVRUIDevicePickerViewController setBaseHeight:](self, "setBaseHeight:");

    id v5 = objc_alloc_init(_TVRUITableViewWrapperView);
    [(TVRUIDevicePickerViewController *)self setTableViewWrapper:v5];

    CGFloat v6 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v6 setClipsToBounds:1];

    double v7 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    id v8 = [v7 layer];
    [v8 setMaskedCorners:4];

    double v9 = [(TVRUIDevicePickerViewController *)self view];
    double v10 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v9 addSubview:v10];

    id v11 = objc_alloc(MEMORY[0x263F82C78]);
    CGFloat v12 = objc_msgSend(v11, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(TVRUIDevicePickerViewController *)self setTableView:v12];

    id v13 = [(TVRUIDevicePickerViewController *)self tableView];
    CGFloat v14 = [v13 layer];
    [v14 setAllowsGroupBlending:0];

    double v15 = [(TVRUIDevicePickerViewController *)self tableView];
    double v16 = [v15 layer];
    [v16 setAllowsGroupOpacity:0];

    double v17 = [(TVRUIDevicePickerViewController *)self tableView];
    [v17 setDelegate:self];

    v18 = [(TVRUIDevicePickerViewController *)self tableView];
    [v18 setDataSource:self];

    CGFloat v19 = [(TVRUIDevicePickerViewController *)self tableView];
    [v19 setSeparatorStyle:0];

    id v20 = [(TVRUIDevicePickerViewController *)self tableView];
    [v20 setIndicatorStyle:2];

    CGFloat v21 = [(TVRUIDevicePickerViewController *)self tableView];
    CGFloat v22 = [MEMORY[0x263F825C8] clearColor];
    [v21 setBackgroundColor:v22];

    CGFloat v23 = [(TVRUIDevicePickerViewController *)self tableView];
    [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"kTVRDropDownCellIdentifier"];

    CGFloat v24 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    CGFloat v25 = [(TVRUIDevicePickerViewController *)self tableView];
    [v24 addSubview:v25];

    id v34 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_didTapWrapperView_];
    [v34 setCancelsTouchesInView:0];
    CGFloat v26 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v26 addGestureRecognizer:v34];

    CGRect v27 = [(TVRUIDevicePickerViewController *)self styleProvider];
    CGRect v28 = [v27 separatorView];
    [(TVRUIDevicePickerViewController *)self setTableViewTopSeperator:v28];

    CGRect v29 = [(TVRUIDevicePickerViewController *)self view];
    v30 = [(TVRUIDevicePickerViewController *)self tableViewTopSeperator];
    [v29 addSubview:v30];

    id v31 = [(TVRUIDevicePickerViewController *)self tableViewTopSeperator];
    [v31 setAlpha:0.0];

    uint64_t v32 = [NSString stringWithFormat:@"UIA.TVRemoteService.%@", @"deviceTable"];
    long long v33 = [(TVRUIDevicePickerViewController *)self tableView];
    [v33 setAccessibilityIdentifier:v32];
  }
}

- (void)setDevices:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  id v5 = v4;
  if (self->_devices != v4)
  {
    double v16 = v4;
    CGFloat v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    uint64_t v7 = [(NSArray *)v6 count];
    id v8 = [(TVRUIDevicePickerViewController *)self titleButton];
    double v9 = [v8 imageView];
    double v10 = v9;
    if (v7)
    {
      [v9 setHidden:0];

      id v11 = [(TVRUIDevicePickerViewController *)self view];
      CGFloat v12 = v11;
      uint64_t v13 = 1;
    }
    else
    {
      [v9 setHidden:1];

      id v11 = [(TVRUIDevicePickerViewController *)self view];
      CGFloat v12 = v11;
      uint64_t v13 = 0;
    }
    [v11 setUserInteractionEnabled:v13];

    devices = self->_devices;
    self->_devices = v6;

    [(TVRUIDevicePickerViewController *)self _sortAndReloadDevices];
    if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
    {
      uint64_t v4 = [(NSArray *)v16 count];
      id v5 = v16;
      if (v4) {
        goto LABEL_10;
      }
      uint64_t v4 = (NSArray *)[(TVRUIDevicePickerViewController *)self _toggleState];
    }
    else
    {
      double v15 = [(TVRUIDevicePickerViewController *)self tableView];
      [(TVRUIDevicePickerViewController *)self _preferredTableViewFrameWhenExpanded:0];
      objc_msgSend(v15, "setFrame:");
    }
    id v5 = v16;
  }
LABEL_10:
  MEMORY[0x270F9A758](v4, v5);
}

- (void)setSuggestedDevices:(id)a3
{
  id v5 = a3;
  if (+[TVRUIFeatures corianderEnabled]
    && ![(NSArray *)self->_suggestedDevices isEqualToArray:v5])
  {
    objc_storeStrong((id *)&self->_suggestedDevices, a3);
    [(TVRUIDevicePickerViewController *)self _updateDevicesWithSuggestionsAndReload];
  }
}

- (void)_updateDevicesWithSuggestionsAndReload
{
  v1 = [a1 devices];
  OUTLINED_FUNCTION_0_0(&dword_227326000, v2, v3, "devices: %@", v4, v5, v6, v7, 2u);
}

- (void)_sortAndReloadDevices
{
  uint64_t v3 = [(NSArray *)self->_devices sortedArrayUsingComparator:&__block_literal_global_72];
  devices = self->_devices;
  self->_devices = v3;

  [(TVRUIDevicePickerViewController *)self _updateDevicesWithSuggestionsAndReload];
}

uint64_t __56__TVRUIDevicePickerViewController__sortAndReloadDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  if ([v6 isConnected])
  {
    uint64_t v8 = -1;
  }
  else if ([v7 isConnected])
  {
    uint64_t v8 = 1;
  }
  else
  {
    double v9 = [v6 name];
    double v10 = [v7 name];
    uint64_t v8 = [v9 compare:v10 options:1];
  }
  return v8;
}

- (void)_setupAnimators
{
  uint64_t v3 = +[TVRUICubicSpringAnimator standardSpringAnimator];
  [(TVRUIDevicePickerViewController *)self setShowAnimator:v3];

  id v7 = -[TVRUICubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([TVRUICubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 36.0, 0.0, 0.0);
  id v4 = +[TVRUICubicSpringTimingParameters standardTimingParameters];
  id v5 = [v4 springCubicTimingParameters];
  [(TVRUICubicSpringTimingParameters *)v7 setSpringCubicTimingParameters:v5];

  id v6 = [(UIViewPropertyAnimator *)[TVRUICubicSpringAnimator alloc] initWithDuration:v7 timingParameters:1.0];
  [(TVRUIDevicePickerViewController *)self setHideAnimator:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(TVRUIDevicePickerViewController *)self devices];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"kTVRDropDownCellIdentifier" forIndexPath:v7];
  double v9 = [(TVRUIDevicePickerViewController *)self styleProvider];

  if (!v9)
  {
    double v10 = _TVRUIDevicePickerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRUIDevicePickerViewController tableView:cellForRowAtIndexPath:](v10);
    }
  }
  id v11 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v8 setStyleProvider:v11];

  CGFloat v12 = [(TVRUIDevicePickerViewController *)self devices];
  uint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));

  [v8 setDevice:v13];
  objc_msgSend(v8, "setShowSeparator:", objc_msgSend(v7, "row") != objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section")) - 1);
  id v14 = objc_alloc_init(MEMORY[0x263F82E00]);
  double v15 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
  [v14 setBackgroundColor:v15];

  [v8 setSelectedBackgroundView:v14];
  if ([v13 isConnected]) {
    [(TVRUIDevicePickerViewController *)self setConnectedDeviceIndex:v7];
  }
  double v16 = (void *)MEMORY[0x263F823D0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__TVRUIDevicePickerViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v20[3] = &unk_264800388;
  objc_copyWeak(&v22, &location);
  id v17 = v13;
  id v21 = v17;
  v18 = [v16 actionWithHandler:v20];
  [v8 setFindButtonTapAction:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v8;
}

void __67__TVRUIDevicePickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained delegate];
  [v2 findButtonTappedForDevice:*(void *)(a1 + 32)];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if ([(TVRUIDevicePickerViewController *)self _accessibilityFontSizesEnabled]) {
    return *MEMORY[0x263F839B8];
  }
  [(TVRUIDevicePickerViewController *)self baseHeight];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  devices = self->_devices;
  id v6 = a4;
  id v7 = -[NSArray objectAtIndex:](devices, "objectAtIndex:", [v6 row]);
  if ([v7 isConnected])
  {
    uint64_t v8 = _TVRUIDevicePickerLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v15) = 0;
    double v9 = "User tapped on already connected device";
    double v10 = v8;
    uint32_t v11 = 2;
  }
  else
  {
    CGFloat v12 = [(TVRUIDevicePickerViewController *)self eventHaptic];
    [v12 playSelectionEventHaptic];

    uint64_t v13 = [(TVRUIDevicePickerViewController *)self delegate];
    [v13 devicePicked:v7];

    uint64_t v8 = _TVRUIDevicePickerLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v15 = 138412290;
    double v16 = v7;
    double v9 = "User picked device %@";
    double v10 = v8;
    uint32_t v11 = 12;
  }
  _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
LABEL_7:

  id v14 = [(TVRUIDevicePickerViewController *)self tableView];
  [v14 deselectRowAtIndexPath:v6 animated:0];

  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing]) {
    [(TVRUIDevicePickerViewController *)self _toggleState];
  }
}

- (void)expandDeviceList
{
  if (![(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
  {
    uint64_t v3 = _TVRUIDevicePickerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Expanding device list", v4, 2u);
    }

    [(TVRUIDevicePickerViewController *)self _toggleState];
  }
}

- (void)collapseDeviceList
{
  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
  {
    uint64_t v3 = _TVRUIDevicePickerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Collapsing device list", v4, 2u);
    }

    [(TVRUIDevicePickerViewController *)self _toggleState];
  }
}

- (void)didChangeToExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TVRUIDevicePickerViewController *)self tableView];
  [(TVRUIDevicePickerViewController *)self _preferredTableViewFrameWhenExpanded:v3];
  objc_msgSend(v5, "setFrame:");
}

- (void)didTapWrapperView:(id)a3
{
  id v11 = a3;
  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
  {
    id v4 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v11 locationInView:v4];
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    double v9 = [(TVRUIDevicePickerViewController *)self tableView];
    [v9 frame];
    v13.double x = v6;
    v13.double y = v8;
    BOOL v10 = CGRectContainsPoint(v14, v13);

    if (!v10) {
      [(TVRUIDevicePickerViewController *)self _toggleState];
    }
  }
}

- (void)_toggleState
{
  BOOL v3 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Toggle state called", (uint8_t *)buf, 2u);
  }

  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing]
    || ([(TVRUIDevicePickerViewController *)self devices],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    [(TVRUIDevicePickerViewController *)self setDevicePickerShowing:[(TVRUIDevicePickerViewController *)self isDevicePickerShowing] ^ 1];
    if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
    {
      CGFloat v6 = [(TVRUIDevicePickerViewController *)self tableView];
      [(TVRUIDevicePickerViewController *)self _preferredTableViewFrameWhenExpanded:0];
      objc_msgSend(v6, "setFrame:");
    }
    double v7 = [(TVRUIDevicePickerViewController *)self showAnimator];
    int v8 = [v7 isRunning];

    if (v8)
    {
      double v9 = [(TVRUIDevicePickerViewController *)self showAnimator];
      [v9 stopAnimation:1];

      BOOL v10 = _TVRUIDevicePickerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        id v11 = "showAnimator reversed";
LABEL_13:
        _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      CGFloat v12 = [(TVRUIDevicePickerViewController *)self hideAnimator];
      int v13 = [v12 isRunning];

      if (!v13)
      {
LABEL_15:
        [(TVRUIDevicePickerViewController *)self _setupAnimators];
        objc_initWeak(buf, self);
        if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
        {
          int v15 = [(TVRUIDevicePickerViewController *)self showAnimator];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __47__TVRUIDevicePickerViewController__toggleState__block_invoke;
          v25[3] = &unk_264800AF0;
          double v16 = &v26;
          objc_copyWeak(&v26, buf);
          v25[4] = self;
          [v15 addAnimations:v25];

          [(TVRUIDevicePickerViewController *)self _sortAndReloadDevices];
          uint64_t v17 = [(TVRUIDevicePickerViewController *)self eventHaptic];
          [v17 playImpactEventHaptic];

          v18 = [(TVRUIDevicePickerViewController *)self delegate];
          [v18 devicePickerWillChangeState:1 animated:0];

          CGFloat v19 = [(TVRUIDevicePickerViewController *)self showAnimator];
          [v19 startAnimation];
        }
        else
        {
          id v20 = [(TVRUIDevicePickerViewController *)self hideAnimator];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __47__TVRUIDevicePickerViewController__toggleState__block_invoke_2;
          v23[3] = &unk_264800468;
          double v16 = &v24;
          objc_copyWeak(&v24, buf);
          [v20 addAnimations:v23];

          id v21 = [(TVRUIDevicePickerViewController *)self delegate];
          [v21 devicePickerWillChangeState:0 animated:0];

          CGFloat v19 = [(TVRUIDevicePickerViewController *)self hideAnimator];
          [v19 startAnimation];
        }

        objc_destroyWeak(v16);
        objc_destroyWeak(buf);
        return;
      }
      CGRect v14 = [(TVRUIDevicePickerViewController *)self hideAnimator];
      [v14 stopAnimation:1];

      BOOL v10 = _TVRUIDevicePickerLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        id v11 = "hideAnimator reversed";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  id v22 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227326000, v22, OS_LOG_TYPE_DEFAULT, "Not showing and device count is 0. Not expanding picker.", (uint8_t *)buf, 2u);
  }
}

void __47__TVRUIDevicePickerViewController__toggleState__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = [*(id *)(a1 + 32) view];
    BOOL v4 = [v3 effectiveUserInterfaceLayoutDirection] == 1;

    CGFloat v5 = dbl_2273F4290[v4];
    CGFloat v6 = [WeakRetained deviceTitleView];
    double v7 = [v6 imageView];
    CGAffineTransformMakeRotation(&v13, v5);
    [v7 setTransform:&v13];

    int v8 = [WeakRetained powerButton];
    [v8 setEnabled:0];

    double v9 = [WeakRetained muteButton];
    [v9 setEnabled:0];

    BOOL v10 = [WeakRetained muteButtonOverride];
    [v10 setEnabled:0];

    id v11 = WeakRetained[136];
    [WeakRetained _preferredTableViewFrameWhenExpanded:1];
    objc_msgSend(v11, "setFrame:");
    [WeakRetained[138] setAlpha:1.0];
    id v12 = objc_loadWeakRetained(WeakRetained + 127);
    [v12 devicePickerWillChangeState:1 animated:1];
  }
}

void __47__TVRUIDevicePickerViewController__toggleState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained deviceTitleView];
    BOOL v4 = [v3 imageView];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v11[0] = *MEMORY[0x263F000D0];
    v11[1] = v5;
    v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v4 setTransform:v11];

    CGFloat v6 = [v2 powerButton];
    [v6 setEnabled:1];

    double v7 = [v2 muteButton];
    [v7 setEnabled:1];

    int v8 = [v2 muteButtonOverride];
    [v8 setEnabled:1];

    id v9 = v2[136];
    [v2 _preferredTableViewFrameWhenExpanded:0];
    objc_msgSend(v9, "setFrame:");
    [v2[138] setAlpha:0.0];
    id v10 = objc_loadWeakRetained(v2 + 127);
    [v10 devicePickerWillChangeState:0 animated:1];
  }
}

- (CGRect)_preferredTableViewFrameWhenExpanded:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = _TVRUIDevicePickerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      long long v5 = [(TVRUIDevicePickerViewController *)self devices];
      int v20 = 134217984;
      uint64_t v21 = [v5 count];
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "tableViewFrameRequest with num devices %ld", (uint8_t *)&v20, 0xCu);
    }
    CGFloat v6 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v6 bounds];
    CGFloat width = v7;
    [(TVRUIDevicePickerViewController *)self _expandedContentHeight];
    CGFloat height = v9;
    CGFloat x = 0.0;

    CGFloat y = 0.0;
  }
  else
  {
    [(TVRUIDevicePickerViewController *)self _calculatedContentHeight];
    CGFloat v14 = -(v13 + 1.0);
    int v15 = [(TVRUIDevicePickerViewController *)self tableViewWrapper];
    [v15 bounds];
    CGRect v24 = CGRectOffset(v23, 0.0, v14);
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_updateTableFrame:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TVRUIDevicePickerViewController *)self tableView];
  [(TVRUIDevicePickerViewController *)self _preferredTableViewFrameWhenExpanded:v3];
  objc_msgSend(v5, "setFrame:");
}

- (void)_device:(id)a3 updatedFindMySupported:(BOOL)a4
{
  id v5 = a3;
  CGFloat v6 = [(TVRUIDevicePickerViewController *)self devices];
  uint64_t v7 = [v6 indexOfObject:v5];

  id v10 = [MEMORY[0x263F088C8] indexPathForRow:v7 inSection:0];
  int v8 = [(TVRUIDevicePickerViewController *)self tableView];
  double v9 = [v8 cellForRowAtIndexPath:v10];

  [v9 _updateFindMyButton];
}

- (double)_calculatedContentHeight
{
  if ([(TVRUIDevicePickerViewController *)self _accessibilityFontSizesEnabled])
  {
    [(TVRUIDevicePickerViewController *)self _contentHeightForPreferredContentSizeCategory];
  }
  else
  {
    [(TVRUIDevicePickerViewController *)self _defaultCalculatedContentHeight];
  }
  return result;
}

- (double)_defaultCalculatedContentHeight
{
  [(TVRUIDevicePickerViewController *)self baseHeight];
  double v4 = v3;
  id v5 = [(TVRUIDevicePickerViewController *)self devices];
  double v6 = v4 * (double)(unint64_t)[v5 count];

  return v6;
}

- (double)_expandedContentHeight
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v3 = [(TVRUIDevicePickerViewController *)self styleProvider];
  [v3 touchpadHeight];
  double v5 = v4 * 0.5;

  [(TVRUIDevicePickerViewController *)self _calculatedContentHeight];
  double v7 = v6;
  int v8 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    double v11 = v5;
    __int16 v12 = 2048;
    double v13 = v7;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "maxExpandedHeight=%f calculatedHeight=%f", (uint8_t *)&v10, 0x16u);
  }

  if (v7 >= v5) {
    return v5;
  }
  else {
    return v7;
  }
}

- (BOOL)_accessibilityFontSizesEnabled
{
  uint64_t v2 = [MEMORY[0x263F825F8] system];
  double v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

- (double)_contentHeightForPreferredContentSizeCategory
{
  [(TVRUIDevicePickerViewController *)self _defaultCalculatedContentHeight];
  double Height = v3;
  double v5 = [MEMORY[0x263F825F8] system];
  double v6 = [v5 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
  {
    if (([v6 isEqualToString:*MEMORY[0x263F83408]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x263F83400]])
    {
      double v7 = [(TVRUIDevicePickerViewController *)self view];
      [v7 bounds];
      double Height = CGRectGetHeight(v9);
    }
    else if (([v6 isEqualToString:*MEMORY[0x263F83418]] & 1) != 0 {
           || [v6 isEqualToString:*MEMORY[0x263F83410]])
    }
    {
      double Height = Height * 1.5;
    }
  }

  return Height;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_buttonPressed:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int v8 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonReleased:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int v8 = [(TVRUIDevicePickerViewController *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_updateTitleViewForDevice:(id)a3
{
  id v4 = a3;
  double v5 = [(TVRUIDevicePickerViewController *)self styleProvider];
  double v6 = [v4 model];
  char v7 = [v5 iconForDeviceModel:v6];

  int v8 = (void *)MEMORY[0x263F82E00];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__TVRUIDevicePickerViewController__updateTitleViewForDevice___block_invoke;
  _OWORD v11[3] = &unk_2648007C0;
  v11[4] = self;
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  [v8 performWithoutAnimation:v11];
}

void __61__TVRUIDevicePickerViewController__updateTitleViewForDevice___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) deviceTitleView];
  uint64_t v2 = [*(id *)(a1 + 40) name];
  [v3 updateTitleWithDeviceName:v2 icon:*(void *)(a1 + 48)];
}

- (void)_updateViewState
{
  BOOL v4 = [(TVRUIDevicePickerViewController *)self enabled];
  if (v4)
  {
    double v5 = 1.0;
  }
  else
  {
    uint64_t v2 = [(TVRUIDevicePickerViewController *)self styleProvider];
    [v2 disabledButtonAlpha];
    double v5 = v6;
  }
  char v7 = [(TVRUIDevicePickerViewController *)self titleButton];
  [v7 setAlpha:v5];

  if (!v4) {
  BOOL v8 = [(TVRUIDevicePickerViewController *)self enabled];
  }
  if (v8)
  {
    double v9 = 1.0;
  }
  else
  {
    uint64_t v2 = [(TVRUIDevicePickerViewController *)self styleProvider];
    [v2 disabledButtonAlpha];
    double v9 = v10;
  }
  double v11 = [(TVRUIDevicePickerViewController *)self powerButton];
  [v11 setAlpha:v9];

  if (!v8) {
  BOOL v12 = [(TVRUIDevicePickerViewController *)self enabled];
  }
  if (v12)
  {
    double v13 = 1.0;
  }
  else
  {
    uint64_t v2 = [(TVRUIDevicePickerViewController *)self styleProvider];
    [v2 disabledButtonAlpha];
    double v13 = v14;
  }
  int v15 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
  [v15 setAlpha:v13];

  if (!v12) {
  muteButtonOverride = self->_muteButtonOverride;
  }
  double v17 = [(TVRUIDevicePickerViewController *)self muteButton];
  double v18 = v17;
  if (muteButtonOverride)
  {
    [v17 setHidden:1];

    double v18 = [(TVRUIDevicePickerViewController *)self muteButton];
    [v18 setAlpha:0.0];

    BOOL v19 = [(TVRUIDevicePickerViewController *)self enabled];
    if (v19)
    {
      double v20 = 1.0;
    }
    else
    {
      double v18 = [(TVRUIDevicePickerViewController *)self styleProvider];
      [v18 disabledButtonAlpha];
      double v20 = v21;
    }
    uint64_t v22 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
  }
  else
  {
    [v17 setHidden:0];

    BOOL v19 = [(TVRUIDevicePickerViewController *)self enabled];
    if (v19)
    {
      double v20 = 1.0;
    }
    else
    {
      double v18 = [(TVRUIDevicePickerViewController *)self styleProvider];
      [v18 disabledButtonAlpha];
      double v20 = v23;
    }
    uint64_t v22 = [(TVRUIDevicePickerViewController *)self muteButton];
  }
  CGRect v24 = v22;
  [v22 setAlpha:v20];

  if (!v19) {
  uint64_t v25 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
  }
  if (v25)
  {
    id v26 = (void *)v25;
    BOOL v27 = [(TVRUIDevicePickerViewController *)self contextMenuNeedsUpdate];

    if (v27)
    {
      CGRect v28 = [(TVRUIDevicePickerViewController *)self menuProvider];
      CGRect v29 = [v28 actionButtonMenu];
      v30 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
      [v30 setMenu:v29];

      [(TVRUIDevicePickerViewController *)self setContextMenuNeedsUpdate:0];
    }
  }
}

- (void)_updateDevice
{
  device = self->_device;
  if (device)
  {
    uint64_t v4 = [(TVRUIDevice *)device supportsMute];
    double v5 = [(TVRUIDevicePickerViewController *)self muteButton];
    [v5 setEnabled:v4];

    uint64_t v6 = [(TVRUIDevice *)self->_device supportsPower];
    char v7 = [(TVRUIDevicePickerViewController *)self powerButton];
    [v7 setEnabled:v6];

    BOOL v8 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
    [v8 setEnabled:1];

    [(TVRUIDevicePickerViewController *)self _updateTitleViewForDevice:self->_device];
    id v9 = [(TVRUIDevice *)self->_device name];
    [(TVRUIDevicePickerViewController *)self _updateDeviceNameAutomationIdentifier:v9];
  }
  else
  {
    [(TVRUIDevicePickerViewController *)self resetSelectedDevice];
  }
}

- (void)resetSelectedDevice
{
  device = self->_device;
  self->_device = 0;

  uint64_t v4 = [(TVRUIDevicePickerViewController *)self muteButton];
  [v4 setEnabled:0];

  double v5 = [(TVRUIDevicePickerViewController *)self powerButton];
  [v5 setEnabled:0];

  uint64_t v6 = [(TVRUIDevicePickerViewController *)self muteButtonOverride];
  [v6 setEnabled:0];

  char v7 = [(TVRUIDevicePickerViewController *)self styleProvider];
  BOOL v8 = [v7 defaultDeviceTitle];

  id v9 = (void *)MEMORY[0x263F82E00];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  double v13 = __54__TVRUIDevicePickerViewController_resetSelectedDevice__block_invoke;
  double v14 = &unk_264800638;
  int v15 = self;
  id v16 = v8;
  id v10 = v8;
  [v9 performWithoutAnimation:&v11];
  [(TVRUIDevicePickerViewController *)self _updateDeviceNameAutomationIdentifier:@"none", v11, v12, v13, v14, v15];
  [(TVRUITitleView *)self->_deviceTitleView setAlpha:1.0];
}

void __54__TVRUIDevicePickerViewController_resetSelectedDevice__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceTitleView];
  [v2 updateTitleWithDeviceName:*(void *)(a1 + 40) icon:0];
}

- (void)_updateDeviceNameAutomationIdentifier:(id)a3
{
  [NSString stringWithFormat:@"selectedDevice=\"%@\"", a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [NSString stringWithFormat:@"UIA.TVRemoteService.%@", v6];
  double v5 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)setDevice:(id)a3
{
  double v5 = (TVRUIDevice *)a3;
  id v6 = v5;
  if (self->_device == v5)
  {
    if (!v5) {
      goto LABEL_5;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_device, a3);
  }
  [(TVRUIDevicePickerViewController *)self _updateDevice];
LABEL_5:
}

- (void)setStyleProvider:(id)a3
{
  double v5 = (TVRUIStyleProvider *)a3;
  p_styleProvider = &self->_styleProvider;
  if (self->_styleProvider != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_styleProvider, a3);
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_styleProvider, v5);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(TVRUIDevicePickerViewController *)self _updateViewState];
  }
}

- (void)setVolumeControlAvailable:(BOOL)a3
{
  BOOL v4 = a3;
  if (a3)
  {
    id v3 = [(TVRUIDevicePickerViewController *)self device];
    uint64_t v6 = [v3 supportsMute];
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v7 = [(TVRUIDevicePickerViewController *)self muteButton];
  [v7 setEnabled:v6];

  if (v4) {
  [(TVRUIDevicePickerViewController *)self setContextMenuNeedsUpdate:1];
  }
  [(TVRUIDevicePickerViewController *)self _updateViewState];
}

- (id)_lastVisibleCellSupportingFindMy
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = [(TVRUIDevicePickerViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForVisibleRows];

  double v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"row" ascending:1];
  v26[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  char v7 = [v4 sortedArrayUsingDescriptors:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
      double v14 = [(TVRUIDevicePickerViewController *)self tableView];
      int v15 = [v14 cellForRowAtIndexPath:v13];

      id v16 = [v15 device];
      char v17 = [v16 supportsFindMyRemote];

      if (v17) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  double v18 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v20 = 0;
    _os_log_impl(&dword_227326000, v18, OS_LOG_TYPE_DEFAULT, "Find my supported device is not visible in the list", v20, 2u);
  }

  int v15 = 0;
LABEL_14:

  return v15;
}

- (UIView)tipSourceView
{
  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
  {
    id v3 = [(TVRUIDevicePickerViewController *)self _lastVisibleCellSupportingFindMy];
    BOOL v4 = [v3 findMyButton];
  }
  else
  {
    BOOL v4 = [(TVRUIDevicePickerViewController *)self deviceTitleView];
  }
  return (UIView *)v4;
}

- (CGRect)tipSourceRect
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (unint64_t)permittedArrowDirections
{
  return 1;
}

- (BOOL)canPresentTip
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v3 = [(TVRUIDevicePickerViewController *)self showAnimator];
  if ([v3 isRunning])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(TVRUIDevicePickerViewController *)self hideAnimator];
    char v6 = [v5 isRunning];

    if (v6)
    {
      BOOL v4 = 0;
      goto LABEL_10;
    }
    if (![(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
    {
      char v7 = [(TVRUIDevicePickerViewController *)self device];
      char v8 = [v7 supportsFindMyRemote];

      if (v8)
      {
        BOOL v4 = 1;
        goto LABEL_10;
      }
    }
    double v3 = [(TVRUIDevicePickerViewController *)self _lastVisibleCellSupportingFindMy];
    BOOL v4 = v3 != 0;
  }

LABEL_10:
  uint64_t v9 = _TVRUIDevicePickerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = "no";
    if (v4) {
      uint64_t v10 = "yes";
    }
    int v12 = 136315138;
    uint64_t v13 = v10;
    _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Can present Tip: %s", (uint8_t *)&v12, 0xCu);
  }

  return v4;
}

- (BOOL)tipSourceSupportsSiri
{
  if ([(TVRUIDevicePickerViewController *)self isDevicePickerShowing])
  {
    double v3 = [(TVRUIDevicePickerViewController *)self _lastVisibleCellSupportingFindMy];
    BOOL v4 = [v3 device];
    char v5 = [v4 supportsSiri];
  }
  else
  {
    double v3 = [(TVRUIDevicePickerViewController *)self device];
    char v5 = [v3 supportsSiri];
  }

  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonEventDelegate:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSArray)suggestedDevices
{
  return self->_suggestedDevices;
}

- (BOOL)isDevicePickerShowing
{
  return self->_devicePickerShowing;
}

- (void)setDevicePickerShowing:(BOOL)a3
{
  self->_devicePickerShowing = a3;
}

- (TVRUIDevicePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRUIDevicePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRUIMenuProvider)menuProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  return (TVRUIMenuProvider *)WeakRetained;
}

- (TVRUIButton)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
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

- (UIButton)muteButtonOverride
{
  return self->_muteButtonOverride;
}

- (void)setMuteButtonOverride:(id)a3
{
}

- (TVRUITitleView)deviceTitleView
{
  return self->_deviceTitleView;
}

- (void)setDeviceTitleView:(id)a3
{
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UIButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (_TVRUITableViewWrapperView)tableViewWrapper
{
  return self->_tableViewWrapper;
}

- (void)setTableViewWrapper:(id)a3
{
}

- (UIView)tableViewTopSeperator
{
  return self->_tableViewTopSeperator;
}

- (void)setTableViewTopSeperator:(id)a3
{
}

- (UIView)tableViewBottomSeperator
{
  return self->_tableViewBottomSeperator;
}

- (void)setTableViewBottomSeperator:(id)a3
{
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (void)setBaseHeight:(double)a3
{
  self->_basedouble Height = a3;
}

- (TVRUICubicSpringAnimator)showAnimator
{
  return self->_showAnimator;
}

- (void)setShowAnimator:(id)a3
{
}

- (TVRUICubicSpringAnimator)hideAnimator
{
  return self->_hideAnimator;
}

- (void)setHideAnimator:(id)a3
{
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void)setEventHaptic:(id)a3
{
}

- (NSIndexPath)connectedDeviceIndex
{
  return self->_connectedDeviceIndex;
}

- (void)setConnectedDeviceIndex:(id)a3
{
}

- (UIView)nearbySectionTitleView
{
  return self->_nearbySectionTitleView;
}

- (void)setNearbySectionTitleView:(id)a3
{
}

- (NSString)deviceTitle
{
  return self->_deviceTitle;
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)contextMenuNeedsUpdate
{
  return self->_contextMenuNeedsUpdate;
}

- (void)setContextMenuNeedsUpdate:(BOOL)a3
{
  self->_contextMenuNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceTitle, 0);
  objc_storeStrong((id *)&self->_nearbySectionTitleView, 0);
  objc_storeStrong((id *)&self->_connectedDeviceIndex, 0);
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_hideAnimator, 0);
  objc_storeStrong((id *)&self->_showAnimator, 0);
  objc_storeStrong((id *)&self->_tableViewBottomSeperator, 0);
  objc_storeStrong((id *)&self->_tableViewTopSeperator, 0);
  objc_storeStrong((id *)&self->_tableViewWrapper, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_deviceTitleView, 0);
  objc_storeStrong((id *)&self->_muteButtonOverride, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

- (void)tableView:(os_log_t)log cellForRowAtIndexPath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Style provider is nil", v1, 2u);
}

@end