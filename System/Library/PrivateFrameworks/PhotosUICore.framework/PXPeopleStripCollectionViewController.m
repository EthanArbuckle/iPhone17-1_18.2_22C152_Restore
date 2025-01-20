@interface PXPeopleStripCollectionViewController
+ (id)_formattedPeopleForMember:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (PXPeopleDataSource)dataSource;
- (PXPeopleStripCollectionViewCell)preloadedCell;
- (PXPeopleStripCollectionViewController)initWithDataSource:(id)a3 delegate:(id)a4;
- (PXPeopleStripCollectionViewControllerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)contentWidthChanged;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreloadedCell:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleStripCollectionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedCell, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPreloadedCell:(id)a3
{
}

- (PXPeopleStripCollectionViewCell)preloadedCell
{
  return self->_preloadedCell;
}

- (void)setDataSource:(id)a3
{
}

- (PXPeopleDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PXPeopleDataSource *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXPeopleStripCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleStripCollectionViewControllerDelegate *)WeakRetained;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v6 = [(PXPeopleStripCollectionViewController *)self collectionViewLayout];
  objc_msgSend(v6, "targetContentOffsetForProposedContentOffset:", x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [v8 dequeueReusableCellWithReuseIdentifier:@"PeopleStripFaceCell" forIndexPath:v7];
  double v10 = [(PXPeopleStripCollectionViewController *)self dataSource];
  unint64_t v11 = [v10 numberOfMembers];
  if (v11 <= [v7 item])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXPeopleStripCollectionViewController.m" lineNumber:167 description:@"excess the face collections boundary"];
  }
  double v12 = objc_msgSend(v10, "memberAtIndex:", objc_msgSend(v7, "item"));
  v13 = +[PXPeopleStripCollectionViewController _formattedPeopleForMember:v12];
  v14 = [v8 backgroundColor];

  [v9 setBackgroundColor:v14];
  [v9 setPeople:v13];

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(PXPeopleStripCollectionViewController *)self dataSource];
  int64_t v5 = [v4 numberOfMembers];

  return v5;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        unint64_t v11 = [(PXPeopleStripCollectionViewController *)self dataSource];
        id v12 = (id)objc_msgSend(v11, "memberAtIndex:", objc_msgSend(v10, "item"));

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)contentWidthChanged
{
  id v10 = [(PXPeopleStripCollectionViewController *)self delegate];
  [v10 sizeForItem];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(PXPeopleStripCollectionViewController *)self collectionViewLayout];
  [v10 minimumInteritemSpacing];
  *(float *)&double v8 = v8;
  [v7 setMinimumInteritemSpacing:floorf(*(float *)&v8)];
  [v10 minimumLineSpacing];
  *(float *)&double v9 = v9;
  [v7 setMinimumLineSpacing:floorf(*(float *)&v9)];
  objc_msgSend(v7, "setItemSize:", v4, v6);
  [v10 sectionInset];
  objc_msgSend(v7, "setSectionInset:");
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleStripCollectionViewController;
  [(PXPeopleStripCollectionViewController *)&v9 viewDidLoad];
  double v3 = [(PXPeopleStripCollectionViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PeopleStripFaceCell"];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 _setShouldPrefetchCellsWhenPerformingReloadData:1];
  [v3 _setIndicatorInsetAdjustmentBehavior:1];
  [v3 setPrefetchDataSource:self];
  [v3 setContentInsetAdjustmentBehavior:2];
  [v3 setFocusGroupIdentifier:0];
  [v3 setClipsToBounds:1];
  objc_initWeak(&location, self);
  double v5 = +[PXPreloadScheduler sharedScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PXPeopleStripCollectionViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v7, &location);
  [v5 scheduleMainQueueTask:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__PXPeopleStripCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    double v3 = [PXPeopleStripCollectionViewCell alloc];
    double v5 = -[PXPeopleStripCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PXPeopleStripCollectionViewCell *)v5 layoutIfNeeded];
    id v4 = objc_loadWeakRetained(v1);
    [v4 setPreloadedCell:v5];
  }
}

- (PXPeopleStripCollectionViewController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPeopleStripCollectionViewController.m" lineNumber:90 description:@"-initWithAssets:delegate: must have delegate"];
  }
  objc_super v9 = objc_alloc_init(PXPeopleCollectionViewLayout);
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleStripCollectionViewController;
  id v10 = [(PXPeopleStripCollectionViewController *)&v14 initWithCollectionViewLayout:v9];
  unint64_t v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_dataSource, v7);
    objc_storeWeak((id *)&v11->_delegate, v8);
    [(UICollectionViewFlowLayout *)v9 setScrollDirection:1];
    [(PXPeopleStripCollectionViewController *)v11 contentWidthChanged];
  }

  return v11;
}

+ (id)_formattedPeopleForMember:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:a1 file:@"PXPeopleStripCollectionViewController.m" lineNumber:193 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v7 = [v5 modelObject];
    long long v13 = v7;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    goto LABEL_9;
  }
  id v6 = v5;
  id v7 = +[PXPhotosDetailsSettings sharedInstance];
  if (![v7 peopleWidgetDisableSocialGroup])
  {
LABEL_9:

    goto LABEL_10;
  }
  unint64_t v8 = [v6 count];

  if (v8 >= 2)
  {
    objc_super v9 = [v6 firstObject];
    v15[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    id v6 = (id)v10;
  }
LABEL_10:

  return v6;
}

@end