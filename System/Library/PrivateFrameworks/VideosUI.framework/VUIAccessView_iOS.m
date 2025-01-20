@interface VUIAccessView_iOS
+ (BOOL)tooManyIconsWithAppCount:(unint64_t)a3;
+ (CGSize)iconSize;
- (VUIAccessView_iOS)initWithApps:(id)a3;
- (id)_buildCarousel;
- (id)_buildLogoStack;
- (id)_imageViewForIndex:(unint64_t)a3;
- (id)allowButton;
- (id)bodyScroll;
- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4;
- (id)nackButton;
- (id)seeAllButton;
- (unint64_t)numberOfItemsInCarouselView:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBody:(id)a3;
- (void)setSecondaryBody:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupView;
- (void)showNackScreen;
@end

@implementation VUIAccessView_iOS

- (VUIAccessView_iOS)initWithApps:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAccessView_iOS;
  v6 = [(VUIAccessView_iOS *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_apps, a3);
    [(VUIAccessView_iOS *)v7 setupView];
  }

  return v7;
}

+ (BOOL)tooManyIconsWithAppCount:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom]) {
    unint64_t v5 = 7;
  }
  else {
    unint64_t v5 = 5;
  }

  return v5 < a3;
}

- (void)setupView
{
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  allowButton = self->_allowButton;
  self->_allowButton = v3;

  [(UIButton *)self->_allowButton addObserver:self forKeyPath:@"highlighted" options:3 context:@"__VUIAccessView_iOSObservationContext"];
  unint64_t v5 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  nackButton = self->_nackButton;
  self->_nackButton = v5;

  v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  seeAllButton = self->_seeAllButton;
  self->_seeAllButton = v7;

  [(UIButton *)self->_allowButton setVuiAccessibilityIdentifier:@"UIA.TV.Button.access.connect"];
  [(VUIAccessView_iOS *)self setVuiAccessibilityIdentifier:@"UIA.TV.View.access.connect"];
  objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIAccessView_iOS *)self setTintColor:v9];
}

- (void)dealloc
{
  [(UIButton *)self->_allowButton removeObserver:self forKeyPath:@"highlighted"];
  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_iOS;
  [(VUIAccessView_iOS *)&v3 dealloc];
}

+ (CGSize)iconSize
{
  double v2 = 60.0;
  double v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)allowButton
{
  return self->_allowButton;
}

- (id)seeAllButton
{
  return self->_seeAllButton;
}

- (id)nackButton
{
  return self->_nackButton;
}

- (id)bodyScroll
{
  return self->_bodyScroll;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  titleLabel = self->_titleLabel;
  id v6 = v4;
  if (!titleLabel)
  {
    [(VUIAccessView_iOS *)self layoutSubviews];
    id v4 = v6;
    titleLabel = self->_titleLabel;
  }
  [(UILabel *)titleLabel setText:v4];
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  bodyLabel = self->_bodyLabel;
  id v6 = v4;
  if (!bodyLabel)
  {
    [(VUIAccessView_iOS *)self layoutSubviews];
    id v4 = v6;
    bodyLabel = self->_bodyLabel;
  }
  [(UILabel *)bodyLabel setText:v4];
}

- (void)setSecondaryBody:(id)a3
{
  id v4 = a3;
  secondaryBodyLabel = self->_secondaryBodyLabel;
  id v6 = v4;
  if (!secondaryBodyLabel)
  {
    [(VUIAccessView_iOS *)self layoutSubviews];
    id v4 = v6;
    secondaryBodyLabel = self->_secondaryBodyLabel;
  }
  [(UILabel *)secondaryBodyLabel setText:v4];
  [(UILabel *)self->_secondaryBodyLabel setHidden:0];
}

