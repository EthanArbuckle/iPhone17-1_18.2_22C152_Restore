@interface CarTestCardViewController
- ($B1874A4E4729613F071A632570863A63)layout;
- (CGSize)availableCardSize;
- (CGSize)size;
- (CarCardTestConfig)config;
- (CarFocusableButton)heightMinusButton;
- (CarFocusableButton)heightPlusButton;
- (CarFocusableButton)reloadButton;
- (CarFocusableButton)widthMinusButton;
- (CarFocusableButton)widthPlusButton;
- (CarTestCardViewController)initWithConfig:(id)a3;
- (NSArray)focusOrderSubItems;
- (NSArray)taggedButtons;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSString)cardID;
- (NSString)text;
- (UIColor)color;
- (UILabel)heightLabel;
- (UILabel)textLabel;
- (UILabel)widthLabel;
- (UIView)taggedButtonsView;
- (id)_buttonWithTitle:(id)a3;
- (id)_labelWithText:(id)a3 size:(double)a4;
- (id)buttonTagHandler;
- (id)dismissHandler;
- (void)_buttonTapped:(id)a3;
- (void)_tapped;
- (void)_updateContents;
- (void)_updateSize;
- (void)setAvailableCardSize:(CGSize)a3;
- (void)setButtonTagHandler:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHeightLabel:(id)a3;
- (void)setHeightMinusButton:(id)a3;
- (void)setHeightPlusButton:(id)a3;
- (void)setReloadButton:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTaggedButtons:(id)a3;
- (void)setTaggedButtonsView:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)setWidthLabel:(id)a3;
- (void)setWidthMinusButton:(id)a3;
- (void)setWidthPlusButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation CarTestCardViewController

