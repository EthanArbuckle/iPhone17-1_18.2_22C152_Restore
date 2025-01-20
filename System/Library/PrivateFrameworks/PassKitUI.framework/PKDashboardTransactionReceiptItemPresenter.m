@interface PKDashboardTransactionReceiptItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardTransactionReceiptItemPresenter)init;
- (id)_contactKeysToFetch;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
@end

@implementation PKDashboardTransactionReceiptItemPresenter

- (PKDashboardTransactionReceiptItemPresenter)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionReceiptItemPresenter;
  v2 = [(PKDashboardTransactionReceiptItemPresenter *)&v15 init];
  if (v2)
  {
    v3 = [PKDashboardStackedImageCollectionViewCell alloc];
    uint64_t v4 = -[PKDashboardStackedImageCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardStackedImageCollectionViewCell *)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v7 = objc_alloc(MEMORY[0x1E4F845E8]);
    v8 = [(PKDashboardTransactionReceiptItemPresenter *)v2 _contactKeysToFetch];
    v9 = (void *)[v7 initWithContactStore:v6 keysToFetch:v8];

    v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    v12 = [[PKPaymentTransactionDetailsFactory alloc] initWithContactResolver:v9 peerPaymentWebService:v10 paymentServiceDataProvider:v11 detailViewStyle:0];
    transactionDetailsFactory = v2->_transactionDetailsFactory;
    v2->_transactionDetailsFactory = v12;
  }
  return v2;
}

- (id)_contactKeysToFetch
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  Class v3 = _MergedGlobals_660();
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v10[1] = v5;
  id v6 = [(Class)off_1EB545930() descriptorForRequiredKeys];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E4F1AEE0];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"DashboardTransactionReceiptItemCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9 = a6;
  id v10 = a3;
  id v17 = [v10 transaction];
  id v11 = [v10 transactionSourceCollection];
  v12 = [v10 account];
  v13 = [v10 accountUserCollection];
  v14 = [v10 familyCollection];
  objc_super v15 = [v10 physicalCards];

  v16 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory detailViewControllerForTransaction:v17 transactionSourceCollection:v11 familyCollection:v14 account:v12 accountUserCollection:v13 bankConnectInstitution:0 physicalCards:v15];
  [v9 pushViewController:v16 animated:1];
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"DashboardTransactionReceiptItemCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardTransactionReceiptItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKDashboardTransactionReceiptItemPresenter *)self _configureCell:sampleCell forItem:a3 inCollectionView:v9 forIndexPath:a5];
  id v10 = self->_sampleCell;
  [v9 bounds];
  double v12 = v11;

  -[PKDashboardStackedImageCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v18 = a3;
  uint64_t v7 = [a4 receipt];
  id v8 = [v7 lineItems];
  id v9 = [v8 firstObject];
  id v10 = [v9 image];
  if (v10)
  {
    double v11 = (void *)MEMORY[0x1E4FB1818];
    double v12 = [v9 image];
    double v13 = [v11 imageWithPKImage:v12];
  }
  else
  {
    double v13 = 0;
  }

  [v18 setIcon:v13];
  double v14 = [v9 title];
  [v18 setTitle:v14];

  objc_super v15 = [v9 subtitle];
  [v18 setSubtitle:v15];

  unint64_t v16 = [v8 count];
  if (v16 < 2) {
    [v9 secondarySubtitle];
  }
  else {
  id v17 = PKLocalizedString(&cfstr_TransactionRec.isa, &cfstr_Lu.isa, v16);
  }
  [v18 setTertiaryText:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end