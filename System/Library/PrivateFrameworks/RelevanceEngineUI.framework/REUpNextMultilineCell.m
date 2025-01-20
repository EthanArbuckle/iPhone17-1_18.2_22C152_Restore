@interface REUpNextMultilineCell
+ (void)initialize;
- (REUpNextMultilineCell)initWithFrame:(CGRect)a3;
- (void)_updateHeaderColor;
- (void)configureWithContent:(id)a3;
- (void)defaultTextColorDidChange;
- (void)updateConstraints;
@end

@implementation REUpNextMultilineCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_4 = 0x4012000000000000;
    kActiveLayout_1_4 = 0x4033800000000000;
    kActiveLayout_2_4 = 0x4033800000000000;
    kActiveLayout_3_2 = 0x4033800000000000;
    kActiveLayout_4_2 = 0x4010000000000000;
    kActiveLayout_5_2 = 0x4030800000000000;
    kActiveLayout_6_1 = 0x4020000000000000;
    kActiveLayout_7_1 = 0x400C000000000000;
    kActiveLayout_8_1 = 0x3FE0000000000000;
    kActiveLayout_10_1 = 0x4040000000000000;
    kActiveLayout_11_0 = 0x3FF0000000000000;
    kActiveLayout_13 = 0x4018000000000000;
    kActiveLayout_15 = 0x4018000000000000;
  }
}

