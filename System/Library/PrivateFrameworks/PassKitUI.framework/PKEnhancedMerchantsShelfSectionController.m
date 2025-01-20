@interface PKEnhancedMerchantsShelfSectionController
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKEnhancedMerchantsShelfSectionController)initWithSectionIdentifier:(id)a3 fetcher:(id)a4 delegate:(id)a5;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDataSource;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)dealloc;
- (void)didPressEnhancedMerchantsListButton;
- (void)didSelectItem:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation PKEnhancedMerchantsShelfSectionController

- (PKEnhancedMerchantsShelfSectionController)initWithSectionIdentifier:(id)a3 fetcher:(id)a4 delegate:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKEnhancedMerchantsShelfSectionController;
  v11 = [(PKEnhancedMerchantsShelfSectionController *)&v23 init];
  if (v11)
  {
    v12 = @"PKRewardsHubSectionEnhancedMerchantShelf";
    if (v8) {
      v12 = v8;
    }
    v13 = v12;
    v24[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_fetcher, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    [(PKEnhancedMerchantsShelfSectionController *)v11 _configureDataSource];
    objc_initWeak(&location, v11);
    fetcher = v11->_fetcher;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__PKEnhancedMerchantsShelfSectionController_initWithSectionIdentifier_fetcher_delegate___block_invoke;
    v20[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v21, &location);
    uint64_t v17 = [(PKAccountEnhancedMerchantsFetcher *)fetcher addUpdateHandler:v20];
    merchantsUpdateToken = v11->_merchantsUpdateToken;
    v11->_merchantsUpdateToken = (NSUUID *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __88__PKEnhancedMerchantsShelfSectionController_initWithSectionIdentifier_fetcher_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    if (objc_opt_respondsToSelector()) {
      [v2 reloadDataForSectionIdentifier:@"PKRewardsHubSectionEnhancedMerchantShelf" animated:1];
    }

    WeakRetained = v3;
  }
}

- (void)dealloc
{
  if (self->_merchantsUpdateToken) {
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_fetcher, "removeUpdateHandler:");
  }
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantsShelfSectionController;
  [(PKEnhancedMerchantsShelfSectionController *)&v3 dealloc];
}

- (void)preflightWithCompletion:(id)a3
{
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v6 = [(PKAccountEnhancedMerchantsFetcher *)self->_fetcher enhancedMerchantsWithOrderingContext:1];
  if (!v6)
  {
    v6 = [(PKAccountEnhancedMerchantsFetcher *)self->_fetcher enhancedMerchants];
  }
  [v5 appendItems:v6];

  return v5;
}

- (void)_configureDataSource
{
  objc_super v3 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_167];
  cellRegistration = self->_cellRegistration;
  self->_cellRegistration = v3;
}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  v7 = [v5 enhancedMerchant];
  char v8 = PKEqualObjects();

  if ((v8 & 1) == 0)
  {
    [v5 updateWithAccountEnhancedMerchant:v6];
    id v9 = [v6 logoImage];
    PKScreenScale();
    id v10 = objc_msgSend(v9, "imageForScaleFactorValue:");

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_2;
    v11[3] = &unk_1E59D96C0;
    id v12 = v5;
    id v13 = v6;
    [v10 fetchImageWithCompletion:v11];
  }
}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E4FB1818], "imageWithPKImage:");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  id v2 = [*(id *)(a1 + 40) enhancedMerchant];
  id v3 = [v2 privateIdentifier];
  id v4 = [*(id *)(a1 + 48) privateIdentifier];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_13;
  }
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {

LABEL_14:
    goto LABEL_15;
  }
  char v9 = [v5 isEqualToString:v6];

  if (v9)
  {
LABEL_13:
    id v2 = [*(id *)(a1 + 40) imageView];
    [v2 setImage:v10];
    goto LABEL_14;
  }
LABEL_15:
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v19 = objc_msgSend(MEMORY[0x1E4FB1308], "fractionalWidthDimension:", a3, a4, 1.0);
  v18 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  uint64_t v17 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v19 heightDimension:v18];
  v16 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v17];
  id v4 = [MEMORY[0x1E4FB1308] absoluteDimension:140.0];
  id v5 = [MEMORY[0x1E4FB1308] absoluteDimension:120.0];
  id v6 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v4 heightDimension:v5];
  id v7 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v6 repeatingSubitem:v16 count:1];
  BOOL v8 = [MEMORY[0x1E4FB1330] sectionWithGroup:v7];
  [v8 setInterGroupSpacing:10.0];
  [v8 setOrthogonalScrollingBehavior:1];
  char v9 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v10 = [MEMORY[0x1E4FB1308] estimatedDimension:40.0];
  v11 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v9 heightDimension:v10];
  id v12 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v11 elementKind:@"PKEnhancedMerchantsShelfHeaderIdentifier" alignment:2];
  v20[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v8 setBoundarySupplementaryItems:v13];

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v8, "setContentInsets:", 0.0, v14, 35.0, v14);

  return v8;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (__CFString *)v5;
  BOOL v8 = v7;
  if (v7 != @"PKEnhancedMerchantsShelfHeaderIdentifier" && v7)
  {
    [(__CFString *)v7 isEqualToString:@"PKEnhancedMerchantsShelfHeaderIdentifier"];
  }
  char v9 = objc_opt_class();

  return (Class)v9;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (__CFString *)v9;
  id v12 = v11;
  if (v11 == @"PKEnhancedMerchantsShelfHeaderIdentifier"
    || v11
    && (int v13 = [(__CFString *)v11 isEqualToString:@"PKEnhancedMerchantsShelfHeaderIdentifier"],
        v12,
        v13))
  {
    id v14 = v8;
    v15 = PKLocalizedFeatureString();
    [v14 setTitle:v15];

    v16 = PKLocalizedFeatureString();
    [v14 setActionTitle:v16];
    uint64_t v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setActionColor:v17];

    [v14 setActionStyle:1];
    [v14 setUseLargeBottomInset:1];
    [v14 setPreferTitleWrapOverStackedLayout:1];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __110__PKEnhancedMerchantsShelfSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
    v18[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [v14 setAction:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __110__PKEnhancedMerchantsShelfSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didPressEnhancedMerchantsListButton];
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v6 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PKEnhancedMerchantsShelfSectionController_didSelectItem___block_invoke;
    block[3] = &unk_1E59CA7D0;
    id v7 = WeakRetained;
    id v9 = v7;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
    [v7 presentEnhancedMerchant:v4];
  }
}

uint64_t __59__PKEnhancedMerchantsShelfSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectCells];
}

- (void)didPressEnhancedMerchantsListButton
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *MEMORY[0x1E4F86380];
    uint64_t v4 = *MEMORY[0x1E4F86120];
    v7[0] = *MEMORY[0x1E4F86308];
    v7[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F86E48];
    v8[0] = v3;
    v8[1] = v5;
    dispatch_time_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    [WeakRetained reportEventIfNecessary:v6];

    [WeakRetained navigateToRewardsHubDestination:1];
  }
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_merchantsUpdateToken, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end