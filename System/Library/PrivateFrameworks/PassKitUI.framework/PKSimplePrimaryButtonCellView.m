@interface PKSimplePrimaryButtonCellView
- (BOOL)enableDisclosure;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKPaymentPass)pass;
- (PKSimplePrimaryButtonCellView)init;
- (PKSimplePrimaryButtonCellView)initWithFrame:(CGRect)a3;
- (id)_titleFont;
- (int64_t)viewType;
- (void)_setupViews;
- (void)_updateContent:(BOOL)a3;
- (void)beginUpdates;
- (void)endUpdates:(BOOL)a3;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setPass:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleLineBreakMode:(int64_t)a3;
@end

@implementation PKSimplePrimaryButtonCellView

- (PKSimplePrimaryButtonCellView)init
{
  return -[PKSimplePrimaryButtonCellView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKSimplePrimaryButtonCellView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSimplePrimaryButtonCellView;
  v3 = -[PKSimplePrimaryButtonCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_topPadding = 0.0;
    v3->_isTemplateLayout = 0;
    v3->_deferUpdateCounter = 0;
    v3->_animated = 0;
    [(PKSimplePrimaryButtonCellView *)v3 _setupViews];
  }
  return v4;
}

- (int64_t)viewType
{
  return 2;
}

- (BOOL)enableDisclosure
{
  return 0;
}

- (void)prepareForReuse
{
}

- (void)_setupViews
{
  id v6 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(UIView *)self pkui_setMaskType:3];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleView = self->_titleView;
  self->_titleView = v4;

  [(PKSimplePrimaryButtonCellView *)self addSubview:self->_titleView];
  [(PKSimplePrimaryButtonCellView *)self setBackgroundColor:v6];
}

- (id)_titleFont
{
  id v3 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2908], (NSString *)*MEMORY[0x1E4FB2790]);
  [v3 lineHeight];
  PKFloatRoundToPixel();
  self->_topPadding = v4;

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKSimplePrimaryButtonCellView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSimplePrimaryButtonCellView;
  [(PKSimplePrimaryButtonCellView *)&v3 layoutSubviews];
  [(PKSimplePrimaryButtonCellView *)self bounds];
  [(PKSimplePrimaryButtonCellView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(PKSimplePrimaryButtonCellView *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v9);

  double v11 = x + 10.0;
  double v12 = y + 0.0;
  double v29 = width;
  double v13 = width + -20.0;
  remainder.origin.double x = v11;
  remainder.origin.double y = v12;
  remainder.size.double width = width + -20.0;
  remainder.size.CGFloat height = height;
  titleView = self->_titleView;
  v15 = [(PKSimplePrimaryButtonCellView *)self _titleFont];
  [(UILabel *)titleView setFont:v15];

  int64_t v16 = 4;
  if (IsAccessibilityCategory) {
    int64_t v16 = 0;
  }
  self->_titleLineBreakMode = v16;
  [(UILabel *)self->_titleView setNumberOfLines:!IsAccessibilityCategory];
  memset(&slice, 0, sizeof(slice));
  [(UILabel *)self->_titleView setTextAlignment:1];
  -[UILabel sizeThatFits:](self->_titleView, "sizeThatFits:", width + -20.0, 1.79769313e308);
  double v18 = v17;
  CGFloat v20 = v19;
  v33.origin.double x = v11;
  v33.origin.double y = v12;
  v33.size.double width = v13;
  v33.size.CGFloat height = height;
  CGRectDivide(v33, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
  PKFloatRoundToPixel();
  double v26 = v21.n128_f64[0];
  if (!self->_isTemplateLayout)
  {
    v23.n128_f64[0] = fmin(v18, v13);
    v21.n128_f64[0] = (v13 - v23.n128_f64[0]) * 0.5;
    v22.n128_f64[0] = (v26 - v20) * 0.5;
    v24.n128_f64[0] = v20;
    PKRectRoundToPixel(v21, v22, v23, v24, v25);
    -[UILabel setFrame:](self->_titleView, "setFrame:");
  }
  double v27 = v29;
  double v28 = v26;
  result.CGFloat height = v28;
  result.double width = v27;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  double v5 = self->_title;
  id v6 = (NSString *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    title = v11;
LABEL_9:

    v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v11;
  if (!v7)
  {
LABEL_8:
    v10 = v8;
    title = self->_title;
    self->_title = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setPass:(id)a3
{
  p_pass = &self->_pass;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_pass, a3);
  }
}

- (void)setTitleColor:(id)a3
{
  p_titleColor = &self->_titleColor;
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_titleColor, a3);
  }
}

- (void)setTitleLineBreakMode:(int64_t)a3
{
  if (self->_titleLineBreakMode != a3) {
    self->_titleLineBreakMode = a3;
  }
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKSimplePrimaryButtonCellView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)beginUpdates
{
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3) {
    [(PKSimplePrimaryButtonCellView *)self _updateContent:a3];
  }
}

- (void)_updateContent:(BOOL)a3
{
  if (!self->_deferUpdateCounter)
  {
    BOOL v3 = a3;
    titleView = self->_titleView;
    title = self->_title;
    titleColor = self->_titleColor;
    v8 = titleColor;
    if (!titleColor)
    {
      v8 = [MEMORY[0x1E4FB1618] labelColor];
    }
    int64_t titleLineBreakMode = self->_titleLineBreakMode;
    v10 = titleView;
    if (v10) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if (!titleLineBreakMode) {
        int64_t titleLineBreakMode = 4;
      }
      id v12 = v8;
      [(UILabel *)v10 setText:title];
      [(UILabel *)v10 setTextColor:v12];

      [(UILabel *)v10 setLineBreakMode:titleLineBreakMode];
      if (v3)
      {
        double v13 = [(UILabel *)v10 layer];
        v14 = v13;
        if (title) {
          double v15 = 1.0;
        }
        else {
          double v15 = 0.0;
        }
        [v13 opacity];
        double v17 = v16;
        if (v15 != v16)
        {
          double v18 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
          objc_msgSend(v18, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v17, v15);
          id v19 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v18);

          double v20 = 0.0;
          if (title) {
            *(float *)&double v20 = 1.0;
          }
          [v14 setOpacity:v20];
        }
      }
    }

    if (!titleColor) {
    [(PKSimplePrimaryButtonCellView *)self setNeedsLayout];
    }
    if (v3)
    {
      [(PKSimplePrimaryButtonCellView *)self layoutIfNeededAnimated:1];
    }
  }
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end