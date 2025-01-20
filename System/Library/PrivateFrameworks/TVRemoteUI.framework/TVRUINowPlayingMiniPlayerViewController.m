@interface TVRUINowPlayingMiniPlayerViewController
+ (double)minimizedPlayerHeight;
- (BOOL)_canShowWhileLocked;
- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout;
- (BOOL)_effectiveImageFromNowPlayingInfoIsFallbackImage:(id)a3;
- (BOOL)_isCurrentlyStackedLayout;
- (CUSystemMonitor)systemMonitor;
- (NSArray)stackedTextLayoutConstraints;
- (NSArray)standardLayoutConstraints;
- (NSURLSession)urlSession;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRUIActionProviding)actionProvider;
- (TVRUINowPlayingMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (UIButton)actionButton;
- (UIImage)fallbackImage;
- (UIImage)fetchedImage;
- (UIImageView)imageView;
- (UIImageView)narrowAspectImageView;
- (UILabel)secondaryLabel;
- (UILabel)titleLabel;
- (UIVisualEffectView)narrowAspectImageVisualEffectView;
- (id)_effectiveImageFromNowPlayingInfo:(id)a3;
- (id)actionButtonMenu;
- (id)updateTabsHandler;
- (id)urlForProductPageKind:(int64_t)a3;
- (void)_requestImageIfNeededForNowPlayingInfo:(id)a3;
- (void)_setupSystemMonitor;
- (void)_updateContraintsForStackedLayout:(BOOL)a3;
- (void)configureHierarchy;
- (void)dealloc;
- (void)onScreenLockChanged;
- (void)openProductPageForKind:(int64_t)a3;
- (void)openURL:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setActionProvider:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setFetchedImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNarrowAspectImageView:(id)a3;
- (void)setNarrowAspectImageVisualEffectView:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setStackedTextLayoutConstraints:(id)a3;
- (void)setStandardLayoutConstraints:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpdateTabsHandler:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)shareEpisode;
- (void)sharePrimary;
- (void)shareShow;
- (void)updateFromNowPlayingInfo:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVRUINowPlayingMiniPlayerViewController

- (TVRUINowPlayingMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  v4 = [(TVRUINowPlayingMiniPlayerViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

    [(TVRUINowPlayingMiniPlayerViewController *)v4 _setupSystemMonitor];
  }
  return v4;
}

- (void)_setupSystemMonitor
{
  v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x263F385E0]);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v3;

  objc_initWeak(&location, self);
  v5 = self->_systemMonitor;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke;
  v9[3] = &unk_264800468;
  objc_copyWeak(&v10, &location);
  [(CUSystemMonitor *)v5 setScreenLockedChangedHandler:v9];
  v6 = self->_systemMonitor;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke_2;
  v7[3] = &unk_264800468;
  objc_copyWeak(&v8, &location);
  [(CUSystemMonitor *)v6 activateWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained onScreenLockChanged];
    id WeakRetained = v2;
  }
}

void __62__TVRUINowPlayingMiniPlayerViewController__setupSystemMonitor__block_invoke_2(uint64_t a1)
{
  id v2 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained onScreenLockChanged];
  }
}

- (void)onScreenLockChanged
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = _TVRUINowPlayingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(TVRUINowPlayingMiniPlayerViewController *)self systemMonitor];
    int v5 = [v4 screenLocked];
    v6 = @"unlocked";
    if (v5) {
      v6 = @"locked";
    }
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Updating actionButton menu because screen is now %@", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButtonMenu];
  id v8 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
  [v8 setMenu:v7];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  [(TVRUINowPlayingMiniPlayerViewController *)&v3 viewDidLoad];
  [(TVRUINowPlayingMiniPlayerViewController *)self configureHierarchy];
}

+ (double)minimizedPlayerHeight
{
  return 88.0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  [(TVRUINowPlayingMiniPlayerViewController *)&v5 viewWillAppear:a3];
  v4 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  [(TVRUINowPlayingMiniPlayerViewController *)self updateFromNowPlayingInfo:v4];
}

