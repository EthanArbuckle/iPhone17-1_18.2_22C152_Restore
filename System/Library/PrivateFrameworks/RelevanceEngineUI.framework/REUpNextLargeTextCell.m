@interface REUpNextLargeTextCell
+ (void)initialize;
- (REUpNextLargeTextCell)initWithFrame:(CGRect)a3;
- (void)_updateHeaderColor;
- (void)configureWithContent:(id)a3;
- (void)defaultTextColorDidChange;
- (void)updateConstraints;
@end

@implementation REUpNextLargeTextCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_2 = 0x4033800000000000;
    kActiveLayout_1_2 = 0x4043800000000000;
    kActiveLayout_2_2 = 0x4012000000000000;
    kActiveLayout_3_1 = 0x4030800000000000;
    kActiveLayout_4_1 = 0x4043800000000000;
    kActiveLayout_5_1 = 0x4020000000000000;
    kActiveLayout_8_0 = 0x4018000000000000;
    kActiveLayout_10_0 = 0x4018000000000000;
  }
}

- (REUpNextLargeTextCell)initWithFrame:(CGRect)a3
{
  v136[9] = *MEMORY[0x263EF8340];
  v130.receiver = self;
  v130.super_class = (Class)REUpNextLargeTextCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v130, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_3_1];
    v5 = [v4 fontDescriptor];
    v129 = [v5 fontDescriptorWithSymbolicTraits:2];

    v6 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_4_1 weight:*MEMORY[0x263F1D338]];
    uint64_t v7 = [v6 CLKFontWithAlternativePunctuation];
    standardBodyFont = v3->_standardBodyFont;
    v3->_standardBodyFont = (CLKFont *)v7;

    uint64_t v9 = [(CLKFont *)v3->_standardBodyFont CLKFontWithMonospacedNumbers];
    monospaceBodyFont = v3->_monospaceBodyFont;
    v3->_monospaceBodyFont = (CLKFont *)v9;

    v11 = [MEMORY[0x263EFD198] fontWithDescriptor:v129 size:*(double *)&kActiveLayout_3_1];
    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v12;

    id v14 = objc_alloc(MEMORY[0x263F32120]);
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v19 = objc_msgSend(v14, "initWithFrame:options:", 4, *MEMORY[0x263F001A8], v16, v17, v18);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v19;

    [(CLKUIColoringLabel *)v3->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_headerLabel setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_headerLabel setNowProvider:&__block_literal_global_3];
    v128 = v11;
    [(CLKUIColoringLabel *)v3->_headerLabel setFont:v11];
    v21 = v3->_headerLabel;
    v22 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v21 setTextColor:v22];

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F32120]), "initWithFrame:options:", 6, v15, v16, v17, v18);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (CLKUIColoringLabel *)v23;

    [(CLKUIColoringLabel *)v3->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_bodyLabel setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_bodyLabel setNowProvider:&__block_literal_global_7_0];
    [(CLKUIColoringLabel *)v3->_bodyLabel setFont:v3->_standardBodyFont];
    v25 = v3->_bodyLabel;
    v26 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v25 setTextColor:v26];

    [(CLKUIColoringLabel *)v3->_bodyLabel setMinimumScaleFactor:0.75];
    [(CLKUIColoringLabel *)v3->_bodyLabel setAdjustsFontSizeToFitWidth:1];
    [(CLKUIColoringLabel *)v3->_bodyLabel setBaselineAdjustment:0];
    [(CLKUIColoringLabel *)v3->_bodyLabel setNumberOfLines:1];
    v27 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    headerImage = v3->_headerImage;
    v3->_headerImage = v27;

    LODWORD(v29) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentCompressionResistancePriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentCompressionResistancePriority:1 forAxis:v32];
    [(REUpNextImageView *)v3->_headerImage setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    bodyImage = v3->_bodyImage;
    v3->_bodyImage = v33;

    LODWORD(v35) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentHuggingPriority:0 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentHuggingPriority:1 forAxis:v36];
    LODWORD(v37) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentCompressionResistancePriority:0 forAxis:v37];
    LODWORD(v38) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentCompressionResistancePriority:1 forAxis:v38];
    [(REUpNextImageView *)v3->_bodyImage setTranslatesAutoresizingMaskIntoConstraints:0];
    v39 = [(REUpNextLargeTextCell *)v3 contentView];
    [v39 addLayoutGuide:v3->_contentLayoutGuide];

    v40 = [(REUpNextLargeTextCell *)v3 contentView];
    [v40 addSubview:v3->_headerImage];

    v41 = [(REUpNextLargeTextCell *)v3 contentView];
    [v41 addSubview:v3->_headerLabel];

    v42 = [(REUpNextLargeTextCell *)v3 contentView];
    [v42 addSubview:v3->_bodyLabel];

    v43 = [(REUpNextLargeTextCell *)v3 contentView];
    [v43 addSubview:v3->_bodyImage];

    [v11 capHeight];
    UIRoundToViewScale();
    double v45 = v44;
    v125 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v126 = [(REUpNextLargeTextCell *)v3 contentView];
    v124 = [v126 topAnchor];
    v123 = [v125 constraintEqualToAnchor:v124 constant:0.0];
    v136[0] = v123;
    v121 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v122 = [(REUpNextLargeTextCell *)v3 contentView];
    v120 = [v122 bottomAnchor];
    v119 = [v121 constraintEqualToAnchor:v120 constant:-0.0];
    v136[1] = v119;
    v117 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v118 = [(REUpNextLargeTextCell *)v3 contentView];
    v116 = [v118 leadingAnchor];
    v115 = [v117 constraintEqualToAnchor:v116 constant:*(double *)&kActiveLayout_8_0];
    v136[2] = v115;
    v113 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v114 = [(REUpNextLargeTextCell *)v3 contentView];
    v112 = [v114 trailingAnchor];
    v111 = [v113 constraintEqualToAnchor:v112 constant:-*(double *)&kActiveLayout_10_0];
    v136[3] = v111;
    v110 = [(REUpNextImageView *)v3->_headerImage centerYAnchor];
    v109 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v108 = [v110 constraintEqualToAnchor:v109 constant:-v45];
    v136[4] = v108;
    v107 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v106 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v105 = [v107 constraintEqualToAnchor:v106 constant:*(double *)&kActiveLayout_0_2];
    v136[5] = v105;
    v46 = [(REUpNextImageView *)v3->_bodyImage bottomAnchor];
    v47 = [(CLKUIColoringLabel *)v3->_bodyLabel firstBaselineAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v136[6] = v48;
    v49 = [(CLKUIColoringLabel *)v3->_bodyLabel firstBaselineAnchor];
    v50 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:*(double *)&kActiveLayout_1_2];
    v136[7] = v51;
    v52 = [(CLKUIColoringLabel *)v3->_bodyLabel lastBaselineAnchor];
    v53 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:-*(double *)&kActiveLayout_5_1];
    v136[8] = v54;
    v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:9];

    v55 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v56 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v135[0] = v57;
    v58 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v59 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v135[1] = v60;
    uint64_t v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:2];
    headerWithNoImageConstraints = v3->_headerWithNoImageConstraints;
    v3->_headerWithNoImageConstraints = (NSArray *)v61;

    v63 = [(REUpNextImageView *)v3->_headerImage leadingAnchor];
    v64 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v65 = [v63 constraintEqualToAnchor:v64];
    v134[0] = v65;
    v66 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v67 = [(REUpNextImageView *)v3->_headerImage trailingAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:*(double *)&kActiveLayout_2_2];
    v134[1] = v68;
    v69 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v70 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    v134[2] = v71;
    uint64_t v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:3];
    headerWithLeftImageConstraints = v3->_headerWithLeftImageConstraints;
    v3->_headerWithLeftImageConstraints = (NSArray *)v72;

    v74 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v75 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    v133[0] = v76;
    v77 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v78 = [(REUpNextImageView *)v3->_headerImage leadingAnchor];
    v79 = [v77 constraintEqualToAnchor:v78 constant:-*(double *)&kActiveLayout_2_2];
    v133[1] = v79;
    v80 = [(REUpNextImageView *)v3->_headerImage trailingAnchor];
    v81 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    v133[2] = v82;
    uint64_t v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:3];
    headerWithRightImageConstraints = v3->_headerWithRightImageConstraints;
    v3->_headerWithRightImageConstraints = (NSArray *)v83;

    v85 = [(CLKUIColoringLabel *)v3->_bodyLabel leadingAnchor];
    v86 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    v132[0] = v87;
    v88 = [(CLKUIColoringLabel *)v3->_bodyLabel trailingAnchor];
    v89 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    v132[1] = v90;
    uint64_t v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:2];
    bodyWithNoImageConstraints = v3->_bodyWithNoImageConstraints;
    v3->_bodyWithNoImageConstraints = (NSArray *)v91;

    v93 = [(REUpNextImageView *)v3->_bodyImage leadingAnchor];
    v94 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    v131[0] = v95;
    v96 = [(CLKUIColoringLabel *)v3->_bodyLabel leadingAnchor];
    v97 = [(REUpNextImageView *)v3->_bodyImage trailingAnchor];
    v98 = [v96 constraintEqualToAnchor:v97 constant:0.0];
    v131[1] = v98;
    v99 = [(CLKUIColoringLabel *)v3->_bodyLabel trailingAnchor];
    v100 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v101 = [v99 constraintEqualToAnchor:v100];
    v131[2] = v101;
    uint64_t v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:3];
    bodyWithLeftImageConstraints = v3->_bodyWithLeftImageConstraints;
    v3->_bodyWithLeftImageConstraints = (NSArray *)v102;

    [MEMORY[0x263F08938] activateConstraints:v3->_bodyWithNoImageConstraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_headerWithNoImageConstraints];
    [MEMORY[0x263F08938] activateConstraints:v127];
  }
  return v3;
}

