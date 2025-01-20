@interface _TVRUIUpNextViewControllerCell
+ (BOOL)isStackedLayout;
+ (void)setIsStackedLayout:(BOOL)a3;
- (BOOL)hasURLForProductPageKind:(int64_t)a3;
- (BOOL)showsSeparator;
- (CAGradientLayer)gradientLayer;
- (NSArray)stackedLayoutConstraints;
- (NSArray)standardLayoutConstraints;
- (TVRCUpNextInfo)upNextInfo;
- (UIButton)actionButton;
- (UIImageView)attributionMaskImageView;
- (UIImageView)imageView;
- (UILabel)secondaryLabel;
- (UILabel)titleLabel;
- (UIProgressView)playbackProgressView;
- (UIView)gradientView;
- (UIView)separatorView;
- (_TVRUIUpNextViewControllerActionDelegate)delegate;
- (_TVRUIUpNextViewControllerCell)initWithFrame:(CGRect)a3;
- (id)_actionButton;
- (id)_actionButtonMenu;
- (id)_seasonEpisodeFormatString;
- (id)_secondaryTextForUpNextInfo:(id)a3;
- (id)urlForProductPageKind:(int64_t)a3;
- (void)_configureHierarchy;
- (void)_updateForUpNextInfo:(id)a3;
- (void)_updateLayoutConstraintsForCurrentSizeCategory;
- (void)_updateLayoutConstraintsForStackedLayout:(BOOL)a3;
- (void)_updateSeparatorVisibility;
- (void)actionButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)openProductPageForKind:(int64_t)a3;
- (void)openURL:(id)a3;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setStackedLayoutConstraints:(id)a3;
- (void)setStandardLayoutConstraints:(id)a3;
- (void)setUpNextInfo:(id)a3;
@end

@implementation _TVRUIUpNextViewControllerCell

- (_TVRUIUpNextViewControllerCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIUpNextViewControllerCell;
  v3 = -[_TVRUIUpNextViewControllerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_TVRUIUpNextViewControllerCell *)v3 _configureHierarchy];
    [(_TVRUIUpNextViewControllerCell *)v4 setShowsSeparator:1];
  }
  return v4;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)_TVRUIUpNextViewControllerCell;
  [(_TVRUIUpNextViewControllerCell *)&v8 prepareForReuse];
  v3 = [(_TVRUIUpNextViewControllerCell *)self imageView];
  [v3 setImage:0];

  v4 = [(_TVRUIUpNextViewControllerCell *)self titleLabel];
  [v4 setText:0];

  v5 = [(_TVRUIUpNextViewControllerCell *)self secondaryLabel];
  [v5 setText:0];

  [(_TVRUIUpNextViewControllerCell *)self setShowsSeparator:1];
  [(_TVRUIUpNextViewControllerCell *)self _updateLayoutConstraintsForCurrentSizeCategory];
  objc_super v6 = [(_TVRUIUpNextViewControllerCell *)self contentView];
  [v6 setNeedsLayout];

  v7 = [(_TVRUIUpNextViewControllerCell *)self contentView];
  [v7 layoutIfNeeded];
}

- (void)setShowsSeparator:(BOOL)a3
{
  self->_showsSeparator = a3;
  [(_TVRUIUpNextViewControllerCell *)self _updateSeparatorVisibility];
}

- (void)setUpNextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_upNextInfo, a3);
  id v5 = a3;
  [(_TVRUIUpNextViewControllerCell *)self _updateForUpNextInfo:v5];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)_TVRUIUpNextViewControllerCell;
  [(_TVRUIUpNextViewControllerCell *)&v23 layoutSubviews];
  v3 = [(_TVRUIUpNextViewControllerCell *)self gradientView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_TVRUIUpNextViewControllerCell *)self gradientLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(_TVRUIUpNextViewControllerCell *)self imageView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(_TVRUIUpNextViewControllerCell *)self attributionMaskImageView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);
}

+ (void)setIsStackedLayout:(BOOL)a3
{
  __tvrui_upNextViewControllerCellIsStackedLayout = a3;
}

+ (BOOL)isStackedLayout
{
  return __tvrui_upNextViewControllerCellIsStackedLayout;
}