- (void)configureHierarchy
{
  uint64_t v193 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F82818];
  objc_super v3 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
  v171 = [v2 configurationWithFont:v3];

  v4 = (void *)MEMORY[0x263F823D0];
  objc_super v5 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle" withConfiguration:v171];
  v170 = [v4 actionWithTitle:&stru_26DB4CAE0 image:v5 identifier:0 handler:&__block_literal_global_20];

  v169 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  v178 = [MEMORY[0x263F824E8] buttonWithConfiguration:v169 primaryAction:v170];
  v6 = [MEMORY[0x263F825C8] whiteColor];
  [v178 setTintColor:v6];

  [v178 setOverrideUserInterfaceStyle:2];
  v168 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButtonMenu];
  [v178 setMenu:v168];
  [v178 setShowsMenuAsPrimaryAction:1];
  id v7 = objc_alloc_init(MEMORY[0x263F82828]);
  [v7 setContentMode:1];
  [v7 _setContinuousCornerRadius:8.0];
  v180 = v7;
  [v7 setClipsToBounds:1];
  id v8 = [MEMORY[0x263F825C8] clearColor];
  [v180 setBackgroundColor:v8];

  v167 = [MEMORY[0x263F824D8] effectWithStyle:2];
  int v9 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v167];
  [v9 _setContinuousCornerRadius:8.0];
  v173 = v9;
  [v9 setClipsToBounds:1];
  id v10 = objc_alloc_init(MEMORY[0x263F82828]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setContentMode:2];
  [v10 _setContinuousCornerRadius:8.0];
  v174 = v10;
  [v10 setClipsToBounds:1];
  id v179 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v176 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v176 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v11 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83588] variant:1024];
  [v176 setFont:v11];

  v12 = [MEMORY[0x263F825C8] whiteColor];
  [v176 setTextColor:v12];

  [v176 setNumberOfLines:2];
  [v176 setAdjustsFontForContentSizeCategory:1];
  [v176 setAdjustsFontSizeToFitWidth:1];
  LODWORD(v13) = 1148846080;
  [v176 setContentHuggingPriority:1 forAxis:v13];
  [v179 addSubview:v176];
  id v175 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v175 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835D0] variant:1280];
  [v175 setFont:v14];

  v15 = [MEMORY[0x263F825C8] whiteColor];
  [v175 setTextColor:v15];

  [v175 setNumberOfLines:2];
  [v175 setAdjustsFontForContentSizeCategory:1];
  [v175 setAdjustsFontSizeToFitWidth:1];
  LODWORD(v16) = 1148846080;
  [v175 setContentHuggingPriority:1 forAxis:v16];
  [v179 addSubview:v175];
  v17 = [(TVRUINowPlayingMiniPlayerViewController *)self view];
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  v191[0] = v174;
  v191[1] = v173;
  v191[2] = v180;
  v191[3] = v179;
  v191[4] = v178;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v191 count:5];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v184 objects:v192 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v185;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v185 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v184 + 1) + 8 * i);
        [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v17 addSubview:v22];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v184 objects:v192 count:16];
    }
    while (v19);
  }

  v23 = [v17 heightAnchor];
  v172 = [v23 constraintEqualToConstant:0.0];

  LODWORD(v24) = 1132068864;
  [v172 setPriority:v24];
  v165 = [v174 leadingAnchor];
  v163 = [v180 leadingAnchor];
  v161 = [v165 constraintEqualToAnchor:v163];
  v190[0] = v161;
  v157 = [v174 trailingAnchor];
  v159 = [v180 trailingAnchor];
  v155 = [v157 constraintEqualToAnchor:v159];
  v190[1] = v155;
  v153 = [v174 topAnchor];
  v151 = [v180 topAnchor];
  v149 = [v153 constraintEqualToAnchor:v151];
  v190[2] = v149;
  v147 = [v174 bottomAnchor];
  v145 = [v180 bottomAnchor];
  v143 = [v147 constraintEqualToAnchor:v145];
  v190[3] = v143;
  v141 = [v173 leadingAnchor];
  v139 = [v180 leadingAnchor];
  v137 = [v141 constraintEqualToAnchor:v139];
  v190[4] = v137;
  v135 = [v173 trailingAnchor];
  v133 = [v180 trailingAnchor];
  v131 = [v135 constraintEqualToAnchor:v133];
  v190[5] = v131;
  v129 = [v173 topAnchor];
  v127 = [v180 topAnchor];
  v125 = [v129 constraintEqualToAnchor:v127];
  v190[6] = v125;
  v123 = [v173 bottomAnchor];
  v121 = [v180 bottomAnchor];
  v119 = [v123 constraintEqualToAnchor:v121];
  v190[7] = v119;
  v117 = [v180 leadingAnchor];
  v115 = [v17 leadingAnchor];
  v113 = [v117 constraintEqualToAnchor:v115 constant:20.0];
  v190[8] = v113;
  v111 = [v180 centerYAnchor];
  v109 = [v17 centerYAnchor];
  v107 = [v111 constraintEqualToAnchor:v109];
  v190[9] = v107;
  v105 = [v180 heightAnchor];
  v103 = [v105 constraintEqualToConstant:66.0];
  v190[10] = v103;
  v101 = [v180 widthAnchor];
  v99 = [v180 heightAnchor];
  v97 = [v101 constraintEqualToAnchor:v99 multiplier:1.77777778];
  v190[11] = v97;
  v95 = [v178 trailingAnchor];
  v93 = [v17 trailingAnchor];
  v91 = [v95 constraintEqualToAnchor:v93 constant:-20.0];
  v190[12] = v91;
  v89 = [v178 centerYAnchor];
  v87 = [v17 centerYAnchor];
  v85 = [v89 constraintEqualToAnchor:v87];
  v190[13] = v85;
  v83 = [v178 widthAnchor];
  v81 = [v83 constraintEqualToConstant:30.0];
  v190[14] = v81;
  v79 = [v178 heightAnchor];
  v77 = [v178 widthAnchor];
  v75 = [v79 constraintEqualToAnchor:v77];
  v190[15] = v75;
  v73 = [v17 heightAnchor];
  v72 = [v180 heightAnchor];
  v71 = [v73 constraintGreaterThanOrEqualToAnchor:v72 constant:16.0];
  v190[16] = v71;
  v70 = [v17 heightAnchor];
  v69 = [v179 heightAnchor];
  v68 = [v70 constraintGreaterThanOrEqualToAnchor:v69];
  v190[17] = v68;
  v190[18] = v172;
  v67 = [v179 leadingAnchor];
  v66 = [v180 trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:12.0];
  v190[19] = v65;
  v63 = [v179 trailingAnchor];
  v64 = [v178 imageView];
  v62 = [v64 leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-10.0];
  v190[20] = v61;
  v60 = [v179 centerYAnchor];
  v59 = [v17 centerYAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v190[21] = v58;
  v57 = [v176 topAnchor];
  v56 = [v179 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v190[22] = v55;
  v54 = [v176 leadingAnchor];
  v53 = [v179 leadingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v190[23] = v52;
  v51 = [v176 trailingAnchor];
  v50 = [v179 trailingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v190[24] = v49;
  v48 = [v175 topAnchor];
  v47 = [v176 bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:2.0];
  v190[25] = v46;
  v45 = [v175 leadingAnchor];
  v25 = [v179 leadingAnchor];
  v26 = [v45 constraintEqualToAnchor:v25];
  v190[26] = v26;
  v27 = [v175 trailingAnchor];
  v28 = [v179 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v190[27] = v29;
  v30 = [v175 bottomAnchor];
  v31 = [v179 bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v190[28] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v190 count:29];
  [(TVRUINowPlayingMiniPlayerViewController *)self setStandardLayoutConstraints:v33];

  v166 = [v180 topAnchor];
  v164 = [v17 topAnchor];
  v162 = [v166 constraintEqualToAnchor:v164];
  v189[0] = v162;
  v160 = [v180 leadingAnchor];
  v158 = [v17 leadingAnchor];
  v156 = [v160 constraintEqualToAnchor:v158 constant:20.0];
  v189[1] = v156;
  v154 = [v180 heightAnchor];
  v152 = [v154 constraintEqualToConstant:66.0];
  v189[2] = v152;
  v150 = [v180 widthAnchor];
  v148 = [v180 heightAnchor];
  v146 = [v150 constraintEqualToAnchor:v148 multiplier:1.77777778];
  v189[3] = v146;
  v144 = [v178 trailingAnchor];
  v142 = [v17 trailingAnchor];
  v140 = [v144 constraintEqualToAnchor:v142 constant:-20.0];
  v189[4] = v140;
  v138 = [v178 centerYAnchor];
  v136 = [v180 centerYAnchor];
  v134 = [v138 constraintEqualToAnchor:v136];
  v189[5] = v134;
  v132 = [v178 widthAnchor];
  v130 = [v132 constraintEqualToConstant:30.0];
  v189[6] = v130;
  v128 = [v178 heightAnchor];
  v126 = [v178 widthAnchor];
  v124 = [v128 constraintEqualToAnchor:v126];
  v189[7] = v124;
  v122 = [v179 topAnchor];
  v120 = [v180 bottomAnchor];
  v118 = [v122 constraintEqualToAnchor:v120 constant:2.0];
  v189[8] = v118;
  v116 = [v179 leadingAnchor];
  v114 = [v17 leadingAnchor];
  v112 = [v116 constraintEqualToAnchor:v114 constant:12.0];
  v189[9] = v112;
  v110 = [v179 trailingAnchor];
  v108 = [v17 trailingAnchor];
  v106 = [v110 constraintEqualToAnchor:v108 constant:-10.0];
  v189[10] = v106;
  v104 = [v179 bottomAnchor];
  v102 = [v17 bottomAnchor];
  v100 = [v104 constraintEqualToAnchor:v102];
  v189[11] = v100;
  v98 = [v176 topAnchor];
  v96 = [v179 topAnchor];
  v94 = [v98 constraintEqualToAnchor:v96];
  v189[12] = v94;
  v92 = [v176 leadingAnchor];
  v90 = [v179 leadingAnchor];
  v88 = [v92 constraintEqualToAnchor:v90];
  v189[13] = v88;
  v86 = [v176 trailingAnchor];
  v84 = [v179 trailingAnchor];
  v82 = [v86 constraintEqualToAnchor:v84];
  v189[14] = v82;
  v80 = [v175 topAnchor];
  v78 = [v176 bottomAnchor];
  v76 = [v80 constraintEqualToAnchor:v78 constant:2.0];
  v189[15] = v76;
  v74 = [v175 leadingAnchor];
  v34 = [v179 leadingAnchor];
  v35 = [v74 constraintEqualToAnchor:v34];
  v189[16] = v35;
  v36 = [v175 trailingAnchor];
  v37 = [v179 trailingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v189[17] = v38;
  v39 = [v175 bottomAnchor];
  v40 = [v179 bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v189[18] = v41;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v189 count:19];
  [(TVRUINowPlayingMiniPlayerViewController *)self setStackedTextLayoutConstraints:v42];

  [(TVRUINowPlayingMiniPlayerViewController *)self setImageView:v180];
  [(TVRUINowPlayingMiniPlayerViewController *)self setTitleLabel:v176];
  [(TVRUINowPlayingMiniPlayerViewController *)self setSecondaryLabel:v175];
  [(TVRUINowPlayingMiniPlayerViewController *)self setActionButton:v178];
  [(TVRUINowPlayingMiniPlayerViewController *)self setNarrowAspectImageView:v174];
  [(TVRUINowPlayingMiniPlayerViewController *)self setNarrowAspectImageVisualEffectView:v173];
  objc_initWeak(&location, self);
  uint64_t v188 = objc_opt_class();
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v188 count:1];
  v181[0] = MEMORY[0x263EF8330];
  v181[1] = 3221225472;
  v181[2] = __61__TVRUINowPlayingMiniPlayerViewController_configureHierarchy__block_invoke_2;
  v181[3] = &unk_2648001B8;
  objc_copyWeak(&v182, &location);
  id v44 = (id)[(TVRUINowPlayingMiniPlayerViewController *)self registerForTraitChanges:v43 withHandler:v181];

  [(TVRUINowPlayingMiniPlayerViewController *)self _updateContraintsForStackedLayout:[(TVRUINowPlayingMiniPlayerViewController *)self _currentTraitsSizeCategoryRequiresStackedLayout]];
  objc_destroyWeak(&v182);
  objc_destroyWeak(&location);
}

void __61__TVRUINowPlayingMiniPlayerViewController_configureHierarchy__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained view];
    [v2 setNeedsUpdateConstraints];

    id WeakRetained = v3;
  }
}

- (void)updateViewConstraints
{
  BOOL v3 = [(TVRUINowPlayingMiniPlayerViewController *)self _currentTraitsSizeCategoryRequiresStackedLayout];
  if (v3 != [(TVRUINowPlayingMiniPlayerViewController *)self _isCurrentlyStackedLayout]) {
    [(TVRUINowPlayingMiniPlayerViewController *)self _updateContraintsForStackedLayout:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  [(TVRUINowPlayingMiniPlayerViewController *)&v4 updateViewConstraints];
}

- (id)actionButtonMenu
{
  v84[1] = *MEMORY[0x263EF8340];
  v57 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up.right.square"];
  v56 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
  BOOL v3 = [(TVRUINowPlayingMiniPlayerViewController *)self urlForProductPageKind:3];
  objc_super v4 = [(TVRUINowPlayingMiniPlayerViewController *)self urlForProductPageKind:2];
  objc_super v5 = [(TVRUINowPlayingMiniPlayerViewController *)self urlForProductPageKind:1];
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x263F823D0];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"TVRUIGotoEpisode" value:&stru_26DB4CAE0 table:@"Localizable"];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke;
  v75[3] = &unk_264800388;
  objc_copyWeak(&v77, &location);
  id v49 = v3;
  id v76 = v49;
  v55 = [v6 actionWithTitle:v8 image:v57 identifier:0 handler:v75];

  int v9 = (void *)MEMORY[0x263F823D0];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"TVRUIGotoShow" value:&stru_26DB4CAE0 table:@"Localizable"];
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_2;
  v72[3] = &unk_264800388;
  objc_copyWeak(&v74, &location);
  id v48 = v4;
  id v73 = v48;
  v54 = [v9 actionWithTitle:v11 image:v57 identifier:0 handler:v72];

  v12 = (void *)MEMORY[0x263F823D0];
  double v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"TVRUIGotoMovie" value:&stru_26DB4CAE0 table:@"Localizable"];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_3;
  v69[3] = &unk_264800388;
  objc_copyWeak(&v71, &location);
  id v15 = v5;
  id v70 = v15;
  v53 = [v12 actionWithTitle:v14 image:v57 identifier:0 handler:v69];

  double v16 = (void *)MEMORY[0x263F823D0];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"TVRUIGotoSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_4;
  v66[3] = &unk_264800388;
  objc_copyWeak(&v68, &location);
  id v47 = v15;
  id v67 = v47;
  v52 = [v16 actionWithTitle:v18 image:v57 identifier:0 handler:v66];

  uint64_t v19 = (void *)MEMORY[0x263F823D0];
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"TVRUIShareEpisode" value:&stru_26DB4CAE0 table:@"Localizable"];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_5;
  v64[3] = &unk_264800190;
  objc_copyWeak(&v65, &location);
  v51 = [v19 actionWithTitle:v21 image:v56 identifier:0 handler:v64];

  v22 = (void *)MEMORY[0x263F823D0];
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v24 = [v23 localizedStringForKey:@"TVRUIShareShow" value:&stru_26DB4CAE0 table:@"Localizable"];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_6;
  v62[3] = &unk_264800190;
  objc_copyWeak(&v63, &location);
  v50 = [v22 actionWithTitle:v24 image:v56 identifier:0 handler:v62];

  v25 = (void *)MEMORY[0x263F823D0];
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"TVRUIShareMovie" value:&stru_26DB4CAE0 table:@"Localizable"];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_7;
  v60[3] = &unk_264800190;
  objc_copyWeak(&v61, &location);
  v28 = [v25 actionWithTitle:v27 image:v56 identifier:0 handler:v60];

  v29 = (void *)MEMORY[0x263F823D0];
  v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v31 = [v30 localizedStringForKey:@"TVRUIShareSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_8;
  v58[3] = &unk_264800190;
  objc_copyWeak(&v59, &location);
  v32 = [v29 actionWithTitle:v31 image:v56 identifier:0 handler:v58];

  v33 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  v34 = [v33 metadata];

  uint64_t v35 = [v34 kind];
  if (v35 == 1)
  {
    v39 = [(TVRUINowPlayingMiniPlayerViewController *)self systemMonitor];
    int v40 = [v39 screenLocked];

    if (v40)
    {
      v84[0] = v53;
      v38 = (void **)v84;
      goto LABEL_8;
    }
    v83[0] = v53;
    v83[1] = v28;
    v38 = (void **)v83;
LABEL_14:
    uint64_t v41 = 2;
    goto LABEL_16;
  }
  if (v35 == 2)
  {
    v42 = [(TVRUINowPlayingMiniPlayerViewController *)self systemMonitor];
    int v43 = [v42 screenLocked];

    if (!v43)
    {
      v79[0] = v55;
      v79[1] = v54;
      v38 = (void **)v79;
      uint64_t v41 = 4;
      v79[2] = v51;
      v79[3] = v50;
      goto LABEL_16;
    }
    v80[0] = v55;
    v80[1] = v54;
    v38 = (void **)v80;
    goto LABEL_14;
  }
  if (v35 != 4)
  {
    id v44 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_17;
  }
  v36 = [(TVRUINowPlayingMiniPlayerViewController *)self systemMonitor];
  int v37 = [v36 screenLocked];

  if (!v37)
  {
    v81[0] = v52;
    v81[1] = v32;
    v38 = (void **)v81;
    goto LABEL_14;
  }
  v82 = v52;
  v38 = &v82;
LABEL_8:
  uint64_t v41 = 1;
LABEL_16:
  id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:v41];
