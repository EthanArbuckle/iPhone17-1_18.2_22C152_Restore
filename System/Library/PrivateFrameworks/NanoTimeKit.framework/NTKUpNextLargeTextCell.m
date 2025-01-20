@interface NTKUpNextLargeTextCell
- (NTKUpNextLargeTextCell)initWithFrame:(CGRect)a3;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (void)configureWithContent:(id)a3;
- (void)prepareForReuse;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateConstraints;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextLargeTextCell

- (NTKUpNextLargeTextCell)initWithFrame:(CGRect)a3
{
  v154[9] = *MEMORY[0x1E4F143B8];
  v148.receiver = self;
  v148.super_class = (Class)NTKUpNextLargeTextCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v148, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = [(NTKUpNextBaseCell *)v3 device];
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_28);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_28);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_28);
      if (v8 == v5)
      {
        uint64_t v9 = [v5 version];
        uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_28;

        if (v9 == v10)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_28);
          double v13 = *(double *)&_LayoutConstants_constants_0_5;
          double v146 = *(double *)&_LayoutConstants_constants_2_5;
          double v14 = *(double *)&_LayoutConstants_constants_3_4;
          double v15 = *(double *)&_LayoutConstants_constants_4_3;
          double v142 = *(double *)&_LayoutConstants_constants_1_5;
          double v143 = *(double *)&_LayoutConstants_constants_5_1;
          double v16 = *(double *)&_LayoutConstants_constants_8_0;
          double v17 = *(double *)&_LayoutConstants_constants_10_0;

          v18 = [MEMORY[0x1E4F19A50] systemFontOfSize:v14];
          v19 = [v18 fontDescriptor];
          v147 = [v19 fontDescriptorWithSymbolicTraits:2];

          v20 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09D8]];
          uint64_t v21 = [v20 CLKFontWithAlternativePunctuation];
          standardBodyFont = v4->_standardBodyFont;
          v4->_standardBodyFont = (CLKFont *)v21;

          uint64_t v23 = [(CLKFont *)v4->_standardBodyFont CLKFontWithMonospacedNumbers];
          monospaceBodyFont = v4->_monospaceBodyFont;
          v4->_monospaceBodyFont = (CLKFont *)v23;

          v25 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v147 size:v14];
          v26 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          contentLayoutGuide = v4->_contentLayoutGuide;
          v4->_contentLayoutGuide = v26;

          id v28 = objc_alloc((Class)off_1E62BDB58);
          double v29 = *MEMORY[0x1E4F1DB28];
          double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
          uint64_t v33 = objc_msgSend(v28, "initWithFrame:options:", 4, *MEMORY[0x1E4F1DB28], v30, v31, v32);
          headerLabel = v4->_headerLabel;
          v4->_headerLabel = (CLKUIColoringLabel *)v33;

          [(CLKUIColoringLabel *)v4->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v4->_headerLabel setLineBreakMode:4];
          [(CLKUIColoringLabel *)v4->_headerLabel setNowProvider:&__block_literal_global_79];
          v145 = v25;
          [(CLKUIColoringLabel *)v4->_headerLabel setFont:v25];
          v35 = v4->_headerLabel;
          v36 = [MEMORY[0x1E4FB1618] whiteColor];
          [(CLKUIColoringLabel *)v35 setTextColor:v36];

          uint64_t v37 = objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 6, v29, v30, v31, v32);
          bodyLabel = v4->_bodyLabel;
          v4->_bodyLabel = (CLKUIColoringLabel *)v37;

          [(CLKUIColoringLabel *)v4->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
          [(CLKUIColoringLabel *)v4->_bodyLabel setLineBreakMode:4];
          [(CLKUIColoringLabel *)v4->_bodyLabel setNowProvider:&__block_literal_global_79];
          [(CLKUIColoringLabel *)v4->_bodyLabel setFont:v4->_standardBodyFont];
          v39 = v4->_bodyLabel;
          v40 = [MEMORY[0x1E4FB1618] whiteColor];
          [(CLKUIColoringLabel *)v39 setTextColor:v40];

          [(CLKUIColoringLabel *)v4->_bodyLabel setMinimumScaleFactor:0.75];
          [(CLKUIColoringLabel *)v4->_bodyLabel setAdjustsFontSizeToFitWidth:1];
          [(CLKUIColoringLabel *)v4->_bodyLabel setBaselineAdjustment:0];
          [(CLKUIColoringLabel *)v4->_bodyLabel setNumberOfLines:1];
          v41 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v29, v30, v31, v32);
          headerImage = v4->_headerImage;
          v4->_headerImage = v41;

          LODWORD(v43) = 1148846080;
          [(NTKUpNextImageView *)v4->_headerImage setContentHuggingPriority:0 forAxis:v43];
          LODWORD(v44) = 1148846080;
          [(NTKUpNextImageView *)v4->_headerImage setContentHuggingPriority:1 forAxis:v44];
          LODWORD(v45) = 1148846080;
          [(NTKUpNextImageView *)v4->_headerImage setContentCompressionResistancePriority:0 forAxis:v45];
          LODWORD(v46) = 1148846080;
          [(NTKUpNextImageView *)v4->_headerImage setContentCompressionResistancePriority:1 forAxis:v46];
          [(NTKUpNextImageView *)v4->_headerImage setFilterProvider:v4];
          [(NTKUpNextImageView *)v4->_headerImage setTranslatesAutoresizingMaskIntoConstraints:0];
          v47 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v29, v30, v31, v32);
          bodyImage = v4->_bodyImage;
          v4->_bodyImage = v47;

          LODWORD(v49) = 1148846080;
          [(NTKUpNextImageView *)v4->_bodyImage setContentHuggingPriority:0 forAxis:v49];
          LODWORD(v50) = 1148846080;
          [(NTKUpNextImageView *)v4->_bodyImage setContentHuggingPriority:1 forAxis:v50];
          LODWORD(v51) = 1148846080;
          [(NTKUpNextImageView *)v4->_bodyImage setContentCompressionResistancePriority:0 forAxis:v51];
          LODWORD(v52) = 1148846080;
          [(NTKUpNextImageView *)v4->_bodyImage setContentCompressionResistancePriority:1 forAxis:v52];
          [(NTKUpNextImageView *)v4->_bodyImage setTranslatesAutoresizingMaskIntoConstraints:0];
          [(NTKUpNextImageView *)v4->_bodyImage setFilterProvider:v4];
          v53 = [(NTKUpNextLargeTextCell *)v4 contentView];
          [v53 addLayoutGuide:v4->_contentLayoutGuide];

          v54 = [(NTKUpNextLargeTextCell *)v4 contentView];
          [v54 addSubview:v4->_headerImage];

          v55 = [(NTKUpNextLargeTextCell *)v4 contentView];
          [v55 addSubview:v4->_headerLabel];

          v56 = [(NTKUpNextLargeTextCell *)v4 contentView];
          [v56 addSubview:v4->_bodyLabel];

          v57 = [(NTKUpNextLargeTextCell *)v4 contentView];
          [v57 addSubview:v4->_bodyImage];

          [v25 capHeight];
          v58 = [(NTKUpNextBaseCell *)v4 device];
          CLKRoundForDevice();
          double v60 = v59;

          v140 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
          v141 = [(NTKUpNextLargeTextCell *)v4 contentView];
          v139 = [v141 topAnchor];
          v138 = [v140 constraintEqualToAnchor:v139 constant:0.0];
          v154[0] = v138;
          v136 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
          v137 = [(NTKUpNextLargeTextCell *)v4 contentView];
          v135 = [v137 bottomAnchor];
          v134 = [v136 constraintEqualToAnchor:v135 constant:-0.0];
          v154[1] = v134;
          v132 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v133 = [(NTKUpNextLargeTextCell *)v4 contentView];
          v131 = [v133 leadingAnchor];
          v130 = [v132 constraintEqualToAnchor:v131 constant:v16];
          v154[2] = v130;
          v128 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v129 = [(NTKUpNextLargeTextCell *)v4 contentView];
          v127 = [v129 trailingAnchor];
          v126 = [v128 constraintEqualToAnchor:v127 constant:-v17];
          v154[3] = v126;
          v125 = [(NTKUpNextImageView *)v4->_headerImage centerYAnchor];
          v124 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
          v123 = [v125 constraintEqualToAnchor:v124 constant:-v60];
          v154[4] = v123;
          v122 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
          v121 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
          v120 = [v122 constraintEqualToAnchor:v121 constant:v13];
          v154[5] = v120;
          v61 = [(NTKUpNextImageView *)v4->_bodyImage bottomAnchor];
          v62 = [(CLKUIColoringLabel *)v4->_bodyLabel firstBaselineAnchor];
          v63 = [v61 constraintEqualToAnchor:v62];
          v154[6] = v63;
          v64 = [(CLKUIColoringLabel *)v4->_bodyLabel firstBaselineAnchor];
          v65 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
          v66 = [v64 constraintEqualToAnchor:v65 constant:v142];
          v154[7] = v66;
          v67 = [(CLKUIColoringLabel *)v4->_bodyLabel lastBaselineAnchor];
          v68 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
          v69 = [v67 constraintEqualToAnchor:v68 constant:-v143];
          v154[8] = v69;
          v144 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:9];

          v70 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
          v71 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v72 = [v70 constraintEqualToAnchor:v71];
          v153[0] = v72;
          v73 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
          v74 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v75 = [v73 constraintEqualToAnchor:v74];
          v153[1] = v75;
          uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:2];
          headerWithNoImageConstraints = v4->_headerWithNoImageConstraints;
          v4->_headerWithNoImageConstraints = (NSArray *)v76;

          v78 = [(NTKUpNextImageView *)v4->_headerImage leadingAnchor];
          v79 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v80 = [v78 constraintEqualToAnchor:v79];
          v152[0] = v80;
          v81 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
          v82 = [(NTKUpNextImageView *)v4->_headerImage trailingAnchor];
          v83 = [v81 constraintEqualToAnchor:v82 constant:v146];
          v152[1] = v83;
          v84 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
          v85 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v86 = [v84 constraintEqualToAnchor:v85];
          v152[2] = v86;
          uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:3];
          headerWithLeftImageConstraints = v4->_headerWithLeftImageConstraints;
          v4->_headerWithLeftImageConstraints = (NSArray *)v87;

          v89 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
          v90 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v91 = [v89 constraintEqualToAnchor:v90];
          v151[0] = v91;
          v92 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
          v93 = [(NTKUpNextImageView *)v4->_headerImage leadingAnchor];
          v94 = [v92 constraintEqualToAnchor:v93 constant:-v146];
          v151[1] = v94;
          v95 = [(NTKUpNextImageView *)v4->_headerImage trailingAnchor];
          v96 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v97 = [v95 constraintEqualToAnchor:v96];
          v151[2] = v97;
          uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:3];
          headerWithRightImageConstraints = v4->_headerWithRightImageConstraints;
          v4->_headerWithRightImageConstraints = (NSArray *)v98;

          v100 = [(CLKUIColoringLabel *)v4->_bodyLabel leadingAnchor];
          v101 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v102 = [v100 constraintEqualToAnchor:v101];
          v150[0] = v102;
          v103 = [(CLKUIColoringLabel *)v4->_bodyLabel trailingAnchor];
          v104 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v105 = [v103 constraintEqualToAnchor:v104];
          v150[1] = v105;
          uint64_t v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:2];
          bodyWithNoImageConstraints = v4->_bodyWithNoImageConstraints;
          v4->_bodyWithNoImageConstraints = (NSArray *)v106;

          v108 = [(NTKUpNextImageView *)v4->_bodyImage leadingAnchor];
          v109 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
          v110 = [v108 constraintEqualToAnchor:v109];
          v149[0] = v110;
          v111 = [(CLKUIColoringLabel *)v4->_bodyLabel leadingAnchor];
          v112 = [(NTKUpNextImageView *)v4->_bodyImage trailingAnchor];
          v113 = [v111 constraintEqualToAnchor:v112 constant:0.0];
          v149[1] = v113;
          v114 = [(CLKUIColoringLabel *)v4->_bodyLabel trailingAnchor];
          v115 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
          v116 = [v114 constraintEqualToAnchor:v115];
          v149[2] = v116;
          uint64_t v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:3];
          bodyWithLeftImageConstraints = v4->_bodyWithLeftImageConstraints;
          v4->_bodyWithLeftImageConstraints = (NSArray *)v117;

          [MEMORY[0x1E4F28DC8] activateConstraints:v4->_bodyWithNoImageConstraints];
          [MEMORY[0x1E4F28DC8] activateConstraints:v4->_headerWithNoImageConstraints];
          [MEMORY[0x1E4F28DC8] activateConstraints:v144];

          return v4;
        }
      }
      else
      {
      }
    }
    id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_28, v5);
    _LayoutConstants___previousCLKDeviceVersion_28 = [v5 version];

    ___LayoutConstants_block_invoke_25(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  return v4;
}