- (void)viewDidLoad
{
  v255.receiver = self;
  v255.super_class = (Class)CarTestCardViewController;
  [(CarTestCardViewController *)&v255 viewDidLoad];
  v3 = [(CarTestCardViewController *)self text];
  v4 = [(CarTestCardViewController *)self _labelWithText:v3 size:15.0];
  [(CarTestCardViewController *)self setTextLabel:v4];

  v5 = [(CarTestCardViewController *)self view];
  v6 = [(CarTestCardViewController *)self textLabel];
  [v5 addSubview:v6];

  v7 = [(CarTestCardViewController *)self _buttonWithTitle:@"⟲"];
  [(CarTestCardViewController *)self setReloadButton:v7];

  v8 = [(CarTestCardViewController *)self view];
  v9 = [(CarTestCardViewController *)self reloadButton];
  [v8 addSubview:v9];

  [(CarTestCardViewController *)self size];
  v11 = +[NSString stringWithFormat:@"H:%.1f", v10];
  v12 = [(CarTestCardViewController *)self _labelWithText:v11 size:6.0];
  [(CarTestCardViewController *)self setHeightLabel:v12];

  v13 = [(CarTestCardViewController *)self view];
  v14 = [(CarTestCardViewController *)self heightLabel];
  [v13 addSubview:v14];

  [(CarTestCardViewController *)self size];
  v16 = +[NSString stringWithFormat:@"W:%.1f", v15];
  v17 = [(CarTestCardViewController *)self _labelWithText:v16 size:6.0];
  [(CarTestCardViewController *)self setWidthLabel:v17];

  v18 = [(CarTestCardViewController *)self view];
  v19 = [(CarTestCardViewController *)self widthLabel];
  [v18 addSubview:v19];

  id v20 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tapped"];
  v21 = [(CarTestCardViewController *)self view];
  v252 = v20;
  [v21 addGestureRecognizer:v20];

  v253 = objc_opt_new();
  v22 = [(CarTestCardViewController *)self config];
  double v23 = -20.0;
  if (([v22 grows] & 1) == 0)
  {
    v24 = [(CarTestCardViewController *)self config];
    if ([v24 compresses]) {
      double v23 = -15.0;
    }
    else {
      double v23 = 0.0;
    }
  }
  v25 = [(CarTestCardViewController *)self view];
  v26 = [v25 heightAnchor];
  [(CarTestCardViewController *)self size];
  double v28 = v27;
  v29 = [(CarTestCardViewController *)self config];
  if ([v29 compresses]) {
    *(float *)&double v30 = 999.0;
  }
  else {
    *(float *)&double v30 = 1000.0;
  }
  v31 = [v26 constraintEqualToConstant:v28 priority:v30];
  [(CarTestCardViewController *)self setHeightConstraint:v31];

  v32 = [(CarTestCardViewController *)self view];
  v33 = [v32 widthAnchor];
  [(CarTestCardViewController *)self size];
  double v35 = v34;
  v36 = [(CarTestCardViewController *)self config];
  if ([v36 compresses]) {
    *(float *)&double v37 = 999.0;
  }
  else {
    *(float *)&double v37 = 1000.0;
  }
  v38 = [v33 constraintEqualToConstant:v35 priority:v37];
  [(CarTestCardViewController *)self setWidthConstraint:v38];

  v249 = [(CarTestCardViewController *)self textLabel];
  v243 = [v249 centerXAnchor];
  v246 = [(CarTestCardViewController *)self view];
  v240 = [v246 centerXAnchor];
  v237 = [v243 constraintEqualToAnchor:v240];
  v258[0] = v237;
  v234 = [(CarTestCardViewController *)self textLabel];
  v228 = [v234 centerYAnchor];
  v231 = [(CarTestCardViewController *)self view];
  v225 = [v231 centerYAnchor];
  v222 = [v228 constraintEqualToAnchor:v225 constant:v23];
  v258[1] = v222;
  v219 = [(CarTestCardViewController *)self reloadButton];
  v213 = [v219 firstBaselineAnchor];
  v216 = [(CarTestCardViewController *)self textLabel];
  v210 = [v216 firstBaselineAnchor];
  v207 = [v213 constraintEqualToAnchor:v210];
  v258[2] = v207;
  v204 = [(CarTestCardViewController *)self reloadButton];
  v198 = [v204 leadingAnchor];
  v201 = [(CarTestCardViewController *)self textLabel];
  v195 = [v201 trailingAnchor];
  v192 = [v198 constraintEqualToAnchor:v195 constant:-2.0];
  v258[3] = v192;
  v189 = [(CarTestCardViewController *)self heightConstraint];
  v258[4] = v189;
  v186 = [(CarTestCardViewController *)self widthConstraint];
  v258[5] = v186;
  v183 = [(CarTestCardViewController *)self widthLabel];
  v177 = [v183 centerXAnchor];
  v180 = [(CarTestCardViewController *)self view];
  v174 = [v180 centerXAnchor];
  v171 = [v177 constraintEqualToAnchor:v174];
  v258[6] = v171;
  v168 = [(CarTestCardViewController *)self widthLabel];
  v39 = [v168 firstBaselineAnchor];
  v162 = v39;
  v165 = [(CarTestCardViewController *)self textLabel];
  uint64_t v40 = [v165 lastBaselineAnchor];
  v156 = (void *)v40;
  v159 = [(CarTestCardViewController *)self config];
  if ([v159 grows]) {
    double v41 = 20.0;
  }
  else {
    double v41 = 10.0;
  }
  v153 = [v39 constraintEqualToAnchor:v40 constant:v41];
  v258[7] = v153;
  v150 = [(CarTestCardViewController *)self heightLabel];
  v144 = [v150 centerXAnchor];
  v147 = [(CarTestCardViewController *)self view];
  v42 = [v147 centerXAnchor];
  v43 = [v144 constraintEqualToAnchor:v42];
  v258[8] = v43;
  v44 = [(CarTestCardViewController *)self heightLabel];
  v45 = [v44 firstBaselineAnchor];
  v46 = [(CarTestCardViewController *)self widthLabel];
  v47 = [v46 lastBaselineAnchor];
  v48 = [(CarTestCardViewController *)self config];
  if ([v48 grows]) {
    double v49 = 20.0;
  }
  else {
    double v49 = 10.0;
  }
  v50 = [v45 constraintEqualToAnchor:v47 constant:v49];
  v258[9] = v50;
  v51 = +[NSArray arrayWithObjects:v258 count:10];
  [v253 addObjectsFromArray:v51];

  v52 = [(CarTestCardViewController *)self config];
  unsigned int v53 = [v52 grows];

  if (v53)
  {
    v54 = [(CarTestCardViewController *)self _buttonWithTitle:@"⊕"];
    [(CarTestCardViewController *)self setHeightPlusButton:v54];

    v55 = [(CarTestCardViewController *)self view];
    v56 = [(CarTestCardViewController *)self heightPlusButton];
    [v55 addSubview:v56];

    v57 = [(CarTestCardViewController *)self _buttonWithTitle:@"⊖"];
    [(CarTestCardViewController *)self setHeightMinusButton:v57];

    v58 = [(CarTestCardViewController *)self view];
    v59 = [(CarTestCardViewController *)self heightMinusButton];
    [v58 addSubview:v59];

    v60 = [(CarTestCardViewController *)self _buttonWithTitle:@"⊕"];
    [(CarTestCardViewController *)self setWidthPlusButton:v60];

    v61 = [(CarTestCardViewController *)self view];
    v62 = [(CarTestCardViewController *)self widthPlusButton];
    [v61 addSubview:v62];

    v63 = [(CarTestCardViewController *)self _buttonWithTitle:@"⊖"];
    [(CarTestCardViewController *)self setWidthMinusButton:v63];

    v64 = [(CarTestCardViewController *)self view];
    v65 = [(CarTestCardViewController *)self widthMinusButton];
    [v64 addSubview:v65];

    v250 = [(CarTestCardViewController *)self heightPlusButton];
    v244 = [v250 centerYAnchor];
    v247 = [(CarTestCardViewController *)self heightLabel];
    v241 = [v247 centerYAnchor];
    v238 = [v244 constraintEqualToAnchor:v241];
    v257[0] = v238;
    v235 = [(CarTestCardViewController *)self heightPlusButton];
    v229 = [v235 leadingAnchor];
    v232 = [(CarTestCardViewController *)self view];
    v226 = [v232 leadingAnchor];
    v223 = [v229 constraintEqualToAnchor:v226 constant:4.0];
    v257[1] = v223;
    v220 = [(CarTestCardViewController *)self heightPlusButton];
    v214 = [v220 trailingAnchor];
    v217 = [(CarTestCardViewController *)self heightLabel];
    v211 = [v217 leadingAnchor];
    v208 = [v214 constraintEqualToAnchor:v211 constant:2.0];
    v257[2] = v208;
    v205 = [(CarTestCardViewController *)self heightMinusButton];
    v199 = [v205 centerYAnchor];
    v202 = [(CarTestCardViewController *)self heightLabel];
    v196 = [v202 centerYAnchor];
    v193 = [v199 constraintEqualToAnchor:v196];
    v257[3] = v193;
    v190 = [(CarTestCardViewController *)self heightMinusButton];
    v184 = [v190 trailingAnchor];
    v187 = [(CarTestCardViewController *)self view];
    v181 = [v187 trailingAnchor];
    v178 = [v184 constraintEqualToAnchor:v181 constant:-4.0];
    v257[4] = v178;
    v175 = [(CarTestCardViewController *)self heightMinusButton];
    v169 = [v175 leadingAnchor];
    v172 = [(CarTestCardViewController *)self heightLabel];
    v166 = [v172 trailingAnchor];
    v163 = [v169 constraintEqualToAnchor:v166 constant:2.0];
    v257[5] = v163;
    v160 = [(CarTestCardViewController *)self widthPlusButton];
    v154 = [v160 centerYAnchor];
    v157 = [(CarTestCardViewController *)self widthLabel];
    v151 = [v157 centerYAnchor];
    v148 = [v154 constraintEqualToAnchor:v151];
    v257[6] = v148;
    v145 = [(CarTestCardViewController *)self widthPlusButton];
    v140 = [v145 leadingAnchor];
    v142 = [(CarTestCardViewController *)self view];
    v138 = [v142 leadingAnchor];
    v136 = [v140 constraintEqualToAnchor:v138 constant:4.0];
    v257[7] = v136;
    v134 = [(CarTestCardViewController *)self widthPlusButton];
    v130 = [v134 trailingAnchor];
    v132 = [(CarTestCardViewController *)self widthLabel];
    v128 = [v132 leadingAnchor];
    v126 = [v130 constraintEqualToAnchor:v128 constant:2.0];
    v257[8] = v126;
    v124 = [(CarTestCardViewController *)self widthMinusButton];
    v120 = [v124 centerYAnchor];
    v122 = [(CarTestCardViewController *)self widthLabel];
    v118 = [v122 centerYAnchor];
    v116 = [v120 constraintEqualToAnchor:v118];
    v257[9] = v116;
    v114 = [(CarTestCardViewController *)self widthMinusButton];
    v112 = [v114 trailingAnchor];
    v66 = [(CarTestCardViewController *)self view];
    v67 = [v66 trailingAnchor];
    v68 = [v112 constraintEqualToAnchor:v67 constant:-4.0];
    v257[10] = v68;
    v69 = [(CarTestCardViewController *)self widthMinusButton];
    v70 = [v69 leadingAnchor];
    v71 = [(CarTestCardViewController *)self widthLabel];
    v72 = [v71 trailingAnchor];
    v73 = [v70 constraintEqualToAnchor:v72 constant:2.0];
    v257[11] = v73;
    v74 = +[NSArray arrayWithObjects:v257 count:12];
    [v253 addObjectsFromArray:v74];
  }
  v75 = [(CarTestCardViewController *)self config];
  id v76 = [v75 stackCount];

  if ((unint64_t)v76 >= 2)
  {
    id v77 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(CarTestCardViewController *)self setTaggedButtonsView:v77];

    v78 = [(CarTestCardViewController *)self taggedButtonsView];
    [v78 setTranslatesAutoresizingMaskIntoConstraints:0];

    v79 = [(CarTestCardViewController *)self view];
    v80 = [(CarTestCardViewController *)self taggedButtonsView];
    [v79 addSubview:v80];

    v81 = +[NSMutableArray arrayWithCapacity:4];
    v82 = [(CarTestCardViewController *)self _buttonWithTitle:@"-"];
    [v82 setTag:1];
    [v81 addObject:v82];
    v83 = [(CarTestCardViewController *)self _buttonWithTitle:@"+"];
    [v83 setTag:2];
    v251 = v81;
    [v81 addObject:v83];
    v84 = [(CarTestCardViewController *)self _buttonWithTitle:@"▴"];
    [v84 setTag:3];
    [v81 addObject:v84];
    v85 = [(CarTestCardViewController *)self _buttonWithTitle:@"▾"];
    [v85 setTag:4];
    [v81 addObject:v85];
    id v86 = [v81 copy];
    [(CarTestCardViewController *)self setTaggedButtons:v86];

    v87 = [(CarTestCardViewController *)self taggedButtons];
    v254[0] = _NSConcreteStackBlock;
    v254[1] = 3221225472;
    v254[2] = sub_100904918;
    v254[3] = &unk_1013005E0;
    v254[4] = self;
    [v87 enumerateObjectsUsingBlock:v254];

    v248 = [(CarTestCardViewController *)self taggedButtonsView];
    v242 = [v248 bottomAnchor];
    v245 = [(CarTestCardViewController *)self view];
    v239 = [v245 bottomAnchor];
    v236 = [v242 constraintEqualToAnchor:v239];
    v256[0] = v236;
    v233 = [(CarTestCardViewController *)self taggedButtonsView];
    v227 = [v233 leftAnchor];
    v230 = [(CarTestCardViewController *)self view];
    v224 = [v230 leftAnchor];
    v221 = [v227 constraintEqualToAnchor:v224];
    v256[1] = v221;
    v215 = [v82 leftAnchor];
    v218 = [(CarTestCardViewController *)self taggedButtonsView];
    v212 = [v218 leftAnchor];
    v209 = [v215 constraintEqualToAnchor:v212];
    v256[2] = v209;
    v203 = [v82 topAnchor];
    v206 = [(CarTestCardViewController *)self taggedButtonsView];
    v200 = [v206 topAnchor];
    v197 = [v203 constraintEqualToAnchor:v200];
    v256[3] = v197;
    v191 = [v82 bottomAnchor];
    v194 = [(CarTestCardViewController *)self taggedButtonsView];
    v188 = [v194 bottomAnchor];
    v185 = [v191 constraintEqualToAnchor:v188];
    v256[4] = v185;
    v182 = [v84 leftAnchor];
    v179 = [v82 rightAnchor];
    v176 = [v182 constraintEqualToAnchor:v179];
    v256[5] = v176;
    v170 = [v84 topAnchor];
    v173 = [(CarTestCardViewController *)self taggedButtonsView];
    v167 = [v173 topAnchor];
    v164 = [v170 constraintEqualToAnchor:v167];
    v256[6] = v164;
    v158 = [v84 rightAnchor];
    v161 = [(CarTestCardViewController *)self taggedButtonsView];
    v152 = [v161 rightAnchor];
    v149 = [v158 constraintEqualToAnchor:v152];
    v256[7] = v149;
    v146 = [v83 leftAnchor];
    v141 = [v82 rightAnchor];
    v139 = [v146 constraintEqualToAnchor:v141];
    v256[8] = v139;
    v135 = [v83 topAnchor];
    v143 = v84;
    v133 = [v84 bottomAnchor];
    v131 = [v135 constraintEqualToAnchor:v133];
    v256[9] = v131;
    v125 = [v83 rightAnchor];
    v127 = [(CarTestCardViewController *)self taggedButtonsView];
    v123 = [v127 rightAnchor];
    v121 = [v125 constraintEqualToAnchor:v123];
    v256[10] = v121;
    v119 = [v85 leftAnchor];
    v155 = v82;
    v117 = [v82 rightAnchor];
    v115 = [v119 constraintEqualToAnchor:v117];
    v256[11] = v115;
    v113 = [v85 topAnchor];
    v111 = [v83 bottomAnchor];
    v110 = [v113 constraintEqualToAnchor:v111];
    v256[12] = v110;
    v108 = [v85 bottomAnchor];
    v109 = [(CarTestCardViewController *)self taggedButtonsView];
    v107 = [v109 bottomAnchor];
    v106 = [v108 constraintEqualToAnchor:v107];
    v256[13] = v106;
    v137 = v85;
    v104 = [v85 rightAnchor];
    v105 = [(CarTestCardViewController *)self taggedButtonsView];
    v103 = [v105 rightAnchor];
    v102 = [v104 constraintEqualToAnchor:v103];
    v256[14] = v102;
    v101 = [v82 widthAnchor];
    v100 = [v83 widthAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v256[15] = v99;
    v98 = [v84 heightAnchor];
    v129 = v83;
    v88 = [v83 heightAnchor];
    v89 = [v98 constraintEqualToAnchor:v88];
    v256[16] = v89;
    v90 = [v85 heightAnchor];
    v91 = [v83 heightAnchor];
    v92 = [v90 constraintEqualToAnchor:v91];
    v256[17] = v92;
    v93 = [v83 heightAnchor];
    v94 = [v93 constraintEqualToConstant:12.0];
    v256[18] = v94;
    v95 = [v83 widthAnchor];
    v96 = [v95 constraintEqualToConstant:15.0];
    v256[19] = v96;
    v97 = +[NSArray arrayWithObjects:v256 count:20];
    [v253 addObjectsFromArray:v97];
  }
  +[NSLayoutConstraint activateConstraints:v253];
}

