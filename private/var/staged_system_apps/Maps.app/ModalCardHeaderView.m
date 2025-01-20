@interface ModalCardHeaderView
+ (id)createModalBarButtonItem;
- (BOOL)useAdaptiveFont;
- (HairlineView)bottomHairline;
- (MapsThemeButton)leadingButton;
- (MapsThemeButton)trailingButton;
- (ModalCardHeaderConfiguration)configuration;
- (ModalCardHeaderView)initWithCoder:(id)a3;
- (ModalCardHeaderView)initWithConfiguration:(id)a3;
- (ModalCardHeaderView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (double)scrollViewOffset;
- (void)_createConstraintsSpecificToConfiguration;
- (void)_customInit;
- (void)_setMask:(id)a3;
- (void)_setupInitialConstraints;
- (void)_updateSizeForCurrentConfiguration;
- (void)setConfiguration:(id)a3;
- (void)setScrollViewOffset:(double)a3;
- (void)setStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseAdaptiveFont:(BOOL)a3;
@end

@implementation ModalCardHeaderView

- (ModalCardHeaderView)initWithFrame:(CGRect)a3
{
  v4 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  v5 = [(ModalCardHeaderView *)self initWithConfiguration:v4];

  return v5;
}

- (ModalCardHeaderView)initWithCoder:(id)a3
{
  v4 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  v5 = [(ModalCardHeaderView *)self initWithConfiguration:v4];

  return v5;
}

- (ModalCardHeaderView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ModalCardHeaderView;
  v6 = -[ModalCardHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(ModalCardHeaderView *)v7 _customInit];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(ModalCardHeaderView *)v7 setAccessibilityIdentifier:v9];
  }
  return v7;
}

- (void)_setMask:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [v4 capInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[ModalCardHeaderView _setCornerRadius:](self, "_setCornerRadius:");
  [(ModalCardHeaderView *)self setClipsToBounds:1];
  id v19 = [(ModalCardHeaderView *)self layer];
  id v17 = v4;
  id v18 = [v17 CGImage];

  [v19 setCornerContents:v18];
  [v19 setCornerContentsCenter:v12 / v6, v10 / v8, (v6 - v12 - v16) / v6, (v8 - v10 - v14) / v8];
}

+ (id)createModalBarButtonItem
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] != (id)5;

  id v4 = +[MapsThemeButton buttonWithType:v3];
  [v4 setPointerInteractionEnabled:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setTitleColorProvider:&stru_1012F7D28];
  if (MKApplicationLayoutDirectionIsRightToLeft()) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setContentHorizontalAlignment:v5];

  return v4;
}

