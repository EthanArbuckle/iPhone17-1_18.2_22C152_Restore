@interface NTKUpNextLargeWithDetailTextCell
- (NTKUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3;
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
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextLargeWithDetailTextCell

- (NTKUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3
{
  v142[18] = *MEMORY[0x1E4F143B8];
  v141.receiver = self;
  v141.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v141, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  id v5 = [(NTKUpNextBaseCell *)v3 device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_25);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_25);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_25);
  if (v8 != v5)
  {

LABEL_6:
    id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_25, v5);
    _LayoutConstants___previousCLKDeviceVersion_25 = [v5 version];

    ___LayoutConstants_block_invoke_22(v12, v5);
    goto LABEL_7;
  }
  uint64_t v9 = [v5 version];
  uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_25;

  if (v9 != v10) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_25);
  double v125 = *(double *)&_LayoutConstants_constants_0_4;
  double v127 = *(double *)&_LayoutConstants_constants_1_4;
  double v133 = *(double *)&_LayoutConstants_constants_2_4;
  double v134 = *(double *)&_LayoutConstants_constants_3_3;
  double v13 = *(double *)&_LayoutConstants_constants_4_2;
  double v14 = *(double *)&_LayoutConstants_constants_5_0;
  double v15 = *(double *)&_LayoutConstants_constants_6_1;
  double v129 = *(double *)&_LayoutConstants_constants_7_1;
  double v131 = *(double *)&_LayoutConstants_constants_8;
  double v16 = *(double *)&_LayoutConstants_constants_10;
  double v17 = *(double *)&_LayoutConstants_constants_12;

  v18 = [MEMORY[0x1E4F19A50] systemFontOfSize:v14];
  v19 = [v18 fontDescriptor];
  v138 = [v19 fontDescriptorWithSymbolicTraits:2];

  double v20 = *MEMORY[0x1E4FB09D8];
  v21 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09D8]];
  v136 = [v21 CLKFontWithAlternativePunctuation];

  v137 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v138 size:v14];
  v22 = [MEMORY[0x1E4F19A50] systemFontOfSize:v13 weight:v20];
  v23 = [v22 CLKFontWithAlternativePunctuation];
  v140 = [v23 CLKFontWithMonospacedNumbers];

  v24 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  contentLayoutGuide = v4->_contentLayoutGuide;
  v4->_contentLayoutGuide = v24;

  id v26 = objc_alloc((Class)off_1E62BDB58);
  double v27 = *MEMORY[0x1E4F1DB28];
  double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v31 = objc_msgSend(v26, "initWithFrame:options:", 4, *MEMORY[0x1E4F1DB28], v28, v30, v29);
  headerLabel = v4->_headerLabel;
  v4->_headerLabel = (CLKUIColoringLabel *)v31;

  [(CLKUIColoringLabel *)v4->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)v4->_headerLabel setLineBreakMode:4];
  [(CLKUIColoringLabel *)v4->_headerLabel setNowProvider:&__block_literal_global_62];
  [(CLKUIColoringLabel *)v4->_headerLabel setFont:v137];
  v33 = v4->_headerLabel;
  v34 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v33 setTextColor:v34];

  uint64_t v35 = objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 2, v27, v28, v30, v29);
  bodyLabel = v4->_bodyLabel;
  v4->_bodyLabel = (CLKUIColoringLabel *)v35;

  [(CLKUIColoringLabel *)v4->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)v4->_bodyLabel setLineBreakMode:4];
  [(CLKUIColoringLabel *)v4->_bodyLabel setNowProvider:&__block_literal_global_62];
  [(CLKUIColoringLabel *)v4->_bodyLabel setFont:v136];
  v37 = v4->_bodyLabel;
  v38 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v37 setTextColor:v38];

  [(CLKUIColoringLabel *)v4->_bodyLabel setMinimumScaleFactor:0.3];
  [(CLKUIColoringLabel *)v4->_bodyLabel setAdjustsFontSizeToFitWidth:1];
  [(CLKUIColoringLabel *)v4->_bodyLabel setBaselineAdjustment:0];
  [(CLKUIColoringLabel *)v4->_bodyLabel setNumberOfLines:1];
  LODWORD(v39) = 1132068864;
  [(CLKUIColoringLabel *)v4->_bodyLabel setContentCompressionResistancePriority:0 forAxis:v39];
  LODWORD(v40) = 1148846080;
  [(CLKUIColoringLabel *)v4->_bodyLabel setContentHuggingPriority:0 forAxis:v40];
  v41 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v27, v28, v30, v29);
  bodyImage = v4->_bodyImage;
  v4->_bodyImage = v41;

  LODWORD(v43) = 1148846080;
  [(NTKUpNextImageView *)v4->_bodyImage setContentHuggingPriority:0 forAxis:v43];
  LODWORD(v44) = 1148846080;
  [(NTKUpNextImageView *)v4->_bodyImage setContentHuggingPriority:1 forAxis:v44];
  LODWORD(v45) = 1148846080;
  [(NTKUpNextImageView *)v4->_bodyImage setContentCompressionResistancePriority:0 forAxis:v45];
  LODWORD(v46) = 1148846080;
  [(NTKUpNextImageView *)v4->_bodyImage setContentCompressionResistancePriority:1 forAxis:v46];
  [(NTKUpNextImageView *)v4->_bodyImage setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NTKUpNextImageView *)v4->_bodyImage setFilterProvider:v4];
  uint64_t v47 = objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 4, v27, v28, v30, v29);
  detail1Label = v4->_detail1Label;
  v4->_detail1Label = (CLKUIColoringLabel *)v47;

  [(CLKUIColoringLabel *)v4->_detail1Label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)v4->_detail1Label setLineBreakMode:4];
  [(CLKUIColoringLabel *)v4->_detail1Label setTextAlignment:2];
  [(CLKUIColoringLabel *)v4->_detail1Label setNowProvider:&__block_literal_global_62];
  [(CLKUIColoringLabel *)v4->_detail1Label setFont:v140];
  v49 = v4->_detail1Label;
  v50 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v49 setTextColor:v50];

  LODWORD(v51) = 1148846080;
  [(CLKUIColoringLabel *)v4->_detail1Label setContentCompressionResistancePriority:0 forAxis:v51];
  LODWORD(v52) = 1132068864;
  [(CLKUIColoringLabel *)v4->_detail1Label setContentHuggingPriority:0 forAxis:v52];
  uint64_t v53 = objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 4, v27, v28, v30, v29);
  detail2Label = v4->_detail2Label;
  v4->_detail2Label = (CLKUIColoringLabel *)v53;

  [(CLKUIColoringLabel *)v4->_detail2Label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)v4->_detail2Label setLineBreakMode:4];
  [(CLKUIColoringLabel *)v4->_detail2Label setTextAlignment:2];
  [(CLKUIColoringLabel *)v4->_detail2Label setNowProvider:&__block_literal_global_62];
  [(CLKUIColoringLabel *)v4->_detail2Label setFont:v140];
  v55 = v4->_detail2Label;
  v56 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v55 setTextColor:v56];

  LODWORD(v57) = 1148846080;
  [(CLKUIColoringLabel *)v4->_detail2Label setContentCompressionResistancePriority:0 forAxis:v57];
  LODWORD(v58) = 1132068864;
  [(CLKUIColoringLabel *)v4->_detail2Label setContentHuggingPriority:0 forAxis:v58];
  v59 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v59 addLayoutGuide:v4->_contentLayoutGuide];

  v60 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v60 addSubview:v4->_headerLabel];

  v61 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v61 addSubview:v4->_bodyLabel];

  v62 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v62 addSubview:v4->_bodyImage];

  v63 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v63 addSubview:v4->_detail1Label];

  v64 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  [v64 addSubview:v4->_detail2Label];

  v65 = [MEMORY[0x1E4F1CA20] currentLocale];
  v66 = [v65 languageCode];
  v67 = [v66 lowercaseString];
  int v68 = [v67 isEqualToString:@"th"];

  if (v68) {
    double v69 = 3.0;
  }
  else {
    double v69 = 0.0;
  }
  v123 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
  v124 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  v122 = [v124 topAnchor];
  v121 = [v123 constraintEqualToAnchor:v122 constant:0.0];
  v142[0] = v121;
  v119 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
  v120 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  v118 = [v120 bottomAnchor];
  v117 = [v119 constraintEqualToAnchor:v118 constant:-0.0];
  v142[1] = v117;
  v115 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v116 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  v114 = [v116 leadingAnchor];
  v113 = [v115 constraintEqualToAnchor:v114 constant:v16];
  v142[2] = v113;
  v111 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v112 = [(NTKUpNextLargeWithDetailTextCell *)v4 contentView];
  v110 = [v112 trailingAnchor];
  v109 = [v111 constraintEqualToAnchor:v110 constant:-v17];
  v142[3] = v109;
  v108 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
  v107 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
  v126 = [v108 constraintEqualToAnchor:v107 constant:v125];
  v142[4] = v126;
  v106 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
  v105 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v142[5] = v104;
  v103 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
  v102 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v142[6] = v101;
  v100 = [(CLKUIColoringLabel *)v4->_bodyLabel firstBaselineAnchor];
  v139 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
  v128 = [v100 constraintEqualToAnchor:v139 constant:v127];
  v142[7] = v128;
  v99 = [(CLKUIColoringLabel *)v4->_bodyLabel lastBaselineAnchor];
  v98 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
  double v70 = -v129;
  v130 = [v99 constraintEqualToAnchor:v98 constant:-v129];
  v142[8] = v130;
  v97 = [(NTKUpNextImageView *)v4->_bodyImage bottomAnchor];
  v96 = [(CLKUIColoringLabel *)v4->_bodyLabel firstBaselineAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v142[9] = v95;
  v94 = [(CLKUIColoringLabel *)v4->_detail2Label firstBaselineAnchor];
  v93 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
  v92 = [v94 constraintEqualToAnchor:v93 constant:v70];
  v142[10] = v92;
  v91 = [(CLKUIColoringLabel *)v4->_detail1Label firstBaselineAnchor];
  v90 = [(CLKUIColoringLabel *)v4->_detail2Label firstBaselineAnchor];
  v132 = [v91 constraintEqualToAnchor:v90 constant:-(v131 + v69)];
  v142[11] = v132;
  v89 = [(CLKUIColoringLabel *)v4->_detail2Label leadingAnchor];
  v88 = [(CLKUIColoringLabel *)v4->_detail1Label leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v142[12] = v87;
  v86 = [(CLKUIColoringLabel *)v4->_detail2Label trailingAnchor];
  v85 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85];
  v142[13] = v84;
  v83 = [(CLKUIColoringLabel *)v4->_bodyLabel leadingAnchor];
  v82 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v142[14] = v81;
  v71 = [(NTKUpNextImageView *)v4->_bodyImage leadingAnchor];
  v72 = [(CLKUIColoringLabel *)v4->_bodyLabel trailingAnchor];
  v73 = [v71 constraintEqualToAnchor:v72 constant:v133];
  v142[15] = v73;
  v74 = [(CLKUIColoringLabel *)v4->_detail1Label leadingAnchor];
  v75 = [(NTKUpNextImageView *)v4->_bodyImage trailingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75 constant:v134];
  v142[16] = v76;
  v77 = [(CLKUIColoringLabel *)v4->_detail1Label trailingAnchor];
  v78 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v79 = [v77 constraintEqualToAnchor:v78];
  v142[17] = v79;
  v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:18];

  [MEMORY[0x1E4F28DC8] activateConstraints:v135];
  return v4;
}

