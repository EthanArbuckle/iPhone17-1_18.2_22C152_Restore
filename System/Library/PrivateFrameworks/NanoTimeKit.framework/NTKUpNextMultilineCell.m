@interface NTKUpNextMultilineCell
+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3;
- (NTKUpNextMultilineCell)initWithFrame:(CGRect)a3;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (void)configureWithContent:(id)a3;
- (void)prepareForReuse;
- (void)setFilterProvider:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateConstraints;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextMultilineCell

+ (CGSize)suggestedBodyImageSizeForDevice:(id)a3
{
  uint64_t v3 = [a3 sizeClass];
  double v4 = 27.0;
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 2:
    case 4:
      double v4 = 31.0;
      break;
    default:
      double v4 = 34.0;
      break;
  }
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (NTKUpNextMultilineCell)initWithFrame:(CGRect)a3
{
  v244[14] = *MEMORY[0x1E4F143B8];
  v232.receiver = self;
  v232.super_class = (Class)NTKUpNextMultilineCell;
  uint64_t v3 = -[NTKUpNextBaseCell initWithFrame:](&v232, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    uint64_t v231 = 0;
    long long v229 = 0u;
    long long v230 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    double v5 = [(NTKUpNextBaseCell *)v3 device];
    _LayoutConstants_14(v5, (uint64_t)&v221);

    double v6 = *((double *)&v223 + 1);
    v7 = [MEMORY[0x1E4F19A50] systemFontOfSize:*((double *)&v223 + 1)];
    v8 = [v7 fontDescriptor];
    v219 = [v8 fontDescriptorWithSymbolicTraits:1];

    v9 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6];
    v10 = [v9 fontDescriptor];
    v218 = [v10 fontDescriptorWithSymbolicTraits:2];

    uint64_t v11 = [MEMORY[0x1E4F19A50] systemFontOfSize:v6 weight:*MEMORY[0x1E4FB09D0]];
    standardFont = v4->_standardFont;
    v4->_standardFont = (CLKFont *)v11;

    uint64_t v13 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v219 size:v6];
    italicFont = v4->_italicFont;
    v4->_italicFont = (CLKFont *)v13;

    uint64_t v15 = [MEMORY[0x1E4F19A50] fontWithDescriptor:v218 size:v6];
    boldFont = v4->_boldFont;
    v4->_boldFont = (CLKFont *)v15;

    uint64_t v17 = __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v17;

    [(CLKUIColoringLabel *)v4->_headerLabel setFont:v4->_boldFont];
    v19 = v4->_headerLabel;
    v20 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v19 setTextColor:v20];

    uint64_t v21 = __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    descriptionLine1Label = v4->_descriptionLine1Label;
    v4->_descriptionLine1Label = (CLKUIColoringLabel *)v21;

    v23 = v4->_descriptionLine1Label;
    v24 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v23 setTextColor:v24];

    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setFont:v4->_standardFont];
    v217 = [MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyle];
    [v217 setLineBreakMode:4];
    [v217 lineSpacing];
    [v217 setLineSpacing:v25 + *(double *)&v224];
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setParagraphStyle:v217];
    LODWORD(v26) = 1148846080;
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setContentHuggingPriority:1 forAxis:v26];
    uint64_t v27 = __40__NTKUpNextMultilineCell_initWithFrame___block_invoke();
    descriptionLine2Label = v4->_descriptionLine2Label;
    v4->_descriptionLine2Label = (CLKUIColoringLabel *)v27;

    v29 = v4->_descriptionLine2Label;
    v30 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v29 setTextColor:v30];

    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setFont:v4->_italicFont];
    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setNumberOfLines:1];
    v31 = [NTKUpNextImageView alloc];
    double v32 = *MEMORY[0x1E4F1DB28];
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v36 = -[NTKUpNextImageView initWithFrame:parentCell:](v31, "initWithFrame:parentCell:", v4, *MEMORY[0x1E4F1DB28], v33, v34, v35);
    headerImage = v4->_headerImage;
    v4->_headerImage = (NTKUpNextImageView *)v36;

    LODWORD(v38) = 1148846080;
    [(NTKUpNextImageView *)v4->_headerImage setContentHuggingPriority:0 forAxis:v38];
    LODWORD(v39) = 1148846080;
    [(NTKUpNextImageView *)v4->_headerImage setContentHuggingPriority:1 forAxis:v39];
    LODWORD(v40) = 1148846080;
    [(NTKUpNextImageView *)v4->_headerImage setContentCompressionResistancePriority:0 forAxis:v40];
    LODWORD(v41) = 1148846080;
    [(NTKUpNextImageView *)v4->_headerImage setContentCompressionResistancePriority:1 forAxis:v41];
    LODWORD(v42) = 1148846080;
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setContentCompressionResistancePriority:1 forAxis:v42];
    LODWORD(v43) = 1148829696;
    [(CLKUIColoringLabel *)v4->_headerLabel setContentCompressionResistancePriority:1 forAxis:v43];
    LODWORD(v44) = 1132003328;
    [(CLKUIColoringLabel *)v4->_headerLabel setContentHuggingPriority:1 forAxis:v44];
    [(NTKUpNextImageView *)v4->_headerImage setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = -[NTKUpNextImageView initWithFrame:parentCell:]([NTKUpNextImageView alloc], "initWithFrame:parentCell:", v4, v32, v33, v34, v35);
    descriptionImageView = v4->_descriptionImageView;
    v4->_descriptionImageView = v45;

    [(NTKUpNextImageView *)v4->_descriptionImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NTKUpNextImageView *)v4->_descriptionImageView setContentMode:6];
    LODWORD(v47) = 1148846080;
    [(NTKUpNextImageView *)v4->_descriptionImageView setContentHuggingPriority:0 forAxis:v47];
    LODWORD(v48) = 1148846080;
    [(NTKUpNextImageView *)v4->_descriptionImageView setContentCompressionResistancePriority:0 forAxis:v48];
    [(NTKUpNextImageView *)v4->_descriptionImageView setFilterProvider:v4];
    v49 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    contentLayoutGuide = v4->_contentLayoutGuide;
    v4->_contentLayoutGuide = v49;

    [(UILayoutGuide *)v4->_contentLayoutGuide setIdentifier:@"Multiline-Content"];
    v51 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    descriptionTextLayoutGuide = v4->_descriptionTextLayoutGuide;
    v4->_descriptionTextLayoutGuide = v51;

    [(UILayoutGuide *)v4->_descriptionTextLayoutGuide setIdentifier:@"Multiline-Description-Text"];
    v53 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    bodyImageSizingLayoutGuide = v4->_bodyImageSizingLayoutGuide;
    v4->_bodyImageSizingLayoutGuide = v53;

    [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide setIdentifier:@"Multiline-Body-Image"];
    v55 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v55 addLayoutGuide:v4->_contentLayoutGuide];

    v56 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v56 addLayoutGuide:v4->_descriptionTextLayoutGuide];

    v57 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v57 addLayoutGuide:v4->_bodyImageSizingLayoutGuide];

    v58 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v58 addSubview:v4->_headerImage];

    v59 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v59 addSubview:v4->_headerLabel];

    v60 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v60 addSubview:v4->_descriptionLine1Label];

    v61 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v61 addSubview:v4->_descriptionLine2Label];

    v62 = [(NTKUpNextMultilineCell *)v4 contentView];
    [v62 addSubview:v4->_descriptionImageView];

    [(CLKFont *)v4->_boldFont capHeight];
    v63 = [(NTKUpNextBaseCell *)v4 device];
    CLKRoundForDevice();
    double v65 = v64;

    v213 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
    v215 = [(NTKUpNextMultilineCell *)v4 contentView];
    v212 = [v215 topAnchor];
    v210 = [v213 constraintEqualToAnchor:v212 constant:*((double *)&v228 + 1)];
    v244[0] = v210;
    v208 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
    v209 = [(NTKUpNextMultilineCell *)v4 contentView];
    v207 = [v209 bottomAnchor];
    v206 = [v208 constraintEqualToAnchor:v207 constant:-*((double *)&v229 + 1)];
    v244[1] = v206;
    v204 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v205 = [(NTKUpNextMultilineCell *)v4 contentView];
    v203 = [v205 leadingAnchor];
    v202 = [v204 constraintEqualToAnchor:v203 constant:*(double *)&v229];
    v244[2] = v202;
    v200 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
    v201 = [(NTKUpNextMultilineCell *)v4 contentView];
    v199 = [v201 trailingAnchor];
    v198 = [v200 constraintEqualToAnchor:v199 constant:-*(double *)&v230];
    v244[3] = v198;
    v197 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide trailingAnchor];
    v196 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
    v195 = [v197 constraintEqualToAnchor:v196];
    v244[4] = v195;
    v194 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide bottomAnchor];
    v193 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
    v192 = [v194 constraintEqualToAnchor:v193 constant:-*((double *)&v224 + 1)];
    v244[5] = v192;
    v191 = [(NTKUpNextImageView *)v4->_headerImage centerYAnchor];
    v190 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
    v189 = [v191 constraintEqualToAnchor:v190 constant:-v65];
    v244[6] = v189;
    v188 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label leadingAnchor];
    v187 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v186 = [v188 constraintEqualToAnchor:v187];
    v244[7] = v186;
    v185 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label trailingAnchor];
    v184 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide trailingAnchor];
    v183 = [v185 constraintEqualToAnchor:v184];
    v244[8] = v183;
    v182 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label trailingAnchor];
    v181 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide trailingAnchor];
    v180 = [v182 constraintEqualToAnchor:v181];
    v244[9] = v180;
    v179 = [(NTKUpNextImageView *)v4->_descriptionImageView leadingAnchor];
    v178 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v177 = [v179 constraintEqualToAnchor:v178 constant:*(double *)&v226];
    v244[10] = v177;
    v66 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide leadingAnchor];
    v67 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v68 = [v66 constraintEqualToAnchor:v67];
    v244[11] = v68;
    v69 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide trailingAnchor];
    v70 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide trailingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    v244[12] = v71;
    v72 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide topAnchor];
    v73 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
    [(CLKFont *)v4->_standardFont capHeight];
    v75 = [v72 constraintEqualToAnchor:v73 constant:-(v74 + *((double *)&v227 + 1))];
    v244[13] = v75;
    v216 = [MEMORY[0x1E4F1C978] arrayWithObjects:v244 count:14];

    v76 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
    v77 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
    double v78 = *(double *)&v222;
    v79 = [v76 constraintEqualToAnchor:v77 constant:*(double *)&v222];
    v243[0] = v79;
    v80 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide topAnchor];
    v81 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    v243[1] = v82;
    uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:2];
    withoutHeaderConstraints = v4->_withoutHeaderConstraints;
    v4->_withoutHeaderConstraints = (NSArray *)v83;

    v214 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label firstBaselineAnchor];
    v85 = [(CLKUIColoringLabel *)v4->_headerLabel lastBaselineAnchor];
    v86 = [v214 constraintEqualToAnchor:v85 constant:v78];
    v242[0] = v86;
    v87 = [(CLKUIColoringLabel *)v4->_headerLabel firstBaselineAnchor];
    v88 = [(UILayoutGuide *)v4->_contentLayoutGuide topAnchor];
    v89 = [v87 constraintEqualToAnchor:v88 constant:*((double *)&v221 + 1)];
    v242[1] = v89;
    v90 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide topAnchor];
    v91 = [(CLKUIColoringLabel *)v4->_headerLabel lastBaselineAnchor];
    v92 = [v90 constraintEqualToAnchor:v91];
    v242[2] = v92;
    uint64_t v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v242 count:3];
    withHeaderConstraints = v4->_withHeaderConstraints;
    v4->_withHeaderConstraints = (NSArray *)v93;

    v95 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
    v96 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v97 = [v95 constraintEqualToAnchor:v96];
    v241[0] = v97;
    v98 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
    v99 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
    v100 = [v98 constraintEqualToAnchor:v99];
    v241[1] = v100;
    uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v241 count:2];
    headerWithNoImageConstraints = v4->_headerWithNoImageConstraints;
    v4->_headerWithNoImageConstraints = (NSArray *)v101;

    v103 = [(NTKUpNextImageView *)v4->_headerImage leadingAnchor];
    v104 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    v240[0] = v105;
    v106 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
    v107 = [(NTKUpNextImageView *)v4->_headerImage trailingAnchor];
    double v108 = *(double *)&v223;
    v109 = [v106 constraintEqualToAnchor:v107 constant:*(double *)&v223];
    v240[1] = v109;
    v110 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
    v111 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
    v112 = [v110 constraintEqualToAnchor:v111];
    v240[2] = v112;
    uint64_t v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v240 count:3];
    headerWithLeftImageConstraints = v4->_headerWithLeftImageConstraints;
    v4->_headerWithLeftImageConstraints = (NSArray *)v113;

    v115 = [(CLKUIColoringLabel *)v4->_headerLabel leadingAnchor];
    v116 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v117 = [v115 constraintEqualToAnchor:v116];
    v239[0] = v117;
    v118 = [(CLKUIColoringLabel *)v4->_headerLabel trailingAnchor];
    v119 = [(NTKUpNextImageView *)v4->_headerImage leadingAnchor];
    v120 = [v118 constraintEqualToAnchor:v119 constant:-v108];
    v239[1] = v120;
    v121 = [(NTKUpNextImageView *)v4->_headerImage trailingAnchor];
    v122 = [(UILayoutGuide *)v4->_contentLayoutGuide trailingAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    v239[2] = v123;
    uint64_t v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v239 count:3];
    headerWithRightImageConstraints = v4->_headerWithRightImageConstraints;
    v4->_headerWithRightImageConstraints = (NSArray *)v124;

    v220 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label firstBaselineAnchor];
    v126 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label lastBaselineAnchor];
    v127 = [v220 constraintEqualToAnchor:v126 constant:*((double *)&v222 + 1) + *(double *)&v224];
    v238[0] = v127;
    v128 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label lastBaselineAnchor];
    v129 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide bottomAnchor];
    v130 = [v128 constraintEqualToAnchor:v129];
    v238[1] = v130;
    v131 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide bottomAnchor];
    v132 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label lastBaselineAnchor];
    double v133 = *((double *)&v227 + 1);
    v134 = [v131 constraintEqualToAnchor:v132 constant:*((double *)&v227 + 1)];
    v238[2] = v134;
    uint64_t v135 = [MEMORY[0x1E4F1C978] arrayWithObjects:v238 count:3];
    withDescription2Constraints = v4->_withDescription2Constraints;
    v4->_withDescription2Constraints = (NSArray *)v135;

    v137 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label lastBaselineAnchor];
    v138 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide bottomAnchor];
    v139 = [v137 constraintLessThanOrEqualToAnchor:v138];
    v237[0] = v139;
    v140 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide bottomAnchor];
    v141 = [(CLKUIColoringLabel *)v4->_descriptionLine1Label lastBaselineAnchor];
    v142 = [v140 constraintEqualToAnchor:v141 constant:v133];
    v237[1] = v142;
    uint64_t v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v237 count:2];
    withoutDescription2Constraints = v4->_withoutDescription2Constraints;
    v4->_withoutDescription2Constraints = (NSArray *)v143;

    v145 = [(CLKUIColoringLabel *)v4->_descriptionLine2Label leadingAnchor];
    v146 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v147 = [v145 constraintEqualToAnchor:v146];
    v236 = v147;
    uint64_t v148 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v236 count:1];
    withoutAccessoryConstraints = v4->_withoutAccessoryConstraints;
    v4->_withoutAccessoryConstraints = (NSArray *)v148;

    v150 = [(NTKUpNextImageView *)v4->_descriptionImageView heightAnchor];
    v151 = [v150 constraintEqualToConstant:*(double *)&v227];
    v235[0] = v151;
    v152 = [(NTKUpNextImageView *)v4->_descriptionImageView bottomAnchor];
    v153 = [(UILayoutGuide *)v4->_contentLayoutGuide bottomAnchor];
    v154 = [v152 constraintEqualToAnchor:v153 constant:-(*((double *)&v224 + 1) - *(double *)&v228)];
    v235[1] = v154;
    v155 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v156 = [(NTKUpNextImageView *)v4->_descriptionImageView trailingAnchor];
    double v157 = *((double *)&v225 + 1);
    v158 = [v155 constraintEqualToAnchor:v156 constant:*((double *)&v225 + 1)];
    v235[2] = v158;
    uint64_t v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:v235 count:3];
    withDescriptionImageViewConstraints = v4->_withDescriptionImageViewConstraints;
    v4->_withDescriptionImageViewConstraints = (NSArray *)v159;

    v211 = [(NTKUpNextImageView *)v4->_descriptionImageView topAnchor];
    v161 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide topAnchor];
    v162 = [v211 constraintEqualToAnchor:v161];
    v234[0] = v162;
    v163 = [(NTKUpNextImageView *)v4->_descriptionImageView bottomAnchor];
    v164 = [(UILayoutGuide *)v4->_bodyImageSizingLayoutGuide bottomAnchor];
    v165 = [v163 constraintEqualToAnchor:v164];
    v234[1] = v165;
    v166 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v167 = [(NTKUpNextImageView *)v4->_descriptionImageView trailingAnchor];
    v168 = [v166 constraintEqualToAnchor:v167 constant:v157];
    v234[2] = v168;
    uint64_t v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:v234 count:3];
    withStretchableDescriptionImageViewConstraints = v4->_withStretchableDescriptionImageViewConstraints;
    v4->_withStretchableDescriptionImageViewConstraints = (NSArray *)v169;

    v171 = [(UILayoutGuide *)v4->_descriptionTextLayoutGuide leadingAnchor];
    v172 = [(UILayoutGuide *)v4->_contentLayoutGuide leadingAnchor];
    v173 = [v171 constraintEqualToAnchor:v172];
    v233 = v173;
    uint64_t v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v233 count:1];
    withoutDescriptionImageViewConstraints = v4->_withoutDescriptionImageViewConstraints;
    v4->_withoutDescriptionImageViewConstraints = (NSArray *)v174;

    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withHeaderConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_headerWithNoImageConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutDescription2Constraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutAccessoryConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4->_withoutDescriptionImageViewConstraints];
    v4->_showingHeader = 1;
    v4->_headerImageEdge = 0;
    [(CLKUIColoringLabel *)v4->_descriptionLine2Label setHidden:1];
    [(NTKUpNextImageView *)v4->_descriptionImageView setHidden:1];
    [MEMORY[0x1E4F28DC8] activateConstraints:v216];
    [(CLKUIColoringLabel *)v4->_headerLabel setNumberOfLines:2];
    [(CLKUIColoringLabel *)v4->_descriptionLine1Label setNumberOfLines:2];
  }
  return v4;
}

