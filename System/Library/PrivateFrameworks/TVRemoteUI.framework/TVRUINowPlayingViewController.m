@interface TVRUINowPlayingViewController
+ (double)minimizedPlayerHeight;
- (BOOL)_canDisplayCastTabForNowPlayingInfo:(id)a3;
- (BOOL)_canDisplayInfoForNowPlayingInfo:(id)a3;
- (BOOL)_canDisplayInsightsTabForNowPlayingInfo:(id)a3;
- (BOOL)_canDisplayUpNextTabForNowPlayingInfo:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_viewControllerIdentifierIsAvailable:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)interactiveSwipeGestureIsApplyingRubberbandingTransform;
- (NSArray)allPossibleChildViewControllerIdentifiers;
- (NSArray)childViewControllerIdentifiers;
- (NSDictionary)childViewControllerDict;
- (NSLayoutConstraint)tabSelectorControlHeightConstraint;
- (NSString)currentViewControllerIdentifier;
- (NSString)lastExplicitUserSelectedViewControllerIdentifier;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRUIActionProviding)actionProvider;
- (TVRUICastViewController)castViewController;
- (TVRUIDevice)activeDevice;
- (TVRUIMiniPlayerMediaControlsViewController)mediaControlsViewController;
- (TVRUINowPlayingInfoViewController)nowPlayingInfoViewController;
- (TVRUINowPlayingMiniPlayerViewController)nowPlayingMiniPlayerViewController;
- (TVRUITabSelectorControl)tabSelectorControl;
- (TVRUIUpNextProviding)upNextProvider;
- (TVRUIUpNextViewController)upNextViewController;
- (UIView)dividerView;
- (UIViewPropertyAnimator)currentTabSelectionAnimator;
- (VUITimeMetadataViewController)timedMetadataViewController;
- (_TVRUIAnimationState)currentAnimationState;
- (id)_availableTabToDisplayForNowPlayingInfo:(id)a3;
- (id)_upNextIdentifier;
- (id)commandHandler;
- (id)makeTimedMetadataPlaybackInfo;
- (id)viewControllerForIdentifier:(id)a3;
- (id)viewControllerForIndex:(unint64_t)a3;
- (id)viewControllerIdentifierForIndex:(unint64_t)a3;
- (unint64_t)indexForViewControllerIdentifier:(id)a3;
- (unint64_t)lastLayoutWidth;
- (void)_applyTransform:(CGAffineTransform *)a3 toChildViewControllerAtIndex:(unint64_t)a4;
- (void)_callChildViewControllerAppearanceForAppearingIdentifier:(id)a3;
- (void)_callChildViewControllerAppearanceForIdentifier:(id)a3 appearing:(BOOL)a4;
- (void)_callChildViewControllerDisappearingForAllExceptIdentifier:(id)a3;
- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6;
- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6 animator:(id)a7;
- (void)_reconfigureTabsIfNeeded;
- (void)_tabAnimationDidCompleteWithFinalPosition:(int64_t)a3 viewControllerIndex:(unint64_t)a4;
- (void)_updateSelectorControlHeight;
- (void)_updateViewControllerVisibilityForSelectedIdentifier:(id)a3;
- (void)configureHierarchy;
- (void)configureSegControlOrDividerViewVisibility;
- (void)configureTimedMetadata;
- (void)configureTimedMetadataView;
- (void)panRecognizerDidFire:(id)a3;
- (void)resetTabSelection;
- (void)setActionProvider:(id)a3;
- (void)setActiveDevice:(id)a3;
- (void)setCastViewController:(id)a3;
- (void)setCommandHandler:(id)a3;
- (void)setCurrentAnimationState:(id)a3;
- (void)setCurrentTabSelectionAnimator:(id)a3;
- (void)setCurrentViewControllerIdentifier:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setInteractiveSwipeGestureIsApplyingRubberbandingTransform:(BOOL)a3;
- (void)setLastExplicitUserSelectedViewControllerIdentifier:(id)a3;
- (void)setLastLayoutWidth:(unint64_t)a3;
- (void)setMediaControlsViewController:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setNowPlayingInfoViewController:(id)a3;
- (void)setNowPlayingMiniPlayerViewController:(id)a3;
- (void)setTabSelectorControl:(id)a3;
- (void)setTabSelectorControlHeightConstraint:(id)a3;
- (void)setTimedMetadataViewController:(id)a3;
- (void)setUpNextProvider:(id)a3;
- (void)setUpNextViewController:(id)a3;
- (void)tabSelectorControl:(id)a3 didSelectIndex:(unint64_t)a4 previousIndex:(unint64_t)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRUINowPlayingViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUINowPlayingViewController;
  [(TVRUINowPlayingViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TVRemoteUIInfoTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  [(TVRUINowPlayingViewController *)self setCurrentViewControllerIdentifier:v4];

  [(TVRUINowPlayingViewController *)self configureTimedMetadata];
  [(TVRUINowPlayingViewController *)self configureHierarchy];
  v5 = [(TVRUINowPlayingViewController *)self view];
  [v5 setNeedsLayout];

  v6 = [(TVRUINowPlayingViewController *)self view];
  [v6 layoutIfNeeded];

  [(TVRUINowPlayingViewController *)self _updateSelectorControlHeight];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingViewController;
  [(TVRUINowPlayingViewController *)&v10 viewWillAppear:a3];
  v4 = [(TVRUINowPlayingViewController *)self lastExplicitUserSelectedViewControllerIdentifier];

  v5 = [(TVRUINowPlayingViewController *)self lastExplicitUserSelectedViewControllerIdentifier];
  BOOL v6 = [(TVRUINowPlayingViewController *)self _viewControllerIdentifierIsAvailable:v5];

  if (!v4 || !v6)
  {
    objc_super v7 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
    v8 = [(TVRUINowPlayingViewController *)self _availableTabToDisplayForNowPlayingInfo:v7];
    [(TVRUINowPlayingViewController *)self setCurrentViewControllerIdentifier:v8];

    v9 = [(TVRUINowPlayingViewController *)self currentViewControllerIdentifier];
    [(TVRUINowPlayingViewController *)self _updateViewControllerVisibilityForSelectedIdentifier:v9];
  }
}

- (void)resetTabSelection
{
}

+ (double)minimizedPlayerHeight
{
  +[TVRUINowPlayingMiniPlayerViewController minimizedPlayerHeight];
  return result;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
  BOOL v6 = [v5 metadata];
  uint64_t v7 = objc_msgSend(v5, "tvrui_mediaIsStopped") ^ 1;
  uint64_t v8 = objc_msgSend(v5, "tvrui_mediaIsIsPlaying");
  v9 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  [v9 setIsPlaying:v8];

  objc_super v10 = [(TVRUINowPlayingViewController *)self nowPlayingMiniPlayerViewController];
  [v10 setNowPlayingInfo:v5];

  v11 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  [v11 setIsPlaying:v8];

  v12 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  [v12 setIsMediaActive:v7];

  v13 = [v5 playbackRate];
  v14 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  [v14 setPlaybackRate:v13];

  v15 = [(TVRUINowPlayingViewController *)self nowPlayingInfoViewController];
  [v15 setNowPlayingInfo:v5];

  v16 = [(TVRUINowPlayingViewController *)self castViewController];
  [v16 setMetadata:v6];

  v17 = _TVRUINowPlayingLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "NowPlayingInfo update: metadata is not nil, try updating playback info", buf, 2u);
    }

    v19 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];
    v20 = [(TVRUINowPlayingViewController *)self makeTimedMetadataPlaybackInfo];
    [v19 updatePlaybackInfo:v20];

    [(TVRUINowPlayingViewController *)self configureSegControlOrDividerViewVisibility];
    [(TVRUINowPlayingViewController *)self _reconfigureTabsIfNeeded];
  }
  else
  {
    if (v18)
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_227326000, v17, OS_LOG_TYPE_DEFAULT, "NowPlayingInfo update: metadata is nil, retain the last known content", v21, 2u);
    }

    [(TVRUINowPlayingViewController *)self configureSegControlOrDividerViewVisibility];
  }
}

