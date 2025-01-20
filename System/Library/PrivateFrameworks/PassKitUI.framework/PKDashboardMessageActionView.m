@interface PKDashboardMessageActionView
- (BOOL)smallDevice;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)titleText;
- (PKDashboardMessageActionView)initWithFrame:(CGRect)a3;
- (PKDashboardMessageActionView)initWithSize:(CGSize)a3;
- (UIColor)titleTextColor;
- (UIFont)titleFont;
- (unint64_t)accessory;
- (void)_commonInit;
- (void)_configureView;
- (void)_updateFonts;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessory:(unint64_t)a3;
- (void)setSmallDevice:(BOOL)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation PKDashboardMessageActionView

- (PKDashboardMessageActionView)initWithSize:(CGSize)a3
{
  return -[PKDashboardMessageActionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (PKDashboardMessageActionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardMessageActionView;
  v3 = -[PKDashboardMessageActionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKDashboardMessageActionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  self->_smallDevice = PKUIGetMinScreenWidthType() == 0;
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  [(UIActivityIndicatorView *)self->_spinnerView setHidden:1];
  [(PKDashboardMessageActionView *)self addSubview:self->_spinnerView];
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  objc_super v6 = PKUIChevronImage();
  v7 = (UIImageView *)[v5 initWithImage:v6];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v7;

  v9 = self->_disclosureView;
  v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v9 setTintColor:v10];

  [(UIImageView *)self->_disclosureView setHidden:1];
  [(PKDashboardMessageActionView *)self addSubview:self->_disclosureView];
  uint64_t v11 = *MEMORY[0x1E4F851B0];

  [(PKDashboardMessageActionView *)self setAccessibilityIdentifier:v11];
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  titleText = self->_titleText;
  v9 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKDashboardMessageActionView *)self _configureView];
  }
LABEL_9:
}

- (void)setTitleFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(PKDashboardMessageActionView *)self _configureView];
  }
}

- (void)setTitleTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    [(PKDashboardMessageActionView *)self _configureView];
  }
}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    if (a3 == 2)
    {
      [(UIImageView *)self->_disclosureView setHidden:1];
      [(UIActivityIndicatorView *)self->_spinnerView setHidden:0];
      spinnerView = self->_spinnerView;
      [(UIActivityIndicatorView *)spinnerView startAnimating];
    }
    else
    {
      if (a3 == 1)
      {
        disclosureView = self->_disclosureView;
        uint64_t v5 = 0;
      }
      else
      {
        if (a3) {
          return;
        }
        disclosureView = self->_disclosureView;
        uint64_t v5 = 1;
      }
      [(UIImageView *)disclosureView setHidden:v5];
      v7 = self->_spinnerView;
      [(UIActivityIndicatorView *)v7 setHidden:1];
    }
  }
}

- (void)updateWithMessage:(id)a3
{
  id v7 = a3;
  v4 = [v7 buttonTitle];
  [(PKDashboardMessageActionView *)self setTitleText:v4];

  if ([v7 isDestructiveAction]) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [(PKDashboardMessageActionView *)self setTitleTextColor:v5];

  if ([v7 showSpinner]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = [v7 showDisclosure];
  }
  [(PKDashboardMessageActionView *)self setAccessory:v6];
  [(PKDashboardMessageActionView *)self _updateFonts];
  [(PKDashboardMessageActionView *)self setNeedsLayout];
}

- (void)setSmallDevice:(BOOL)a3
{
  self->_smallDevice = a3;
  [(PKDashboardMessageActionView *)self _updateFonts];
}

