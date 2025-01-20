@interface FocusBannerView
- (BOOL)isFocusFilterEnabled;
- (FocusBannerView)initWithDelegate:(id)a3;
- (FocusBannerViewDelegate)delegate;
- (UIButton)focusFilterToggleButton;
- (UIImageView)focusIconView;
- (UILabel)focusFilterStateDescriptionLabel;
- (UIStackView)stackView;
- (UIView)topSeparatorView;
- (double)preferredHeight;
- (id)_focusButtonConfiguration;
- (void)_focusFilterToggleButtonSelected;
- (void)_updateTitleAndImage;
- (void)setDelegate:(id)a3;
- (void)setFocusFilterEnabled:(BOOL)a3;
- (void)setFocusFilterStateDescriptionLabel:(id)a3;
- (void)setFocusFilterToggleButton:(id)a3;
- (void)setFocusIconView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTopSeparatorView:(id)a3;
@end

@implementation FocusBannerView

- (FocusBannerView)initWithDelegate:(id)a3
{
  id obj = a3;
  v66.receiver = self;
  v66.super_class = (Class)FocusBannerView;
  v4 = -[FocusBannerView initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, obj);
    v5->_focusFilterEnabled = 1;
    v6 = (UIView *)objc_alloc_init((Class)UIView);
    topSeparatorView = v5->_topSeparatorView;
    v5->_topSeparatorView = v6;

    [(UIView *)v5->_topSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = +[UIColor separatorColor];
    [(UIView *)v5->_topSeparatorView setBackgroundColor:v8];

    id v9 = objc_alloc((Class)UIImageView);
    v10 = +[UIImage systemImageNamed:MFImageGlyphFocusCircle];
    v11 = (UIImageView *)[v9 initWithImage:v10];
    focusIconView = v5->_focusIconView;
    v5->_focusIconView = v11;

    [(UIImageView *)v5->_focusIconView setContentMode:4];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v14 = +[UIImageSymbolConfiguration configurationWithFont:v13];
    [(UIImageView *)v5->_focusIconView setPreferredSymbolConfiguration:v14];

    LODWORD(v15) = 1148846080;
    [(UIImageView *)v5->_focusIconView setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UIImageView *)v5->_focusIconView setContentCompressionResistancePriority:1 forAxis:v16];
    LODWORD(v17) = 1148846080;
    [(UIImageView *)v5->_focusIconView setContentHuggingPriority:0 forAxis:v17];
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    focusFilterStateDescriptionLabel = v5->_focusFilterStateDescriptionLabel;
    v5->_focusFilterStateDescriptionLabel = v18;

    [(UILabel *)v5->_focusFilterStateDescriptionLabel setAdjustsFontForContentSizeCategory:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v20 = [(FocusBannerView *)v5 _focusButtonConfiguration];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000C425C;
    v63[3] = &unk_1006070F8;
    objc_copyWeak(&v64, &location);
    v21 = +[UIAction actionWithHandler:v63];
    uint64_t v22 = +[UIButton buttonWithConfiguration:v20 primaryAction:v21];
    focusFilterToggleButton = v5->_focusFilterToggleButton;
    v5->_focusFilterToggleButton = (UIButton *)v22;

    LODWORD(v24) = 1148846080;
    [(UIButton *)v5->_focusFilterToggleButton setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(UIButton *)v5->_focusFilterToggleButton setContentHuggingPriority:0 forAxis:v25];
    v26 = [(UIButton *)v5->_focusFilterToggleButton titleLabel];
    [v26 setNumberOfLines:1];

    id v27 = objc_alloc((Class)UIStackView);
    v68[0] = v5->_focusIconView;
    v68[1] = v5->_focusFilterStateDescriptionLabel;
    v68[2] = v5->_focusFilterToggleButton;
    v28 = +[NSArray arrayWithObjects:v68 count:3];
    v29 = (UIStackView *)[v27 initWithArrangedSubviews:v28];
    stackView = v5->_stackView;
    v5->_stackView = v29;

    [(UIStackView *)v5->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_stackView setSpacing:5.0];
    [(UIStackView *)v5->_stackView setAlignment:3];
    [(FocusBannerView *)v5 addSubview:v5->_topSeparatorView];
    [(FocusBannerView *)v5 addSubview:v5->_stackView];
    [(FocusBannerView *)v5 _updateTitleAndImage];
    v31 = +[UIScreen mainScreen];
    [v31 scale];
    double v33 = v32;

    v56 = [(UIView *)v5->_topSeparatorView heightAnchor];
    v47 = [v56 constraintEqualToConstant:1.0 / v33];
    v67[0] = v47;
    v61 = [(UIView *)v5->_topSeparatorView topAnchor];
    v55 = [(FocusBannerView *)v5 topAnchor];
    v46 = [v61 constraintEqualToAnchor:];
    v67[1] = v46;
    v60 = [(UIView *)v5->_topSeparatorView leadingAnchor];
    v54 = [(FocusBannerView *)v5 focusFilterStateDescriptionLabel];
    v45 = [v54 leadingAnchor];
    v53 = [v60 constraintEqualToAnchor:];
    v67[2] = v53;
    v59 = [(UIView *)v5->_topSeparatorView trailingAnchor];
    v44 = [(FocusBannerView *)v5 trailingAnchor];
    v52 = [v59 constraintEqualToAnchor:];
    v67[3] = v52;
    v58 = [(UIStackView *)v5->_stackView leadingAnchor];
    v43 = [(FocusBannerView *)v5 layoutMarginsGuide];
    v51 = [v43 leadingAnchor];
    v50 = [v58 constraintEqualToAnchor:];
    v67[4] = v50;
    v57 = [(UIStackView *)v5->_stackView trailingAnchor];
    v49 = [(FocusBannerView *)v5 layoutMarginsGuide];
    v48 = [v49 trailingAnchor];
    v34 = [v57 constraintEqualToAnchor:];
    v67[5] = v34;
    v35 = [(UIStackView *)v5->_stackView topAnchor];
    v36 = [(FocusBannerView *)v5 topAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:11.0];
    v67[6] = v37;
    v38 = [(UIStackView *)v5->_stackView bottomAnchor];
    v39 = [(FocusBannerView *)v5 bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:-11.0];
    v67[7] = v40;
    v41 = +[NSArray arrayWithObjects:v67 count:8];
    +[NSLayoutConstraint activateConstraints:v41];

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setFocusFilterEnabled:(BOOL)a3
{
  if (self->_focusFilterEnabled != a3)
  {
    self->_focusFilterEnabled = a3;
    [(FocusBannerView *)self _updateTitleAndImage];
  }
}

- (void)_updateTitleAndImage
{
  if ([(FocusBannerView *)self isFocusFilterEnabled])
  {
    uint64_t v3 = _EFLocalizedString();
    +[UIColor mailFocusBannerTitleColor];
  }
  else
  {
    uint64_t v3 = _EFLocalizedString();
    +[UIColor secondaryLabelColor];
  v4 = };
  id v14 = (id)v3;
  v5 = [(FocusBannerView *)self focusFilterStateDescriptionLabel];
  [v5 setText:v14];

  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v7 = [(FocusBannerView *)self focusFilterStateDescriptionLabel];
  [v7 setFont:v6];

  v8 = [(FocusBannerView *)self focusFilterStateDescriptionLabel];
  [v8 setTextColor:v4];

  id v9 = [(FocusBannerView *)self focusFilterStateDescriptionLabel];
  [v9 setLargeContentTitle:v14];

  v10 = [(FocusBannerView *)self _focusButtonConfiguration];
  v11 = [(FocusBannerView *)self focusFilterToggleButton];
  [v11 setConfiguration:v10];

  if ([(FocusBannerView *)self isFocusFilterEnabled]) {
    +[UIColor systemIndigoColor];
  }
  else {
  v12 = +[UIColor secondaryLabelColor];
  }
  v13 = [(FocusBannerView *)self focusIconView];
  [v13 setTintColor:v12];
}

- (void)_focusFilterToggleButtonSelected
{
  [(FocusBannerView *)self setFocusFilterEnabled:[(FocusBannerView *)self isFocusFilterEnabled] ^ 1];
  id v3 = [(FocusBannerView *)self delegate];
  [v3 focusBannerView:self stateDidChange:[self isFocusFilterEnabled]];
}

- (double)preferredHeight
{
  v2 = [(FocusBannerView *)self focusFilterStateDescriptionLabel];
  [v2 intrinsicContentSize];
  double v4 = v3 + 11.0 + 11.0;

  return v4;
}

- (id)_focusButtonConfiguration
{
  double v3 = [(FocusBannerView *)self focusFilterToggleButton];
  double v4 = [v3 configuration];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[UIButtonConfiguration plainButtonConfiguration];
  }
  v7 = v6;

  [(FocusBannerView *)self isFocusFilterEnabled];
  v8 = _EFLocalizedString();
  id v9 = +[UIColor mailFocusBannerTitleColor];
  [v7 setBaseForegroundColor:v9];

  id v10 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v15 = NSFontAttributeName;
  v11 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightMedium];
  double v16 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v13 = [v10 initWithString:v8 attributes:v12];
  [v7 setAttributedTitle:v13];

  [v7 setTitleLineBreakMode:4];
  [v7 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];

  return v7;
}

- (FocusBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FocusBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFocusFilterEnabled
{
  return self->_focusFilterEnabled;
}

- (UIImageView)focusIconView
{
  return self->_focusIconView;
}

- (void)setFocusIconView:(id)a3
{
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_focusIconView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end