- (void)_configureHierarchy
{
  v236[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  double v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v4, v5, v6, v7);
  double v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
  v219 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
  v225 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v4, v5, v6, v7);
  v226 = [(_TVRUIUpNextViewControllerCell *)self _actionButton];
  LODWORD(v11) = 1148846080;
  [(UIButton *)v226 setContentHuggingPriority:0 forAxis:v11];
  v12 = (void *)MEMORY[0x263F827E8];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v14 = [v12 imageNamed:@"CornerBlurAttributionMask" inBundle:v13 compatibleWithTraitCollection:0];
  [(UIImageView *)v9 setImage:v14];

  [(UIImageView *)v8 setMaskView:v9];
  v218 = v9;
  [(UIImageView *)v8 addSubview:v9];
  double v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  [(UIView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v16 = [MEMORY[0x263F157D0] layer];
  double v17 = [MEMORY[0x263F825C8] blackColor];
  id v18 = [v17 colorWithAlphaComponent:0.0];
  v236[0] = [v18 CGColor];
  double v19 = [MEMORY[0x263F825C8] blackColor];
  id v20 = [v19 colorWithAlphaComponent:0.8];
  v236[1] = [v20 CGColor];
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v236 count:2];
  [(CAGradientLayer *)v16 setColors:v21];

  -[CAGradientLayer setStartPoint:](v16, "setStartPoint:", 0.5, 0.0);
  -[CAGradientLayer setEndPoint:](v16, "setEndPoint:", 0.5, 1.0);
  v22 = [(UIView *)v15 layer];
  v217 = v16;
  [v22 insertSublayer:v16 atIndex:0];

  v224 = v15;
  [(UIImageView *)v8 addSubview:v15];
  objc_super v23 = (UIProgressView *)[objc_alloc(MEMORY[0x263F82AF0]) initWithProgressViewStyle:0];
  [(UIProgressView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(UIProgressView *)v23 setProgressTintColor:v24];

  v25 = [MEMORY[0x263F825C8] colorWithRed:0.847058824 green:0.847058824 blue:0.847058824 alpha:0.4];
  [(UIProgressView *)v23 setTrackTintColor:v25];

  LODWORD(v26) = 0.5;
  [(UIProgressView *)v23 setProgress:v26];
  v216 = v23;
  [(UIImageView *)v8 addSubview:v23];
  v227 = self;
  v27 = [(_TVRUIUpNextViewControllerCell *)self contentView];
  id v28 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 addSubview:v28];
  v29 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v10 setFont:v29];

  [(UILabel *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)v10 setTextColor:v30];

  [(UILabel *)v10 setNumberOfLines:2];
  [(UILabel *)v10 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v10 setAdjustsFontSizeToFitWidth:1];
  LODWORD(v31) = 1148846080;
  [(UILabel *)v10 setContentHuggingPriority:1 forAxis:v31];
  v221 = v10;
  v32 = v10;
  v33 = v219;
  [v28 addSubview:v32];
  v34 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  [(UILabel *)v219 setFont:v34];

  [(UILabel *)v219 setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)v219 setTextColor:v35];

  [(UILabel *)v219 setNumberOfLines:2];
  [(UILabel *)v219 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v36) = 1148846080;
  [(UILabel *)v219 setContentHuggingPriority:1 forAxis:v36];
  [v28 addSubview:v219];
  v37 = [MEMORY[0x263F825C8] colorWithWhite:0.25 alpha:1.0];
  [(UIView *)v225 setBackgroundColor:v37];

  [(UIImageView *)v8 _setContinuousCornerRadius:8.0];
  [(UIImageView *)v8 setClipsToBounds:1];
  [(UIImageView *)v8 setContentMode:2];
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  v222 = v8;
  v234[0] = v8;
  v234[1] = v28;
  v234[2] = v226;
  v234[3] = v225;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v234 count:4];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v228 objects:v235 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v229;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v229 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v228 + 1) + 8 * i);
        [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v27 addSubview:v43];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v228 objects:v235 count:16];
    }
    while (v40);
  }

  v44 = [v27 heightAnchor];
  v45 = [v44 constraintEqualToConstant:0.0];

  LODWORD(v46) = 1132068864;
  [v45 setPriority:v46];
  v166 = v45;
  v152 = v28;
  if ([(id)objc_opt_class() isStackedLayout])
  {
    v47 = [(UIImageView *)v8 topAnchor];
    [v27 topAnchor];
    v171 = v174 = v47;
    v215 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", 8.0);
    v233[0] = v215;
    v48 = [(UIImageView *)v8 leadingAnchor];
    [v27 leadingAnchor];
    v213 = v214 = v48;
    v212 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", 20.0);
    v233[1] = v212;
    v211 = [(UIImageView *)v8 widthAnchor];
    v210 = [v211 constraintEqualToConstant:117.0];
    v233[2] = v210;
    v209 = [(UIImageView *)v8 heightAnchor];
    v208 = [v209 constraintEqualToConstant:66.0];
    v233[3] = v208;
    v49 = [v28 topAnchor];
    [(UIImageView *)v8 bottomAnchor];
    v206 = v207 = v49;
    v205 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", 2.0);
    v233[4] = v205;
    v50 = [v28 leadingAnchor];
    [v27 leadingAnchor];
    v203 = v204 = v50;
    v202 = objc_msgSend(v50, "constraintEqualToAnchor:constant:", 20.0);
    v233[5] = v202;
    v51 = [v28 trailingAnchor];
    [v27 trailingAnchor];
    v200 = v201 = v51;
    v199 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", -20.0);
    v233[6] = v199;
    v52 = [v28 bottomAnchor];
    [v27 bottomAnchor];
    v197 = v198 = v52;
    v196 = objc_msgSend(v52, "constraintEqualToAnchor:");
    v233[7] = v196;
    v53 = [(UILabel *)v221 topAnchor];
    [v28 topAnchor];
    v194 = v195 = v53;
    v193 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v233[8] = v193;
    v54 = [(UILabel *)v221 leadingAnchor];
    [v28 leadingAnchor];
    v191 = v192 = v54;
    v190 = objc_msgSend(v54, "constraintEqualToAnchor:");
    v233[9] = v190;
    v55 = [(UILabel *)v221 trailingAnchor];
    v188 = [v28 trailingAnchor];
    v189 = v55;
    v187 = objc_msgSend(v55, "constraintEqualToAnchor:");
    v233[10] = v187;
    v56 = [(UILabel *)v219 topAnchor];
    v185 = [(UILabel *)v221 bottomAnchor];
    v186 = v56;
    v184 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 2.0);
    v233[11] = v184;
    v57 = [(UILabel *)v219 leadingAnchor];
    v182 = [v28 leadingAnchor];
    v183 = v57;
    v181 = objc_msgSend(v57, "constraintEqualToAnchor:");
    v233[12] = v181;
    v58 = [(UILabel *)v219 trailingAnchor];
    v179 = [v28 trailingAnchor];
    v180 = v58;
    v178 = objc_msgSend(v58, "constraintEqualToAnchor:");
    v233[13] = v178;
    v59 = [(UILabel *)v219 bottomAnchor];
    v176 = [v28 bottomAnchor];
    v177 = v59;
    v175 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v233[14] = v175;
    v60 = [(UIButton *)v226 centerYAnchor];
    [(UIImageView *)v8 centerYAnchor];
    v149 = v173 = v60;
    v172 = [v60 constraintEqualToAnchor:v149];
    v233[15] = v172;
    v61 = [(UIButton *)v226 trailingAnchor];
    v169 = [v27 trailingAnchor];
    v170 = v61;
    v168 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", -20.0);
    v233[16] = v168;
    v167 = [(UIButton *)v226 widthAnchor];
    v165 = [v167 constraintEqualToConstant:44.0];
    v233[17] = v165;
    v164 = [(UIButton *)v226 heightAnchor];
    v163 = [v164 constraintEqualToConstant:44.0];
    v233[18] = v163;
    v62 = [(UIView *)v225 leadingAnchor];
    v161 = [(UILabel *)v221 leadingAnchor];
    v162 = v62;
    v160 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v233[19] = v160;
    v159 = [(UIView *)v225 heightAnchor];
    v158 = [v159 constraintEqualToConstant:0.5];
    v233[20] = v158;
    v63 = [(UIView *)v225 trailingAnchor];
    v156 = [v27 trailingAnchor];
    v157 = v63;
    v155 = objc_msgSend(v63, "constraintEqualToAnchor:");
    v233[21] = v155;
    v64 = [(UIView *)v225 bottomAnchor];
    v153 = [v27 bottomAnchor];
    v154 = v64;
    v151 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", -0.5);
    v233[22] = v151;
    v65 = [(UIView *)v224 leadingAnchor];
    [(UIImageView *)v8 leadingAnchor];
    v148 = v150 = v65;
    v147 = objc_msgSend(v65, "constraintEqualToAnchor:");
    v233[23] = v147;
    v66 = [(UIView *)v224 trailingAnchor];
    v145 = [(UIImageView *)v8 trailingAnchor];
    v146 = v66;
    v144 = objc_msgSend(v66, "constraintEqualToAnchor:");
    v233[24] = v144;
    v67 = [(UIView *)v224 bottomAnchor];
    [(UIImageView *)v8 bottomAnchor];
    v143 = v68 = v67;
    v142 = objc_msgSend(v67, "constraintEqualToAnchor:");
    v233[25] = v142;
    v69 = [(UIView *)v224 heightAnchor];
    v141 = [(UIImageView *)v8 heightAnchor];
    v140 = objc_msgSend(v69, "constraintEqualToAnchor:multiplier:", 0.3);
    v233[26] = v140;
    v70 = [(UIProgressView *)v23 leadingAnchor];
    v139 = [(UIImageView *)v8 leadingAnchor];
    v138 = objc_msgSend(v70, "constraintEqualToAnchor:constant:", 8.0);
    v233[27] = v138;
    uint64_t v71 = [(UIProgressView *)v23 trailingAnchor];
    uint64_t v72 = [(UIImageView *)v8 trailingAnchor];
    v137 = (void *)v71;
    v73 = (void *)v71;
    v74 = v221;
    v75 = (void *)v72;
    v136 = [v73 constraintEqualToAnchor:v72 constant:-8.0];
    v233[28] = v136;
    [(UIProgressView *)v216 bottomAnchor];
    v77 = v76 = v216;
    v135 = [(UIImageView *)v222 bottomAnchor];
    v134 = objc_msgSend(v77, "constraintEqualToAnchor:constant:", -8.0);
    v233[29] = v134;
    v133 = [(UIProgressView *)v216 heightAnchor];
    v132 = [v133 constraintEqualToConstant:2.0];
    v233[30] = v132;
    v131 = [MEMORY[0x263EFF8C0] arrayWithObjects:v233 count:31];
    [(_TVRUIUpNextViewControllerCell *)v227 setStackedLayoutConstraints:"setStackedLayoutConstraints:"];
  }
  else
  {
    v174 = [(UIImageView *)v8 leadingAnchor];
    v171 = [v27 leadingAnchor];
    v215 = [v174 constraintEqualToAnchor:v171 constant:20.0];
    v232[0] = v215;
    v78 = [(UIImageView *)v8 centerYAnchor];
    [v27 centerYAnchor];
    v213 = v214 = v78;
    v212 = objc_msgSend(v78, "constraintEqualToAnchor:");
    v232[1] = v212;
    v211 = [(UIImageView *)v8 widthAnchor];
    v210 = [v211 constraintEqualToConstant:117.0];
    v232[2] = v210;
    v209 = [(UIImageView *)v8 heightAnchor];
    v208 = [v209 constraintEqualToConstant:66.0];
    v232[3] = v208;
    v79 = [v28 leadingAnchor];
    [(UIImageView *)v8 trailingAnchor];
    v206 = v207 = v79;
    v205 = objc_msgSend(v79, "constraintEqualToAnchor:constant:", 12.0);
    v232[4] = v205;
    v80 = [v28 centerYAnchor];
    [v27 centerYAnchor];
    v203 = v204 = v80;
    v202 = objc_msgSend(v80, "constraintEqualToAnchor:");
    v232[5] = v202;
    v81 = [v28 trailingAnchor];
    [(UIButton *)v226 leadingAnchor];
    v200 = v201 = v81;
    v199 = objc_msgSend(v81, "constraintEqualToAnchor:constant:", -5.0);
    v232[6] = v199;
    v232[7] = v45;
    v198 = [v27 heightAnchor];
    v197 = [v198 constraintGreaterThanOrEqualToConstant:88.0];
    v232[8] = v197;
    v196 = [v27 heightAnchor];
    v195 = [v196 constraintLessThanOrEqualToConstant:350.0];
    v232[9] = v195;
    v82 = [v27 heightAnchor];
    [(UIImageView *)v8 heightAnchor];
    v193 = v194 = v82;
    v192 = objc_msgSend(v82, "constraintGreaterThanOrEqualToAnchor:constant:", 16.0);
    v232[10] = v192;
    v83 = [v27 heightAnchor];
    [v28 heightAnchor];
    v190 = v191 = v83;
    v189 = objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:");
    v232[11] = v189;
    v84 = [(UILabel *)v221 topAnchor];
    v187 = [v28 topAnchor];
    v188 = v84;
    v186 = objc_msgSend(v84, "constraintEqualToAnchor:");
    v232[12] = v186;
    v85 = [(UILabel *)v221 leadingAnchor];
    v184 = [v28 leadingAnchor];
    v185 = v85;
    v183 = objc_msgSend(v85, "constraintEqualToAnchor:");
    v232[13] = v183;
    v86 = [(UILabel *)v221 trailingAnchor];
    v181 = [v28 trailingAnchor];
    v182 = v86;
    v180 = objc_msgSend(v86, "constraintEqualToAnchor:");
    v232[14] = v180;
    v87 = [(UILabel *)v219 topAnchor];
    v178 = [(UILabel *)v221 bottomAnchor];
    v179 = v87;
    v177 = objc_msgSend(v87, "constraintEqualToAnchor:constant:", 2.0);
    v232[15] = v177;
    v88 = [(UILabel *)v219 leadingAnchor];
    v175 = [v28 leadingAnchor];
    v176 = v88;
    v173 = objc_msgSend(v88, "constraintEqualToAnchor:");
    v232[16] = v173;
    v149 = [(UILabel *)v219 trailingAnchor];
    v172 = [v28 trailingAnchor];
    v170 = objc_msgSend(v149, "constraintEqualToAnchor:");
    v232[17] = v170;
    v89 = [(UILabel *)v219 bottomAnchor];
    v168 = [v28 bottomAnchor];
    v169 = v89;
    v167 = objc_msgSend(v89, "constraintEqualToAnchor:");
    v232[18] = v167;
    v90 = [(UIButton *)v226 centerYAnchor];
    v164 = [v27 centerYAnchor];
    v165 = v90;
    v163 = objc_msgSend(v90, "constraintEqualToAnchor:constant:", 0.0);
    v232[19] = v163;
    v91 = [(UIButton *)v226 trailingAnchor];
    v161 = [v27 trailingAnchor];
    v162 = v91;
    v160 = objc_msgSend(v91, "constraintEqualToAnchor:constant:", -20.0);
    v232[20] = v160;
    v159 = [(UIButton *)v226 widthAnchor];
    v158 = [v159 constraintEqualToConstant:44.0];
    v232[21] = v158;
    v157 = [(UIButton *)v226 heightAnchor];
    v156 = [v157 constraintEqualToConstant:44.0];
    v232[22] = v156;
    v92 = [(UIView *)v225 leadingAnchor];
    v154 = [(UILabel *)v221 leadingAnchor];
    v155 = v92;
    v153 = objc_msgSend(v92, "constraintEqualToAnchor:");
    v232[23] = v153;
    v151 = [(UIView *)v225 heightAnchor];
    v150 = [v151 constraintEqualToConstant:0.5];
    v232[24] = v150;
    v93 = [(UIView *)v225 trailingAnchor];
    v147 = [v27 trailingAnchor];
    v148 = v93;
    v146 = objc_msgSend(v93, "constraintEqualToAnchor:");
    v232[25] = v146;
    v94 = [(UIView *)v225 bottomAnchor];
    v144 = [v27 bottomAnchor];
    v145 = v94;
    uint64_t v130 = objc_msgSend(v94, "constraintEqualToAnchor:constant:", -0.5);
    v232[26] = v130;
    v95 = [(UIView *)v224 leadingAnchor];
    v142 = [(UIImageView *)v8 leadingAnchor];
    v143 = v95;
    uint64_t v129 = objc_msgSend(v95, "constraintEqualToAnchor:");
    v232[27] = v129;
    v96 = [(UIView *)v224 trailingAnchor];
    v140 = [(UIImageView *)v8 trailingAnchor];
    v141 = v96;
    uint64_t v128 = objc_msgSend(v96, "constraintEqualToAnchor:");
    v232[28] = v128;
    v97 = [(UIView *)v224 bottomAnchor];
    v138 = [(UIImageView *)v8 bottomAnchor];
    v139 = v97;
    v137 = objc_msgSend(v97, "constraintEqualToAnchor:");
    v232[29] = v137;
    v127 = [(UIView *)v224 heightAnchor];
    v136 = [(UIImageView *)v8 heightAnchor];
    uint64_t v98 = objc_msgSend(v127, "constraintEqualToAnchor:multiplier:", 0.3);
    v232[30] = v98;
    v99 = [(UIProgressView *)v216 leadingAnchor];
    v134 = [(UIImageView *)v8 leadingAnchor];
    v135 = v99;
    v133 = objc_msgSend(v99, "constraintEqualToAnchor:constant:", 8.0);
    v232[31] = v133;
    v100 = [(UIProgressView *)v216 trailingAnchor];
    v131 = [(UIImageView *)v8 trailingAnchor];
    v132 = v100;
    v101 = objc_msgSend(v100, "constraintEqualToAnchor:constant:", -8.0);
    v232[32] = v101;
    [(UIProgressView *)v216 bottomAnchor];
    v102 = v76 = v216;
    v103 = [(UIImageView *)v222 bottomAnchor];
    v104 = [v102 constraintEqualToAnchor:v103 constant:-8.0];
    v232[33] = v104;
    v105 = [(UIProgressView *)v216 heightAnchor];
    v106 = [v105 constraintEqualToConstant:2.0];
    v232[34] = v106;
    v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:v232 count:35];
    [(_TVRUIUpNextViewControllerCell *)v227 setStandardLayoutConstraints:v107];

    v74 = v221;
    v68 = (void *)v130;

    v77 = (void *)v98;
    v69 = (void *)v129;

    v33 = v219;
    v75 = v127;
    v70 = (void *)v128;
  }

  id v108 = objc_alloc_init(MEMORY[0x263F82E00]);
  v109 = [MEMORY[0x263F825C8] colorWithWhite:0.25 alpha:1.0];
  [v108 setBackgroundColor:v109];

  [(_TVRUIUpNextViewControllerCell *)v227 setSelectedBackgroundView:v108];
  imageView = v227->_imageView;
  v227->_imageView = v222;
  v223 = v222;

  attributionMaskImageView = v227->_attributionMaskImageView;
  v227->_attributionMaskImageView = v218;
  v220 = v218;

  titleLabel = v227->_titleLabel;
  v227->_titleLabel = v74;
  v113 = v74;

  secondaryLabel = v227->_secondaryLabel;
  v227->_secondaryLabel = v33;
  v115 = v33;

  separatorView = v227->_separatorView;
  v227->_separatorView = v225;
  v117 = v225;

  actionButton = v227->_actionButton;
  v227->_actionButton = v226;
  v119 = v226;

  playbackProgressView = v227->_playbackProgressView;
  v227->_playbackProgressView = v76;
  v121 = v76;

  gradientView = v227->_gradientView;
  v227->_gradientView = v224;
  v123 = v224;

  gradientLayer = v227->_gradientLayer;
  v227->_gradientLayer = v217;

  [(_TVRUIUpNextViewControllerCell *)v227 setOverrideUserInterfaceStyle:2];
  [(_TVRUIUpNextViewControllerCell *)v227 _updateLayoutConstraintsForCurrentSizeCategory];
  v125 = [(_TVRUIUpNextViewControllerCell *)v227 contentView];
  [v125 setNeedsLayout];

  v126 = [(_TVRUIUpNextViewControllerCell *)v227 contentView];
  [v126 layoutIfNeeded];
}

