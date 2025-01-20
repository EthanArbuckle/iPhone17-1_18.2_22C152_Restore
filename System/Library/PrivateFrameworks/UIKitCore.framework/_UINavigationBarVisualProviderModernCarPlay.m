@interface _UINavigationBarVisualProviderModernCarPlay
- (BOOL)centerTextButtons;
- (BOOL)compactMetrics;
- (BOOL)havePrepared;
- (BOOL)isRTL;
- (BOOL)navigationItemIsBackItem:(id)a3;
- (BOOL)navigationItemIsTopItem:(id)a3;
- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)backButtonConstraints;
- (NSArray)debugViews;
- (NSLayoutConstraint)largeTitleLeadingConstraint;
- (NSLayoutConstraint)largeTitleTrailingConstraint;
- (NSLayoutConstraint)leadingBarConstraint;
- (NSLayoutConstraint)leadingBarNoItemsConstraint;
- (NSLayoutConstraint)leadingBarWithNoTitleTrailingConstraint;
- (NSLayoutConstraint)leadingBarWithTitleTrailingConstraint;
- (NSLayoutConstraint)regularTitleConstraint;
- (NSLayoutConstraint)trailingBarConstraint;
- (NSLayoutConstraint)trailingBarNoItemsConstraint;
- (NSLayoutConstraint)trailingBarWithNoTitleLeadingConstraint;
- (NSLayoutConstraint)trailingBarWithTitleLeadingConstraint;
- (UIColor)tintColor;
- (UIFocusContainerGuide)focusContainerGuide;
- (UIView)contentView;
- (UIVisualEffectView)backgroundView;
- (_CarTitleView)titleView;
- (_UIBarButtonItemAppearanceStorage)appearanceStorage;
- (_UIButtonBar)leadingBar;
- (_UIButtonBar)trailingBar;
- (_UIButtonBarButton)backBarButton;
- (double)absorptionForItem:(id)a3;
- (double)backButtonMargin;
- (double)backButtonMaximumWidth;
- (double)defaultEdgeSpacing;
- (double)defaultTextPadding;
- (id)backIndicatorImage;
- (id)backIndicatorMaskImage;
- (id)defaultFontDescriptor;
- (int64_t)barMetrics;
- (int64_t)barType;
- (unint64_t)edgesPaddingBarButtonItem:(id)a3;
- (void)__backButtonAction;
- (void)_configureBackground;
- (void)_installGradientLayerMaskForClippingView:(id)a3;
- (void)_updateContentAnimated:(BOOL)a3 completion:(id)a4 direction:(unint64_t)a5;
- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5 direction:(unint64_t)a6;
- (void)navigationBarInvalidatedResolvedLayoutMargins;
- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4;
- (void)popAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepare;
- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5;
- (void)pushAnimated:(BOOL)a3 completion:(id)a4;
- (void)setBackBarButton:(id)a3;
- (void)setBackButtonConstraints:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDebugViews:(id)a3;
- (void)setFocusContainerGuide:(id)a3;
- (void)setHavePrepared:(BOOL)a3;
- (void)setLargeTitleLeadingConstraint:(id)a3;
- (void)setLargeTitleTrailingConstraint:(id)a3;
- (void)setLeadingBar:(id)a3;
- (void)setLeadingBarConstraint:(id)a3;
- (void)setLeadingBarNoItemsConstraint:(id)a3;
- (void)setLeadingBarWithNoTitleTrailingConstraint:(id)a3;
- (void)setLeadingBarWithTitleTrailingConstraint:(id)a3;
- (void)setRegularTitleConstraint:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTrailingBar:(id)a3;
- (void)setTrailingBarConstraint:(id)a3;
- (void)setTrailingBarNoItemsConstraint:(id)a3;
- (void)setTrailingBarWithNoTitleLeadingConstraint:(id)a3;
- (void)setTrailingBarWithTitleLeadingConstraint:(id)a3;
- (void)setupTopNavigationItem;
- (void)stackDidChangeFrom:(id)a3;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTopNavigationItemAnimated:(BOOL)a3;
@end

@implementation _UINavigationBarVisualProviderModernCarPlay