uint64_t __50__NTKUpNextLargeWithDetailTextCell_initWithFrame___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  [(NTKUpNextBaseCell *)&v27 configureWithContent:v4];
  bodyImage = self->_bodyImage;
  v6 = [v4 tintColor];
  [(NTKUpNextImageView *)bodyImage setFallbackTintColor:v6];

  v7 = self->_bodyImage;
  id v8 = [v4 overrideBodyImage];
  uint64_t v9 = [v4 bodyImageProvider];
  [(NTKUpNextImageView *)v7 setFullColorImage:v8 tintableImageProvider:v9];

  uint64_t v10 = self->_bodyImage;
  id v11 = [v4 bodyImageCompositingFilter];
  [(NTKUpNextImageView *)v10 setCompositingFilter:v11];

  int v12 = [v4 tintColorAffectsHeader];
  headerLabel = self->_headerLabel;
  if (v12) {
    [v4 tintColor];
  }
  else {
  double v14 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(CLKUIColoringLabel *)headerLabel setTextColor:v14];

  +[NTKUpNextBaseCell clearLabel:self->_headerLabel];
  double v15 = self->_headerLabel;
  double v16 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)v15 setTextProvider:v16];

  +[NTKUpNextBaseCell clearLabel:self->_bodyLabel];
  bodyLabel = self->_bodyLabel;
  v18 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)bodyLabel setTextProvider:v18];

  +[NTKUpNextBaseCell clearLabel:self->_detail1Label];
  detail1Label = self->_detail1Label;
  double v20 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)detail1Label setTextProvider:v20];

  +[NTKUpNextBaseCell clearLabel:self->_detail2Label];
  detail2Label = self->_detail2Label;
  v22 = [v4 description3TextProvider];
  [(CLKUIColoringLabel *)detail2Label setTextProvider:v22];

  v23 = [v4 headerTextProvider];
  objc_msgSend(v23, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  v24 = [v4 description1TextProvider];
  objc_msgSend(v24, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  v25 = [v4 description2TextProvider];
  objc_msgSend(v25, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  id v26 = [v4 description3TextProvider];
  objc_msgSend(v26, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  id v5 = [(CLKUIColoringLabel *)self->_headerLabel textProvider];
  [v5 setPaused:v3];

  v6 = [(CLKUIColoringLabel *)self->_bodyLabel textProvider];
  [v6 setPaused:v3];

  v7 = [(CLKUIColoringLabel *)self->_detail1Label textProvider];
  [v7 setPaused:v3];

  id v8 = [(CLKUIColoringLabel *)self->_detail2Label textProvider];
  [v8 setPaused:v3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  if (self->_bodyImage == a3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a4;
  }
  id v6 = a3;
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filtersForView:v6 style:v5];

  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  if (self->_bodyImage == a3) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = a4;
  }
  id v8 = a3;
  objc_super v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filtersForView:v8 style:v7 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  if (self->_bodyImage == a3) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = a4;
  }
  id v8 = a3;
  objc_super v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filterForView:v8 style:v7 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  if (self->_bodyImage == a3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a4;
  }
  id v6 = a3;
  int64_t v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filterForView:v6 style:v5];

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v5 = self->_bodyImage != a3 && a4;
  id v6 = a3;
  int64_t v7 = [(NTKUpNextBaseCell *)self filterProvider];
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
  v4.super_class = (Class)NTKUpNextLargeWithDetailTextCell;
  [(NTKUpNextBaseCell *)&v4 prepareForReuse];
  [(NTKUpNextImageView *)self->_bodyImage transitionToMonochromeWithFraction:0.0];
  BOOL v3 = [(CLKUIColoringLabel *)self->_headerLabel layer];
  [v3 setFilters:0];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_bodyImage, "transitionToMonochromeWithFraction:");
  if (fabs(a3) >= 0.00000011920929)
  {
    BOOL v5 = [(NTKUpNextBaseCell *)self filterProvider];
    id v8 = [v5 filtersForView:self style:2 fraction:a3];

    id v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    int64_t v7 = [(CLKUIColoringLabel *)self->_headerLabel layer];
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
  objc_storeStrong((id *)&self->_detail2Label, 0);
  objc_storeStrong((id *)&self->_detail1Label, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end