id __40__NTKUpNextMultilineCell_initWithFrame___block_invoke()
{
  id v0 = objc_alloc((Class)off_1E62BDB58);
  v1 = objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 setLineBreakMode:4];
  [v1 _setUseShortcutIntrinsicContentSize:1];
  [v1 setNowProvider:&__block_literal_global_4_0];
  return v1;
}

uint64_t __40__NTKUpNextMultilineCell_initWithFrame___block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (void)updateConstraints
{
  v116[3] = *MEMORY[0x1E4F143B8];
  double v114 = 0.0;
  long long v112 = 0u;
  long long v113 = 0u;
  memset(v111, 0, sizeof(v111));
  uint64_t v3 = [(NTKUpNextBaseCell *)self device];
  _LayoutConstants_14(v3, (uint64_t)v111);

  double v4 = [(NTKUpNextBaseCell *)self content];
  double v5 = objc_opt_new();
  double v6 = objc_opt_new();
  v109 = v4;
  v7 = [v4 description2TextProvider];
  BOOL v8 = v7 != 0;

  if (self->_showingThirdLine != v8)
  {
    self->_showingThirdLine = v8;
    [(CLKUIColoringLabel *)self->_descriptionLine2Label setHidden:v7 == 0];
    if (self->_showingThirdLine) {
      v9 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutDescription2Constraints;
    }
    else {
      v9 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescription2Constraints;
    }
    if (self->_showingThirdLine) {
      v10 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescription2Constraints;
    }
    else {
      v10 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutDescription2Constraints;
    }
    [v6 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9)];
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v10)];
  }
  uint64_t v11 = [v4 headerTextProvider];
  BOOL v12 = v11 != 0;

  uint64_t v13 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
  if (self->_showingHeader != v12)
  {
    self->_showingHeader = v12;
    [(CLKUIColoringLabel *)self->_headerLabel setHidden:v11 == 0];
    if (self->_showingHeader) {
      v14 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutHeaderConstraints;
    }
    else {
      v14 = &OBJC_IVAR___NTKUpNextMultilineCell__withHeaderConstraints;
    }
    if (self->_showingHeader) {
      uint64_t v15 = &OBJC_IVAR___NTKUpNextMultilineCell__withHeaderConstraints;
    }
    else {
      uint64_t v15 = &OBJC_IVAR___NTKUpNextMultilineCell__withoutHeaderConstraints;
    }
    [v6 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14)];
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v15)];
  }
  v16 = [v109 headerImageProvider];
  if (!v16)
  {
    uint64_t v17 = [v109 overrideHeaderImage];
    if (v17) {
      BOOL v18 = v11 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    BOOL v12 = !v18;
  }
  unsigned int v19 = [v109 headerImageEdge];
  if (self->_showingHeaderImage != v12 || v19 != self->_headerImageEdge)
  {
    self->_showingHeaderImage = v12;
    self->_headerImageEdge = v19;
    headerImage = self->_headerImage;
    if (self->_showingHeaderImage)
    {
      [(NTKUpNextImageView *)headerImage setHidden:0];
      [v6 addObjectsFromArray:self->_headerWithNoImageConstraints];
      int v21 = [v109 headerImageEdge];
      if (v21 == 2) {
        v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithLeftImageConstraints;
      }
      else {
        v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
      }
      if (v21 == 2) {
        v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
      }
      else {
        v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithLeftImageConstraints;
      }
    }
    else
    {
      [(NTKUpNextImageView *)headerImage setHidden:1];
      [v6 addObjectsFromArray:self->_headerWithLeftImageConstraints];
      v23 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithNoImageConstraints;
      v22 = &OBJC_IVAR___NTKUpNextMultilineCell__headerWithRightImageConstraints;
    }
    [v6 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v22)];
    [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v23)];
  }
  if (objc_opt_respondsToSelector())
  {
    double v108 = [v109 imageAccessory];
  }
  else
  {
    double v108 = 0;
  }
  v24 = [v109 descriptionAccessory];
  int v25 = (int)v108;
  if (v24) {
    BOOL v26 = v108 == 0;
  }
  else {
    BOOL v26 = 0;
  }
  BOOL v27 = v26;

  if (v108)
  {
    v28 = [v109 descriptionAccessory];
    int v25 = v28 == 0;
  }
  v29 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
  if (self->_showingDescriptionAccessory == v27)
  {
    v30 = 0;
    BOOL v31 = self->_showingImageAccessory != v25;
LABEL_53:
    int v104 = v31;
    goto LABEL_54;
  }
  self->_showingDescriptionAccessory = v27;
  if (!v27)
  {
    v30 = 0;
    BOOL v31 = 1;
    goto LABEL_53;
  }
  p_accessoryView = &self->_accessoryView;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = 0;
    int v104 = 1;
    uint64_t v13 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
  }
  else
  {
    v100 = v5;
    if (self->_withAccessoryConstraints)
    {
      objc_msgSend(v6, "addObjectsFromArray:");
      withAccessoryConstraints = self->_withAccessoryConstraints;
      self->_withAccessoryConstraints = 0;
    }
    [(UIView *)*p_accessoryView removeFromSuperview];
    double v38 = *p_accessoryView;
    *p_accessoryView = 0;

    double v39 = [NTKUpNextAccessoryView alloc];
    v30 = -[NTKUpNextAccessoryView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NTKUpNextAccessoryView *)v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&self->_accessoryView, v30);
    v107 = [(CLKUIColoringLabel *)self->_descriptionLine2Label leadingAnchor];
    v105 = [(UIView *)*p_accessoryView trailingAnchor];
    v98 = [v107 constraintEqualToAnchor:v105 constant:*(double *)v111];
    v116[0] = v98;
    v96 = [(UIView *)*p_accessoryView leadingAnchor];
    v94 = [(UILayoutGuide *)self->_descriptionTextLayoutGuide leadingAnchor];
    double v40 = [v96 constraintEqualToAnchor:v94];
    v116[1] = v40;
    double v41 = [(UIView *)*p_accessoryView firstBaselineAnchor];
    double v42 = [(CLKUIColoringLabel *)self->_descriptionLine2Label firstBaselineAnchor];
    double v43 = [v41 constraintEqualToAnchor:v42];
    v116[2] = v43;
    double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
    v45 = self->_withAccessoryConstraints;
    self->_withAccessoryConstraints = v44;

    int v104 = 1;
    double v5 = v100;
    uint64_t v13 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
    v29 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
  }