LABEL_17:
  v45 = [MEMORY[0x263F82940] menuWithChildren:v44];

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);

  return v45;
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained openURL:*(void *)(a1 + 32)];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained openURL:*(void *)(a1 + 32)];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained openURL:*(void *)(a1 + 32)];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained openURL:*(void *)(a1 + 32)];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shareEpisode];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shareShow];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sharePrimary];
}

void __59__TVRUINowPlayingMiniPlayerViewController_actionButtonMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sharePrimary];
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
  id v5 = a3;
  [(TVRUINowPlayingMiniPlayerViewController *)self updateFromNowPlayingInfo:v5];
}

- (void)updateFromNowPlayingInfo:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 metadata];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "tvrui_hasUnknownCanonicalID");
    if ([v5 kind] == 2)
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"TVRUISeasonEpisodeTitleBrief" value:&stru_26DB4CAE0 table:@"Localizable"];
      int v9 = objc_msgSend(v5, "tvrui_localizedTitleWithFormatString:", v8);
      id v10 = [(TVRUINowPlayingMiniPlayerViewController *)self titleLabel];
      [v10 setText:v9];

      objc_msgSend(v5, "tvrui_secondaryTitle");
    }
    else
    {
      uint64_t v11 = [(TVRUINowPlayingMiniPlayerViewController *)self titleLabel];
      [v11 setText:0];

      [v5 title];
    v12 = };
    double v13 = [(TVRUINowPlayingMiniPlayerViewController *)self secondaryLabel];
    [v13 setText:v12];

    v14 = [(TVRUINowPlayingMiniPlayerViewController *)self _effectiveImageFromNowPlayingInfo:v4];
    BOOL v15 = [(TVRUINowPlayingMiniPlayerViewController *)self _effectiveImageFromNowPlayingInfoIsFallbackImage:v4];
    double v16 = [(TVRUINowPlayingMiniPlayerViewController *)self imageView];
    [v16 setImage:v14];

    if (v15)
    {
      v17 = [MEMORY[0x263F825C8] colorWithWhite:0.2 alpha:1.0];
    }
    else
    {
      v17 = 0;
    }
    v18 = [(TVRUINowPlayingMiniPlayerViewController *)self imageView];
    [v18 setBackgroundColor:v17];

    if (v15) {
    [v14 size];
    }
    BOOL v21 = v19 * v20 <= 0.0 || v19 >= v20;
    v22 = [(TVRUINowPlayingMiniPlayerViewController *)self narrowAspectImageVisualEffectView];
    [v22 setHidden:v21];

    if (v21) {
      v23 = 0;
    }
    else {
      v23 = v14;
    }
    double v24 = [(TVRUINowPlayingMiniPlayerViewController *)self narrowAspectImageView];
    [v24 setImage:v23];

    v25 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
    [v25 setHidden:v6];

    v26 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButtonMenu];
    v27 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
    [v27 setMenu:v26];

    int v28 = objc_msgSend(v4, "tvrui_mediaIsStopped");
    if (v28)
    {
      v29 = [(TVRUINowPlayingMiniPlayerViewController *)self styleProvider];
      v30 = [v29 inactiveMediaTextColor];
    }
    else
    {
      v30 = [MEMORY[0x263F825C8] whiteColor];
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v31 = [(TVRUINowPlayingMiniPlayerViewController *)self titleLabel];
    v47[0] = v31;
    v32 = [(TVRUINowPlayingMiniPlayerViewController *)self secondaryLabel];
    v47[1] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];

    uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) setTextColor:v30];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v35);
    }

    if (v28)
    {
      v33 = [(TVRUINowPlayingMiniPlayerViewController *)self styleProvider];
      [v33 inactiveMediaImageViewAlpha];
      double v39 = v38;
    }
    else
    {
      double v39 = 1.0;
    }
    int v40 = [(TVRUINowPlayingMiniPlayerViewController *)self imageView];
    [v40 setAlpha:v39];

    if (v28) {
    uint64_t v41 = [v4 imageDataIsPlaceholder];
    }
    if ([v41 BOOLValue])
    {
    }
    else
    {
      char v42 = objc_msgSend(v4, "tvrui_hasArtworkImage");

      if (v42)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    [(TVRUINowPlayingMiniPlayerViewController *)self _requestImageIfNeededForNowPlayingInfo:v4];
    goto LABEL_35;
  }