- (REUpNextMultilineCell)initWithFrame:(CGRect)a3
{
  v224[14] = *MEMORY[0x263EF8340];
  v212.receiver = self;
  v212.super_class = (Class)REUpNextMultilineCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v212, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_2];
    v5 = [v4 fontDescriptor];
    v210 = [v5 fontDescriptorWithSymbolicTraits:1];

    v6 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_2];
    v7 = [v6 fontDescriptor];
    v209 = [v7 fontDescriptorWithSymbolicTraits:2];

    uint64_t v8 = [MEMORY[0x263EFD198] systemFontOfSize:*(double *)&kActiveLayout_5_2 weight:*MEMORY[0x263F1D330]];
    standardFont = v3->_standardFont;
    v3->_standardFont = (CLKFont *)v8;

    uint64_t v10 = [MEMORY[0x263EFD198] fontWithDescriptor:v210 size:*(double *)&kActiveLayout_5_2];
    italicFont = v3->_italicFont;
    v3->_italicFont = (CLKFont *)v10;

    uint64_t v12 = [MEMORY[0x263EFD198] fontWithDescriptor:v209 size:*(double *)&kActiveLayout_5_2];
    boldFont = v3->_boldFont;
    v3->_boldFont = (CLKFont *)v12;

    uint64_t v14 = __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v14;

    [(CLKUIColoringLabel *)v3->_headerLabel setFont:v3->_boldFont];
    v16 = v3->_headerLabel;
    v17 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v16 setTextColor:v17];

    uint64_t v18 = __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    descriptionLine1Label = v3->_descriptionLine1Label;
    v3->_descriptionLine1Label = (CLKUIColoringLabel *)v18;

    v20 = v3->_descriptionLine1Label;
    v21 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v20 setTextColor:v21];

    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setFont:v3->_standardFont];
    id v208 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v208 setLineBreakMode:4];
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setParagraphStyle:v208];
    LODWORD(v22) = 1148846080;
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setContentHuggingPriority:1 forAxis:v22];
    uint64_t v23 = __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    descriptionLine2Label = v3->_descriptionLine2Label;
    v3->_descriptionLine2Label = (CLKUIColoringLabel *)v23;

    v25 = v3->_descriptionLine2Label;
    v26 = [MEMORY[0x263F1C550] whiteColor];
    [(CLKUIColoringLabel *)v25 setTextColor:v26];

    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setFont:v3->_italicFont];
    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setNumberOfLines:1];
    v27 = [REUpNextImageView alloc];
    double v28 = *MEMORY[0x263F001A8];
    double v29 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v30 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v31 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v32 = -[REUpNextImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x263F001A8], v29, v30, v31);
    headerImage = v3->_headerImage;
    v3->_headerImage = (REUpNextImageView *)v32;

    LODWORD(v34) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentHuggingPriority:0 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentHuggingPriority:1 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentCompressionResistancePriority:0 forAxis:v36];
    LODWORD(v37) = 1148846080;
    [(REUpNextImageView *)v3->_headerImage setContentCompressionResistancePriority:1 forAxis:v37];
    LODWORD(v38) = 1148846080;
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setContentCompressionResistancePriority:1 forAxis:v38];
    LODWORD(v39) = 1148829696;
    [(CLKUIColoringLabel *)v3->_headerLabel setContentCompressionResistancePriority:1 forAxis:v39];
    LODWORD(v40) = 1148846080;
    [(CLKUIColoringLabel *)v3->_headerLabel setContentHuggingPriority:1 forAxis:v40];
    [(REUpNextImageView *)v3->_headerImage setTranslatesAutoresizingMaskIntoConstraints:0];
    v41 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v28, v29, v30, v31);
    descriptionImageView = v3->_descriptionImageView;
    v3->_descriptionImageView = v41;

    [(REUpNextImageView *)v3->_descriptionImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(REUpNextImageView *)v3->_descriptionImageView setContentMode:6];
    LODWORD(v43) = 1148846080;
    [(REUpNextImageView *)v3->_descriptionImageView setContentHuggingPriority:0 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(REUpNextImageView *)v3->_descriptionImageView setContentCompressionResistancePriority:0 forAxis:v44];
    v45 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v45;

    v47 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    descriptionTextLayoutGuide = v3->_descriptionTextLayoutGuide;
    v3->_descriptionTextLayoutGuide = v47;

    v49 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    bodyImageSizingLayoutGuide = v3->_bodyImageSizingLayoutGuide;
    v3->_bodyImageSizingLayoutGuide = v49;

    v51 = [(REUpNextMultilineCell *)v3 contentView];
    [v51 addLayoutGuide:v3->_contentLayoutGuide];

    v52 = [(REUpNextMultilineCell *)v3 contentView];
    [v52 addLayoutGuide:v3->_descriptionTextLayoutGuide];

    v53 = [(REUpNextMultilineCell *)v3 contentView];
    [v53 addLayoutGuide:v3->_bodyImageSizingLayoutGuide];

    v54 = [(REUpNextMultilineCell *)v3 contentView];
    [v54 addSubview:v3->_headerImage];

    v55 = [(REUpNextMultilineCell *)v3 contentView];
    [v55 addSubview:v3->_headerLabel];

    v56 = [(REUpNextMultilineCell *)v3 contentView];
    [v56 addSubview:v3->_descriptionLine1Label];

    v57 = [(REUpNextMultilineCell *)v3 contentView];
    [v57 addSubview:v3->_descriptionLine2Label];

    v58 = [(REUpNextMultilineCell *)v3 contentView];
    [v58 addSubview:v3->_descriptionImageView];

    [(CLKFont *)v3->_boldFont capHeight];
    UIRoundToViewScale();
    double v60 = v59;
    v204 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v206 = [(REUpNextMultilineCell *)v3 contentView];
    v202 = [v206 topAnchor];
    v200 = [v204 constraintEqualToAnchor:v202 constant:0.0];
    v224[0] = v200;
    v198 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v199 = [(REUpNextMultilineCell *)v3 contentView];
    v197 = [v199 bottomAnchor];
    v196 = [v198 constraintEqualToAnchor:v197 constant:-0.0];
    v224[1] = v196;
    v194 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v195 = [(REUpNextMultilineCell *)v3 contentView];
    v193 = [v195 leadingAnchor];
    v192 = [v194 constraintEqualToAnchor:v193 constant:*(double *)&kActiveLayout_13];
    v224[2] = v192;
    v190 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v191 = [(REUpNextMultilineCell *)v3 contentView];
    v189 = [v191 trailingAnchor];
    v188 = [v190 constraintEqualToAnchor:v189 constant:-*(double *)&kActiveLayout_15];
    v224[3] = v188;
    v187 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide trailingAnchor];
    v186 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v185 = [v187 constraintEqualToAnchor:v186];
    v224[4] = v185;
    v184 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide bottomAnchor];
    v183 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v182 = [v184 constraintEqualToAnchor:v183 constant:-*(double *)&kActiveLayout_6_1];
    v224[5] = v182;
    v181 = [(REUpNextImageView *)v3->_headerImage centerYAnchor];
    v180 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v179 = [v181 constraintEqualToAnchor:v180 constant:-v60];
    v224[6] = v179;
    v178 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label leadingAnchor];
    v177 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v176 = [v178 constraintEqualToAnchor:v177];
    v224[7] = v176;
    v175 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label trailingAnchor];
    v174 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide trailingAnchor];
    v173 = [v175 constraintEqualToAnchor:v174];
    v224[8] = v173;
    v172 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label trailingAnchor];
    v171 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide trailingAnchor];
    v170 = [v172 constraintEqualToAnchor:v171];
    v224[9] = v170;
    v169 = [(REUpNextImageView *)v3->_descriptionImageView leadingAnchor];
    v168 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v167 = [v169 constraintEqualToAnchor:v168 constant:*(double *)&kActiveLayout_8_1];
    v224[10] = v167;
    v61 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide leadingAnchor];
    v62 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    v224[11] = v63;
    v64 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide trailingAnchor];
    v65 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide trailingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    v224[12] = v66;
    v67 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide topAnchor];
    v68 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label firstBaselineAnchor];
    [(CLKFont *)v3->_standardFont capHeight];
    v70 = [v67 constraintEqualToAnchor:v68 constant:-(v69 + *(double *)&kActiveLayout_11_0)];
    v224[13] = v70;
    v207 = [MEMORY[0x263EFF8C0] arrayWithObjects:v224 count:14];

    v71 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label firstBaselineAnchor];
    v72 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:*(double *)&kActiveLayout_2_4];
    v223[0] = v73;
    v74 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide topAnchor];
    v75 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    v223[1] = v76;
    uint64_t v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v223 count:2];
    withoutHeaderConstraints = v3->_withoutHeaderConstraints;
    v3->_withoutHeaderConstraints = (NSArray *)v77;

    v205 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label firstBaselineAnchor];
    v79 = [(CLKUIColoringLabel *)v3->_headerLabel lastBaselineAnchor];
    v80 = [v205 constraintEqualToAnchor:v79 constant:*(double *)&kActiveLayout_2_4];
    v222[0] = v80;
    v81 = [(CLKUIColoringLabel *)v3->_headerLabel firstBaselineAnchor];
    v82 = [(UILayoutGuide *)v3->_contentLayoutGuide topAnchor];
    v83 = [v81 constraintEqualToAnchor:v82 constant:*(double *)&kActiveLayout_1_4];
    v222[1] = v83;
    v84 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide topAnchor];
    v85 = [(CLKUIColoringLabel *)v3->_headerLabel lastBaselineAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    v222[2] = v86;
    uint64_t v87 = [MEMORY[0x263EFF8C0] arrayWithObjects:v222 count:3];
    withHeaderConstraints = v3->_withHeaderConstraints;
    v3->_withHeaderConstraints = (NSArray *)v87;

    v89 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v90 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v91 = [v89 constraintEqualToAnchor:v90];
    v221[0] = v91;
    v92 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v93 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    v221[1] = v94;
    uint64_t v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v221 count:2];
    headerWithNoImageConstraints = v3->_headerWithNoImageConstraints;
    v3->_headerWithNoImageConstraints = (NSArray *)v95;

    v97 = [(REUpNextImageView *)v3->_headerImage leadingAnchor];
    v98 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];
    v220[0] = v99;
    v100 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v101 = [(REUpNextImageView *)v3->_headerImage trailingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101 constant:*(double *)&kActiveLayout_4_2];
    v220[1] = v102;
    v103 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v104 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    v220[2] = v105;
    uint64_t v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v220 count:3];
    headerWithLeftImageConstraints = v3->_headerWithLeftImageConstraints;
    v3->_headerWithLeftImageConstraints = (NSArray *)v106;

    v108 = [(CLKUIColoringLabel *)v3->_headerLabel leadingAnchor];
    v109 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v110 = [v108 constraintEqualToAnchor:v109];
    v219[0] = v110;
    v111 = [(CLKUIColoringLabel *)v3->_headerLabel trailingAnchor];
    v112 = [(REUpNextImageView *)v3->_headerImage leadingAnchor];
    v113 = [v111 constraintEqualToAnchor:v112 constant:-*(double *)&kActiveLayout_4_2];
    v219[1] = v113;
    v114 = [(REUpNextImageView *)v3->_headerImage trailingAnchor];
    v115 = [(UILayoutGuide *)v3->_contentLayoutGuide trailingAnchor];
    v116 = [v114 constraintEqualToAnchor:v115];
    v219[2] = v116;
    uint64_t v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:v219 count:3];
    headerWithRightImageConstraints = v3->_headerWithRightImageConstraints;
    v3->_headerWithRightImageConstraints = (NSArray *)v117;

    v211 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label firstBaselineAnchor];
    v203 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label lastBaselineAnchor];
    v119 = [v211 constraintEqualToAnchor:v203 constant:*(double *)&kActiveLayout_3_2];
    v218[0] = v119;
    v120 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label lastBaselineAnchor];
    v121 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide bottomAnchor];
    v122 = [v120 constraintEqualToAnchor:v121];
    v218[1] = v122;
    v123 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide bottomAnchor];
    v124 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label lastBaselineAnchor];
    v125 = [v123 constraintEqualToAnchor:v124 constant:*(double *)&kActiveLayout_11_0];
    v218[2] = v125;
    uint64_t v126 = [MEMORY[0x263EFF8C0] arrayWithObjects:v218 count:3];
    withDescription2Constraints = v3->_withDescription2Constraints;
    v3->_withDescription2Constraints = (NSArray *)v126;

    v128 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label lastBaselineAnchor];
    v129 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide bottomAnchor];
    v130 = [v128 constraintLessThanOrEqualToAnchor:v129];
    v217[0] = v130;
    v131 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide bottomAnchor];
    v132 = [(CLKUIColoringLabel *)v3->_descriptionLine1Label lastBaselineAnchor];
    v133 = [v131 constraintEqualToAnchor:v132 constant:*(double *)&kActiveLayout_11_0];
    v217[1] = v133;
    uint64_t v134 = [MEMORY[0x263EFF8C0] arrayWithObjects:v217 count:2];
    withoutDescription2Constraints = v3->_withoutDescription2Constraints;
    v3->_withoutDescription2Constraints = (NSArray *)v134;

    v136 = [(CLKUIColoringLabel *)v3->_descriptionLine2Label leadingAnchor];
    v137 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v138 = [v136 constraintEqualToAnchor:v137];
    v216 = v138;
    uint64_t v139 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v216 count:1];
    withoutDescriptionAccessoryConstraints = v3->_withoutDescriptionAccessoryConstraints;
    v3->_withoutDescriptionAccessoryConstraints = (NSArray *)v139;

    v141 = [(REUpNextImageView *)v3->_descriptionImageView heightAnchor];
    v142 = [v141 constraintEqualToConstant:*(double *)&kActiveLayout_10_1];
    v215[0] = v142;
    v143 = [(REUpNextImageView *)v3->_descriptionImageView bottomAnchor];
    v144 = [(UILayoutGuide *)v3->_contentLayoutGuide bottomAnchor];
    v145 = [v143 constraintEqualToAnchor:v144 constant:-*(double *)&kActiveLayout_6_1];
    v215[1] = v145;
    v146 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v147 = [(REUpNextImageView *)v3->_descriptionImageView trailingAnchor];
    v148 = [v146 constraintEqualToAnchor:v147 constant:*(double *)&kActiveLayout_7_1];
    v215[2] = v148;
    uint64_t v149 = [MEMORY[0x263EFF8C0] arrayWithObjects:v215 count:3];
    withDescriptionImageViewConstraints = v3->_withDescriptionImageViewConstraints;
    v3->_withDescriptionImageViewConstraints = (NSArray *)v149;

    v201 = [(REUpNextImageView *)v3->_descriptionImageView topAnchor];
    v151 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide topAnchor];
    v152 = [v201 constraintEqualToAnchor:v151];
    v214[0] = v152;
    v153 = [(REUpNextImageView *)v3->_descriptionImageView bottomAnchor];
    v154 = [(UILayoutGuide *)v3->_bodyImageSizingLayoutGuide bottomAnchor];
    v155 = [v153 constraintEqualToAnchor:v154];
    v214[1] = v155;
    v156 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v157 = [(REUpNextImageView *)v3->_descriptionImageView trailingAnchor];
    v158 = [v156 constraintEqualToAnchor:v157 constant:*(double *)&kActiveLayout_7_1];
    v214[2] = v158;
    uint64_t v159 = [MEMORY[0x263EFF8C0] arrayWithObjects:v214 count:3];
    withStretchableDescriptionImageViewConstraints = v3->_withStretchableDescriptionImageViewConstraints;
    v3->_withStretchableDescriptionImageViewConstraints = (NSArray *)v159;

    v161 = [(UILayoutGuide *)v3->_descriptionTextLayoutGuide leadingAnchor];
    v162 = [(UILayoutGuide *)v3->_contentLayoutGuide leadingAnchor];
    v163 = [v161 constraintEqualToAnchor:v162];
    v213 = v163;
    uint64_t v164 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v213 count:1];
    withoutDescriptionImageViewConstraints = v3->_withoutDescriptionImageViewConstraints;
    v3->_withoutDescriptionImageViewConstraints = (NSArray *)v164;

    [MEMORY[0x263F08938] activateConstraints:v3->_withHeaderConstraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_headerWithNoImageConstraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_withoutDescription2Constraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_withoutDescriptionAccessoryConstraints];
    [MEMORY[0x263F08938] activateConstraints:v3->_withoutDescriptionImageViewConstraints];
    v3->_showingHeader = 1;
    v3->_headerImageEdge = 0;
    [(CLKUIColoringLabel *)v3->_descriptionLine2Label setHidden:1];
    [(REUpNextImageView *)v3->_descriptionImageView setHidden:1];
    [MEMORY[0x263F08938] activateConstraints:v207];
    [(CLKUIColoringLabel *)v3->_headerLabel setNumberOfLines:2];
    [(CLKUIColoringLabel *)v3->_descriptionLine1Label setNumberOfLines:2];
  }
  return v3;
}