LABEL_54:
  double v33 = [v109 descriptionAccessory];
  v106 = v30;
  [(NTKUpNextAccessoryView *)v30 configureWithDescription:v33];

  uint64_t v34 = v29[935];
  if (*((unsigned __int8 *)&self->super.super.super.super.super.super.isa + v34) == v25
    || (*((unsigned char *)&self->super.super.super.super.super.super.isa + v34) = v25, !v25))
  {
    uint64_t v36 = 0;
  }
  else
  {
    double v35 = &self->_accessoryView;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v36 = 0;
    }
    else
    {
      uint64_t v101 = v5;
      if (self->_withAccessoryConstraints)
      {
        objc_msgSend(v6, "addObjectsFromArray:");
        v46 = self->_withAccessoryConstraints;
        self->_withAccessoryConstraints = 0;
      }
      [(UIView *)*v35 removeFromSuperview];
      double v47 = *v35;
      *double v35 = 0;

      id v48 = objc_alloc(MEMORY[0x1E4FB1838]);
      v49 = objc_msgSend(v48, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v49 setContentMode:1];
      [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_storeStrong((id *)&self->_accessoryView, v49);
      [(CLKFont *)self->_italicFont capHeight];
      [(NTKUpNextBaseCell *)self device];
      v50 = uint64_t v85 = 936;
      CLKRoundForDevice();
      double v52 = v51;

      v99 = [(CLKUIColoringLabel *)self->_descriptionLine2Label leadingAnchor];
      v97 = [(UIView *)*v35 trailingAnchor];
      v95 = [v99 constraintEqualToAnchor:v97 constant:*(double *)v111];
      v115[0] = v95;
      uint64_t v93 = [(UIView *)*v35 centerYAnchor];
      v92 = [(CLKUIColoringLabel *)self->_descriptionLine2Label firstBaselineAnchor];
      v91 = [v93 constraintEqualToAnchor:v92 constant:-v52];
      v115[1] = v91;
      v89 = [(UIView *)*v35 leadingAnchor];
      v90 = [(NTKUpNextMultilineCell *)self contentView];
      v88 = [v90 leadingAnchor];
      v87 = [v89 constraintEqualToAnchor:v88 constant:*(double *)&v112];
      v115[2] = v87;
      v86 = [(UIView *)*v35 widthAnchor];
      v53 = [v86 constraintLessThanOrEqualToConstant:*((double *)&v113 + 1)];
      v115[3] = v53;
      v54 = [(UIView *)*v35 heightAnchor];
      double v55 = v114;
      v56 = [v54 constraintLessThanOrEqualToConstant:v114];
      v115[4] = v56;
      v57 = [(UIView *)*v35 widthAnchor];
      v58 = [v57 constraintGreaterThanOrEqualToConstant:v55];
      v115[5] = v58;
      v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:6];
      v60 = self->_withAccessoryConstraints;
      self->_withAccessoryConstraints = v59;

      uint64_t v36 = v49;
      double v5 = v101;
    }
    uint64_t v13 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
  }
  int v61 = v27 | v25;
  v62 = objc_msgSend(v108, "image", v85);
  uint64_t v63 = [v62 image];

  v103 = (void *)v63;
  [v36 setImage:v63];
  if (v104)
  {
    if (v61)
    {
      double v64 = [(NTKUpNextMultilineCell *)self contentView];
      [v64 addSubview:self->_accessoryView];

      [v5 addObjectsFromArray:self->_withAccessoryConstraints];
      [v6 addObjectsFromArray:self->_withoutAccessoryConstraints];
LABEL_70:
      BOOL v65 = 0;
      goto LABEL_76;
    }
    [v6 addObjectsFromArray:self->_withAccessoryConstraints];
    [v5 addObjectsFromArray:self->_withoutAccessoryConstraints];
    [(UIView *)self->_accessoryView removeFromSuperview];
  }
  else if (v61)
  {
    goto LABEL_70;
  }
  v66 = [v109 bodyImageProvider];
  if (v66)
  {
    BOOL v65 = 1;
  }
  else
  {
    v67 = [v109 overrideBodyImage];
    BOOL v65 = v67 != 0;
  }
