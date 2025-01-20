@interface PKPaymentMethodActionSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPaymentMethodActionSectionController)initWithDelegate:(id)a3;
- (UIColor)linkTextColor;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setLinkTextColor:(id)a3;
@end

@implementation PKPaymentMethodActionSectionController

- (PKPaymentMethodActionSectionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentMethodActionSectionController;
  v5 = [(PKPaymentMethodActionSectionController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"actions";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = [a3 identifier];
  v5 = v4;
  BOOL v7 = v4 != @"addPaymentMethod"
    && (!v4
     || (int v6 = [(__CFString *)v4 isEqualToString:@"addPaymentMethod"], v5, !v6))
    || !self->_addInProgress;

  return v7;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  int v6 = v5;
  if (v5 == @"addPaymentMethod"
    || v5
    && (int v7 = [(__CFString *)v5 isEqualToString:@"addPaymentMethod"], v6, v7))
  {
    self->_addInProgress = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectCells];

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 reloadDataAnimated:1];

    objc_initWeak(&location, self);
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v12, &location);
    [v10 performedAddPaymentMethodWithCompletion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 72) = 0;
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained((id *)WeakRetained + 8);
    [v2 reloadDataAnimated:1];

    id WeakRetained = v3;
  }
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v6 = [[PKPaymentMethodSelectionItem alloc] initWithIdentifier:@"addPaymentMethod"];
  [v5 addObject:v6];

  int v7 = (void *)[v5 copy];
  [v4 appendItems:v7];

  return v4;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = objc_opt_class();
  int v6 = (void *)MEMORY[0x1E4FB1578];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKPaymentMethodActionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59D6558;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  int v7 = [v6 registrationWithCellClass:v5 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__PKPaymentMethodActionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = [v7 identifier];
    id v10 = v9;
    if (v9 != @"addPaymentMethod")
    {
      if (!v9
        || (int v11 = [(__CFString *)v9 isEqualToString:@"addPaymentMethod"],
            v10,
            !v11))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    id v12 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    v13 = PKLocalizedPaymentString(&cfstr_AutoReloadAddP.isa);
    [v12 setText:v13];

    v14 = [v12 textProperties];
    v15 = v14;
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v16 + 72))
    {
      uint64_t v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else
    {
      if (*(void *)(v16 + 80))
      {
        objc_msgSend(v14, "setColor:");
        goto LABEL_10;
      }
      uint64_t v17 = [MEMORY[0x1E4FB1618] linkColor];
    }
    v18 = (void *)v17;
    [v15 setColor:v17];

LABEL_10:
    [v6 setContentConfiguration:v12];
    if (*(unsigned char *)(*(void *)(a1 + 32) + 72))
    {
      v19 = +[PKCellAccessoryLoadingIndicator accessory];
      v21[0] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v6 setAccessories:v20];
    }
    else
    {
      [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (void)setLinkTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTextColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end