- (void)showNackScreen
{
  if ([(NSArray *)self->_apps count] < 2)
  {
    id v9 = [(NSArray *)self->_apps firstObject];
    v7 = [v9 objectForKeyedSubscript:@"appName"];

    v10 = +[VUILocalizationManager sharedInstance];
    v8 = [v10 localizedStringForKey:@"ACCESS_NACK_TITLE_FORMAT"];

    titleLabel = self->_titleLabel;
    v12 = [NSString stringWithValidatedFormat:v8, @"%@", 0, v7 validFormatSpecifiers error];
    [(UILabel *)titleLabel setText:v12];

    v13 = +[VUILocalizationManager sharedInstance];
    v14 = [v13 localizedStringForKey:@"ACCESS_NACK_BODY_IOS_FORMAT"];

    bodyLabel = self->_bodyLabel;
    v16 = [NSString stringWithValidatedFormat:v14, @"%@", 0, v7 validFormatSpecifiers error];
    [(UILabel *)bodyLabel setText:v16];
  }
  else
  {
    double v3 = self->_titleLabel;
    id v4 = +[VUILocalizationManager sharedInstance];
    unint64_t v5 = [v4 localizedStringForKey:@"ACCESS_NACK_TITLE_PLURAL"];
    [(UILabel *)v3 setText:v5];

    id v6 = self->_bodyLabel;
    v7 = +[VUILocalizationManager sharedInstance];
    v8 = [v7 localizedStringForKey:@"ACCESS_NACK_BODY_IOS_PLURAL"];
    [(UILabel *)v6 setText:v8];
  }

  [(UILabel *)self->_secondaryBodyLabel setHidden:1];
  [(UIStackView *)self->_bottomStack setHidden:1];
  [(UIButton *)self->_seeAllButton setHidden:1];
  nackButton = self->_nackButton;
  [(UIButton *)nackButton setHidden:0];
}

