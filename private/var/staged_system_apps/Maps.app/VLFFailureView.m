@interface VLFFailureView
- (NSLayoutConstraint)buttonPaddingConstraint;
- (NSLayoutConstraint)dismissButtonHeightConstraint;
- (NSLayoutConstraint)labelPaddingConstraint;
- (NSLayoutConstraint)retryButtonHeightConstraint;
- (NSLayoutConstraint)titleLabelLeadingConstraint;
- (NSLayoutConstraint)titleLabelTrailingConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIButton)dismissButton;
- (UIButton)retryButton;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)textContainerView;
- (UIView)topContentView;
- (VLFFailureView)initWithFrame:(CGRect)a3;
- (VLFFailureViewDelegate)delegate;
- (VLFSessionStateManager)stateManager;
- (id)_buttonFont;
- (id)_descriptionFont;
- (id)_fontWithTextStyle:(id)a3 weight:(double)a4;
- (unint64_t)currentLayout;
- (void)_dismissButtonTapped:(id)a3;
- (void)_retryButtonTapped:(id)a3;
- (void)_updateBackgroundColor;
- (void)_updateFonts;
- (void)_updateForCurrentLayout;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setButtonPaddingConstraint:(id)a3;
- (void)setCurrentLayout:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setDismissButtonHeightConstraint:(id)a3;
- (void)setLabelPaddingConstraint:(id)a3;
- (void)setRetryButton:(id)a3;
- (void)setRetryButtonHeightConstraint:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setTextContainerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelLeadingConstraint:(id)a3;
- (void)setTitleLabelTrailingConstraint:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTopContentView:(id)a3;
- (void)stateManager:(id)a3 didChangeState:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFont:(id)a3;
@end

@implementation VLFFailureView

