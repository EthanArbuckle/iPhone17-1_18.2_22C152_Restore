@interface PKPaymentServiceProviderItemsSectionController
- (PKPaymentServiceProviderItemsSectionController)init;
- (PKPaymentServiceProviderItemsSectionController)initWithIdentifier:(id)a3 serviceProviderProductWithItems:(id)a4 currency:(id)a5 delegate:(id)a6;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
@end

@implementation PKPaymentServiceProviderItemsSectionController

- (PKPaymentServiceProviderItemsSectionController)init
{
  return 0;
}

- (PKPaymentServiceProviderItemsSectionController)initWithIdentifier:(id)a3 serviceProviderProductWithItems:(id)a4 currency:(id)a5 delegate:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22[0] = v10;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentServiceProviderItemsSectionController;
  v15 = [(PKPaymentSetupListSectionController *)&v21 initWithIdentifiers:v14];

  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __119__PKPaymentServiceProviderItemsSectionController_initWithIdentifier_serviceProviderProductWithItems_currency_delegate___block_invoke;
    v19[3] = &unk_1E59DEC88;
    id v20 = v12;
    uint64_t v16 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", v19);
    listItems = v15->_listItems;
    v15->_listItems = (NSArray *)v16;
  }
  return v15;
}

PKServiceProviderListItem *__119__PKPaymentServiceProviderItemsSectionController_initWithIdentifier_serviceProviderProductWithItems_currency_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 item];
  v5 = objc_alloc_init(PKServiceProviderListItem);
  [(PKServiceProviderListItem *)v5 setItemPair:v3];

  v6 = [v4 localizedDisplayName];
  [(PKPaymentSetupListItem *)v5 setTitle:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F84610]);
  v8 = [v4 amount];
  v9 = (void *)[v7 initWithAmount:v8 currency:*(void *)(a1 + 32) exponent:0];

  id v10 = [v4 localizedDescription];
  id v11 = [v9 formattedStringValue];
  id v12 = v10;
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 length];

    if (v14)
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@ - %@", v11, v13];

      id v11 = (void *)v15;
    }
  }
  [(PKPaymentSetupListItem *)v5 setSubtitle:v11];

  return v5;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_listItems];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_listItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v18 + 1) + 8 * v9);
        if (v10 == v4)
        {
          objc_msgSend(v4, "setSelected:", 1, (void)v18);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          id v12 = WeakRetained;
          id v13 = v4;
        }
        else
        {
          if (![*(id *)(*((void *)&v18 + 1) + 8 * v9) selected]) {
            goto LABEL_11;
          }
          [v10 setSelected:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          id v12 = WeakRetained;
          id v13 = v10;
        }
        objc_msgSend(WeakRetained, "reloadItem:animated:", v13, 1, (void)v18);

LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  p_delegate = &self->_delegate;
  id v15 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v16 = [v4 itemPair];
  [v15 didSelectServiceProviderItem:v16];

  id v17 = objc_loadWeakRetained((id *)p_delegate);
  [v17 deselectCells];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  uint64_t v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  [v7 contentInsets];
  [v7 setContentInsets:16.0];

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_listItems, 0);
}

@end