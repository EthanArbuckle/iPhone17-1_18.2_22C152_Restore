@interface TVRUINowPlayingInfoViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout;
- (BOOL)_infoLineRequiresDoubleLayout;
- (BOOL)_isCurrentlyDoubleInfoLineLayout;
- (BOOL)_isCurrentlyStackedLayout;
- (BOOL)userInteractionInProgress;
- (NSArray)doubleLineInfoLayoutConstraints;
- (NSArray)singleLineInfoLayoutConstraints;
- (NSArray)stackedLayoutConstraints;
- (NSArray)standardLayoutConstraints;
- (NSLayoutConstraint)detailsTextHeightConstraint;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVREventHaptic)eventHaptic;
- (TVRUIActionProviding)actionProvider;
- (TVRUINowPlayingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (UIButton)detailsButton;
- (UIButton)playFromStartButton;
- (UILabel)infoLabel;
- (UILabel)ratingsLabel;
- (UILabel)titleLabel;
- (UIScrollView)scrollView;
- (UITextView)detailsTextView;
- (UIView)ratingsContainer;
- (id)commandHandler;
- (void)_animateButtonFromHighlightState:(id)a3;
- (void)_animateButtonToHighlightState:(id)a3;
- (void)_playHaptic;
- (void)_updateConstraintsForInfoLineUsingDoubleLineLayout:(BOOL)a3;
- (void)_updateContraintsForStackedLayout:(BOOL)a3;
- (void)configureHierarchy;
- (void)openProductPage;
- (void)setActionProvider:(id)a3;
- (void)setCommandHandler:(id)a3;
- (void)setDetailsButton:(id)a3;
- (void)setDetailsTextHeightConstraint:(id)a3;
- (void)setDetailsTextView:(id)a3;
- (void)setDoubleLineInfoLayoutConstraints:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPlayFromStartButton:(id)a3;
- (void)setRatingsContainer:(id)a3;
- (void)setRatingsLabel:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSingleLineInfoLayoutConstraints:(id)a3;
- (void)setStackedLayoutConstraints:(id)a3;
- (void)setStandardLayoutConstraints:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUserInteractionInProgress:(BOOL)a3;
- (void)updateFromNowPlayingInfo:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation TVRUINowPlayingInfoViewController

- (TVRUINowPlayingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingInfoViewController;
  v4 = [(TVRUINowPlayingInfoViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

    v7 = objc_alloc_init(TVREventHaptic);
    eventHaptic = v4->_eventHaptic;
    v4->_eventHaptic = v7;
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUINowPlayingInfoViewController;
  [(TVRUINowPlayingInfoViewController *)&v3 viewDidLoad];
  [(TVRUINowPlayingInfoViewController *)self configureHierarchy];
}

- (void)configureHierarchy
{
  uint64_t v229 = *MEMORY[0x263EF8340];
  v193 = [(TVRUINowPlayingInfoViewController *)self view];
  id v2 = objc_alloc_init(MEMORY[0x263F82B88]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v195 = v2;
  [v193 addSubview:v2];
  v192 = [MEMORY[0x263F824F0] grayButtonConfiguration];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TVRUIFromBeginning" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v192 setTitle:v4];

  [v192 setTitleAlignment:2];
  [v192 setTitleTextAttributesTransformer:&__block_literal_global_0];
  v5 = [MEMORY[0x263F827E8] systemImageNamed:@"play.fill"];
  [v192 setImage:v5];

  [v192 setImagePadding:6.0];
  v6 = [v192 background];
  [v6 setCornerRadius:8.0];

  [v192 setButtonSize:1];
  v191 = [MEMORY[0x263F824F0] grayButtonConfiguration];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"TVRUIDetails" value:&stru_26DB4CAE0 table:@"Localizable"];
  [v191 setTitle:v8];

  [v191 setTitleAlignment:2];
  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up.forward.app.fill"];
  [v191 setImage:v9];

  [v191 setImagePadding:6.0];
  [v191 setTitleTextAttributesTransformer:&__block_literal_global_26];
  objc_super v10 = [v191 background];
  [v10 setCornerRadius:8.0];

  [v191 setButtonSize:1];
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x263F823D0];
  v216[0] = MEMORY[0x263EF8330];
  v216[1] = 3221225472;
  v216[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_3;
  v216[3] = &unk_264800190;
  objc_copyWeak(&v217, &location);
  v189 = [v11 actionWithHandler:v216];
  v12 = (void *)MEMORY[0x263F823D0];
  v214[0] = MEMORY[0x263EF8330];
  v214[1] = 3221225472;
  v214[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_4;
  v214[3] = &unk_264800190;
  objc_copyWeak(&v215, &location);
  v188 = [v12 actionWithHandler:v214];
  id v202 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v196 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v200 = objc_alloc_init(MEMORY[0x263F82D60]);
  id v197 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v194 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v201 = objc_alloc_init(MEMORY[0x263F82E00]);
  v199 = [MEMORY[0x263F824E8] buttonWithConfiguration:v192 primaryAction:v189];
  v198 = [MEMORY[0x263F824E8] buttonWithConfiguration:v191 primaryAction:v188];
  [v201 addSubview:v194];
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  v227[0] = v199;
  v227[1] = v198;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v227 count:2];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v210 objects:v228 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v211;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v211 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v210 + 1) + 8 * i);
        v18 = [MEMORY[0x263F825C8] whiteColor];
        [v17 setTintColor:v18];

        [v17 addTarget:self action:sel__animateButtonToHighlightState_ forControlEvents:1];
        [v17 addTarget:self action:sel__animateButtonFromHighlightState_ forControlEvents:448];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v210 objects:v228 count:16];
    }
    while (v14);
  }

  v19 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835D0] variant:1024];
  [v196 setFont:v19];

  v20 = [MEMORY[0x263F825C8] whiteColor];
  [v196 setTextColor:v20];

  [v200 setEditable:0];
  v21 = [v200 textContainer];
  [v21 setLineFragmentPadding:0.0];

  v22 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v200 setFont:v22];

  v23 = [MEMORY[0x263F825C8] whiteColor];
  [v200 setTextColor:v23];

  [v200 setAdjustsFontForContentSizeCategory:1];
  v24 = [MEMORY[0x263F825C8] clearColor];
  [v200 setBackgroundColor:v24];

  [v200 textContainerInset];
  [v200 setTextContainerInset:0.0];
  v25 = [MEMORY[0x263F825C8] lightGrayColor];
  v26 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] variant:1024];
  [v197 setFont:v26];
  [v197 setTextColor:v25];
  [v197 setNumberOfLines:0];
  [v194 setFont:v26];
  [v194 setTextColor:v25];
  [v194 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v187 = v25;
  uint64_t v27 = [v187 CGColor];
  v28 = [v201 layer];
  [v28 setBorderColor:v27];

  v29 = [v201 layer];
  [v29 setBorderWidth:1.0];

  v30 = [v201 layer];
  [v30 setCornerRadius:4.0];

  [v202 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v195 addSubview:v202];
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  v225[0] = v196;
  v225[1] = v200;
  v225[2] = v197;
  v225[3] = v201;
  v225[4] = v199;
  v225[5] = v198;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v225 count:6];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v206 objects:v226 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v207;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v207 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = *(void **)(*((void *)&v206 + 1) + 8 * j);
        [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v202 addSubview:v35];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v36 = v35;
          [v36 setAdjustsFontForContentSizeCategory:1];
        }
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v206 objects:v226 count:16];
    }
    while (v32);
  }

  v37 = [v200 heightAnchor];
  v190 = [v37 constraintEqualToConstant:40.0];

  LODWORD(v38) = 1132068864;
  [v190 setPriority:v38];
  v82 = (void *)MEMORY[0x263F08938];
  v39 = [v193 topAnchor];
  v182 = [v195 topAnchor];
  v177 = [v39 constraintEqualToAnchor:v182];
  v224[0] = v177;
  v173 = [v193 bottomAnchor];
  v169 = [v195 bottomAnchor];
  v165 = [v173 constraintEqualToAnchor:v169];
  v224[1] = v165;
  v162 = [v193 leadingAnchor];
  v159 = [v195 leadingAnchor];
  v156 = [v162 constraintEqualToAnchor:v159];
  v224[2] = v156;
  v153 = [v193 trailingAnchor];
  v150 = [v195 trailingAnchor];
  v147 = [v153 constraintEqualToAnchor:v150];
  v224[3] = v147;
  v144 = [v195 topAnchor];
  v141 = [v202 topAnchor];
  v138 = [v144 constraintEqualToAnchor:v141];
  v224[4] = v138;
  v135 = [v195 bottomAnchor];
  v132 = [v202 bottomAnchor];
  v129 = [v135 constraintEqualToAnchor:v132];
  v224[5] = v129;
  v126 = [v195 leadingAnchor];
  v124 = [v202 leadingAnchor];
  v122 = [v126 constraintEqualToAnchor:v124];
  v224[6] = v122;
  v120 = [v195 trailingAnchor];
  v118 = [v202 trailingAnchor];
  v116 = [v120 constraintEqualToAnchor:v118];
  v224[7] = v116;
  v114 = [v202 widthAnchor];
  v113 = [v193 widthAnchor];
  v112 = [v114 constraintEqualToAnchor:v113 constant:-40.0];
  v224[8] = v112;
  v111 = [v202 centerXAnchor];
  v110 = [v193 centerXAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v224[9] = v109;
  v108 = [v196 topAnchor];
  v107 = [v202 topAnchor];
  v106 = [v108 constraintEqualToAnchor:v107 constant:10.0];
  v224[10] = v106;
  v105 = [v196 leadingAnchor];
  v104 = [v202 leadingAnchor];
  v103 = [v105 constraintEqualToAnchor:v104 constant:10.0];
  v224[11] = v103;
  v102 = [v196 trailingAnchor];
  v101 = [v202 trailingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:-10.0];
  v224[12] = v100;
  v99 = [v200 topAnchor];
  v98 = [v196 bottomAnchor];
  v97 = [v99 constraintEqualToAnchor:v98 constant:10.0];
  v224[13] = v97;
  v96 = [v200 leadingAnchor];
  v95 = [v196 leadingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v224[14] = v94;
  v93 = [v200 trailingAnchor];
  v92 = [v196 trailingAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v224[15] = v91;
  v224[16] = v190;
  v90 = [v197 topAnchor];
  v89 = [v200 bottomAnchor];
  v88 = [v90 constraintEqualToAnchor:v89 constant:10.0];
  v224[17] = v88;
  v87 = [v194 leadingAnchor];
  v86 = [v201 leadingAnchor];
  v85 = [v87 constraintEqualToAnchor:v86 constant:3.0];
  v224[18] = v85;
  v84 = [v194 trailingAnchor];
  v83 = [v201 trailingAnchor];
  v40 = [v84 constraintEqualToAnchor:v83 constant:-3.0];
  v224[19] = v40;
  v41 = [v194 topAnchor];
  v42 = [v201 topAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  v224[20] = v43;
  v44 = [v194 bottomAnchor];
  v45 = [v201 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v224[21] = v46;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v224 count:22];
  [v82 activateConstraints:v47];

  v183 = [v199 topAnchor];
  v178 = [v201 bottomAnchor];
  v174 = [v183 constraintEqualToAnchor:v178 constant:20.0];
  v223[0] = v174;
  v170 = [v199 leadingAnchor];
  v166 = [v202 leadingAnchor];
  v163 = [v170 constraintEqualToAnchor:v166 constant:10.0];
  v223[1] = v163;
  v160 = [v199 trailingAnchor];
  v157 = [v198 leadingAnchor];
  v154 = [v160 constraintEqualToAnchor:v157 constant:-10.0];
  v223[2] = v154;
  v151 = [v199 heightAnchor];
  v148 = [v151 constraintGreaterThanOrEqualToConstant:40.0];
  v223[3] = v148;
  v145 = [v199 bottomAnchor];
  v142 = [v202 bottomAnchor];
  v139 = [v145 constraintEqualToAnchor:v142 constant:-30.0];
  v223[4] = v139;
  v136 = [v198 topAnchor];
  v133 = [v201 bottomAnchor];
  v130 = [v136 constraintEqualToAnchor:v133 constant:20.0];
  v223[5] = v130;
  v127 = [v198 trailingAnchor];
  v125 = [v202 trailingAnchor];
  v123 = [v127 constraintEqualToAnchor:v125 constant:-10.0];
  v223[6] = v123;
  v121 = [v198 heightAnchor];
  v119 = [v121 constraintGreaterThanOrEqualToConstant:40.0];
  v223[7] = v119;
  v117 = [v198 widthAnchor];
  v115 = [v199 widthAnchor];
  v48 = [v117 constraintEqualToAnchor:v115];
  v223[8] = v48;
  v49 = [v198 bottomAnchor];
  v50 = [v202 bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50 constant:-30.0];
  v223[9] = v51;
  v52 = [v202 bottomAnchor];
  v53 = [v193 bottomAnchor];
  v54 = [v52 constraintLessThanOrEqualToAnchor:v53];
  v223[10] = v54;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v223 count:11];
  [(TVRUINowPlayingInfoViewController *)self setStandardLayoutConstraints:v55];

  v184 = [v199 topAnchor];
  v179 = [v201 bottomAnchor];
  v175 = [v184 constraintEqualToAnchor:v179 constant:20.0];
  v222[0] = v175;
  v171 = [v199 leadingAnchor];
  v167 = [v202 leadingAnchor];
  v164 = [v171 constraintEqualToAnchor:v167 constant:10.0];
  v222[1] = v164;
  v161 = [v199 trailingAnchor];
  v158 = [v202 trailingAnchor];
  v155 = [v161 constraintEqualToAnchor:v158 constant:-10.0];
  v222[2] = v155;
  v152 = [v199 heightAnchor];
  v149 = [v152 constraintGreaterThanOrEqualToConstant:40.0];
  v222[3] = v149;
  v146 = [v198 topAnchor];
  v143 = [v199 bottomAnchor];
  v140 = [v146 constraintEqualToAnchor:v143 constant:20.0];
  v222[4] = v140;
  v137 = [v198 leadingAnchor];
  v134 = [v202 leadingAnchor];
  v131 = [v137 constraintEqualToAnchor:v134 constant:10.0];
  v222[5] = v131;
  v128 = [v198 trailingAnchor];
  v56 = [v202 trailingAnchor];
  v57 = [v128 constraintEqualToAnchor:v56 constant:-10.0];
  v222[6] = v57;
  v58 = [v198 heightAnchor];
  v59 = [v58 constraintGreaterThanOrEqualToConstant:40.0];
  v222[7] = v59;
  v60 = [v198 bottomAnchor];
  v61 = [v202 bottomAnchor];
  v62 = [v60 constraintEqualToAnchor:v61 constant:-30.0];
  v222[8] = v62;
  v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v222 count:9];
  [(TVRUINowPlayingInfoViewController *)self setStackedLayoutConstraints:v63];

  v185 = [v197 leadingAnchor];
  v180 = [v202 leadingAnchor];
  v64 = [v185 constraintEqualToAnchor:v180 constant:10.0];
  v221[0] = v64;
  v65 = [v201 topAnchor];
  v66 = [v197 topAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  v221[1] = v67;
  v68 = [v201 leadingAnchor];
  v69 = [v197 trailingAnchor];
  v70 = [v68 constraintEqualToAnchor:v69 constant:10.0];
  v221[2] = v70;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v221 count:3];
  [(TVRUINowPlayingInfoViewController *)self setSingleLineInfoLayoutConstraints:v71];

  v186 = [v197 leadingAnchor];
  v181 = [v202 leadingAnchor];
  v176 = [v186 constraintEqualToAnchor:v181 constant:10.0];
  v220[0] = v176;
  v172 = [v197 trailingAnchor];
  v168 = [v202 trailingAnchor];
  v72 = [v172 constraintEqualToAnchor:v168 constant:-10.0];
  v220[1] = v72;
  v73 = [v201 topAnchor];
  v74 = [v197 bottomAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:10.0];
  v220[2] = v75;
  v76 = [v201 leadingAnchor];
  v77 = [v197 leadingAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  v220[3] = v78;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v220 count:4];
  [(TVRUINowPlayingInfoViewController *)self setDoubleLineInfoLayoutConstraints:v79];

  [(TVRUINowPlayingInfoViewController *)self setTitleLabel:v196];
  [(TVRUINowPlayingInfoViewController *)self setDetailsTextView:v200];
  [(TVRUINowPlayingInfoViewController *)self setInfoLabel:v197];
  [(TVRUINowPlayingInfoViewController *)self setRatingsContainer:v201];
  [(TVRUINowPlayingInfoViewController *)self setRatingsLabel:v194];
  [(TVRUINowPlayingInfoViewController *)self setPlayFromStartButton:v199];
  [(TVRUINowPlayingInfoViewController *)self setDetailsButton:v198];
  [(TVRUINowPlayingInfoViewController *)self setScrollView:v195];
  [(TVRUINowPlayingInfoViewController *)self setDetailsTextHeightConstraint:v190];
  uint64_t v219 = objc_opt_class();
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v219 count:1];
  v204[0] = MEMORY[0x263EF8330];
  v204[1] = 3221225472;
  v204[2] = __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_5;
  v204[3] = &unk_2648001B8;
  objc_copyWeak(&v205, &location);
  id v81 = (id)[(TVRUINowPlayingInfoViewController *)self registerForTraitChanges:v80 withHandler:v204];

  [(TVRUINowPlayingInfoViewController *)self _updateContraintsForStackedLayout:[(TVRUINowPlayingInfoViewController *)self _currentTraitsSizeCategoryRequiresStackedLayout]];
  [(TVRUINowPlayingInfoViewController *)self _updateConstraintsForInfoLineUsingDoubleLineLayout:[(TVRUINowPlayingInfoViewController *)self _infoLineRequiresDoubleLayout]];
  objc_destroyWeak(&v205);

  objc_destroyWeak(&v215);
  objc_destroyWeak(&v217);
  objc_destroyWeak(&location);
}