- (id)commandHandler
{
  v2 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  v3 = [v2 commandHandler];

  return v3;
}

- (void)setCommandHandler:(id)a3
{
  id v4 = a3;
  if (([(TVRUINowPlayingViewController *)self isViewLoaded] & 1) == 0) {
    id v5 = (id)[(TVRUINowPlayingViewController *)self view];
  }
  BOOL v6 = [(TVRUINowPlayingViewController *)self mediaControlsViewController];
  [v6 setCommandHandler:v4];

  id v7 = [(TVRUINowPlayingViewController *)self nowPlayingInfoViewController];
  [v7 setCommandHandler:v4];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)TVRUINowPlayingViewController;
  [(TVRUINowPlayingViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(TVRUINowPlayingViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    id v5 = [(TVRUINowPlayingViewController *)self view];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    unint64_t Width = (unint64_t)CGRectGetWidth(v18);
    if ([(TVRUINowPlayingViewController *)self lastLayoutWidth])
    {
      unint64_t v15 = [(TVRUINowPlayingViewController *)self lastLayoutWidth];
      [(TVRUINowPlayingViewController *)self setLastLayoutWidth:Width];
      if (v15 != Width)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__TVRUINowPlayingViewController_viewWillLayoutSubviews__block_invoke;
        block[3] = &unk_2647FFF70;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      [(TVRUINowPlayingViewController *)self setLastLayoutWidth:Width];
    }
  }
}

void __55__TVRUINowPlayingViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "allPossibleChildViewControllerIdentifiers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        CGFloat v7 = [*(id *)(a1 + 32) viewControllerForIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        double v8 = v7;
        if (v7)
        {
          CGFloat v9 = [v7 view];
          [v9 setNeedsLayout];
          [v9 layoutIfNeeded];
          [v9 setNeedsUpdateConstraints];
          [v9 updateConstraintsIfNeeded];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)configureHierarchy
{
  v117[25] = *MEMORY[0x263EF8340];
  [(TVRUINowPlayingViewController *)self setOverrideUserInterfaceStyle:2];
  v102 = objc_alloc_init(TVRUINowPlayingMiniPlayerViewController);
  uint64_t v3 = [(TVRUINowPlayingViewController *)self actionProvider];
  [(TVRUINowPlayingMiniPlayerViewController *)v102 setActionProvider:v3];

  v104 = [(TVRUINowPlayingMiniPlayerViewController *)v102 view];
  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke;
  v115[3] = &unk_2647FFF70;
  v115[4] = self;
  [(TVRUINowPlayingMiniPlayerViewController *)v102 setUpdateTabsHandler:v115];
  v99 = objc_alloc_init(TVRUIMiniPlayerMediaControlsViewController);
  v103 = [(TVRUIMiniPlayerMediaControlsViewController *)v99 view];
  v101 = objc_alloc_init(TVRUINowPlayingInfoViewController);
  uint64_t v4 = [(TVRUINowPlayingViewController *)self actionProvider];
  [(TVRUINowPlayingInfoViewController *)v101 setActionProvider:v4];

  v108 = [(TVRUINowPlayingInfoViewController *)v101 view];
  [v108 setHidden:1];
  v105 = objc_alloc_init(TVRUIUpNextViewController);
  uint64_t v5 = [(TVRUINowPlayingViewController *)self upNextProvider];
  [(TVRUIUpNextViewController *)v105 setUpNextProvider:v5];

  uint64_t v6 = [(TVRUINowPlayingViewController *)self actionProvider];
  [(TVRUIUpNextViewController *)v105 setActionProvider:v6];

  v107 = [(TVRUIUpNextViewController *)v105 view];
  [v107 setHidden:1];
  v100 = objc_alloc_init(TVRUICastViewController);
  CGFloat v7 = [(TVRUINowPlayingViewController *)self actionProvider];
  [(TVRUICastViewController *)v100 setActionProvider:v7];

  v106 = [(TVRUICastViewController *)v100 view];
  [v106 setHidden:1];
  v111 = [(TVRUINowPlayingViewController *)self view];
  double v8 = [MEMORY[0x263F825C8] colorWithWhite:0.1 alpha:1.0];
  [v111 setBackgroundColor:v8];

  [(TVRUINowPlayingViewController *)self bs_addChildViewController:v102];
  [(TVRUINowPlayingViewController *)self bs_addChildViewController:v99];
  [(TVRUINowPlayingViewController *)self bs_addChildViewController:v101];
  [(TVRUINowPlayingViewController *)self bs_addChildViewController:v105];
  [(TVRUINowPlayingViewController *)self bs_addChildViewController:v100];
  v97 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  v110 = [[TVRUITabSelectorControl alloc] initWithItems:v97];
  [(TVRUITabSelectorControl *)v110 setDelegate:self];
  [(TVRUITabSelectorControl *)v110 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v111 addSubview:v110];
  +[TVRUITabSelectorControl defaultHeight];
  double v10 = v9;
  long long v11 = [(TVRUITabSelectorControl *)v110 heightAnchor];
  v98 = [v11 constraintEqualToConstant:v10];

  id v12 = objc_alloc(MEMORY[0x263F82E00]);
  v109 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v109 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v13 = [MEMORY[0x263F825C8] colorWithWhite:0.4 alpha:0.9];
  [v109 setBackgroundColor:v13];

  [v111 addSubview:v109];
  id v93 = objc_alloc_init(MEMORY[0x263F82F90]);
  objc_msgSend(v93, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v15 = v14;
  [v104 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v103 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v108 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v107 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v106 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(TVRUINowPlayingViewController *)self traitCollection];
  BOOL v17 = [v16 userInterfaceIdiom] == 1;

  if (v17) {
    double v18 = 10.0;
  }
  else {
    double v18 = 0.0;
  }
  [v103 setContentHuggingPriority:1 forAxis:COERCE_DOUBLE(1144750080)];
  v32 = (void *)MEMORY[0x263F08938];
  v96 = [v104 topAnchor];
  v95 = [v111 topAnchor];
  v94 = [v96 constraintEqualToAnchor:v95 constant:v15 + *MEMORY[0x263F83DF8] * 2.0 + 18.0];
  v117[0] = v94;
  v92 = [v104 leadingAnchor];
  v91 = [v111 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v117[1] = v90;
  v89 = [v104 trailingAnchor];
  v88 = [v111 trailingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v117[2] = v87;
  v85 = [v103 topAnchor];
  v86 = [v104 bottomAnchor];
  v84 = [v85 constraintEqualToAnchor:v86 constant:37.0];
  v117[3] = v84;
  v83 = [v103 centerXAnchor];
  v82 = [v111 centerXAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v117[4] = v81;
  v80 = [(TVRUITabSelectorControl *)v110 topAnchor];
  v79 = [v103 bottomAnchor];
  v78 = [v80 constraintEqualToAnchor:v79 constant:46.0];
  v117[5] = v78;
  v77 = [(TVRUITabSelectorControl *)v110 leadingAnchor];
  v76 = [v111 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v117[6] = v75;
  v74 = [(TVRUITabSelectorControl *)v110 trailingAnchor];
  v73 = [v111 trailingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v117[7] = v72;
  v117[8] = v98;
  v71 = [v109 heightAnchor];
  v70 = [v71 constraintEqualToConstant:1.0];
  v117[9] = v70;
  v69 = [v109 widthAnchor];
  v68 = [v111 widthAnchor];
  v67 = [v69 constraintEqualToAnchor:v68 constant:-80.0];
  v117[10] = v67;
  v66 = [v109 centerXAnchor];
  v65 = [(TVRUITabSelectorControl *)v110 centerXAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v117[11] = v64;
  v63 = [v109 centerYAnchor];
  v62 = [(TVRUITabSelectorControl *)v110 centerYAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v117[12] = v61;
  v60 = [v108 topAnchor];
  v59 = [(TVRUITabSelectorControl *)v110 bottomAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:16.0];
  v117[13] = v58;
  v57 = [v108 leadingAnchor];
  v56 = [v111 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v117[14] = v55;
  v54 = [v108 trailingAnchor];
  v53 = [v111 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v117[15] = v52;
  v51 = [v108 bottomAnchor];
  v50 = [v111 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-v18];
  v117[16] = v49;
  v48 = [v107 topAnchor];
  v47 = [(TVRUITabSelectorControl *)v110 bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:16.0];
  v117[17] = v46;
  v45 = [v107 leadingAnchor];
  v44 = [v111 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v117[18] = v43;
  v42 = [v107 trailingAnchor];
  v41 = [v111 trailingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v117[19] = v40;
  v39 = [v107 bottomAnchor];
  v38 = [v111 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:-v18];
  v117[20] = v37;
  v36 = [v106 topAnchor];
  v35 = [(TVRUITabSelectorControl *)v110 bottomAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:16.0];
  v117[21] = v34;
  v33 = [v106 leadingAnchor];
  v19 = [v111 leadingAnchor];
  v20 = [v33 constraintEqualToAnchor:v19 constant:20.0];
  v117[22] = v20;
  v21 = [v106 trailingAnchor];
  v22 = [v111 trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-20.0];
  v117[23] = v23;
  v24 = [v106 bottomAnchor];
  v25 = [v111 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:-v18];
  v117[24] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:25];
  [v32 activateConstraints:v27];

  [(TVRUINowPlayingViewController *)self setNowPlayingMiniPlayerViewController:v102];
  [(TVRUINowPlayingViewController *)self setMediaControlsViewController:v99];
  [(TVRUINowPlayingViewController *)self setNowPlayingInfoViewController:v101];
  [(TVRUINowPlayingViewController *)self setUpNextViewController:v105];
  [(TVRUINowPlayingViewController *)self setCastViewController:v100];
  [(TVRUINowPlayingViewController *)self setTabSelectorControl:v110];
  [(TVRUINowPlayingViewController *)self setTabSelectorControlHeightConstraint:v98];
  [(TVRUINowPlayingViewController *)self setDividerView:v109];
  [(TVRUINowPlayingViewController *)self configureSegControlOrDividerViewVisibility];
  objc_initWeak(&location, self);
  uint64_t v116 = objc_opt_class();
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke_2;
  v112[3] = &unk_2648001B8;
  objc_copyWeak(&v113, &location);
  id v29 = (id)[(TVRUINowPlayingViewController *)self registerForTraitChanges:v28 withHandler:v112];

  [(TVRUINowPlayingViewController *)self setOverrideUserInterfaceStyle:2];
  v30 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_panRecognizerDidFire_];
  [v30 setDelegate:self];
  v31 = [(TVRUINowPlayingViewController *)self view];
  [v31 addGestureRecognizer:v30];

  objc_destroyWeak(&v113);
  objc_destroyWeak(&location);
}

uint64_t __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconfigureTabsIfNeeded];
}

void __51__TVRUINowPlayingViewController_configureHierarchy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained view];
    [v2 setNeedsLayout];

    uint64_t v3 = [v4 view];
    [v3 layoutIfNeeded];

    [v4 _updateSelectorControlHeight];
    id WeakRetained = v4;
  }
}

- (void)configureSegControlOrDividerViewVisibility
{
  uint64_t v3 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  unint64_t v4 = [v3 count];

  uint64_t v5 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
  [v5 setHidden:v4 < 2];

  id v6 = [(TVRUINowPlayingViewController *)self dividerView];
  [v6 setHidden:v4 > 1];
}

- (void)panRecognizerDidFire:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  id v6 = [(TVRUINowPlayingViewController *)self view];
  [v4 translationInView:v6];
  double v8 = v7;

  double v9 = [(TVRUINowPlayingViewController *)self view];
  [v9 bounds];
  double Width = CGRectGetWidth(v80);

  double v11 = fabs(v8) / Width;
  if (Width > 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  long long v13 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
  uint64_t v14 = [v13 selectedIndex];

  double v15 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
  v16 = [v15 items];
  unint64_t v17 = [v16 count];

  if (v8 > 0.0 && v14)
  {
    uint64_t v18 = v14 - 1;
  }
  else
  {
    if (v14 + 1 < v17) {
      uint64_t v19 = v14 + 1;
    }
    else {
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v8 <= 0.0) {
      uint64_t v18 = v19;
    }
    else {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v14) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v17 > 1;
  }
  BOOL v21 = v14 + 1 == v17 && v17 > 1;
  BOOL v22 = v18 == 0x7FFFFFFFFFFFFFFFLL && v20;
  BOOL v23 = v18 == 0x7FFFFFFFFFFFFFFFLL && v21;
  char v24 = v18 == 0x7FFFFFFFFFFFFFFFLL || v22 || v23;
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      [(TVRUINowPlayingViewController *)self setInteractiveSwipeGestureIsApplyingRubberbandingTransform:0];
      goto LABEL_74;
    }
    if ((unint64_t)(v5 - 3) > 2) {
      goto LABEL_74;
    }
    v31 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];

    v32 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
    int v33 = [v32 isRunning];

    if (!v31)
    {
      if ([(TVRUINowPlayingViewController *)self interactiveSwipeGestureIsApplyingRubberbandingTransform])
      {
        id v47 = objc_alloc(MEMORY[0x263F82E30]);
        v48 = (void *)[objc_alloc(MEMORY[0x263F82640]) initWithAnimationCurve:2];
        v49 = (void *)[v47 initWithDuration:v48 timingParameters:0.3];

        v50 = [(TVRUINowPlayingViewController *)self viewControllerForIndex:v14];
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke;
        v75[3] = &unk_2647FFF70;
        id v76 = v50;
        id v51 = v50;
        [v49 addAnimations:v75];
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke_2;
        v74[3] = &unk_264800CA0;
        v74[4] = self;
        v74[5] = v14;
        [v49 addCompletion:v74];
        v52 = +[_TVRUIAnimationState animationStateWithIndex:v14 previousIndex:0x7FFFFFFFFFFFFFFFLL toViewController:v51 fromViewController:0 isInteractive:0];
        [(TVRUINowPlayingViewController *)self setCurrentAnimationState:v52];

        [(TVRUINowPlayingViewController *)self setCurrentTabSelectionAnimator:v49];
        [v49 startAnimation];
      }
      goto LABEL_74;
    }
    if (v33)
    {
      if (v5 == 3) {
        char v34 = v24;
      }
      else {
        char v34 = 1;
      }
      if ((v34 & 1) == 0)
      {
        v35 = [(TVRUINowPlayingViewController *)self currentAnimationState];
        if ([v35 index] == v18)
        {
          v36 = [(TVRUINowPlayingViewController *)self currentAnimationState];
          uint64_t v37 = [v36 previousIndex];

          if (v37 == v14) {
            goto LABEL_74;
          }
        }
        else
        {
        }
        v70 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = [NSNumber numberWithUnsignedInteger:v14];
          v72 = [NSNumber numberWithUnsignedInteger:v18];
          LODWORD(buf.a) = 138412546;
          *(void *)((char *)&buf.a + 4) = v71;
          WORD2(buf.b) = 2112;
          *(void *)((char *)&buf.b + 6) = v72;
          _os_log_impl(&dword_227326000, v70, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with animation in flight: performing interruption from: %@ -> %@", (uint8_t *)&buf, 0x16u);
        }
        v73 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
        [v73 setSelectedIndex:v18];

        double v46 = 0.0;
        v42 = self;
        uint64_t v43 = v14;
        uint64_t v44 = v18;
        uint64_t v45 = 0;
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v53 = [(TVRUINowPlayingViewController *)self view];
    [v4 velocityInView:v53];
    double v55 = v54;

    if (v55 != 0.0)
    {
      v56 = [(TVRUINowPlayingViewController *)self currentAnimationState];
      unint64_t v57 = [v56 index];
      v58 = [(TVRUINowPlayingViewController *)self currentAnimationState];
      LODWORD(v57) = v57 < [v58 previousIndex];

      if (v55 > 0.0 != v57)
      {
        v59 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.a) = 0;
          _os_log_impl(&dword_227326000, v59, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with interactive animator, but user changed directions midway through so reverting in-progress interactive tab selection.", (uint8_t *)&buf, 2u);
        }

        v60 = [(TVRUINowPlayingViewController *)self currentAnimationState];
        uint64_t v61 = [v60 previousIndex];

        v62 = [(TVRUINowPlayingViewController *)self currentAnimationState];
        uint64_t v63 = [v62 index];

        v64 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
        [v64 setSelectedIndex:v61];

        id v65 = objc_alloc(MEMORY[0x263F82E30]);
        v66 = (void *)[objc_alloc(MEMORY[0x263F82640]) initWithAnimationCurve:2];
        v67 = (void *)[v65 initWithDuration:v66 timingParameters:0.3];

        [(TVRUINowPlayingViewController *)self _performTabAnimationFromIndex:v63 toIndex:v61 isInteractive:0 interactivePercentage:v67 animator:0.0];
        goto LABEL_74;
      }
    }
    v68 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_227326000, v68, OS_LOG_TYPE_INFO, "ANIM: pan gesture ended with interactive animator: start animation...", (uint8_t *)&buf, 2u);
    }

    v30 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
    [v30 startAnimation];
LABEL_64:

    goto LABEL_74;
  }
  v25 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];

  if (v25)
  {
    v26 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
    char v27 = [v26 isRunning];

    if (v27) {
      goto LABEL_74;
    }
    v28 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = [NSNumber numberWithDouble:v12];
      LODWORD(buf.a) = 138412290;
      *(void *)((char *)&buf.a + 4) = v29;
      _os_log_impl(&dword_227326000, v28, OS_LOG_TYPE_INFO, "ANIM: updating interactive animator with fractionComplete: %@", (uint8_t *)&buf, 0xCu);
    }
    v30 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
    [v30 setFractionComplete:v12];
    goto LABEL_64;
  }
  if ((v24 & 1) == 0)
  {
    v39 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = [NSNumber numberWithUnsignedInteger:v14];
      v41 = [NSNumber numberWithUnsignedInteger:v18];
      LODWORD(buf.a) = 138412546;
      *(void *)((char *)&buf.a + 4) = v40;
      WORD2(buf.b) = 2112;
      *(void *)((char *)&buf.b + 6) = v41;
      _os_log_impl(&dword_227326000, v39, OS_LOG_TYPE_INFO, "ANIM: pan fired and no animator present -- calling performTabAnimationFrom: %@ to: %@", (uint8_t *)&buf, 0x16u);
    }
    v42 = self;
    uint64_t v43 = v14;
    uint64_t v44 = v18;
    uint64_t v45 = 1;
    double v46 = v12;
LABEL_73:
    [(TVRUINowPlayingViewController *)v42 _performTabAnimationFromIndex:v43 toIndex:v44 isInteractive:v45 interactivePercentage:v46];
    goto LABEL_74;
  }
  if (v22 || v23)
  {
    if (v22)
    {
      double v38 = 0.0;
      if (v8 > 0.0) {
        double v38 = v8;
      }
    }
    else
    {
      double v38 = 0.0;
      if (v23 && v8 < 0.0) {
        double v38 = v8;
      }
    }
    double v69 = v38 * 0.5;
    if (v38 * 0.5 != 0.0)
    {
      [(TVRUINowPlayingViewController *)self setInteractiveSwipeGestureIsApplyingRubberbandingTransform:1];
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeTranslation(&buf, v69, 0.0);
      CGAffineTransform v77 = buf;
      [(TVRUINowPlayingViewController *)self _applyTransform:&v77 toChildViewControllerAtIndex:v14];
    }
  }
