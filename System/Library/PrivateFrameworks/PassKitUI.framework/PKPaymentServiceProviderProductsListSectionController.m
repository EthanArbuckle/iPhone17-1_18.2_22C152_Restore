@interface PKPaymentServiceProviderProductsListSectionController
- (PKPaymentServiceProviderProductsListSectionController)init;
- (PKPaymentServiceProviderProductsListSectionController)initWithIdentifier:(id)a3 serviceProviderProducts:(id)a4;
- (PKPaymentServiceProviderProductsListSectionControllerDelegate)delegate;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentServiceProviderProductsListSectionController

- (PKPaymentServiceProviderProductsListSectionController)init
{
  return 0;
}

- (PKPaymentServiceProviderProductsListSectionController)initWithIdentifier:(id)a3 serviceProviderProducts:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentServiceProviderProductsListSectionController;
  v9 = [(PKPaymentSetupListSectionController *)&v13 initWithIdentifiers:v8];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_54);
    listItems = v9->_listItems;
    v9->_listItems = (NSArray *)v10;
  }
  return v9;
}

PKServiceProviderProductListItem *__100__PKPaymentServiceProviderProductsListSectionController_initWithIdentifier_serviceProviderProducts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(PKServiceProviderProductListItem);
  v4 = [v2 localizedDisplayName];
  [(PKPaymentSetupListItem *)v3 setTitle:v4];

  v5 = [v2 localizedDescription];
  [(PKPaymentSetupListItem *)v3 setSubtitle:v5];

  [(PKPaymentSetupListItem *)v3 setDisplayChevron:1];
  [(PKServiceProviderProductListItem *)v3 setProduct:v2];

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_listItems];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  id v6 = [(PKPaymentServiceProviderProductsListSectionController *)self delegate];
  id v5 = [v4 product];

  [v6 didSelectServiceProviderProduct:v5];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  id v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  [v7 contentInsets];
  [v7 setContentInsets:16.0];

  return v7;
}

- (PKPaymentServiceProviderProductsListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentServiceProviderProductsListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_listItems, 0);
}

@end