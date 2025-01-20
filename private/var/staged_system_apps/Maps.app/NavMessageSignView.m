@interface NavMessageSignView
+ (id)failedToRerouteMessageSign;
+ (id)reroutingMessageSign;
- (NSLayoutConstraint)majorLabelMinWidthConstraint;
- (NSLayoutConstraint)minSideMarginConstraint;
- (NSLayoutConstraint)spinnerLeadingMajorLabelConstraint;
- (UIActivityIndicatorView)spinner;
- (id)_defaultSignLayoutDelegate;
- (id)accessibilityIdentifier;
- (int64_t)messageType;
- (void)_configureForFailedToReroute;
- (void)_configureForRerouting;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)setMessageType:(int64_t)a3;
@end

@implementation NavMessageSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager defaultMessageSignLayoutDelegate];
}

- (void)_setupSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NavMessageSignView;
  [(NavSignView *)&v8 _setupSubviews];
  v3 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v3;

  v5 = +[UIColor whiteColor];
  [(UIActivityIndicatorView *)self->_spinner setColor:v5];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [(UIActivityIndicatorView *)self->_spinner setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(UIActivityIndicatorView *)self->_spinner setContentCompressionResistancePriority:1 forAxis:v7];
  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  [(NavMessageSignView *)self addSubview:self->_spinner];
}

- (void)_setupConstraints
{
  v33.receiver = self;
  v33.super_class = (Class)NavMessageSignView;
  [(NavSignView *)&v33 _setupConstraints];
  v3 = [(NavMessageSignView *)self leadingAnchor];
  v4 = [(NavMessageSignView *)self spinner];
  v5 = [v4 leadingAnchor];
  v32 = [v3 anchorWithOffsetToAnchor:v5];

  double v6 = [(NavSignView *)self majorLabel];
  double v7 = [v6 trailingAnchor];
  objc_super v8 = [(NavMessageSignView *)self trailingAnchor];
  v30 = [v7 anchorWithOffsetToAnchor:v8];

  v9 = [(NavSignView *)self majorLabel];
  v10 = [v9 widthAnchor];
  v11 = [v10 constraintGreaterThanOrEqualToConstant:0.0];
  majorLabelMinWidthConstraint = self->_majorLabelMinWidthConstraint;
  self->_majorLabelMinWidthConstraint = v11;

  v13 = [v32 constraintGreaterThanOrEqualToConstant:0.0];
  minSideMarginConstraint = self->_minSideMarginConstraint;
  self->_minSideMarginConstraint = v13;

  v15 = [(NavSignView *)self majorLabel];
  v16 = [v15 leadingAnchor];
  v17 = [(NavMessageSignView *)self spinner];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  spinnerLeadingMajorLabelConstraint = self->_spinnerLeadingMajorLabelConstraint;
  self->_spinnerLeadingMajorLabelConstraint = v19;

  v31 = [(NavMessageSignView *)self spinner];
  v21 = [v31 centerYAnchor];
  v22 = [(NavSignView *)self majorLabel];
  v23 = [v22 centerYAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v34[0] = v24;
  v25 = [(NavMessageSignView *)self majorLabelMinWidthConstraint];
  v34[1] = v25;
  v26 = [(NavMessageSignView *)self minSideMarginConstraint];
  v34[2] = v26;
  v27 = [(NavMessageSignView *)self spinnerLeadingMajorLabelConstraint];
  v34[3] = v27;
  v28 = [v32 constraintEqualToAnchor:v30 multiplier:1.0];
  v34[4] = v28;
  v29 = +[NSArray arrayWithObjects:v34 count:5];
  +[NSLayoutConstraint activateConstraints:v29];
}

- (void)_updateConstraints
{
  v15.receiver = self;
  v15.super_class = (Class)NavMessageSignView;
  [(NavSignView *)&v15 _updateConstraints];
  v3 = [(NavMessageSignView *)self spinner];
  unsigned int v4 = [v3 isHidden];

  if ([(NavSignView *)self hasMajorText]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  double v6 = [(NavMessageSignView *)self majorLabelMinWidthConstraint];
  [v6 setConstant:v5];

  double v7 = [(NavSignView *)self signLayoutDelegate];
  [v7 navSignView:self textLeadingMarginForMajorText:1];
  double v9 = v8;

  if (v4) {
    double v9 = 0.0;
  }
  v10 = [(NavMessageSignView *)self spinnerLeadingMajorLabelConstraint];
  [v10 setConstant:v9];

  v11 = [(NavSignView *)self signLayoutDelegate];
  [v11 contentSideMarginForSign:self];
  double v13 = v12;

  v14 = [(NavMessageSignView *)self minSideMarginConstraint];
  [v14 setConstant:v13];
}

+ (id)reroutingMessageSign
{
  v2 = -[NavSignView initWithFrame:]([NavMessageSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NavMessageSignView *)v2 setMessageType:1];

  return v2;
}

+ (id)failedToRerouteMessageSign
{
  v2 = -[NavSignView initWithFrame:]([NavMessageSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NavMessageSignView *)v2 setMessageType:2];

  return v2;
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setMessageType:(int64_t)a3
{
  if (self->_messageType != a3)
  {
    self->_messageType = a3;
    if (a3 == 2)
    {
      [(NavMessageSignView *)self _configureForFailedToReroute];
    }
    else if (a3 == 1)
    {
      [(NavMessageSignView *)self _configureForRerouting];
    }
  }
}

- (void)_configureForRerouting
{
  [(NavSignView *)self clearContent];
  v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"Rerouting..." value:@"localized string not found" table:0];
  double v5 = [v4 mkServerFormattedString];

  if (v5)
  {
    v10 = v5;
    double v6 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    double v6 = 0;
  }
  double v7 = [(NavSignView *)self majorLabel];
  [v7 setTextAlternatives:v6];

  if (v5) {
  double v8 = [(NavSignView *)self minorLabel];
  }
  [v8 setTextAlternatives:0];

  double v9 = [(NavMessageSignView *)self spinner];
  [v9 startAnimating];
}

- (void)_configureForFailedToReroute
{
  [(NavSignView *)self clearContent];
  v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 localizedStringForKey:@"Rerouting..." value:@"localized string not found" table:0];
  double v5 = [v4 mkServerFormattedString];

  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"Data connection required" value:@"localized string not found" table:0];
  double v8 = [v7 mkServerFormattedString];

  if (v5)
  {
    objc_super v15 = v5;
    double v9 = +[NSArray arrayWithObjects:&v15 count:1];
  }
  else
  {
    double v9 = 0;
  }
  v10 = [(NavSignView *)self majorLabel];
  [v10 setTextAlternatives:v9];

  if (v5) {
  if (v8)
  }
  {
    v14 = v8;
    v11 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  else
  {
    v11 = 0;
  }
  double v12 = [(NavSignView *)self minorLabel];
  [v12 setTextAlternatives:v11];

  if (v8) {
  double v13 = [(NavMessageSignView *)self spinner];
  }
  [v13 startAnimating];
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (NSLayoutConstraint)majorLabelMinWidthConstraint
{
  return self->_majorLabelMinWidthConstraint;
}

- (NSLayoutConstraint)spinnerLeadingMajorLabelConstraint
{
  return self->_spinnerLeadingMajorLabelConstraint;
}

- (NSLayoutConstraint)minSideMarginConstraint
{
  return self->_minSideMarginConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minSideMarginConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerLeadingMajorLabelConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelMinWidthConstraint, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end