LABEL_36:
}

- (id)_effectiveImageFromNowPlayingInfo:(id)a3
{
  id v4 = objc_msgSend(a3, "tvrui_artworkImage");
  if (!v4)
  {
    id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self fetchedImage];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(TVRUINowPlayingMiniPlayerViewController *)self fallbackImage];
    }
    id v4 = v7;
  }
  return v4;
}

- (BOOL)_effectiveImageFromNowPlayingInfoIsFallbackImage:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "tvrui_artworkImage");
  uint64_t v5 = [(TVRUINowPlayingMiniPlayerViewController *)self fetchedImage];
  LOBYTE(self) = (v5 | v4) == 0;

  return (char)self;
}

- (void)openProductPageForKind:(int64_t)a3
{
  uint64_t v4 = [(TVRUINowPlayingMiniPlayerViewController *)self urlForProductPageKind:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(TVRUINowPlayingMiniPlayerViewController *)self openURL:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)urlForProductPageKind:(int64_t)a3
{
  uint64_t v4 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  uint64_t v5 = [v4 metadata];

  if (!v5) {
    goto LABEL_6;
  }
  if (a3 == 1 || a3 == 3)
  {
    uint64_t v6 = [v5 productPageURL];
    goto LABEL_8;
  }
  if (a3 != 2)
  {
LABEL_6:
    id v7 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [v5 showProductPageURL];
LABEL_8:
  id v7 = (void *)v6;
LABEL_9:

  return v7;
}

- (void)openURL:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self actionProvider];
    [v5 openURL:v4];
  }
}