- (void)_updateFonts
{
  if (self->_smallDevice) {
    v3 = (void **)MEMORY[0x1E4FB28D0];
  }
  else {
    v3 = (void **)MEMORY[0x1E4FB28C8];
  }
  PKFontForDefaultDesign(*v3, (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKDashboardMessageActionView *)self setTitleFont:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageActionView;
  [(PKDashboardMessageActionView *)&v3 layoutSubviews];
  [(PKDashboardMessageActionView *)self bounds];
  -[PKDashboardMessageActionView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardMessageActionView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6 = a3.origin.x + 13.0;
  double v7 = a3.origin.y + 11.0;
  CGFloat width = a3.size.width;
  double v8 = a3.size.width + -24.0;
  memset(&v59, 0, sizeof(v59));
  remainder.origin.x = a3.origin.x + 13.0;
  remainder.origin.y = a3.origin.y + 11.0;
  double v9 = a3.size.height + -22.0;
  remainder.size.CGFloat width = a3.size.width + -24.0;
  remainder.size.height = a3.size.height + -22.0;
  int v10 = [(PKDashboardMessageActionView *)self _shouldReverseLayoutDirection];
  if (v10) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v8, 3.40282347e38);
  double v13 = v12;
  double v15 = v14;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v8, 3.40282347e38);
  double v17 = fmax(v13, v16);
  double v19 = fmax(v15, v18);
  uint64_t v20 = MEMORY[0x1E4F1DB28];
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v56 = *MEMORY[0x1E4F1DB28];
  if (v17 <= 0.0)
  {
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v53 = v39;
    double v54 = v41;
    double v51 = *MEMORY[0x1E4F1DB28];
    double v52 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = v19;
  }
  else
  {
    if (v10) {
      CGRectEdge v22 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v22 = CGRectMaxXEdge;
    }
    double v50 = v19;
    CGSize v23 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v23;
    double v24 = v6;
    v23.CGFloat width = v7;
    double v25 = v8;
    double v26 = v9;
    CGRectDivide(*(CGRect *)((char *)&v23 - 8), &slice, &remainder, v17, v22);
    CGRectDivide(remainder, &v59, &remainder, 11.0, v22);
    PKContentAlignmentMake();
    double v27 = v50;
    PKSizeAlignedInRect();
    slice.origin.x = v28;
    slice.origin.y = v29;
    slice.size.CGFloat width = v30;
    slice.size.height = v31;
    PKRectCenteredIntegralRect();
    double v51 = v32;
    double v52 = v33;
    double v53 = v34;
    double v54 = v35;
    PKRectCenteredIntegralRect();
    double v56 = v36;
    double v21 = v37;
    double v39 = v38;
    double v41 = v40;
    double v8 = remainder.size.width;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v8, 3.40282347e38, *(void *)&v50);
  CGSize v43 = *(CGSize *)(v20 + 16);
  slice.origin = *(CGPoint *)v20;
  slice.size = v43;
  if (v42 > 0.0)
  {
    CGRectDivide(remainder, &slice, &remainder, v42, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v44;
    slice.origin.y = v45;
    slice.size.CGFloat width = v46;
    slice.size.height = v47;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v56, v21, v39, v41);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v51, v52, v53, v54);
  }
  double v48 = fmax(slice.size.height, v27) + 22.0;
  double v49 = width;
  result.height = v48;
  result.CGFloat width = v49;
  return result;
}

- (void)_configureView
{
  titleText = self->_titleText;
  titleLabel = self->_titleLabel;
  if (titleText)
  {
    if (!titleLabel)
    {
      uint64_t v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      double v6 = self->_titleLabel;
      self->_titleLabel = v5;

      [(UILabel *)self->_titleLabel setNumberOfLines:1];
      [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
      [(PKDashboardMessageActionView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setFont:self->_titleFont];
    [(UILabel *)self->_titleLabel setTextColor:self->_titleTextColor];
    [(UILabel *)self->_titleLabel setText:self->_titleText];
  }
  else
  {
    [(UILabel *)titleLabel removeFromSuperview];
    double v7 = self->_titleLabel;
    self->_titleLabel = 0;
  }

  [(PKDashboardMessageActionView *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  [(UILabel *)self->_titleLabel removeFromSuperview];
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  titleText = self->_titleText;
  self->_titleText = 0;

  titleFont = self->_titleFont;
  self->_titleFont = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  [(PKDashboardMessageActionView *)self setAccessory:0];
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (BOOL)smallDevice
{
  return self->_smallDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end