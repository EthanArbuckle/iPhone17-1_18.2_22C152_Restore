@interface ExtensionsBannerAttributionView
- (CGSize)intrinsicContentSize;
- (ExtensionsBannerAttributionView)initWithCoder:(id)a3;
- (ExtensionsBannerAttributionView)initWithFrame:(CGRect)a3;
- (UILabel)attributionLabel;
- (void)_commonInit;
- (void)_setupConstraints;
- (void)setAttributionLabel:(id)a3;
@end

@implementation ExtensionsBannerAttributionView

- (ExtensionsBannerAttributionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerAttributionView;
  v3 = [(ExtensionsBannerAttributionView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ExtensionsBannerAttributionView *)v3 _commonInit];
  }
  return v4;
}

- (ExtensionsBannerAttributionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ExtensionsBannerAttributionView;
  v3 = -[ExtensionsBannerAttributionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ExtensionsBannerAttributionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(ExtensionsBannerAttributionView *)self setTopHairlineHidden:1];
  [(ExtensionsBannerAttributionView *)self setBottomHairlineHidden:1];
  v3 = +[UIColor blackColor];
  v4 = [v3 colorWithAlphaComponent:0.0700000003];
  [(ExtensionsBannerAttributionView *)self setBackgroundColor:v4];

  v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v5;

  [(UILabel *)self->_attributionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_attributionLabel setTextAlignment:1];
  [(UILabel *)self->_attributionLabel setNumberOfLines:1];
  v7 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_attributionLabel setTextColor:v7];

  +[DynamicTypeWizard autorefreshLabel:self->_attributionLabel withFontProvider:&stru_1013213C0];
  [(ExtensionsBannerAttributionView *)self addSubview:self->_attributionLabel];

  [(ExtensionsBannerAttributionView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  v15 = [(UILabel *)self->_attributionLabel leadingAnchor];
  v14 = [(ExtensionsBannerAttributionView *)self leadingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:16.0];
  v16[0] = v13;
  v3 = [(UILabel *)self->_attributionLabel trailingAnchor];
  v4 = [(ExtensionsBannerAttributionView *)self trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:-16.0];
  v16[1] = v5;
  objc_super v6 = [(UILabel *)self->_attributionLabel topAnchor];
  v7 = [(ExtensionsBannerAttributionView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:0.0];
  v16[2] = v8;
  v9 = [(UILabel *)self->_attributionLabel bottomAnchor];
  v10 = [(ExtensionsBannerAttributionView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:0.0];
  v16[3] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end