LABEL_74:
}

void __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) view];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

uint64_t __54__TVRUINowPlayingViewController_panRecognizerDidFire___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _tabAnimationDidCompleteWithFinalPosition:a2 viewControllerIndex:*(void *)(a1 + 40)];
}

- (void)_tabAnimationDidCompleteWithFinalPosition:(int64_t)a3 viewControllerIndex:(unint64_t)a4
{
  if (!a3)
  {
    -[TVRUINowPlayingViewController setCurrentAnimationState:](self, "setCurrentAnimationState:");
    [(TVRUINowPlayingViewController *)self setCurrentTabSelectionAnimator:0];
    uint64_t v7 = [(TVRUINowPlayingViewController *)self viewControllerIdentifierForIndex:a4];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v7 = [(TVRUINowPlayingViewController *)self _callChildViewControllerDisappearingForAllExceptIdentifier:v7];
      uint64_t v8 = v9;
    }
    MEMORY[0x270F9A758](v7, v8);
  }
}

- (void)_applyTransform:(CGAffineTransform *)a3 toChildViewControllerAtIndex:(unint64_t)a4
{
  uint64_t v5 = [(TVRUINowPlayingViewController *)self viewControllerForIndex:a4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "view", *(void *)&a3->a, *(void *)&a3->b, *(void *)&a3->c, *(void *)&a3->d, *(void *)&a3->tx, *(void *)&a3->ty);
    [v7 setTransform:&v8];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateSelectorControlHeight
{
  uint64_t v3 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
  [v3 layoutHeight];
  double v5 = v4;

  if (v5 > 0.0)
  {
    id v6 = [(TVRUINowPlayingViewController *)self tabSelectorControlHeightConstraint];
    [v6 setConstant:v5];
  }
}

- (BOOL)_canDisplayInsightsTabForNowPlayingInfo:(id)a3
{
  uint64_t v3 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  double v4 = [v3 rawTimedMetadata];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)_canDisplayUpNextTabForNowPlayingInfo:(id)a3
{
  return objc_msgSend(a3, "tvrui_hasCanonicalID");
}

- (BOOL)_canDisplayCastTabForNowPlayingInfo:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x263F7C9A8], "isInternalInstall", a3);
  return v3 & +[TVRUIFeatures showExperimentalCastTab];
}