- (void)_customInit
{
  BOOL v3 = +[UIColor clearColor];
  [(ModalCardHeaderView *)self setBackgroundColor:v3];

  [(ModalCardHeaderView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  if (![(ModalCardHeaderConfiguration *)self->_configuration leadingAlignedTitle])
  {
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    double v7 = +[ModalCardHeaderView createModalBarButtonItem];
    leadingButton = self->_leadingButton;
    self->_leadingButton = v7;

    [(MapsThemeButton *)self->_leadingButton setAccessibilityIdentifier:@"LeadingButton"];
  }
  double v9 = +[ModalCardHeaderView createModalBarButtonItem];
  trailingButton = self->_trailingButton;
  self->_trailingButton = v9;

  -[MapsThemeButton _setTouchInsets:](self->_trailingButton, "_setTouchInsets:", -15.0, -15.0, -15.0, -15.0);
  [(MapsThemeButton *)self->_trailingButton setAccessibilityIdentifier:@"TrailingButton"];
  unsigned __int8 v11 = [(ModalCardHeaderConfiguration *)self->_configuration leadingAlignedTitle];
  id v12 = objc_alloc((Class)UIStackView);
  if (v11)
  {
    double v13 = self->_trailingButton;
    v23[0] = self->_titleLabel;
    v23[1] = v13;
    double v14 = +[NSArray arrayWithObjects:v23 count:2];
    double v15 = (UIStackView *)[v12 initWithArrangedSubviews:v14];
  }
  else
  {
    double v16 = self->_titleLabel;
    v24[0] = self->_leadingButton;
    v24[1] = v16;
    v24[2] = self->_trailingButton;
    double v14 = +[NSArray arrayWithObjects:v24 count:3];
    double v15 = (UIStackView *)[v12 initWithArrangedSubviews:v14];
  }
  stackView = self->_stackView;
  self->_stackView = v15;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setSpacing:15.0];
  [(ModalCardHeaderView *)self addSubview:self->_stackView];
  [(ModalCardHeaderConfiguration *)self->_configuration hairlineLeadingInset];
  double v19 = v18;
  [(ModalCardHeaderConfiguration *)self->_configuration hairlineTrailingInset];
  v21 = [(ModalCardHeaderView *)self _maps_addHairlineAtBottomWithLeadingMargin:v19 trailingMargin:v20];
  bottomHairline = self->_bottomHairline;
  self->_bottomHairline = v21;

  [(ModalCardHeaderView *)self _updateSizeForCurrentConfiguration];
  [(ModalCardHeaderView *)self _setupInitialConstraints];
}

- (void)setUseAdaptiveFont:(BOOL)a3
{
  if (self->_useAdaptiveFont != a3)
  {
    self->_useAdaptiveFont = a3;
    [(ModalCardHeaderView *)self _updateSizeForCurrentConfiguration];
  }
}

- (void)setConfiguration:(id)a3
{
  uint64_t v5 = (ModalCardHeaderConfiguration *)a3;
  if (self->_configuration != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    [(ModalCardHeaderView *)self _createConstraintsSpecificToConfiguration];
    [(ModalCardHeaderView *)self _updateSizeForCurrentConfiguration];
    uint64_t v5 = v6;
  }
}

- (void)_updateSizeForCurrentConfiguration
{
  titleLabel = self->_titleLabel;
  BOOL useAdaptiveFont = self->_useAdaptiveFont;
  uint64_t v5 = [(ModalCardHeaderView *)self configuration];
  double v6 = v5;
  if (useAdaptiveFont)
  {
    uint64_t v7 = [v5 adaptiveTitleFontProvider];
    if (!v7)
    {
      double v8 = [(ModalCardHeaderView *)self configuration];
      double v9 = [v8 titleFontProvider];
      +[DynamicTypeWizard autorefreshLabel:titleLabel withFontProvider:v9];

      double v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = [v5 titleFontProvider];
  }
  double v10 = (void *)v7;
  +[DynamicTypeWizard autorefreshLabel:titleLabel withFontProvider:v7];
LABEL_6:

  if ([(ModalCardHeaderConfiguration *)self->_configuration leadingAlignedTitle]) {
    goto LABEL_13;
  }
  unsigned __int8 v11 = [(MapsThemeButton *)self->_leadingButton titleLabel];
  BOOL v12 = self->_useAdaptiveFont;
  double v13 = [(ModalCardHeaderView *)self configuration];
  double v14 = v13;
  if (!v12)
  {
    uint64_t v15 = [v13 leadingButtonFontProvider];
    goto LABEL_11;
  }
  uint64_t v15 = [v13 adaptiveLeadingButtonFontProvider];
  if (v15)
  {
LABEL_11:
    double v18 = (void *)v15;
    +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:v15];
    goto LABEL_12;
  }
  double v16 = [(ModalCardHeaderView *)self configuration];
  id v17 = [v16 leadingButtonFontProvider];
  +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:v17];

  double v18 = 0;
LABEL_12:

LABEL_13:
  id v26 = [(MapsThemeButton *)self->_trailingButton titleLabel];
  BOOL v19 = self->_useAdaptiveFont;
  double v20 = [(ModalCardHeaderView *)self configuration];
  v21 = v20;
  if (v19)
  {
    uint64_t v22 = [v20 adaptiveTrailingButtonFontProvider];
    if (!v22)
    {
      v23 = [(ModalCardHeaderView *)self configuration];
      v24 = [v23 trailingButtonFontProvider];
      +[DynamicTypeWizard autorefreshLabel:v26 withFontProvider:v24];

      v25 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v22 = [v20 trailingButtonFontProvider];
  }
  v25 = (void *)v22;
  +[DynamicTypeWizard autorefreshLabel:v26 withFontProvider:v22];
LABEL_18:
}

- (void)_setupInitialConstraints
{
  LODWORD(v2) = 1132068864;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v2];
  LODWORD(v4) = 1148829696;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v4];
  LODWORD(v5) = 1148829696;
  [(MapsThemeButton *)self->_leadingButton setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(MapsThemeButton *)self->_leadingButton setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148829696;
  [(MapsThemeButton *)self->_trailingButton setContentCompressionResistancePriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(MapsThemeButton *)self->_trailingButton setContentHuggingPriority:0 forAxis:v8];
  double v9 = [(UIStackView *)self->_stackView leadingAnchor];
  double v10 = [(ModalCardHeaderView *)self safeAreaLayoutGuide];
  unsigned __int8 v11 = [v10 leadingAnchor];
  BOOL v12 = [v9 constraintEqualToAnchor:v11 constant:16.0];
  v18[0] = v12;
  double v13 = [(UIStackView *)self->_stackView trailingAnchor];
  double v14 = [(ModalCardHeaderView *)self safeAreaLayoutGuide];
  uint64_t v15 = [v14 trailingAnchor];
  double v16 = [v13 constraintEqualToAnchor:v15 constant:-16.0];
  v18[1] = v16;
  id v17 = +[NSArray arrayWithObjects:v18 count:2];
  +[NSLayoutConstraint activateConstraints:v17];

  [(ModalCardHeaderView *)self _createConstraintsSpecificToConfiguration];
}

