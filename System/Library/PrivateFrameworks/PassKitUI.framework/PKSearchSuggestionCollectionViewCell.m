@interface PKSearchSuggestionCollectionViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)suggestion;
- (PKSearchSuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)icon;
- (void)layoutSubviews;
- (void)resetFonts;
- (void)setIcon:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKSearchSuggestionCollectionViewCell

- (PKSearchSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKSearchSuggestionCollectionViewCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    labelSuggestion = v4->_labelSuggestion;
    v4->_labelSuggestion = (UILabel *)v11;

    [(UILabel *)v4->_labelSuggestion setLineBreakMode:4];
    [v5 addSubview:v4->_labelSuggestion];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v7, v8, v9, v10);
    imageViewIcon = v4->_imageViewIcon;
    v4->_imageViewIcon = (UIImageView *)v13;

    [(UIImageView *)v4->_imageViewIcon setContentMode:1];
    v15 = v4->_imageViewIcon;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v15 setTintColor:v16];

    [v5 addSubview:v4->_imageViewIcon];
    [(PKSearchSuggestionCollectionViewCell *)v4 resetFonts];
  }
  return v4;
}

- (void)resetFonts
{
  v3 = [(PKSearchSuggestionCollectionViewCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  [(UILabel *)self->_labelSuggestion setNumberOfLines:!IsAccessibilityCategory];
  labelSuggestion = self->_labelSuggestion;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)labelSuggestion setFont:v7];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKSearchSuggestionCollectionViewCell *)self bounds];
  [(PKSearchSuggestionCollectionViewCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKSearchSuggestionCollectionViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v8 = [(PKSearchSuggestionCollectionViewCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  if (v8) {
    CGRectEdge v9 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v9 = CGRectMinXEdge;
  }
  if (v8) {
    CGRectEdge v10 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v10 = CGRectMaxXEdge;
  }
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  double v12 = v11;
  uint64_t v13 = [(UILabel *)self->_labelSuggestion font];
  [v13 lineHeight];
  double v15 = v14;

  -[UILabel sizeThatFits:](self->_labelSuggestion, "sizeThatFits:", width - v15 + -8.0 + v12 * -2.0, height + -20.0);
  double v17 = v16 + 20.0;
  if (v16 + 20.0 >= 44.0) {
    double v18 = v16 + 20.0;
  }
  else {
    double v18 = 44.0;
  }
  v22.size.double height = v18;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.double width = width;
  v25.size.double height = v18;
  CGRectDivide(v25, &slice, &v22, 10.0, CGRectMinYEdge);
  CGRectDivide(v22, &slice, &v22, 10.0, CGRectMaxYEdge);
  CGRectDivide(v22, &slice, &v22, v12, v9);
  CGRectDivide(v22, &slice, &v22, v12, v10);
  CGRectDivide(v22, &slice, &v22, v15, v9);
  if (!self->_isTemplateLayout)
  {
    imageViewIcon = self->_imageViewIcon;
    if (v17 >= 44.0) {
      PKContentAlignmentMake();
    }
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](imageViewIcon, "setFrame:");
  }
  CGRectDivide(v22, &slice, &v22, 8.0, v9);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_labelSuggestion, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  }
  double v20 = width;
  double v21 = v18;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSearchSuggestionCollectionViewCell;
  [(PKSearchSuggestionCollectionViewCell *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKSearchSuggestionCollectionViewCell *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [v4 preferredContentSizeCategory];
      int v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKSearchSuggestionCollectionViewCell *)self resetFonts];
      }
    }
  }
}

- (void)setIcon:(id)a3
{
}

- (void)setSuggestion:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_imageViewIcon, 0);

  objc_storeStrong((id *)&self->_labelSuggestion, 0);
}

@end