id __39__REUpNextMultilineCell_initWithFrame___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F32120]);
  v1 = objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setLineBreakMode:4];
  [v1 setNowProvider:&__block_literal_global_5_0];

  return v1;
}

uint64_t __39__REUpNextMultilineCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x263EFF910] date];
}

- (void)_updateHeaderColor
{
  v3 = [(REUpNextBaseCell *)self content];
  if ([v3 tintColorAffectsHeader])
  {
    BOOL v4 = [(REUpNextBaseCell *)self shouldOverrideContentHeaderColor];

    if (!v4)
    {
      headerLabel = self->_headerLabel;
      id v8 = [(REUpNextBaseCell *)self content];
      v6 = [v8 tintColor];
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
  v9.super_class = (Class)REUpNextMultilineCell;
  [(REUpNextBaseCell *)&v9 defaultTextColorDidChange];
  [(REUpNextMultilineCell *)self _updateHeaderColor];
  descriptionLine1Label = self->_descriptionLine1Label;
  BOOL v4 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextColor:v4];

  descriptionLine2Label = self->_descriptionLine2Label;
  v6 = [(REUpNextBaseCell *)self defaultTextColor];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextColor:v6];

  accessoryView = self->_accessoryView;
  id v8 = [(REUpNextBaseCell *)self defaultTextColor];
  [(REUpNextAccessoryView *)accessoryView setTextColor:v8];
}