- (CarTestCardViewController)initWithConfig:(id)a3
{
  id v5 = a3;
  v6 = [(CarTestCardViewController *)self init];
  if (v6)
  {
    v7 = objc_opt_new();
    uint64_t v8 = [v7 UUIDString];
    cardID = v6->_cardID;
    v6->_cardID = (NSString *)v8;

    objc_storeStrong((id *)&v6->_config, a3);
    [v5 size];
    v6->_size.width = v10;
    v6->_size.height = v11;
    if ((unint64_t)[v5 stackCount] <= 1) {
      CFStringRef v12 = &stru_101324E70;
    }
    else {
      CFStringRef v12 = @"Stack ";
    }
    v13 = [(NSString *)v6->_cardID substringToIndex:5];
    uint64_t v14 = +[NSString stringWithFormat:@"%@Card %@", v12, v13];
    text = v6->_text;
    v6->_text = (NSString *)v14;

    uint64_t v16 = +[UIColor colorWithHue:(float)((float)(arc4random() % 0xA) / 10.0) saturation:0.800000012 brightness:0.800000012 alpha:1.0];
    color = v6->_color;
    v6->_color = (UIColor *)v16;
  }
  return v6;
}

- (void)_tapped
{
  v3 = [(CarTestCardViewController *)self dismissHandler];

  if (v3)
  {
    v4 = [(CarTestCardViewController *)self dismissHandler];
    v4[2](v4, self);
  }
}