id __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  objc_super v3 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] variant:1024];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263F814F0]];

  return v2;
}

id __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  objc_super v3 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835B8] variant:1024];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263F814F0]];

  return v2;
}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained commandHandler];

    id WeakRetained = v4;
    if (v2)
    {
      [v4 _playHaptic];
      objc_super v3 = [v4 commandHandler];
      v3[2](v3, 9, MEMORY[0x263EFFA78]);

      id WeakRetained = v4;
    }
  }
}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained openProductPage];
    id WeakRetained = v2;
  }
}

void __55__TVRUINowPlayingInfoViewController_configureHierarchy__block_invoke_5(uint64_t a1)
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
  BOOL v3 = [(TVRUINowPlayingInfoViewController *)self _currentTraitsSizeCategoryRequiresStackedLayout];
  if (v3 != [(TVRUINowPlayingInfoViewController *)self _isCurrentlyStackedLayout]) {
    [(TVRUINowPlayingInfoViewController *)self _updateContraintsForStackedLayout:v3];
  }
  id v4 = [(TVRUINowPlayingInfoViewController *)self detailsTextView];
  objc_msgSend(v4, "infoview_computedHeight");
  double v6 = v5;

  if (v6 > 0.0)
  {
    if (v3 && v6 > 250.0) {
      double v6 = 250.0;
    }
    v7 = [(TVRUINowPlayingInfoViewController *)self detailsTextHeightConstraint];
    [v7 setConstant:v6];
  }
  BOOL v8 = [(TVRUINowPlayingInfoViewController *)self _isCurrentlyDoubleInfoLineLayout];
  BOOL v9 = [(TVRUINowPlayingInfoViewController *)self _infoLineRequiresDoubleLayout];
  if (v8 != v9) {
    [(TVRUINowPlayingInfoViewController *)self _updateConstraintsForInfoLineUsingDoubleLineLayout:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)TVRUINowPlayingInfoViewController;
  [(TVRUINowPlayingInfoViewController *)&v10 updateViewConstraints];
}

