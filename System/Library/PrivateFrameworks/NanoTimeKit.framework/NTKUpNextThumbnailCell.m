@interface NTKUpNextThumbnailCell
+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3;
- (NTKUpNextThumbnailCell)initWithFrame:(CGRect)a3;
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

@implementation NTKUpNextThumbnailCell

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  _LayoutConstants_34(a3, v5);
  double v3 = *(double *)&v8 - (*((double *)&v8 + 1) + *(double *)&v6 * 2.0 + *((double *)&v9 + 1));
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NTKUpNextThumbnailCell)initWithFrame:(CGRect)a3
{
  v198[16] = *MEMORY[0x1E4F143B8];
  v191.receiver = self;
  v191.super_class = (Class)NTKUpNextThumbnailCell;
  double v3 = -[NTKUpNextBaseCell initWithFrame:](&v191, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    v5 = [(NTKUpNextBaseCell *)v3 device];
    _LayoutConstants_34(v5, &v183);

    double v6 = *((double *)&v185 + 1);
    long long v7 = [MEMORY[0x1E4F19A50] systemFontOfSize:*((double *)&v185 + 1)];
    long long v8 = [v7 fontDescriptor];
    uint64_t v9 = [v8 fontDescriptorWithSymbolicTraits:1];

    long long v10 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6];
    uint64_t v11 = [v10 fontDescriptor];
    uint64_t v12 = [(id)v11 fontDescriptorWithSymbolicTraits:2];

    LOBYTE(v11) = CLKIsCurrentLocaleNonLatin();
    double v13 = *MEMORY[0x1E4FB09D0];
    v14 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6 weight:*MEMORY[0x1E4FB09D0]];
    v15 = [v14 fontDescriptor];
    v16 = v15;
    if ((v11 & 1) == 0)
    {
      uint64_t v17 = [v15 fontDescriptorWithSymbolicTraits:1];

      v16 = (void *)v17;
    }

    uint64_t v18 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6 weight:v13];
    standardFont = v4->_standardFont;
    v4->_standardFont = (CLKFont *)v18;

    v181 = (void *)v12;
    uint64_t v20 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v12 size:v6];
    boldFont = v4->_boldFont;
    v4->_boldFont = (CLKFont *)v20;

    v182 = (void *)v9;
    uint64_t v22 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v9 size:v6];
    italicFont = v4->_italicFont;
    v4->_italicFont = (CLKFont *)v22;

    v180 = v16;
    uint64_t v24 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v16 size:*((double *)&v190 + 1)];
    v25 = [MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyle];
    [v25 setLineBreakMode:4];
    [v25 lineSpacing];
    [v25 setLineSpacing:v26 + *(double *)&v186];
    uint64_t v27 = __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v27;

    [(CLKUIColoringLabel *)v4->_headerLabel setFont:v4->_boldFont];
    v29 = v4->_headerLabel;
    v30 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v29 setTextColor:v30];

    [(CLKUIColoringLabel *)v4->_headerLabel setNumberOfLines:2];
    [(CLKUIColoringLabel *)v4->_headerLabel setParagraphStyle:v25];
    uint64_t v31 = __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    descriptionLine1Label = v4->_descriptionLine1Label;
    v4->_descriptionLine1Label = (CLKUIColoringLabel *)v31;

    v33 = v4->_descriptionLine1Label;
    v34 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v33 setTextColor:v34];

    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setFont:v4->_standardFont];
    v178 = v25;
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setParagraphStyle:v25];
    uint64_t v35 = __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    descriptionLine2Label = v4->_descriptionLine2Label;
    v4->_descriptionLine2Label = (CLKUIColoringLabel *)v35;

    v37 = v4->_descriptionLine2Label;
    v38 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v37 setTextColor:v38];

    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setFont:v4->_italicFont];
    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setNumberOfLines:1];
    uint64_t v39 = __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke();
    descriptionLine3Label = v4->_descriptionLine3Label;
    v4->_descriptionLine3Label = (CLKUIColoringLabel *)v39;

    v41 = v4->_descriptionLine3Label;
    v42 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v41 setTextColor:v42];

    v179 = (void *)v24;
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setFont:v24];
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setNumberOfLines:1];
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setTextAlignment:1];
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setAdjustsFontSizeToFitWidth:1];
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setMinimumScaleFactor:0.7];
    v43 = [(NTKUpNextBaseCell *)v4 device];
    uint64_t v44 = [v43 sizeClass];

    if (v44 == 3)
    {
      uint64_t v45 = (uint64_t)*(double *)&v184;
      [(CLKUIColoringLabel *)v4->_headerLabel setLineSpacing:(uint64_t)*(double *)&v184];
      [(CLKUIColoringLabel *)v4->_descriptionLine1Label setLineSpacing:v45];
      [(CLKUIColoringLabel *)v4->_descriptionLine2Label setLineSpacing:(uint64_t)*((double *)&v184 + 1)];
    }
    v46 = [NTKUpNextImageView alloc];
    uint64_t v47 = -[NTKUpNextImageView initWithFrame:parentCell:](v46, "initWithFrame:parentCell:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (NTKUpNextImageView *)v47;

    [(NTKUpNextImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NTKUpNextImageView *)v4->_imageView setContentMode:1];
    v49 = [(NTKUpNextImageView *)v4->_imageView layer];
    [v49 setCornerRadius:*(double *)&v183];

    [(NTKUpNextImageView *)v4->_imageView setClipsToBounds:1];
    [(NTKUpNextImageView *)v4->_imageView setFilterProvider:v4];
    v50 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    labelLayoutGuide = v4->_labelLayoutGuide;
    v4->_labelLayoutGuide = v50;

    v52 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v52 addLayoutGuide:v4->_labelLayoutGuide];

    v53 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v53 addSubview:v4->_imageView];

    v54 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v54 addSubview:v4->_headerLabel];

    v55 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v55 addSubview:v4->_descriptionLine1Label];

    v56 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v56 addSubview:v4->_descriptionLine2Label];

    v57 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v57 addSubview:v4->_descriptionLine3Label];

    v58 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    imageLayoutGuide = v4->_imageLayoutGuide;
    v4->_imageLayoutGuide = v58;

    v60 = [(NTKUpNextThumbnailCell *)v4 contentView];
    [v60 addLayoutGuide:v4->_imageLayoutGuide];

    v61 = [(UILayoutGuide *)v4->_imageLayoutGuide widthAnchor];
    uint64_t v62 = [v61 constraintEqualToConstant:1.0];
    imageLayoutGuideWidthConstraint = v4->_imageLayoutGuideWidthConstraint;
    v4->_imageLayoutGuideWidthConstraint = (NSLayoutConstraint *)v62;

    v64 = [(UILayoutGuide *)v4->_imageLayoutGuide heightAnchor];
    uint64_t v65 = [v64 constraintEqualToConstant:1.0];
    imageLayoutGuideHeightConstraint = v4->_imageLayoutGuideHeightConstraint;
    v4->_imageLayoutGuideHeightConstraint = (NSLayoutConstraint *)v65;

    v176 = [(NTKUpNextImageView *)v4->_imageView centerYAnchor];
    v175 = [(UILayoutGuide *)v4->_imageLayoutGuide centerYAnchor];
    v173 = [v176 constraintEqualToAnchor:v175];
    v198[0] = v173;
    v171 = [(NTKUpNextImageView *)v4->_imageView centerXAnchor];
    v169 = [(UILayoutGuide *)v4->_imageLayoutGuide centerXAnchor];
    v167 = [v171 constraintEqualToAnchor:v169];
    v198[1] = v167;
    v165 = [(NTKUpNextImageView *)v4->_imageView widthAnchor];
    v163 = [(UILayoutGuide *)v4->_imageLayoutGuide widthAnchor];
    v161 = [v165 constraintLessThanOrEqualToAnchor:v163];
    v198[2] = v161;
    v159 = [(NTKUpNextImageView *)v4->_imageView heightAnchor];
    v157 = [(UILayoutGuide *)v4->_imageLayoutGuide heightAnchor];
    v155 = [v159 constraintLessThanOrEqualToAnchor:v157];
    v198[3] = v155;
    v153 = [(UILayoutGuide *)v4->_labelLayoutGuide topAnchor];
    v154 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v152 = [v154 topAnchor];
    v151 = [v153 constraintEqualToAnchor:v152 constant:*((double *)&v187 + 1)];
    v198[4] = v151;
    v149 = [(UILayoutGuide *)v4->_labelLayoutGuide bottomAnchor];
    v150 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v148 = [v150 bottomAnchor];
    v147 = [v149 constraintEqualToAnchor:v148 constant:-*((double *)&v188 + 1)];
    v198[5] = v147;
    v146 = [(UILayoutGuide *)v4->_labelLayoutGuide leadingAnchor];
    v145 = [(UILayoutGuide *)v4->_imageLayoutGuide trailingAnchor];
    v144 = [v146 constraintEqualToAnchor:v145 constant:*(double *)&v185];
    v198[6] = v144;
    v142 = [(UILayoutGuide *)v4->_labelLayoutGuide trailingAnchor];
    v143 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v141 = [v143 trailingAnchor];
    v140 = [v142 constraintEqualToAnchor:v141 constant:-*(double *)&v189];
    v198[7] = v140;
    v139 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
    v138 = [(UILayoutGuide *)v4->_labelLayoutGuide leadingAnchor];
    v137 = [v139 constraintEqualToAnchor:v138];
    v198[8] = v137;
    v136 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
    v135 = [(UILayoutGuide *)v4->_labelLayoutGuide trailingAnchor];
    v134 = [v136 constraintEqualToAnchor:v135];
    v198[9] = v134;
    v133 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label leadingAnchor];
    v132 = [(UILayoutGuide *)v4->_labelLayoutGuide leadingAnchor];
    v131 = [v133 constraintEqualToAnchor:v132];
    v198[10] = v131;
    v67 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label trailingAnchor];
    v68 = [(UILayoutGuide *)v4->_labelLayoutGuide trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    v198[11] = v69;
    v70 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label leadingAnchor];
    v71 = [(UILayoutGuide *)v4->_labelLayoutGuide leadingAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    v198[12] = v72;
    v73 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label trailingAnchor];
    v74 = [(UILayoutGuide *)v4->_labelLayoutGuide trailingAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    v198[13] = v75;
    v198[14] = v4->_imageLayoutGuideHeightConstraint;
    v198[15] = v4->_imageLayoutGuideWidthConstraint;
    v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:16];

    v76 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
    v77 = [(UILayoutGuide *)v4->_labelLayoutGuide topAnchor];
    double v78 = *((double *)&v183 + 1);
    v79 = [v76 constraintEqualToAnchor:v77 constant:*((double *)&v183 + 1)];
    v197 = v79;
    uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
    withoutHeaderConstraints = v4->_withoutHeaderConstraints;
    v4->_withoutHeaderConstraints = (NSArray *)v80;

    v82 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
    v83 = [(UILayoutGuide *)v4->_labelLayoutGuide topAnchor];
    v84 = [v82 constraintEqualToAnchor:v83 constant:v78];
    v196[0] = v84;
    v85 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
    v86 = [(CLKUIColoringLabel *)v4->_headerLabel lastBaselineAnchor];
    v87 = [v85 constraintEqualToAnchor:v86 constant:*(double *)&v184];
    v196[1] = v87;
    uint64_t v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
    withHeaderConstraints = v4->_withHeaderConstraints;
    v4->_withHeaderConstraints = (NSArray *)v88;

    v90 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label firstBaselineAnchor];
    v91 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label lastBaselineAnchor];
    double v92 = *(double *)&v186;
    v93 = [v90 constraintEqualToAnchor:v91 constant:*((double *)&v184 + 1) + *(double *)&v186];
    v195[0] = v93;
    v94 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label lastBaselineAnchor];
    v95 = [(UILayoutGuide *)v4->_labelLayoutGuide bottomAnchor];
    double v96 = *((double *)&v186 + 1);
    double v97 = -*((double *)&v186 + 1);
    v98 = [v94 constraintLessThanOrEqualToAnchor:v95 constant:-*((double *)&v186 + 1)];
    v195[1] = v98;
    uint64_t v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
    withDescription2Constraints = v4->_withDescription2Constraints;
    v4->_withDescription2Constraints = (NSArray *)v99;

    v101 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label lastBaselineAnchor];
    v102 = [(UILayoutGuide *)v4->_labelLayoutGuide bottomAnchor];
    v103 = [v101 constraintLessThanOrEqualToAnchor:v102 constant:v97];
    v194[0] = v103;
    v104 = [(CLKUIColoringLabel *)v4->_headerLabel lastBaselineAnchor];
    v105 = [(UILayoutGuide *)v4->_labelLayoutGuide bottomAnchor];
    v106 = [v104 constraintLessThanOrEqualToAnchor:v105 constant:v97];
    v194[1] = v106;
    uint64_t v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2];
    withoutDescription2Constraints = v4->_withoutDescription2Constraints;
    v4->_withoutDescription2Constraints = (NSArray *)v107;

    v172 = [(UILayoutGuide *)v4->_imageLayoutGuide leadingAnchor];
    v174 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v170 = [v174 leadingAnchor];
    v168 = [v172 constraintEqualToAnchor:v170 constant:*(double *)&v185];
    v193[0] = v168;
    v164 = [(UILayoutGuide *)v4->_imageLayoutGuide centerYAnchor];
    v162 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label firstBaselineAnchor];
    v166 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v166 scale];
    UIRoundToScale();
    v160 = objc_msgSend(v164, "constraintEqualToAnchor:constant:", v162);
    v193[1] = v160;
    v156 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label leadingAnchor];
    v158 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v109 = [v158 leadingAnchor];
    v110 = [v156 constraintEqualToAnchor:v109 constant:1.0];
    v193[2] = v110;
    v111 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label trailingAnchor];
    v112 = [(UILayoutGuide *)v4->_labelLayoutGuide leadingAnchor];
    v113 = [v111 constraintEqualToAnchor:v112 constant:-1.0];
    v193[3] = v113;
    v114 = [(CLKUIColoringLabel *)v4->_descriptionLine3Label firstBaselineAnchor];
    v115 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v116 = [v115 bottomAnchor];
    v117 = [v114 constraintEqualToAnchor:v116 constant:v92 - v96];
    v193[4] = v117;
    uint64_t v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:5];
    withDescription3Constraints = v4->_withDescription3Constraints;
    v4->_withDescription3Constraints = (NSArray *)v118;

    v120 = [(UILayoutGuide *)v4->_imageLayoutGuide leadingAnchor];
    v121 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v122 = [v121 leadingAnchor];
    v123 = [v120 constraintEqualToAnchor:v122 constant:*(double *)&v188];
    v192[0] = v123;
    v124 = [(UILayoutGuide *)v4->_imageLayoutGuide centerYAnchor];
    v125 = [(NTKUpNextThumbnailCell *)v4 contentView];
    v126 = [v125 centerYAnchor];
    v127 = [v124 constraintEqualToAnchor:v126];
    v192[1] = v127;
    uint64_t v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
    withoutDescription3Constraints = v4->_withoutDescription3Constraints;
    v4->_withoutDescription3Constraints = (NSArray *)v128;

    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutDescription3Constraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutDescription2Constraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutHeaderConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v177];
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setNumberOfLines:3];
    [(CLKUIColoringLabel *)v4->_headerLabel setHidden:1];
    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setHidden:1];
    [(CLKUIColoringLabel *)v4->_descriptionLine3Label setHidden:1];
  }
  return v4;
}