- (BOOL)_canDisplayInfoForNowPlayingInfo:(id)a3
{
  return objc_msgSend(a3, "tvrui_hasUnknownCanonicalID") ^ 1;
}

- (id)_availableTabToDisplayForNowPlayingInfo:(id)a3
{
  id v4 = a3;
  if ([(TVRUINowPlayingViewController *)self _canDisplayInsightsTabForNowPlayingInfo:v4])
  {
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    uint64_t v7 = @"TVRemoteUIInSightTabTitle";
LABEL_5:
    long long v8 = [v5 localizedStringForKey:v7 value:&stru_26DB4CAE0 table:@"Localizable"];

    goto LABEL_6;
  }
  if ([(TVRUINowPlayingViewController *)self _canDisplayInfoForNowPlayingInfo:v4])
  {
    BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    uint64_t v7 = @"TVRemoteUIInfoTabTitle";
    goto LABEL_5;
  }
  if ([(TVRUINowPlayingViewController *)self _canDisplayUpNextTabForNowPlayingInfo:v4])
  {
    long long v8 = [(TVRUINowPlayingViewController *)self _upNextIdentifier];
  }
  else
  {
    long long v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)configureTimedMetadata
{
  char v3 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Configure timed metadata", (uint8_t *)v9, 2u);
  }

  id v4 = [(TVRUINowPlayingViewController *)self makeTimedMetadataPlaybackInfo];
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2050000000;
  BOOL v5 = (void *)getVUITimeMetadataFactoryClass_softClass;
  uint64_t v13 = getVUITimeMetadataFactoryClass_softClass;
  if (!getVUITimeMetadataFactoryClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getVUITimeMetadataFactoryClass_block_invoke;
    v9[3] = &unk_264800D40;
    v9[4] = &v10;
    __getVUITimeMetadataFactoryClass_block_invoke((uint64_t)v9);
    BOOL v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  uint64_t v7 = [v6 sharedInstance];
  long long v8 = [v7 makeViewController:v4];

  [(TVRUINowPlayingViewController *)self setTimedMetadataViewController:v8];
}

- (id)makeTimedMetadataPlaybackInfo
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  char v3 = (void *)getVUITimedMetadataPlaybackInfoClass_softClass;
  uint64_t v37 = getVUITimedMetadataPlaybackInfoClass_softClass;
  if (!getVUITimedMetadataPlaybackInfoClass_softClass)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __getVUITimedMetadataPlaybackInfoClass_block_invoke;
    v33[3] = &unk_264800D40;
    v33[4] = &v34;
    __getVUITimedMetadataPlaybackInfoClass_block_invoke((uint64_t)v33);
    char v3 = (void *)v35[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v34, 8);
  id v5 = objc_alloc_init(v4);
  id v6 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  uint64_t v7 = [v6 metadata];
  long long v8 = [v7 programID];
  [v5 setProgramId:v8];

  uint64_t v9 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  uint64_t v10 = [v9 metadata];
  double v11 = [v10 audioLanguage];
  [v5 setAudioLanguage:v11];

  uint64_t v12 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  uint64_t v13 = [v12 playbackRate];
  [v13 doubleValue];
  objc_msgSend(v5, "setPlaybackRate:");

  uint64_t v14 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  double v15 = [v14 metadata];
  v16 = [v15 timeOffset];
  [v16 doubleValue];
  objc_msgSend(v5, "setCurrentTime:");

  unint64_t v17 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  uint64_t v18 = [v17 metadata];
  uint64_t v19 = [v18 iTunesStoreIdentifier];
  [v5 setAdamId:v19];

  BOOL v20 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  BOOL v21 = [v20 metadata];
  BOOL v22 = [v21 mainContentStartTime];
  [v22 doubleValue];
  objc_msgSend(v5, "setFeatureStartTime:");

  BOOL v23 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  char v24 = [v23 rawTimedMetadata];
  [v5 setRawTimedMetadata:v24];

  v25 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  v26 = [v25 metadata];
  char v27 = [v26 timestamp];

  if (v27)
  {
    v28 = (void *)MEMORY[0x263EFF910];
    [v27 doubleValue];
    uint64_t v29 = objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v30 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33[0]) = 0;
      _os_log_impl(&dword_227326000, v30, OS_LOG_TYPE_DEFAULT, "timestamp is nil, use current date", (uint8_t *)v33, 2u);
    }

    uint64_t v29 = [MEMORY[0x263EFF910] now];
  }
  v31 = (void *)v29;
  [v5 setTimeStamp:v29];

  return v5;
}