- (void)layoutSubviews
{
  v186[4] = *MEMORY[0x1E4F143B8];
  v184.receiver = self;
  v184.super_class = (Class)VUIAccessView_iOS;
  [(VUIAccessView_iOS *)&v184 layoutSubviews];
  if (!self->_didLayout)
  {
    double v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIAccessView_iOS *)self setBackgroundColor:v3];

    id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    double v6 = 20.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v6 = 74.0;
    }
    -[VUIAccessView_iOS setLayoutMargins:](self, "setLayoutMargins:", 20.0, v6, 0.0, v6);
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    titlePlacementGuide = self->_titlePlacementGuide;
    self->_titlePlacementGuide = v7;

    [(VUIAccessView_iOS *)self addLayoutGuide:self->_titlePlacementGuide];
    id v9 = [(UILayoutGuide *)self->_titlePlacementGuide centerXAnchor];
    v10 = [(VUIAccessView_iOS *)self centerXAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    v12 = [(UILayoutGuide *)self->_titlePlacementGuide heightAnchor];
    v13 = [(VUIAccessView_iOS *)self heightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 multiplier:0.25];
    [v14 setActive:1];

    v15 = [(UILayoutGuide *)self->_titlePlacementGuide widthAnchor];
    v16 = [(VUIAccessView_iOS *)self widthAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(UILayoutGuide *)self->_titlePlacementGuide topAnchor];
    v19 = [(VUIAccessView_iOS *)self topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    id v21 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v26 = (UILabel *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], v23, v24, v25);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v26;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    uint64_t v28 = *MEMORY[0x1E4FB27C0];
    uint64_t v29 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2988] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
    [(UILabel *)self->_titleLabel setFont:v29];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    v30 = self->_titleLabel;
    v31 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)self->_titleLabel setVuiAccessibilityIdentifier:@"UIA.TV.Label.access.connect"];
    uint64_t v179 = *MEMORY[0x1E4FB28C8];
    uint64_t v180 = v28;
    v32 = objc_msgSend(MEMORY[0x1E4FB08E0], "_preferredFontForTextStyle:maximumContentSizeCategory:");
    v33 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v22, v23, v24, v25);
    bodyLabel = self->_bodyLabel;
    self->_bodyLabel = v33;

    [(UILabel *)self->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_bodyLabel setFont:v32];
    [(UILabel *)self->_bodyLabel setNumberOfLines:0];
    [(UILabel *)self->_bodyLabel setTextAlignment:1];
    [(UILabel *)self->_bodyLabel setVuiAccessibilityIdentifier:@"UIA.TV.Label.access.body"];
    v35 = self->_bodyLabel;
    v36 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(UILabel *)v35 setTextColor:v36];

    id v37 = v32;
    v38 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v22, v23, v24, v25);
    secondaryBodyLabel = self->_secondaryBodyLabel;
    self->_secondaryBodyLabel = v38;

    [(UILabel *)self->_secondaryBodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_secondaryBodyLabel setFont:v37];
    [(UILabel *)self->_secondaryBodyLabel setNumberOfLines:0];
    [(UILabel *)self->_secondaryBodyLabel setTextAlignment:1];
    v40 = self->_secondaryBodyLabel;
    v41 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(UILabel *)v40 setTextColor:v41];

    id v42 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v43 = self->_bodyLabel;
    v186[0] = self->_titleLabel;
    v186[1] = v43;
    seeAllButton = self->_seeAllButton;
    v186[2] = self->_secondaryBodyLabel;
    v186[3] = seeAllButton;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:4];
    v46 = (UIStackView *)[v42 initWithArrangedSubviews:v45];
    scrollStack = self->_scrollStack;
    self->_scrollStack = v46;

    [(UIStackView *)self->_scrollStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_scrollStack setAxis:1];
    [(UIStackView *)self->_scrollStack setAlignment:3];
    v48 = -[VUILabel initWithFrame:]([VUILabel alloc], "initWithFrame:", v22, v23, v24, v25);
    v182 = (void *)v29;
    [(VUILabel *)v48 setFont:v29];
    v49 = -[VUILabel initWithFrame:]([VUILabel alloc], "initWithFrame:", v22, v23, v24, v25);
    v183 = v37;
    [(VUILabel *)v49 setFont:v37];
    [(VUILabel *)v49 topMarginWithBaselineMargin:5 maximumContentSizeCategory:32.0];
    double v51 = v50;
    [(VUILabel *)v48 bottomMarginWithBaselineMargin:5 maximumContentSizeCategory:0.0];
    [(UIStackView *)self->_scrollStack setCustomSpacing:self->_titleLabel afterView:v51 + v52];
    [(VUILabel *)v49 topMarginWithBaselineMargin:5 maximumContentSizeCategory:32.0];
    double v54 = v53;
    [(VUILabel *)v49 bottomMarginWithBaselineMargin:5 maximumContentSizeCategory:0.0];
    [(UIStackView *)self->_scrollStack setCustomSpacing:self->_bodyLabel afterView:v54 + v55];
    [(UIStackView *)self->_scrollStack setCustomSpacing:self->_secondaryBodyLabel afterView:19.0];
    v56 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    bodyScroll = self->_bodyScroll;
    self->_bodyScroll = v56;

    [(UIScrollView *)self->_bodyScroll setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)self->_bodyScroll addSubview:self->_scrollStack];
    [(VUIAccessView_iOS *)self addSubview:self->_bodyScroll];
    BOOL v58 = +[VUIAccessView_iOS tooManyIconsWithAppCount:[(NSArray *)self->_apps count]];
    if (v58)
    {
      v59 = [(VUIAccessView_iOS *)self _buildCarousel];
      carouselView = self->_carouselView;
      self->_carouselView = v59;

      [(VUIAccessView_iOS *)self addSubview:self->_carouselView];
      [(_TVCarouselView *)self->_carouselView setTranslatesAutoresizingMaskIntoConstraints:0];
      v61 = [(_TVCarouselView *)self->_carouselView centerXAnchor];
      v62 = [(VUIAccessView_iOS *)self centerXAnchor];
      v63 = [v61 constraintEqualToAnchor:v62];
      [v63 setActive:1];

      v64 = [(_TVCarouselView *)self->_carouselView widthAnchor];
      v65 = [(VUIAccessView_iOS *)self widthAnchor];
      v66 = [v64 constraintEqualToAnchor:v65];
      [v66 setActive:1];

      v67 = [(_TVCarouselView *)self->_carouselView heightAnchor];
      +[VUIAccessView_iOS iconSize];
      v69 = [v67 constraintEqualToConstant:v68];
      [v69 setActive:1];

      v70 = [(_TVCarouselView *)self->_carouselView topAnchor];
      v71 = [(VUIAccessView_iOS *)self topAnchor];
      v72 = [v70 constraintGreaterThanOrEqualToAnchor:v71 constant:8.0];
      [v72 setActive:1];

      v73 = [(_TVCarouselView *)self->_carouselView bottomAnchor];
      v74 = [(UIScrollView *)self->_bodyScroll firstBaselineAnchor];
      v75 = [v73 constraintEqualToAnchor:v74 constant:-16.0];
      [v75 setActive:1];

      v76 = self->_seeAllButton;
      v77 = +[VUILocalizationManager sharedInstance];
      v78 = [v77 localizedStringForKey:@"ACCESS_SEE_ALL_BUTTON"];
      [(UIButton *)v76 setTitle:v78 forState:0];

      v79 = [(UIButton *)self->_seeAllButton titleLabel];
      [v79 setLineBreakMode:0];

      [(UIButton *)self->_seeAllButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v80 = v183;
      [(UIButton *)self->_seeAllButton _setFont:v183];
    }
    else
    {
      v81 = [(VUIAccessView_iOS *)self _buildLogoStack];
      logoStack = self->_logoStack;
      self->_logoStack = v81;

      [(VUIAccessView_iOS *)self addSubview:self->_logoStack];
      v83 = [(UIStackView *)self->_logoStack centerXAnchor];
      v84 = [(VUIAccessView_iOS *)self centerXAnchor];
      v85 = [v83 constraintEqualToAnchor:v84];
      [v85 setActive:1];

      v86 = [(UIStackView *)self->_logoStack topAnchor];
      v87 = [(VUIAccessView_iOS *)self topAnchor];
      v88 = [v86 constraintGreaterThanOrEqualToAnchor:v87 constant:8.0];
      [v88 setActive:1];

      v89 = [(UIStackView *)self->_logoStack bottomAnchor];
      v90 = [(UIScrollView *)self->_bodyScroll firstBaselineAnchor];
      v91 = [v89 constraintEqualToAnchor:v90 constant:-16.0];
      [v91 setActive:1];

      v80 = v183;
    }
    [(UIButton *)self->_seeAllButton setHidden:!v58];
    v181 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v179 variant:1024 maximumContentSizeCategory:v180];
    allowButton = self->_allowButton;
    v93 = +[VUILocalizationManager sharedInstance];
    v94 = [v93 localizedStringForKey:@"ACCESS_ALLOW"];
    [(UIButton *)allowButton setTitle:v94 forState:0];

    v95 = self->_allowButton;
    v96 = [(VUIAccessView_iOS *)self tintColor];
    [(UIButton *)v95 setBackgroundColor:v96];

    v97 = self->_allowButton;
    v98 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v97 setTitleColor:v98 forState:0];

    [(UIButton *)self->_allowButton _setFont:v181];
    [(UIButton *)self->_allowButton _setContinuousCornerRadius:8.0];
    [(UIButton *)self->_nackButton setTranslatesAutoresizingMaskIntoConstraints:0];
    nackButton = self->_nackButton;
    v100 = +[VUILocalizationManager sharedInstance];
    v101 = [v100 localizedStringForKey:@"ACCESS_NACK_BUTTON"];
    [(UIButton *)nackButton setTitle:v101 forState:0];

    v102 = self->_nackButton;
    v103 = [(VUIAccessView_iOS *)self tintColor];
    [(UIButton *)v102 setBackgroundColor:v103];

    v104 = self->_nackButton;
    v105 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v104 setTitleColor:v105 forState:0];

    [(UIButton *)self->_nackButton _setFont:v80];
    [(UIButton *)self->_nackButton _setContinuousCornerRadius:8.0];
    [(VUIAccessView_iOS *)self addSubview:self->_nackButton];
    [(UIButton *)self->_nackButton setHidden:1];
    id v106 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v185 = self->_allowButton;
    v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
    v108 = (UIStackView *)[v106 initWithArrangedSubviews:v107];
    bottomStack = self->_bottomStack;
    self->_bottomStack = v108;

    [(UIStackView *)self->_bottomStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_bottomStack setAxis:1];
    [(UIStackView *)self->_bottomStack setAlignment:3];
    [(UIStackView *)self->_bottomStack setDistribution:3];
    [(UIStackView *)self->_bottomStack setSpacing:0.0];
    [(VUIAccessView_iOS *)self addSubview:self->_bottomStack];
    v110 = [(UIScrollView *)self->_bodyScroll leadingAnchor];
    v111 = [(VUIAccessView_iOS *)self readableContentGuide];
    v112 = [v111 leadingAnchor];
    v113 = [v110 constraintEqualToAnchor:v112];
    [v113 setActive:1];

    v114 = [(UIScrollView *)self->_bodyScroll trailingAnchor];
    v115 = [(VUIAccessView_iOS *)self readableContentGuide];
    v116 = [v115 trailingAnchor];
    v117 = [v114 constraintEqualToAnchor:v116];
    [v117 setActive:1];

    v118 = [(UIScrollView *)self->_bodyScroll topAnchor];
    v119 = [(UILayoutGuide *)self->_titlePlacementGuide bottomAnchor];
    v120 = [v118 constraintEqualToAnchor:v119];
    [v120 setActive:1];

    v121 = [(UIScrollView *)self->_bodyScroll bottomAnchor];
    v122 = [(UIStackView *)self->_bottomStack topAnchor];
    v123 = [v121 constraintEqualToAnchor:v122 constant:-22.0];
    [v123 setActive:1];

    v124 = [(UIStackView *)self->_scrollStack leadingAnchor];
    v125 = [(UIScrollView *)self->_bodyScroll leadingAnchor];
    v126 = [v124 constraintEqualToAnchor:v125];
    [v126 setActive:1];

    v127 = [(UIStackView *)self->_scrollStack trailingAnchor];
    v128 = [(UIScrollView *)self->_bodyScroll trailingAnchor];
    v129 = [v127 constraintEqualToAnchor:v128];
    [v129 setActive:1];

    v130 = [(UIStackView *)self->_scrollStack topAnchor];
    v131 = [(UIScrollView *)self->_bodyScroll topAnchor];
    v132 = [v130 constraintEqualToAnchor:v131];
    [v132 setActive:1];

    v133 = [(UIStackView *)self->_scrollStack bottomAnchor];
    v134 = [(UIScrollView *)self->_bodyScroll bottomAnchor];
    v135 = [v133 constraintEqualToAnchor:v134];
    [v135 setActive:1];

    v136 = [(UIStackView *)self->_scrollStack widthAnchor];
    v137 = [(VUIAccessView_iOS *)self readableContentGuide];
    v138 = [v137 widthAnchor];
    v139 = [v136 constraintEqualToAnchor:v138];
    [v139 setActive:1];

    v140 = [(UIStackView *)self->_bottomStack widthAnchor];
    v141 = [(VUIAccessView_iOS *)self readableContentGuide];
    v142 = [v141 widthAnchor];
    v143 = [v140 constraintEqualToAnchor:v142];
    [v143 setActive:1];

    v144 = [(UIButton *)self->_seeAllButton widthAnchor];
    v145 = [v144 constraintEqualToConstant:288.0];
    [v145 setActive:1];

    v146 = [(UIButton *)self->_allowButton centerXAnchor];
    v147 = [(VUIAccessView_iOS *)self centerXAnchor];
    v148 = [v146 constraintEqualToAnchor:v147];
    [v148 setActive:1];

    v149 = [(UIButton *)self->_allowButton widthAnchor];
    v150 = [v149 constraintEqualToConstant:288.0];
    [v150 setActive:1];

    v151 = [(UIButton *)self->_allowButton heightAnchor];
    v152 = [v151 constraintEqualToConstant:50.0];
    [v152 setActive:1];

    v153 = [(UIStackView *)self->_bottomStack centerXAnchor];
    v154 = [(VUIAccessView_iOS *)self centerXAnchor];
    v155 = [v153 constraintEqualToAnchor:v154];
    [v155 setActive:1];

    v156 = [(UIStackView *)self->_bottomStack bottomAnchor];
    v157 = [(VUIAccessView_iOS *)self readableContentGuide];
    v158 = [v157 bottomAnchor];
    v159 = [v156 constraintEqualToAnchor:v158 constant:-22.0];
    [v159 setActive:1];

    v160 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v161 = [v160 userInterfaceIdiom];

    if ((v161 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v162 = 60.0;
    }
    else {
      double v162 = 44.0;
    }
    v163 = [(UIButton *)self->_nackButton bottomAnchor];
    v164 = [(VUIAccessView_iOS *)self readableContentGuide];
    v165 = [v164 bottomAnchor];
    v166 = [v163 constraintEqualToAnchor:v165 constant:-v162];
    [v166 setActive:1];

    v167 = [(UIButton *)self->_nackButton topAnchor];
    v168 = [(UIScrollView *)self->_bodyScroll bottomAnchor];
    v169 = [v167 constraintGreaterThanOrEqualToAnchor:v168 constant:22.0];
    [v169 setActive:1];

    v170 = [(UIButton *)self->_nackButton centerXAnchor];
    v171 = [(VUIAccessView_iOS *)self centerXAnchor];
    v172 = [v170 constraintEqualToAnchor:v171];
    [v172 setActive:1];

    v173 = [(UIButton *)self->_nackButton widthAnchor];
    v174 = [(UIButton *)self->_allowButton widthAnchor];
    v175 = [v173 constraintEqualToAnchor:v174];
    [v175 setActive:1];

    v176 = [(UIButton *)self->_nackButton heightAnchor];
    v177 = [(UIButton *)self->_allowButton heightAnchor];
    v178 = [v176 constraintEqualToAnchor:v177];
    [v178 setActive:1];

    self->_didLayout = 1;
  }
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  return [(NSArray *)self->_apps count];
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  double v6 = objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndex:", @"cell");
  v7 = [v6 contentView];
  v8 = [v7 subviews];
  id v9 = [v8 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    apps = self->_apps;
    id v11 = v9;
    v12 = [(NSArray *)apps objectAtIndexedSubscript:a4];
    v13 = [v12 objectForKeyedSubscript:@"appIcon"];
    [v11 setImage:v13];
  }
  else
  {
    v12 = [(VUIAccessView_iOS *)self _imageViewForIndex:a4];
    [v12 setAutoresizingMask:18];
    [v9 removeFromSuperview];
    [v7 addSubview:v12];
  }

  return v6;
}