- (void)_updateContraintsForStackedLayout:(BOOL)a3
{
  id v4 = (void *)MEMORY[0x263F08938];
  if (a3)
  {
    double v5 = [(TVRUINowPlayingInfoViewController *)self stackedLayoutConstraints];
    [v4 activateConstraints:v5];

    double v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingInfoViewController *)self standardLayoutConstraints];
  }
  else
  {
    v7 = [(TVRUINowPlayingInfoViewController *)self standardLayoutConstraints];
    [v4 activateConstraints:v7];

    double v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingInfoViewController *)self stackedLayoutConstraints];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");
}

- (void)_updateConstraintsForInfoLineUsingDoubleLineLayout:(BOOL)a3
{
  id v4 = (void *)MEMORY[0x263F08938];
  if (a3)
  {
    double v5 = [(TVRUINowPlayingInfoViewController *)self doubleLineInfoLayoutConstraints];
    [v4 activateConstraints:v5];

    double v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingInfoViewController *)self singleLineInfoLayoutConstraints];
  }
  else
  {
    v7 = [(TVRUINowPlayingInfoViewController *)self singleLineInfoLayoutConstraints];
    [v4 activateConstraints:v7];

    double v6 = (void *)MEMORY[0x263F08938];
    [(TVRUINowPlayingInfoViewController *)self doubleLineInfoLayoutConstraints];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");
}