- (VLFFailureView)initWithFrame:(CGRect)a3
{
  v139.receiver = self;
  v139.super_class = (Class)VLFFailureView;
  v3 = -[VLFFailureView initWithFrame:](&v139, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentLayout = 2;
    v5 = +[UIApplication _maps_keyMapsSceneDelegate];
    v6 = [v5 platformController];
    v7 = [v6 auxiliaryTasksManager];
    v8 = [v7 auxilaryTaskForClass:objc_opt_class()];

    v137 = v8;
    uint64_t v9 = [v8 stateManager];
    stateManager = v4->_stateManager;
    v4->_stateManager = (VLFSessionStateManager *)v9;

    [(VLFSessionStateManager *)v4->_stateManager addObserver:v4];
    [(VLFFailureView *)v4 _updateBackgroundColor];
    v138 = +[NSMutableArray array];
    uint64_t v11 = +[UIButton buttonWithType:1];
    retryButton = v4->_retryButton;
    v4->_retryButton = (UIButton *)v11;

    [(UIButton *)v4->_retryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(UIButton *)v4->_retryButton layer];
    [v13 setCornerRadius:8.0];

    v14 = +[UIColor clearColor];
    [(UIButton *)v4->_retryButton setBackgroundColor:v14];

    v15 = v4->_retryButton;
    v16 = +[UIColor systemBlueColor];
    [(UIButton *)v15 setTitleColor:v16 forState:0];

    v17 = v4->_retryButton;
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"VLF_localization_failed_try_again_button_text" value:@"localized string not found" table:0];
    [(UIButton *)v17 setTitle:v19 forState:0];

    [(UIButton *)v4->_retryButton addTarget:v4 action:"_retryButtonTapped:" forControlEvents:64];
    [(UIButton *)v4->_retryButton setHidden:[(VLFSessionStateManager *)v4->_stateManager currentState] == 0];
    [(VLFFailureView *)v4 addSubview:v4->_retryButton];
    v20 = [(UIButton *)v4->_retryButton heightAnchor];
    uint64_t v21 = [v20 constraintEqualToConstant:0.0];
    retryButtonHeightConstraint = v4->_retryButtonHeightConstraint;
    v4->_retryButtonHeightConstraint = (NSLayoutConstraint *)v21;

    v131 = [(UIButton *)v4->_retryButton leadingAnchor];
    v23 = [(VLFFailureView *)v4 leadingAnchor];
    v24 = [v131 constraintEqualToAnchor:v23 constant:24.0];
    v153[0] = v24;
    v25 = [(UIButton *)v4->_retryButton trailingAnchor];
    v26 = [(VLFFailureView *)v4 trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-24.0];
    v153[1] = v27;
    v28 = [(UIButton *)v4->_retryButton bottomAnchor];
    v29 = [(VLFFailureView *)v4 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v153[2] = v30;
    v153[3] = v4->_retryButtonHeightConstraint;
    v31 = +[NSArray arrayWithObjects:v153 count:4];
    [v138 addObjectsFromArray:v31];

    uint64_t v32 = +[UIButton buttonWithType:1];
    dismissButton = v4->_dismissButton;
    v4->_dismissButton = (UIButton *)v32;

    [(UIButton *)v4->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(UIButton *)v4->_dismissButton layer];
    [v34 setCornerRadius:8.0];

    v35 = +[UIColor systemBlueColor];
    [(UIButton *)v4->_dismissButton setBackgroundColor:v35];

    v36 = v4->_dismissButton;
    v37 = +[UIColor systemWhiteColor];
    [(UIButton *)v36 setTitleColor:v37 forState:0];

    v38 = v4->_dismissButton;
    v39 = +[NSBundle mainBundle];
    v40 = [v39 localizedStringForKey:@"VLF_localization_failed_dismiss_button_text" value:@"localized string not found" table:0];
    [(UIButton *)v38 setTitle:v40 forState:0];

    [(UIButton *)v4->_dismissButton addTarget:v4 action:"_dismissButtonTapped:" forControlEvents:64];
    [(VLFFailureView *)v4 addSubview:v4->_dismissButton];
    v41 = [(UIButton *)v4->_dismissButton heightAnchor];
    uint64_t v42 = [v41 constraintEqualToConstant:0.0];
    dismissButtonHeightConstraint = v4->_dismissButtonHeightConstraint;
    v4->_dismissButtonHeightConstraint = (NSLayoutConstraint *)v42;

    v132 = [(UIButton *)v4->_dismissButton leadingAnchor];
    v129 = [(UIButton *)v4->_retryButton leadingAnchor];
    v44 = [v132 constraintEqualToAnchor:v129];
    v152[0] = v44;
    v45 = [(UIButton *)v4->_dismissButton trailingAnchor];
    v46 = [(UIButton *)v4->_retryButton trailingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v152[1] = v47;
    v48 = [(UIButton *)v4->_dismissButton bottomAnchor];
    v49 = [(UIButton *)v4->_retryButton topAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v152[2] = v50;
    v152[3] = v4->_dismissButtonHeightConstraint;
    v51 = +[NSArray arrayWithObjects:v152 count:4];
    [v138 addObjectsFromArray:v51];

    uint64_t v52 = objc_opt_new();
    topContentView = v4->_topContentView;
    v4->_topContentView = (UIView *)v52;

    [(UIView *)v4->_topContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VLFFailureView *)v4 addSubview:v4->_topContentView];
    v54 = [(UIView *)v4->_topContentView topAnchor];
    v55 = [(VLFFailureView *)v4 topAnchor];
    uint64_t v56 = [v54 constraintEqualToAnchor:v55 constant:14.0];
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v56;

    v58 = [(UIView *)v4->_topContentView bottomAnchor];
    v59 = [(UIButton *)v4->_dismissButton topAnchor];
    uint64_t v60 = [v58 constraintEqualToAnchor:v59 constant:-20.0];
    buttonPaddingConstraint = v4->_buttonPaddingConstraint;
    v4->_buttonPaddingConstraint = (NSLayoutConstraint *)v60;

    v62 = [(UIView *)v4->_topContentView leadingAnchor];
    v63 = [(VLFFailureView *)v4 leadingAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    v151[0] = v64;
    v65 = [(UIView *)v4->_topContentView trailingAnchor];
    v66 = [(VLFFailureView *)v4 trailingAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v151[1] = v67;
    v151[2] = v4->_topConstraint;
    v151[3] = v4->_buttonPaddingConstraint;
    v68 = +[NSArray arrayWithObjects:v151 count:4];
    [v138 addObjectsFromArray:v68];

    uint64_t v69 = objc_opt_new();
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = (UIView *)v69;

    [(UIView *)v4->_textContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_topContentView addSubview:v4->_textContainerView];
    v135 = [(UIView *)v4->_textContainerView leadingAnchor];
    v133 = [(UIView *)v4->_topContentView leadingAnchor];
    v130 = [v135 constraintEqualToAnchor:v133 constant:24.0];
    v150[0] = v130;
    v128 = [(UIView *)v4->_textContainerView trailingAnchor];
    v127 = [(UIView *)v4->_topContentView trailingAnchor];
    v126 = [v128 constraintEqualToAnchor:v127 constant:-24.0];
    v150[1] = v126;
    v125 = [(UIView *)v4->_textContainerView topAnchor];
    v124 = [(UIView *)v4->_topContentView topAnchor];
    v71 = [v125 constraintGreaterThanOrEqualToAnchor:v124];
    v150[2] = v71;
    v72 = [(UIView *)v4->_textContainerView bottomAnchor];
    v73 = [(UIView *)v4->_topContentView bottomAnchor];
    v74 = [v72 constraintLessThanOrEqualToAnchor:v73];
    v150[3] = v74;
    v75 = [(UIView *)v4->_textContainerView centerYAnchor];
    v76 = [(UIView *)v4->_topContentView centerYAnchor];
    v77 = [v75 constraintEqualToAnchor:v76];
    v150[4] = v77;
    v78 = +[NSArray arrayWithObjects:v150 count:5];
    [v138 addObjectsFromArray:v78];

    id v79 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v83 = [v79 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v83;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v85) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v85];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setMinimumScaleFactor:0.0];
    [(UILabel *)v4->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v86 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v86];

    v87 = +[NSBundle mainBundle];
    v88 = [v87 localizedStringForKey:@"VLF_localization_failed_title_text" value:@"localized string not found" table:0];
    [(UILabel *)v4->_titleLabel setText:v88];

    [(UIView *)v4->_textContainerView addSubview:v4->_titleLabel];
    v89 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v90 = [(UIView *)v4->_textContainerView leadingAnchor];
    uint64_t v91 = [v89 constraintEqualToAnchor:v90 constant:4.0];
    titleLabelLeadingConstraint = v4->_titleLabelLeadingConstraint;
    v4->_titleLabelLeadingConstraint = (NSLayoutConstraint *)v91;

    v93 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v94 = [(UIView *)v4->_textContainerView trailingAnchor];
    uint64_t v95 = [v93 constraintEqualToAnchor:v94 constant:-4.0];
    titleLabelTrailingConstraint = v4->_titleLabelTrailingConstraint;
    v4->_titleLabelTrailingConstraint = (NSLayoutConstraint *)v95;

    v149[0] = v4->_titleLabelLeadingConstraint;
    v149[1] = v4->_titleLabelTrailingConstraint;
    v97 = [(UILabel *)v4->_titleLabel topAnchor];
    v98 = [(UIView *)v4->_textContainerView topAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];
    v149[2] = v99;
    v100 = +[NSArray arrayWithObjects:v149 count:3];
    [v138 addObjectsFromArray:v100];

    v101 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v101;

    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v4->_descriptionLabel setMinimumScaleFactor:0.0];
    [(UILabel *)v4->_descriptionLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_descriptionLabel setTextAlignment:1];
    v103 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_descriptionLabel setTextColor:v103];

    switch(GEOConfigGetInteger())
    {
      case 0:
        goto LABEL_12;
      case 1:
        v104 = +[NSBundle mainBundle];
        v105 = v104;
        CFStringRef v106 = @"VLF_localization_failed_description_text_1";
        break;
      case 2:
        v104 = +[NSBundle mainBundle];
        v105 = v104;
        CFStringRef v106 = @"VLF_localization_failed_description_text_2";
        break;
      case 3:
        v104 = +[NSBundle mainBundle];
        v105 = v104;
        CFStringRef v106 = @"VLF_localization_failed_description_text_3";
        break;
      default:
        v107 = sub_1005762E4();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v142 = "-[VLFFailureView initWithFrame:]";
          __int16 v143 = 2080;
          v144 = "VLFFailureView.m";
          __int16 v145 = 1024;
          int v146 = 158;
          __int16 v147 = 2080;
          v148 = "experimentConfig == 0";
          _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v108 = sub_1005762E4();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v142 = v109;
            _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
LABEL_12:
        v104 = +[NSBundle mainBundle];
        v105 = v104;
        CFStringRef v106 = @"VLF_localization_failed_description_text";
        break;
    }
    v110 = [v104 localizedStringForKey:v106 value:@"localized string not found" table:0];
    [(UILabel *)v4->_descriptionLabel setText:v110];

    [(UIView *)v4->_textContainerView addSubview:v4->_descriptionLabel];
    v111 = [(UILabel *)v4->_descriptionLabel topAnchor];
    v112 = [(UILabel *)v4->_titleLabel bottomAnchor];
    uint64_t v113 = [v111 constraintEqualToAnchor:v112 constant:11.0];
    labelPaddingConstraint = v4->_labelPaddingConstraint;
    v4->_labelPaddingConstraint = (NSLayoutConstraint *)v113;

    v136 = [(UILabel *)v4->_descriptionLabel leadingAnchor];
    v134 = [(UIView *)v4->_textContainerView leadingAnchor];
    v115 = [v136 constraintEqualToAnchor:v134];
    v140[0] = v115;
    v116 = [(UILabel *)v4->_descriptionLabel trailingAnchor];
    v117 = [(UIView *)v4->_textContainerView trailingAnchor];
    v118 = [v116 constraintEqualToAnchor:v117];
    v140[1] = v118;
    v140[2] = v4->_labelPaddingConstraint;
    v119 = [(UILabel *)v4->_descriptionLabel bottomAnchor];
    v120 = [(UIView *)v4->_textContainerView bottomAnchor];
    v121 = [v119 constraintEqualToAnchor:v120];
    v140[3] = v121;
    v122 = +[NSArray arrayWithObjects:v140 count:4];
    [v138 addObjectsFromArray:v122];

    +[NSLayoutConstraint activateConstraints:v138];
    [(VLFFailureView *)v4 _updateFonts];
  }
  return v4;
}

