@interface NTKUpNextGaugeCell
- (NTKUpNextGaugeCell)initWithFrame:(CGRect)a3;
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

@implementation NTKUpNextGaugeCell

- (NTKUpNextGaugeCell)initWithFrame:(CGRect)a3
{
  v133[20] = *MEMORY[0x1E4F143B8];
  v132.receiver = self;
  v132.super_class = (Class)NTKUpNextGaugeCell;
  v3 = -[NTKUpNextBaseCell initWithFrame:](&v132, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  id v5 = [(NTKUpNextBaseCell *)v3 device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (v8 != v5)
  {

LABEL_6:
    id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, v5);
    _LayoutConstants___previousCLKDeviceVersion_2 = [v5 version];

    ___LayoutConstants_block_invoke_2(v12, (uint64_t)v5);
    goto LABEL_7;
  }
  uint64_t v9 = [v5 version];
  uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_2;

  if (v9 != v10) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  double v13 = *(double *)&_LayoutConstants_constants_0_0;
  double v14 = *(double *)&_LayoutConstants_constants_1_0;
  double v15 = *(double *)&_LayoutConstants_constants_2_0;
  double v16 = *(double *)&_LayoutConstants_constants_3_0;
  double v128 = *(double *)&_LayoutConstants_constants_4_0;
  double v17 = *(double *)&_LayoutConstants_constants_6_0;
  double v18 = *(double *)&_LayoutConstants_constants_7_0;
  double v19 = *(double *)&_LayoutConstants_constants_9;
  double v20 = *(double *)&_LayoutConstants_constants_11;

  v21 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15];
  v22 = [v21 fontDescriptor];
  uint64_t v23 = [v22 fontDescriptorWithSymbolicTraits:2];

  uint64_t v24 = [MEMORY[0x1E4F19A50] systemFontOfSize:v15 weight:*MEMORY[0x1E4FB09D0]];
  standardFont = v4->_standardFont;
  v4->_standardFont = (CLKFont *)v24;

  v131 = (void *)v23;
  uint64_t v26 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v23 size:v15];
  boldFont = v4->_boldFont;
  v4->_boldFont = (CLKFont *)v26;

  uint64_t v28 = [MEMORY[0x1E4F19A50] systemFontOfSize:v17 weight:*MEMORY[0x1E4FB09E0]];
  semiboldFont = v4->_semiboldFont;
  v4->_semiboldFont = (CLKFont *)v28;

  v30 = [MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyle];
  [v30 setLineBreakMode:4];
  uint64_t v31 = __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  headerLabel = v4->_headerLabel;
  v4->_headerLabel = (CLKUIColoringLabel *)v31;

  [(CLKUIColoringLabel *)v4->_headerLabel setFont:v4->_boldFont];
  v33 = v4->_headerLabel;
  v34 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v33 setTextColor:v34];

  [(CLKUIColoringLabel *)v4->_headerLabel setNumberOfLines:1];
  [(CLKUIColoringLabel *)v4->_headerLabel setParagraphStyle:v30];
  uint64_t v35 = __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  descriptionLine1Label = v4->_descriptionLine1Label;
  v4->_descriptionLine1Label = (CLKUIColoringLabel *)v35;

  v37 = v4->_descriptionLine1Label;
  v38 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v37 setTextColor:v38];

  [(CLKUIColoringLabel *)v4->_descriptionLine1Label setFont:v4->_standardFont];
  [(CLKUIColoringLabel *)v4->_descriptionLine1Label setNumberOfLines:1];
  [(CLKUIColoringLabel *)v4->_descriptionLine1Label setParagraphStyle:v30];
  if (CLKLayoutIsRTL()) {
    [v30 setAlignment:0];
  }
  uint64_t v39 = __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  descriptionLine2Label = v4->_descriptionLine2Label;
  v4->_descriptionLine2Label = (CLKUIColoringLabel *)v39;

  v41 = v4->_descriptionLine2Label;
  v42 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v41 setTextColor:v42];

  [(CLKUIColoringLabel *)v4->_descriptionLine2Label setFont:v4->_semiboldFont];
  [(CLKUIColoringLabel *)v4->_descriptionLine2Label setNumberOfLines:1];
  [(CLKUIColoringLabel *)v4->_descriptionLine2Label setParagraphStyle:v30];
  if ((CLKLayoutIsRTL() & 1) == 0) {
    [v30 setAlignment:2];
  }
  uint64_t v43 = __36__NTKUpNextGaugeCell_initWithFrame___block_invoke();
  descriptionLine3Label = v4->_descriptionLine3Label;
  v4->_descriptionLine3Label = (CLKUIColoringLabel *)v43;

  v45 = v4->_descriptionLine3Label;
  v46 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v45 setTextColor:v46];

  [(CLKUIColoringLabel *)v4->_descriptionLine3Label setFont:v4->_semiboldFont];
  [(CLKUIColoringLabel *)v4->_descriptionLine3Label setNumberOfLines:1];
  v130 = v30;
  [(CLKUIColoringLabel *)v4->_descriptionLine3Label setParagraphStyle:v30];
  v47 = [(NTKUpNextBaseCell *)v4 device];
  uint64_t v48 = [v47 sizeClass];

  if (v48 == 3)
  {
    [(CLKUIColoringLabel *)v4->_headerLabel setLineSpacing:(uint64_t)v14];
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setLineSpacing:(uint64_t)v14];
  }
  v49 = [NTKRichComplicationLineProgressView alloc];
  v50 = [(NTKUpNextBaseCell *)v4 device];
  uint64_t v51 = [(NTKRichComplicationLineProgressView *)v49 initForFamily:10 device:v50 progressFillStyle:0];
  progressView = v4->_progressView;
  v4->_progressView = (NTKRichComplicationLineProgressView *)v51;

  [(NTKRichComplicationLineProgressView *)v4->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CDRichComplicationProgressView *)v4->_progressView setFilterProvider:v4];
  v53 = [(CDRichComplicationProgressView *)v4->_progressView ringView];
  v54 = [v53 layer];
  id v55 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v54, "setBorderColor:", objc_msgSend(v55, "CGColor"));

  v56 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  contentLayoutGuide = v4->_contentLayoutGuide;
  v4->_contentLayoutGuide = v56;

  [(UILayoutGuide *)v4->_contentLayoutGuide setIdentifier:@"content"];
  v58 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v58 addLayoutGuide:v4->_contentLayoutGuide];

  v59 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v59 addSubview:v4->_headerLabel];

  v60 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v60 addSubview:v4->_descriptionLine1Label];

  v61 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v61 addSubview:v4->_progressView];

  v62 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v62 insertSubview:v4->_descriptionLine2Label aboveSubview:v4->_progressView];

  v63 = [(NTKUpNextGaugeCell *)v4 contentView];
  [v63 insertSubview:v4->_descriptionLine3Label aboveSubview:v4->_progressView];

  v126 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
  v127 = [(NTKUpNextGaugeCell *)v4 contentView];
  v125 = [v127 topAnchor];
  v124 = [v126 constraintEqualToAnchor:v125 constant:0.0];
  v133[0] = v124;
  v122 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
  v123 = [(NTKUpNextGaugeCell *)v4 contentView];
  v121 = [v123 bottomAnchor];
  v120 = [v122 constraintEqualToAnchor:v121 constant:-0.0];
  v133[1] = v120;
  v118 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v119 = [(NTKUpNextGaugeCell *)v4 contentView];
  v117 = [v119 leadingAnchor];
  v116 = [v118 constraintEqualToAnchor:v117 constant:v19];
  v133[2] = v116;
  v114 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v115 = [(NTKUpNextGaugeCell *)v4 contentView];
  v113 = [v115 trailingAnchor];
  v112 = [v114 constraintEqualToAnchor:v113 constant:-v20];
  v133[3] = v112;
  v111 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
  v110 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v133[4] = v109;
  v108 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
  v107 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v106 = [v108 constraintEqualToAnchor:v107];
  v133[5] = v106;
  v105 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label leadingAnchor];
  v104 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v103 = [v105 constraintEqualToAnchor:v104];
  v133[6] = v103;
  v102 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label trailingAnchor];
  v101 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101];
  v133[7] = v100;
  v99 = [(NTKRichComplicationLineProgressView *)v4->_progressView leadingAnchor];
  v98 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
  v97 = [v99 constraintEqualToAnchor:v98];
  v133[8] = v97;
  v96 = [(NTKRichComplicationLineProgressView *)v4->_progressView trailingAnchor];
  v95 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v133[9] = v94;
  v93 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
  v92 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92 constant:v13];
  v133[10] = v91;
  v90 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
  v89 = [(CLKUIColoringLabel *)v4->_headerLabel lastBaselineAnchor];
  v88 = [v90 constraintEqualToAnchor:v89 constant:v14];
  v133[11] = v88;
  v87 = [(NTKRichComplicationLineProgressView *)v4->_progressView bottomAnchor];
  v86 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
  v85 = [v87 constraintEqualToAnchor:v86 constant:-v16];
  v133[12] = v85;
  v84 = [(NTKRichComplicationLineProgressView *)v4->_progressView heightAnchor];
  v83 = [v84 constraintEqualToConstant:v128];
  v133[13] = v83;
  v82 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label centerYAnchor];
  v81 = [(NTKRichComplicationLineProgressView *)v4->_progressView centerYAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v133[14] = v80;
  v79 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label widthAnchor];
  v78 = [(NTKRichComplicationLineProgressView *)v4->_progressView widthAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 multiplier:0.5 constant:-v18];
  v133[15] = v77;
  v76 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label leadingAnchor];
  v75 = [(NTKRichComplicationLineProgressView *)v4->_progressView leadingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:v18];
  v133[16] = v74;
  v64 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label centerYAnchor];
  v65 = [(NTKRichComplicationLineProgressView *)v4->_progressView centerYAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  v133[17] = v66;
  v67 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label widthAnchor];
  v68 = [(NTKRichComplicationLineProgressView *)v4->_progressView widthAnchor];
  v69 = [v67 constraintEqualToAnchor:v68 multiplier:0.5 constant:-v18];
  v133[18] = v69;
  v70 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label trailingAnchor];
  v71 = [(NTKRichComplicationLineProgressView *)v4->_progressView trailingAnchor];
  v72 = [v70 constraintEqualToAnchor:v71 constant:-v18];
  v133[19] = v72;
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:20];

  [MEMORY[0x1E4F28DC8] activateConstraints:v129];
  return v4;
}

