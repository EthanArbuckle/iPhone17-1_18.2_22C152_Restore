@interface CarSpinnerGuidanceSign
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)showsMessage;
- (CarGuidanceCardSizeProviding)sizeProvider;
- (CarSpinnerGuidanceSign)initWithDestination:(unint64_t)a3;
- (NSArray)dynamicConstraints;
- (NSString)messageString;
- (NSString)primaryString;
- (void)_updateStyling;
- (void)setDynamicConstraints:(id)a3;
- (void)setMessageString:(id)a3;
- (void)setPrimaryString:(id)a3;
- (void)setShowMessage:(BOOL)a3;
- (void)setShowMessage:(BOOL)a3 animated:(BOOL)a4;
- (void)setSizeProvider:(id)a3;
- (void)updateConstraints;
@end

@implementation CarSpinnerGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarSpinnerGuidanceSign)initWithDestination:(unint64_t)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CarSpinnerGuidanceSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[CarSpinnerGuidanceSign initWithFrame:](&v42, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    [(CarSpinnerGuidanceSign *)v7 setAccessibilityIdentifier:@"CarSpinnerGuidanceSign"];
    v8->_destination = a3;
    v9 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityIndicator = v8->_activityIndicator;
    v8->_activityIndicator = v9;

    [(UIActivityIndicatorView *)v8->_activityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v8->_activityIndicator setAccessibilityIdentifier:@"ActivityIndicator"];
    [(CarSpinnerGuidanceSign *)v8 addSubview:v8->_activityIndicator];
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, 0, width, height)];
    primaryLabel = v8->_primaryLabel;
    v8->_primaryLabel = v11;

    [(UILabel *)v8->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
    [(CarSpinnerGuidanceSign *)v8 addSubview:v8->_primaryLabel];
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    messageLabel = v8->_messageLabel;
    v8->_messageLabel = v13;

    [(UILabel *)v8->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_messageLabel setAccessibilityIdentifier:@"MessageLabel"];
    [(CarSpinnerGuidanceSign *)v8 addSubview:v8->_messageLabel];
    v8->_showMessage = 0;
    [(CarSpinnerGuidanceSign *)v8 _updateStyling];
    v41 = [(UILabel *)v8->_primaryLabel topAnchor];
    v40 = [(CarSpinnerGuidanceSign *)v8 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:10.0];
    v43[0] = v39;
    v38 = [(UILabel *)v8->_primaryLabel leadingAnchor];
    v37 = [(CarSpinnerGuidanceSign *)v8 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:10.0];
    v43[1] = v36;
    v35 = [(CarSpinnerGuidanceSign *)v8 trailingAnchor];
    v34 = [(UILabel *)v8->_primaryLabel trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34 constant:10.0];
    v43[2] = v33;
    v32 = [(UIActivityIndicatorView *)v8->_activityIndicator topAnchor];
    v31 = [(UILabel *)v8->_primaryLabel bottomAnchor];
    LODWORD(v15) = 1148829696;
    v30 = [v32 constraintEqualToAnchor:v31 constant:7.0 priority:v15];
    v43[3] = v30;
    v29 = [(UIActivityIndicatorView *)v8->_activityIndicator topAnchor];
    v28 = [(UILabel *)v8->_primaryLabel bottomAnchor];
    v27 = [v29 constraintGreaterThanOrEqualToAnchor:v28];
    v43[4] = v27;
    v26 = [(UIActivityIndicatorView *)v8->_activityIndicator centerXAnchor];
    v16 = [(CarSpinnerGuidanceSign *)v8 centerXAnchor];
    v17 = [v26 constraintEqualToAnchor:v16];
    v43[5] = v17;
    v18 = [(UILabel *)v8->_messageLabel leadingAnchor];
    v19 = [(UILabel *)v8->_primaryLabel leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v43[6] = v20;
    v21 = [(UILabel *)v8->_primaryLabel trailingAnchor];
    v22 = [(UILabel *)v8->_messageLabel trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v43[7] = v23;
    v24 = +[NSArray arrayWithObjects:v43 count:8];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  return v8;
}

- (void)setPrimaryString:(id)a3
{
  v4 = (NSString *)[a3 copy];
  primaryString = self->_primaryString;
  self->_primaryString = v4;

  v6 = self->_primaryString;
  primaryLabel = self->_primaryLabel;

  [(UILabel *)primaryLabel setText:v6];
}

- (void)setMessageString:(id)a3
{
  v4 = (NSString *)[a3 copy];
  messageString = self->_messageString;
  self->_messageString = v4;

  v6 = self->_messageString;
  messageLabel = self->_messageLabel;

  [(UILabel *)messageLabel setText:v6];
}

- (void)_updateStyling
{
  v3 = +[UIFont systemFontOfSize:16.0];
  [(UILabel *)self->_primaryLabel setFont:v3];

  v4 = [(CarSpinnerGuidanceSign *)self primaryString];
  [(UILabel *)self->_primaryLabel setText:v4];

  v5 = sub_100D89C4C(self->_destination == 1);
  [(UILabel *)self->_primaryLabel setTextColor:v5];

  [(UILabel *)self->_primaryLabel setMinimumScaleFactor:0.699999988];
  [(UILabel *)self->_primaryLabel setNumberOfLines:3];
  [(UILabel *)self->_primaryLabel setTextAlignment:1];
  [(UILabel *)self->_primaryLabel setLineBreakMode:0];
  [(UILabel *)self->_primaryLabel setAdjustsFontSizeToFitWidth:1];
  v6 = [(CarSpinnerGuidanceSign *)self messageString];
  [(UILabel *)self->_messageLabel setText:v6];

  v7 = +[UIFont systemFontOfSize:12.0];
  [(UILabel *)self->_messageLabel setFont:v7];

  v8 = sub_100D89C4C(self->_destination == 1);
  [(UILabel *)self->_messageLabel setTextColor:v8];

  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [(UILabel *)self->_messageLabel setNumberOfLines:4];
  [(UILabel *)self->_messageLabel setLineBreakMode:0];
  [(UILabel *)self->_messageLabel setMinimumScaleFactor:0.699999988];
  [(UILabel *)self->_messageLabel setAdjustsFontSizeToFitWidth:1];
  double v9 = 1.0;
  if (!self->_showMessage) {
    double v9 = 0.0;
  }
  [(UILabel *)self->_messageLabel setAlpha:v9];
  [(UILabel *)self->_messageLabel setHidden:!self->_showMessage];
  v10 = [(UILabel *)self->_primaryLabel textColor];
  [(UIActivityIndicatorView *)self->_activityIndicator setColor:v10];

  activityIndicator = self->_activityIndicator;

  [(UIActivityIndicatorView *)activityIndicator startAnimating];
}

- (void)setShowMessage:(BOOL)a3
{
}

- (void)setShowMessage:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showMessage != a3)
  {
    BOOL v4 = a4;
    v7 = [(CarSpinnerGuidanceSign *)self messageString];

    if (v7)
    {
      self->_showMessage = a3;
      [(CarSpinnerGuidanceSign *)self setNeedsUpdateConstraints];
      [(CarSpinnerGuidanceSign *)self setNeedsLayout];
      double v8 = 0.300000012;
      if (!v4) {
        double v8 = 0.0;
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100992494;
      v11[3] = &unk_1012E6300;
      v11[4] = self;
      BOOL v12 = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1009924E4;
      v9[3] = &unk_1012E8908;
      v9[4] = self;
      BOOL v10 = a3;
      +[UIView animateWithDuration:v11 animations:v9 completion:v8];
    }
  }
}

- (void)updateConstraints
{
  v3 = [(CarSpinnerGuidanceSign *)self dynamicConstraints];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(CarSpinnerGuidanceSign *)self dynamicConstraints];
    +[NSLayoutConstraint deactivateConstraints:v5];
  }
  v6 = objc_opt_new();
  if ([(CarSpinnerGuidanceSign *)self showsMessage])
  {
    v7 = [(UILabel *)self->_messageLabel topAnchor];
    double v8 = [(UIActivityIndicatorView *)self->_activityIndicator bottomAnchor];
    LODWORD(v9) = 1148829696;
    BOOL v10 = [v7 constraintEqualToAnchor:v8 constant:7.0 priority:v9];
    v17[0] = v10;
    v11 = [(CarSpinnerGuidanceSign *)self bottomAnchor];
    BOOL v12 = [(UILabel *)self->_messageLabel bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:10.0];
    v17[1] = v13;
    v14 = v17;
  }
  else
  {
    v7 = [(CarSpinnerGuidanceSign *)self bottomAnchor];
    double v8 = [(UIActivityIndicatorView *)self->_activityIndicator bottomAnchor];
    BOOL v10 = [v7 constraintEqualToAnchor:v8 constant:10.0];
    v18[0] = v10;
    v11 = [(UILabel *)self->_messageLabel topAnchor];
    BOOL v12 = [(CarSpinnerGuidanceSign *)self bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v18[1] = v13;
    v14 = v18;
  }
  double v15 = +[NSArray arrayWithObjects:v14 count:2];
  [v6 addObjectsFromArray:v15];

  +[NSLayoutConstraint activateConstraints:v6];
  [(CarSpinnerGuidanceSign *)self setDynamicConstraints:v6];
  v16.receiver = self;
  v16.super_class = (Class)CarSpinnerGuidanceSign;
  [(CarSpinnerGuidanceSign *)&v16 updateConstraints];
}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeProvider);

  return (CarGuidanceCardSizeProviding *)WeakRetained;
}

- (void)setSizeProvider:(id)a3
{
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (BOOL)showsMessage
{
  return self->_showMessage;
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_messageString, 0);
  objc_storeStrong((id *)&self->_primaryString, 0);
  objc_destroyWeak((id *)&self->_sizeProvider);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end