- (void)dealloc
{
  [(VLFSessionStateManager *)self->_stateManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFFailureView;
  [(VLFFailureView *)&v3 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VLFFailureView;
  [(VLFFailureView *)&v4 traitCollectionDidChange:a3];
  [(VLFFailureView *)self _updateBackgroundColor];
  [(VLFFailureView *)self _updateFonts];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VLFFailureView;
  [(VLFFailureView *)&v3 layoutSubviews];
  [(VLFFailureView *)self _updateForCurrentLayout];
  [(VLFFailureView *)self _updateFonts];
}

- (void)setCurrentLayout:(unint64_t)a3
{
  if (self->_currentLayout != a3)
  {
    self->_currentLayout = a3;
    [(VLFFailureView *)self _updateForCurrentLayout];
    [(VLFFailureView *)self _updateFonts];
  }
}

- (void)updateFont:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      v10 = "-[VLFFailureView updateFont:]";
      __int16 v11 = 2080;
      v12 = "VLFFailureView.m";
      __int16 v13 = 1024;
      int v14 = 222;
      __int16 v15 = 2080;
      v16 = "font != nil";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  v5 = [(VLFFailureView *)self titleLabel];
  [v5 setFont:v4];
}

- (id)_fontWithTextStyle:(id)a3 weight:(double)a4
{
  id v6 = a3;
  v7 = [(VLFFailureView *)self traitCollection];
  unint64_t v8 = [(VLFFailureView *)self currentLayout];
  int v9 = &UIContentSizeCategoryAccessibilityMedium;
  if (v8 != 2) {
    int v9 = &UIContentSizeCategoryExtraLarge;
  }
  v10 = [v7 _maps_traitCollectionWithMaximumContentSizeCategory:*v9];

  __int16 v11 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v6 compatibleWithTraitCollection:v10];

  UIFontDescriptorAttributeName v20 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v18 = UIFontWeightTrait;
  v12 = +[NSNumber numberWithDouble:a4];
  v19 = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  uint64_t v21 = v13;
  int v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  __int16 v15 = [v11 fontDescriptorByAddingAttributes:v14];

  v16 = +[UIFont fontWithDescriptor:v15 size:0.0];

  return v16;
}