id __36__NTKUpNextGaugeCell_initWithFrame___block_invoke()
{
  id v0 = objc_alloc((Class)off_1E62BDB58);
  v1 = objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setLineBreakMode:4];
  [v1 _setUseShortcutIntrinsicContentSize:1];
  [v1 setNowProvider:&__block_literal_global_4];
  return v1;
}

uint64_t __36__NTKUpNextGaugeCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)configureWithContent:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NTKUpNextGaugeCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v18 configureWithContent:v4];
  +[NTKUpNextBaseCell clearLabel:](NTKUpNextBaseCell, "clearLabel:", self->_headerLabel, v18.receiver, v18.super_class);
  headerLabel = self->_headerLabel;
  v6 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v6];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine1Label];
  descriptionLine1Label = self->_descriptionLine1Label;
  id v8 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextProvider:v8];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine2Label];
  descriptionLine2Label = self->_descriptionLine2Label;
  uint64_t v10 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextProvider:v10];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine3Label];
  descriptionLine3Label = self->_descriptionLine3Label;
  uint64_t v12 = [v4 description3TextProvider];
  [(CLKUIColoringLabel *)descriptionLine3Label setTextProvider:v12];

  double v13 = [v4 gaugeProvider];
  [(CDRichComplicationProgressView *)self->_progressView setGaugeProvider:v13];
  [(NTKRichComplicationLineProgressView *)self->_progressView setHidden:v13 == 0];
  [(CLKUIColoringLabel *)self->_descriptionLine2Label setHidden:v13 == 0];
  [(CLKUIColoringLabel *)self->_descriptionLine3Label setHidden:v13 == 0];
  double v14 = [v4 headerTextProvider];
  objc_msgSend(v14, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  double v15 = [v4 description1TextProvider];
  objc_msgSend(v15, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  double v16 = [v4 description2TextProvider];
  objc_msgSend(v16, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  double v17 = [v4 description3TextProvider];

  objc_msgSend(v17, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextGaugeCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  id v5 = [(CLKUIColoringLabel *)self->_headerLabel textProvider];
  [v5 setPaused:v3];

  v6 = [(CLKUIColoringLabel *)self->_descriptionLine1Label textProvider];
  [v6 setPaused:v3];

  v7 = [(CLKUIColoringLabel *)self->_descriptionLine2Label textProvider];
  [v7 setPaused:v3];

  id v8 = [(CLKUIColoringLabel *)self->_descriptionLine3Label textProvider];
  [v8 setPaused:v3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = a3;
  objc_super v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filtersForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filtersForView:v6 style:a4];

  return v8;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = a3;
  objc_super v9 = [(NTKUpNextBaseCell *)self filterProvider];
  uint64_t v10 = [v9 filterForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 filterForView:v6 style:a4];

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKUpNextBaseCell *)self filterProvider];
  id v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextGaugeCell;
  [(NTKUpNextBaseCell *)&v5 prepareForReuse];
  [(CDRichComplicationProgressView *)self->_progressView transitionToMonochromeWithFraction:0.0];
  BOOL v3 = [(CLKUIColoringLabel *)self->_headerLabel layer];
  [v3 setFilters:0];

  id v4 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
  [v4 setFilters:0];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:");
  if (fabs(a3) >= 0.00000011920929)
  {
    id v6 = [(NTKUpNextBaseCell *)self filterProvider];
    id v10 = [v6 filtersForView:self style:2 fraction:a3];

    v7 = v10;
    if (!v10) {
      goto LABEL_6;
    }
    id v8 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v8 setFilters:v10];

    objc_super v9 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v9 setFilters:v10];
  }
  else
  {
    objc_super v5 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v5 setFilters:0];

    id v10 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v10 setFilters:0];
  }
  v7 = v10;
LABEL_6:
}

- (void)updateMonochromeColor
{
  [(CDRichComplicationProgressView *)self->_progressView updateMonochromeColor];
  BOOL v3 = [(NTKUpNextBaseCell *)self filterProvider];
  id v6 = [v3 filtersForView:self style:2];

  if (v6)
  {
    id v4 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v4 setFilters:v6];

    objc_super v5 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v5 setFilters:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semiboldFont, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine3Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end