- (void)_createConstraintsSpecificToConfiguration
{
  [(NSLayoutConstraint *)self->_titleBaselineToBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_topToTitleBaselineConstraint setActive:0];
  BOOL v3 = [(ModalCardHeaderView *)self bottomAnchor];
  double v4 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  double v5 = [(ModalCardHeaderView *)self configuration];
  [v5 baselineToBottomDistance];
  [v3 constraintEqualToAnchor:v4];
  double v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleBaselineToBottomConstraint = self->_titleBaselineToBottomConstraint;
  self->_titleBaselineToBottomConstraint = v6;

  double v8 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  double v9 = [(ModalCardHeaderView *)self topAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  unsigned __int8 v11 = [(ModalCardHeaderView *)self configuration];
  [v11 topToTitleBaselineUnscaledDistance];
  double v13 = v12;
  double v14 = [(ModalCardHeaderView *)self configuration];
  uint64_t v15 = [v14 baselineDistanceFontProvider];
  double v16 = +[DynamicTypeWizard autoscaledConstraint:v10 constant:v15 withFontProvider:v13];
  topToTitleBaselineConstraint = self->_topToTitleBaselineConstraint;
  self->_topToTitleBaselineConstraint = v16;

  double v18 = self->_topToTitleBaselineConstraint;
  v20[0] = self->_titleBaselineToBottomConstraint;
  v20[1] = v18;
  BOOL v19 = +[NSArray arrayWithObjects:v20 count:2];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ModalCardHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)title
{
  double v2 = [(ModalCardHeaderView *)self titleLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setScrollViewOffset:(double)a3
{
  self->_scrollViewOffset = a3;
  double v3 = a3 / 10.0;
  id v4 = [(ModalCardHeaderView *)self bottomHairline];
  [v4 setAlpha:v3];
}

- (ModalCardHeaderConfiguration)configuration
{
  return self->_configuration;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (HairlineView)bottomHairline
{
  return self->_bottomHairline;
}

- (double)scrollViewOffset
{
  return self->_scrollViewOffset;
}

- (BOOL)useAdaptiveFont
{
  return self->_useAdaptiveFont;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineToBottomConstraint, 0);

  objc_storeStrong((id *)&self->_topToTitleBaselineConstraint, 0);
}

@end