- (void)_updateLayoutConstraintsForCurrentSizeCategory
{
  uint64_t v3 = [(id)objc_opt_class() isStackedLayout];
  [(_TVRUIUpNextViewControllerCell *)self _updateLayoutConstraintsForStackedLayout:v3];
}

- (void)_updateLayoutConstraintsForStackedLayout:(BOOL)a3
{
  double v4 = (void *)MEMORY[0x263F08938];
  if (a3)
  {
    double v5 = [(_TVRUIUpNextViewControllerCell *)self stackedLayoutConstraints];
    [v4 activateConstraints:v5];

    double v6 = (void *)MEMORY[0x263F08938];
    [(_TVRUIUpNextViewControllerCell *)self standardLayoutConstraints];
  }
  else
  {
    double v7 = [(_TVRUIUpNextViewControllerCell *)self standardLayoutConstraints];
    [v4 activateConstraints:v7];

    double v6 = (void *)MEMORY[0x263F08938];
    [(_TVRUIUpNextViewControllerCell *)self stackedLayoutConstraints];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");
}

- (void)_updateSeparatorVisibility
{
  uint64_t v3 = [(_TVRUIUpNextViewControllerCell *)self showsSeparator] ^ 1;
  id v4 = [(_TVRUIUpNextViewControllerCell *)self separatorView];
  [v4 setHidden:v3];
}

- (id)_actionButton
{
  uint64_t v3 = (void *)MEMORY[0x263F82818];
  id v4 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
  double v5 = [v3 configurationWithFont:v4];

  double v6 = (void *)MEMORY[0x263F823D0];
  double v7 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis" withConfiguration:v5];
  id v8 = [v6 actionWithTitle:&stru_26DB4CAE0 image:v7 identifier:0 handler:&__block_literal_global_8];

  double v9 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  double v10 = [MEMORY[0x263F824E8] buttonWithConfiguration:v9 primaryAction:v8];
  double v11 = [MEMORY[0x263F825C8] lightGrayColor];
  [v10 setTintColor:v11];

  [v10 setOverrideUserInterfaceStyle:2];
  v12 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_actionButtonTapped_];
  [v10 addGestureRecognizer:v12];
  v13 = [(_TVRUIUpNextViewControllerCell *)self _actionButtonMenu];
  [v10 setMenu:v13];
  [v10 setShowsMenuAsPrimaryAction:1];

  return v10;
}