- (void)prepare
{
  v220[2] = *MEMORY[0x1E4F143B8];
  if (![(_UINavigationBarVisualProviderModernCarPlay *)self havePrepared])
  {
    [(_UINavigationBarVisualProviderModernCarPlay *)self setHavePrepared:1];
    v218.receiver = self;
    v218.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
    [(_UINavigationBarVisualProvider *)&v218 prepare];
    -[UIView setLayoutMargins:](self->super._navigationBar, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v3 = +[UIColor clearColor];
    [(UIView *)self->super._navigationBar setBackgroundColor:v3];

    v4 = objc_alloc_init(UIVisualEffectView);
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UINavigationBarVisualProviderModernCarPlay *)self setBackgroundView:v4];
    v217 = v4;
    [(UIView *)self->super._navigationBar addSubview:v4];
    [(_UINavigationBarVisualProviderModernCarPlay *)self _configureBackground];
    v5 = objc_alloc_init(UIView);
    [(_UINavigationBarVisualProviderModernCarPlay *)self setContentView:v5];

    v6 = [(_UINavigationBarVisualProviderModernCarPlay *)self contentView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    navigationBar = self->super._navigationBar;
    v8 = [(_UINavigationBarVisualProviderModernCarPlay *)self contentView];
    [(UIView *)navigationBar addSubview:v8];

    v9 = [_CarTitleView alloc];
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UINavigationBarVisualProviderModernCarPlay *)self setTitleView:v10];

    v11 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    LODWORD(v13) = 1144750080;
    [v12 setContentCompressionResistancePriority:0 forAxis:v13];

    v14 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    LODWORD(v15) = 1111752704;
    [v14 setContentHuggingPriority:0 forAxis:v15];

    v16 = [(_UINavigationBarVisualProviderModernCarPlay *)self contentView];
    v17 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v16 addSubview:v17];

    v18 = _newButtonBar(self);
    [(_UINavigationBarVisualProviderModernCarPlay *)self setLeadingBar:v18];

    v19 = self->super._navigationBar;
    v20 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBar];
    v21 = [v20 view];
    [(UIView *)v19 addSubview:v21];

    v22 = _newButtonBar(self);
    [(_UINavigationBarVisualProviderModernCarPlay *)self setTrailingBar:v22];

    v23 = self->super._navigationBar;
    v24 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBar];
    v25 = [v24 view];
    [(UIView *)v23 addSubview:v25];

    v26 = self;
    v27 = [_UIButtonBarButton alloc];
    v28 = objc_alloc_init(_UIButtonBarButtonVisualProviderCarPlay);
    v29 = [(_UIButtonBarButton *)v27 initWithVisualProvider:v28];

    [(UIView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v30) = 1144586240;
    [(UIView *)v29 setContentCompressionResistancePriority:0 forAxis:v30];
    [(UIControl *)v29 addTarget:v26 action:sel___backButtonAction forControlEvents:0x2000];

    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setBackBarButton:v29];
    v31 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v32 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backBarButton];
    [v31 addSubview:v32];

    [(UIView *)self->super._navigationBar _setWantsAutolayout];
    if ([(UIView *)self->super._navigationBar translatesAutoresizingMaskIntoConstraints])
    {
      [(UIView *)self->super._navigationBar _setHostsLayoutEngine:1];
    }
    v33 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v34 = [v33 view];
    v35 = [v34 leadingAnchor];
    v36 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v37 = [v36 leadingAnchor];
    v38 = [v35 constraintEqualToAnchor:v37 constant:12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLeadingBarConstraint:v38];

    v39 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v40 = [v39 view];
    v41 = [v40 widthAnchor];
    v42 = [v41 constraintEqualToConstant:0.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLeadingBarNoItemsConstraint:v42];

    v43 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v44 = [v43 view];
    v45 = [v44 widthAnchor];
    v46 = [v45 constraintEqualToConstant:0.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setTrailingBarNoItemsConstraint:v46];

    v215 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backBarButton];
    v211 = [v215 leadingAnchor];
    v213 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v209 = [v213 leadingAnchor];
    v47 = [v211 constraintEqualToAnchor:v209];
    v220[0] = v47;
    v48 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backBarButton];
    v49 = [v48 trailingAnchor];
    v50 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v51 = [v50 view];
    v52 = [v51 leadingAnchor];
    v53 = [v49 constraintEqualToAnchor:v52];
    v220[1] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:2];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setBackButtonConstraints:v54];

    v55 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v56 = [v55 leadingAnchor];
    v57 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v58 = [v57 leadingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58 constant:12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLargeTitleLeadingConstraint:v59];

    v60 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v61 = [v60 trailingAnchor];
    v62 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v63 = [v62 trailingAnchor];
    v64 = [v61 constraintEqualToAnchor:v63 constant:-12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLargeTitleTrailingConstraint:v64];

    v65 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v66 = [v65 centerXAnchor];
    v67 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v68 = [v67 centerXAnchor];
    v69 = [v66 constraintEqualToAnchor:v68];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setRegularTitleConstraint:v69];

    v70 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v71 = [v70 view];
    v72 = [v71 trailingAnchor];
    v73 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v74 = [v73 leadingAnchor];
    v75 = [v72 constraintLessThanOrEqualToAnchor:v74 constant:-12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLeadingBarWithTitleTrailingConstraint:v75];

    v76 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v77 = [v76 view];
    v78 = [v77 trailingAnchor];
    v79 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v80 = [v79 view];
    v81 = [v80 leadingAnchor];
    v82 = [v78 constraintLessThanOrEqualToAnchor:v81 constant:-12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setLeadingBarWithNoTitleTrailingConstraint:v82];

    v83 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v84 = [v83 view];
    v85 = [v84 leadingAnchor];
    v86 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v87 = [v86 trailingAnchor];
    v88 = [v85 constraintGreaterThanOrEqualToAnchor:v87 constant:12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setTrailingBarWithTitleLeadingConstraint:v88];

    v89 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v90 = [v89 view];
    v91 = [v90 leadingAnchor];
    v92 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v93 = [v92 view];
    v94 = [v93 trailingAnchor];
    v95 = [v91 constraintGreaterThanOrEqualToAnchor:v94 constant:12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setTrailingBarWithNoTitleLeadingConstraint:v95];

    v96 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v97 = [v96 view];
    v98 = [v97 trailingAnchor];
    v99 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v100 = [v99 trailingAnchor];
    v101 = [v98 constraintEqualToAnchor:v100 constant:-12.0];
    [(_UINavigationBarVisualProviderModernCarPlay *)v26 setTrailingBarConstraint:v101];

    v102 = objc_alloc_init(UIFocusContainerGuide);
    focusContainerGuide = v26->_focusContainerGuide;
    v26->_focusContainerGuide = v102;

    v104 = self->super._navigationBar;
    v105 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 focusContainerGuide];
    [(UIView *)v104 addLayoutGuide:v105];

    v168 = (void *)MEMORY[0x1E4F5B268];
    v216 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v212 = [v216 topAnchor];
    v214 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v210 = [v214 topAnchor];
    v208 = [v212 constraintEqualToAnchor:v210];
    v219[0] = v208;
    v207 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v205 = [v207 bottomAnchor];
    v206 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v204 = [v206 bottomAnchor];
    v203 = [v205 constraintEqualToAnchor:v204];
    v219[1] = v203;
    v202 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v200 = [v202 leftAnchor];
    v201 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v199 = [v201 leftAnchor];
    v198 = [v200 constraintEqualToAnchor:v199];
    v219[2] = v198;
    v197 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v195 = [v197 rightAnchor];
    v196 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v194 = [v196 rightAnchor];
    v193 = [v195 constraintEqualToAnchor:v194];
    v219[3] = v193;
    v192 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backBarButton];
    v190 = [v192 topAnchor];
    v191 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v189 = [v191 topAnchor];
    v188 = [v190 constraintEqualToAnchor:v189];
    v219[4] = v188;
    v187 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backBarButton];
    v185 = [v187 bottomAnchor];
    v186 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v184 = [v186 bottomAnchor];
    v183 = [v185 constraintEqualToAnchor:v184];
    v219[5] = v183;
    v182 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBarConstraint];
    v219[6] = v182;
    v181 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v180 = [v181 view];
    v178 = [v180 topAnchor];
    v179 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v177 = [v179 topAnchor];
    v176 = [v178 constraintEqualToAnchor:v177];
    v219[7] = v176;
    v175 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBar];
    v174 = [v175 view];
    v172 = [v174 bottomAnchor];
    v173 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v171 = [v173 bottomAnchor];
    v170 = [v172 constraintEqualToAnchor:v171];
    v219[8] = v170;
    v169 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 leadingBarWithTitleTrailingConstraint];
    v219[9] = v169;
    v167 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v165 = [v167 centerYAnchor];
    v166 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v164 = [v166 centerYAnchor];
    v163 = [v165 constraintEqualToAnchor:v164];
    v219[10] = v163;
    v162 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 titleView];
    v160 = [v162 heightAnchor];
    v161 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 contentView];
    v159 = [v161 heightAnchor];
    v158 = [v160 constraintEqualToAnchor:v159];
    v219[11] = v158;
    v157 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 regularTitleConstraint];
    v219[12] = v157;
    v156 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBarWithTitleLeadingConstraint];
    v219[13] = v156;
    v155 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBarConstraint];
    v219[14] = v155;
    v154 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v153 = [v154 view];
    v151 = [v153 topAnchor];
    v152 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v150 = [v152 topAnchor];
    v149 = [v151 constraintEqualToAnchor:v150];
    v219[15] = v149;
    v148 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 trailingBar];
    v147 = [v148 view];
    v145 = [v147 bottomAnchor];
    v146 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v144 = [v146 bottomAnchor];
    v143 = [v145 constraintEqualToAnchor:v144];
    v219[16] = v143;
    v142 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backgroundView];
    v141 = [v142 topAnchor];
    v140 = [(UIView *)self->super._navigationBar topAnchor];
    v139 = [v141 constraintEqualToAnchor:v140];
    v219[17] = v139;
    v138 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backgroundView];
    v137 = [v138 bottomAnchor];
    v136 = [(UIView *)self->super._navigationBar bottomAnchor];
    v135 = [v137 constraintEqualToAnchor:v136];
    v219[18] = v135;
    v134 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backgroundView];
    v133 = [v134 leftAnchor];
    v132 = [(UIView *)self->super._navigationBar leftAnchor];
    v131 = [v133 constraintEqualToAnchor:v132];
    v219[19] = v131;
    v130 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 backgroundView];
    v129 = [v130 rightAnchor];
    v128 = [(UIView *)self->super._navigationBar rightAnchor];
    v127 = [v129 constraintEqualToAnchor:v128];
    v219[20] = v127;
    v126 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 focusContainerGuide];
    v124 = [v126 leadingAnchor];
    v125 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v123 = [v125 leadingAnchor];
    v122 = [v124 constraintEqualToAnchor:v123];
    v219[21] = v122;
    v121 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 focusContainerGuide];
    v119 = [v121 trailingAnchor];
    v120 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v118 = [v120 trailingAnchor];
    v117 = [v119 constraintEqualToAnchor:v118];
    v219[22] = v117;
    v116 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 focusContainerGuide];
    v106 = [v116 topAnchor];
    v107 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v108 = [v107 topAnchor];
    v109 = [v106 constraintEqualToAnchor:v108];
    v219[23] = v109;
    v110 = [(_UINavigationBarVisualProviderModernCarPlay *)v26 focusContainerGuide];
    v111 = [v110 bottomAnchor];
    v112 = [(UIView *)self->super._navigationBar safeAreaLayoutGuide];
    v113 = [v112 bottomAnchor];
    v114 = [v111 constraintEqualToAnchor:v113];
    v219[24] = v114;
    v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:25];
    [v168 activateConstraints:v115];
  }
}