- (BOOL)_isCurrentlyStackedLayout
{
  id v2 = [(TVRUINowPlayingInfoViewController *)self stackedLayoutConstraints];
  BOOL v3 = [v2 firstObject];

  LOBYTE(v2) = [v3 isActive];
  return (char)v2;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
  id v5 = a3;
  [(TVRUINowPlayingInfoViewController *)self updateFromNowPlayingInfo:v5];
}

- (void)updateFromNowPlayingInfo:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 metadata];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 kind];
    if (v7 == 2) {
      objc_msgSend(v6, "tvrui_secondaryTitle");
    }
    else {
    id v8 = [v6 title];
    }
    BOOL v9 = [(TVRUINowPlayingInfoViewController *)self titleLabel];
    [v9 setText:v8];

    objc_super v10 = [v6 extendedDescription];
    v11 = [(TVRUINowPlayingInfoViewController *)self detailsTextView];
    [v11 setText:v10];

    v12 = objc_msgSend(v6, "tvrui_formattedInfo");
    v13 = [(TVRUINowPlayingInfoViewController *)self infoLabel];
    [v13 setText:v12];

    uint64_t v14 = [v6 ratingDescription];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      v16 = [(TVRUINowPlayingInfoViewController *)self ratingsContainer];
      [v16 setHidden:0];

      v17 = [v6 ratingDescription];
      v18 = [(TVRUINowPlayingInfoViewController *)self ratingsLabel];
      [v18 setText:v17];
    }
    else
    {
      v19 = [(TVRUINowPlayingInfoViewController *)self ratingsLabel];
      [v19 setText:0];

      v17 = [(TVRUINowPlayingInfoViewController *)self ratingsContainer];
      [v17 setHidden:1];
    }

    v20 = [(TVRUINowPlayingInfoViewController *)self view];
    [v20 setNeedsUpdateConstraints];

    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = v21;
    if (v7 == 4) {
      v23 = @"TVRUIDetailsSportingEvent";
    }
    else {
      v23 = @"TVRUIDetails";
    }
    v24 = [v21 localizedStringForKey:v23 value:&stru_26DB4CAE0 table:@"Localizable"];

    v25 = [(TVRUINowPlayingInfoViewController *)self detailsButton];
    [v25 setTitle:v24 forState:0];
  }
  v50 = v4;
  int v26 = objc_msgSend(v4, "tvrui_mediaIsStopped");
  if (v26)
  {
    uint64_t v27 = [(TVRUINowPlayingInfoViewController *)self styleProvider];
    v28 = [v27 inactiveMediaTextColor];
  }
  else
  {
    v28 = [MEMORY[0x263F825C8] whiteColor];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v29 = [(TVRUINowPlayingInfoViewController *)self titleLabel];
  v61[0] = v29;
  v30 = [(TVRUINowPlayingInfoViewController *)self detailsTextView];
  v61[1] = v30;
  v31 = [(TVRUINowPlayingInfoViewController *)self ratingsLabel];
  v61[2] = v31;
  uint64_t v32 = [(TVRUINowPlayingInfoViewController *)self playFromStartButton];
  v61[3] = v32;
  v49 = self;
  uint64_t v33 = [(TVRUINowPlayingInfoViewController *)self detailsButton];
  v61[4] = v33;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:5];

  uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(v34);
        }
        id v39 = *(id *)(*((void *)&v55 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [v39 setTextColor:v28];
        }
        else {
          [v39 setTintColor:v28];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v36);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v40 = [(TVRUINowPlayingInfoViewController *)v49 infoLabel];
  v59[0] = v40;
  v41 = [(TVRUINowPlayingInfoViewController *)v49 ratingsLabel];
  v59[1] = v41;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];

  uint64_t v43 = [v42 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v52 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        if (v26)
        {
          [*(id *)(*((void *)&v51 + 1) + 8 * j) setTextColor:v28];
        }
        else
        {
          v48 = [MEMORY[0x263F825C8] lightGrayColor];
          [v47 setTextColor:v48];
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v44);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_currentTraitsSizeCategoryRequiresStackedLayout
{
  id v2 = [(TVRUINowPlayingInfoViewController *)self traitCollection];
  BOOL v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x263F83420]) == NSOrderedDescending;
  return (char)v2;
}