- (void)actionButtonTapped:(id)a3
{
  id v3 = [(_TVRUIUpNextViewControllerCell *)self actionButton];
  [v3 sendActionsForControlEvents:0x2000];
}

- (id)_actionButtonMenu
{
  v99[2] = *MEMORY[0x263EF8340];
  v68 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.up.right.square"];
  v67 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:@"TVRUIGotoEpisode" value:&stru_26DB4CAE0 table:@"Localizable"];
  v96[0] = MEMORY[0x263EF8330];
  v96[1] = 3221225472;
  v96[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke;
  v96[3] = &unk_264800190;
  objc_copyWeak(&v97, &location);
  v66 = [v3 actionWithTitle:v5 image:v68 identifier:0 handler:v96];

  double v6 = (void *)MEMORY[0x263F823D0];
  double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"TVRUIGotoShow" value:&stru_26DB4CAE0 table:@"Localizable"];
  v94[0] = MEMORY[0x263EF8330];
  v94[1] = 3221225472;
  v94[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2;
  v94[3] = &unk_264800190;
  objc_copyWeak(&v95, &location);
  v65 = [v6 actionWithTitle:v8 image:v68 identifier:0 handler:v94];

  double v9 = (void *)MEMORY[0x263F823D0];
  double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v11 = [v10 localizedStringForKey:@"TVRUIGotoMovie" value:&stru_26DB4CAE0 table:@"Localizable"];
  v92[0] = MEMORY[0x263EF8330];
  v92[1] = 3221225472;
  v92[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_3;
  v92[3] = &unk_264800190;
  objc_copyWeak(&v93, &location);
  v64 = [v9 actionWithTitle:v11 image:v68 identifier:0 handler:v92];

  v12 = (void *)MEMORY[0x263F823D0];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v14 = [v13 localizedStringForKey:@"TVRUIGotoSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_4;
  v90[3] = &unk_264800190;
  objc_copyWeak(&v91, &location);
  v63 = [v12 actionWithTitle:v14 image:v68 identifier:0 handler:v90];

  double v15 = (void *)MEMORY[0x263F823D0];
  double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v17 = [v16 localizedStringForKey:@"TVRUIShareEpisode" value:&stru_26DB4CAE0 table:@"Localizable"];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_5;
  v88[3] = &unk_264800190;
  objc_copyWeak(&v89, &location);
  v62 = [v15 actionWithTitle:v17 image:v67 identifier:0 handler:v88];

  id v18 = (void *)MEMORY[0x263F823D0];
  double v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v20 = [v19 localizedStringForKey:@"TVRUIShareShow" value:&stru_26DB4CAE0 table:@"Localizable"];
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_6;
  v86[3] = &unk_264800190;
  objc_copyWeak(&v87, &location);
  v61 = [v18 actionWithTitle:v20 image:v67 identifier:0 handler:v86];

  double v21 = (void *)MEMORY[0x263F823D0];
  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v23 = [v22 localizedStringForKey:@"TVRUIShareMovie" value:&stru_26DB4CAE0 table:@"Localizable"];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_7;
  v84[3] = &unk_264800190;
  objc_copyWeak(&v85, &location);
  v60 = [v21 actionWithTitle:v23 image:v67 identifier:0 handler:v84];

  v24 = (void *)MEMORY[0x263F823D0];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v26 = [v25 localizedStringForKey:@"TVRUIShareSportingEvent" value:&stru_26DB4CAE0 table:@"Localizable"];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_8;
  v82[3] = &unk_264800190;
  objc_copyWeak(&v83, &location);
  v59 = [v24 actionWithTitle:v26 image:v67 identifier:0 handler:v82];

  if ([MEMORY[0x263F7C9A8] testarossaEnabled])
  {
    v27 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), &v83, &v85, &v87, &v89, &v91, &v93, &v95, &v97);
    [v27 localizedStringForKey:@"RemoveFromUpNext" value:&stru_26DB4CAE0 table:@"Localizable"];
  }
  else
  {
    v27 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), &v83, &v85, &v87, &v89, &v91, &v93, &v95, &v97);
    [v27 localizedStringForKey:@"RemoveFromUpNextDeprecated" value:&stru_26DB4CAE0 table:@"Localizable"];
  id v28 = };

  v29 = (void *)MEMORY[0x263F823D0];
  v30 = [MEMORY[0x263F827E8] systemImageNamed:@"minus.circle"];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_9;
  v80[3] = &unk_264800190;
  objc_copyWeak(&v81, &location);
  double v31 = [v29 actionWithTitle:v28 image:v30 identifier:0 handler:v80];

  v32 = (void *)MEMORY[0x263F823D0];
  v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v34 = [v33 localizedStringForKey:@"MarkAsWatched" value:&stru_26DB4CAE0 table:@"Localizable"];
  v35 = [MEMORY[0x263F827E8] systemImageNamed:@"rectangle.badge.checkmark"];
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_10;
  v78[3] = &unk_264800190;
  objc_copyWeak(&v79, &location);
  double v36 = [v32 actionWithTitle:v34 image:v35 identifier:0 handler:v78];

  v37 = (void *)MEMORY[0x263F82940];
  v99[0] = v31;
  v99[1] = v36;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:2];
  uint64_t v39 = [v37 menuWithTitle:&stru_26DB4CAE0 image:0 identifier:0 options:1 children:v38];

  uint64_t v40 = [(_TVRUIUpNextViewControllerCell *)self upNextInfo];
  uint64_t v41 = [v40 mediaInfo];
  uint64_t v42 = [v41 kind];

  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  id v77 = (id)MEMORY[0x263EFFA68];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_392;
  aBlock[3] = &unk_2648008B0;
  aBlock[4] = &v72;
  v43 = _Block_copy(aBlock);
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2_394;
  v69[3] = &unk_2648008D8;
  v69[4] = self;
  id v44 = v43;
  id v70 = v44;
  v45 = _Block_copy(v69);
  double v46 = (void (**)(void, void, void))v45;
  switch(v42)
  {
    case 1:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 3, v66);
      ((void (**)(void, uint64_t, void *))v46)[2](v46, 2, v65);
      ((void (**)(void, uint64_t, void *))v46)[2](v46, 3, v62);
      ((void (**)(void, uint64_t, void *))v46)[2](v46, 2, v61);
      goto LABEL_10;
    case 5:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 1, v63);
      ((void (**)(void, uint64_t, void *))v46)[2](v46, 1, v59);
      goto LABEL_10;
    case 2:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 1, v64);
      ((void (**)(void, uint64_t, void *))v46)[2](v46, 1, v60);
