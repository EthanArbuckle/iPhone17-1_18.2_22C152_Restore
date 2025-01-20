@interface PKInsitutionTableCell
+ (double)estimatedHeightForCell;
+ (id)bankConnectImageProvider;
+ (id)subTitleFont;
+ (id)titleFont;
- (PKInsitutionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_configureCellWithSpecifier:(id)a3;
- (void)_configureMainLabelWithText:(id)a3;
- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4;
- (void)layoutSubviews;
- (void)setConnectedInstitution:(id)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation PKInsitutionTableCell

- (PKInsitutionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKInsitutionTableCell;
  v9 = [(PKInsitutionTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(PKInsitutionTableCell *)v9 setSpecifier:v8];
    [(PKInsitutionTableCell *)v10 setAutoresizingMask:18];
  }

  return v10;
}

+ (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)subTitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

- (void)setConnectedInstitution:(id)a3
{
  v5 = (FKBankConnectInstitutionsProviderResponse *)a3;
  if (self->_connectedInstitution != v5)
  {
    objc_storeStrong((id *)&self->_connectedInstitution, a3);
    v6 = [(PKInsitutionTableCell *)self contentView];
    snapshotSpinner = self->_snapshotSpinner;
    if (!snapshotSpinner)
    {
      id v8 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      v9 = self->_snapshotSpinner;
      self->_snapshotSpinner = v8;

      [(UIActivityIndicatorView *)self->_snapshotSpinner startAnimating];
      snapshotSpinner = self->_snapshotSpinner;
    }
    [v6 addSubview:snapshotSpinner];
    [(UIImageView *)self->_iconImageView setImage:0];
    double v10 = PKUIScreenScale();
    v11 = +[PKInsitutionTableCell bankConnectImageProvider];
    objc_super v12 = [(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution institution];
    v13 = [v12 institutionIdentifier];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke;
    v17[3] = &unk_1E59CBB10;
    id v18 = v13;
    v19 = self;
    id v20 = v6;
    id v21 = v11;
    id v14 = v11;
    id v15 = v6;
    id v16 = v13;
    objc_msgSend(v14, "logoForInstitutionID:size:scale:completion:", v16, v17, 29.0, 29.0, v10);
  }
}

void __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke_2;
  v8[3] = &unk_1E59CB8B0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1192) institution];
  id v4 = [v3 institutionIdentifier];
  LODWORD(v2) = [v2 isEqualToString:v4];

  if (v2)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1216);
    if (v5)
    {
      [v5 setImage:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*(void *)(a1 + 48)];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 1216);
      *(void *)(v7 + 1216) = v6;

      [*(id *)(*(void *)(a1 + 40) + 1216) setAccessibilityIgnoresInvertColors:1];
      [*(id *)(a1 + 56) addSubview:*(void *)(*(void *)(a1 + 40) + 1216)];
    }
    [*(id *)(*(void *)(a1 + 40) + 1216) setContentMode:1];
    [*(id *)(*(void *)(a1 + 40) + 1208) removeFromSuperview];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(v9 + 1208);
    *(void *)(v9 + 1208) = 0;

    id v11 = *(void **)(a1 + 40);
    [v11 setNeedsLayout];
  }
}

