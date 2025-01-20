@interface PXPeopleDonationSettingsSuggestionViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PHFetchResult)faceCrops;
- (PHPerson)person;
- (PXPeopleDonationSettingsSuggestionViewController)initWithPerson:(id)a3;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIImage)image;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)loadDataSource;
- (void)setCollectionView:(id)a3;
- (void)setFaceCrops:(id)a3;
- (void)setImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDonationSettingsSuggestionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setFaceCrops:(id)a3
{
}

- (PHFetchResult)faceCrops
{
  return self->_faceCrops;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PHPerson)person
{
  return self->_person;
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
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"faceCellIdentifier" forIndexPath:v6];
  objc_msgSend(v7, "setTag:", objc_msgSend(v7, "tag") + 1);
  uint64_t v8 = [v6 item];

  v9 = [(PHFetchResult *)self->_faceCrops objectAtIndexedSubscript:v8];
  v10 = [v9 resourceData];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v10];
  [v7 setImage:v11];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = [(PXPeopleDonationSettingsSuggestionViewController *)self collectionView];
  [v5 contentSize];
  double v7 = v6;

  double v8 = 30.0;
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PHFetchResult *)self->_faceCrops count];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleDonationSettingsSuggestionViewController;
  [(PXPeopleDonationSettingsSuggestionViewController *)&v10 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumLineSpacing:15.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v5 = [(PXPeopleDonationSettingsSuggestionViewController *)self view];
  [v5 frame];
  double v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  [v6 setAutoresizingMask:18];
  [v6 setDataSource:self];
  [v6 setDelegate:self];
  double v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v6 setAllowsSelection:0];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"faceCellIdentifier"];
  [(PXPeopleDonationSettingsSuggestionViewController *)self setCollectionView:v6];
  double v8 = [(PXPeopleDonationSettingsSuggestionViewController *)self view];
  double v9 = [(PXPeopleDonationSettingsSuggestionViewController *)self collectionView];
  [v8 addSubview:v9];

  [(PXPeopleDonationSettingsSuggestionViewController *)self loadDataSource];
}

- (void)loadDataSource
{
  id v3 = [(PXPeopleDonationSettingsSuggestionViewController *)self person];
  id v4 = [(PXPeopleDonationSettingsSuggestionViewController *)self collectionView];
  double v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = [MEMORY[0x1E4F39060] fetchTransientTrainingFaceCropsForPerson:*(void *)(a1 + 40) options:0];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 1000);
  *(void *)(v4 + 1000) = v3;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_sync_exit(v2);
}

uint64_t __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (PXPeopleDonationSettingsSuggestionViewController)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDonationSettingsSuggestionViewController;
  id v6 = [(PXPeopleDonationSettingsSuggestionViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_person, a3);
  }

  return v7;
}

@end