- (void)teardown
{
  v3 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
  [v3 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setTitleView:0];
  v4 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBar];
  v5 = [v4 view];
  [v5 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setLeadingBar:0];
  v6 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBar];
  v7 = [v6 view];
  [v7 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setTrailingBar:0];
  v8 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
  [v8 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setBackBarButton:0];
  v9 = [(_UINavigationBarVisualProviderModernCarPlay *)self backgroundView];
  [v9 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setBackgroundView:0];
  v10 = [(_UINavigationBarVisualProviderModernCarPlay *)self contentView];
  [v10 removeFromSuperview];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setContentView:0];
  v11 = [(_UINavigationBarVisualProviderModernCarPlay *)self debugViews];
  [v11 enumerateObjectsUsingBlock:&__block_literal_global_222];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setDebugViews:0];
  navigationBar = self->super._navigationBar;
  double v13 = [(_UINavigationBarVisualProviderModernCarPlay *)self focusContainerGuide];
  [(UIView *)navigationBar removeLayoutGuide:v13];

  [(_UINavigationBarVisualProviderModernCarPlay *)self setFocusContainerGuide:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setLeadingBarConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setLeadingBarNoItemsConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setTrailingBarConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setTrailingBarNoItemsConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setBackButtonConstraints:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setLargeTitleLeadingConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setLargeTitleTrailingConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setRegularTitleConstraint:0];
  [(_UINavigationBarVisualProviderModernCarPlay *)self setHavePrepared:0];
  v14.receiver = self;
  v14.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
  [(_UINavigationBarVisualProvider *)&v14 teardown];
}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
  [v6 setTitleView:v7];

  v8 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
  char v9 = [v8 isHidden];

  if ((v9 & 1) == 0)
  {
    v10 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    v12[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v6 setViewsRepresentingBackButton:v11];
  }
}

- (void)stackDidChangeFrom:(id)a3
{
  [(_UINavigationBarItemStack *)self->super._stack setChangeObserver:self];
  [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentAnimated:0 completion:0 direction:0];
}

- (void)setupTopNavigationItem
{
  id v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  v3 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v4 backItem:v3 animated:0 direction:0];
}

