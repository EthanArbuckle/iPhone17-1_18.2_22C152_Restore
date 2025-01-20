@interface PKSettingsDetailValueCell
- (CGSize)_layoutWithContentViewBounds:(CGRect)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKSettingsDetailValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)detailTextLabel;
- (id)textLabel;
- (void)layoutSubviews;
@end

@implementation PKSettingsDetailValueCell

- (PKSettingsDetailValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKSettingsDetailValueCell;
  v9 = [(PSTableCell *)&v27 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1D10] layoutManagerForTableViewCellStyle:a3];
    layoutManager = v9->_layoutManager;
    v9->_layoutManager = (UITableViewCellLayoutManager *)v10;

    v12 = [(PKSettingsDetailValueCell *)v9 contentView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v9->_textLabel;
    v9->_textLabel = v13;

    v15 = v9->_textLabel;
    uint64_t v16 = *MEMORY[0x1E4FB28C8];
    v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v15 setFont:v17];

    [v12 addSubview:v9->_textLabel];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailTextLabel = v9->_detailTextLabel;
    v9->_detailTextLabel = v18;

    [(UILabel *)v9->_detailTextLabel setNumberOfLines:0];
    [(UILabel *)v9->_detailTextLabel setLineBreakMode:0];
    v20 = v9->_detailTextLabel;
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v16];
    [(UILabel *)v20 setFont:v21];

    [v12 addSubview:v9->_detailTextLabel];
    v22 = [(PKSettingsDetailValueCell *)v9 traitCollection];
    v23 = [v22 preferredContentSizeCategory];

    v9->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v23, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending;
    v24 = [v8 objectForKeyedSubscript:@"pkSettingsContext"];
    v9->_settingsContext = (int)[v24 intValue];

    if (v9->_settingsContext == 1)
    {
      v25 = PKBridgeAppearanceGetAppearanceSpecifier();
      PKAppearanceApplyToContainer(v25, v9);
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKSettingsDetailValueCell;
  [(PSTableCell *)&v4 layoutSubviews];
  v3 = [(PKSettingsDetailValueCell *)self contentView];
  [v3 bounds];
  -[PKSettingsDetailValueCell _layoutWithContentViewBounds:applyLayout:](self, "_layoutWithContentViewBounds:applyLayout:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self->_layoutManager, "contentRectForCell:forState:rowWidth:", self, 0, a3.width, a3.height);
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  -[PKSettingsDetailValueCell _layoutWithContentViewBounds:applyLayout:](self, "_layoutWithContentViewBounds:applyLayout:", 0, v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)_layoutWithContentViewBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = [(PKSettingsDetailValueCell *)self _shouldReverseLayoutDirection];
  if (v10) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  if (v10) {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  double v13 = PKTableViewCellTextInset();
  memset(&v36, 0, sizeof(v36));
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.double width = width;
  remainder.size.CGFloat height = height;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.double width = width;
  v39.size.CGFloat height = height;
  CGRectDivide(v39, &v36, &remainder, v13, v11);
  if (self->_settingsContext == 1) {
    CGRectDivide(remainder, &v36, &remainder, 8.0, v12);
  }
  double v14 = remainder.size.width;
  v15 = [(UILabel *)self->_textLabel attributedText];
  objc_msgSend(v15, "pkui_sizeThatFits:withNumberOfLines:", 1, v14, 1.79769313e308);
  CGFloat v17 = v16;
  double v19 = v18;

  v20 = [(UILabel *)self->_detailTextLabel attributedText];
  objc_msgSend(v20, "pkui_sizeThatFits:withNumberOfLines:", 1, v14, 1.79769313e308);
  CGFloat v22 = v21;

  if (v13 + v13 + v17 + 16.0 + v22 <= width)
  {
    double v27 = fmax(v19 + 11.0 + 11.0, 44.0);
    if (v4)
    {
      CGRectDivide(remainder, &v36, &remainder, v17, v11);
      textLabel = self->_textLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](textLabel, "setFrame:");
      CGRectDivide(remainder, &v36, &remainder, v22, v12);
      detailTextLabel = self->_detailTextLabel;
LABEL_17:
      PKSizeAlignedInRect();
      -[UILabel setFrame:](detailTextLabel, "setFrame:");
    }
  }
  else
  {
    v23 = self->_textLabel;
    if (self->_usesAccessibilityLayout)
    {
      v24 = [(UILabel *)v23 attributedText];
      objc_msgSend(v24, "pkui_sizeThatFits:", v14, 1.79769313e308);
      double v19 = v25;

      [(UILabel *)self->_textLabel setNumberOfLines:0];
      uint64_t v26 = 0;
    }
    else
    {
      [(UILabel *)v23 setNumberOfLines:1];
      uint64_t v26 = 4;
    }
    [(UILabel *)self->_textLabel setLineBreakMode:v26];
    v30 = [(UILabel *)self->_detailTextLabel attributedText];
    objc_msgSend(v30, "pkui_sizeThatFits:", v14, 1.79769313e308);
    double v32 = v31;

    double v27 = fmax(v19 + 11.0 + 3.0 + v32 + 11.0, 44.0);
    if (v4)
    {
      CGRectDivide(remainder, &v36, &remainder, 11.0, CGRectMinYEdge);
      CGRectDivide(remainder, &v36, &remainder, 11.0, CGRectMaxYEdge);
      CGRectDivide(remainder, &v36, &remainder, v19, CGRectMinYEdge);
      v33 = self->_textLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v33, "setFrame:");
      CGRectDivide(remainder, &v36, &remainder, v32, CGRectMaxYEdge);
      detailTextLabel = self->_detailTextLabel;
      goto LABEL_17;
    }
  }
  double v34 = width;
  double v35 = v27;
  result.CGFloat height = v35;
  result.double width = v34;
  return result;
}

- (id)textLabel
{
  return self->_textLabel;
}

- (id)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end