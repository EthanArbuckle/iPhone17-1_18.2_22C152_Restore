@interface TLKButtonView
+ (UIEdgeInsets)defaultLayoutMargins;
- (NSString)title;
- (TLKLabel)titleLabel;
- (TLKStackView)stackView;
- (id)setupContentView;
- (void)observedPropertiesChanged;
- (void)setStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TLKButtonView

+ (UIEdgeInsets)defaultLayoutMargins
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TLKButtonView;
  objc_msgSendSuper2(&v6, sel_defaultLayoutMargins);
  double v4 = 15.79;
  double v5 = 15.9;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (id)setupContentView
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  double v4 = +[TLKFontUtilities cachedFontForTextStyle:*MEMORY[0x1E4FB2908] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  [v3 setFont:v4];

  [v3 setTextAlignment:1];
  [(TLKButtonView *)self setTitleLabel:v3];
  double v5 = [TLKStackView alloc];
  v9[0] = v3;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [(NUIContainerStackView *)v5 initWithArrangedSubviews:v6];

  [(TLKStackView *)v7 setAxis:1];
  [(TLKStackView *)v7 setAlignment:3];
  [(TLKButtonView *)self setStackView:v7];

  return v7;
}

- (void)setTitle:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      objc_super v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)observedPropertiesChanged
{
  id v4 = [(TLKButtonView *)self title];
  double v3 = [(TLKButtonView *)self titleLabel];
  [v3 setText:v4];
}

- (NSString)title
{
  return self->_title;
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end