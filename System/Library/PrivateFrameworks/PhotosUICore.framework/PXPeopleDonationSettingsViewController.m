@interface PXPeopleDonationSettingsViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PXPeopleDonationSettingsViewController)init;
- (PXPeoplePersonDataSource)dataSource;
- (PXPeopleSuggestionDataSource)suggestionDataSource;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)loadSuggestionsForPerson:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSuggestionDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDonationSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setSuggestionDataSource:(id)a3
{
}

- (PXPeopleSuggestionDataSource)suggestionDataSource
{
  return self->_suggestionDataSource;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDataSource:(id)a3
{
}

- (PXPeoplePersonDataSource)dataSource
{
  return (PXPeoplePersonDataSource *)objc_getProperty(self, a2, 976, 1);
}

- (void)loadSuggestionsForPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  v6 = [(PXPeopleDonationSettingsViewController *)self dataSource];
  v7 = [v6 personAtIndex:v5];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__265800;
  v22[4] = __Block_byref_object_dispose__265801;
  id v23 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = [(PXPeopleDonationSettingsViewController *)self collectionView];
  v10 = [v9 traitCollection];
  [v10 displayScale];
  double v12 = v11;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke;
  v19[3] = &unk_1E5DCDF78;
  v21 = v22;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v6, "imageAtIndex:targetSize:displayScale:resultHandler:", v5, v19, 110.0, 110.0, v12);

  dispatch_time_t v14 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v13, v14);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke_2;
  v16[3] = &unk_1E5DD32A8;
  id v17 = v7;
  v18 = self;
  id v15 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  _Block_object_dispose(v22, 8);
}

void __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__PXPeopleDonationSettingsViewController_loadSuggestionsForPerson___block_invoke_2(uint64_t a1)
{
  v3 = [[PXPeopleDonationSettingsSuggestionViewController alloc] initWithPerson:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) navigationController];
  [v2 pushViewController:v3 animated:1];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PXPeopleDonationSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __82__PXPeopleDonationSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadSuggestionsForPerson:*(void *)(a1 + 40)];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 10.0;
  double v6 = 0.0;
  double v7 = 10.0;
  double v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 110.0;
  double v6 = 110.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:v6];
  uint64_t v9 = [v8 tag] + 1;
  [v8 setTag:v9];
  v10 = [(PXPeopleDonationSettingsViewController *)self dataSource];
  uint64_t v11 = [v6 item];

  double v12 = [v7 traitCollection];

  [v12 displayScale];
  double v14 = v13;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v32[3] = &unk_1E5DCDF50;
  id v15 = v8;
  id v33 = v15;
  uint64_t v34 = v9;
  objc_msgSend(v10, "imageAtIndex:targetSize:displayScale:resultHandler:", v11, v32, 110.0, 110.0, v14);

  v16 = [(PXPeopleDonationSettingsViewController *)self dataSource];
  id v17 = [v16 personAtIndex:v11];

  v18 = [v10 titleAtIndex:v11];
  if (![v18 length])
  {
    uint64_t v19 = [v17 localIdentifier];

    v18 = (void *)v19;
  }
  uint64_t v20 = [v10 photoQuantityAtIndex:v11];
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v20);
  v22 = [v15 quantityLabel];
  [v22 setText:v21];

  id v23 = [v15 avatarView];
  [v23 setAlpha:1.0];
  [v23 setHighlighted:0];
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v29 = *MEMORY[0x1E4F1DAB8];
  long long v27 = v29;
  long long v30 = v28;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v26 = v31;
  [v23 setTransform:&v29];
  long long v29 = v27;
  long long v30 = v28;
  long long v31 = v26;
  [v15 setTransform:&v29];
  [v15 setName:v18];
  [v15 setTextAlpha:1.0];
  id v24 = v15;

  return v24;
}

void __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5DD0D90;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PXPeopleDonationSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tag];
  if (result == *(void *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setImage:v4];
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PXPeopleDonationSettingsViewController *)self dataSource];
  int64_t v5 = [v4 numberOfMembers];

  return v5;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleDonationSettingsViewController;
  [(PXPeopleDonationSettingsViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumInteritemSpacing:15.0];
  [v3 setMinimumLineSpacing:15.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  int64_t v5 = [(PXPeopleDonationSettingsViewController *)self view];
  [v5 frame];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  [v6 setAutoresizingMask:18];
  [v6 setDataSource:self];
  [v6 setDelegate:self];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v6 setAllowsSelection:1];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cellIdentifier"];
  [(PXPeopleDonationSettingsViewController *)self setCollectionView:v6];
  id v8 = [(PXPeopleDonationSettingsViewController *)self view];
  id v9 = [(PXPeopleDonationSettingsViewController *)self collectionView];
  [v8 addSubview:v9];

  objc_initWeak(&location, self);
  uint64_t v10 = [(PXPeopleDonationSettingsViewController *)self dataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v12, &location);
  [v10 loadObjectsAndUpdateMembersWithCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __53__PXPeopleDonationSettingsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (PXPeopleDonationSettingsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleDonationSettingsViewController;
  id v2 = [(PXPeopleDonationSettingsViewController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(PXPeopleDonationSettingsViewController *)v2 commonInit];
  }
  return v3;
}

- (void)commonInit
{
  id v3 = [(PXPeopleDonationSettingsViewController *)self dataSource];

  if (!v3)
  {
    objc_super v5 = [(PXPeopleDataSource *)[PXPeoplePersonDataSource alloc] initWithName:@"PeopleDonationDataSource" objectsReloadBlock:&__block_literal_global_265850 asynchronousLoad:1 callbackDelegate:self];
    [(PXPeopleDataSource *)v5 setSortComparator:&__block_literal_global_198_265851];
    [(PXPeopleDonationSettingsViewController *)self setDataSource:v5];
    id v4 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:0];
    [(PXPeopleDonationSettingsViewController *)self setSuggestionDataSource:v4];
  }
}

uint64_t __52__PXPeopleDonationSettingsViewController_commonInit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = [a2 modelObject];
  id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "manualOrder"));
  id v8 = NSNumber;
  id v9 = [v5 modelObject];

  uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "manualOrder"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

id __52__PXPeopleDonationSettingsViewController_commonInit__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v1 = [v0 librarySpecificFetchOptions];

  id v2 = [MEMORY[0x1E4F391F0] fetchSuggestedPersonsForClient:1 options:v1];

  return v2;
}

@end