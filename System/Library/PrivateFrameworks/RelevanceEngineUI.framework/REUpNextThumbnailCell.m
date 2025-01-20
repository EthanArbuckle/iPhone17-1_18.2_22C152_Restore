@interface REUpNextThumbnailCell
+ (void)initialize;
- (REUpNextThumbnailCell)initWithFrame:(CGRect)a3;
- (void)configureWithContent:(id)a3;
- (void)defaultTextColorDidChange;
- (void)updateConstraints;
@end

@implementation REUpNextThumbnailCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_1_0 = 0x4033800000000000;
    kActiveLayout_2_0 = 0x4033800000000000;
    kActiveLayout_3_0 = 0x4033800000000000;
    kActiveLayout_4_0 = 0x4018000000000000;
    kActiveLayout_5_0 = 0x4030800000000000;
    kActiveLayout_6_0 = 0x401E000000000000;
    kActiveLayout_9 = 0x4018000000000000;
    kActiveLayout_11 = 0x4018000000000000;
    kActiveLayout_0_0 = 0x4000000000000000;
    kActiveLayout_7_0 = 0x4050600000000000;
  }
}

- (REUpNextThumbnailCell)initWithFrame:(CGRect)a3
{
  v124[14] = *MEMORY[0x263EF8340];
  v119.receiver = self;
  v119.super_class = (Class)REUpNextThumbnailCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v119, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_0];
    v5 = [v4 fontDescriptor];
    v117 = [v5 fontDescriptorWithSymbolicTraits:1];

    v6 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_0];
    v7 = [v6 fontDescriptor];
    v118 = [v7 fontDescriptorWithSymbolicTraits:2];

    uint64_t v8 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_0 weight:*MEMORY[0x263F1D330]];
    standardFont = v3->_standardFont;
    v3->_standardFont = (CLKFont *)v8;

    uint64_t v10 = [MEMORY[0x263EFD198] fontWithDescriptor:v118 size:*(double *)&kActiveLayout_5_0];
    boldFont = v3->_boldFont;
    v3->_boldFont = (CLKFont *)v10;

    uint64_t v12 = [MEMORY[0x263EFD198] fontWithDescriptor:v117 size:*(double *)&kActiveLayout_5_0];
    italicFont = v3->_italicFont;
    v3->_italicFont = (CLKFont *)v12;

    id v14 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v14 setLineBreakMode:4];
    uint64_t v15 = __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v15;

    [(CLKUIColoringLabel *)v3->_headerLabel setFont:v3->_boldFont];
    v17 = v3->_headerLabel;
    v18 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v17 setTextColor:v18];

    [(CLKUIColoringLabel *)v3->_headerLabel setNumberOfLines:2];
    v116 = v14;
    [(CLKUIColoringLabel *)v3->_headerLabel setParagraphStyle:v14];
    uint64_t v19 = __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    descriptionLine1Label = v3->_descriptionLine1Label;
    v3->_descriptionLine1Label = (CLKUIColoringLabel *)v19;

    v21 = v3->_descriptionLine1Label;
    v22 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v21 setTextColor:v22];

    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setFont:v3->_standardFont];
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setParagraphStyle:v14];
    uint64_t v23 = __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    descriptionLine2Label = v3->_descriptionLine2Label;
    v3->_descriptionLine2Label = (CLKUIColoringLabel *)v23;

    v25 = v3->_descriptionLine2Label;
    v26 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v25 setTextColor:v26];

    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setFont:v3->_italicFont];
    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setNumberOfLines:1];
    id v27 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v28 = objc_msgSend(v27, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v28;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setContentMode:1];
    v30 = [(UIImageView *)v3->_imageView layer];
    [v30 setCornerRadius:*(double *)&kActiveLayout_0_0];

    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    v31 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    labelLayoutGuide = v3->_labelLayoutGuide;
    v3->_labelLayoutGuide = v31;

    v33 = [(REUpNextThumbnailCell *)v3 contentView];
    [v33 addLayoutGuide:v3->_labelLayoutGuide];

    v34 = [(REUpNextThumbnailCell *)v3 contentView];
    [v34 addSubview:v3->_imageView];

    v35 = [(REUpNextThumbnailCell *)v3 contentView];
    [v35 addSubview:v3->_headerLabel];

    v36 = [(REUpNextThumbnailCell *)v3 contentView];
    [v36 addSubview:v3->_descriptionLine1Label];

    v37 = [(REUpNextThumbnailCell *)v3 contentView];
    [v37 addSubview:v3->_descriptionLine2Label];

    v38 = [(UIImageView *)v3->_imageView widthAnchor];
    uint64_t v39 = [v38 constraintEqualToConstant:1.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v39;

    v41 = [(UIImageView *)v3->_imageView heightAnchor];
    uint64_t v42 = [v41 constraintEqualToConstant:1.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v42;

    v113 = [(UIImageView *)v3->_imageView leadingAnchor];
    v114 = [(REUpNextThumbnailCell *)v3 contentView];
    v112 = [v114 leadingAnchor];
    v111 = [v113 constraintEqualToAnchor:v112 constant:*(double *)&kActiveLayout_4_0];
    v124[0] = v111;
    v109 = [(UIImageView *)v3->_imageView centerYAnchor];
    v110 = [(REUpNextThumbnailCell *)v3 contentView];
    v108 = [v110 centerYAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v124[1] = v107;
    v105 = [(UILayoutGuide *)v3->_labelLayoutGuide topAnchor];
    v106 = [(REUpNextThumbnailCell *)v3 contentView];
    v104 = [v106 topAnchor];
    v103 = [v105 constraintEqualToAnchor:v104 constant:0.0];
    v124[2] = v103;
    v101 = [(UILayoutGuide *)v3->_labelLayoutGuide bottomAnchor];
    v102 = [(REUpNextThumbnailCell *)v3 contentView];
    v100 = [v102 bottomAnchor];
    v99 = [v101 constraintEqualToAnchor:v100 constant:-0.0];
    v124[3] = v99;
    v98 = [(UILayoutGuide *)v3->_labelLayoutGuide leadingAnchor];
    v97 = [(UIImageView *)v3->_imageView trailingAnchor];
    v96 = [v98 constraintEqualToAnchor:v97 constant:*(double *)&kActiveLayout_9];
    v124[4] = v96;
    v94 = [(UILayoutGuide *)v3->_labelLayoutGuide trailingAnchor];
    v95 = [(REUpNextThumbnailCell *)v3 contentView];
    v93 = [v95 trailingAnchor];
    v92 = [v94 constraintEqualToAnchor:v93 constant:-*(double *)&kActiveLayout_11];
    v124[5] = v92;
    v91 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v90 = [(UILayoutGuide *)v3->_labelLayoutGuide leadingAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v124[6] = v89;
    v88 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v87 = [(UILayoutGuide *)v3->_labelLayoutGuide trailingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v124[7] = v86;
    v85 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label leadingAnchor];
    v84 = [(UILayoutGuide *)v3->_labelLayoutGuide leadingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v124[8] = v83;
    v44 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label trailingAnchor];
    v45 = [(UILayoutGuide *)v3->_labelLayoutGuide trailingAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v124[9] = v46;
    v47 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label leadingAnchor];
    v48 = [(UILayoutGuide *)v3->_labelLayoutGuide leadingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v124[10] = v49;
    v50 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label trailingAnchor];
    v51 = [(UILayoutGuide *)v3->_labelLayoutGuide trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    v124[11] = v52;
    v124[12] = v3->_imageHeightConstraint;
    v124[13] = v3->_imageWidthConstraint;
    v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v124 count:14];

    v53 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label firstBaselineAnchor];
    v54 = [(UILayoutGuide *)v3->_labelLayoutGuide topAnchor];
    v55 = [v53 constraintEqualToAnchor:v54 constant:*(double *)&kActiveLayout_1_0];
    v123 = v55;
    uint64_t v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v123 count:1];
    withoutHeaderConstraints = v3->_withoutHeaderConstraints;
    v3->_withoutHeaderConstraints = (NSArray *)v56;

    v58 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v59 = [(UILayoutGuide *)v3->_labelLayoutGuide topAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:*(double *)&kActiveLayout_1_0];
    v122[0] = v60;
    v61 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label firstBaselineAnchor];
    v62 = [(CLKUIColoringLabel *)v3->_headerLabel lastBaselineAnchor];
    v63 = [v61 constraintEqualToAnchor:v62 constant:*(double *)&kActiveLayout_2_0];
    v122[1] = v63;
    uint64_t v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:2];
    withHeaderConstraints = v3->_withHeaderConstraints;
    v3->_withHeaderConstraints = (NSArray *)v64;

    v66 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label firstBaselineAnchor];
    v67 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label lastBaselineAnchor];
    v68 = [v66 constraintEqualToAnchor:v67 constant:*(double *)&kActiveLayout_3_0];
    v121[0] = v68;
    v69 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label lastBaselineAnchor];
    v70 = [(UILayoutGuide *)v3->_labelLayoutGuide bottomAnchor];
    v71 = [v69 constraintLessThanOrEqualToAnchor:v70 constant:-*(double *)&kActiveLayout_6_0];
    v121[1] = v71;
    uint64_t v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:2];
    withDescription2Constraints = v3->_withDescription2Constraints;
    v3->_withDescription2Constraints = (NSArray *)v72;

    v74 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label lastBaselineAnchor];
    v75 = [(UILayoutGuide *)v3->_labelLayoutGuide bottomAnchor];
    v76 = [v74 constraintLessThanOrEqualToAnchor:v75 constant:-*(double *)&kActiveLayout_6_0];
    v120[0] = v76;
    v77 = [(CLKUIColoringLabel *)v3->_headerLabel lastBaselineAnchor];
    v78 = [(UILayoutGuide *)v3->_labelLayoutGuide bottomAnchor];
    v79 = [v77 constraintLessThanOrEqualToAnchor:v78 constant:-*(double *)&kActiveLayout_6_0];
    v120[1] = v79;
    uint64_t v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:2];
    withoutDescription2Constraints = v3->_withoutDescription2Constraints;
    v3->_withoutDescription2Constraints = (NSArray *)v80;

    [MEMORY[0x263F08938] activateConstraints:v3->_withoutDescription2Constraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_withoutHeaderConstraints];
    [MEMORY[0x263F08938] activateConstraints:v115];
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setNumberOfLines:3];
    [(CLKUIColoringLabel *)v3->_headerLabel setHidden:1];
    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setHidden:1];
  }
  return v3;
}