- (id)_buttonWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = -[CarFocusableButton initWithFrame:]([CarFocusableButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarFocusableButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  -[MapsLargerHitTargetButton setTouchInsets:](v5, "setTouchInsets:", 0.0, -6.0, 0.0, -6.0);
  [(CarFocusableButton *)v5 addTarget:self action:"_buttonTapped:" forControlEvents:64];
  [(CarFocusableButton *)v5 setTitle:v4 forState:0];

  LODWORD(v6) = 1148846080;
  [(CarFocusableButton *)v5 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(CarFocusableButton *)v5 setContentHuggingPriority:1 forAxis:v7];
  [(CarFocusableButton *)v5 setContentHorizontalAlignment:0];

  return v5;
}

- (id)_labelWithText:(id)a3 size:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTextAlignment:1];
  LODWORD(v8) = 1132068864;
  [v7 setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v9) = 1132068864;
  [v7 setContentHuggingPriority:1 forAxis:v9];
  LODWORD(v10) = 1144750080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v10];
  LODWORD(v11) = 1144750080;
  [v7 setContentCompressionResistancePriority:1 forAxis:v11];
  CFStringRef v12 = +[UIFont systemFontOfSize:a4 weight:UIFontWeightSemibold];
  [v7 setFont:v12];

  [v7 setText:v6];
  [v7 setLineBreakMode:1];
  [v7 setNumberOfLines:0];
  v13 = [(CarTestCardViewController *)self color];
  [v7 setTextColor:v13];

  return v7;
}