uint64_t __40__NTKUpNextLargeTextCell_initWithFrame___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)updateConstraints
{
  v3 = [(NTKUpNextBaseCell *)self content];
  v4 = [v3 headerImageProvider];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [v3 overrideHeaderImage];
    BOOL v5 = v6 != 0;
  }
  unsigned int v7 = [v3 headerImageEdge];
  id v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  if (self->_showingHeaderImage != v5 || v7 != self->_currentImageEdge)
  {
    self->_currentImageEdge = v7;
    self->_showingHeaderImage = v5;
    headerImage = self->_headerImage;
    if (v5)
    {
      [(NTKUpNextImageView *)headerImage setHidden:0];
      [v9 addObjectsFromArray:self->_headerWithNoImageConstraints];
      int v11 = [v3 headerImageEdge];
      if (v11 == 2) {
        uint64_t v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithLeftImageConstraints;
      }
      else {
        uint64_t v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
      }
      if (v11 == 2) {
        double v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
      }
      else {
        double v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithLeftImageConstraints;
      }
    }
    else
    {
      [(NTKUpNextImageView *)headerImage setHidden:1];
      [v9 addObjectsFromArray:self->_headerWithLeftImageConstraints];
      double v13 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithNoImageConstraints;
      uint64_t v12 = &OBJC_IVAR___NTKUpNextLargeTextCell__headerWithRightImageConstraints;
    }
    [v9 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v12)];
    [v8 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13)];
  }
  double v14 = [v3 bodyImageProvider];
  if (v14)
  {
    BOOL v15 = 1;
  }
  else
  {
    double v16 = [v3 overrideBodyImage];
    BOOL v15 = v16 != 0;
  }
  if (self->_showingBodyImage != v15)
  {
    self->_showingBodyImage = v15;
    BOOL v17 = !v15;
    if (v15) {
      v18 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithNoImageConstraints;
    }
    else {
      v18 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithLeftImageConstraints;
    }
    if (v15) {
      v19 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithLeftImageConstraints;
    }
    else {
      v19 = &OBJC_IVAR___NTKUpNextLargeTextCell__bodyWithNoImageConstraints;
    }
    [(NTKUpNextImageView *)self->_bodyImage setHidden:v17];
    [v9 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v18)];
    [v8 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19)];
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v9];
  [MEMORY[0x1E4F28DC8] activateConstraints:v8];
  v20.receiver = self;
  v20.super_class = (Class)NTKUpNextLargeTextCell;
  [(NTKUpNextLargeTextCell *)&v20 updateConstraints];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NTKUpNextLargeTextCell;
  [(NTKUpNextBaseCell *)&v30 configureWithContent:v4];
  int v5 = [v4 useMonospaceFont];
  v6 = &OBJC_IVAR___NTKUpNextLargeTextCell__standardBodyFont;
  if (v5) {
    v6 = &OBJC_IVAR___NTKUpNextLargeTextCell__monospaceBodyFont;
  }
  [(CLKUIColoringLabel *)self->_bodyLabel setFont:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6)];
  headerImage = self->_headerImage;
  id v8 = [v4 tintColor];
  [(NTKUpNextImageView *)headerImage setFallbackTintColor:v8];

  uint64_t v9 = self->_headerImage;
  uint64_t v10 = [v4 overrideHeaderImage];
  int v11 = [v4 headerImageProvider];
  [(NTKUpNextImageView *)v9 setFullColorImage:v10 tintableImageProvider:v11];

  bodyImage = self->_bodyImage;
  double v13 = [v4 tintColor];
  [(NTKUpNextImageView *)bodyImage setFallbackTintColor:v13];

  double v14 = self->_bodyImage;
  BOOL v15 = [v4 overrideBodyImage];
  double v16 = [v4 bodyImageProvider];
  [(NTKUpNextImageView *)v14 setFullColorImage:v15 tintableImageProvider:v16];

  BOOL v17 = self->_bodyImage;
  v18 = [v4 bodyImageCompositingFilter];
  [(NTKUpNextImageView *)v17 setCompositingFilter:v18];

  int v19 = [v4 tintColorAffectsHeader];
  headerLabel = self->_headerLabel;
  if (v19) {
    [v4 tintColor];
  }
  else {
  uint64_t v21 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(CLKUIColoringLabel *)headerLabel setTextColor:v21];

  +[NTKUpNextBaseCell clearLabel:self->_headerLabel];
  v22 = self->_headerLabel;
  uint64_t v23 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)v22 setTextProvider:v23];

  +[NTKUpNextBaseCell clearLabel:self->_bodyLabel];
  v24 = [v4 overrideBodyString];

  bodyLabel = self->_bodyLabel;
  if (v24)
  {
    [(CLKUIColoringLabel *)self->_bodyLabel setTextProvider:0];
    v26 = self->_bodyLabel;
    v27 = [v4 overrideBodyString];
    [(CLKUIColoringLabel *)v26 setText:v27];
  }
  else
  {
    v27 = [v4 description1TextProvider];
    [(CLKUIColoringLabel *)bodyLabel setTextProvider:v27];
  }

  id v28 = [v4 headerTextProvider];
  objc_msgSend(v28, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  double v29 = [v4 description1TextProvider];
  objc_msgSend(v29, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  [(NTKUpNextLargeTextCell *)self setNeedsUpdateConstraints];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextLargeTextCell;
  -[NTKUpNextBaseCell setPaused:](&v7, sel_setPaused_);
  int v5 = [(CLKUIColoringLabel *)self->_bodyLabel textProvider];
  [v5 setPaused:v3];

  v6 = [(CLKUIColoringLabel *)self->_headerLabel textProvider];
  [v6 setPaused:v3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2) {
    a4 = 0;
  }
  id v6 = a3;
  objc_super v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filtersForView:v6 style:a4];

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2) {
    a4 = 0;
  }
  id v8 = a3;
  uint64_t v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filtersForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2) {
    a4 = 0;
  }
  id v8 = a3;
  uint64_t v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filterForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  if (self->_bodyImage == a3 || self->_headerImage == a3 && self->_currentImageEdge == 2) {
    a4 = 0;
  }
  id v6 = a3;
  objc_super v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filterForView:v6 style:a4];

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  if (self->_bodyImage == a3 || (BOOL v5 = a4, self->_headerImage == a3) && self->_currentImageEdge == 2) {
    BOOL v5 = 0;
  }
  id v6 = a3;
  objc_super v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 colorForView:v6 accented:v5];

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NTKUpNextBaseCell *)self filterProvider];
  id v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextLargeTextCell;
  [(NTKUpNextBaseCell *)&v4 prepareForReuse];
  [(NTKUpNextImageView *)self->_headerImage transitionToMonochromeWithFraction:0.0];
  [(NTKUpNextImageView *)self->_bodyImage transitionToMonochromeWithFraction:0.0];
  BOOL v3 = [(CLKUIColoringLabel *)self->_headerLabel layer];
  [v3 setFilters:0];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:");
  [(NTKUpNextImageView *)self->_bodyImage transitionToMonochromeWithFraction:a3];
  if (fabs(a3) >= 0.00000011920929)
  {
    BOOL v5 = [(NTKUpNextBaseCell *)self filterProvider];
    id v8 = [v5 filtersForView:self style:2 fraction:a3];

    id v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    objc_super v7 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v7 setFilters:v8];
  }
  else
  {
    id v8 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v8 setFilters:0];
  }
  id v6 = v8;
LABEL_6:
}

- (void)updateMonochromeColor
{
  [(NTKUpNextImageView *)self->_headerImage updateMonochromeColor];
  [(NTKUpNextImageView *)self->_bodyImage updateMonochromeColor];
  BOOL v3 = [(NTKUpNextBaseCell *)self filterProvider];
  id v5 = [v3 filtersForView:self style:2];

  if (v5)
  {
    objc_super v4 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v4 setFilters:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_monospaceBodyFont, 0);

  objc_storeStrong((id *)&self->_standardBodyFont, 0);
}

@end