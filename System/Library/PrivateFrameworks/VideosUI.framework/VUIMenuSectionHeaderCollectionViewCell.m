@interface VUIMenuSectionHeaderCollectionViewCell
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (VUILabel)titleLabel;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUIMenuSectionHeaderCollectionViewCell

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  id v11 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(VUILabel *)self->_titleLabel removeFromSuperview];
    if (*p_title)
    {
      v6 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v6 setTextStyle:20];
      [(VUITextLayout *)v6 setFontWeight:10];
      v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
      [(VUITextLayout *)v6 setColor:v7];

      [(VUITextLayout *)v6 setAlignment:1];
      [(VUITextLayout *)v6 setNumberOfLines:1];
      v8 = +[VUILabel labelWithString:*p_title textLayout:v6 existingLabel:0];
      titleLabel = self->_titleLabel;
      self->_titleLabel = v8;

      v10 = [(VUIMenuSectionHeaderCollectionViewCell *)self contentView];
      [v10 addSubview:self->_titleLabel];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIMenuSectionHeaderCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMenuSectionHeaderCollectionViewCell;
  [(VUIMenuSectionHeaderCollectionViewCell *)&v4 layoutSubviews];
  [(VUIMenuSectionHeaderCollectionViewCell *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(VUIMenuSectionHeaderCollectionViewCell *)self bounds];
  -[VUIMenuSectionHeaderCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding", a3.width, a3.height);
  double v8 = v7;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - (v7 + v9), 1.79769313e308);
  double v11 = v10;
  double v13 = v12;
  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:50.0];
  double v15 = v14;
  [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:16.0];
  double v17 = v16;
  if (!v4)
  {
    double v18 = v13;
    if ([(VUIMenuSectionHeaderCollectionViewCell *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(VUIMenuSectionHeaderCollectionViewCell *)self bounds];
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v8 = v20;
      double v11 = v21;
      double v18 = v22;
    }
    else
    {
      double v19 = v15;
    }
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v8, v19, v11, v18);
  }
  double v23 = v13 + v15 + 0.0 + v17;
  double v24 = width;
  result.height = v23;
  result.double width = v24;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end