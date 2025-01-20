@interface PKCollectionSectionHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)primaryText;
- (NSString)secondaryText;
- (PKCollectionSectionHeaderView)init;
- (PKCollectionSectionHeaderView)initWithFrame:(CGRect)a3;
- (PKCollectionSectionHeaderView)initWithSize:(CGSize)a3;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (double)bottomPadding;
- (double)topPadding;
- (void)_resetFont;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomPadding:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation PKCollectionSectionHeaderView

- (PKCollectionSectionHeaderView)init
{
  return -[PKCollectionSectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKCollectionSectionHeaderView)initWithSize:(CGSize)a3
{
  return -[PKCollectionSectionHeaderView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
}

- (PKCollectionSectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKCollectionSectionHeaderView;
  v3 = -[PKCollectionSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKCollectionSectionHeaderView *)v3 _resetFont];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKCollectionSectionHeaderView;
  [(PKCollectionSectionHeaderView *)&v4 layoutSubviews];
  v3 = [(PKCollectionSectionHeaderView *)self contentView];
  [v3 bounds];
  -[PKCollectionSectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCollectionSectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double topPadding = self->_topPadding;
  double bottomPadding = self->_bottomPadding;
  CGFloat v8 = a3.origin.x + 4.0;
  CGFloat v9 = a3.origin.y + topPadding;
  CGFloat width = a3.size.width;
  CGFloat v10 = a3.size.width + -8.0;
  CGFloat v11 = a3.size.height - (topPadding + bottomPadding);
  v12 = [(PKCollectionSectionHeaderView *)self contentView];
  [v12 _shouldReverseLayoutDirection];

  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.CGFloat width = v10;
  remainder.size.height = v11;
  double v13 = topPadding + 0.0 + bottomPadding;
  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v10, v11);
  CGFloat v15 = v14;
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v10, v11);
  double v17 = v16;
  v41.origin.x = v8;
  v41.origin.y = v9;
  v41.size.CGFloat width = v10;
  v41.size.height = v11;
  CGRectDivide(v41, &slice, &remainder, v15, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v20 = v19;
  double v21 = v13 + v19;
  double v35 = v23;
  double v36 = v22;
  if (v15 <= 0.0 || v17 <= 0.0)
  {
    double v24 = v18;
  }
  else
  {
    double v24 = v18;
    CGRectDivide(remainder, &slice, &remainder, 5.0, CGRectMinYEdge);
    double v21 = v21 + 5.0;
  }
  CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v29 = v28;
  if (!a4)
  {
    double v30 = v25;
    double v31 = v26;
    double v32 = v27;
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v24, v36, v35, v20);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v30, v31, v32, v29);
  }
  double v33 = v21 + v29;
  double v34 = width;
  result.height = v33;
  result.CGFloat width = v34;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v5 = a3;
  p_primaryText = &self->_primaryText;
  primaryText = self->_primaryText;
  double v19 = (NSString *)v5;
  CGFloat v8 = primaryText;
  if (v8 == v19)
  {

LABEL_16:
    CGFloat v10 = v19;
    goto LABEL_17;
  }
  if (!v19 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v19 isEqualToString:v8];

  CGFloat v10 = v19;
  if (!v9)
  {
LABEL_8:
    int v11 = [(PKCollectionSectionHeaderView *)self _shouldReverseLayoutDirection];
    objc_storeStrong((id *)&self->_primaryText, a3);
    uint64_t v12 = [(NSString *)*p_primaryText length];
    primaryLabel = self->_primaryLabel;
    if (v12)
    {
      if (!primaryLabel)
      {
        id v14 = objc_alloc(MEMORY[0x1E4FB1930]);
        CGFloat v15 = (UILabel *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v16 = self->_primaryLabel;
        self->_primaryLabel = v15;

        [(UILabel *)self->_primaryLabel setFont:self->_primaryFont];
        [(UILabel *)self->_primaryLabel setNumberOfLines:0];
        if (v11) {
          uint64_t v17 = 2;
        }
        else {
          uint64_t v17 = 0;
        }
        [(UILabel *)self->_primaryLabel setTextAlignment:v17];
        [(PKCollectionSectionHeaderView *)self addSubview:self->_primaryLabel];
      }
    }
    else
    {
      [(UILabel *)primaryLabel removeFromSuperview];
      double v18 = self->_primaryLabel;
      self->_primaryLabel = 0;
    }
    [(UILabel *)self->_primaryLabel setText:*p_primaryText];
    [(PKCollectionSectionHeaderView *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setSecondaryText:(id)a3
{
  id v5 = a3;
  p_secondaryText = &self->_secondaryText;
  secondaryText = self->_secondaryText;
  double v21 = (NSString *)v5;
  CGFloat v8 = secondaryText;
  if (v8 == v21)
  {

LABEL_16:
    CGFloat v10 = v21;
    goto LABEL_17;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  CGFloat v10 = v21;
  if (!v9)
  {
LABEL_8:
    int v11 = [(PKCollectionSectionHeaderView *)self _shouldReverseLayoutDirection];
    objc_storeStrong((id *)&self->_secondaryText, a3);
    uint64_t v12 = [(NSString *)*p_secondaryText length];
    secondaryLabel = self->_secondaryLabel;
    if (v12)
    {
      if (!secondaryLabel)
      {
        id v14 = objc_alloc(MEMORY[0x1E4FB1930]);
        CGFloat v15 = (UILabel *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v16 = self->_secondaryLabel;
        self->_secondaryLabel = v15;

        [(UILabel *)self->_secondaryLabel setFont:self->_secondaryFont];
        [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
        if (v11) {
          uint64_t v17 = 2;
        }
        else {
          uint64_t v17 = 0;
        }
        [(UILabel *)self->_secondaryLabel setTextAlignment:v17];
        double v18 = self->_secondaryLabel;
        double v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(UILabel *)v18 setTextColor:v19];

        [(PKCollectionSectionHeaderView *)self addSubview:self->_secondaryLabel];
      }
    }
    else
    {
      [(UILabel *)secondaryLabel removeFromSuperview];
      double v20 = self->_secondaryLabel;
      self->_secondaryLabel = 0;
    }
    [(UILabel *)self->_secondaryLabel setText:*p_secondaryText];
    [(PKCollectionSectionHeaderView *)self setNeedsLayout];
    goto LABEL_16;
  }
LABEL_17:
}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_double topPadding = a3;
    [(PKCollectionSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setBottomPadding:(double)a3
{
  if (self->_bottomPadding != a3)
  {
    self->_double bottomPadding = a3;
    [(PKCollectionSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)_resetFont
{
  double v3 = (void *)*MEMORY[0x1E4FB2790];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB2790], 2, 0);
  double v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  primaryFont = self->_primaryFont;
  self->_primaryFont = v4;

  PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], v3, 0, 0);
  objc_super v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  secondaryFont = self->_secondaryFont;
  self->_secondaryFont = v6;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PKCollectionSectionHeaderView;
  [(PKCollectionSectionHeaderView *)&v7 prepareForReuse];
  [(UILabel *)self->_primaryLabel removeFromSuperview];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = 0;

  primaryText = self->_primaryText;
  self->_primaryText = 0;

  [(UILabel *)self->_secondaryLabel removeFromSuperview];
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;

  self->_double topPadding = 0.0;
  self->_double bottomPadding = 0.0;
  [(PKCollectionSectionHeaderView *)self _resetFont];
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end