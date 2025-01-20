@interface PKApplySavingsInlineTermsRow
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplySavingsInlineTermsRow)initWithContent:(id)a3 delegate:(id)a4;
- (void)configureCell:(id)a3;
- (void)didTapFooterLink:(id)a3;
@end

@implementation PKApplySavingsInlineTermsRow

- (PKApplySavingsInlineTermsRow)initWithContent:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplySavingsInlineTermsRow;
  v9 = [(PKApplySavingsInlineTermsRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (NSCopying)identifier
{
  return (NSCopying *)@"inlineTermsCell";
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  [(PKApplySavingsInlineTermsRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    id v5 = v4;
    content = self->_content;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __46__PKApplySavingsInlineTermsRow_configureCell___block_invoke;
    v16 = &unk_1E59CC0E8;
    objc_copyWeak(&v17, &location);
    id v7 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:content linkTapped:&v13];
    id v8 = [(PKApplyFooterContent *)self->_content footerText];
    [v5 setText:v8];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setTextColor:v9];

    [v5 setTextAlignment:4];
    double v10 = PKTableViewCellTextInset();
    objc_msgSend(v5, "setEdgeInsets:", 8.0, v10, 8.0, PKTableViewCellTextInset());
    [v5 setSources:v7];
    v11 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    objc_super v12 = PKProvisioningSecondaryBackgroundColor();
    [v11 setBackgroundColor:v12];

    [v5 setBackgroundConfiguration:v11];
    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AA0]];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __46__PKApplySavingsInlineTermsRow_configureCell___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didTapFooterLink:v5];
  }
}

- (void)didTapFooterLink:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didTapFooterLink:v5];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_content, 0);
}

@end