@interface PKPassPaymentSummaryHeaderView
+ (CGSize)_sizeForLabelWithText:(id)a3 font:(id)a4 maximumNumberOfLines:(int64_t)a5 width:(double)a6;
+ (double)preferredHeight;
+ (id)_titleFont;
- (NSString)primaryTitle;
- (NSString)secondaryTitle;
- (PKPassPaymentSummaryHeaderView)init;
- (PKPassPaymentSummaryHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setPrimaryTitle:(id)a3;
- (void)setSecondaryTitle:(id)a3;
@end

@implementation PKPassPaymentSummaryHeaderView

- (PKPassPaymentSummaryHeaderView)init
{
  +[PKPassPaymentSummaryHeaderView preferredHeight];

  return -[PKPassPaymentSummaryHeaderView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, v3);
}

- (PKPassPaymentSummaryHeaderView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKPassPaymentSummaryHeaderView;
  double v3 = -[PKPassPaymentSummaryHeaderView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    v7 = v3->_titleLabel;
    v8 = +[PKPassPaymentSummaryHeaderView _titleFont];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)v3->_titleLabel setTextColor:v4];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryTitleLabel = v3->_secondaryTitleLabel;
    v3->_secondaryTitleLabel = v9;

    v11 = v3->_secondaryTitleLabel;
    v12 = +[PKPassPaymentSummaryHeaderView _titleFont];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v3->_secondaryTitleLabel setTextColor:v4];
    [(PKPassPaymentSummaryHeaderView *)v3 addSubview:v3->_titleLabel];
    [(PKPassPaymentSummaryHeaderView *)v3 addSubview:v3->_secondaryTitleLabel];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassPaymentSummaryHeaderView;
  [(PKPassPaymentSummaryHeaderView *)&v2 dealloc];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)PKPassPaymentSummaryHeaderView;
  [(PKPassPaymentSummaryHeaderView *)&v33 layoutSubviews];
  [(PKPassPaymentSummaryHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  memset(&slice, 0, sizeof(slice));
  int v11 = [(PKPassPaymentSummaryHeaderView *)self _shouldReverseLayoutDirection];
  if (PKUIGetMinScreenWidthType()) {
    double v12 = 4.0;
  }
  else {
    double v12 = 20.0;
  }
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  CGRect remainder = CGRectInset(v34, v12, 12.0);
  v13 = [(UILabel *)self->_secondaryTitleLabel text];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    if (v11) {
      CGRectEdge v15 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v15 = CGRectMaxXEdge;
    }
    v16 = [(UILabel *)self->_secondaryTitleLabel font];
    [v16 lineHeight];
    double v18 = v17;

    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v30.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v30.size = v19;
    v20 = [(UILabel *)self->_secondaryTitleLabel text];
    v21 = +[PKPassPaymentSummaryHeaderView _titleFont];
    +[PKPassPaymentSummaryHeaderView _sizeForLabelWithText:v20 font:v21 maximumNumberOfLines:1 width:remainder.size.width * 0.5];

    PKFloatCeilToPixel();
    CGRectDivide(remainder, &v30, &remainder, v22, v15);
    CGRectDivide(remainder, &slice, &remainder, 5.0, v15);
    v30.size.height = v18;
    -[UILabel setFrame:](self->_secondaryTitleLabel, "setFrame:", *(_OWORD *)&v30.origin, v30.size.width, v18);
  }
  else
  {
    [(UILabel *)self->_secondaryTitleLabel removeFromSuperview];
  }
  [(PKPassPaymentSummaryHeaderView *)self bounds];
  double Width = CGRectGetWidth(v35);
  if (PKUIGetMinScreenWidthType()) {
    double v24 = 4.0;
  }
  else {
    double v24 = 20.0;
  }
  double v25 = Width + v24 * -2.0;
  v26 = [(UILabel *)self->_titleLabel font];
  [v26 lineHeight];
  CGFloat v28 = v27;

  if (PKUIGetMinScreenWidthType()) {
    double v29 = 4.0;
  }
  else {
    double v29 = 20.0;
  }
  v30.origin.x = v29;
  v30.origin.y = 12.0;
  v30.size.width = v25;
  v30.size.height = v28;
  CGRectDivide(remainder, &v30, &remainder, v28, CGRectMinYEdge);
  v30.size.height = v28;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v30.origin, v30.size.width, v28);
}

- (void)setPrimaryTitle:(id)a3
{
}

- (NSString)primaryTitle
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSString)secondaryTitle
{
  return [(UILabel *)self->_secondaryTitleLabel text];
}

- (void)setColor:(id)a3
{
  titleLabel = self->_titleLabel;
  id v5 = a3;
  [(UILabel *)titleLabel setTextColor:v5];
  [(UILabel *)self->_secondaryTitleLabel setTextColor:v5];
}

- (UIColor)color
{
  return [(UILabel *)self->_titleLabel textColor];
}

+ (double)preferredHeight
{
  objc_super v2 = [a1 _titleFont];
  [v2 lineHeight];
  double v4 = v3 + 7.0 + 12.0;

  return v4;
}

+ (id)_titleFont
{
  objc_super v2 = (void *)MEMORY[0x1E4FB08E0];
  double v3 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2790], 13.0);

  return (id)[v2 systemFontOfSize:v3];
}

+ (CGSize)_sizeForLabelWithText:(id)a3 font:(id)a4 maximumNumberOfLines:(int64_t)a5 width:(double)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (a3 && a4 && a5 >= 1)
  {
    int v11 = (objc_class *)MEMORY[0x1E4FB0860];
    id v12 = a4;
    id v13 = a3;
    id v14 = objc_alloc_init(v11);
    [v14 setMaximumNumberOfLines:a5];
    uint64_t v20 = *MEMORY[0x1E4FB06F8];
    v21[0] = v12;
    CGRectEdge v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

    objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 33, v15, v14, a6, 1.79769313e308);
    double v6 = v16;
    double v7 = v17;
  }
  double v18 = v6;
  double v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end