- (void)updateConstraints
{
  v59[3] = *MEMORY[0x263EF8340];
  v3 = [(REUpNextBaseCell *)self content];
  BOOL v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [v3 description2TextProvider];
  BOOL v7 = v6 != 0;

  if (self->_showingThreeLineLayout != v7)
  {
    self->_showingThreeLineLayout = v7;
    [(CLKUIColoringLabel *)self->_descriptionLine2Label setHidden:v6 == 0];
    if (self->_showingThreeLineLayout) {
      id v8 = &OBJC_IVAR___REUpNextMultilineCell__withoutDescription2Constraints;
    }
    else {
      id v8 = &OBJC_IVAR___REUpNextMultilineCell__withDescription2Constraints;
    }
    if (self->_showingThreeLineLayout) {
      objc_super v9 = &OBJC_IVAR___REUpNextMultilineCell__withDescription2Constraints;
    }
    else {
      objc_super v9 = &OBJC_IVAR___REUpNextMultilineCell__withoutDescription2Constraints;
    }
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v8)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9)];
  }
  uint64_t v10 = [v3 headerTextProvider];
  BOOL v11 = v10 != 0;

  unint64_t v12 = 0x267D3B000uLL;
  if (self->_showingHeader != v11)
  {
    self->_showingHeader = v11;
    [(CLKUIColoringLabel *)self->_headerLabel setHidden:v10 == 0];
    if (self->_showingHeader) {
      v13 = &OBJC_IVAR___REUpNextMultilineCell__withoutHeaderConstraints;
    }
    else {
      v13 = &OBJC_IVAR___REUpNextMultilineCell__withHeaderConstraints;
    }
    if (self->_showingHeader) {
      uint64_t v14 = &OBJC_IVAR___REUpNextMultilineCell__withHeaderConstraints;
    }
    else {
      uint64_t v14 = &OBJC_IVAR___REUpNextMultilineCell__withoutHeaderConstraints;
    }
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14)];
  }
  v15 = [v3 headerImageProvider];
  if (!v15)
  {
    v16 = [v3 overrideHeaderImage];
    if (v16) {
      BOOL v17 = v10 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v11 = !v17;
  }
  unsigned int v18 = [v3 headerImageEdge];
  if (self->_showingHeaderImage != v11 || v18 != self->_headerImageEdge)
  {
    self->_showingHeaderImage = v11;
    self->_headerImageEdge = v18;
    headerImage = self->_headerImage;
    if (self->_showingHeaderImage)
    {
      [(REUpNextImageView *)headerImage setHidden:0];
      [v5 addObjectsFromArray:self->_headerWithNoImageConstraints];
      int v20 = [v3 headerImageEdge];
      if (v20 == 2) {
        v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithLeftImageConstraints;
      }
      else {
        v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
      }
      if (v20 == 2) {
        double v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
      }
      else {
        double v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithLeftImageConstraints;
      }
    }
    else
    {
      [(REUpNextImageView *)headerImage setHidden:1];
      [v5 addObjectsFromArray:self->_headerWithLeftImageConstraints];
      double v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithNoImageConstraints;
      v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
    }
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v21)];
    [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v22)];
  }
  uint64_t v23 = [v3 descriptionAccessory];
  BOOL v24 = v23 != 0;

  if (self->_showingAccessory == v24)
  {
    if (!v23) {
      goto LABEL_45;
    }
LABEL_43:
    BOOL v36 = 0;
    goto LABEL_49;
  }
  self->_showingAccessory = v24;
  if (v23)
  {
    if (!self->_accessoryView)
    {
      v25 = [REUpNextAccessoryView alloc];
      v26 = -[REUpNextAccessoryView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      accessoryView = self->_accessoryView;
      self->_accessoryView = v26;

      double v28 = self->_accessoryView;
      double v29 = [v3 descriptionAccessory];
      [(REUpNextAccessoryView *)v28 configureWithDescription:v29];

      [(REUpNextAccessoryView *)self->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      v56 = [(CLKUIColoringLabel *)self->_descriptionLine2Label leadingAnchor];
      v55 = [(REUpNextAccessoryView *)self->_accessoryView trailingAnchor];
      v54 = [v56 constraintEqualToAnchor:v55 constant:*(double *)&kActiveLayout_0_4];
      v59[0] = v54;
      v53 = [(REUpNextAccessoryView *)self->_accessoryView leadingAnchor];
      v52 = [(UILayoutGuide *)self->_descriptionTextLayoutGuide leadingAnchor];
      v51 = [v53 constraintEqualToAnchor:v52];
      v59[1] = v51;
      double v30 = [(REUpNextAccessoryView *)self->_accessoryView firstBaselineAnchor];
      double v31 = [(CLKUIColoringLabel *)self->_descriptionLine2Label firstBaselineAnchor];
      uint64_t v32 = [v30 constraintEqualToAnchor:v31];
      v59[2] = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
      withDescriptionAccessoryConstraints = self->_withDescriptionAccessoryConstraints;
      self->_withDescriptionAccessoryConstraints = v33;
    }
    double v35 = [(REUpNextMultilineCell *)self contentView];
    [v35 addSubview:self->_accessoryView];

    [v5 addObjectsFromArray:self->_withoutDescriptionAccessoryConstraints];
    [v4 addObjectsFromArray:self->_withDescriptionAccessoryConstraints];
    goto LABEL_43;
  }
  [v5 addObjectsFromArray:self->_withDescriptionAccessoryConstraints];
  [v4 addObjectsFromArray:self->_withoutDescriptionAccessoryConstraints];
  [(REUpNextAccessoryView *)self->_accessoryView removeFromSuperview];
LABEL_45:
  double v37 = [v3 bodyImageProvider];
  if (v37)
  {
    BOOL v36 = 1;
  }
  else
  {
    double v38 = [v3 overrideBodyImage];
    BOOL v36 = v38 != 0;
  }
LABEL_49:
  int v39 = [v3 bodyImageShouldStretch];
  int v40 = v39;
  if (self->_showingDescriptionImage != v36 || self->_usingStretchableImage != v39)
  {
    self->_BOOL showingDescriptionImage = v36;
    self->_usingStretchableImage = v39;
    BOOL showingDescriptionImage = self->_showingDescriptionImage;
    if (self->_showingDescriptionImage)
    {
      [v5 addObjectsFromArray:self->_withoutDescriptionImageViewConstraints];
      BOOL v43 = v40 == 0;
      if (v40) {
        float v44 = 250.0;
      }
      else {
        float v44 = 1000.0;
      }
      if (v40) {
        uint64_t v45 = 0;
      }
      else {
        uint64_t v45 = 6;
      }
      v46 = &OBJC_IVAR___REUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      if (v43) {
        v47 = &OBJC_IVAR___REUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      }
      else {
        v47 = &OBJC_IVAR___REUpNextMultilineCell__withDescriptionImageViewConstraints;
      }
      if (v43) {
        v46 = &OBJC_IVAR___REUpNextMultilineCell__withDescriptionImageViewConstraints;
      }
      v57 = v46;
      *(float *)&double v42 = v44;
      [(REUpNextImageView *)self->_descriptionImageView setContentHuggingPriority:1 forAxis:v42];
      *(float *)&double v48 = v44;
      [(REUpNextImageView *)self->_descriptionImageView setContentCompressionResistancePriority:1 forAxis:v48];
      [(REUpNextImageView *)self->_descriptionImageView setContentMode:v45];
      unint64_t v12 = 0x267D3B000;
      [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v47)];
      [v4 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v57)];
    }
    else
    {
      [v5 addObjectsFromArray:self->_withDescriptionImageViewConstraints];
      [v5 addObjectsFromArray:self->_withStretchableDescriptionImageViewConstraints];
      [v4 addObjectsFromArray:self->_withoutDescriptionImageViewConstraints];
    }
    [(REUpNextImageView *)self->_descriptionImageView setHidden:!showingDescriptionImage];
  }
  [MEMORY[0x263F08938] deactivateConstraints:v5];
  [MEMORY[0x263F08938] activateConstraints:v4];
  if (self->_showingThreeLineLayout)
  {
    uint64_t v49 = 1;
    uint64_t v50 = 1;
  }
  else if (self->_showingHeaderImage || self->_showingDescriptionImage)
  {
    uint64_t v50 = 2;
    uint64_t v49 = 1;
  }
  else
  {
    if (!self->_showingHeader)
    {
      uint64_t v50 = 3;
      goto LABEL_73;
    }
    uint64_t v49 = 2;
    uint64_t v50 = 2;
  }
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + *(int *)(v12 + 2788)) setNumberOfLines:v49];
LABEL_73:
  [(CLKUIColoringLabel *)self->_descriptionLine1Label setNumberOfLines:v50];
  v58.receiver = self;
  v58.super_class = (Class)REUpNextMultilineCell;
  [(REUpNextMultilineCell *)&v58 updateConstraints];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)REUpNextMultilineCell;
  [(REUpNextBaseCell *)&v30 configureWithContent:v4];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __46__REUpNextMultilineCell_configureWithContent___block_invoke;
  v29[3] = &unk_2644B7CB8;
  v29[4] = self;
  v5 = (void (**)(void, void, void))MEMORY[0x223C2D7E0](v29);
  ((void (**)(void, CLKUIColoringLabel *, uint64_t))v5)[2](v5, self->_descriptionLine1Label, [v4 description1FontStyle]);
  ((void (**)(void, CLKUIColoringLabel *, uint64_t))v5)[2](v5, self->_descriptionLine2Label, [v4 description2FontStyle]);
  [(REUpNextMultilineCell *)self _updateHeaderColor];
  headerImage = self->_headerImage;
  BOOL v7 = [v4 tintColor];
  [(REUpNextImageView *)headerImage setFallbackTintColor:v7];

  id v8 = [v4 headerImageProvider];

  if (v8)
  {
    objc_super v9 = self->_headerImage;
    uint64_t v10 = [v4 headerImageProvider];
    [(REUpNextImageView *)v9 setImageProvider:v10];
  }
  else
  {
    BOOL v11 = [v4 overrideHeaderImage];

    if (!v11) {
      goto LABEL_6;
    }
    unint64_t v12 = self->_headerImage;
    uint64_t v10 = [v4 overrideHeaderImage];
    [(REUpNextImageView *)v12 setOverrideImage:v10];
  }

