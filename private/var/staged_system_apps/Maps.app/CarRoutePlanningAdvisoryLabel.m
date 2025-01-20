@interface CarRoutePlanningAdvisoryLabel
- (BOOL)alwaysClickable;
- (CarCardRoundedButton)viewButton;
- (CarRoutePlanningAdvisoryLabel)initWithFrame:(CGRect)a3;
- (CarRoutePlanningAdvisoryLabelDelegate)delegate;
- (NSString)text;
- (UILabel)label;
- (void)_displayClickableAdvisories;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)refreshClickability;
- (void)setAlwaysClickable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setViewButton:(id)a3;
- (void)shouldHideDetailButton:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarRoutePlanningAdvisoryLabel

- (CarRoutePlanningAdvisoryLabel)initWithFrame:(CGRect)a3
{
  v62.receiver = self;
  v62.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  v3 = -[CarRoutePlanningAdvisoryLabel initWithFrame:](&v62, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarRoutePlanningAdvisoryLabel *)v3 setAccessibilityIdentifier:@"CarRoutePlanningAdvisoryLabel"];
    uint64_t v5 = [(CarRoutePlanningAdvisoryLabel *)v4 _mapsCar_injectBlurView];
    blurView = v4->_blurView;
    v4->_blurView = (CarDynamicBlurView *)v5;

    [(CarDynamicBlurView *)v4->_blurView _setCornerRadius:1 continuous:15 maskedCorners:9.0];
    LODWORD(v7) = 1144750080;
    [(CarRoutePlanningAdvisoryLabel *)v4 setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1132068864;
    [(CarRoutePlanningAdvisoryLabel *)v4 setContentCompressionResistancePriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(CarRoutePlanningAdvisoryLabel *)v4 setContentHuggingPriority:1 forAxis:v9];
    LODWORD(v10) = 1132068864;
    [(CarRoutePlanningAdvisoryLabel *)v4 setContentHuggingPriority:0 forAxis:v10];
    id v11 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v4->_label;
    v4->_label = v15;

    [(UILabel *)v4->_label setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_label setNumberOfLines:1];
    v17 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    [(UILabel *)v4->_label setFont:v17];

    v18 = +[UIColor labelColor];
    [(UILabel *)v4->_label setTextColor:v18];

    [(UILabel *)v4->_label setTextAlignment:4];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v4->_label setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1132068864;
    [(UILabel *)v4->_label setContentCompressionResistancePriority:0 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UILabel *)v4->_label setContentHuggingPriority:1 forAxis:v21];
    LODWORD(v22) = 1132068864;
    [(UILabel *)v4->_label setContentHuggingPriority:0 forAxis:v22];
    [(CarRoutePlanningAdvisoryLabel *)v4 addSubview:v4->_label];
    v23 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    viewButton = v4->_viewButton;
    v4->_viewButton = v23;

    [(CarCardRoundedButton *)v4->_viewButton setAccessibilityIdentifier:@"MoreButton"];
    [(CarCardRoundedButton *)v4->_viewButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    v26 = [(CarCardRoundedButton *)v4->_viewButton titleLabel];
    [v26 setFont:v25];

    v27 = v4->_viewButton;
    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"More button [advisory]" value:@"localized string not found" table:0];
    [(CarCardRoundedButton *)v27 setTitle:v29 forState:0];

    v30 = +[UIColor clearColor];
    [(CarFocusableButton *)v4->_viewButton setNonFocusedBackgroundColor:v30];

    v31 = +[UIColor _carSystemFocusColor];
    [(CarFocusableButton *)v4->_viewButton setNonFocusedTintColor:v31];

    v32 = +[UIColor _carSystemFocusColor];
    [(CarFocusableButton *)v4->_viewButton setFocusedBackgroundColor:v32];

    v33 = +[UIColor _carSystemFocusLabelColor];
    [(CarFocusableButton *)v4->_viewButton setFocusedTintColor:v33];

    [(CarCardRoundedButton *)v4->_viewButton setHidden:1];
    [(CarCardRoundedButton *)v4->_viewButton setUserInteractionEnabled:1];
    [(CarCardRoundedButton *)v4->_viewButton addTarget:v4 action:"_displayClickableAdvisories" forControlEvents:64];
    LODWORD(v34) = 1148846080;
    [(CarCardRoundedButton *)v4->_viewButton setContentCompressionResistancePriority:0 forAxis:v34];
    LODWORD(v35) = 1144750080;
    [(CarCardRoundedButton *)v4->_viewButton setContentCompressionResistancePriority:1 forAxis:v35];
    [(CarRoutePlanningAdvisoryLabel *)v4 addSubview:v4->_viewButton];
    v36 = [(CarCardRoundedButton *)v4->_viewButton widthAnchor];
    uint64_t v37 = [v36 constraintEqualToConstant:0.0];
    buttonWidthConstraint = v4->_buttonWidthConstraint;
    v4->_buttonWidthConstraint = (NSLayoutConstraint *)v37;

    v61 = [(UILabel *)v4->_label leadingAnchor];
    v60 = [(CarRoutePlanningAdvisoryLabel *)v4 leadingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:10.0];
    v63[0] = v59;
    v58 = [(UILabel *)v4->_label firstBaselineAnchor];
    v57 = [(CarRoutePlanningAdvisoryLabel *)v4 topAnchor];
    v56 = [v58 constraintEqualToAnchor:v57 constant:20.0];
    v63[1] = v56;
    v55 = [(UILabel *)v4->_label lastBaselineAnchor];
    v54 = [(CarRoutePlanningAdvisoryLabel *)v4 bottomAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:-11.0];
    v63[2] = v53;
    v52 = [(UILabel *)v4->_label trailingAnchor];
    v51 = [(CarCardRoundedButton *)v4->_viewButton leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 constant:-5.0];
    v63[3] = v50;
    v49 = [(CarRoutePlanningAdvisoryLabel *)v4 trailingAnchor];
    v39 = [(CarCardRoundedButton *)v4->_viewButton trailingAnchor];
    v40 = [v49 constraintEqualToAnchor:v39 constant:5.0];
    v63[4] = v40;
    v41 = [(CarCardRoundedButton *)v4->_viewButton topAnchor];
    v42 = [(CarRoutePlanningAdvisoryLabel *)v4 topAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:5.0];
    v63[5] = v43;
    v44 = [(CarCardRoundedButton *)v4->_viewButton bottomAnchor];
    v45 = [(CarRoutePlanningAdvisoryLabel *)v4 bottomAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:-5.0];
    v63[6] = v46;
    v63[7] = v4->_buttonWidthConstraint;
    v47 = +[NSArray arrayWithObjects:v63 count:8];
    [(CarRoutePlanningAdvisoryLabel *)v4 addConstraints:v47];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  [(CarRoutePlanningAdvisoryLabel *)&v3 layoutSubviews];
  [(CarRoutePlanningAdvisoryLabel *)self refreshClickability];
}

