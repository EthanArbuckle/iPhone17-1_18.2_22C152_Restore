@interface NavTrayStackedLabel
- (CGSize)intrinsicContentSize;
- (NavTrayStackedLabel)init;
- (NavTrayStackedLabel)initWithFrame:(CGRect)a3;
- (UILabel)bottomLabel;
- (UILabel)topLabel;
- (double)interLabelPadding;
- (void)_setup;
- (void)setInterLabelPadding:(double)a3;
@end

@implementation NavTrayStackedLabel

- (NavTrayStackedLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NavTrayStackedLabel;
  v3 = -[NavTrayStackedLabel initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(NavTrayStackedLabel *)v3 setAccessibilityIdentifier:v5];

    [(NavTrayStackedLabel *)v3 _setup];
  }
  return v3;
}

- (NavTrayStackedLabel)init
{
  v5.receiver = self;
  v5.super_class = (Class)NavTrayStackedLabel;
  v2 = -[NavTrayStackedLabel initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2) {
    [(NavTrayStackedLabel *)v2 _setup];
  }
  return v3;
}

- (void)_setup
{
  v3 = (UILabel *)objc_opt_new();
  topLabel = self->_topLabel;
  self->_topLabel = v3;

  [(UILabel *)self->_topLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_topLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_topLabel setAccessibilityIdentifier:@"TopLabel"];
  [(NavTrayStackedLabel *)self addSubview:self->_topLabel];
  objc_super v5 = (UILabel *)objc_opt_new();
  bottomLabel = self->_bottomLabel;
  self->_bottomLabel = v5;

  [(UILabel *)self->_bottomLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_bottomLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_bottomLabel setAccessibilityIdentifier:@"BottomLabel"];
  [(NavTrayStackedLabel *)self addSubview:self->_bottomLabel];
  objc_super v7 = [(UILabel *)self->_bottomLabel topAnchor];
  v8 = [(UILabel *)self->_topLabel bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  interLabelConstraint = self->_interLabelConstraint;
  self->_interLabelConstraint = v9;

  v30 = [(UILabel *)self->_topLabel leadingAnchor];
  v29 = [(NavTrayStackedLabel *)self leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v31[0] = v28;
  v27 = [(UILabel *)self->_topLabel trailingAnchor];
  v26 = [(NavTrayStackedLabel *)self trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[1] = v25;
  v24 = [(UILabel *)self->_topLabel topAnchor];
  v23 = [(NavTrayStackedLabel *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v31[2] = v22;
  v11 = [(UILabel *)self->_bottomLabel leadingAnchor];
  v12 = [(NavTrayStackedLabel *)self leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v31[3] = v13;
  v14 = [(UILabel *)self->_bottomLabel trailingAnchor];
  v15 = [(NavTrayStackedLabel *)self trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v17 = self->_interLabelConstraint;
  v31[4] = v16;
  v31[5] = v17;
  v18 = [(UILabel *)self->_bottomLabel bottomAnchor];
  v19 = [(NavTrayStackedLabel *)self bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v31[6] = v20;
  v21 = +[NSArray arrayWithObjects:v31 count:7];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)setInterLabelPadding:(double)a3
{
  if (vabdd_f64(self->_interLabelPadding, a3) > 2.22044605e-16)
  {
    self->_interLabelPadding = a3;
    -[NSLayoutConstraint setConstant:](self->_interLabelConstraint, "setConstant:");
    [(NavTrayStackedLabel *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_topLabel intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_bottomLabel intrinsicContentSize];
  if (v4 <= v7) {
    double v4 = v7;
  }
  double v9 = v6 + v8;
  [(NavTrayStackedLabel *)self interLabelPadding];
  double v11 = v10 + v9;
  double v12 = v4;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)interLabelPadding
{
  return self->_interLabelPadding;
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (UILabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);

  objc_storeStrong((id *)&self->_interLabelConstraint, 0);
}

@end