uint64_t __39__REUpNextLargeTextCell_initWithFrame___block_invoke()
{
  return [MEMORY[0x263EFF910] date];
}

uint64_t __39__REUpNextLargeTextCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x263EFF910] date];
}

- (void)updateConstraints
{
  v3 = [(REUpNextBaseCell *)self content];
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
  v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  if (self->_showingHeaderImage != v5 || v7 != self->_currentImageEdge)
  {
    self->_currentImageEdge = v7;
    self->_showingHeaderImage = v5;
    headerImage = self->_headerImage;
    if (v5)
    {
      [(REUpNextImageView *)headerImage setHidden:0];
      [v9 addObjectsFromArray:self->_headerWithNoImageConstraints];
      int v11 = [v3 headerImageEdge];
      if (v11 == 2) {
        v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithLeftImageConstraints;
      }
      else {
        v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
      }
      if (v11 == 2) {
        v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
      }
      else {
        v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithLeftImageConstraints;
      }
    }
    else
    {
      [(REUpNextImageView *)headerImage setHidden:1];
      [v9 addObjectsFromArray:self->_headerWithLeftImageConstraints];
      v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithNoImageConstraints;
      v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
    }
    [v9 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v12)];
    [v8 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13)];
  }
  id v14 = [v3 bodyImageProvider];
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
      double v18 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithNoImageConstraints;
    }
    else {
      double v18 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithLeftImageConstraints;
    }
    if (v15) {
      uint64_t v19 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithLeftImageConstraints;
    }
    else {
      uint64_t v19 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithNoImageConstraints;
    }
    [(REUpNextImageView *)self->_bodyImage setHidden:v17];
    [v9 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v18)];
    [v8 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19)];
  }
  [MEMORY[0x263F08938] deactivateConstraints:v9];
  [MEMORY[0x263F08938] activateConstraints:v8];
  v20.receiver = self;
  v20.super_class = (Class)REUpNextLargeTextCell;
  [(REUpNextLargeTextCell *)&v20 updateConstraints];
}

