@interface SettingsTipView
+ (Class)layerClass;
- (NSString)blurGroupName;
- (SettingsTipView)initWithFrame:(CGRect)a3;
- (SettingsTipViewDelegate)delegate;
- (void)_closeTapped;
- (void)_tipTapped;
- (void)_updateFonts;
- (void)_updateText;
- (void)layoutSubviews;
- (void)setBlurGroupName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SettingsTipView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SettingsTipView)initWithFrame:(CGRect)a3
{
  v108.receiver = self;
  v108.super_class = (Class)SettingsTipView;
  v3 = -[SettingsTipView initWithFrame:](&v108, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SettingsTipView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 25.0);
    id v5 = +[UIColor blackColor];
    id v6 = [v5 CGColor];
    v7 = [(SettingsTipView *)v4 layer];
    [v7 setShadowColor:v6];

    v8 = [(SettingsTipView *)v4 layer];
    LODWORD(v9) = 1041865114;
    [v8 setShadowOpacity:v9];

    v10 = [(SettingsTipView *)v4 layer];
    [v10 setShadowRadius:12.0];

    v11 = [(SettingsTipView *)v4 layer];
    [v11 setShadowOffset:0.0, 1.0];

    id v12 = +[UIColor clearColor];
    id v13 = [v12 CGColor];
    v14 = [(SettingsTipView *)v4 _shapeLayer];
    [v14 setFillColor:v13];

    id v15 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v19 = [v15 initWithFrame:CGRectZero.origin.x, y, width, height];
    contentMaskView = v4->_contentMaskView;
    v4->_contentMaskView = v19;

    [(UIView *)v4->_contentMaskView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SettingsTipView *)v4 addSubview:v4->_contentMaskView];
    uint64_t v21 = +[CAShapeLayer layer];
    contentMaskLayer = v4->_contentMaskLayer;
    v4->_contentMaskLayer = (CAShapeLayer *)v21;

    id v23 = +[UIColor blackColor];
    -[CAShapeLayer setFillColor:](v4->_contentMaskLayer, "setFillColor:", [v23 CGColor]);

    -[CAShapeLayer setAnchorPoint:](v4->_contentMaskLayer, "setAnchorPoint:", 0.0, 0.0);
    v24 = v4->_contentMaskLayer;
    v25 = [(UIView *)v4->_contentMaskView layer];
    [v25 setMask:v24];

    v26 = [[CardView alloc] initAllowingBlurred:1];
    cardView = v4->_cardView;
    v4->_cardView = v26;

    [(CardView *)v4->_cardView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CardView *)v4->_cardView setLayoutStyle:6];
    [(UIView *)v4->_contentMaskView addSubview:v4->_cardView];
    v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v28;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    v30 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v30];

    v31 = [(CardView *)v4->_cardView contentView];
    [v31 addSubview:v4->_titleLabel];

    v32 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    bodyLabel = v4->_bodyLabel;
    v4->_bodyLabel = v32;

    [(UILabel *)v4->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_bodyLabel setNumberOfLines:0];
    v34 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_bodyLabel setTextColor:v34];

    v35 = [(CardView *)v4->_cardView contentView];
    [v35 addSubview:v4->_bodyLabel];

    uint64_t v36 = +[UIButton buttonWithType:0];
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v36;

    [(UIButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = v4->_closeButton;
    v39 = +[UIImage systemImageNamed:@"xmark"];
    [(UIButton *)v38 setImage:v39 forState:0];

    [(UIButton *)v4->_closeButton addTarget:v4 action:"_closeTapped" forControlEvents:0x2000];
    LODWORD(v40) = 1148846080;
    [(UIButton *)v4->_closeButton setContentHuggingPriority:0 forAxis:v40];
    LODWORD(v41) = 1148846080;
    [(UIButton *)v4->_closeButton setContentCompressionResistancePriority:0 forAxis:v41];
    v42 = +[UIColor secondaryLabelColor];
    [(UIButton *)v4->_closeButton setTintColor:v42];

    -[UIButton _setTouchInsets:](v4->_closeButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v43 = [(CardView *)v4->_cardView contentView];
    [v43 addSubview:v4->_closeButton];

    v44 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_tipTapped"];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v44;

    [(SettingsTipView *)v4 addGestureRecognizer:v4->_tapGestureRecognizer];
    v107 = [(SettingsTipView *)v4 widthAnchor];
    LODWORD(v46) = 1144766464;
    v106 = [v107 constraintEqualToConstant:320.0 priority:v46];
    v109[0] = v106;
    v105 = [(UIView *)v4->_contentMaskView topAnchor];
    v104 = [(SettingsTipView *)v4 topAnchor];
    v103 = [v105 constraintEqualToAnchor:v104];
    v109[1] = v103;
    v102 = [(UIView *)v4->_contentMaskView leadingAnchor];
    v101 = [(SettingsTipView *)v4 leadingAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v109[2] = v100;
    v99 = [(UIView *)v4->_contentMaskView trailingAnchor];
    v98 = [(SettingsTipView *)v4 trailingAnchor];
    v97 = [v99 constraintEqualToAnchor:v98];
    v109[3] = v97;
    v96 = [(UIView *)v4->_contentMaskView bottomAnchor];
    v95 = [(SettingsTipView *)v4 bottomAnchor];
    v94 = [v96 constraintEqualToAnchor:v95];
    v109[4] = v94;
    v93 = [(CardView *)v4->_cardView topAnchor];
    v92 = [(SettingsTipView *)v4 topAnchor];
    v91 = [v93 constraintEqualToAnchor:v92 constant:-10.0];
    v109[5] = v91;
    v90 = [(CardView *)v4->_cardView leadingAnchor];
    v89 = [(SettingsTipView *)v4 leadingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89 constant:-10.0];
    v109[6] = v88;
    v87 = [(CardView *)v4->_cardView trailingAnchor];
    v86 = [(SettingsTipView *)v4 trailingAnchor];
    v85 = [v87 constraintEqualToAnchor:v86 constant:10.0];
    v109[7] = v85;
    v84 = [(CardView *)v4->_cardView bottomAnchor];
    v83 = [(SettingsTipView *)v4 bottomAnchor];
    v82 = [v84 constraintEqualToAnchor:v83 constant:10.0];
    v109[8] = v82;
    v80 = [(UIButton *)v4->_closeButton topAnchor];
    v81 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v79 = [v81 topAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v109[9] = v78;
    v76 = [(UIButton *)v4->_closeButton trailingAnchor];
    v77 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v75 = [v77 trailingAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v109[10] = v74;
    v72 = [(UILabel *)v4->_titleLabel topAnchor];
    v73 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v71 = [v73 topAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v109[11] = v70;
    v68 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v69 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v67 = [v69 leadingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v109[12] = v66;
    v65 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v64 = [(UIButton *)v4->_closeButton leadingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64 constant:-12.0];
    v109[13] = v63;
    v62 = [(UILabel *)v4->_bodyLabel topAnchor];
    v61 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v109[14] = v60;
    v58 = [(UILabel *)v4->_bodyLabel leadingAnchor];
    v59 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v57 = [v59 leadingAnchor];
    v47 = [v58 constraintEqualToAnchor:v57];
    v109[15] = v47;
    v48 = [(UILabel *)v4->_bodyLabel trailingAnchor];
    v49 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v109[16] = v50;
    v51 = [(UILabel *)v4->_bodyLabel bottomAnchor];
    v52 = [(SettingsTipView *)v4 layoutMarginsGuide];
    v53 = [v52 bottomAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    v109[17] = v54;
    v55 = +[NSArray arrayWithObjects:v109 count:18];
    +[NSLayoutConstraint activateConstraints:v55];

    [(SettingsTipView *)v4 _updateFonts];
    [(SettingsTipView *)v4 _updateText];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SettingsTipView;
  id v4 = a3;
  [(SettingsTipView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(SettingsTipView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(SettingsTipView *)self _updateFonts];
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SettingsTipView;
  [(SettingsTipView *)&v16 layoutSubviews];
  BOOL v3 = [(SettingsTipView *)self effectiveUserInterfaceLayoutDirection] == (id)1;
  [(SettingsTipView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  sub_100995894(v3, v4, v6, v8, v10, 26.0);
  id v12 = objc_claimAutoreleasedReturnValue();
  id v13 = [v12 CGPath];
  v14 = [(SettingsTipView *)self _shapeLayer];
  [v14 setPath:v13];

  id v15 = [(SettingsTipView *)self _shapeLayer];
  [v15 setShadowPath:v13];

  [(CAShapeLayer *)self->_contentMaskLayer setPath:v13];
  -[CAShapeLayer setBounds:](self->_contentMaskLayer, "setBounds:", v5, v7, v9, v11);
}

- (void)_updateFonts
{
  BOOL v3 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleHeadline weight:0 contentSizeCategory:0 symbolicTraits:0.0];
  [(UILabel *)self->_titleLabel setFont:v3];

  CGFloat v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:0 contentSizeCategory:0x8000 symbolicTraits:0.0];
  [(UILabel *)self->_bodyLabel setFont:v4];

  id v7 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIContentSizeCategoryLarge contentSizeCategory:0 symbolicTraits:0.0];
  closeButton = self->_closeButton;
  [v7 pointSize];
  CGFloat v6 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5);
  [(UIButton *)closeButton setPreferredSymbolConfiguration:v6 forImageInState:0];
}

- (void)_updateText
{
  BOOL v3 = +[NSBundle mainBundle];
  CGFloat v4 = [v3 localizedStringForKey:@"[Settings] Settings Tip Title for Traffic" value:@"localized string not found" table:0];
  [(UILabel *)self->_titleLabel setText:v4];

  id v6 = +[NSBundle mainBundle];
  double v5 = [v6 localizedStringForKey:@"[Settings] Settings Tip Message for Traffic" value:@"localized string not found" table:0];
  [(UILabel *)self->_bodyLabel setText:v5];
}

- (void)_tipTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsTipViewDidTapTip:self];
}

- (void)_closeTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsTipViewDidTapClose:self];
}

- (void)setBlurGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_blurGroupName, a3);
  id v5 = a3;
  [(CardView *)self->_cardView setBlurGroupName:v5];
}

- (SettingsTipViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SettingsTipViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);

  objc_storeStrong((id *)&self->_contentMaskView, 0);
}

@end