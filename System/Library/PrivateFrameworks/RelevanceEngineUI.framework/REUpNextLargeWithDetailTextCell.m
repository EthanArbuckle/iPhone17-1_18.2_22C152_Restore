@interface REUpNextLargeWithDetailTextCell
+ (void)initialize;
- (REUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3;
- (void)_updateHeaderColor;
- (void)configureWithContent:(id)a3;
- (void)defaultTextColorDidChange;
@end

@implementation REUpNextLargeWithDetailTextCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0 = 0x4033800000000000;
    kActiveLayout_1 = 0x4043800000000000;
    kActiveLayout_2 = 0x4010000000000000;
    kActiveLayout_3 = 0x3FF0000000000000;
    kActiveLayout_5 = 0x4030800000000000;
    kActiveLayout_4 = 0x402F000000000000;
    kActiveLayout_6 = 0x4043800000000000;
    kActiveLayout_7 = 0x4020000000000000;
    kActiveLayout_8 = 0x402F000000000000;
    kActiveLayout_10 = 0x4018000000000000;
    kActiveLayout_12 = 0x4018000000000000;
  }
}

- (REUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3
{
  v116[18] = *MEMORY[0x263EF8340];
  v115.receiver = self;
  v115.super_class = (Class)REUpNextLargeWithDetailTextCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v115, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5];
    v5 = [v4 fontDescriptor];
    v113 = [v5 fontDescriptorWithSymbolicTraits:2];

    double v6 = *MEMORY[0x263F1D338];
    v7 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_6 weight:*MEMORY[0x263F1D338]];
    v111 = [v7 CLKFontWithAlternativePunctuation];

    v112 = [MEMORY[0x263EFD198] fontWithDescriptor:v113 size:*(double *)&kActiveLayout_0];
    v8 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_4 weight:v6];
    v9 = [v8 CLKFontWithAlternativePunctuation];
    v114 = [v9 CLKFontWithMonospacedNumbers];

    v10 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v10;

    id v12 = objc_alloc(MEMORY[0x263F32120]);
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v17 = objc_msgSend(v12, "initWithFrame:options:", 4, *MEMORY[0x263F001A8], v14, v15, v16);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v17;

    [(CLKUIColoringLabel *)v3->_headerLabel setNowProvider:&__block_literal_global_1];
    [(CLKUIColoringLabel *)v3->_headerLabel setFont:v112];
    [(CLKUIColoringLabel *)v3->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_headerLabel setLineBreakMode:4];
    v19 = v3->_headerLabel;
    v20 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v19 setTextColor:v20];

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F32120]), "initWithFrame:options:", 2, v13, v14, v15, v16);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (CLKUIColoringLabel *)v21;

    [(CLKUIColoringLabel *)v3->_bodyLabel setNowProvider:&__block_literal_global_7];
    [(CLKUIColoringLabel *)v3->_bodyLabel setFont:v111];
    [(CLKUIColoringLabel *)v3->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_bodyLabel setLineBreakMode:4];
    v23 = v3->_bodyLabel;
    v24 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v23 setTextColor:v24];

    [(CLKUIColoringLabel *)v3->_bodyLabel setMinimumScaleFactor:0.75];
    [(CLKUIColoringLabel *)v3->_bodyLabel setAdjustsFontSizeToFitWidth:1];
    [(CLKUIColoringLabel *)v3->_bodyLabel setBaselineAdjustment:0];
    [(CLKUIColoringLabel *)v3->_bodyLabel setNumberOfLines:1];
    LODWORD(v25) = 1132068864;
    [(CLKUIColoringLabel *)v3->_bodyLabel setContentCompressionResistancePriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(CLKUIColoringLabel *)v3->_bodyLabel setContentHuggingPriority:0 forAxis:v26];
    v27 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v13, v14, v15, v16);
    bodyImage = v3->_bodyImage;
    v3->_bodyImage = v27;

    LODWORD(v29) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentCompressionResistancePriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(REUpNextImageView *)v3->_bodyImage setContentCompressionResistancePriority:1 forAxis:v32];
    [(REUpNextImageView *)v3->_bodyImage setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263F32120]), "initWithFrame:options:", 4, v13, v14, v15, v16);
    detail1Label = v3->_detail1Label;
    v3->_detail1Label = (CLKUIColoringLabel *)v33;

    [(CLKUIColoringLabel *)v3->_detail1Label setNowProvider:&__block_literal_global_10];
    [(CLKUIColoringLabel *)v3->_detail1Label setFont:v114];
    [(CLKUIColoringLabel *)v3->_detail1Label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_detail1Label setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_detail1Label setTextAlignment:2];
    v35 = v3->_detail1Label;
    v36 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v35 setTextColor:v36];

    LODWORD(v37) = 1148846080;
    [(CLKUIColoringLabel *)v3->_detail1Label setContentCompressionResistancePriority:0 forAxis:v37];
    LODWORD(v38) = 1132068864;
    [(CLKUIColoringLabel *)v3->_detail1Label setContentHuggingPriority:0 forAxis:v38];
    uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x263F32120]), "initWithFrame:options:", 4, v13, v14, v15, v16);
    detail2Label = v3->_detail2Label;
    v3->_detail2Label = (CLKUIColoringLabel *)v39;

    [(CLKUIColoringLabel *)v3->_detail2Label setNowProvider:&__block_literal_global_12];
    [(CLKUIColoringLabel *)v3->_detail2Label setFont:v114];
    v41 = v3->_detail2Label;
    v42 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v41 setTextColor:v42];

    [(CLKUIColoringLabel *)v3->_detail2Label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CLKUIColoringLabel *)v3->_detail2Label setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_detail2Label setTextAlignment:2];
    LODWORD(v43) = 1148846080;
    [(CLKUIColoringLabel *)v3->_detail2Label setContentCompressionResistancePriority:0 forAxis:v43];
    LODWORD(v44) = 1132068864;
    [(CLKUIColoringLabel *)v3->_detail2Label setContentHuggingPriority:0 forAxis:v44];
    v45 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v45 addLayoutGuide:v3->_contentLayoutGuide];

    v46 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v46 addSubview:v3->_bodyImage];

    v47 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v47 addSubview:v3->_headerLabel];

    v48 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v48 addSubview:v3->_bodyLabel];

    v49 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v49 addSubview:v3->_detail1Label];

    v50 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    [v50 addSubview:v3->_detail2Label];

    v109 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v110 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    v108 = [v110 topAnchor];
    v107 = [v109 constraintEqualToAnchor:v108 constant:0.0];
    v116[0] = v107;
    v105 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v106 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    v104 = [v106 bottomAnchor];
    v103 = [v105 constraintEqualToAnchor:v104 constant:-0.0];
    v116[1] = v103;
    v101 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v102 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    v100 = [v102 leadingAnchor];
    v99 = [v101 constraintEqualToAnchor:v100 constant:*(double *)&kActiveLayout_10];
    v116[2] = v99;
    v97 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v98 = [(REUpNextLargeWithDetailTextCell *)v3 contentView];
    v96 = [v98 trailingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96 constant:-*(double *)&kActiveLayout_12];
    v116[3] = v95;
    v94 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v93 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v92 = [v94 constraintEqualToAnchor:v93 constant:*(double *)&kActiveLayout_0];
    v116[4] = v92;
    v91 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v90 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v116[5] = v89;
    v88 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v87 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v116[6] = v86;
    v85 = [(CLKUIColoringLabel *)v3->_bodyLabel firstBaselineAnchor];
    v84 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v83 = [v85 constraintEqualToAnchor:v84 constant:*(double *)&kActiveLayout_1];
    v116[7] = v83;
    v82 = [(CLKUIColoringLabel *)v3->_bodyLabel lastBaselineAnchor];
    v81 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:-*(double *)&kActiveLayout_7];
    v116[8] = v80;
    v79 = [(REUpNextImageView *)v3->_bodyImage bottomAnchor];
    v78 = [(CLKUIColoringLabel *)v3->_bodyLabel firstBaselineAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v116[9] = v77;
    v76 = [(CLKUIColoringLabel *)v3->_detail2Label firstBaselineAnchor];
    v75 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v74 = [v76 constraintEqualToAnchor:v75 constant:-*(double *)&kActiveLayout_7];
    v116[10] = v74;
    v72 = [(CLKUIColoringLabel *)v3->_detail1Label firstBaselineAnchor];
    v71 = [(CLKUIColoringLabel *)v3->_detail2Label firstBaselineAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:-*(double *)&kActiveLayout_8];
    v116[11] = v70;
    v69 = [(CLKUIColoringLabel *)v3->_detail2Label leadingAnchor];
    v68 = [(CLKUIColoringLabel *)v3->_detail1Label leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v116[12] = v67;
    v66 = [(CLKUIColoringLabel *)v3->_detail2Label trailingAnchor];
    v65 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v116[13] = v64;
    v63 = [(CLKUIColoringLabel *)v3->_bodyLabel leadingAnchor];
    v62 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v116[14] = v61;
    v51 = [(REUpNextImageView *)v3->_bodyImage leadingAnchor];
    v52 = [(CLKUIColoringLabel *)v3->_bodyLabel trailingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:*(double *)&kActiveLayout_2];
    v116[15] = v53;
    v54 = [(CLKUIColoringLabel *)v3->_detail1Label leadingAnchor];
    v55 = [(REUpNextImageView *)v3->_bodyImage trailingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55 constant:*(double *)&kActiveLayout_3];
    v116[16] = v56;
    v57 = [(CLKUIColoringLabel *)v3->_detail1Label trailingAnchor];
    v58 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    v116[17] = v59;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:18];

    [MEMORY[0x263F08938] activateConstraints:v73];
  }
  return v3;
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke()
{
  return [MEMORY[0x263EFF910] date];
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x263EFF910] date];
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_3()
{
  return [MEMORY[0x263EFF910] date];
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_4()
{
  return [MEMORY[0x263EFF910] date];
}

- (void)_updateHeaderColor
{
  v3 = [(REUpNextBaseCell *)self content];
  if ([v3 tintColorAffectsHeader])
  {
    BOOL v4 = [(REUpNextBaseCell *)self shouldOverrideContentHeaderColor];

    if (v4)
    {
      headerLabel = self->_headerLabel;
      id v8 = [(REUpNextBaseCell *)self content];
      double v6 = [v8 tintColor];
      [(CLKUIColoringLabel *)headerLabel setTextColor:v6];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v7 = self->_headerLabel;
  id v8 = [(REUpNextBaseCell *)self defaultTextColor];
  -[CLKUIColoringLabel setTextColor:](v7, "setTextColor:");
LABEL_6:
}

- (void)defaultTextColorDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)REUpNextLargeWithDetailTextCell;
  [(REUpNextBaseCell *)&v9 defaultTextColorDidChange];
  [(REUpNextLargeWithDetailTextCell *)self _updateHeaderColor];
  bodyLabel = self->_bodyLabel;
  BOOL v4 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)bodyLabel setTextColor:v4];

  detail1Label = self->_detail1Label;
  double v6 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)detail1Label setTextColor:v6];

  detail2Label = self->_detail2Label;
  id v8 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)detail2Label setTextColor:v8];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REUpNextLargeWithDetailTextCell;
  [(REUpNextBaseCell *)&v24 configureWithContent:v4];
  bodyImage = self->_bodyImage;
  double v6 = [v4 tintColor];
  [(REUpNextImageView *)bodyImage setFallbackTintColor:v6];

  v7 = [v4 bodyImageProvider];

  if (v7)
  {
    id v8 = self->_bodyImage;
    objc_super v9 = [v4 bodyImageProvider];
    [(REUpNextImageView *)v8 setImageProvider:v9];
LABEL_5:

    goto LABEL_6;
  }
  v10 = [v4 overrideBodyImage];

  if (v10)
  {
    v11 = self->_bodyImage;
    objc_super v9 = [v4 overrideBodyImage];
    [(REUpNextImageView *)v11 setOverrideImage:v9];
    goto LABEL_5;
  }
LABEL_6:
  [(REUpNextLargeWithDetailTextCell *)self _updateHeaderColor];
  headerLabel = self->_headerLabel;
  double v13 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v13];

  bodyLabel = self->_bodyLabel;
  double v15 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)bodyLabel setTextProvider:v15];

  detail1Label = self->_detail1Label;
  uint64_t v17 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)detail1Label setTextProvider:v17];

  detail2Label = self->_detail2Label;
  v19 = [v4 description3TextProvider];
  [(CLKUIColoringLabel *)detail2Label setTextProvider:v19];

  v20 = [v4 headerTextProvider];
  [v20 setPaused:0];

  uint64_t v21 = [v4 description1TextProvider];
  [v21 setPaused:0];

  v22 = [v4 description2TextProvider];
  [v22 setPaused:0];

  v23 = [v4 description3TextProvider];
  [v23 setPaused:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail2Label, 0);
  objc_storeStrong((id *)&self->_detail1Label, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);

  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end