@interface PKPeerPaymentRecurringPaymentMemoSectionController
- (BOOL)isEditable;
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo;
- (PKPeerPaymentRecurringPaymentMemoSectionController)initWithRecurringPaymentMemo:(id)a3 contact:(id)a4 delegate:(id)a5;
- (UIColor)memoTextColor;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_reloadItemWithMemo:(id)a3 animated:(BOOL)a4;
- (void)memoIconWasTapped;
- (void)memoTextWasUpdated:(id)a3;
- (void)requestBecomeFirstResponder;
- (void)setIsEditable:(BOOL)a3;
- (void)setMemoTextColor:(id)a3;
- (void)setRecurringPaymentMemo:(id)a3;
- (void)setRecurringPaymentMemoWithTextSuggestion:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentMemoSectionController

- (PKPeerPaymentRecurringPaymentMemoSectionController)initWithRecurringPaymentMemo:(id)a3 contact:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRecurringPaymentMemoSectionController;
  v11 = [(PKPeerPaymentRecurringPaymentMemoSectionController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
    memoTextColor = v12->_memoTextColor;
    v12->_memoTextColor = (UIColor *)v13;

    v15 = PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsMemoSec.isa);
    [(PKDynamicListSectionController *)v12 setHeaderText:v15];

    v16 = [v9 givenName];
    if ([v16 length]) {
      PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsMemoSec_0.isa, &stru_1EF1B4C70.isa, v16);
    }
    else {
    v17 = PKLocalizedPeerPaymentRecurringString(&cfstr_DetailsMemoSec_1.isa);
    }
    [(PKDynamicListSectionController *)v12 setFooterText:v17];

    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
    }
    v18 = (void *)[v8 copy];
    [(PKPeerPaymentRecurringPaymentMemoSectionController *)v12 _reloadItemWithMemo:v18 animated:0];
  }
  return v12;
}

- (void)_reloadItemWithMemo:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[PKPeerPaymentRecurringPaymentMemoRowItem alloc] initWithIdentifier:@"memo" isEditable:self->_isEditable titleColor:self->_memoTextColor];
  item = self->_item;
  self->_item = v7;

  [(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item setMemo:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:v4];
}

- (void)setRecurringPaymentMemo:(id)a3
{
  id v4 = a3;
  v5 = [[PKPeerPaymentRecurringPaymentMemoRowItem alloc] initWithIdentifier:@"memo" isEditable:self->_isEditable titleColor:self->_memoTextColor];
  id v8 = (id)[v4 copy];

  id v6 = [v8 text];
  [v8 setText:v6];

  [(PKPeerPaymentRecurringPaymentMemoRowItem *)v5 setMemo:v8];
  item = self->_item;
  self->_item = v5;
}

- (void)setRecurringPaymentMemoWithTextSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [[PKPeerPaymentRecurringPaymentMemoRowItem alloc] initWithIdentifier:@"memo" isEditable:self->_isEditable titleColor:self->_memoTextColor];
  id v10 = (id)[v4 copy];

  id v6 = [v10 text];
  [(PKPeerPaymentRecurringPaymentMemoRowItem *)v5 setSuggestedText:v6];

  v7 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item memo];
  id v8 = [v7 text];
  [v10 setText:v8];

  [(PKPeerPaymentRecurringPaymentMemoRowItem *)v5 setMemo:v10];
  item = self->_item;
  self->_item = v5;
}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  v3 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item memo];
  id v4 = (void *)[v3 copy];

  v5 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)self->_item suggestedText];
  id v6 = [v4 text];
  if ([v6 length])
  {
  }
  else
  {
    uint64_t v7 = [v5 length];

    if (v7) {
      [v4 setText:v5];
    }
  }

  return (PKPeerPaymentRecurringPaymentMemo *)v4;
}

- (void)setIsEditable:(BOOL)a3
{
  if (self->_isEditable != a3)
  {
    self->_isEditable = a3;
    id v4 = [(PKPeerPaymentRecurringPaymentMemoSectionController *)self recurringPaymentMemo];
    [(PKPeerPaymentRecurringPaymentMemoSectionController *)self _reloadItemWithMemo:v4 animated:1];
  }
}

- (void)setMemoTextColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_memoTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_memoTextColor, a3);
    v5 = [(PKPeerPaymentRecurringPaymentMemoSectionController *)self recurringPaymentMemo];
    [(PKPeerPaymentRecurringPaymentMemoSectionController *)self _reloadItemWithMemo:v5 animated:1];
  }
}

- (void)requestBecomeFirstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained makeCellFirstResponderWithItem:self->_item];
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"memo";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v8[0] = self->_item;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 appendItems:v6];

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __78__PKPeerPaymentRecurringPaymentMemoSectionController_cellRegistrationForItem___block_invoke;
  v8[3] = &unk_1E59CCCA0;
  v8[4] = self;
  id v6 = [v4 registrationWithCellClass:v5 configurationHandler:v8];

  return v6;
}

void __78__PKPeerPaymentRecurringPaymentMemoSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  [v6 setItem:a4];
  [v6 setDelegate:*(void *)(a1 + 32)];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [(PKDynamicListSectionController *)self headerText];
  if (v8)
  {
  }
  else
  {
    id v9 = [(PKDynamicListSectionController *)self attributedHeaderText];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v6 setHeaderMode:1];
LABEL_5:
  id v10 = [(PKDynamicListSectionController *)self footerText];
  if (v10)
  {
  }
  else
  {
    v11 = [(PKDynamicListSectionController *)self attributedFooterText];

    if (!v11) {
      goto LABEL_9;
    }
  }
  [v6 setFooterMode:1];
LABEL_9:
  v12 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v12;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)memoIconWasTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained memoIconWasTapped];
}

- (void)memoTextWasUpdated:(id)a3
{
  item = self->_item;
  id v4 = a3;
  id v5 = [(PKPeerPaymentRecurringPaymentMemoRowItem *)item memo];
  [v5 setText:v4];
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (UIColor)memoTextColor
{
  return self->_memoTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoTextColor, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end