+ (id)bankConnectImageProvider
{
  if (qword_1E94C41D8 != -1) {
    dispatch_once(&qword_1E94C41D8, &__block_literal_global_6);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

void __49__PKInsitutionTableCell_bankConnectImageProvider__block_invoke()
{
  id v0 = objc_alloc_init((Class)getFKBankConnectImageProviderClass[0]());
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;
}

- (void)_configureMainLabelWithText:(id)a3
{
  id v4 = a3;
  titleLabel = self->_titleLabel;
  id v11 = v4;
  if (!titleLabel)
  {
    uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    uint64_t v7 = self->_titleLabel;
    self->_titleLabel = v6;

    id v8 = self->_titleLabel;
    uint64_t v9 = [(id)objc_opt_class() titleFont];
    [(UILabel *)v8 setFont:v9];

    id v4 = v11;
    titleLabel = self->_titleLabel;
  }
  [(UILabel *)titleLabel setText:v4];
  [(UILabel *)self->_titleLabel sizeToFit];
  uint64_t v10 = [(PKInsitutionTableCell *)self contentView];
  [v10 addSubview:self->_titleLabel];
}

- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  subTitleLabel = self->_subTitleLabel;
  if (subTitleLabel)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v10 = self->_subTitleLabel;
  self->_subTitleLabel = v9;

  id v11 = self->_subTitleLabel;
  id v12 = [(id)objc_opt_class() subTitleFont];
  [(UILabel *)v11 setFont:v12];

  subTitleLabel = self->_subTitleLabel;
  if (v6)
  {
LABEL_3:
    [(UILabel *)subTitleLabel setTextColor:v6];
    subTitleLabel = self->_subTitleLabel;
  }
LABEL_4:
  [(UILabel *)subTitleLabel setText:v13];
  [(UILabel *)self->_subTitleLabel sizeToFit];
  id v8 = [(PKInsitutionTableCell *)self contentView];
  [v8 addSubview:self->_subTitleLabel];
}

- (void)_configureCellWithSpecifier:(id)a3
{
  id v4 = [(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution institution];
  uint64_t v5 = [v4 name];
  [(PKInsitutionTableCell *)self _configureMainLabelWithText:v5];

  [(PKInsitutionTableCell *)self setAccessoryType:1];
  if ([(FKBankConnectInstitutionsProviderResponse *)self->_connectedInstitution consentStatus] == 1)
  {
    PKLocalizedBankConnectString(&cfstr_BankConnectDis.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(PKInsitutionTableCell *)self _configureSubTextLabelWithText:v7 textColor:v6];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F78]));
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKInsitutionTableCell;
    [(PSTableCell *)&v8 setSpecifier:v4];
    id v7 = [v4 objectForKeyedSubscript:@"pkConnectedInsitution"];
    [(PKInsitutionTableCell *)self setConnectedInstitution:v7];
    [(PKInsitutionTableCell *)self _configureCellWithSpecifier:v4];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PKInsitutionTableCell;
  [(PSTableCell *)&v26 layoutSubviews];
  if ([(PKInsitutionTableCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v3 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v3 = CGRectMinXEdge;
  }
  id v4 = [(PKInsitutionTableCell *)self contentView];
  [v4 bounds];
  memset(&slice, 0, sizeof(slice));
  memset(&rect, 0, sizeof(rect));
  CGRect remainder = v27;
  CGRectDivide(v27, &slice, &remainder, 16.0, v3);
  CGRectDivide(remainder, &rect, &remainder, 29.0, v3);
  CGRectDivide(remainder, &slice, &remainder, 16.0, v3);
  double width = remainder.size.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_subTitleLabel, "sizeThatFits:", width, 1.79769313e308);
  double v9 = v8;
  double v10 = v7 + 8.0 + 2.0 + v8 + 8.0;
  PKSizeAlignedInRect();
  double x = v28.origin.x;
  CGFloat v13 = v12;
  double v14 = v28.size.width;
  v28.origin.CGFloat y = v12 + 8.0;
  CGFloat y = v28.origin.y;
  v28.size.height = v7;
  -[UILabel setFrame:](self->_subTitleLabel, "setFrame:", v28.origin.x, CGRectGetMaxY(v28) + 2.0, v28.size.width, v9);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, v14, v7);
  double v16 = 60.0;
  if (v10 >= 60.0) {
    double v16 = v10;
  }
  v17 = objc_msgSend(NSNumber, "numberWithDouble:", v16, *(void *)&rect.origin.x, *(void *)&rect.origin.y);
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F78]));
  [WeakRetained setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F93218]];

  rect.size.height = v10;
  rect.origin.CGFloat y = v13;
  snapshotSpinner = self->_snapshotSpinner;
  v29.origin.double x = rect.origin.x;
  v29.size.double width = rect.size.width;
  v29.origin.CGFloat y = v13;
  v29.size.height = v10;
  double MidX = CGRectGetMidX(v29);
  -[UIActivityIndicatorView setCenter:](snapshotSpinner, "setCenter:", MidX, CGRectGetMidY(rect));
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    v22 = [(UIImageView *)iconImageView image];

    if (v22)
    {
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
    }
  }
}

+ (double)estimatedHeightForCell
{
  CGRectEdge v3 = [a1 titleFont];
  [v3 lineHeight];
  double v5 = v4;
  double v6 = [a1 subTitleFont];
  [v6 lineHeight];
  double v8 = v5 + v7;

  return fmax(fmax(v8 + 2.0 + 16.0, 45.0), 60.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);

  objc_storeStrong((id *)&self->_connectedInstitution, 0);
}

@end