- (void)_buttonTapped:(id)a3
{
  id v19 = a3;
  id v4 = [(CarTestCardViewController *)self heightPlusButton];

  if (v4 == v19)
  {
    [(CarTestCardViewController *)self size];
    double v12 = v11;
    [(CarTestCardViewController *)self size];
    double v14 = 5.0;
LABEL_9:
    double v16 = v13 + v14;
LABEL_13:
    -[CarTestCardViewController setSize:](self, "setSize:", v12, v16);
    [(CarTestCardViewController *)self _updateSize];
    goto LABEL_14;
  }
  id v5 = [(CarTestCardViewController *)self heightMinusButton];

  if (v5 == v19)
  {
    [(CarTestCardViewController *)self size];
    double v12 = v15;
    [(CarTestCardViewController *)self size];
    double v14 = -5.0;
    goto LABEL_9;
  }
  id v6 = [(CarTestCardViewController *)self widthPlusButton];

  if (v6 == v19)
  {
    [(CarTestCardViewController *)self size];
    double v18 = 5.0;
LABEL_12:
    double v12 = v17 + v18;
    [(CarTestCardViewController *)self size];
    goto LABEL_13;
  }
  id v7 = [(CarTestCardViewController *)self widthMinusButton];

  if (v7 == v19)
  {
    [(CarTestCardViewController *)self size];
    double v18 = -5.0;
    goto LABEL_12;
  }
  id v8 = [(CarTestCardViewController *)self reloadButton];

  double v9 = v19;
  if (v8 == v19) {
    goto LABEL_15;
  }
  double v10 = [(CarTestCardViewController *)self buttonTagHandler];
  ((void (**)(void, CarTestCardViewController *, id))v10)[2](v10, self, [v19 tag]);

LABEL_14:
  double v9 = v19;
LABEL_15:
}