LABEL_10:
      v47 = v39;
      goto LABEL_12;
  }
  (*((void (**)(id, void *))v44 + 2))(v44, v31);
  v47 = v36;
LABEL_12:
  (*((void (**)(id, void *))v44 + 2))(v44, v47);
  id v48 = (id)v73[5];

  _Block_object_dispose(&v72, 8);
  v49 = [MEMORY[0x263F82940] menuWithChildren:v48];

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);

  objc_destroyWeak(v51);
  objc_destroyWeak(v52);

  objc_destroyWeak(v53);
  objc_destroyWeak(v54);

  objc_destroyWeak(v55);
  objc_destroyWeak(v56);

  objc_destroyWeak(v57);
  objc_destroyWeak(v58);
  objc_destroyWeak(&location);

  return v49;
}

- (void)_updateForUpNextInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 mediaInfo];
  double v6 = [v5 title];
  double v7 = [(_TVRUIUpNextViewControllerCell *)self titleLabel];
  [v7 setText:v6];

  id v8 = [(_TVRUIUpNextViewControllerCell *)self _secondaryTextForUpNextInfo:v4];
  double v9 = [(_TVRUIUpNextViewControllerCell *)self secondaryLabel];
  [v9 setText:v8];

  LODWORD(v8) = objc_msgSend(v4, "tvruiupnextvc_hasPercentComplete");
  double v10 = [(_TVRUIUpNextViewControllerCell *)self playbackProgressView];
  [v10 setHidden:v8 ^ 1];

  if (v8)
  {
    objc_msgSend(v4, "tvruiupnextvc_percentComplete");
    double v12 = v11;
    v13 = [(_TVRUIUpNextViewControllerCell *)self playbackProgressView];
    *(float *)&double v14 = v12;
    [v13 setProgress:v14];
  }
  int v15 = [v4 artworkNeedsCornerBlur];
  double v16 = [(_TVRUIUpNextViewControllerCell *)self attributionMaskImageView];
  [v16 setHidden:v15 ^ 1u];

  double v17 = [(_TVRUIUpNextViewControllerCell *)self _actionButtonMenu];
  id v18 = [(_TVRUIUpNextViewControllerCell *)self actionButton];
  [v18 setMenu:v17];

  double v19 = [v5 imageURLTemplate];
  if ([v19 length])
  {
    objc_initWeak((id *)location, self);
    id v20 = [(_TVRUIUpNextViewControllerCell *)self delegate];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55___TVRUIUpNextViewControllerCell__updateForUpNextInfo___block_invoke;
    v24[3] = &unk_264800418;
    objc_copyWeak(&v25, (id *)location);
    [v20 requestImageForInfo:v4 completion:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    double v21 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = [v5 identifier];
      *(_DWORD *)id location = 134218242;
      *(void *)&location[4] = self;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_INFO, "UpNext cell %p for %@ has no imageURLTemplare, blanking image...", location, 0x16u);
    }
    objc_super v23 = [(_TVRUIUpNextViewControllerCell *)self imageView];
    [v23 setImage:0];
  }
}