- (void)_updateViewControllerVisibilityForSelectedIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TVRUINowPlayingViewController *)self configureSegControlOrDividerViewVisibility];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"TVRemoteUIInSightTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  int v7 = [v4 isEqualToString:v6];

  long long v8 = [(TVRUINowPlayingViewController *)self _upNextIdentifier];
  uint64_t v9 = [v4 isEqualToString:v8];

  if (v7) {
    [(TVRUINowPlayingViewController *)self configureTimedMetadataView];
  }
  uint64_t v10 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];
  double v11 = [v10 view];
  [v11 setHidden:v7 ^ 1u];

  [(TVRUINowPlayingViewController *)self _callChildViewControllerAppearanceForAppearingIdentifier:v4];
  uint64_t v12 = [(TVRUINowPlayingViewController *)self upNextViewController];
  [v12 setIsVisibleInParentUI:v9];

  if (v9)
  {
    uint64_t v13 = [(TVRUINowPlayingViewController *)self upNextProvider];
    [v13 refreshIfNeeded];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = [(TVRUINowPlayingViewController *)self allPossibleChildViewControllerIdentifiers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v20 = [v19 isEqualToString:v4];
        BOOL v21 = [(TVRUINowPlayingViewController *)self viewControllerForIdentifier:v19];
        BOOL v22 = v21;
        if (v21)
        {
          BOOL v23 = [v21 view];
          [v23 setHidden:v20 ^ 1u];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  if ([v4 length])
  {
    unint64_t v24 = [(TVRUINowPlayingViewController *)self indexForViewControllerIdentifier:v4];
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v25 = v24;
      v26 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
      uint64_t v27 = [v26 selectedIndex];

      if (v25 != v27)
      {
        v28 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
        [v28 setSelectedIndex:v25];
      }
    }
  }
}

- (void)_callChildViewControllerAppearanceForAppearingIdentifier:(id)a3
{
}

- (void)_callChildViewControllerDisappearingForAllExceptIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TVRUINowPlayingViewController *)self allPossibleChildViewControllerIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (([v4 isEqualToString:v10] & 1) == 0) {
          [(TVRUINowPlayingViewController *)self _callChildViewControllerAppearanceForIdentifier:v10 appearing:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_callChildViewControllerAppearanceForIdentifier:(id)a3 appearing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(TVRUINowPlayingViewController *)self viewControllerForIdentifier:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 _appearState];
    if ((v9 - 1) > 1)
    {
      if (v9 != 3 && v9 || !v4)
      {
LABEL_10:
        uint64_t v10 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          long long v11 = [NSNumber numberWithBool:v4];
          int v13 = 138412546;
          id v14 = v6;
          __int16 v15 = 2112;
          uint64_t v16 = v11;
          long long v12 = "ANIM: Not calling childViewController appearance transitions for %@, isAppearing=%@ as VC is already in "
                "this visibility state";
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }
    else if (v4)
    {
      goto LABEL_10;
    }
    [v8 beginAppearanceTransition:v4 animated:0];
    [v8 endAppearanceTransition];
    uint64_t v10 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = [NSNumber numberWithBool:v4];
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      long long v12 = "ANIM: Calling childViewController appearance transitions for %@, isAppearing=%@";
LABEL_12:
      _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 0x16u);
    }