LABEL_6:
  descriptionImageView = self->_descriptionImageView;
  uint64_t v14 = [v4 tintColor];
  [(REUpNextImageView *)descriptionImageView setFallbackTintColor:v14];

  v15 = [v4 bodyImageProvider];

  if (v15)
  {
    v16 = self->_descriptionImageView;
    BOOL v17 = [v4 bodyImageProvider];
    [(REUpNextImageView *)v16 setImageProvider:v17];
LABEL_10:

    goto LABEL_11;
  }
  unsigned int v18 = [v4 overrideBodyImage];

  if (v18)
  {
    v19 = self->_descriptionImageView;
    BOOL v17 = [v4 overrideBodyImage];
    [(REUpNextImageView *)v19 setOverrideImage:v17];
    goto LABEL_10;
  }
LABEL_11:
  headerLabel = self->_headerLabel;
  v21 = [v4 headerTextProvider];
  [(CLKUIColoringLabel *)headerLabel setTextProvider:v21];

  descriptionLine1Label = self->_descriptionLine1Label;
  uint64_t v23 = [v4 description1TextProvider];
  [(CLKUIColoringLabel *)descriptionLine1Label setTextProvider:v23];

  descriptionLine2Label = self->_descriptionLine2Label;
  v25 = [v4 description2TextProvider];
  [(CLKUIColoringLabel *)descriptionLine2Label setTextProvider:v25];

  v26 = [v4 headerTextProvider];
  [v26 setPaused:0];

  v27 = [v4 description1TextProvider];
  [v27 setPaused:0];

  double v28 = [v4 description2TextProvider];
  [v28 setPaused:0];

  [(REUpNextMultilineCell *)self setNeedsUpdateConstraints];
}

void __46__REUpNextMultilineCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = 0.0;
  id v8 = v5;
  BOOL v7 = &OBJC_IVAR___REUpNextMultilineCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!REIsCurrentLocaleCJK()) {
        BOOL v7 = &OBJC_IVAR___REUpNextMultilineCell__italicFont;
      }
      goto LABEL_7;
    case 2:
      BOOL v7 = &OBJC_IVAR___REUpNextMultilineCell__boldFont;
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
  objc_storeStrong((id *)&self->_withoutDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withStretchableDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withoutDescriptionAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionImageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImageSizingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_descriptionTextLayoutGuide, 0);

  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end