- (void)_playHaptic
{
  id v2 = [(TVRUINowPlayingInfoViewController *)self eventHaptic];
  [v2 playSelectionEventHaptic];
}

- (BOOL)_isCurrentlyDoubleInfoLineLayout
{
  id v2 = [(TVRUINowPlayingInfoViewController *)self doubleLineInfoLayoutConstraints];
  BOOL v3 = [v2 firstObject];

  LOBYTE(v2) = [v3 isActive];
  return (char)v2;
}

- (BOOL)_infoLineRequiresDoubleLayout
{
  BOOL v3 = [(TVRUINowPlayingInfoViewController *)self detailsTextView];
  [v3 bounds];
  double v5 = v4;

  BOOL result = v5 != 0.0
        && ([(TVRUINowPlayingInfoViewController *)self infoLabel],
            double v6 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "sizeThatFits:", v5, 1.79769313e308),
            double v8 = v7,
            v6,
            v8 != 0.0)
        && v8 / v5 > 0.8;
  return result;
}

- (void)openProductPage
{
  BOOL v3 = [(TVRUINowPlayingInfoViewController *)self nowPlayingInfo];
  id v6 = [v3 metadata];

  double v4 = [v6 productPageURL];
  if (v4)
  {
    double v5 = [(TVRUINowPlayingInfoViewController *)self actionProvider];
    [v5 openURL:v4];
  }
}