- (id)_descriptionFont
{
  return [(VLFFailureView *)self _fontWithTextStyle:UIFontTextStyleBody weight:UIFontWeightRegular];
}

- (id)_buttonFont
{
  return [(VLFFailureView *)self _fontWithTextStyle:UIFontTextStyleHeadline weight:UIFontWeightSemibold];
}

- (void)_updateFonts
{
  id v19 = [(VLFFailureView *)self _buttonFont];
  objc_super v3 = [(VLFFailureView *)self retryButton];
  id v4 = [v3 titleLabel];
  [v4 setFont:v19];

  [v19 lineHeight];
  double v6 = v5;
  [v19 leading];
  double v8 = v6 + v7 + 28.0;
  int v9 = [(VLFFailureView *)self retryButtonHeightConstraint];
  [v9 setConstant:v8];

  v10 = [(VLFFailureView *)self dismissButton];
  __int16 v11 = [v10 titleLabel];
  [v11 setFont:v19];

  [v19 lineHeight];
  double v13 = v12;
  [v19 leading];
  double v15 = v13 + v14 + 28.0;
  v16 = [(VLFFailureView *)self dismissButtonHeightConstraint];
  [v16 setConstant:v15];

  v17 = [(VLFFailureView *)self _descriptionFont];
  UIFontDescriptorTraitKey v18 = [(VLFFailureView *)self descriptionLabel];
  [v18 setFont:v17];
}