LABEL_76:
  int v68 = [v109 bodyImageShouldStretch];
  int v69 = v68;
  if (self->_showingDescriptionImage != v65 || self->_usingStretchableImage != v68)
  {
    self->_BOOL showingDescriptionImage = v65;
    self->_usingStretchableImage = v68;
    BOOL showingDescriptionImage = self->_showingDescriptionImage;
    if (self->_showingDescriptionImage)
    {
      [v6 addObjectsFromArray:self->_withoutDescriptionImageViewConstraints];
      BOOL v72 = v69 == 0;
      if (v69) {
        float v73 = 250.0;
      }
      else {
        float v73 = 1000.0;
      }
      if (v69) {
        uint64_t v74 = 0;
      }
      else {
        uint64_t v74 = 6;
      }
      v75 = &OBJC_IVAR___NTKUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      v76 = v6;
      v77 = v5;
      if (v72) {
        double v78 = &OBJC_IVAR___NTKUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      }
      else {
        double v78 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescriptionImageViewConstraints;
      }
      if (v72) {
        v75 = &OBJC_IVAR___NTKUpNextMultilineCell__withDescriptionImageViewConstraints;
      }
      v102 = v75;
      *(float *)&double v71 = v73;
      [(NTKUpNextImageView *)self->_descriptionImageView setContentHuggingPriority:1 forAxis:v71];
      *(float *)&double v79 = v73;
      [(NTKUpNextImageView *)self->_descriptionImageView setContentCompressionResistancePriority:1 forAxis:v79];
      [(NTKUpNextImageView *)self->_descriptionImageView setContentMode:v74];
      uint64_t v80 = *v78;
      double v5 = v77;
      double v6 = v76;
      [v76 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v80)];
      [v5 addObjectsFromArray:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v102)];
    }
    else
    {
      [v6 addObjectsFromArray:self->_withDescriptionImageViewConstraints];
      [v6 addObjectsFromArray:self->_withStretchableDescriptionImageViewConstraints];
      [v5 addObjectsFromArray:self->_withoutDescriptionImageViewConstraints];
    }
    [(NTKUpNextImageView *)self->_descriptionImageView setHidden:!showingDescriptionImage];
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v6];
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  if (self->_showingThirdLine)
  {
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v13[911]) setNumberOfLines:1];
    descriptionLine1Label = self->_descriptionLine1Label;
    if (self->_showingHeader) {
      uint64_t v82 = 1;
    }
    else {
      uint64_t v82 = 2;
    }
  }
  else
  {
    if (self->_showingHeaderImage || self->_showingDescriptionImage)
    {
      uint64_t v83 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13[911]);
      uint64_t v84 = 1;
    }
    else
    {
      if (!self->_showingHeader)
      {
        descriptionLine1Label = self->_descriptionLine1Label;
        uint64_t v82 = 3;
        goto LABEL_102;
      }
      uint64_t v83 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13[911]);
      uint64_t v84 = 2;
    }
    [v83 setNumberOfLines:v84];
    descriptionLine1Label = self->_descriptionLine1Label;
    uint64_t v82 = 2;
  }