- (void)_animateButtonToHighlightState:(id)a3
{
  id v4 = a3;
  [(TVRUINowPlayingInfoViewController *)self setUserInteractionInProgress:1];
  double v5 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__TVRUINowPlayingInfoViewController__animateButtonToHighlightState___block_invoke;
  v7[3] = &unk_2647FFF70;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v7 animations:0.2];
}

uint64_t __68__TVRUINowPlayingInfoViewController__animateButtonToHighlightState___block_invoke(uint64_t a1)
{
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  CGAffineTransform v3 = v4;
  return [*(id *)(a1 + 32) setTransform:&v3];
}

- (void)_animateButtonFromHighlightState:(id)a3
{
  id v4 = a3;
  [(TVRUINowPlayingInfoViewController *)self setUserInteractionInProgress:0];
  double v5 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__TVRUINowPlayingInfoViewController__animateButtonFromHighlightState___block_invoke;
  v7[3] = &unk_2647FFF70;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v7 animations:0.2];
}

uint64_t __70__TVRUINowPlayingInfoViewController__animateButtonFromHighlightState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (TVRUIActionProviding)actionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionProvider);
  return (TVRUIActionProviding *)WeakRetained;
}

- (void)setActionProvider:(id)a3
{
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (BOOL)userInteractionInProgress
{
  return self->_userInteractionInProgress;
}

- (void)setUserInteractionInProgress:(BOOL)a3
{
  self->_userInteractionInProgress = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)detailsTextView
{
  return self->_detailsTextView;
}

- (void)setDetailsTextView:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIView)ratingsContainer
{
  return self->_ratingsContainer;
}