- (void)updateTopNavigationItemAnimated:(BOOL)a3
{
  id v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v4 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v5 backItem:v4 animated:0 direction:0];
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)navigationBarInvalidatedResolvedLayoutMargins
{
  [(UINavigationBar *)self->super._navigationBar _resolvedLayoutMargins];
  double v5 = v4;
  if (v3 == 0.0) {
    double v6 = 12.0;
  }
  else {
    double v6 = v3;
  }
  v7 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarConstraint];
  [v7 setConstant:v6];

  if (v5 == 0.0) {
    double v8 = 12.0;
  }
  else {
    double v8 = v5;
  }
  double v9 = -v8;
  id v10 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarConstraint];
  [v10 setConstant:v9];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (a3.width == 0.0)
  {
    double v4 = [(UIView *)self->super._navigationBar superview];
    double v5 = v4;
    if (v4)
    {
      [v4 bounds];
      CGFloat width = v6;
    }
  }
  double v7 = 44.0;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarVisualProviderModernCarPlay;
  [(_UINavigationBarVisualProvider *)&v4 traitCollectionDidChange:a3];
  [(_UINavigationBarVisualProviderModernCarPlay *)self _configureBackground];
}

- (void)__backButtonAction
{
  navigationBar = self->super._navigationBar;
  id v4 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  double v3 = [v4 _effectiveBackBarButtonItem];
  [(UINavigationBar *)navigationBar _sendNavigationPopForBackBarButtonItem:v3];
}

- (void)_updateContentForTopItem:(id)a3 backItem:(id)a4 animated:(BOOL)a5 direction:(unint64_t)a6
{
  v307[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v278 = a4;
  id v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = [v9 titleView];

  BOOL v274 = a5;
  if (v12)
  {
    double v13 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v13 setHidden:0];

    objc_super v14 = [v9 titleView];
    double v15 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v15 setView:v14];

    v16 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithNoTitleTrailingConstraint];
    v307[0] = v16;
    v17 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithNoTitleLeadingConstraint];
    v307[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v307 count:2];
    [v10 addObjectsFromArray:v18];

    v19 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithTitleTrailingConstraint];
    v306[0] = v19;
    v20 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithTitleLeadingConstraint];
    v306[1] = v20;
    v21 = v306;
  }
  else
  {
    uint64_t v22 = [v9 title];
    if (v22
      && (v23 = (void *)v22,
          [v9 title],
          v24 = objc_claimAutoreleasedReturnValue(),
          char v25 = [v24 isEqualToString:&stru_1ED0E84C0],
          v24,
          v23,
          (v25 & 1) == 0))
    {
      double v30 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v30 setHidden:0];

      v31 = [v9 title];
      v32 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v32 setText:v31];

      v33 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithNoTitleTrailingConstraint];
      v305[0] = v33;
      v34 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithNoTitleLeadingConstraint];
      v305[1] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v305 count:2];
      [v10 addObjectsFromArray:v35];

      v19 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithTitleTrailingConstraint];
      v304[0] = v19;
      v20 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithTitleLeadingConstraint];
      v304[1] = v20;
      v21 = v304;
    }
    else
    {
      v26 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v26 setHidden:1];

      v27 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithTitleTrailingConstraint];
      v303[0] = v27;
      v28 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithTitleLeadingConstraint];
      v303[1] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v303 count:2];
      [v10 addObjectsFromArray:v29];

      v19 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarWithNoTitleTrailingConstraint];
      v302[0] = v19;
      v20 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarWithNoTitleLeadingConstraint];
      v302[1] = v20;
      v21 = v302;
    }
  }
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v11 addObjectsFromArray:v36];

  uint64_t v37 = [v278 _effectiveBackBarButtonItem];

  char v38 = [v9 hidesBackButton];
  [v9 leftItemsSupplementBackButton];
  uint64_t v39 = [v9 leftBarButtonItems];
  v40 = (void *)v39;
  v41 = (void *)MEMORY[0x1E4F1CBF0];
  if (v39) {
    v42 = (void *)v39;
  }
  else {
    v42 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v43 = v42;

  v44 = [v9 rightBarButtonItems];
  v45 = v44;
  if (!v44) {
    v44 = v41;
  }
  v46 = [v44 reverseObjectEnumerator];
  v47 = [v46 allObjects];

  v48 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
  int v273 = [v48 isHidden];

  v281 = v43;
  uint64_t v49 = [v43 count];
  v50 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarNoItemsConstraint];
  if (v49) {
    v51 = v10;
  }
  else {
    v51 = v11;
  }
  [v51 addObject:v50];

  uint64_t v52 = [v47 count];
  v53 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBarNoItemsConstraint];
  if (v52) {
    v54 = v10;
  }
  else {
    v54 = v11;
  }
  [v54 addObject:v53];

  v55 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
  v56 = v55;
  v280 = (void *)v37;
  if (!v37 || (v38 & 1) != 0)
  {
    [v55 setHidden:1];

    v66 = [(_UINavigationBarVisualProviderModernCarPlay *)self backButtonConstraints];
    [v10 addObjectsFromArray:v66];

    v67 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarConstraint];
    [v11 addObject:v67];

    v64 = v43;
    BOOL v65 = v274;
    if ([v281 count])
    {
      v68 = [(_UINavigationBarVisualProviderModernCarPlay *)self regularTitleConstraint];
      [v11 addObject:v68];

      v69 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleLeadingConstraint];
      [v10 addObject:v69];

      v70 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleTrailingConstraint];
      [v10 addObject:v70];

      v63 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v63 setLargeText:0];
    }
    else
    {
      v71 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleLeadingConstraint];
      [v11 addObject:v71];

      v72 = [(_UINavigationBarVisualProviderModernCarPlay *)self regularTitleConstraint];
      [v10 addObject:v72];

      v73 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v73 setLargeText:1];

      uint64_t v74 = [v47 count];
      v63 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleTrailingConstraint];
      if (v74) {
        v75 = v10;
      }
      else {
        v75 = v11;
      }
      [v75 addObject:v63];
    }
  }
  else
  {
    [v55 setHidden:0];

    v57 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    [v57 configureBackButtonFromBarItem:v37 withAppearanceDelegate:self];

    v58 = [(_UINavigationBarVisualProviderModernCarPlay *)self backButtonConstraints];
    [v11 addObjectsFromArray:v58];

    v59 = [(_UINavigationBarVisualProviderModernCarPlay *)self regularTitleConstraint];
    [v11 addObject:v59];

    v60 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleLeadingConstraint];
    [v10 addObject:v60];

    v61 = [(_UINavigationBarVisualProviderModernCarPlay *)self largeTitleTrailingConstraint];
    [v10 addObject:v61];

    v62 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBarConstraint];
    [v10 addObject:v62];

    v63 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v63 setLargeText:0];
    v64 = v43;
    BOOL v65 = v274;
  }

  [MEMORY[0x1E4F5B268] deactivateConstraints:v10];
  [MEMORY[0x1E4F5B268] activateConstraints:v11];
  v76 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:v64 representativeItem:0];
  v77 = [[UIBarButtonItemGroup alloc] initWithBarButtonItems:v47 representativeItem:0];
  v276 = v76;
  if (!v65)
  {
    v301 = v76;
    v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v301 count:1];
    v93 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBar];
    [v93 setBarButtonGroups:v92];

    v300 = v77;
    v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v300 count:1];
    v95 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBar];
    [v95 setBarButtonGroups:v94];