- (id)_buildCarousel
{
  id v3 = objc_alloc(MEMORY[0x1E4FAA438]);
  id v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setDataSource:self];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cell"];
  +[VUIAccessView_iOS iconSize];
  objc_msgSend(v4, "setItemSize:");
  [v4 setScrollMode:1];
  [v4 setUnitScrollDuration:4.0];
  [v4 setUserInteractionEnabled:0];
  [v4 setInteritemSpacing:15.0];
  return v4;
}

- (id)_buildLogoStack
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSArray *)self->_apps count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(VUIAccessView_iOS *)self _imageViewForIndex:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_apps count]);
  }
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v3];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAxis:0];
  [v6 setAlignment:3];
  [v6 setDistribution:3];
  [v6 setSpacing:15.0];
  [v6 setVuiAccessibilityIdentifier:@"UIA.TV.Image.access.connect"];

  return v6;
}

- (id)_imageViewForIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_apps objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"appIcon"];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  +[VUIAccessView_iOS iconSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [v5 heightAnchor];
  id v11 = [v10 constraintEqualToConstant:v9];
  [v11 setActive:1];

  v12 = [v5 widthAnchor];
  v13 = [v12 constraintEqualToConstant:v7];
  [v13 setActive:1];

  [v5 setImage:v4];
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = (UIButton *)a4;
  id v12 = a5;
  if (a6 == @"__VUIAccessView_iOSObservationContext" && self->_allowButton == v11)
  {
    v13 = [(VUIAccessView_iOS *)self tintColor];
    int v14 = [(UIButton *)self->_allowButton isHighlighted];
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    if (v14)
    {
      v16 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v17 = __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke;
    }
    else
    {
      v16 = v20;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v17 = __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    }
    v16[2] = v17;
    v16[3] = &unk_1E6DF3F68;
    v16[4] = self;
    v16[5] = v13;
    id v18 = v13;
    [v15 animateWithDuration:v16 animations:0.25];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VUIAccessView_iOS;
    [(VUIAccessView_iOS *)&v19 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_nackButton, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
  objc_storeStrong((id *)&self->_bottomStack, 0);
  objc_storeStrong((id *)&self->_logoStack, 0);
  objc_storeStrong((id *)&self->_secondaryBodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyScroll, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollStack, 0);
  objc_storeStrong((id *)&self->_titlePlacementGuide, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end