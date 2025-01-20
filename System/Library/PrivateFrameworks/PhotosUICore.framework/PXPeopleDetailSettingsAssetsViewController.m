@interface PXPeopleDetailSettingsAssetsViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)assets;
- (PXPeopleDetailSettingsAssetsViewController)initWithAssets:(id)a3;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAssets:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDetailSettingsAssetsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PXPeopleDetailSettingsAssetsViewController *)self assets];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v9 setDeliveryMode:0];
  [v9 setResizeMode:1];
  v10 = [(PXPeopleDetailSettingsAssetsViewController *)self view];
  [v10 frame];
  double v12 = v11;
  v13 = [(PXPeopleDetailSettingsAssetsViewController *)self view];
  [v13 frame];
  double v15 = v14;

  v16 = [[PXPeopleDetailSettingsOneUpViewController alloc] initWithAsset:0];
  v17 = [(PXPeopleDetailSettingsAssetsViewController *)self navigationController];
  [v17 pushViewController:v16 animated:1];

  v18 = [MEMORY[0x1E4F390D0] defaultManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v20[3] = &unk_1E5DCBFC0;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v9, v20, v12, v15);
}

void __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E5DD32A8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAsset:*(void *)(a1 + 40)];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 2.0;
  double v6 = 2.0;
  double v7 = 2.0;
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

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(PXPeopleDetailSettingsAssetsViewController *)self assets];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"faceCellIdentifier" forIndexPath:v6];
  uint64_t v8 = [v7 tag] + 1;
  [v7 setTag:v8];
  id v9 = [(PXPeopleDetailSettingsAssetsViewController *)self assets];
  uint64_t v10 = [v6 row];

  double v11 = [v9 objectAtIndexedSubscript:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v12 setDeliveryMode:0];
  [v12 setResizeMode:1];
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v14;

  v16 = [MEMORY[0x1E4F390D0] defaultManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v19[3] = &unk_1E5DD15E0;
  id v17 = v7;
  id v20 = v17;
  uint64_t v21 = v8;
  objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, v12, v19, v15 * 110.0, v15 * 110.0);

  return v17;
}

void __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5DD0D90;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
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

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleDetailSettingsAssetsViewController;
  [(PXPeopleDetailSettingsAssetsViewController *)&v15 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumInteritemSpacing:15.0];
  [v3 setMinimumLineSpacing:15.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  uint64_t v5 = [(PXPeopleDetailSettingsAssetsViewController *)self view];
  [v5 frame];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  [(PXPeopleDetailSettingsAssetsViewController *)self setCollectionView:v6];

  double v7 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  [v7 setAutoresizingMask:18];

  id v8 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  [v8 setDataSource:self];

  id v9 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  [v9 setDelegate:self];

  uint64_t v10 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"faceCellIdentifier"];

  double v11 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  id v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v11 setBackgroundColor:v12];

  v13 = [(PXPeopleDetailSettingsAssetsViewController *)self view];
  double v14 = [(PXPeopleDetailSettingsAssetsViewController *)self collectionView];
  [v13 addSubview:v14];
}

- (PXPeopleDetailSettingsAssetsViewController)initWithAssets:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [(PXPeopleDetailSettingsAssetsViewController *)self superclass];
    objc_storeStrong((id *)&self->_assets, a3);
  }

  return self;
}

@end