LABEL_87:

    goto LABEL_88;
  }
  [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBar];
  v78 = v270 = v77;
  v79 = [v78 view];
  v293[0] = MEMORY[0x1E4F143A8];
  v293[1] = 3221225472;
  v275 = v47;
  v293[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke;
  v293[3] = &unk_1E52D9F98;
  v293[4] = self;
  v294 = v76;
  +[UIView transitionWithView:v79 duration:5242880 options:v293 animations:&__block_literal_global_54_0 completion:0.35];

  v77 = v270;
  v64 = v281;
  v80 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBar];
  v81 = [v80 view];
  v291[0] = MEMORY[0x1E4F143A8];
  v291[1] = 3221225472;
  v291[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_3;
  v291[3] = &unk_1E52D9F98;
  v291[4] = self;
  v292 = v270;
  +[UIView transitionWithView:v81 duration:5242880 options:v291 animations:&__block_literal_global_56_3 completion:0.35];

  if (a6)
  {
    v82 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    v83 = [v82 visualProvider];
    v84 = [v83 contentView];

    v85 = [UIView alloc];
    v86 = -[UIView initWithFrame:](v85, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v86 setClipsToBounds:1];
    v87 = [(_UINavigationBarVisualProvider *)self navigationBar];
    v272 = v86;
    [v87 addSubview:v86];

    v88 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    LODWORD(v86) = [v88 isHidden];

    v269 = v84;
    v250 = v11;
    if (v86)
    {
      v89 = [(_UINavigationBarVisualProviderModernCarPlay *)self leadingBar];
      v90 = [v89 view];
      uint64_t v91 = [v90 trailingAnchor];
    }
    else
    {
      uint64_t v91 = [v84 leadingAnchor];
    }
    v96 = objc_alloc_init(UILayoutGuide);
    v97 = [(_UINavigationBarVisualProvider *)self navigationBar];
    [v97 addLayoutGuide:v96];

    v98 = [(UILayoutGuide *)v96 trailingAnchor];
    uint64_t v99 = [(_UINavigationBarVisualProviderModernCarPlay *)self trailingBar];
    v100 = [(id)v99 view];
    v101 = [v100 leadingAnchor];
    v102 = [v98 constraintEqualToAnchor:v101];

    v256 = v102;
    LODWORD(v103) = 1148846080;
    [v102 setPriority:v103];
    v268 = v96;
    v104 = [(UILayoutGuide *)v96 leadingAnchor];
    v249 = (void *)v91;
    v105 = [v104 constraintEqualToAnchor:v91];

    LODWORD(v106) = 1148846080;
    [v105 setPriority:v106];
    v107 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    LOBYTE(v99) = [v107 isHidden];

    if ((v99 & 1) == 0) {
      [v105 setConstant:-4.0];
    }
    v251 = v10;
    id v252 = v9;
    id v271 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v108 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    v109 = [v108 snapshotViewAfterScreenUpdates:0];

    v253 = v109;
    if (v109)
    {
      [(UIView *)v109 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v272 addSubview:v109];
      v110 = [(UIView *)v109 centerXAnchor];
      v111 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      v112 = [v111 centerXAnchor];
      uint64_t v113 = [v110 constraintEqualToAnchor:v112];

      v261 = (void *)v113;
      v299[0] = v113;
      v263 = [(UIView *)v109 heightAnchor];
      v266 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v266 frame];
      v115 = [v263 constraintEqualToConstant:v114];
      v299[1] = v115;
      v116 = [(UIView *)v109 widthAnchor];
      v117 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
      [v117 frame];
      v119 = [v116 constraintEqualToConstant:v118];
      v299[2] = v119;
      v120 = [(UIView *)v109 centerYAnchor];
      v121 = [(UIView *)v272 centerYAnchor];
      [v120 constraintEqualToAnchor:v121];
      v123 = v122 = v105;
      v299[3] = v123;
      v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v299 count:4];
      [v271 addObjectsFromArray:v124];

      v105 = v122;
    }
    else
    {
      v261 = 0;
    }
    v248 = v105;
    v298[0] = v105;
    v298[1] = v256;
    v125 = [(UILayoutGuide *)v268 topAnchor];
    v126 = [(_UINavigationBarVisualProvider *)self navigationBar];
    v127 = [v126 topAnchor];
    v128 = [v125 constraintEqualToAnchor:v127];
    v298[2] = v128;
    v129 = [(UILayoutGuide *)v268 bottomAnchor];
    v130 = [(_UINavigationBarVisualProvider *)self navigationBar];
    v131 = [v130 bottomAnchor];
    v132 = [v129 constraintEqualToAnchor:v131];
    v298[3] = v132;
    v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:v298 count:4];
    [v271 addObjectsFromArray:v133];

    v134 = objc_alloc_init(UIView);
    v135 = v272;
    [(UIView *)v272 addSubview:v134];
    v262 = v134;
    if (v273)
    {
      v260 = 0;
      v267 = 0;
      v136 = v269;
      unint64_t v137 = 0x1E4F5B000;
    }
    else
    {
      v136 = v269;
      v138 = [v269 snapshotViewAfterScreenUpdates:0];
      [v138 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v272 addSubview:v138];
      v139 = [v138 leadingAnchor];
      v140 = [(UIView *)v134 leadingAnchor];
      uint64_t v141 = [v139 constraintEqualToAnchor:v140];

      v264 = [v138 heightAnchor];
      [v269 frame];
      v143 = [v264 constraintEqualToConstant:v142];
      v297[0] = v143;
      v144 = [v138 widthAnchor];
      [v269 frame];
      v146 = [v144 constraintEqualToConstant:v145];
      v297[1] = v146;
      v260 = (void *)v141;
      v297[2] = v141;
      v267 = v138;
      v147 = [v138 topAnchor];
      v148 = [(UIView *)v134 topAnchor];
      v149 = [v147 constraintEqualToAnchor:v148];
      v297[3] = v149;
      v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v297 count:4];
      [v271 addObjectsFromArray:v150];

      v134 = v262;
      v135 = v272;

      unint64_t v137 = 0x1E4F5B000uLL;
    }
    [*(id *)(v137 + 616) activateConstraints:v271];
    v151 = [(_UINavigationBarVisualProvider *)self navigationBar];
    [v151 layoutIfNeeded];

    [(UILayoutGuide *)v268 layoutFrame];
    -[UIView setFrame:](v135, "setFrame:");
    [v136 frame];
    double v153 = v152;
    double v155 = v154;
    double v157 = v156;
    double v159 = v158;
    v160 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    -[UIView convertRect:fromView:](v135, "convertRect:fromView:", v160, v153, v155, v157, v159);
    -[UIView setFrame:](v134, "setFrame:");

    [(_UINavigationBarVisualProviderModernCarPlay *)self _installGradientLayerMaskForClippingView:v135];
    v161 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    v162 = [v161 snapshotViewAfterScreenUpdates:1];

    [v162 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v135 addSubview:v162];
    if (a6 == 1)
    {
      v163 = [v162 leadingAnchor];
    }
    else
    {
      v163 = [v162 leadingAnchor];
      if (v134)
      {
        uint64_t v164 = [(UIView *)v134 leadingAnchor];
        goto LABEL_46;
      }
    }
    uint64_t v164 = [(UIView *)v135 trailingAnchor];