- (void)_updateHeaderColor
{
  id v6 = [(REUpNextBaseCell *)self content];
  if ([v6 tintColorAffectsHeader]
    && ![(REUpNextBaseCell *)self shouldOverrideContentHeaderColor])
  {
    headerLabel = self->_headerLabel;
    uint64_t v4 = [v6 tintColor];
  }
  else
  {
    headerLabel = self->_headerLabel;
    uint64_t v4 = [(REUpNextBaseCell *)self defaultTextColor];
  }
  BOOL v5 = (void *)v4;
  [(CLKUIColoringLabel *)headerLabel setTextColor:v4];
}

- (void)defaultTextColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)REUpNextLargeTextCell;
  [(REUpNextBaseCell *)&v4 defaultTextColorDidChange];
  [(REUpNextLargeTextCell *)self _updateHeaderColor];
  v3 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)self->_bodyLabel setTextColor:v3];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)REUpNextLargeTextCell;
  [(REUpNextBaseCell *)&v29 configureWithContent:v4];
  int v5 = [v4 useMonospaceFont];
  id v6 = &OBJC_IVAR___REUpNextLargeTextCell__standardBodyFont;
  if (v5) {
    id v6 = &OBJC_IVAR___REUpNextLargeTextCell__monospaceBodyFont;
  }
  [(CLKUIColoringLabel *)self->_bodyLabel setFont:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6)];
  headerImage = self->_headerImage;
  v8 = [v4 tintColor];
  [(REUpNextImageView *)headerImage setFallbackTintColor:v8];

  uint64_t v9 = [v4 headerImageProvider];

  if (v9)
  {
    v10 = self->_headerImage;
    int v11 = [v4 headerImageProvider];
    [(REUpNextImageView *)v10 setImageProvider:v11];
  }
  else
  {
    v12 = [v4 overrideHeaderImage];

    if (!v12) {
      goto LABEL_8;
    }
    v13 = self->_headerImage;
    int v11 = [v4 overrideHeaderImage];
    [(REUpNextImageView *)v13 setOverrideImage:v11];
  }