- (void)_updateSize
{
  [(CarTestCardViewController *)self size];
  double v4 = v3;
  id v5 = [(CarTestCardViewController *)self heightConstraint];
  [v5 setConstant:v4];

  [(CarTestCardViewController *)self size];
  double v7 = v6;
  id v8 = [(CarTestCardViewController *)self widthConstraint];
  [v8 setConstant:v7];

  [(CarTestCardViewController *)self _updateContents];
}

- (void)_updateContents
{
  double v3 = [(CarTestCardViewController *)self config];
  unsigned int v4 = [v3 compresses];

  if (v4)
  {
    [(CarTestCardViewController *)self availableCardSize];
    uint64_t v6 = v5;
    [(CarTestCardViewController *)self availableCardSize];
    uint64_t v8 = v7;
    double v9 = [(CarTestCardViewController *)self view];
    [v9 frame];
    id v20 = +[NSString stringWithFormat:@" [A:%.1f C:%.1f]", v6, v10];

    double v11 = [(CarTestCardViewController *)self view];
    [v11 frame];
    double v13 = +[NSString stringWithFormat:@" [A:%.1f C:%.1f]", v8, v12];
  }
  else
  {
    double v13 = &stru_101324E70;
    id v20 = &stru_101324E70;
  }
  [(CarTestCardViewController *)self size];
  double v15 = +[NSString stringWithFormat:@"H:%.1f%@", v14, v20];
  double v16 = [(CarTestCardViewController *)self heightLabel];
  [v16 setText:v15];

  [(CarTestCardViewController *)self size];
  double v18 = +[NSString stringWithFormat:@"W:%.1f%@", v17, v13];
  id v19 = [(CarTestCardViewController *)self widthLabel];
  [v19 setText:v18];
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  unsigned int v4 = [(CarTestCardViewController *)self config];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 layout];
    unsigned int v4 = v6;
  }
  else
  {
    *(void *)&retstr->var13 = 0;
    *(_OWORD *)&retstr->var10.bottom = 0u;
    *(_OWORD *)&retstr->var11 = 0u;
    *(_OWORD *)&retstr->var8 = 0u;
    *(_OWORD *)&retstr->var10.top = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var6 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }

  return result;
}