LABEL_46:
    v165 = (void *)v164;
    uint64_t v166 = [v163 constraintEqualToAnchor:v164];

    id v167 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v255 = (void *)v166;
    v296[0] = v166;
    v246 = [v162 heightAnchor];
    v257 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v257 frame];
    v169 = [v246 constraintEqualToConstant:v168];
    v296[1] = v169;
    v170 = [v162 widthAnchor];
    v171 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
    [v171 frame];
    v173 = [v170 constraintEqualToConstant:v172];
    v296[2] = v173;
    v254 = v162;
    v174 = [v162 centerYAnchor];
    v175 = [(UIView *)v135 centerYAnchor];
    v176 = [v174 constraintEqualToAnchor:v175];
    v296[3] = v176;
    v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v296 count:4];
    v265 = v167;
    [v167 addObjectsFromArray:v177];

    if (!v278)
    {
      v184 = 0;
      v279 = 0;
      v247 = 0;
      unint64_t v180 = 0x1E4F5B000;
      v182 = v260;
      v181 = v261;
      v183 = v253;
      goto LABEL_50;
    }
    v178 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    char v179 = [v178 isHidden];

    unint64_t v180 = 0x1E4F5B000;
    v182 = v260;
    v181 = v261;
    v183 = v253;
    if (v179)
    {
      v184 = 0;
      v279 = 0;
      v247 = 0;
LABEL_50:
      v185 = v255;
      goto LABEL_59;
    }
    v186 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    v187 = [v186 visualProvider];
    v188 = [v187 backIndicatorView];

    v189 = [v188 snapshotViewAfterScreenUpdates:1];
    v190 = [(_UINavigationBarVisualProvider *)self navigationBar];
    [v190 addSubview:v189];

    v191 = [(_UINavigationBarVisualProvider *)self navigationBar];
    v245 = v188;
    [v188 frame];
    double v193 = v192;
    double v195 = v194;
    double v197 = v196;
    double v199 = v198;
    v200 = [(_UINavigationBarVisualProviderModernCarPlay *)self backBarButton];
    objc_msgSend(v191, "convertRect:fromView:", v200, v193, v195, v197, v199);
    objc_msgSend(v189, "setFrame:");

    v201 = [v269 snapshotViewAfterScreenUpdates:1];
    [v201 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v272 addSubview:v201];
    v185 = v255;
    v247 = v189;
    if (a6 == 1)
    {
      if (!v253) {
        goto LABEL_57;
      }
      v202 = [v201 leadingAnchor];
      v203 = v253;
    }
    else
    {
      v202 = [v201 trailingAnchor];
      v203 = v262;
    }
    v204 = [(UIView *)v203 leadingAnchor];
    uint64_t v205 = [v202 constraintEqualToAnchor:v204];

    if (v205)
    {
      uint64_t v258 = v205;
      [v265 addObject:v205];
LABEL_58:
      v206 = [v201 heightAnchor];
      [v269 frame];
      v208 = [v206 constraintEqualToConstant:v207];
      v295[0] = v208;
      v209 = [v201 widthAnchor];
      [v269 frame];
      v211 = [v209 constraintEqualToConstant:v210];
      v295[1] = v211;
      v279 = v201;
      v212 = [v201 topAnchor];
      v213 = [(UIView *)v262 topAnchor];
      v214 = [v212 constraintEqualToAnchor:v213];
      v295[2] = v214;
      v215 = [MEMORY[0x1E4F1C978] arrayWithObjects:v295 count:3];
      [v265 addObjectsFromArray:v215];

      unint64_t v180 = 0x1E4F5B000uLL;
      v182 = v260;
      v181 = v261;
      v183 = v253;
      v184 = (void *)v258;
LABEL_59:
      [*(id *)(v180 + 616) activateConstraints:v265];
      v216 = [(_UINavigationBarVisualProvider *)self navigationBar];
      [v216 layoutIfNeeded];

      id v217 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v218 = v217;
      v47 = v275;
      if (v185) {
        [v217 addObject:v185];
      }
      if (v181) {
        [v218 addObject:v181];
      }
      if (v182) {
        [v218 addObject:v182];
      }
      if (v184) {
        [v218 addObject:v184];
      }
      v259 = v184;
      [*(id *)(v180 + 616) deactivateConstraints:v218];
      id v219 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v254)
      {
        v220 = [v254 centerXAnchor];
        v221 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
        v222 = [v221 centerXAnchor];
        v223 = [v220 constraintEqualToAnchor:v222];
        [v219 addObject:v223];

        v47 = v275;
      }
      if (a6 == 2)
      {
        if (v267)
        {
          v224 = [v267 leadingAnchor];
          v225 = [v254 leadingAnchor];
          v226 = [v224 constraintEqualToAnchor:v225];
          [v219 addObject:v226];

          v47 = v275;
        }
        if (v183)
        {
          v227 = [(UIView *)v183 leadingAnchor];
          v228 = [(UIView *)v272 trailingAnchor];
          v229 = [v227 constraintEqualToAnchor:v228];
          [v219 addObject:v229];

          v47 = v275;
        }
        if (!v279) {
          goto LABEL_84;
        }
        v230 = [v279 leadingAnchor];
        v231 = [(UIView *)v262 leadingAnchor];
        uint64_t v232 = [v230 constraintEqualToAnchor:v231 constant:0.0];
      }
      else
      {
        if (v259) {
          objc_msgSend(v219, "addObject:");
        }
        if (v183 && v269)
        {
          v233 = [(UIView *)v183 leadingAnchor];
          v234 = [(UIView *)v262 leadingAnchor];
          v235 = [v233 constraintEqualToAnchor:v234];
          [v219 addObject:v235];

          v47 = v275;
        }
        if (!v267) {
          goto LABEL_84;
        }
        v230 = [v267 trailingAnchor];
        v231 = [(UIView *)v272 leadingAnchor];
        uint64_t v232 = [v230 constraintEqualToAnchor:v231];
      }
      v236 = (void *)v232;
      [v219 addObject:v232];