LABEL_8:
  bodyImage = self->_bodyImage;
  BOOL v15 = [v4 tintColor];
  [(REUpNextImageView *)bodyImage setFallbackTintColor:v15];

  double v16 = [v4 bodyImageProvider];

  if (v16)
  {
    BOOL v17 = self->_bodyImage;
    double v18 = [v4 bodyImageProvider];
    [(REUpNextImageView *)v17 setImageProvider:v18];
  }
  else
  {
    uint64_t v19 = [v4 overrideBodyImage];

    if (!v19) {
      goto LABEL_13;
    }
    objc_super v20 = self->_bodyImage;
    double v18 = [v4 overrideBodyImage];
    [(REUpNextImageView *)v20 setOverrideImage:v18];
  }

LABEL_13:
  [(REUpNextLargeTextCell *)self _updateHeaderColor];
  headerLabel = self->_headerLabel;
  v22 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v22];

  uint64_t v23 = [v4 overrideBodyString];

  bodyLabel = self->_bodyLabel;
  if (v23)
  {
    [(CLKUIColoringLabel *)self->_bodyLabel setTextProvider:0];
    v25 = self->_bodyLabel;
    v26 = [v4 overrideBodyString];
    [(CLKUIColoringLabel *)v25 setText:v26];
  }
  else
  {
    v26 = [v4 description1TextProvider];
    [(CLKUIColoringLabel *)bodyLabel setTextProvider:v26];
  }

  v27 = [v4 headerTextProvider];
  [v27 setPaused:0];

  v28 = [v4 description1TextProvider];
  [v28 setPaused:0];

  [(REUpNextLargeTextCell *)self setNeedsUpdateConstraints];
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