- (void)shareEpisode
{
  BOOL v3 = [TVRUINowPlayingInfoActivityItem alloc];
  id v4 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  id v7 = [(TVRUINowPlayingInfoActivityItem *)v3 initWithNowPlayingInfo:v4 shareShow:0];

  id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self actionProvider];
  uint64_t v6 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
  [v5 shareItem:v7 presentingViewController:self sourceView:v6];
}

- (void)shareShow
{
  BOOL v3 = [TVRUINowPlayingInfoActivityItem alloc];
  id v4 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  id v7 = [(TVRUINowPlayingInfoActivityItem *)v3 initWithNowPlayingInfo:v4 shareShow:1];

  id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self actionProvider];
  uint64_t v6 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
  [v5 shareItem:v7 presentingViewController:self sourceView:v6];
}

- (void)sharePrimary
{
  BOOL v3 = [TVRUINowPlayingInfoActivityItem alloc];
  id v4 = [(TVRUINowPlayingMiniPlayerViewController *)self nowPlayingInfo];
  id v7 = [(TVRUINowPlayingInfoActivityItem *)v3 initWithNowPlayingInfo:v4 shareShow:0];

  id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self actionProvider];
  uint64_t v6 = [(TVRUINowPlayingMiniPlayerViewController *)self actionButton];
  [v5 shareItem:v7 presentingViewController:self sourceView:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout
{
  id v2 = [(TVRUINowPlayingMiniPlayerViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x263F83410]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_updateContraintsForStackedLayout:(BOOL)a3
{
  id v4 = (void *)MEMORY[0x263F08938];
  if (a3)
  {
    id v5 = [(TVRUINowPlayingMiniPlayerViewController *)self stackedTextLayoutConstraints];
    [v4 activateConstraints:v5];

    uint64_t v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingMiniPlayerViewController *)self standardLayoutConstraints];
  }
  else
  {
    id v7 = [(TVRUINowPlayingMiniPlayerViewController *)self standardLayoutConstraints];
    [v4 activateConstraints:v7];

    uint64_t v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingMiniPlayerViewController *)self stackedTextLayoutConstraints];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");
}