LABEL_13:
  }
}

- (void)configureTimedMetadataView
{
  v29[4] = *MEMORY[0x263EF8340];
  char v3 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Configure timed metadata view", buf, 2u);
  }

  BOOL v4 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];
  id v5 = [v4 view];
  id v6 = [v5 superview];
  uint64_t v7 = [(TVRUINowPlayingViewController *)self view];

  if (v6 != v7)
  {
    uint64_t v8 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Add timed metadata view to view hierarchy", buf, 2u);
    }

    int v9 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];
    uint64_t v10 = [v9 view];
    v26 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
    long long v11 = [(TVRUINowPlayingViewController *)self view];
    [v10 setClipsToBounds:1];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setHidden:1];
    uint64_t v27 = v9;
    [(TVRUINowPlayingViewController *)self setTimedMetadataViewController:v9];
    [(TVRUINowPlayingViewController *)self bs_addChildViewController:v9];
    int v20 = (void *)MEMORY[0x263F08938];
    unint64_t v25 = [v10 topAnchor];
    unint64_t v24 = [v26 bottomAnchor];
    BOOL v23 = [v25 constraintEqualToAnchor:v24 constant:20.0];
    v29[0] = v23;
    BOOL v22 = [v10 leadingAnchor];
    BOOL v21 = [v11 leadingAnchor];
    long long v12 = [v22 constraintEqualToAnchor:v21 constant:0.0];
    v29[1] = v12;
    int v13 = [v10 trailingAnchor];
    id v14 = [v11 trailingAnchor];
    __int16 v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v29[2] = v15;
    uint64_t v16 = [v10 bottomAnchor];
    uint64_t v17 = [v11 bottomAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    v29[3] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
    [v20 activateConstraints:v19];
  }
}

- (NSArray)childViewControllerIdentifiers
{
  v23[1] = *MEMORY[0x263EF8340];
  char v3 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  BOOL v4 = [(TVRUINowPlayingViewController *)self _canDisplayInfoForNowPlayingInfo:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"TVRemoteUIInfoTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    v23[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v8 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  BOOL v9 = [(TVRUINowPlayingViewController *)self _canDisplayInsightsTabForNowPlayingInfo:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v11 = [v10 localizedStringForKey:@"TVRemoteUIInSightTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v12 = [v7 arrayByAddingObject:v11];

    uint64_t v7 = (void *)v12;
  }
  int v13 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  BOOL v14 = [(TVRUINowPlayingViewController *)self _canDisplayCastTabForNowPlayingInfo:v13];

  if (v14)
  {
    __int16 v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"TVRemoteUICastTab" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v17 = [v7 arrayByAddingObject:v16];

    uint64_t v7 = (void *)v17;
  }
  uint64_t v18 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
  BOOL v19 = [(TVRUINowPlayingViewController *)self _canDisplayUpNextTabForNowPlayingInfo:v18];

  if (v19)
  {
    int v20 = [(TVRUINowPlayingViewController *)self _upNextIdentifier];
    uint64_t v21 = [v7 arrayByAddingObject:v20];

    uint64_t v7 = (void *)v21;
  }
  return (NSArray *)v7;
}

- (BOOL)_viewControllerIdentifierIsAvailable:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  uint64_t v6 = [v5 indexOfObject:v4];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)allPossibleChildViewControllerIdentifiers
{
  v12[4] = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"TVRemoteUIInfoTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  v12[0] = v4;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"TVRemoteUIInSightTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  v12[1] = v6;
  uint64_t v7 = [(TVRUINowPlayingViewController *)self _upNextIdentifier];
  v12[2] = v7;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v9 = [v8 localizedStringForKey:@"TVRemoteUICastTab" value:&stru_26DB4CAE0 table:@"Localizable"];
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  return (NSArray *)v10;
}

- (NSDictionary)childViewControllerDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(TVRUINowPlayingViewController *)self nowPlayingInfoViewController];
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"TVRemoteUIInfoTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v3 setObject:v4 forKeyedSubscript:v6];

  uint64_t v7 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];

  if (v7)
  {
    uint64_t v8 = [(TVRUINowPlayingViewController *)self timedMetadataViewController];
    BOOL v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"TVRemoteUIInSightTabTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
    [v3 setObject:v8 forKeyedSubscript:v10];
  }
  long long v11 = [(TVRUINowPlayingViewController *)self upNextViewController];
  uint64_t v12 = [(TVRUINowPlayingViewController *)self _upNextIdentifier];
  [v3 setObject:v11 forKeyedSubscript:v12];

  int v13 = [(TVRUINowPlayingViewController *)self castViewController];
  BOOL v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v15 = [v14 localizedStringForKey:@"TVRemoteUICastTab" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v3 setObject:v13 forKeyedSubscript:v15];

  return (NSDictionary *)v3;
}

- (unint64_t)indexForViewControllerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  unint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];

  return v6;
}

- (id)viewControllerIdentifierForIndex:(unint64_t)a3
{
  id v5 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  }
  return v8;
}

