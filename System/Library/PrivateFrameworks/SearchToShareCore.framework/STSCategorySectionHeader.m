@interface STSCategorySectionHeader
- (BOOL)clearButtonHidden;
- (NSString)title;
- (STSCategorySectionHeader)init;
- (void)layoutSubviews;
- (void)setClearButtonHidden:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation STSCategorySectionHeader

- (STSCategorySectionHeader)init
{
  v18.receiver = self;
  v18.super_class = (Class)STSCategorySectionHeader;
  v2 = [(STSCategorySectionHeader *)&v18 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
    v5 = [v4 fontDescriptor];
    v6 = [v5 fontDescriptorWithSymbolicTraits:2];

    v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
    [(UILabel *)v3 setFont:v7];

    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;
    v9 = v3;

    v10 = [MEMORY[0x263F824E8] buttonWithType:1];
    v11 = STSLocalizedString(@"CLEAR");
    [(UIButton *)v10 setTitle:v11 forState:0];
    v12 = [(UIButton *)v10 titleLabel];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
    [v12 setFont:v13];

    v14 = [MEMORY[0x263F825C8] systemPinkColor];
    [(UIButton *)v10 setTintColor:v14];

    [(UIButton *)v10 setHidden:0];
    clearButton = v2->_clearButton;
    v2->_clearButton = v10;
    v16 = v10;

    [(STSCategorySectionHeader *)v2 addSubview:v2->_titleLabel];
    [(STSCategorySectionHeader *)v2 addSubview:v2->_clearButton];
  }
  return v2;
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  id v6 = a3;
  [(UILabel *)self->_titleLabel setText:*p_title];
}

- (void)setClearButtonHidden:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)STSCategorySectionHeader;
  [(STSCategorySectionHeader *)&v31 layoutSubviews];
  [(UILabel *)self->_titleLabel sizeToFit];
  v3 = [(STSCategorySectionHeader *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  double v5 = 20.0;
  if (v4 == 2)
  {
    id v6 = [(STSCategorySectionHeader *)self readableContentGuide];
    [v6 layoutFrame];
    double v5 = v7;
  }
  titleLabel = self->_titleLabel;
  [(STSCategorySectionHeader *)self bounds];
  double v10 = v9;
  [(UILabel *)self->_titleLabel bounds];
  double v12 = v10 - v11 + -15.0;
  [(UILabel *)self->_titleLabel bounds];
  double v14 = v13;
  [(UILabel *)self->_titleLabel bounds];
  -[UILabel setFrame:](titleLabel, "setFrame:", v5, v12, v14);
  [(UIButton *)self->_clearButton sizeToFit];
  v15 = [(STSCategorySectionHeader *)self readableContentGuide];
  [v15 layoutFrame];
  double v17 = v16;
  double v19 = v18;

  if (v4 == 2)
  {
    double v20 = v17 + v19;
  }
  else
  {
    [(STSCategorySectionHeader *)self bounds];
    double v20 = v21;
  }
  [(UIButton *)self->_clearButton bounds];
  double v23 = v20 - v22 + -20.0;
  clearButton = self->_clearButton;
  [(STSCategorySectionHeader *)self bounds];
  double v26 = v25;
  [(UIButton *)self->_clearButton bounds];
  double v28 = v26 - v27 + -15.0 + 5.0;
  [(UIButton *)self->_clearButton bounds];
  double v30 = v29;
  [(UIButton *)self->_clearButton bounds];
  -[UIButton setFrame:](clearButton, "setFrame:", v23, v28, v30);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)clearButtonHidden
{
  return self->_clearButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end