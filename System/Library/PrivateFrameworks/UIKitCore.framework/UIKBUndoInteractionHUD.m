@interface UIKBUndoInteractionHUD
- (BOOL)availableOfControl:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSDate)appearanceDate;
- (UIInteractiveUndoHUDActionDelegate)actionDelegate;
- (UIKBUndoControl)aCopyButtonView;
- (UIKBUndoControl)aCutButtonView;
- (UIKBUndoControl)aPasteButtonView;
- (UIKBUndoControl)leftButtonView;
- (UIKBUndoControl)rightButtonView;
- (UIKBUndoInteractionHUD)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4 mode:(int64_t)a5 sceneBounds:(CGRect)a6;
- (UIKBUndoStyling)style;
- (UILabel)instructionalLabel;
- (UIView)containerView;
- (UIVisualEffectView)backgroundEffectView;
- (UIVisualEffectView)shadowView;
- (id)controlForType:(int64_t)a3;
- (id)createSeparatorView;
- (int64_t)mode;
- (void)controlActionDown:(id)a3;
- (void)controlActionUpInside:(id)a3 forEvent:(id)a4;
- (void)controlActionUpOutside:(id)a3;
- (void)layoutSubviews;
- (void)performDelegateRedoAndUpdateHUDIfNeeded;
- (void)performDelegateUndoAndUpdateHUDIfNeeded;
- (void)setACopyButtonView:(id)a3;
- (void)setACutButtonView:(id)a3;
- (void)setAPasteButtonView:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setAppearanceDate:(id)a3;
- (void)setBackgroundEffectView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setInstructionalLabel:(id)a3;
- (void)setLeftButtonView:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setRightButtonView:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateControlWithDirection:(int64_t)a3 travelProgress:(double)a4 isRTL:(BOOL)a5;
- (void)updateHUDControlState;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKBUndoInteractionHUD

- (UIKBUndoInteractionHUD)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4 mode:(int64_t)a5 sceneBounds:(CGRect)a6
{
  BOOL v7 = a4;
  double height = a6.size.height;
  double width = a6.size.width;
  v291[1] = *MEMORY[0x1E4F143B8];
  v288.receiver = self;
  v288.super_class = (Class)UIKBUndoInteractionHUD;
  v11 = -[UIView initWithFrame:](&v288, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (!v11) {
    goto LABEL_47;
  }
  v11->_int64_t mode = a5;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = [(UIView *)v11 traitCollection];
    if ([v13 userInterfaceStyle] == 2) {
      a3 = 1;
    }
    else {
      a3 = 2;
    }
  }
  v14 = [[UIKBUndoStyling alloc] initWithKeyboardAppearance:a3 isRTL:v7];
  style = v12->_style;
  v12->_style = v14;

  if (width >= height) {
    double v16 = height;
  }
  else {
    double v16 = width;
  }
  BOOL v287 = v7;
  if (v16 < 425.0)
  {
    [(UIKBUndoStyling *)v12->_style setUndoRedoIconOnly:1];
    [(UIKBUndoStyling *)v12->_style setCutCopyPasteIconOnly:v12->_mode == 0];
    [(UIKBUndoStyling *)v12->_style setTooSmallForInstructionalText:1];
    BOOL v285 = width < 425.0;
    goto LABEL_36;
  }
  uint64_t v290 = *(void *)off_1E52D2040;
  v17 = [(UIKBUndoStyling *)v12->_style undoInteractiveControlLabelFont];
  v291[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v291 forKeys:&v290 count:1];

  v19 = _UILocalizedStringInSystemLanguage(@"UNDO_BUTTON_TITLE_LABEL_IN_HUD", @"Undo");
  [v19 sizeWithAttributes:v18];
  double v21 = v20 + 42.0 + 4.0 + 20.0;

  v22 = _UILocalizedStringInSystemLanguage(@"REDO_BUTTON_TITLE_LABEL_IN_HUD", @"Redo");
  [v22 sizeWithAttributes:v18];
  double v24 = v23 + 42.0 + 4.0 + 20.0;

  v25 = _UILocalizedStringInSystemLanguage(@"Cut", @"Cut");
  [v25 sizeWithAttributes:v18];
  double v27 = v26;

  v28 = _UILocalizedStringInSystemLanguage(@"Copy", @"Copy");
  [v28 sizeWithAttributes:v18];
  double v30 = v29;

  v31 = _UILocalizedStringInSystemLanguage(@"Paste", @"Paste");
  [v31 sizeWithAttributes:v18];
  double v33 = v32;

  if (v21 >= v24) {
    double v24 = v21;
  }
  if (v24 >= 94.0)
  {
    v34 = v12->_style;
    if (v24 > 94.0 && v24 < 120.0) {
      [(UIKBUndoStyling *)v34 setUndoRedoIconOnly:0];
    }
    else {
      [(UIKBUndoStyling *)v34 setUndoRedoIconOnly:1];
    }
  }
  else
  {
    [(UIKBUndoStyling *)v12->_style setUndoRedoIconOnly:0];
  }
  if ([(UIKBUndoStyling *)v12->_style undoRedoIconOnly])
  {
    v36 = v12->_style;
  }
  else
  {
    double v37 = v27 + 20.0;
    if (v27 + 20.0 < v30 + 20.0) {
      double v37 = v30 + 20.0;
    }
    if (v37 >= v33 + 20.0) {
      double v38 = v37;
    }
    else {
      double v38 = v33 + 20.0;
    }
    if (v38 < 55.0)
    {
      [(UIKBUndoStyling *)v12->_style setCutCopyPasteIconOnly:0];
      goto LABEL_35;
    }
    v36 = v12->_style;
    if (v38 > 55.0 && v38 < 61.0)
    {
      [(UIKBUndoStyling *)v36 setCutCopyPasteIconOnly:0];
      goto LABEL_35;
    }
  }
  [(UIKBUndoStyling *)v36 setCutCopyPasteIconOnly:1];
LABEL_35:

  BOOL v285 = 0;
LABEL_36:
  UICeilToViewScale(v12);
  -[UIKBUndoStyling setUndoControlMinWidth:](v12->_style, "setUndoControlMinWidth:");
  UICeilToViewScale(v12);
  -[UIKBUndoStyling setCutControlMinWidth:](v12->_style, "setCutControlMinWidth:");
  v39 = [(UIView *)v12 heightAnchor];
  v40 = [v39 constraintEqualToConstant:37.0];
  [v40 setActive:1];

  v41 = objc_alloc_init(UIVisualEffectView);
  shadowView = v12->_shadowView;
  v12->_shadowView = v41;

  v43 = +[UIVibrancyEffect _vibrantShadowEffect];
  v289 = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v289 count:1];
  [(UIVisualEffectView *)v12->_shadowView setContentEffects:v44];

  [(UIView *)v12->_shadowView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v12 setClipsToBounds:0];
  [(UIView *)v12 addSubview:v12->_shadowView];
  v45 = +[UIColor separatorColor];
  [(UIView *)v12->_shadowView setBackgroundColor:v45];

  v46 = [(UIView *)v12->_shadowView layer];
  [v46 setMasksToBounds:0];

  v47 = [(UIView *)v12->_shadowView layer];
  [v47 setCornerRadius:18.5];

  id v48 = [(UIKBUndoStyling *)v12->_style HUDShadowColor];
  uint64_t v49 = [v48 CGColor];
  v50 = [(UIView *)v12->_shadowView layer];
  [v50 setShadowColor:v49];

  v51 = [(UIView *)v12->_shadowView layer];
  objc_msgSend(v51, "setShadowOffset:", 0.0, 0.0);

  v52 = [(UIView *)v12->_shadowView layer];
  LODWORD(v53) = 0.5;
  [v52 setShadowOpacity:v53];

  v54 = [(UIView *)v12->_shadowView layer];
  [v54 setShadowRadius:15.0];

  v55 = [(UIView *)v12->_shadowView centerXAnchor];
  v56 = [(UIView *)v12 centerXAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  [v57 setActive:1];

  v58 = [(UIView *)v12->_shadowView centerYAnchor];
  v59 = [(UIView *)v12 centerYAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [(UIView *)v12->_shadowView widthAnchor];
  v62 = [(UIView *)v12 widthAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  v64 = [(UIView *)v12->_shadowView heightAnchor];
  v65 = [(UIView *)v12 heightAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  [v66 setActive:1];

  v67 = objc_alloc_init(UIKBUndoHUDContainerView);
  containerView = v12->_containerView;
  v12->_containerView = &v67->super;

  [(UIView *)v12->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v12 addSubview:v12->_containerView];
  v69 = [(UIView *)v12->_containerView layer];
  [v69 setCornerRadius:18.5];

  [(UIView *)v12->_containerView setClipsToBounds:1];
  v70 = +[UIColor separatorColor];
  v71 = [v70 colorWithAlphaComponent:0.33];
  [(UIView *)v12->_containerView setBackgroundColor:v71];

  v72 = [(UIView *)v12->_containerView centerXAnchor];
  v73 = [(UIView *)v12 centerXAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  [v74 setActive:1];

  v75 = [(UIView *)v12->_containerView centerYAnchor];
  v76 = [(UIView *)v12 centerYAnchor];
  v77 = [v75 constraintEqualToAnchor:v76];
  [v77 setActive:1];

  v78 = [(UIView *)v12->_containerView widthAnchor];
  v79 = [(UIView *)v12 widthAnchor];
  v80 = [v78 constraintEqualToAnchor:v79];
  [v80 setActive:1];

  v81 = [(UIView *)v12->_containerView heightAnchor];
  v82 = [(UIView *)v12 heightAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  [v83 setActive:1];

  v84 = [UIVisualEffectView alloc];
  v85 = [(UIKBUndoInteractionHUD *)v12 style];
  v86 = [v85 backgroundBlurEffect];
  v87 = [(UIVisualEffectView *)v84 initWithEffect:v86];

  [(UIView *)v87 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v12->_containerView addSubview:v87];
  v88 = [(UIView *)v87 centerXAnchor];
  v89 = [(UIView *)v12 centerXAnchor];
  v90 = [v88 constraintEqualToAnchor:v89];
  [v90 setActive:1];

  v91 = [(UIView *)v87 centerYAnchor];
  v92 = [(UIView *)v12 centerYAnchor];
  v93 = [v91 constraintEqualToAnchor:v92];
  [v93 setActive:1];

  v94 = [(UIView *)v87 heightAnchor];
  v95 = [(UIView *)v12 heightAnchor];
  v96 = [v94 constraintEqualToAnchor:v95 multiplier:1.0];
  [v96 setActive:1];

  v97 = [(UIView *)v87 widthAnchor];
  v98 = [(UIView *)v12->_containerView widthAnchor];
  v99 = [v97 constraintEqualToAnchor:v98 multiplier:1.0];
  [v99 setActive:1];

  v100 = [UIVisualEffectView alloc];
  v101 = [(UIKBUndoInteractionHUD *)v12 style];
  v102 = [v101 backgroundVibrancyEffect];
  uint64_t v103 = [(UIVisualEffectView *)v100 initWithEffect:v102];
  backgroundEffectView = v12->_backgroundEffectView;
  v12->_backgroundEffectView = (UIVisualEffectView *)v103;

  [(UIView *)v12->_backgroundEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  v286 = v87;
  v105 = [(UIVisualEffectView *)v87 contentView];
  [v105 addSubview:v12->_backgroundEffectView];

  v106 = [(UIView *)v12->_backgroundEffectView centerXAnchor];
  v107 = [(UIView *)v12 centerXAnchor];
  v108 = [v106 constraintEqualToAnchor:v107];
  [v108 setActive:1];

  v109 = [(UIView *)v12->_backgroundEffectView centerYAnchor];
  v110 = [(UIView *)v12 centerYAnchor];
  v111 = [v109 constraintEqualToAnchor:v110];
  [v111 setActive:1];

  v112 = [(UIView *)v12->_backgroundEffectView heightAnchor];
  v113 = [(UIView *)v12 heightAnchor];
  v114 = [v112 constraintEqualToAnchor:v113 multiplier:1.0];
  [v114 setActive:1];

  v115 = [(UIView *)v12->_backgroundEffectView widthAnchor];
  v116 = [(UIView *)v12 widthAnchor];
  v117 = [v115 constraintEqualToAnchor:v116 multiplier:1.0];
  [v117 setActive:1];

  int64_t mode = v12->_mode;
  if (mode == 1)
  {
    v233 = [[UIKBUndoControl alloc] initWithType:6 andStyling:v12->_style];
    aPasteButtonView = v12->_aPasteButtonView;
    v12->_aPasteButtonView = v233;

    [(UIView *)v12->_aPasteButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_aPasteButtonView];
    v235 = [(UIView *)v12->_aPasteButtonView trailingAnchor];
    v236 = [(UIView *)v12->_containerView trailingAnchor];
    v237 = [v235 constraintEqualToAnchor:v236];
    [v237 setActive:1];

    v238 = [(UIView *)v12->_aPasteButtonView topAnchor];
    v239 = [(UIView *)v12 topAnchor];
    v240 = [v238 constraintEqualToAnchor:v239];
    [v240 setActive:1];

    v241 = [(UIView *)v12->_aPasteButtonView bottomAnchor];
    v242 = [(UIView *)v12 bottomAnchor];
    v243 = [v241 constraintEqualToAnchor:v242];
    [v243 setActive:1];

    [(UIControl *)v12->_aPasteButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    if (v285)
    {
      v244 = [(UIView *)v12->_aPasteButtonView leadingAnchor];
      v245 = [(UIView *)v12->_containerView leadingAnchor];
      v246 = [v244 constraintEqualToAnchor:v245];
      [v246 setActive:1];

      v217 = [(UIView *)v12->_aPasteButtonView widthAnchor];
      v232 = [v217 constraintEqualToConstant:116.0];
      [v232 setActive:1];
    }
    else
    {
      uint64_t v247 = objc_opt_new();
      instructionalLabel = v12->_instructionalLabel;
      v12->_instructionalLabel = (UILabel *)v247;

      v249 = [(UIKBUndoStyling *)v12->_style undoInteractiveControlLabelFont];
      [(UILabel *)v12->_instructionalLabel setFont:v249];

      v250 = _UILocalizedStringInSystemLanguage(@"PASTE_CONFIRMATION_LABEL_TEXT", @"This application is trying to read the clipboard.");
      [(UILabel *)v12->_instructionalLabel setText:v250];

      [(UILabel *)v12->_instructionalLabel setTextAlignment:1];
      [(UIView *)v12->_containerView addSubview:v12->_instructionalLabel];
      [(UIView *)v12->_instructionalLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v251 = [(UIView *)v12->_instructionalLabel leadingAnchor];
      v252 = [(UIView *)v12->_containerView leadingAnchor];
      v253 = [v251 constraintEqualToAnchor:v252 constant:16.0];
      [v253 setActive:1];

      v254 = [(UIView *)v12->_instructionalLabel firstBaselineAnchor];
      v255 = [(UIView *)v12->_aPasteButtonView firstBaselineAnchor];
      v256 = [v254 constraintEqualToAnchor:v255];
      [v256 setActive:1];

      v217 = [(UIKBUndoInteractionHUD *)v12 createSeparatorView];
      v257 = [(UIVisualEffectView *)v12->_backgroundEffectView contentView];
      [v257 addSubview:v217];

      v258 = [v217 heightAnchor];
      v259 = [(UIView *)v12->_containerView heightAnchor];
      v260 = [v258 constraintEqualToAnchor:v259];
      [v260 setActive:1];

      v261 = [v217 leadingAnchor];
      v262 = [(UIView *)v12->_instructionalLabel trailingAnchor];
      v263 = [v261 constraintEqualToAnchor:v262 constant:16.0];
      [v263 setActive:1];

      v264 = [(UIView *)v12->_aPasteButtonView leadingAnchor];
      v265 = [v217 trailingAnchor];
      v266 = [v264 constraintEqualToAnchor:v265];
      [v266 setActive:1];

      v232 = objc_opt_new();
      v267 = [(UIKBUndoStyling *)v12->_style HUDbackgroundColor];
      [v232 setBackgroundColor:v267];

      [v232 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v12->_containerView insertSubview:v232 below:v12->_instructionalLabel];
      v268 = [v232 leadingAnchor];
      v269 = [(UIView *)v12 leadingAnchor];
      v270 = [v268 constraintEqualToAnchor:v269];
      [v270 setActive:1];

      v271 = [v232 trailingAnchor];
      v272 = [v217 leadingAnchor];
      v273 = [v271 constraintEqualToAnchor:v272];
      [v273 setActive:1];

      v274 = [v232 topAnchor];
      v275 = [(UIView *)v12 topAnchor];
      v276 = [v274 constraintEqualToAnchor:v275];
      [v276 setActive:1];

      v277 = [v232 bottomAnchor];
      v278 = [(UIView *)v12 bottomAnchor];
      v279 = [v277 constraintEqualToAnchor:v278];
      [v279 setActive:1];
    }
    goto LABEL_42;
  }
  if (!mode)
  {
    v119 = [[UIKBUndoControl alloc] initWithType:1 andStyling:v12->_style];
    leftButtonView = v12->_leftButtonView;
    v12->_leftButtonView = v119;

    [(UIView *)v12->_leftButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_leftButtonView];
    v121 = [(UIView *)v12->_leftButtonView leadingAnchor];
    v122 = [(UIView *)v12 leadingAnchor];
    v123 = [v121 constraintEqualToAnchor:v122];
    [v123 setActive:1];

    v124 = [(UIView *)v12->_leftButtonView centerYAnchor];
    v125 = [(UIView *)v12 centerYAnchor];
    v126 = [v124 constraintEqualToAnchor:v125];
    [v126 setActive:1];

    v127 = [(UIView *)v12->_leftButtonView heightAnchor];
    v128 = [(UIView *)v12 heightAnchor];
    v129 = [v127 constraintEqualToAnchor:v128 multiplier:1.0];
    [v129 setActive:1];

    v130 = [(UIView *)v12->_leftButtonView widthAnchor];
    [(UIKBUndoStyling *)v12->_style undoControlMinWidth];
    v131 = objc_msgSend(v130, "constraintGreaterThanOrEqualToConstant:");
    [v131 setActive:1];

    v132 = [(UIView *)v12->_leftButtonView widthAnchor];
    v133 = [v132 constraintLessThanOrEqualToConstant:120.0];
    [v133 setActive:1];

    [(UIControl *)v12->_leftButtonView addTarget:v12 action:sel_controlActionDown_ forControlEvents:1];
    [(UIControl *)v12->_leftButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    [(UIControl *)v12->_leftButtonView addTarget:v12 action:sel_controlActionUpOutside_ forControlEvents:128];
    v134 = [[UIKBUndoControl alloc] initWithType:2 andStyling:v12->_style];
    rightButtonView = v12->_rightButtonView;
    v12->_rightButtonView = v134;

    [(UIView *)v12->_rightButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_rightButtonView];
    v136 = [(UIView *)v12->_rightButtonView trailingAnchor];
    v137 = [(UIView *)v12 trailingAnchor];
    v138 = [v136 constraintEqualToAnchor:v137];
    [v138 setActive:1];

    v139 = [(UIView *)v12->_rightButtonView centerYAnchor];
    v140 = [(UIView *)v12 centerYAnchor];
    v141 = [v139 constraintEqualToAnchor:v140];
    [v141 setActive:1];

    v142 = [(UIView *)v12->_rightButtonView heightAnchor];
    v143 = [(UIView *)v12 heightAnchor];
    v144 = [v142 constraintEqualToAnchor:v143 multiplier:1.0];
    [v144 setActive:1];

    v145 = [(UIView *)v12->_rightButtonView widthAnchor];
    v146 = [(UIView *)v12->_leftButtonView widthAnchor];
    v147 = [v145 constraintEqualToAnchor:v146 multiplier:1.0];
    [v147 setActive:1];

    [(UIControl *)v12->_rightButtonView addTarget:v12 action:sel_controlActionDown_ forControlEvents:1];
    [(UIControl *)v12->_rightButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    [(UIControl *)v12->_rightButtonView addTarget:v12 action:sel_controlActionUpOutside_ forControlEvents:128];
    v148 = [[UIKBUndoControl alloc] initWithType:3 andStyling:v12->_style];
    aCutButtonView = v12->_aCutButtonView;
    v12->_aCutButtonView = v148;

    [(UIView *)v12->_aCutButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_aCutButtonView];
    v150 = [(UIKBUndoInteractionHUD *)v12 createSeparatorView];
    v151 = [(UIVisualEffectView *)v12->_backgroundEffectView contentView];
    [v151 addSubview:v150];

    v152 = [v150 heightAnchor];
    v153 = [(UIKBUndoInteractionHUD *)v12 containerView];
    v154 = [v153 heightAnchor];
    v155 = [v152 constraintEqualToAnchor:v154];
    [v155 setActive:1];

    v284 = v150;
    v156 = [v150 leadingAnchor];
    v157 = [(UIView *)v12->_leftButtonView trailingAnchor];
    v158 = [v156 constraintEqualToAnchor:v157];
    [v158 setActive:1];

    v159 = [(UIView *)v12->_aCutButtonView leadingAnchor];
    v160 = [v150 trailingAnchor];
    v161 = [v159 constraintEqualToAnchor:v160];
    [v161 setActive:1];

    v162 = [(UIView *)v12->_aCutButtonView centerYAnchor];
    v163 = [(UIView *)v12 centerYAnchor];
    v164 = [v162 constraintEqualToAnchor:v163];
    [v164 setActive:1];

    v165 = [(UIView *)v12->_aCutButtonView heightAnchor];
    v166 = [(UIView *)v12 heightAnchor];
    v167 = [v165 constraintEqualToAnchor:v166 multiplier:1.0];
    [v167 setActive:1];

    v168 = [(UIView *)v12->_aCutButtonView widthAnchor];
    [(UIKBUndoStyling *)v12->_style cutControlMinWidth];
    v169 = objc_msgSend(v168, "constraintGreaterThanOrEqualToConstant:");
    [v169 setActive:1];

    [(UIControl *)v12->_aCutButtonView addTarget:v12 action:sel_controlActionDown_ forControlEvents:1];
    [(UIControl *)v12->_aCutButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    [(UIControl *)v12->_aCutButtonView addTarget:v12 action:sel_controlActionUpOutside_ forControlEvents:128];
    v170 = [[UIKBUndoControl alloc] initWithType:4 andStyling:v12->_style];
    aCopyButtonView = v12->_aCopyButtonView;
    v12->_aCopyButtonView = v170;

    [(UIView *)v12->_aCopyButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_aCopyButtonView];
    v172 = [(UIKBUndoInteractionHUD *)v12 createSeparatorView];
    v173 = [(UIVisualEffectView *)v12->_backgroundEffectView contentView];
    [v173 addSubview:v172];

    v174 = [v172 heightAnchor];
    v175 = [(UIKBUndoInteractionHUD *)v12 containerView];
    v176 = [v175 heightAnchor];
    v177 = [v174 constraintEqualToAnchor:v176];
    [v177 setActive:1];

    v283 = v172;
    v178 = [v172 leadingAnchor];
    v179 = [(UIView *)v12->_aCutButtonView trailingAnchor];
    v180 = [v178 constraintEqualToAnchor:v179];
    [v180 setActive:1];

    v181 = [(UIView *)v12->_aCopyButtonView centerXAnchor];
    v182 = [(UIView *)v12 centerXAnchor];
    v183 = [v181 constraintEqualToAnchor:v182];
    [v183 setActive:1];

    v184 = [(UIView *)v12->_aCopyButtonView leadingAnchor];
    v185 = [v172 trailingAnchor];
    v186 = [v184 constraintEqualToAnchor:v185];
    [v186 setActive:1];

    v187 = [(UIView *)v12->_aCopyButtonView centerYAnchor];
    v188 = [(UIView *)v12 centerYAnchor];
    v189 = [v187 constraintEqualToAnchor:v188];
    [v189 setActive:1];

    v190 = [(UIView *)v12->_aCopyButtonView heightAnchor];
    v191 = [(UIView *)v12->_aCutButtonView heightAnchor];
    v192 = [v190 constraintEqualToAnchor:v191 multiplier:1.0];
    [v192 setActive:1];

    v193 = [(UIView *)v12->_aCopyButtonView widthAnchor];
    v194 = [(UIView *)v12->_aCutButtonView widthAnchor];
    v195 = [v193 constraintEqualToAnchor:v194 multiplier:1.0];
    [v195 setActive:1];

    [(UIControl *)v12->_aCopyButtonView addTarget:v12 action:sel_controlActionDown_ forControlEvents:1];
    [(UIControl *)v12->_aCopyButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    [(UIControl *)v12->_aCopyButtonView addTarget:v12 action:sel_controlActionUpOutside_ forControlEvents:128];
    v196 = [[UIKBUndoControl alloc] initWithType:5 andStyling:v12->_style];
    v197 = v12->_aPasteButtonView;
    v12->_aPasteButtonView = v196;

    [(UIView *)v12->_aPasteButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v12->_containerView addSubview:v12->_aPasteButtonView];
    v198 = [(UIKBUndoInteractionHUD *)v12 createSeparatorView];
    v199 = [(UIVisualEffectView *)v12->_backgroundEffectView contentView];
    [v199 addSubview:v198];

    v200 = [v198 heightAnchor];
    v201 = [(UIKBUndoInteractionHUD *)v12 containerView];
    v202 = [v201 heightAnchor];
    v203 = [v200 constraintEqualToAnchor:v202];
    [v203 setActive:1];

    v204 = [v198 leadingAnchor];
    v205 = [(UIView *)v12->_aCopyButtonView trailingAnchor];
    v206 = [v204 constraintEqualToAnchor:v205];
    [v206 setActive:1];

    v207 = [(UIView *)v12->_aPasteButtonView leadingAnchor];
    v208 = [v198 trailingAnchor];
    v209 = [v207 constraintEqualToAnchor:v208];
    [v209 setActive:1];

    v210 = [(UIView *)v12->_aPasteButtonView centerYAnchor];
    v211 = [(UIView *)v12 centerYAnchor];
    v212 = [v210 constraintEqualToAnchor:v211];
    [v212 setActive:1];

    v213 = [(UIView *)v12->_aPasteButtonView heightAnchor];
    v214 = [(UIView *)v12->_aCutButtonView heightAnchor];
    v215 = [v213 constraintEqualToAnchor:v214 multiplier:1.0];
    [v215 setActive:1];

    v216 = [(UIView *)v12->_aPasteButtonView widthAnchor];
    v217 = v284;
    v218 = [(UIView *)v12->_aCutButtonView widthAnchor];
    v219 = [v216 constraintEqualToAnchor:v218 multiplier:1.0];
    [v219 setActive:1];

    [(UIControl *)v12->_aPasteButtonView addTarget:v12 action:sel_controlActionDown_ forControlEvents:1];
    [(UIControl *)v12->_aPasteButtonView addTarget:v12 action:sel_controlActionUpInside_forEvent_ forControlEvents:64];
    [(UIControl *)v12->_aPasteButtonView addTarget:v12 action:sel_controlActionUpOutside_ forControlEvents:128];
    v220 = [(UIKBUndoInteractionHUD *)v12 createSeparatorView];
    v221 = [(UIVisualEffectView *)v12->_backgroundEffectView contentView];
    [v221 addSubview:v220];

    v222 = [v220 heightAnchor];
    v223 = [(UIKBUndoInteractionHUD *)v12 containerView];
    v224 = [v223 heightAnchor];
    v225 = [v222 constraintEqualToAnchor:v224];
    [v225 setActive:1];

    v226 = [v220 leadingAnchor];
    v227 = [(UIView *)v12->_aPasteButtonView trailingAnchor];
    v228 = [v226 constraintEqualToAnchor:v227];
    [v228 setActive:1];

    v229 = [(UIView *)v12->_rightButtonView leadingAnchor];
    v230 = [v220 trailingAnchor];
    v231 = [v229 constraintEqualToAnchor:v230];
    [v231 setActive:1];

    v232 = v283;
    [(UIKBUndoControl *)v12->_aPasteButtonView configureSecurePasteButtonInRootView:v12];

LABEL_42:
  }
  if (v287) {
    uint64_t v280 = 4;
  }
  else {
    uint64_t v280 = 3;
  }
  [(UIView *)v12->_rightButtonView setSemanticContentAttribute:v280];
  [(UIView *)v12->_leftButtonView setSemanticContentAttribute:v280];
  [(UIView *)v12->_aCutButtonView setSemanticContentAttribute:v280];
  [(UIView *)v12->_aCopyButtonView setSemanticContentAttribute:v280];
  [(UIView *)v12->_aPasteButtonView setSemanticContentAttribute:v280];
  [(UIView *)v12->_containerView setSemanticContentAttribute:v280];
  [(UIView *)v12 setSemanticContentAttribute:v280];
  [v12 setAccessibilityIdentifier:@"UIUndoInteractiveHUD"];
  v281 = v12;

LABEL_47:
  return v12;
}

- (id)createSeparatorView
{
  v2 = objc_alloc_init(UIView);
  v3 = +[UIColor separatorColor];
  v4 = [v3 colorWithAlphaComponent:0.1];
  [(UIView *)v2 setBackgroundColor:v4];

  [(UIView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIScreen mainScreen];
  [v5 nativeScale];
  double v7 = 1.0 / v6;

  v8 = [(UIView *)v2 widthAnchor];
  v9 = [v8 constraintEqualToConstant:v7];
  [v9 setActive:1];

  return v2;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBUndoInteractionHUD;
  [(UIView *)&v8 layoutSubviews];
  v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  v5 = [(UIKBUndoInteractionHUD *)self style];
  [v5 setAppearance:v4];

  double v6 = [(UIView *)self traitOverrides];
  double v7 = self;
  [v6 setNSIntegerValue:v4 forTrait:v7];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self bounds];
  double v7 = v6 + -20.0;
  double v9 = v8 + 40.0;
  double v11 = v10 + -20.0;
  double v13 = v12 + 40.0;
  CGFloat v14 = x;
  CGFloat v15 = y;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v14);
}

- (id)controlForType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      uint64_t v3 = 424;
      goto LABEL_11;
    case 2:
      uint64_t v3 = 432;
      goto LABEL_11;
    case 3:
      uint64_t v3 = 440;
      goto LABEL_11;
    case 4:
      uint64_t v3 = 448;
      goto LABEL_11;
    case 5:
    case 6:
      uint64_t v3 = 456;
LABEL_11:
      id v6 = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
    default:
      if (os_variant_has_internal_diagnostics())
      {
        double v8 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          int v9 = 134217984;
          int64_t v10 = a3;
          _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected control type: %ld", (uint8_t *)&v9, 0xCu);
        }
      }
      else
      {
        v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &controlForType____s_category) + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          int v9 = 134217984;
          int64_t v10 = a3;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Unexpected control type: %ld", (uint8_t *)&v9, 0xCu);
        }
      }
      id v6 = 0;
      break;
  }
  return v6;
}

- (BOOL)availableOfControl:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 1)
  {
    v5 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    char v6 = [v5 canUndo];
  }
  else if ([v4 type] == 2)
  {
    v5 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    char v6 = [v5 canRedo];
  }
  else if ([v4 type] == 3)
  {
    v5 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    char v6 = [v5 canCut];
  }
  else if ([v4 type] == 4)
  {
    v5 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    char v6 = [v5 canCopy];
  }
  else
  {
    if ([v4 type] != 5)
    {
      BOOL v7 = [v4 type] == 6;
      goto LABEL_12;
    }
    v5 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    char v6 = [v5 canPaste];
  }
  BOOL v7 = v6;

LABEL_12:
  return v7;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [(UIKBUndoInteractionHUD *)self setAppearanceDate:v4];
  }
  else
  {
    -[UIKBUndoInteractionHUD setAppearanceDate:](self, "setAppearanceDate:");
  }
}

- (void)updateHUDControlState
{
  uint64_t v3 = [(UIKBUndoInteractionHUD *)self leftButtonView];
  BOOL v4 = [(UIKBUndoInteractionHUD *)self availableOfControl:v3];
  v5 = [(UIKBUndoInteractionHUD *)self leftButtonView];
  [v5 setEnabled:v4];

  char v6 = [(UIKBUndoInteractionHUD *)self leftButtonView];
  [v6 updateUndoControlStyle];

  BOOL v7 = [(UIKBUndoInteractionHUD *)self rightButtonView];
  BOOL v8 = [(UIKBUndoInteractionHUD *)self availableOfControl:v7];
  int v9 = [(UIKBUndoInteractionHUD *)self rightButtonView];
  [v9 setEnabled:v8];

  int64_t v10 = [(UIKBUndoInteractionHUD *)self rightButtonView];
  [v10 updateUndoControlStyle];

  uint64_t v11 = [(UIKBUndoInteractionHUD *)self aCutButtonView];
  BOOL v12 = [(UIKBUndoInteractionHUD *)self availableOfControl:v11];
  double v13 = [(UIKBUndoInteractionHUD *)self aCutButtonView];
  [v13 setEnabled:v12];

  CGFloat v14 = [(UIKBUndoInteractionHUD *)self aCutButtonView];
  [v14 updateUndoControlStyle];

  CGFloat v15 = [(UIKBUndoInteractionHUD *)self aCopyButtonView];
  BOOL v16 = [(UIKBUndoInteractionHUD *)self availableOfControl:v15];
  v17 = [(UIKBUndoInteractionHUD *)self aCopyButtonView];
  [v17 setEnabled:v16];

  v18 = [(UIKBUndoInteractionHUD *)self aCopyButtonView];
  [v18 updateUndoControlStyle];

  v19 = [(UIKBUndoInteractionHUD *)self aPasteButtonView];
  BOOL v20 = [(UIKBUndoInteractionHUD *)self availableOfControl:v19];
  double v21 = [(UIKBUndoInteractionHUD *)self aPasteButtonView];
  [v21 setEnabled:v20];

  v22 = [(UIKBUndoInteractionHUD *)self aPasteButtonView];
  [v22 updateUndoControlStyle];

  [(UIView *)self layoutIfNeeded];
}

- (void)performDelegateUndoAndUpdateHUDIfNeeded
{
  uint64_t v3 = [(UIKBUndoInteractionHUD *)self actionDelegate];

  if (v3)
  {
    id v4 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    [v4 undo:0];
  }
}

- (void)performDelegateRedoAndUpdateHUDIfNeeded
{
  uint64_t v3 = [(UIKBUndoInteractionHUD *)self actionDelegate];

  if (v3)
  {
    id v4 = [(UIKBUndoInteractionHUD *)self actionDelegate];
    [v4 redo:0];
  }
}

- (void)controlActionDown:(id)a3
{
  id v5 = a3;
  if ([v5 state] != 2)
  {
    if ([v5 type] == 5)
    {
      id v4 = [(UIKBUndoInteractionHUD *)self appearanceDate];
      _UIPasteboardAnalyticsReportEvent(@"UndoHUD", v4);
    }
    [v5 updateUndoControlStyle];
  }
}

- (void)controlActionUpInside:(id)a3 forEvent:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 state] != 2)
  {
    BOOL v7 = +[UIKeyboardImpl activeInstance];
    [v7 updateIdleDetection:5];

    if ([v13 type] == 1)
    {
      [(UIKBUndoInteractionHUD *)self performDelegateUndoAndUpdateHUDIfNeeded];
      BOOL v8 = UIKBAnalyticsTextEditingOperationUndo;
    }
    else if ([v13 type] == 2)
    {
      [(UIKBUndoInteractionHUD *)self performDelegateRedoAndUpdateHUDIfNeeded];
      BOOL v8 = UIKBAnalyticsTextEditingOperationRedo;
    }
    else if ([v13 type] == 3)
    {
      int v9 = [(UIKBUndoInteractionHUD *)self actionDelegate];
      [v9 cutOperation];

      BOOL v8 = UIKBAnalyticsTextEditingOperationCut;
    }
    else if ([v13 type] == 4)
    {
      int64_t v10 = [(UIKBUndoInteractionHUD *)self actionDelegate];
      [v10 copyOperation];

      BOOL v8 = UIKBAnalyticsTextEditingOperationCopy;
    }
    else
    {
      if ([v13 type] != 5 && objc_msgSend(v13, "type") != 6) {
        goto LABEL_14;
      }
      uint64_t v11 = [v6 _authenticationMessage];
      +[UIPasteboard _attemptAuthenticationWithMessage:v11];

      BOOL v12 = [(UIKBUndoInteractionHUD *)self actionDelegate];
      [v12 pasteOperation];

      BOOL v8 = UIKBAnalyticsTextEditingOperationPaste;
    }
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:*v8 trigger:@"UndoHUDControl"];
LABEL_14:
    [v13 setHighlighted:0];
    [v13 updateUndoControlStyle];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)controlActionUpOutside:(id)a3
{
  id v4 = a3;
  if ([v4 state] != 2)
  {
    [v4 updateUndoControlStyle];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)updateControlWithDirection:(int64_t)a3 travelProgress:(double)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = 0;
  switch(a3)
  {
    case 2:
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 3:
      if (a5)
      {
LABEL_5:
        uint64_t v8 = [(UIKBUndoInteractionHUD *)self leftButtonView];
      }
      else
      {
LABEL_3:
        uint64_t v8 = [(UIKBUndoInteractionHUD *)self rightButtonView];
      }
      goto LABEL_9;
    case 8:
      uint64_t v8 = [(UIKBUndoInteractionHUD *)self aCopyButtonView];
      goto LABEL_9;
    case 9:
      uint64_t v8 = [(UIKBUndoInteractionHUD *)self aCutButtonView];
      goto LABEL_9;
    case 10:
      uint64_t v8 = [(UIKBUndoInteractionHUD *)self aPasteButtonView];
LABEL_9:
      BOOL v7 = (void *)v8;
      break;
    default:
      break;
  }
  id v9 = v7;
  [v7 updateCoverWithTavelProcess:v5 isRTL:a4];
}

- (UIInteractiveUndoHUDActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (UIInteractiveUndoHUDActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_int64_t mode = a3;
}

- (UIKBUndoControl)leftButtonView
{
  return self->_leftButtonView;
}

- (void)setLeftButtonView:(id)a3
{
}

- (UIKBUndoControl)rightButtonView
{
  return self->_rightButtonView;
}

- (void)setRightButtonView:(id)a3
{
}

- (UIKBUndoControl)aCutButtonView
{
  return self->_aCutButtonView;
}

- (void)setACutButtonView:(id)a3
{
}

- (UIKBUndoControl)aCopyButtonView
{
  return self->_aCopyButtonView;
}

- (void)setACopyButtonView:(id)a3
{
}

- (UIKBUndoControl)aPasteButtonView
{
  return self->_aPasteButtonView;
}

- (void)setAPasteButtonView:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (UIVisualEffectView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIKBUndoStyling)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (UILabel)instructionalLabel
{
  return self->_instructionalLabel;
}

- (void)setInstructionalLabel:(id)a3
{
}

- (NSDate)appearanceDate
{
  return self->_appearanceDate;
}

- (void)setAppearanceDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceDate, 0);
  objc_storeStrong((id *)&self->_instructionalLabel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_aPasteButtonView, 0);
  objc_storeStrong((id *)&self->_aCopyButtonView, 0);
  objc_storeStrong((id *)&self->_aCutButtonView, 0);
  objc_storeStrong((id *)&self->_rightButtonView, 0);
  objc_storeStrong((id *)&self->_leftButtonView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
}

@end