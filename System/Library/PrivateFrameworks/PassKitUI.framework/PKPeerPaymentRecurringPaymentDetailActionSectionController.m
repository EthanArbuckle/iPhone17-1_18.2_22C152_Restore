@interface PKPeerPaymentRecurringPaymentDetailActionSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPeerPaymentRecurringPaymentDetailActionSectionController)initWithAction:(unint64_t)a3 delegate:(id)a4;
- (PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate)delegate;
- (id)_actionSectionIdentifier;
- (id)_spinnerAccessory;
- (id)cellRegistration;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (unint64_t)status;
- (void)_decorateListCell:(id)a3 forItem:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setCellRegistration:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKPeerPaymentRecurringPaymentDetailActionSectionController

- (PKPeerPaymentRecurringPaymentDetailActionSectionController)initWithAction:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentRecurringPaymentDetailActionSectionController;
  v7 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_action = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_initWeak(&location, v8);
    v9 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v10 = objc_opt_class();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __86__PKPeerPaymentRecurringPaymentDetailActionSectionController_initWithAction_delegate___block_invoke;
    v16 = &unk_1E59CBB38;
    objc_copyWeak(&v17, &location);
    v11 = [v9 registrationWithCellClass:v10 configurationHandler:&v13];
    -[PKPeerPaymentRecurringPaymentDetailActionSectionController setCellRegistration:](v8, "setCellRegistration:", v11, v13, v14, v15, v16);

    [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)v8 reloadItemsAnimated:0];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __86__PKPeerPaymentRecurringPaymentDetailActionSectionController_initWithAction_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _decorateListCell:v8 forItem:v6];
  }
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t action = self->_action;
  if (action)
  {
    id v6 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentActionRowItem alloc] initWithIdentifier:@"pause" isEditable:0 titleColor:0];
    unint64_t v7 = self->_status - 1;
    if (v7 <= 3)
    {
      id v8 = PKLocalizedPeerPaymentRecurringString(&off_1E59D0AD0[v7]->isa);
      [(PKPeerPaymentRecurringPaymentActionRowItem *)v6 setTitle:v8];
    }
    [(PKPeerPaymentRecurringPaymentActionRowItem *)v6 setAction:1];
    [(PKPeerPaymentRecurringPaymentActionRowItem *)v6 setActionInProgress:self->_actionInProgress];
    [v17 addObject:v6];

    unint64_t action = self->_action;
  }
  if ((action & 2) != 0)
  {
    v9 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)[PKPeerPaymentRecurringPaymentActionRowItem alloc] initWithIdentifier:@"cancel" isEditable:0 titleColor:0];
    uint64_t v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_ActionCancel.isa);
    [(PKPeerPaymentRecurringPaymentActionRowItem *)v9 setTitle:v10];

    [(PKPeerPaymentRecurringPaymentActionRowItem *)v9 setAction:2];
    [(PKPeerPaymentRecurringPaymentActionRowItem *)v9 setActionInProgress:self->_actionInProgress];
    [v17 addObject:v9];
  }
  v11 = (NSArray *)[v17 copy];
  rowItems = self->_rowItems;
  self->_rowItems = v11;

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self _actionSectionIdentifier];
  [WeakRetained updateFooterForSectionIdentifier:v15];

  id v16 = objc_loadWeakRetained((id *)p_delegate);
  [v16 reloadDataAnimated:v3];
}

- (id)identifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self _actionSectionIdentifier];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)_actionSectionIdentifier
{
  unint64_t action = self->_action;
  if (action)
  {
    BOOL v3 = [@"action" stringByAppendingFormat:@"-%@", @"pause"];
    if ((self->_action & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v3 = @"action";
  if ((action & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = [(__CFString *)v3 stringByAppendingFormat:@"-%@", @"cancel"];

    BOOL v3 = (__CFString *)v5;
  }
LABEL_6:

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_rowItems];

  return v5;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  unint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [(PKDynamicListSectionController *)self headerText];
  if (v8)
  {
  }
  else
  {
    v9 = [(PKDynamicListSectionController *)self attributedHeaderText];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v6 setHeaderMode:1];
LABEL_5:
  uint64_t v10 = [(PKDynamicListSectionController *)self footerText];
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
  return !self->_actionInProgress;
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t action = self->_action;
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke;
  v9[3] = &unk_1E59CA7D0;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_3;
  v8[3] = &unk_1E59CA7D0;
  [WeakRetained performAction:action startHandler:v9 completion:v8];

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  [v7 deselectCells];
}

void __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  return [*(id *)(a1 + 32) reloadItemsAnimated:1];
}

void __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_4;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  return [*(id *)(a1 + 32) reloadItemsAnimated:1];
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self reloadItemsAnimated:1];
  }
}

- (void)_decorateListCell:(id)a3 forItem:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB1948];
  id v8 = a3;
  v9 = [v7 valueCellConfiguration];
  uint64_t v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v11 = [v6 identifier];
  int v12 = [v11 isEqualToString:@"cancel"];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4FB1618] systemRedColor];

    uint64_t v10 = (void *)v13;
  }
  uint64_t v14 = [v6 title];
  [v9 setText:v14];

  v15 = [v9 textProperties];
  [v15 setColor:v10];

  if ([v6 actionInProgress])
  {
    id v16 = [(PKPeerPaymentRecurringPaymentDetailActionSectionController *)self _spinnerAccessory];
    v18[0] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v8 setAccessories:v17];
  }
  else
  {
    [v8 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
  [v8 setContentConfiguration:v9];
}

- (id)_spinnerAccessory
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1400]);
  [v2 startAnimating];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v2 placement:1];

  return v3;
}

- (id)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);

  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end