id __39__REUpNextThumbnailCell_initWithFrame___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F32120]);
  v1 = objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setLineBreakMode:4];
  [v1 setNowProvider:&__block_literal_global_5];

  return v1;
}

uint64_t __39__REUpNextThumbnailCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x263EFF910] date];
}

- (void)defaultTextColorDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)REUpNextThumbnailCell;
  [(REUpNextBaseCell *)&v11 defaultTextColorDidChange];
  headerLabel = self->_headerLabel;
  v4 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)headerLabel setTextColor:v4];

  descriptionLine1Label = self->_descriptionLine1Label;
  v6 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextColor:v6];

  descriptionLine2Label = self->_descriptionLine2Label;
  uint64_t v8 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextColor:v8];

  imageView = self->_imageView;
  uint64_t v10 = [(REUpNextBaseCell *)self defaultTextColor];
  [(UIImageView *)imageView setTintColor:v10];
}

- (void)updateConstraints
{
  v3 = [(REUpNextBaseCell *)self content];
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  double v6 = *(double *)&kActiveLayout_7_0 - (*(double *)&kActiveLayout_4_0 * 2.0 + 0.0 + 0.0);
  v7 = [v3 overrideBodyImage];
  [v7 size];
  double v10 = v9;
  if (v9 <= v8 || v9 <= v6)
  {
    if (v8 >= v9 && v8 > v6)
    {
      double v10 = v6 * (v9 / v8);
      double v8 = v6;
    }
  }
  else
  {
    double v8 = v6 * (v8 / v9);
    double v10 = v6;
  }
  [(NSLayoutConstraint *)self->_imageWidthConstraint setConstant:v8];
  [(NSLayoutConstraint *)self->_imageHeightConstraint setConstant:v10];
  objc_super v11 = [v3 description2TextProvider];
  BOOL v12 = v11 != 0;

  if (self->_showingThreeLineLayout != v12)
  {
    self->_showingThreeLineLayout = v12;
    [(CLKUIColoringLabel *)self->_descriptionLine2Label setHidden:v11 == 0];
    if (self->_showingThreeLineLayout) {
      v13 = &OBJC_IVAR___REUpNextThumbnailCell__withoutDescription2Constraints;
    }
    else {
      v13 = &OBJC_IVAR___REUpNextThumbnailCell__withDescription2Constraints;
    }
    if (self->_showingThreeLineLayout) {
      id v14 = &OBJC_IVAR___REUpNextThumbnailCell__withDescription2Constraints;
    }
    else {
      id v14 = &OBJC_IVAR___REUpNextThumbnailCell__withoutDescription2Constraints;
    }
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14)];
  }
  uint64_t v15 = [v3 headerTextProvider];
  BOOL v16 = v15 != 0;

  if (self->_showingHeader != v16)
  {
    BOOL v17 = v15 == 0;
    BOOL v18 = v15 == 0;
    self->_showingHeader = v16;
    if (v15) {
      uint64_t v19 = &OBJC_IVAR___REUpNextThumbnailCell__withoutHeaderConstraints;
    }
    else {
      uint64_t v19 = &OBJC_IVAR___REUpNextThumbnailCell__withHeaderConstraints;
    }
    if (v17) {
      v20 = &OBJC_IVAR___REUpNextThumbnailCell__withoutHeaderConstraints;
    }
    else {
      v20 = &OBJC_IVAR___REUpNextThumbnailCell__withHeaderConstraints;
    }
    [(CLKUIColoringLabel *)self->_headerLabel setHidden:v18];
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v20)];
  }
  if (!self->_showingThreeLineLayout)
  {
    if (self->_showingHeader)
    {
      uint64_t v23 = [v3 description1TextProvider];

      headerLabel = self->_headerLabel;
      if (v23)
      {
        [(CLKUIColoringLabel *)headerLabel setNumberOfLines:2];
        headerLabel = self->_descriptionLine1Label;
        uint64_t v22 = 2;
        goto LABEL_30;
      }
    }
    else
    {
      headerLabel = self->_descriptionLine1Label;
    }
    uint64_t v22 = 3;
    goto LABEL_30;
  }
  [(CLKUIColoringLabel *)self->_headerLabel setNumberOfLines:1];
  headerLabel = self->_descriptionLine1Label;
  uint64_t v22 = 1;