- (void)setAvailableCardSize:(CGSize)a3
{
  self->_availableCardSize = a3;
  [(CarTestCardViewController *)self _updateContents];
}

- (NSArray)focusOrderSubItems
{
  if ([(CarTestCardViewController *)self isViewLoaded])
  {
    heightPlusButton = self->_heightPlusButton;
    v11[0] = self->_reloadButton;
    v11[1] = heightPlusButton;
    widthPlusButton = self->_widthPlusButton;
    v11[2] = self->_heightMinusButton;
    v11[3] = widthPlusButton;
    v11[4] = self->_widthMinusButton;
    uint64_t v5 = +[NSArray arrayWithObjects:v11 count:5];
    uint64_t v6 = [(CarTestCardViewController *)self taggedButtons];
    uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

    uint64_t v8 = [v7 indexesOfObjectsPassingTest:&stru_101300600];
    double v9 = [v7 objectsAtIndexes:v8];
  }
  else
  {
    double v9 = &__NSArray0__struct;
  }

  return (NSArray *)v9;
}

- (CGSize)availableCardSize
{
  double width = self->_availableCardSize.width;
  double height = self->_availableCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)cardID
{
  return self->_cardID;
}

- (CarCardTestConfig)config
{
  return self->_config;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)buttonTagHandler
{
  return self->_buttonTagHandler;
}

- (void)setButtonTagHandler:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)color
{
  return self->_color;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)heightLabel
{
  return self->_heightLabel;
}

- (void)setHeightLabel:(id)a3
{
}

- (UILabel)widthLabel
{
  return self->_widthLabel;
}

- (void)setWidthLabel:(id)a3
{
}

- (CarFocusableButton)reloadButton
{
  return self->_reloadButton;
}

- (void)setReloadButton:(id)a3
{
}

- (CarFocusableButton)heightPlusButton
{
  return self->_heightPlusButton;
}

- (void)setHeightPlusButton:(id)a3
{
}

- (CarFocusableButton)heightMinusButton
{
  return self->_heightMinusButton;
}

- (void)setHeightMinusButton:(id)a3
{
}

- (CarFocusableButton)widthPlusButton
{
  return self->_widthPlusButton;
}

- (void)setWidthPlusButton:(id)a3
{
}

- (CarFocusableButton)widthMinusButton
{
  return self->_widthMinusButton;
}

- (void)setWidthMinusButton:(id)a3
{
}

- (NSArray)taggedButtons
{
  return self->_taggedButtons;
}

- (void)setTaggedButtons:(id)a3
{
}

- (UIView)taggedButtonsView
{
  return self->_taggedButtonsView;
}

- (void)setTaggedButtonsView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_taggedButtonsView, 0);
  objc_storeStrong((id *)&self->_taggedButtons, 0);
  objc_storeStrong((id *)&self->_widthMinusButton, 0);
  objc_storeStrong((id *)&self->_widthPlusButton, 0);
  objc_storeStrong((id *)&self->_heightMinusButton, 0);
  objc_storeStrong((id *)&self->_heightPlusButton, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_widthLabel, 0);
  objc_storeStrong((id *)&self->_heightLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_buttonTagHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_cardID, 0);
}

@end