- (id)viewControllerForIndex:(unint64_t)a3
{
  id v4 = [(TVRUINowPlayingViewController *)self viewControllerIdentifierForIndex:a3];
  if (v4)
  {
    id v5 = [(TVRUINowPlayingViewController *)self childViewControllerDict];
    unint64_t v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)viewControllerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRUINowPlayingViewController *)self childViewControllerDict];
  unint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_reconfigureTabsIfNeeded
{
  id v3 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
  id v4 = [(TVRUINowPlayingViewController *)self childViewControllerIdentifiers];
  [v3 updateItems:v4 animated:1];

  id v5 = [(TVRUINowPlayingViewController *)self currentViewControllerIdentifier];
  unint64_t v6 = [(TVRUINowPlayingViewController *)self indexForViewControllerIdentifier:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(TVRUINowPlayingViewController *)self nowPlayingInfo];
    uint64_t v8 = [(TVRUINowPlayingViewController *)self _availableTabToDisplayForNowPlayingInfo:v7];
    [(TVRUINowPlayingViewController *)self setCurrentViewControllerIdentifier:v8];
  }
  BOOL v9 = [(TVRUINowPlayingViewController *)self currentViewControllerIdentifier];
  [(TVRUINowPlayingViewController *)self _updateViewControllerVisibilityForSelectedIdentifier:v9];

  [(TVRUINowPlayingViewController *)self _updateSelectorControlHeight];
}

- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6
{
  BOOL v7 = a5;
  id v11 = +[TVRUICubicSpringAnimator standardSpringAnimator];
  [(TVRUINowPlayingViewController *)self _performTabAnimationFromIndex:a3 toIndex:a4 isInteractive:v7 interactivePercentage:v11 animator:a6];
}

- (void)_performTabAnimationFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 isInteractive:(BOOL)a5 interactivePercentage:(double)a6 animator:(id)a7
{
  BOOL v8 = a5;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v61 = a7;
  uint64_t v12 = [(TVRUINowPlayingViewController *)self viewControllerForIndex:a4];
  uint64_t v13 = [(TVRUINowPlayingViewController *)self viewControllerForIndex:a3];
  BOOL v14 = (void *)v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v17 = !v15 && a4 != a3;
  uint64_t v18 = [(TVRUINowPlayingViewController *)self viewControllerIdentifierForIndex:a4];
  [(TVRUINowPlayingViewController *)self setCurrentViewControllerIdentifier:v18];
  BOOL v19 = [(TVRUINowPlayingViewController *)self currentViewControllerIdentifier];
  [(TVRUINowPlayingViewController *)self setLastExplicitUserSelectedViewControllerIdentifier:v19];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke;
  aBlock[3] = &unk_264800638;
  aBlock[4] = self;
  id v20 = v18;
  id v82 = v20;
  uint64_t v21 = (void (**)(void))_Block_copy(aBlock);
  BOOL v60 = v8;
  if (v8)
  {
    BOOL v22 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
    [v22 setSelectedIndex:a4];
  }
  if (v17)
  {
    double v54 = v21;
    BOOL v23 = [(TVRUINowPlayingViewController *)self currentAnimationState];
    v58 = +[_TVRUIAnimationState animationStateWithIndex:a4 previousIndex:a3 toViewController:v12 fromViewController:v14 isInteractive:v60];
    id v55 = v20;
    [(TVRUINowPlayingViewController *)self _callChildViewControllerAppearanceForAppearingIdentifier:v20];
    unint64_t v24 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
    if ([v24 isRunning])
    {
      unint64_t v25 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
      int v26 = [v25 isInterruptible];

      if (v26)
      {
        uint64_t v27 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
        [v27 stopAnimation:0];

        v28 = [(TVRUINowPlayingViewController *)self currentTabSelectionAnimator];
        [v28 finishAnimationAtPosition:2];

        [(TVRUINowPlayingViewController *)self setCurrentTabSelectionAnimator:0];
      }
    }
    else
    {
    }
    uint64_t v31 = [(TVRUINowPlayingViewController *)self view];
    [(id)v31 bounds];
    double Width = CGRectGetWidth(v87);

    BOOL v53 = a4 < a3;
    LOBYTE(v31) = [v23 isParticpantViewController:v12];
    unint64_t v57 = v14;
    char v33 = [v23 isParticpantViewController:v14];
    v59 = v23;
    if (v31)
    {
      uint64_t v34 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [NSNumber numberWithUnsignedInteger:a4];
        *(_DWORD *)CGAffineTransform buf = 138412290;
        v85 = v35;
        _os_log_impl(&dword_227326000, v34, OS_LOG_TYPE_INFO, "ANIM: viewController @ index=%@ is currently animating, not setting transform.", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v36 = [v12 view];
      [v36 setHidden:0];

      double v37 = -Width;
      if (a4 >= a3) {
        double v37 = Width;
      }
      CGAffineTransformMakeTranslation(&v80, v37, 0.0);
      uint64_t v34 = [v12 view];
      CGAffineTransform v79 = v80;
      [v34 setTransform:&v79];
    }

    double v38 = (_OWORD *)MEMORY[0x263F000D0];
    v56 = v12;
    if (v33)
    {
      v39 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = [NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)CGAffineTransform buf = 138412290;
        v85 = v40;
        _os_log_impl(&dword_227326000, v39, OS_LOG_TYPE_INFO, "ANIM: previous VC @ index=%@ is currently animating, not resetting hidden state = NO", buf, 0xCu);
      }
    }
    else
    {
      v41 = [v57 view];
      [v41 setHidden:0];

      v39 = [v57 view];
      long long v42 = v38[1];
      v78[0] = *v38;
      v78[1] = v42;
      v78[2] = v38[2];
      [v39 setTransform:v78];
    }

    uint64_t v43 = [v23 viewControllersNoLongerAnimatingForDestinationAnimationState:v58];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v83 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v75;
      long long v63 = v38[1];
      long long v64 = *v38;
      long long v62 = v38[2];
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v75 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v49 = [v48 view];
          [v49 setHidden:1];

          v50 = [v48 view];
          v73[0] = v64;
          v73[1] = v63;
          v73[2] = v62;
          [v50 setTransform:v73];

          id v51 = _TVRUINowPlayingLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)CGAffineTransform buf = 138412290;
            v85 = v48;
            _os_log_impl(&dword_227326000, v51, OS_LOG_TYPE_INFO, "ANIM: resetting VC (which is no longering in animation) %@", buf, 0xCu);
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v74 objects:v83 count:16];
      }
      while (v45);
    }
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_44;
    v68[3] = &unk_264800CC8;
    uint64_t v12 = v56;
    id v69 = v56;
    BOOL v14 = v57;
    id v52 = v57;
    id v70 = v52;
    BOOL v72 = v53;
    double v71 = Width;
    long long v30 = v61;
    [v61 addAnimations:v68];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_45;
    v65[3] = &unk_264800CF0;
    id v66 = v52;
    uint64_t v21 = v54;
    v67 = v54;
    [v61 addCompletion:v65];
    if (v60)
    {
      [v61 setScrubsLinearly:1];
      [v61 setFractionComplete:a6];
      [v61 pauseAnimation];
    }
    else
    {
      [v61 startAnimation];
    }
    id v20 = v55;
    [(TVRUINowPlayingViewController *)self setCurrentAnimationState:v58];
    [(TVRUINowPlayingViewController *)self setCurrentTabSelectionAnimator:v61];

    long long v29 = v59;
  }
  else
  {
    v21[2](v21);
    long long v29 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_227326000, v29, OS_LOG_TYPE_INFO, "ANIM: not possible to animate, commiting immediately to final state.", buf, 2u);
    }
    long long v30 = v61;
  }
}