- (BOOL)_isCurrentlyStackedLayout
{
  id v2 = [(TVRUINowPlayingMiniPlayerViewController *)self stackedTextLayoutConstraints];
  BOOL v3 = [v2 firstObject];

  LOBYTE(v2) = [v3 isActive];
  return (char)v2;
}

- (void)_requestImageIfNeededForNowPlayingInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "tvrui_effectiveCanonicalID");
    if (v6)
    {
      id v7 = [v5 metadata];
      id v8 = [v7 imageURLTemplate];

      if (v8)
      {
        int v9 = [MEMORY[0x263F7C9C0] imageTemplateWithString:v8];
        id v10 = objc_msgSend(v9, "urlForSize:", 400.0, 225.0);
        objc_initWeak(&location, self);
        uint64_t v11 = [(TVRUINowPlayingMiniPlayerViewController *)self urlSession];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke;
        v13[3] = &unk_264800250;
        objc_copyWeak(&v15, &location);
        id v14 = v6;
        v12 = [v11 dataTaskWithURL:v10 completionHandler:v13];

        [v12 resume];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke_2;
  block[3] = &unk_264801240;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __82__TVRUINowPlayingMiniPlayerViewController__requestImageIfNeededForNowPlayingInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [WeakRetained nowPlayingInfo];
    id v4 = objc_msgSend(v3, "tvrui_effectiveCanonicalID");

    if ([v4 isEqualToString:*(void *)(a1 + 32)])
    {
      if ([*(id *)(a1 + 40) length]) {
        [MEMORY[0x263F827E8] imageWithData:*(void *)(a1 + 40)];
      }
      else {
      id v5 = [v7 fallbackImage];
      }
      [v7 setFetchedImage:v5];
      id v6 = [v7 imageView];
      [v6 setImage:v5];
    }
    id WeakRetained = v7;
  }
}

