@interface PKPerformActionSelectItemExpiresHeader
- (NSString)leadingString;
- (NSString)trailingString;
- (PKPerformActionSelectItemExpiresHeader)init;
- (void)layoutSubviews;
- (void)setLeadingString:(id)a3;
- (void)setTrailingString:(id)a3;
@end

@implementation PKPerformActionSelectItemExpiresHeader

- (PKPerformActionSelectItemExpiresHeader)init
{
  v17.receiver = self;
  v17.super_class = (Class)PKPerformActionSelectItemExpiresHeader;
  v2 = [(PKPerformActionSelectItemExpiresHeader *)&v17 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    leadingLabel = v2->_leadingLabel;
    v2->_leadingLabel = v3;

    v5 = v2->_leadingLabel;
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v6];

    v7 = v2->_leadingLabel;
    uint64_t v8 = *MEMORY[0x1E4FB28F0];
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v7 setFont:v9];

    [(PKPerformActionSelectItemExpiresHeader *)v2 addSubview:v2->_leadingLabel];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    trailingLabel = v2->_trailingLabel;
    v2->_trailingLabel = v10;

    v12 = v2->_trailingLabel;
    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v12 setTextColor:v13];

    v14 = v2->_trailingLabel;
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8];
    [(UILabel *)v14 setFont:v15];

    [(PKPerformActionSelectItemExpiresHeader *)v2 addSubview:v2->_trailingLabel];
  }
  return v2;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPerformActionSelectItemExpiresHeader;
  [(PKPerformActionSelectItemExpiresHeader *)&v9 layoutSubviews];
  double v3 = PKTableViewCellTextInset();
  [(UILabel *)self->_leadingLabel sizeToFit];
  [(UILabel *)self->_leadingLabel frame];
  -[UILabel setFrame:](self->_leadingLabel, "setFrame:", v3, 22.0);
  [(UILabel *)self->_trailingLabel sizeToFit];
  [(UILabel *)self->_trailingLabel frame];
  double v5 = v4;
  [(PKPerformActionSelectItemExpiresHeader *)self bounds];
  double v7 = v6 - v3;
  [(UILabel *)self->_trailingLabel frame];
  -[UILabel setFrame:](self->_trailingLabel, "setFrame:", v7 - v8, 22.0, v5, 22.0);
}

- (void)setLeadingString:(id)a3
{
  double v4 = objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  double v5 = [(UILabel *)self->_leadingLabel text];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    double v8 = v7;
    if (v6 && v7)
    {
      char v9 = [v6 isEqualToString:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__PKPerformActionSelectItemExpiresHeader_setLeadingString___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    [v10 animateWithDuration:v11 animations:0.0];
  }
LABEL_9:
}

uint64_t __59__PKPerformActionSelectItemExpiresHeader_setLeadingString___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setText:*(void *)(a1 + 40)];
}

- (void)setTrailingString:(id)a3
{
  double v4 = objc_msgSend(a3, "pk_uppercaseStringForPreferredLocale");
  double v5 = [(UILabel *)self->_trailingLabel text];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    double v8 = v7;
    if (v6 && v7)
    {
      char v9 = [v6 isEqualToString:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKPerformActionSelectItemExpiresHeader_setTrailingString___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    [v10 animateWithDuration:v11 animations:0.0];
  }
LABEL_9:
}

uint64_t __60__PKPerformActionSelectItemExpiresHeader_setTrailingString___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setText:*(void *)(a1 + 40)];
}

- (NSString)leadingString
{
  return self->_leadingString;
}

- (NSString)trailingString
{
  return self->_trailingString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingString, 0);
  objc_storeStrong((id *)&self->_leadingString, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);

  objc_storeStrong((id *)&self->_leadingLabel, 0);
}

@end