- (void)setRatingsContainer:(id)a3
{
}

- (UILabel)ratingsLabel
{
  return self->_ratingsLabel;
}

- (void)setRatingsLabel:(id)a3
{
}

- (UIButton)playFromStartButton
{
  return self->_playFromStartButton;
}

- (void)setPlayFromStartButton:(id)a3
{
}

- (UIButton)detailsButton
{
  return self->_detailsButton;
}

- (void)setDetailsButton:(id)a3
{
}

- (NSArray)stackedLayoutConstraints
{
  return self->_stackedLayoutConstraints;
}

- (void)setStackedLayoutConstraints:(id)a3
{
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
}

- (NSArray)singleLineInfoLayoutConstraints
{
  return self->_singleLineInfoLayoutConstraints;
}

- (void)setSingleLineInfoLayoutConstraints:(id)a3
{
}

- (NSArray)doubleLineInfoLayoutConstraints
{
  return self->_doubleLineInfoLayoutConstraints;
}

- (void)setDoubleLineInfoLayoutConstraints:(id)a3
{
}

- (NSLayoutConstraint)detailsTextHeightConstraint
{
  return self->_detailsTextHeightConstraint;
}

- (void)setDetailsTextHeightConstraint:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_detailsTextHeightConstraint, 0);
  objc_storeStrong((id *)&self->_doubleLineInfoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_singleLineInfoLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_playFromStartButton, 0);
  objc_storeStrong((id *)&self->_ratingsLabel, 0);
  objc_storeStrong((id *)&self->_ratingsContainer, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_detailsTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

@end