LABEL_30:
  [(CLKUIColoringLabel *)headerLabel setNumberOfLines:v22];
  [MEMORY[0x263F08938] deactivateConstraints:v5];
  [MEMORY[0x263F08938] activateConstraints:v4];
  v24.receiver = self;
  v24.super_class = (Class)REUpNextThumbnailCell;
  [(REUpNextThumbnailCell *)&v24 updateConstraints];
}

- (void)configureWithContent:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)REUpNextThumbnailCell;
  id v4 = a3;
  [(REUpNextBaseCell *)&v18 configureWithContent:v4];
  headerLabel = self->_headerLabel;
  double v6 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v6];

  descriptionLine1Label = self->_descriptionLine1Label;
  double v8 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextProvider:v8];

  descriptionLine2Label = self->_descriptionLine2Label;
  double v10 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextProvider:v10];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__REUpNextThumbnailCell_configureWithContent___block_invoke;
  v17[3] = &unk_2644B7CB8;
  v17[4] = self;
  objc_super v11 = (void (**)(void, void, void))MEMORY[0x223C2D7E0](v17);
  ((void (**)(void, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_headerLabel, [v4 headerFontStyle]);
  ((void (**)(void, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_descriptionLine1Label, [v4 description1FontStyle]);
  ((void (**)(void, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_descriptionLine2Label, [v4 description2FontStyle]);
  imageView = self->_imageView;
  v13 = [v4 overrideBodyImage];
  [(UIImageView *)imageView setImage:v13];

  id v14 = [v4 headerTextProvider];
  [v14 setPaused:0];

  uint64_t v15 = [v4 description1TextProvider];
  [v15 setPaused:0];

  BOOL v16 = [v4 description2TextProvider];

  [v16 setPaused:0];
  [(REUpNextThumbnailCell *)self setNeedsUpdateConstraints];
}

void __46__REUpNextThumbnailCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = 0.0;
  id v8 = v5;
  v7 = &OBJC_IVAR___REUpNextThumbnailCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!REIsCurrentLocaleCJK()) {
        v7 = &OBJC_IVAR___REUpNextThumbnailCell__italicFont;
      }
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___REUpNextThumbnailCell__boldFont;
      goto LABEL_7;
    case 3:
      double v6 = 0.8;
LABEL_7:
      [v8 setFont:*(void *)(*(void *)(a1 + 32) + *v7)];
      id v5 = v8;
      break;
    default:
      break;
  }
  [v5 setMinimumScaleFactor:v6];
  [v8 setAdjustsFontSizeToFitWidth:v6 != 0.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_labelLayoutGuide, 0);
}

@end