- (id)_secondaryTextForUpNextInfo:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  double v6 = [v4 mediaInfo];
  double v7 = [v5 reason];
  id v8 = __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v7, &stru_26DB4CAE0, v7);

  if ([v6 kind] == 1)
  {
    uint64_t v9 = [v6 seasonNumber];
    if (v9)
    {
      double v10 = (void *)v9;
      double v11 = [v6 episodeNumber];

      if (v11)
      {
        double v12 = [(_TVRUIUpNextViewControllerCell *)self _seasonEpisodeFormatString];
        v13 = NSString;
        double v14 = [v6 seasonNumber];
        int v15 = [v6 episodeNumber];
        double v16 = objc_msgSend(v13, "stringWithFormat:", v12, v14, v15);
        uint64_t v17 = __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v16, v8, v16);

        id v8 = (void *)v17;
      }
    }
  }
  id v18 = [v5 timeRemaining];
  [v18 floatValue];
  float v20 = v19;

  if (v20 > 0.0)
  {
    double v21 = +[TVRUIDateUtilities localizedPlaybackTimeForInterval:v20];
    uint64_t v22 = [v21 length];
    if (v22)
    {
      uint64_t v23 = __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(v22, v8, v21);

      id v8 = (void *)v23;
    }
  }
  v24 = [v5 service];
  uint64_t v25 = [v24 length];
  if (v25)
  {
    uint64_t v26 = __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(v25, v8, v24);
LABEL_15:

    id v8 = (void *)v26;
    goto LABEL_16;
  }
  if ([v5 isAppleOriginal])
  {
    __int16 v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v28 = [v27 localizedStringForKey:@"AppleTVOriginal" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v26 = __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v28, v8, v28);

    id v8 = v27;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  return v8;
}