- (void)setText:(id)a3
{
  if (self->_text != a3)
  {
    v4 = (NSString *)[a3 copy];
    text = self->_text;
    self->_text = v4;

    v6 = self->_text;
    label = self->_label;
    [(UILabel *)label setText:v6];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  [(CarRoutePlanningAdvisoryLabel *)&v4 didMoveToWindow];
  objc_super v3 = [(CarRoutePlanningAdvisoryLabel *)self window];

  if (v3) {
    [(CarRoutePlanningAdvisoryLabel *)self _mapsCar_updateShadow];
  }
}

- (void)setAlwaysClickable:(BOOL)a3
{
  if (self->_alwaysClickable != a3)
  {
    self->_alwaysClickable = a3;
    [(CarRoutePlanningAdvisoryLabel *)self refreshClickability];
  }
}

- (void)refreshClickability
{
  if (self->_alwaysClickable) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(UILabel *)self->_label isTextTruncated] ^ 1;
  }

  [(CarRoutePlanningAdvisoryLabel *)self shouldHideDetailButton:v3];
}

- (void)shouldHideDetailButton:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(CarCardRoundedButton *)self->_viewButton isHidden];
  [(CarCardRoundedButton *)self->_viewButton setHidden:v3];
  [(NSLayoutConstraint *)self->_buttonWidthConstraint setActive:v3];
  if (v5 != v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clickabilityChanged];
  }
}

- (void)_displayClickableAdvisories
{
  id v2 = [(CarRoutePlanningAdvisoryLabel *)self delegate];
  [v2 displayAdvisories];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  id v4 = a3;
  [(CarRoutePlanningAdvisoryLabel *)&v8 traitCollectionDidChange:v4];
  unsigned int v5 = [(CarRoutePlanningAdvisoryLabel *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CarRoutePlanningAdvisoryLabel *)self _mapsCar_updateShadow];
  }
}

- (NSString)text
{
  return self->_text;
}

- (CarCardRoundedButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)alwaysClickable
{
  return self->_alwaysClickable;
}

- (CarRoutePlanningAdvisoryLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarRoutePlanningAdvisoryLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_buttonWidthConstraint, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end