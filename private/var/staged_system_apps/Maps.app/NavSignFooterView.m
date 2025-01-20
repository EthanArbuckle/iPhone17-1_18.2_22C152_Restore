@interface NavSignFooterView
- (BOOL)shouldShowEndButton;
- (NavSignFooterView)initWithFrame:(CGRect)a3;
- (UIButton)endButton;
- (double)bottomPadding;
- (double)currentHeight;
- (double)layoutProgress;
- (double)maximumHeight;
- (double)minimumHeight;
- (void)_updateEndButtonFont;
- (void)_updateGrabber;
- (void)setBottomPadding:(double)a3;
- (void)setLayoutProgress:(double)a3;
- (void)setShouldShowEndButton:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NavSignFooterView

- (NavSignFooterView)initWithFrame:(CGRect)a3
{
  v74.receiver = self;
  v74.super_class = (Class)NavSignFooterView;
  v3 = -[NavSignFooterView initWithFrame:](&v74, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(NavSignFooterView *)v3 setAccessibilityIdentifier:v5];

    v6 = [(NavSignFooterView *)v3 layer];
    [v6 setMasksToBounds:1];

    uint64_t v7 = objc_opt_new();
    leftGrabber = v3->_leftGrabber;
    v3->_leftGrabber = (UIView *)v7;

    [(UIView *)v3->_leftGrabber setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = +[UIColor _maps_colorFromHexString:@"606063FF"];
    [(UIView *)v3->_leftGrabber setBackgroundColor:v9];

    v10 = [(UIView *)v3->_leftGrabber layer];
    [v10 setCornerRadius:2.0];

    v11 = [(UIView *)v3->_leftGrabber layer];
    [v11 setAnchorPoint:1.0, 0.0];

    v12 = [(UIView *)v3->_leftGrabber layer];
    [v12 setMaskedCorners:5];

    [(UIView *)v3->_leftGrabber setAccessibilityIdentifier:@"LeftGrabber"];
    [(NavSignFooterView *)v3 addSubview:v3->_leftGrabber];
    uint64_t v13 = objc_opt_new();
    rightGrabber = v3->_rightGrabber;
    v3->_rightGrabber = (UIView *)v13;

    [(UIView *)v3->_rightGrabber setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor _maps_colorFromHexString:@"606063FF"];
    [(UIView *)v3->_rightGrabber setBackgroundColor:v15];

    v16 = [(UIView *)v3->_rightGrabber layer];
    [v16 setCornerRadius:2.0];

    v17 = [(UIView *)v3->_rightGrabber layer];
    [v17 setAnchorPoint:0.0, 0.0];

    v18 = [(UIView *)v3->_rightGrabber layer];
    [v18 setMaskedCorners:10];

    [(UIView *)v3->_rightGrabber setAccessibilityIdentifier:@"RightGrabber"];
    [(NavSignFooterView *)v3 addSubview:v3->_rightGrabber];
    uint64_t v19 = objc_opt_new();
    contentAreaGuide = v3->_contentAreaGuide;
    v3->_contentAreaGuide = (UILayoutGuide *)v19;

    [(NavSignFooterView *)v3 addLayoutGuide:v3->_contentAreaGuide];
    uint64_t v21 = objc_opt_new();
    endButton = v3->_endButton;
    v3->_endButton = (UIButton *)v21;

    [(UIButton *)v3->_endButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = v3->_endButton;
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"[NavTray] End Title" value:@"localized string not found" table:0];
    [(UIButton *)v23 setTitle:v25 forState:0];

    v26 = +[UIColor systemRedColor];
    [(UIButton *)v3->_endButton setBackgroundColor:v26];

    v27 = [(UIButton *)v3->_endButton layer];
    [v27 setCornerRadius:10.0];

    [(UIButton *)v3->_endButton setAlpha:0.0];
    [(NavSignFooterView *)v3 _updateEndButtonFont];
    [(UIButton *)v3->_endButton setAccessibilityIdentifier:@"EndButton"];
    [(NavSignFooterView *)v3 addSubview:v3->_endButton];
    v73 = [(UIView *)v3->_leftGrabber centerXAnchor];
    v72 = [(NavSignFooterView *)v3 centerXAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v75[0] = v71;
    v70 = [(UIView *)v3->_leftGrabber topAnchor];
    v69 = [(NavSignFooterView *)v3 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69 constant:16.0];
    v75[1] = v68;
    v67 = [(UIView *)v3->_leftGrabber heightAnchor];
    v66 = [v67 constraintEqualToConstant:4.0];
    v75[2] = v66;
    v65 = [(UIView *)v3->_leftGrabber widthAnchor];
    v64 = [v65 constraintEqualToConstant:20.0];
    v75[3] = v64;
    v63 = [(UIView *)v3->_rightGrabber centerXAnchor];
    v62 = [(NavSignFooterView *)v3 centerXAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v75[4] = v61;
    v60 = [(UIView *)v3->_rightGrabber topAnchor];
    v59 = [(NavSignFooterView *)v3 topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:16.0];
    v75[5] = v58;
    v57 = [(UIView *)v3->_rightGrabber heightAnchor];
    v56 = [v57 constraintEqualToConstant:4.0];
    v75[6] = v56;
    v55 = [(UIView *)v3->_rightGrabber widthAnchor];
    v54 = [v55 constraintEqualToConstant:20.0];
    v75[7] = v54;
    v53 = [(UILayoutGuide *)v3->_contentAreaGuide leadingAnchor];
    v52 = [(NavSignFooterView *)v3 leadingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v75[8] = v51;
    v50 = [(UILayoutGuide *)v3->_contentAreaGuide trailingAnchor];
    v49 = [(NavSignFooterView *)v3 trailingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v75[9] = v48;
    v47 = [(UILayoutGuide *)v3->_contentAreaGuide topAnchor];
    v46 = [(NavSignFooterView *)v3 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v75[10] = v45;
    v43 = [(UILayoutGuide *)v3->_contentAreaGuide bottomAnchor];
    v44 = [(NavSignFooterView *)v3 safeAreaLayoutGuide];
    v42 = [v44 bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v75[11] = v41;
    v40 = [(UIButton *)v3->_endButton leadingAnchor];
    v39 = [(NavSignFooterView *)v3 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:16.0];
    v75[12] = v38;
    v28 = [(UIButton *)v3->_endButton trailingAnchor];
    v29 = [(NavSignFooterView *)v3 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-16.0];
    v75[13] = v30;
    v31 = [(UIButton *)v3->_endButton centerYAnchor];
    v32 = [(UILayoutGuide *)v3->_contentAreaGuide centerYAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v75[14] = v33;
    v34 = [(UIButton *)v3->_endButton heightAnchor];
    v35 = [v34 constraintEqualToConstant:54.0];
    v75[15] = v35;
    v36 = +[NSArray arrayWithObjects:v75 count:16];
    +[NSLayoutConstraint activateConstraints:v36];

    [(NavSignFooterView *)v3 _updateGrabber];
  }
  return v3;
}

- (double)minimumHeight
{
  return 30.0;
}

- (double)maximumHeight
{
  [(NavSignFooterView *)self bottomPadding];
  return v2 + 66.0;
}

- (double)currentHeight
{
  [(NavSignFooterView *)self minimumHeight];
  double v4 = v3;
  [(NavSignFooterView *)self layoutProgress];
  double v6 = 1.0 - v5;
  [(NavSignFooterView *)self maximumHeight];
  double v8 = v7;
  [(NavSignFooterView *)self layoutProgress];
  return v8 * v9 + v4 * v6;
}

- (void)setLayoutProgress:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    [(NavSignFooterView *)self _updateGrabber];
  }
}

- (void)_updateGrabber
{
  CGFloat v3 = self->_layoutProgress * 0.318309886 + 0.0;
  CGAffineTransformMakeRotation(&v9, -v3);
  leftGrabber = self->_leftGrabber;
  CGAffineTransform v8 = v9;
  [(UIView *)leftGrabber setTransform:&v8];
  CGAffineTransformMakeRotation(&v7, v3);
  rightGrabber = self->_rightGrabber;
  CGAffineTransform v6 = v7;
  [(UIView *)rightGrabber setTransform:&v6];
}

- (void)setShouldShowEndButton:(BOOL)a3
{
  if (self->_shouldShowEndButton != a3)
  {
    self->_shouldShowEndButton = a3;
    double v3 = 0.0;
    if (a3) {
      double v3 = 1.0;
    }
    [(UIButton *)self->_endButton setAlpha:v3];
  }
}

- (void)_updateEndButtonFont
{
  double v3 = [(NavSignFooterView *)self traitCollection];
  double v4 = [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  id v6 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle3 weight:v4 compatibleWithTraitCollection:UIFontWeightBold];

  double v5 = [(UIButton *)self->_endButton titleLabel];
  [v5 setFont:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavSignFooterView;
  [(NavSignFooterView *)&v14 traitCollectionDidChange:v4];
  double v5 = [(NavSignFooterView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  CGAffineTransform v7 = [v4 preferredContentSizeCategory];
  uint64_t v8 = sub_1000E93B0(v6, v7);

  if (v8) {
    [(NavSignFooterView *)self _updateEndButtonFont];
  }
  CGAffineTransform v9 = [(NavSignFooterView *)self traitCollection];
  int v10 = sub_100045060(v4, v9);

  if (v10)
  {
    v11 = [(NavSignFooterView *)self traitCollection];
    unsigned int v12 = [v11 isLuminanceReduced];

    if (v12) {
      double v13 = 0.300000012;
    }
    else {
      double v13 = 1.0;
    }
    [(UIView *)self->_rightGrabber setAlpha:v13];
    [(UIView *)self->_leftGrabber setAlpha:v13];
  }
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (UIButton)endButton
{
  return self->_endButton;
}

- (BOOL)shouldShowEndButton
{
  return self->_shouldShowEndButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_contentAreaGuide, 0);
  objc_storeStrong((id *)&self->_rightGrabber, 0);

  objc_storeStrong((id *)&self->_leftGrabber, 0);
}

@end