LABEL_84:
      [*(id *)(v180 + 616) activateConstraints:v219];
      [v254 setAlpha:0.0];
      [v279 setAlpha:0.0];
      if (v273) {
        [v247 setAlpha:0.0];
      }
      v237 = [(_UINavigationBarVisualProviderModernCarPlay *)self contentView];
      [v237 setHidden:1];

      v285[0] = MEMORY[0x1E4F143A8];
      v285[1] = 3221225472;
      v285[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_5;
      v285[3] = &unk_1E52EEAF0;
      v285[4] = self;
      id v286 = v267;
      v287 = v183;
      id v288 = v279;
      id v289 = v254;
      id v290 = v247;
      v282[0] = MEMORY[0x1E4F143A8];
      v282[1] = 3221225472;
      v282[2] = __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_6;
      v282[3] = &unk_1E52DAF68;
      v282[4] = self;
      v283 = v272;
      id v284 = v290;
      id v238 = v290;
      v239 = v183;
      v240 = v272;
      id v241 = v254;
      id v242 = v279;
      v243 = v239;
      id v244 = v267;
      +[UIView animateWithDuration:0x20000 delay:v285 options:v282 animations:0.35 completion:0.0];

      id v10 = v251;
      id v9 = v252;
      v95 = v249;
      v11 = v250;
      v64 = v281;
      v94 = v269;
      v77 = v270;
      goto LABEL_87;
    }
LABEL_57:
    uint64_t v258 = 0;
    goto LABEL_58;
  }
LABEL_88:
}

- (void)_updateContentAnimated:(BOOL)a3 completion:(id)a4 direction:(unint64_t)a5
{
  BOOL v6 = a3;
  v11 = (void (**)(id, BOOL, void *))a4;
  if (![(_UINavigationBarVisualProviderModernCarPlay *)self havePrepared]) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self prepare];
  }
  double v8 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v9 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v8 backItem:v9 animated:v6 direction:a5];
  if (v11)
  {
    id v10 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    v11[2](v11, v6, v10);
  }
}

- (BOOL)navigationItemIsTopItem:(id)a3
{
  stack = self->super._stack;
  id v4 = a3;
  id v5 = [(_UINavigationBarItemStack *)stack topItem];

  return v5 == v4;
}

- (BOOL)navigationItemIsBackItem:(id)a3
{
  stack = self->super._stack;
  id v4 = a3;
  id v5 = [(_UINavigationBarItemStack *)stack backItem];

  return v5 == v4;
}

- (void)navigationItemUpdatedTitleContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if ([(_UINavigationBarItemStack *)self->super._stack state]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == v9;
  }
  if (v8) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v9 backItem:v7 animated:v4 direction:0];
  }
}

- (void)navigationItemUpdatedContentLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if ([(_UINavigationBarItemStack *)self->super._stack state]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == v9;
  }
  if (v8) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v9 backItem:v7 animated:v4 direction:0];
  }
}

- (void)navigationItemUpdatedBackButtonContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if ([(_UINavigationBarItemStack *)self->super._stack state]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7 == v9;
  }
  if (v8) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v6 backItem:v9 animated:v4 direction:0];
  }
}

- (void)navigationItemUpdatedLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if ([(_UINavigationBarItemStack *)self->super._stack state]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == v9;
  }
  if (v8) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v9 backItem:v7 animated:v4 direction:0];
  }
}

- (void)navigationItemUpdatedRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  id v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if ([(_UINavigationBarItemStack *)self->super._stack state]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == v9;
  }
  if (v8) {
    [(_UINavigationBarVisualProviderModernCarPlay *)self _updateContentForTopItem:v9 backItem:v7 animated:v4 direction:0];
  }
}

- (BOOL)shouldSearchControllerDeferPresentationTransitionForNavigationItem:(id)a3
{
  return 0;
}

- (BOOL)isRTL
{
  return [(UIView *)self->super._navigationBar effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft;
}

- (_UIBarButtonItemAppearanceStorage)appearanceStorage
{
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    BOOL v4 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    id v5 = self->_appearanceStorage;
    self->_appearanceStorage = v4;

    appearanceStorage = self->_appearanceStorage;
  }
  return appearanceStorage;
}

- (int64_t)barType
{
  return 1;
}

- (int64_t)barMetrics
{
  return 0;
}

- (UIColor)tintColor
{
  return (UIColor *)+[UIColor _carSystemFocusColor];
}

- (BOOL)centerTextButtons
{
  return 0;
}

- (double)defaultEdgeSpacing
{
  return 0.0;
}

- (double)defaultTextPadding
{
  return 0.0;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  return 15;
}