uint64_t __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAnimationState:0];
  [*(id *)(a1 + 32) setCurrentTabSelectionAnimator:0];
  [*(id *)(a1 + 32) _updateViewControllerVisibilityForSelectedIdentifier:*(void *)(a1 + 40)];
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _callChildViewControllerDisappearingForAllExceptIdentifier:v3];
}

void __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_44(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v10[0] = *MEMORY[0x263F000D0];
  v10[1] = v3;
  v10[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v10];

  double v4 = *(double *)(a1 + 48);
  if (!*(unsigned char *)(a1 + 56)) {
    double v4 = -v4;
  }
  CGAffineTransformMakeTranslation(&v9, v4, 0.0);
  id v5 = [*(id *)(a1 + 40) view];
  CGAffineTransform v8 = v9;
  [v5 setTransform:&v8];

  unint64_t v6 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_INFO, "ANIM: animations firing...", v7, 2u);
  }
}

void __116__TVRUINowPlayingViewController__performTabAnimationFromIndex_toIndex_isInteractive_interactivePercentage_animator___block_invoke_45(uint64_t a1, uint64_t a2)
{
  double v4 = _TVRUINowPlayingLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_INFO, "ANIM: animation completion firing, but doing nothing as the finalPosition != .end", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_INFO, "ANIM: animation completion firing.", buf, 2u);
    }

    unint64_t v6 = [*(id *)(a1 + 32) view];
    [v6 setHidden:1];

    BOOL v7 = [*(id *)(a1 + 32) view];
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v9[0] = *MEMORY[0x263F000D0];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v7 setTransform:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_upNextIdentifier
{
  int v2 = [MEMORY[0x263F7C9A8] testarossaEnabled];
  long long v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = v3;
  if (v2) {
    BOOL v5 = @"TVRemoteUIUpNextTab";
  }
  else {
    BOOL v5 = @"TVRemoteUIUpNextTabDeprecated";
  }
  unint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26DB4CAE0 table:@"Localizable"];

  return v6;
}

- (void)tabSelectorControl:(id)a3 didSelectIndex:(unint64_t)a4 previousIndex:(unint64_t)a5
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TVRUINowPlayingViewController *)self nowPlayingInfoViewController];
  char v6 = [v5 userInteractionInProgress];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    long long v8 = [(TVRUINowPlayingViewController *)self view];
    [v4 locationInView:v8];
    double v10 = v9;

    id v11 = [(TVRUINowPlayingViewController *)self tabSelectorControl];
    [v11 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v21.origin.x = v13;
    v21.origin.y = v15;
    v21.size.width = v17;
    v21.size.height = v19;
    BOOL v7 = v10 > CGRectGetMaxY(v21);
  }

  return v7;
}

- (TVRUIUpNextProviding)upNextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_upNextProvider);
  return (TVRUIUpNextProviding *)WeakRetained;
}

- (void)setUpNextProvider:(id)a3
{
}

- (TVRUIActionProviding)actionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionProvider);
  return (TVRUIActionProviding *)WeakRetained;
}

- (void)setActionProvider:(id)a3
{
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (TVRUITabSelectorControl)tabSelectorControl
{
  return self->_tabSelectorControl;
}

- (void)setTabSelectorControl:(id)a3
{
}

- (NSLayoutConstraint)tabSelectorControlHeightConstraint
{
  return self->_tabSelectorControlHeightConstraint;
}

- (void)setTabSelectorControlHeightConstraint:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (TVRUINowPlayingMiniPlayerViewController)nowPlayingMiniPlayerViewController
{
  return self->_nowPlayingMiniPlayerViewController;
}

- (void)setNowPlayingMiniPlayerViewController:(id)a3
{
}

- (TVRUIMiniPlayerMediaControlsViewController)mediaControlsViewController
{
  return self->_mediaControlsViewController;
}

- (void)setMediaControlsViewController:(id)a3
{
}

- (TVRUINowPlayingInfoViewController)nowPlayingInfoViewController
{
  return self->_nowPlayingInfoViewController;
}

- (void)setNowPlayingInfoViewController:(id)a3
{
}

- (TVRUIUpNextViewController)upNextViewController
{
  return self->_upNextViewController;
}

- (void)setUpNextViewController:(id)a3
{
}

- (TVRUICastViewController)castViewController
{
  return self->_castViewController;
}

- (void)setCastViewController:(id)a3
{
}

- (NSString)currentViewControllerIdentifier
{
  return self->_currentViewControllerIdentifier;
}

- (void)setCurrentViewControllerIdentifier:(id)a3
{
}

- (NSString)lastExplicitUserSelectedViewControllerIdentifier
{
  return self->_lastExplicitUserSelectedViewControllerIdentifier;
}

- (void)setLastExplicitUserSelectedViewControllerIdentifier:(id)a3
{
}

- (UIViewPropertyAnimator)currentTabSelectionAnimator
{
  return self->_currentTabSelectionAnimator;
}

- (void)setCurrentTabSelectionAnimator:(id)a3
{
}

- (_TVRUIAnimationState)currentAnimationState
{
  return self->_currentAnimationState;
}

- (void)setCurrentAnimationState:(id)a3
{
}

- (BOOL)interactiveSwipeGestureIsApplyingRubberbandingTransform
{
  return self->_interactiveSwipeGestureIsApplyingRubberbandingTransform;
}

- (void)setInteractiveSwipeGestureIsApplyingRubberbandingTransform:(BOOL)a3
{
  self->_interactiveSwipeGestureIsApplyingRubberbandingTransform = a3;
}

- (unint64_t)lastLayoutWidth
{
  return self->_lastLayoutWidth;
}

- (void)setLastLayoutWidth:(unint64_t)a3
{
  self->_lastLayoutdouble Width = a3;
}

- (VUITimeMetadataViewController)timedMetadataViewController
{
  return self->_timedMetadataViewController;
}

- (void)setTimedMetadataViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataViewController, 0);
  objc_storeStrong((id *)&self->_currentAnimationState, 0);
  objc_storeStrong((id *)&self->_currentTabSelectionAnimator, 0);
  objc_storeStrong((id *)&self->_lastExplicitUserSelectedViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentViewControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_castViewController, 0);
  objc_storeStrong((id *)&self->_upNextViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoViewController, 0);
  objc_storeStrong((id *)&self->_mediaControlsViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingMiniPlayerViewController, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_tabSelectorControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tabSelectorControl, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
  objc_destroyWeak((id *)&self->_upNextProvider);
}

@end