id __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke()
{
  id v0 = objc_alloc((Class)off_1E62BDB58);
  v1 = objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setLineBreakMode:4];
  [v1 _setUseShortcutIntrinsicContentSize:1];
  [v1 setNowProvider:&__block_literal_global_4_2];
  return v1;
}

uint64_t __40__NTKUpNextThumbnailCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)updateConstraints
{
  double v3 = [(NTKUpNextBaseCell *)self content];
  double v4 = objc_opt_new();
  v5 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  memset(v37, 0, sizeof(v37));
  double v6 = [(NTKUpNextBaseCell *)self device];
  _LayoutConstants_34(v6, v37);

  long long v7 = [v3 description3TextProvider];
  BOOL v8 = v7 != 0;

  if (self->_showingSmallThumbnail == v8)
  {
    if (v7) {
      goto LABEL_24;
    }
  }
  else
  {
    self->_showingSmallThumbnail = v8;
    [(CLKUIColoringLabel *)self->_descriptionLine3Label setHidden:v7 == 0];
    if (v7)
    {
      [(NSLayoutConstraint *)self->_imageLayoutGuideWidthConstraint setConstant:*((double *)&v38 + 1)];
      [(NSLayoutConstraint *)self->_imageLayoutGuideHeightConstraint setConstant:*(double *)&v39];
      [v4 addObjectsFromArray:self->_withDescription3Constraints];
      [v5 addObjectsFromArray:self->_withoutDescription3Constraints];
      goto LABEL_24;
    }
    [v4 addObjectsFromArray:self->_withoutDescription3Constraints];
    [v5 addObjectsFromArray:self->_withDescription3Constraints];
  }
  uint64_t v9 = objc_opt_class();
  long long v10 = [(NTKUpNextBaseCell *)self device];
  [v9 suggestedBodyImageSizeForDevice:v10];
  double v12 = v11;
  double v14 = v13;

  [(NTKUpNextImageView *)self->_imageView intrinsicContentSize];
  double v17 = v16;
  if (v15 == *MEMORY[0x1E4FB30D8] && v16 == *MEMORY[0x1E4FB30D8])
  {
    [(NSLayoutConstraint *)self->_imageLayoutGuideWidthConstraint setConstant:v12];
    imageLayoutGuideHeightConstraint = self->_imageLayoutGuideHeightConstraint;
    double v22 = v14;
  }
  else
  {
    if (v16 <= v15 || v16 <= v14)
    {
      if (v15 >= v16 && v15 > v12)
      {
        double v17 = v12 * (v16 / v15);
        double v15 = v12;
      }
    }
    else
    {
      double v15 = v14 * (v15 / v16);
      double v17 = v14;
    }
    [(NSLayoutConstraint *)self->_imageLayoutGuideWidthConstraint setConstant:v15];
    imageLayoutGuideHeightConstraint = self->_imageLayoutGuideHeightConstraint;
    double v22 = v17;
  }
  [(NSLayoutConstraint *)imageLayoutGuideHeightConstraint setConstant:v22];
LABEL_24:
  v23 = [v3 description2TextProvider];
  BOOL v24 = v23 != 0;

  if (self->_showingThirdLine != v24)
  {
    self->_showingThirdLine = v24;
    [(CLKUIColoringLabel *)self->_descriptionLine2Label setHidden:v23 == 0];
    if (self->_showingThirdLine) {
      v25 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutDescription2Constraints;
    }
    else {
      v25 = &OBJC_IVAR___NTKUpNextThumbnailCell__withDescription2Constraints;
    }
    if (self->_showingThirdLine) {
      double v26 = &OBJC_IVAR___NTKUpNextThumbnailCell__withDescription2Constraints;
    }
    else {
      double v26 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutDescription2Constraints;
    }
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v25)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v26)];
  }
  uint64_t v27 = [v3 headerTextProvider];
  BOOL v28 = v27 != 0;

  if (self->_showingHeader != v28)
  {
    BOOL v29 = v27 == 0;
    BOOL v30 = v27 == 0;
    self->_showingHeader = v28;
    if (v27) {
      uint64_t v31 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutHeaderConstraints;
    }
    else {
      uint64_t v31 = &OBJC_IVAR___NTKUpNextThumbnailCell__withHeaderConstraints;
    }
    if (v29) {
      v32 = &OBJC_IVAR___NTKUpNextThumbnailCell__withoutHeaderConstraints;
    }
    else {
      v32 = &OBJC_IVAR___NTKUpNextThumbnailCell__withHeaderConstraints;
    }
    [(CLKUIColoringLabel *)self->_headerLabel setHidden:v30];
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v31)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v32)];
  }
  if (!self->_showingThirdLine)
  {
    if (self->_showingHeader)
    {
      uint64_t v35 = [v3 description1TextProvider];

      headerLabel = self->_headerLabel;
      if (v35)
      {
        [(CLKUIColoringLabel *)headerLabel setNumberOfLines:2];
        headerLabel = self->_descriptionLine1Label;
        uint64_t v34 = 2;
        goto LABEL_49;
      }
    }
    else
    {
      headerLabel = self->_descriptionLine1Label;
    }
    uint64_t v34 = 3;
    goto LABEL_49;
  }
  [(CLKUIColoringLabel *)self->_headerLabel setNumberOfLines:1];
  headerLabel = self->_descriptionLine1Label;
  if (self->_showingHeader) {
    uint64_t v34 = 1;
  }
  else {
    uint64_t v34 = 2;
  }