- (UIImage)fallbackImage
{
  fallbackImage = self->_fallbackImage;
  if (!fallbackImage)
  {
    id v4 = (void *)MEMORY[0x263F827E8];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v4 imageNamed:@"misc-placeholder" inBundle:v5];
    id v7 = [MEMORY[0x263F825C8] colorWithWhite:0.6 alpha:1.0];
    id v8 = [v6 imageWithTintColor:v7];
    int v9 = self->_fallbackImage;
    self->_fallbackImage = v8;

    fallbackImage = self->_fallbackImage;
  }
  return fallbackImage;
}

- (NSURLSession)urlSession
{
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    id v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    id v5 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4];
    id v6 = self->_urlSession;
    self->_urlSession = v5;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (void)dealloc
{
  id v3 = [(TVRUINowPlayingMiniPlayerViewController *)self systemMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TVRUINowPlayingMiniPlayerViewController;
  [(TVRUINowPlayingMiniPlayerViewController *)&v4 dealloc];
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

- (id)updateTabsHandler
{
  return self->_updateTabsHandler;
}

- (void)setUpdateTabsHandler:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIVisualEffectView)narrowAspectImageVisualEffectView
{
  return self->_narrowAspectImageVisualEffectView;
}

- (void)setNarrowAspectImageVisualEffectView:(id)a3
{
}

- (UIImageView)narrowAspectImageView
{
  return self->_narrowAspectImageView;
}

- (void)setNarrowAspectImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
}

- (NSArray)stackedTextLayoutConstraints
{
  return self->_stackedTextLayoutConstraints;
}

- (void)setStackedTextLayoutConstraints:(id)a3
{
}

- (void)setUrlSession:(id)a3
{
}

- (UIImage)fetchedImage
{
  return self->_fetchedImage;
}

- (void)setFetchedImage:(id)a3
{
}

- (void)setFallbackImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_fetchedImage, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_stackedTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_narrowAspectImageView, 0);
  objc_storeStrong((id *)&self->_narrowAspectImageVisualEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_updateTabsHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
}

@end