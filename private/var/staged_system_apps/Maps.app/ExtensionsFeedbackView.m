@interface ExtensionsFeedbackView
- (BOOL)showRatingOptions;
- (ExtensionsFeedbackView)initWithSubmitHandler:(id)a3;
- (NSArray)constraints;
- (NSArray)tippingOptions;
- (NSNumber)selectedRating;
- (ProminentActionButton)submitButton;
- (RideBookingCurrencyAmount)selectedTip;
- (RidesharingRatingView)ratingView;
- (RidesharingTippingView)tippingView;
- (UIImageView)headerImageView;
- (UIStackView)stackView;
- (id)submitHandler;
- (void)_commonInit;
- (void)_submitTapped:(id)a3;
- (void)_updateConstraints;
- (void)_updateSubmitButton;
- (void)configureHeaderImage:(id)a3;
- (void)configureSubmitButtonTitle:(id)a3;
- (void)configureTippingViewWithDelegate:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setHeaderImageView:(id)a3;
- (void)setRatingView:(id)a3;
- (void)setSelectedRating:(id)a3;
- (void)setSelectedTip:(id)a3;
- (void)setShowRatingOptions:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setSubmitButton:(id)a3;
- (void)setSubmitHandler:(id)a3;
- (void)setTippingOptions:(id)a3;
- (void)setTippingView:(id)a3;
- (void)updateTheme;
@end

@implementation ExtensionsFeedbackView

- (ExtensionsFeedbackView)initWithSubmitHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ExtensionsFeedbackView;
  v5 = -[ExtensionsFeedbackView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    id v6 = [v4 copy];
    id submitHandler = v5->_submitHandler;
    v5->_id submitHandler = v6;

    [(ExtensionsFeedbackView *)v5 _commonInit];
  }

  return v5;
}

- (void)_commonInit
{
  [(ExtensionsFeedbackView *)self setLeftHairlineInset:16.0];
  [(ExtensionsFeedbackView *)self setRightHairlineInset:0.0];
  [(ExtensionsFeedbackView *)self setTopHairlineHidden:1];
  [(ExtensionsFeedbackView *)self setBottomHairlineHidden:0];
  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v3;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setDistribution:3];
  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setSpacing:15.0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008900E8;
  v15[3] = &unk_1012FEBC8;
  v15[4] = self;
  v5 = [[RidesharingRatingView alloc] initWithSelectedStars:0 updateBlock:v15];
  ratingView = self->_ratingView;
  self->_ratingView = v5;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100890148;
  v14[3] = &unk_1012FEBF0;
  v14[4] = self;
  v7 = [[RidesharingTippingView alloc] initWithOptions:0 updateBlock:v14];
  tippingView = self->_tippingView;
  self->_tippingView = v7;

  objc_super v9 = +[ProminentActionButton button];
  submitButton = self->_submitButton;
  self->_submitButton = v9;

  [(ProminentActionButton *)self->_submitButton addTarget:self action:"_submitTapped:" forControlEvents:64];
  [(ExtensionsFeedbackView *)self _updateSubmitButton];
  v11 = [(ProminentActionButton *)self->_submitButton titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:&stru_1013214E0];

  v12 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  headerImageView = self->_headerImageView;
  self->_headerImageView = v12;

  [(UIImageView *)self->_headerImageView setContentMode:1];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_headerImageView];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_ratingView];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_tippingView];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_submitButton];
  [(ExtensionsFeedbackView *)self addSubview:self->_stackView];
  [(ExtensionsFeedbackView *)self _updateConstraints];
  [(ExtensionsFeedbackView *)self updateTheme];
}

- (void)updateTheme
{
  id v4 = [(ExtensionsFeedbackView *)self theme];
  v3 = [v4 hairlineColor];
  [(ExtensionsFeedbackView *)self setHairlineColor:v3];
}