- (id)_seasonEpisodeFormatString
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"TVRUISeasonEpisodeBrief" value:&stru_26DB4CAE0 table:@"Localizable"];

  id v4 = [v3 componentsSeparatedByString:@"%@"];
  if ((unint64_t)[v4 count] < 3) {
    double v5 = @"S%@, E%@";
  }
  else {
    double v5 = v3;
  }

  return v5;
}

- (BOOL)hasURLForProductPageKind:(int64_t)a3
{
  id v3 = [(_TVRUIUpNextViewControllerCell *)self urlForProductPageKind:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)openProductPageForKind:(int64_t)a3
{
  uint64_t v4 = [(_TVRUIUpNextViewControllerCell *)self urlForProductPageKind:a3];
  if (v4) {
    [(_TVRUIUpNextViewControllerCell *)self openURL:v4];
  }
  MEMORY[0x270F9A758]();
}

- (id)urlForProductPageKind:(int64_t)a3
{
  double v5 = [(_TVRUIUpNextViewControllerCell *)self upNextInfo];
  double v6 = [v5 shareURL];

  double v7 = [(_TVRUIUpNextViewControllerCell *)self upNextInfo];
  id v8 = v7;
  if (!v6)
  {
    double v10 = [v7 mediaInfo];

    if (v10)
    {
      if (a3 == 1 || a3 == 3)
      {
        uint64_t v11 = [v10 productURL];
        goto LABEL_16;
      }
      if (a3 == 2)
      {
        uint64_t v11 = [v10 showURL];
LABEL_16:
        double v12 = (void *)v11;
        goto LABEL_17;
      }
    }
    double v12 = 0;
LABEL_17:
    id v8 = v10;
    goto LABEL_18;
  }
  if (a3 == 1 || a3 == 3)
  {
    uint64_t v9 = [v7 shareURL];
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    uint64_t v9 = [v7 shareShowURL];
LABEL_12:
    double v12 = (void *)v9;
    goto LABEL_18;
  }
  double v12 = 0;
LABEL_18:

  return v12;
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(_TVRUIUpNextViewControllerCell *)self delegate];
  [v5 openURL:v4];
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (_TVRUIUpNextViewControllerActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVRUIUpNextViewControllerActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)attributionMaskImageView
{
  return self->_attributionMaskImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UIProgressView)playbackProgressView
{
  return self->_playbackProgressView;
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
}

- (NSArray)stackedLayoutConstraints
{
  return self->_stackedLayoutConstraints;
}

- (void)setStackedLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_playbackProgressView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attributionMaskImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upNextInfo, 0);
}

@end