LABEL_102:
  [(CLKUIColoringLabel *)descriptionLine1Label setNumberOfLines:v82];
  v110.receiver = self;
  v110.super_class = (Class)NTKUpNextMultilineCell;
  [(NTKUpNextMultilineCell *)&v110 updateConstraints];
}

- (void)configureWithContent:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)NTKUpNextMultilineCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v28 configureWithContent:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__NTKUpNextMultilineCell_configureWithContent___block_invoke;
  aBlock[3] = &unk_1E62C36C0;
  aBlock[4] = self;
  double v5 = (void (**)(void *, CLKUIColoringLabel *, uint64_t))_Block_copy(aBlock);
  v5[2](v5, self->_descriptionLine1Label, [v4 description1FontStyle]);
  v5[2](v5, self->_descriptionLine2Label, [v4 description2FontStyle]);
  headerImage = self->_headerImage;
  v7 = [v4 tintColor];
  [(NTKUpNextImageView *)headerImage setFallbackTintColor:v7];

  BOOL v8 = self->_headerImage;
  v9 = [v4 overrideHeaderImage];
  v10 = [v4 headerImageProvider];
  [(NTKUpNextImageView *)v8 setFullColorImage:v9 tintableImageProvider:v10];

  descriptionImageView = self->_descriptionImageView;
  BOOL v12 = [v4 tintColor];
  [(NTKUpNextImageView *)descriptionImageView setFallbackTintColor:v12];

  uint64_t v13 = self->_descriptionImageView;
  v14 = [v4 overrideBodyImage];
  uint64_t v15 = [v4 bodyImageProvider];
  [(NTKUpNextImageView *)v13 setFullColorImage:v14 tintableImageProvider:v15];

  v16 = self->_descriptionImageView;
  uint64_t v17 = [v4 bodyImageCompositingFilter];
  [(NTKUpNextImageView *)v16 setCompositingFilter:v17];

  headerLabel = self->_headerLabel;
  unsigned int v19 = [v4 headerTextProvider];
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v19, headerLabel, v19);

  descriptionLine1Label = self->_descriptionLine1Label;
  int v21 = [v4 description1TextProvider];
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v21, descriptionLine1Label, v21);

  descriptionLine2Label = self->_descriptionLine2Label;
  v23 = [v4 description2TextProvider];
  __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2((uint64_t)v23, descriptionLine2Label, v23);

  v24 = [v4 headerTextProvider];
  objc_msgSend(v24, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  int v25 = [v4 description1TextProvider];
  objc_msgSend(v25, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));

  BOOL v26 = [v4 description2TextProvider];

  objc_msgSend(v26, "setPaused:", -[NTKUpNextBaseCell isPaused](self, "isPaused"));
  [(NTKUpNextMultilineCell *)self setNeedsUpdateConstraints];
}