- (void)_updateConstraints
{
  constraints = self->_constraints;
  if (constraints && [(NSArray *)constraints count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  }
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = [(UIStackView *)self->_stackView topAnchor];
  v23 = [(ExtensionsFeedbackView *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:7.5];
  v25[0] = v22;
  v21 = [(UIStackView *)self->_stackView leadingAnchor];
  v20 = [(ExtensionsFeedbackView *)self leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:16.0];
  v25[1] = v19;
  v18 = [(UIStackView *)self->_stackView trailingAnchor];
  v17 = [(ExtensionsFeedbackView *)self trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:-16.0];
  v25[2] = v16;
  v15 = [(UIStackView *)self->_stackView bottomAnchor];
  id v4 = [(ExtensionsFeedbackView *)self bottomAnchor];
  v5 = [v15 constraintEqualToAnchor:v4 constant:-15.0];
  v25[3] = v5;
  id v6 = [(UIImageView *)self->_headerImageView heightAnchor];
  v7 = [v6 constraintEqualToConstant:57.0];
  v25[4] = v7;
  v8 = [(UIImageView *)self->_headerImageView widthAnchor];
  objc_super v9 = [v8 constraintEqualToConstant:57.0];
  v25[5] = v9;
  v10 = [(ProminentActionButton *)self->_submitButton heightAnchor];
  v11 = [v10 constraintEqualToConstant:50.0];
  v25[6] = v11;
  v12 = +[NSArray arrayWithObjects:v25 count:7];

  v13 = self->_constraints;
  self->_constraints = v12;
  v14 = v12;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_updateSubmitButton
{
  if (self->_selectedTip) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = self->_selectedRating != 0;
  }
  [(ProminentActionButton *)self->_submitButton setEnabled:v3];
  submitButton = self->_submitButton;
  double v5 = 0.300000012;
  if (v3) {
    double v5 = 1.0;
  }

  [(ProminentActionButton *)submitButton setAlpha:v5];
}

- (void)_submitTapped:(id)a3
{
  id submitHandler = (void (**)(id, NSNumber *, RideBookingCurrencyAmount *))self->_submitHandler;
  if (submitHandler) {
    submitHandler[2](submitHandler, self->_selectedRating, self->_selectedTip);
  }
}

- (void)configureHeaderImage:(id)a3
{
  -[UIImageView setImage:](self->_headerImageView, "setImage:");
  headerImageView = self->_headerImageView;

  [(UIImageView *)headerImageView setHidden:a3 == 0];
}

- (void)configureSubmitButtonTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(ProminentActionButton *)self->_submitButton titleLabel];
  double v5 = [v4 text];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0) {
    [(ProminentActionButton *)self->_submitButton setTitle:v7 forState:0];
  }
}

- (void)setTippingOptions:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_tippingOptions, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_tippingOptions, a3);
    [(RidesharingTippingView *)self->_tippingView setHidden:v5 == 0];
    [(RidesharingTippingView *)self->_tippingView setTippingOptions:v5];
  }
}

- (void)setShowRatingOptions:(BOOL)a3
{
  self->_showRatingOptions = a3;
  [(RidesharingRatingView *)self->_ratingView setHidden:!a3];
}

- (void)configureTippingViewWithDelegate:(id)a3
{
}

- (NSArray)tippingOptions
{
  return self->_tippingOptions;
}

- (BOOL)showRatingOptions
{
  return self->_showRatingOptions;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (RidesharingRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (RidesharingTippingView)tippingView
{
  return self->_tippingView;
}

- (void)setTippingView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (ProminentActionButton)submitButton
{
  return self->_submitButton;
}

- (void)setSubmitButton:(id)a3
{
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
}

- (id)submitHandler
{
  return self->_submitHandler;
}

- (void)setSubmitHandler:(id)a3
{
}

- (NSNumber)selectedRating
{
  return self->_selectedRating;
}

- (void)setSelectedRating:(id)a3
{
}

- (RideBookingCurrencyAmount)selectedTip
{
  return self->_selectedTip;
}

- (void)setSelectedTip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTip, 0);
  objc_storeStrong((id *)&self->_selectedRating, 0);
  objc_storeStrong(&self->_submitHandler, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_tippingView, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_tippingOptions, 0);
}

@end