- (void)_updateBackgroundColor
{
  objc_super v3 = [(VLFFailureView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    +[UIColor secondarySystemBackgroundColor];
  }
  else {
  id v5 = +[UIColor systemWhiteColor];
  }
  [(VLFFailureView *)self setBackgroundColor:v5];
}

- (void)_updateForCurrentLayout
{
  if (self->_currentLayout == 2)
  {
    [(NSLayoutConstraint *)self->_topConstraint setConstant:14.0];
    [(NSLayoutConstraint *)self->_titleLabelLeadingConstraint setConstant:4.0];
    [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setConstant:-4.0];
    [(NSLayoutConstraint *)self->_labelPaddingConstraint setConstant:11.0];
    buttonPaddingConstraint = self->_buttonPaddingConstraint;
    [(NSLayoutConstraint *)buttonPaddingConstraint setConstant:-20.0];
  }
  else
  {
    id v4 = [(VLFFailureView *)self traitCollection];
    id v5 = [v4 preferredContentSizeCategory];
    NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v5, UIContentSizeCategoryLarge);
    double v7 = 18.0;
    if (v6 == NSOrderedDescending) {
      double v7 = 15.0;
    }
    [(NSLayoutConstraint *)self->_topConstraint setConstant:v7];

    [(NSLayoutConstraint *)self->_titleLabelLeadingConstraint setConstant:0.0];
    [(NSLayoutConstraint *)self->_titleLabelTrailingConstraint setConstant:0.0];
    double v8 = [(VLFFailureView *)self traitCollection];
    int v9 = [v8 preferredContentSizeCategory];
    NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, UIContentSizeCategoryLarge);
    double v11 = 10.0;
    if (v10 == NSOrderedDescending) {
      double v11 = 7.0;
    }
    [(NSLayoutConstraint *)self->_labelPaddingConstraint setConstant:v11];

    id v15 = [(VLFFailureView *)self traitCollection];
    double v12 = [v15 preferredContentSizeCategory];
    NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory(v12, UIContentSizeCategoryLarge);
    double v14 = -32.0;
    if (v13 == NSOrderedDescending) {
      double v14 = -12.0;
    }
    [(NSLayoutConstraint *)self->_buttonPaddingConstraint setConstant:v14];
  }
}

- (void)_dismissButtonTapped:(id)a3
{
  +[GEOAPPortal captureUserAction:125 target:669 value:0];
  id v4 = [(VLFFailureView *)self delegate];
  [v4 failureViewDismissButtonTapped:self];
}

- (void)_retryButtonTapped:(id)a3
{
  +[GEOAPPortal captureUserAction:128 target:669 value:0];
  id v4 = [(VLFFailureView *)self delegate];
  [v4 failureViewRetryButtonTapped:self];
}

- (void)stateManager:(id)a3 didChangeState:(int64_t)a4
{
  [(UIButton *)self->_retryButton setHidden:a4 == 0];
}

- (VLFFailureViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VLFFailureViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (VLFSessionStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (void)setTopContentView:(id)a3
{
}

- (UIView)textContainerView
{
  return self->_textContainerView;
}

- (void)setTextContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
}

- (NSLayoutConstraint)retryButtonHeightConstraint
{
  return self->_retryButtonHeightConstraint;
}

- (void)setRetryButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)dismissButtonHeightConstraint
{
  return self->_dismissButtonHeightConstraint;
}

- (void)setDismissButtonHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLeadingConstraint
{
  return self->_titleLabelLeadingConstraint;
}

- (void)setTitleLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelPaddingConstraint
{
  return self->_labelPaddingConstraint;
}

- (void)setLabelPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonPaddingConstraint
{
  return self->_buttonPaddingConstraint;
}

- (void)setButtonPaddingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_labelPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_dismissButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end