void __47__NTKUpNextMultilineCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = 0.0;
  id v8 = v5;
  v7 = &OBJC_IVAR___NTKUpNextMultilineCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!CLKIsCurrentLocaleNonLatin()) {
        v7 = &OBJC_IVAR___NTKUpNextMultilineCell__italicFont;
      }
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___NTKUpNextMultilineCell__boldFont;
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

void __47__NTKUpNextMultilineCell_configureWithContent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 text];
  if ([v7 length])
  {
    id v8 = [v6 shortText];
    uint64_t v9 = [v8 length];

    id v10 = v12;
    if (!v9)
    {
      [v12 setTextProvider:0];
      uint64_t v11 = [v6 text];
      [v12 setText:v11];

      goto LABEL_9;
    }
  }
  else
  {

    id v10 = v12;
  }
  +[NTKUpNextBaseCell clearLabel:v10];
  [v12 setTextProvider:v4];
LABEL_9:
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKUpNextMultilineCell;
  -[NTKUpNextBaseCell setPaused:](&v8, sel_setPaused_);
  id v5 = [(CLKUIColoringLabel *)self->_headerLabel textProvider];
  [v5 setPaused:v3];

  id v6 = [(CLKUIColoringLabel *)self->_descriptionLine1Label textProvider];
  [v6 setPaused:v3];

  v7 = [(CLKUIColoringLabel *)self->_descriptionLine2Label textProvider];
  [v7 setPaused:v3];
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  objc_super v8 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v8) {
    CLKUIAssociatedNonAccentStyle();
  }
  uint64_t v9 = [(NTKUpNextBaseCell *)self filterProvider];
  id v10 = [v9 filtersForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v6) {
    CLKUIAssociatedNonAccentStyle();
  }
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  objc_super v8 = [v7 filtersForView:v6 style:a4];

  return v8;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  objc_super v8 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v8) {
    CLKUIAssociatedNonAccentStyle();
  }
  uint64_t v9 = [(NTKUpNextBaseCell *)self filterProvider];
  id v10 = [v9 filterForView:v8 style:a4 fraction:a5];

  return v10;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = (NTKUpNextImageView *)a3;
  if (self->_descriptionImageView == v6) {
    CLKUIAssociatedNonAccentStyle();
  }
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  objc_super v8 = [v7 filterForView:v6 style:a4];

  return v8;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NTKUpNextBaseCell *)self filterProvider];
  objc_super v8 = [v7 colorForView:v6 accented:v4];

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
  v5.super_class = (Class)NTKUpNextMultilineCell;
  [(NTKUpNextBaseCell *)&v5 prepareForReuse];
  [(NTKUpNextImageView *)self->_headerImage transitionToMonochromeWithFraction:0.0];
  [(NTKUpNextImageView *)self->_descriptionImageView transitionToMonochromeWithFraction:0.0];
  BOOL v3 = [(CLKUIColoringLabel *)self->_headerLabel layer];
  [v3 setFilters:0];

  id v4 = [(UIView *)self->_accessoryView layer];
  [v4 setFilters:0];
}

