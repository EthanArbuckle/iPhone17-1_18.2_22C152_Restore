@interface PKDashboardButtonCollectionViewCell
- (BOOL)enabled;
- (BOOL)showActivity;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKDashboardButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (unint64_t)style;
- (void)_resetFonts;
- (void)_updateTextColor;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setShowActivity:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDashboardButtonCollectionViewCell

- (PKDashboardButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardButtonCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKDashboardButtonCollectionViewCell *)v3 createSubviews];
    [(PKDashboardCollectionViewCell *)v4 setMaskType:3];
    v4->_enabled = 1;
    [(PKDashboardButtonCollectionViewCell *)v4 _updateTextColor];
  }
  return v4;
}

- (void)createSubviews
{
  id v13 = [(PKDashboardButtonCollectionViewCell *)self contentView];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setNumberOfLines:2];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [(PKDashboardButtonCollectionViewCell *)self _resetFonts];
  [v13 addSubview:self->_titleLabel];
  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v5;

  [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
  [v13 addSubview:self->_activityIndicator];
  id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
  v8 = PKUIChevronImage();
  v9 = (UIImageView *)[v7 initWithImage:v8];

  v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v9 setTintColor:v10];

  disclosureView = self->_disclosureView;
  self->_disclosureView = v9;
  v12 = v9;

  [(UIImageView *)self->_disclosureView setHidden:1];
  [v13 addSubview:self->_disclosureView];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardButtonCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKDashboardButtonCollectionViewCell *)self contentView];
  [v3 bounds];
  -[PKDashboardButtonCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  -[PKDashboardButtonCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, v6, v7, width + v8 * -2.0, height);
  double v11 = fmin(height, 44.0);
  if (v10 < 44.0) {
    double v10 = v11;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setShowActivity:(BOOL)a3
{
  if (((!self->_showActivity ^ a3) & 1) == 0)
  {
    self->_showActivity = a3;
    activityIndicator = self->_activityIndicator;
    if (a3) {
      [(UIActivityIndicatorView *)activityIndicator startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)activityIndicator stopAnimating];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (((!self->_enabled ^ a3) & 1) == 0)
  {
    self->_enabled = a3;
    [(PKDashboardButtonCollectionViewCell *)self _updateTextColor];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style == a3) {
    return;
  }
  self->_style = a3;
  if (!a3)
  {
    uint64_t v4 = 1;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 0;
LABEL_6:
    [(UIImageView *)self->_disclosureView setHidden:v4];
  }
  [(PKDashboardButtonCollectionViewCell *)self _updateTextColor];

  [(PKDashboardButtonCollectionViewCell *)self setNeedsLayout];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat width = a3.size.width;
  double v7 = a3.size.width + -24.0;
  double v8 = a3.size.height + -24.0;
  if (([(UIImageView *)self->_disclosureView isHidden] & 1) == 0)
  {
    [(UIImageView *)self->_disclosureView sizeToFit];
    [(UIImageView *)self->_disclosureView frame];
    double v10 = v9;
    if (!v4)
    {
      UIRectCenteredYInRect();
      -[UIImageView setFrame:](self->_disclosureView, "setFrame:");
    }
    double v7 = v7 - v10 + -12.0;
  }
  [(UIActivityIndicatorView *)self->_activityIndicator sizeToFit];
  [(UIActivityIndicatorView *)self->_activityIndicator frame];
  double v12 = v11;
  if (!v4)
  {
    UIRectCenteredYInRect();
    double v12 = v13;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7 - v12 + -12.0, v8);
  UIRectCenteredYInRect();
  double v15 = v14;
  if (!v4) {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  }
  double v16 = v15 + 24.0;
  double v17 = width;
  result.double height = v16;
  result.CGFloat width = v17;
  return result;
}

- (void)_updateTextColor
{
  unint64_t style = self->_style;
  if (style == 1)
  {
    titleLabel = self->_titleLabel;
    if (self->_enabled) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
  }
  else
  {
    if (style) {
      return;
    }
    titleLabel = self->_titleLabel;
    if (self->_enabled) {
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else {
      [MEMORY[0x1E4FB1618] placeholderTextColor];
    }
  uint64_t v4 = };
  id v5 = (id)v4;
  -[UILabel setTextColor:](titleLabel, "setTextColor:");
}

- (void)_resetFonts
{
  titleLabel = self->_titleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)titleLabel setFont:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardButtonCollectionViewCell;
  [(PKDashboardButtonCollectionViewCell *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKDashboardButtonCollectionViewCell *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      double v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        [(PKDashboardButtonCollectionViewCell *)self _resetFonts];
        [(PKDashboardButtonCollectionViewCell *)self setNeedsLayout];
      }
    }
  }
}

- (BOOL)showActivity
{
  return self->_showActivity;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end