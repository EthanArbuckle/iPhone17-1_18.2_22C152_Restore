@interface PXPeopleRecoCollectionViewController
+ (id)recoControllerForPerson:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PXPeopleRecoDataSource)dataSource;
- (UICollectionViewSupplementaryRegistration)headerRegistration;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_initWithPerson:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancelTapped:(id)a3;
- (void)_doneTapped:(id)a3;
- (void)_reviewMoreTapped:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 frameDidChange:(CGRect)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)recoDataSourceDataChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXPeopleRecoCollectionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (UICollectionViewSupplementaryRegistration)headerRegistration
{
  return self->_headerRegistration;
}

- (PXPeopleRecoDataSource)dataSource
{
  return self->_dataSource;
}

- (void)collectionView:(id)a3 frameDidChange:(CGRect)a4
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleRecoCollectionViewController.m", 193, @"%s must be called on the main thread", "-[PXPeopleRecoCollectionViewController collectionView:frameDidChange:]");
  }
  v6 = [v8 collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)recoDataSourceDataChanged:(id)a3
{
  id v3 = [(PXPeopleRecoCollectionViewController *)self collectionView];
  [v3 reloadData];
}

- (void)_reviewMoreTapped:(id)a3
{
  v4 = [PXPeopleSplitConfirmationViewController alloc];
  v5 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  v6 = [v5 person];
  v9 = [(PXPeopleSplitConfirmationViewController *)v4 initWithPerson:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  id v8 = [(PXPeopleRecoCollectionViewController *)self navigationController];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (void)_cancelTapped:(id)a3
{
  id v3 = [(PXPeopleRecoCollectionViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_doneTapped:(id)a3
{
  v4 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  [v4 commitChanges];

  id v5 = [(PXPeopleRecoCollectionViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v5 = [(PXPeopleRecoCollectionViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = 40.0;
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  double v9 = [v6 collectionViewLayout];
  [v9 itemSize];
  double v11 = v10;
  double v13 = v12;

  v14 = [v6 traitCollection];
  [v14 displayScale];
  double v16 = v15;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(v8, "requestImageForItemAtIndex:targetSize:displayScale:imageBlock:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "item", (void)v22), 0, v11, v13, v16);
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v19);
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 frame];
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [a3 frame];
  +[PXPeopleGridSizer marginForGridClass:0 width:v5];
  double v7 = v6;
  double v8 = v6;
  double v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  uint64_t v8 = objc_msgSend(v13, "toggleRejectionForIndex:", objc_msgSend(v6, "item"));
  double v9 = [v7 cellForItemAtIndexPath:v6];

  if ([v9 hasImageSet])
  {
    [v9 setIsRejected:v8];
    uint64_t v10 = [v13 shouldAllowCommitting];
    double v11 = [(PXPeopleRecoCollectionViewController *)self navigationItem];
    double v12 = [v11 rightBarButtonItem];
    [v12 setEnabled:v10];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  double v9 = [(PXPeopleRecoCollectionViewController *)self headerRegistration];
  uint64_t v10 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v9 forIndexPath:v7];

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 frame];
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:v8];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  id v13 = [v7 traitCollection];
  [v13 displayScale];
  uint64_t v15 = v14;

  double v16 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v17 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v22[3] = &__block_descriptor_56_e83_v32__0__PXPeopleRecoCollectionViewCell_8__NSIndexPath_16__PXPeopleRecoDataSource_24l;
  v22[4] = v10;
  v22[5] = v12;
  v22[6] = v15;
  uint64_t v18 = [v16 registrationWithCellClass:v17 configurationHandler:v22];
  uint64_t v19 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  uint64_t v20 = [v7 dequeueConfiguredReusableCellWithRegistration:v18 forIndexPath:v6 item:v19];

  return v20;
}

void __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(double *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 tag] + 1;
  [v7 setTag:v10];
  uint64_t v11 = [v9 item];

  double v13 = a1[5];
  double v12 = a1[6];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v17[3] = &unk_1E5DB9820;
  id v18 = v7;
  id v19 = v8;
  uint64_t v20 = v10;
  uint64_t v21 = v11;
  double v14 = a1[4];
  id v15 = v8;
  id v16 = v7;
  objc_msgSend(v15, "requestImageForItemAtIndex:targetSize:displayScale:imageBlock:", v11, v17, v14, v13, v12);
}

void __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tag];
  if (result == *(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRejected:", objc_msgSend(*(id *)(a1 + 40), "isIndexRejected:", *(void *)(a1 + 64)));
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    double v5 = *(double *)(a1 + 72);
    double v6 = *(double *)(a1 + 80);
    double v7 = *(double *)(a1 + 88);
    double v8 = *(double *)(a1 + 96);
    return objc_msgSend(v3, "setImage:contentsRect:", v4, v5, v6, v7, v8);
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PXPeopleRecoCollectionViewController *)self dataSource];
  int64_t v5 = [v4 numberOfItems];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewController;
  [(PXPeopleRecoCollectionViewController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [(PXPeopleRecoCollectionViewController *)self navigationController];
  [v4 setToolbarHidden:1 animated:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewController;
  [(PXPeopleRecoCollectionViewController *)&v5 viewWillAppear:a3];
  uint64_t v4 = [(PXPeopleRecoCollectionViewController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleRecoCollectionViewController;
  [(PXPeopleRecoCollectionViewController *)&v16 viewDidLoad];
  id v3 = [(PXPeopleRecoCollectionViewController *)self collectionView];
  uint64_t v4 = [PXPeopleRecoCollectionView alloc];
  [v3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [v3 collectionViewLayout];
  double v14 = -[PXPeopleRecoCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);

  [(PXPeopleRecoCollectionView *)v14 setRecoCollectionViewDelegate:self];
  id v15 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PXPeopleRecoCollectionView *)v14 setBackgroundColor:v15];

  [(PXPeopleRecoCollectionView *)v14 setPrefetchDataSource:self];
  [(PXPeopleRecoCollectionView *)v14 setContentInsetAdjustmentBehavior:3];
  [(PXPeopleRecoCollectionViewController *)self setCollectionView:v14];
}

- (id)_initWithPerson:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleRecoCollectionViewController;
  double v6 = [(PXPeopleRecoCollectionViewController *)&v17 initWithCollectionViewLayout:v5];

  if (v6)
  {
    double v7 = [[PXPeopleRecoDataSource alloc] initWithPerson:v4 dataSourceDelegate:v6];
    dataSource = v6->_dataSource;
    v6->_dataSource = v7;

    double v9 = (void *)MEMORY[0x1E4FB15F8];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x1E4FB2770];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PXPeopleRecoCollectionViewController__initWithPerson___block_invoke;
    v15[3] = &unk_1E5DB97D0;
    id v16 = v4;
    uint64_t v12 = [v9 registrationWithSupplementaryClass:v10 elementKind:v11 configurationHandler:v15];
    headerRegistration = v6->_headerRegistration;
    v6->_headerRegistration = (UICollectionViewSupplementaryRegistration *)v12;
  }
  return v6;
}

void __56__PXPeopleRecoCollectionViewController__initWithPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v3, "px_localizedName");
  uint64_t v6 = [v5 length];
  double v7 = *(void **)(a1 + 32);
  if (v6)
  {
    double v8 = PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, @"PXPeopleImproveRecoHeaderNamed");
    double v9 = v5;
    PXStringWithValidatedFormat();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, @"PXPeopleImproveRecoHeaderUnnamed");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setTitle:", v10, v9);
}

+ (id)recoControllerForPerson:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [[PXPeopleRecoCollectionViewController alloc] _initWithPerson:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v5 setToolbarHidden:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v9 = PXLocalizedStringFromTable(@"PXPeopleImproveRecoReviewMore", @"PhotosUICore");
  id v10 = (void *)[v8 initWithTitle:v9 style:0 target:v4 action:sel__reviewMoreTapped_];

  v21[0] = v6;
  v21[1] = v10;
  v21[2] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  [v4 setToolbarItems:v11];

  id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v13 = PXLocalizedStringFromTable(@"PXPeopleImproveRecoCancel", @"PhotosUICore");
  double v14 = (void *)[v12 initWithTitle:v13 style:0 target:v4 action:sel__cancelTapped_];

  id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v16 = PXLocalizedStringFromTable(@"PXPeopleImproveRecoDone", @"PhotosUICore");
  objc_super v17 = (void *)[v15 initWithTitle:v16 style:2 target:v4 action:sel__doneTapped_];

  id v18 = [v4 navigationItem];
  [v18 setLeftBarButtonItem:v14];
  [v18 setRightBarButtonItem:v17];
  id v19 = PXLocalizedStringFromTable(@"PXPeopleImproveRecoHeaderTitle", @"PhotosUICore");
  [v18 setTitle:v19];

  return v5;
}

@end