LABEL_49:
  [(CLKUIColoringLabel *)headerLabel setNumberOfLines:v34];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v5];
  [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  v36.receiver = self;
  v36.super_class = (Class)NTKUpNextThumbnailCell;
  [(NTKUpNextThumbnailCell *)&v36 updateConstraints];
}

- (void)configureWithContent:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)NTKUpNextThumbnailCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v28 configureWithContent:v4];
  +[NTKUpNextBaseCell clearLabel:self->_headerLabel];
  headerLabel = self->_headerLabel;
  double v6 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v6];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine1Label];
  descriptionLine1Label = self->_descriptionLine1Label;
  BOOL v8 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextProvider:v8];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine2Label];
  descriptionLine2Label = self->_descriptionLine2Label;
  long long v10 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextProvider:v10];

  +[NTKUpNextBaseCell clearLabel:self->_descriptionLine3Label];
  descriptionLine3Label = self->_descriptionLine3Label;
  double v12 = [v4 description3TextProvider];
  [(CLKUIColoringLabel *)descriptionLine3Label setTextProvider:v12];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__NTKUpNextThumbnailCell_configureWithContent___block_invoke;
  aBlock[3] = &unk_1E62C36C0;
  aBlock[4] = self;
  double v13 = (void (**)(void *, CLKUIColoringLabel *, uint64_t))_Block_copy(aBlock);
  v13[2](v13, self->_headerLabel, [v4 headerFontStyle]);
  v13[2](v13, self->_descriptionLine1Label, [v4 description1FontStyle]);
  v13[2](v13, self->_descriptionLine2Label, [v4 description2FontStyle]);
  imageView = self->_imageView;
  double v15 = [v4 overrideBodyImage];
  double v16 = [v4 bodyImageProvider];
  [(NTKUpNextImageView *)imageView setFullColorImage:v15 tintableImageProvider:v16];

  double v17 = self->_imageView;
  uint64_t v18 = [v4 bodyImageCompositingFilter];
  [(NTKUpNextImageView *)v17 setCompositingFilter:v18];

  v19 = [v4 headerTextProvider];
  objc_msgSend(v19, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  uint64_t v20 = [v4 description1TextProvider];
  objc_msgSend(v20, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  v21 = [v4 description2TextProvider];
  objc_msgSend(v21, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  double v22 = [v4 description3TextProvider];
  objc_msgSend(v22, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  v23 = [v4 description1Opacity];

  BOOL v24 = self->_descriptionLine1Label;
  if (v23)
  {
    [v23 floatValue];
    double v26 = v25;
  }
  else
  {
    double v26 = 1.0;
  }
  [(CLKUIColoringLabel *)v24 setAlpha:v26];
  [(NTKUpNextThumbnailCell *)self setNeedsUpdateConstraints];
}

void __47__NTKUpNextThumbnailCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = 0.0;
  id v8 = v5;
  long long v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!CLKIsCurrentLocaleNonLatin()) {
        long long v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__italicFont;
      }
      goto LABEL_7;
    case 2:
      long long v7 = &OBJC_IVAR___NTKUpNextThumbnailCell__boldFont;
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

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextThumbnailCell;
  -[NTKUpNextBaseCell setPaused:](&v9, sel_setPaused_);
  id v5 = [(CLKUIColoringLabel *)self->_headerLabel textProvider];
  [v5 setPaused:v3];

  double v6 = [(CLKUIColoringLabel *)self->_descriptionLine1Label textProvider];
  [v6 setPaused:v3];

  long long v7 = [(CLKUIColoringLabel *)self->_descriptionLine2Label textProvider];
  [v7 setPaused:v3];

  id v8 = [(CLKUIColoringLabel *)self->_descriptionLine3Label textProvider];
  [v8 setPaused:v3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v4 = a3;
  CLKUIAssociatedNonAccentStyle();
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v5 = a3;
  CLKUIAssociatedNonAccentStyle();
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v5 = a3;
  CLKUIAssociatedNonAccentStyle();
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v4 = a3;
  CLKUIAssociatedNonAccentStyle();
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [(NTKUpNextBaseCell *)self filterProvider];
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
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextThumbnailCell;
  [(NTKUpNextBaseCell *)&v7 prepareForReuse];
  [(NTKUpNextImageView *)self->_imageView transitionToMonochromeWithFraction:0.0];
  BOOL v3 = [(CLKUIColoringLabel *)self->_headerLabel layer];
  [v3 setFilters:0];

  id v4 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
  [v4 setFilters:0];

  id v5 = [(CLKUIColoringLabel *)self->_descriptionLine2Label layer];
  [v5 setFilters:0];

  id v6 = [(CLKUIColoringLabel *)self->_descriptionLine3Label layer];
  [v6 setFilters:0];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_imageView, "transitionToMonochromeWithFraction:");
  if (fabs(a3) >= 0.00000011920929)
  {
    id v8 = [(NTKUpNextBaseCell *)self filterProvider];
    id v19 = [v8 filtersForView:self style:2 fraction:a3];

    objc_super v9 = v19;
    if (!v19) {
      goto LABEL_10;
    }
    long long v10 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v10 setFilters:v19];

    double v11 = [(CLKUIColoringLabel *)self->_descriptionLine3Label layer];
    [v11 setFilters:v19];

    double v12 = [(NTKUpNextBaseCell *)self content];
    uint64_t v13 = [v12 headerTextProvider];
    if (v13)
    {
      double v14 = (void *)v13;
      double v15 = [(NTKUpNextBaseCell *)self content];
      uint64_t v16 = [v15 headerFontStyle];

      if (v16 == 2) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    double v17 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v17 setFilters:v19];

    uint64_t v18 = [(CLKUIColoringLabel *)self->_descriptionLine2Label layer];
    [v18 setFilters:v19];
  }
  else
  {
    id v5 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v5 setFilters:0];

    id v6 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v6 setFilters:0];

    objc_super v7 = [(CLKUIColoringLabel *)self->_descriptionLine2Label layer];
    [v7 setFilters:0];

    id v19 = [(CLKUIColoringLabel *)self->_descriptionLine3Label layer];
    [v19 setFilters:0];
  }
LABEL_9:
  objc_super v9 = v19;
LABEL_10:
}

- (void)updateMonochromeColor
{
  [(NTKUpNextImageView *)self->_imageView updateMonochromeColor];
  BOOL v3 = [(NTKUpNextBaseCell *)self filterProvider];
  id v13 = [v3 filtersForView:self style:2];

  if (v13)
  {
    id v4 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v4 setFilters:v13];

    id v5 = [(CLKUIColoringLabel *)self->_descriptionLine3Label layer];
    [v5 setFilters:v13];

    id v6 = [(NTKUpNextBaseCell *)self content];
    uint64_t v7 = [v6 headerTextProvider];
    if (v7)
    {
      id v8 = (void *)v7;
      objc_super v9 = [(NTKUpNextBaseCell *)self content];
      uint64_t v10 = [v9 headerFontStyle];

      if (v10 == 2) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    double v11 = [(CLKUIColoringLabel *)self->_descriptionLine1Label layer];
    [v11 setFilters:v13];

    double v12 = [(CLKUIColoringLabel *)self->_descriptionLine2Label layer];
    [v12 setFilters:v13];
  }
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_withoutDescription3Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription3Constraints, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine3Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_labelLayoutGuide, 0);
}

@end