- (id)defaultFontDescriptor
{
  double v2 = [(_UINavigationBarVisualProviderModernCarPlay *)self titleView];
  double v3 = [v2 traitCollection];
  BOOL v4 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleCallout" compatibleWithTraitCollection:v3];

  return v4;
}

- (id)backIndicatorImage
{
  return 0;
}

- (id)backIndicatorMaskImage
{
  return 0;
}

- (double)backButtonMargin
{
  return 0.0;
}

- (double)backButtonMaximumWidth
{
  return 110.0;
}

- (double)absorptionForItem:(id)a3
{
  return 0.0;
}

- (void)_configureBackground
{
  v18[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UINavigationBarVisualProvider *)self navigationBar];
  uint64_t v4 = [v3 barStyle];

  if (v4 == 4)
  {
    id v5 = [(_UINavigationBarVisualProviderModernCarPlay *)self backgroundView];
    id v6 = +[UIColor clearColor];
    [v5 setBackgroundColor:v6];

    id v17 = [(_UINavigationBarVisualProviderModernCarPlay *)self backgroundView];
    [v17 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v7 = [(_UINavigationBarVisualProvider *)self navigationBar];
    BOOL v8 = [v7 traitCollection];
    double v9 = dbl_186B96850[[v8 accessibilityContrast] == 1];

    id v10 = +[UIColor tableBackgroundColor];
    v11 = [v10 colorWithAlphaComponent:v9];
    v12 = [(_UINavigationBarVisualProviderModernCarPlay *)self backgroundView];
    [v12 setBackgroundColor:v11];

    double v13 = +[UIColorEffect colorEffectSaturate:1.5];
    objc_super v14 = +[UIBlurEffect effectWithBlurRadius:10.0];
    double v15 = [(_UINavigationBarVisualProviderModernCarPlay *)self backgroundView];
    v18[0] = v13;
    v18[1] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v15 setBackgroundEffects:v16];
  }
}

- (void)_installGradientLayerMaskForClippingView:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F39BD0];
  id v4 = a3;
  id v5 = [v3 layer];
  id v6 = [v4 layer];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  id v7 = +[UIColor clearColor];
  BOOL v8 = [v7 CGColor];

  id v9 = +[UIColor blackColor];
  id v10 = [v9 CGColor];

  v20[0] = v8;
  v20[1] = v10;
  v20[2] = v10;
  v20[3] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v5 setColors:v11];

  v12 = [v4 layer];
  [v12 setMask:v5];

  objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
  [v5 frame];
  v19[0] = &unk_1ED3F1CF8;
  double v14 = 6.0 / v13;
  double v15 = [NSNumber numberWithDouble:6.0 / v13];
  v19[1] = v15;
  v16 = [NSNumber numberWithDouble:1.0 - v14];
  v19[2] = v16;
  v19[3] = &unk_1ED3F1D08;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v5 setLocations:v17];

  v18 = [v4 layer];

  [v18 setMask:v5];
}

- (BOOL)compactMetrics
{
  return self->_compactMetrics;
}

- (BOOL)havePrepared
{
  return self->_havePrepared;
}

- (void)setHavePrepared:(BOOL)a3
{
  self->_havePrepared = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (_CarTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (_UIButtonBar)leadingBar
{
  return self->_leadingBar;
}

- (void)setLeadingBar:(id)a3
{
}

- (_UIButtonBar)trailingBar
{
  return self->_trailingBar;
}

- (void)setTrailingBar:(id)a3
{
}

- (_UIButtonBarButton)backBarButton
{
  return self->_backBarButton;
}

- (void)setBackBarButton:(id)a3
{
}

- (NSLayoutConstraint)leadingBarConstraint
{
  return self->_leadingBarConstraint;
}

- (void)setLeadingBarConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingBarNoItemsConstraint
{
  return self->_leadingBarNoItemsConstraint;
}

- (void)setLeadingBarNoItemsConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingBarConstraint
{
  return self->_trailingBarConstraint;
}

- (void)setTrailingBarConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingBarNoItemsConstraint
{
  return self->_trailingBarNoItemsConstraint;
}

- (void)setTrailingBarNoItemsConstraint:(id)a3
{
}

- (NSArray)backButtonConstraints
{
  return self->_backButtonConstraints;
}

- (void)setBackButtonConstraints:(id)a3
{
}

- (NSLayoutConstraint)largeTitleLeadingConstraint
{
  return self->_largeTitleLeadingConstraint;
}

- (void)setLargeTitleLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)largeTitleTrailingConstraint
{
  return self->_largeTitleTrailingConstraint;
}

- (void)setLargeTitleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)regularTitleConstraint
{
  return self->_regularTitleConstraint;
}

- (void)setRegularTitleConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingBarWithTitleTrailingConstraint
{
  return self->_leadingBarWithTitleTrailingConstraint;
}

- (void)setLeadingBarWithTitleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingBarWithNoTitleTrailingConstraint
{
  return self->_leadingBarWithNoTitleTrailingConstraint;
}

- (void)setLeadingBarWithNoTitleTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingBarWithTitleLeadingConstraint
{
  return self->_trailingBarWithTitleLeadingConstraint;
}

- (void)setTrailingBarWithTitleLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingBarWithNoTitleLeadingConstraint
{
  return self->_trailingBarWithNoTitleLeadingConstraint;
}

- (void)setTrailingBarWithNoTitleLeadingConstraint:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIFocusContainerGuide)focusContainerGuide
{
  return self->_focusContainerGuide;
}

- (void)setFocusContainerGuide:(id)a3
{
}

- (NSArray)debugViews
{
  return self->_debugViews;
}

- (void)setDebugViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViews, 0);
  objc_storeStrong((id *)&self->_focusContainerGuide, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_trailingBarWithNoTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingBarWithTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarWithNoTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarWithTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_regularTitleConstraint, 0);
  objc_storeStrong((id *)&self->_largeTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_largeTitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backButtonConstraints, 0);
  objc_storeStrong((id *)&self->_trailingBarNoItemsConstraint, 0);
  objc_storeStrong((id *)&self->_trailingBarConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarNoItemsConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarConstraint, 0);
  objc_storeStrong((id *)&self->_backBarButton, 0);
  objc_storeStrong((id *)&self->_trailingBar, 0);
  objc_storeStrong((id *)&self->_leadingBar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end