- (void)setFilterProvider:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextMultilineCell;
  id v4 = a3;
  [(NTKUpNextBaseCell *)&v5 setFilterProvider:v4];
  -[NTKUpNextImageView setFilterProvider:](self->_headerImage, "setFilterProvider:", v4, v5.receiver, v5.super_class);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKUpNextImageView transitionToMonochromeWithFraction:](self->_headerImage, "transitionToMonochromeWithFraction:");
  [(NTKUpNextImageView *)self->_descriptionImageView transitionToMonochromeWithFraction:a3];
  if (fabs(a3) >= 0.00000011920929)
  {
    id v6 = [(NTKUpNextBaseCell *)self filterProvider];
    id v11 = [v6 filtersForView:self style:2 fraction:a3];

    if (v11)
    {
      v7 = [(CLKUIColoringLabel *)self->_headerLabel layer];
      [v7 setFilters:v11];
    }
    objc_super v8 = [(NTKUpNextBaseCell *)self filterProvider];
    uint64_t v9 = [v8 filtersForView:self style:1 fraction:a3];

    if (v9)
    {
      id v10 = [(UIView *)self->_accessoryView layer];
      [v10 setFilters:v9];
    }
  }
  else
  {
    objc_super v5 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v5 setFilters:0];

    id v11 = [(UIView *)self->_accessoryView layer];
    [v11 setFilters:0];
  }
}

- (void)updateMonochromeColor
{
  [(NTKUpNextImageView *)self->_headerImage updateMonochromeColor];
  [(NTKUpNextImageView *)self->_descriptionImageView updateMonochromeColor];
  BOOL v3 = [(NTKUpNextBaseCell *)self filterProvider];
  id v8 = [v3 filtersForView:self style:2];

  if (v8)
  {
    id v4 = [(CLKUIColoringLabel *)self->_headerLabel layer];
    [v4 setFilters:v8];
  }
  objc_super v5 = [(NTKUpNextBaseCell *)self filterProvider];
  id v6 = [v5 filtersForView:self style:1];

  if (v6)
  {
    v7 = [(UIView *)self->_accessoryView layer];
    [v7 setFilters:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_withoutDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withStretchableDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withoutAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withAccessoryConstraints, 0);
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