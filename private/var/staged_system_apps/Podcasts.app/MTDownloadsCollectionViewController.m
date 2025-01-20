@interface MTDownloadsCollectionViewController
+ (id)defaultViewControllerWithLibraryActionControllerBridge:(id)a3;
- (BOOL)isVisible;
- (CGSize)calculatedCellSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTDownloadsCollectionViewController)initWithCollectionViewLayout:(id)a3 libraryActionControllerBridge:(id)a4;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge)libraryActionControllerBridge;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_downloadDataSource;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)episodeForDownloadAtIndex:(unint64_t)a3;
- (id)metricsName;
- (id)tabBarItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)calculateCellWidth:(double)a3;
- (void)cancelDownloads:(id)a3;
- (void)cellDidPressDelete:(id)a3;
- (void)cellDidPressToggleDownload:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)configureBarButtonItems;
- (void)configureCell:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
- (void)done:(id)a3;
- (void)downloadManagerDidAddDownload:(id)a3;
- (void)downloadManagerDidRemoveDownloads:(id)a3;
- (void)downloadManagerDidUpdateDownload:(id)a3;
- (void)downloadManagerWillRemoveDownload:(id)a3;
- (void)setCalculatedCellSize:(CGSize)a3;
- (void)setLibraryActionControllerBridge:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)sizeCategoryChanged:(id)a3;
- (void)toggleDownloadForIndex:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)tuckHeader;
- (void)updateCellSizes;
- (void)updateDownloadCount;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTDownloadsCollectionViewController

- (MTDownloadsCollectionViewController)initWithCollectionViewLayout:(id)a3 libraryActionControllerBridge:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTDownloadsCollectionViewController;
  v7 = [(MTDownloadsCollectionViewController *)&v13 initWithCollectionViewLayout:a3];
  v8 = v7;
  if (v7)
  {
    [(MTDownloadsCollectionViewController *)v7 setLibraryActionControllerBridge:v6];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v8 selector:"sizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(MTDownloadsCollectionViewController *)v8 updateDownloadCount];
    v10 = +[MTLegacyDownloadManagerProvider sharedInstance];
    v11 = [v10 downloadsNotifier];
    [v11 registerForUpdates:v8];
  }
  return v8;
}

- (id)_downloadDataSource
{
  v2 = +[MTLegacyDownloadManagerProvider sharedInstance];
  v3 = [v2 downloadManager];

  return v3;
}

+ (id)defaultViewControllerWithLibraryActionControllerBridge:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MTDownloadsCollectionViewFlowLayout);
  v5 = [[MTDownloadsCollectionViewController alloc] initWithCollectionViewLayout:v4 libraryActionControllerBridge:v3];

  return v5;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v23 viewDidLoad];
  id v3 = [(MTDownloadsCollectionViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  objc_super v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Downloads" value:&stru_10056A8A0 table:0];
  [(MTDownloadsCollectionViewController *)self setTitle:v5];

  id v6 = [MTDownloadsCollectionView alloc];
  v7 = [(MTDownloadsCollectionViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(MTDownloadsCollectionViewController *)self collectionViewLayout];
  v17 = -[MTDownloadsCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v16, v9, v11, v13, v15);
  [(MTDownloadsCollectionViewController *)self setCollectionView:v17];

  v18 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v18 setPreservesSuperviewLayoutMargins:1];

  v19 = [(MTDownloadsCollectionViewController *)self collectionView];
  uint64_t v20 = objc_opt_class();
  v21 = +[MTGenericCollectionCell reuseIdentifier];
  [v19 registerClass:v20 forCellWithReuseIdentifier:v21];

  v22 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v22 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DownloadHeader"];

  [(MTDownloadsCollectionViewController *)self configureBarButtonItems];
  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v4 viewWillAppear:a3];
  [(MTDownloadsCollectionViewController *)self setVisible:1];
  [(MTDownloadsCollectionViewController *)self configureBarButtonItems];
  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTDownloadsCollectionViewController *)self setVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v3 frame];
  double v5 = v4;

  [(MTDownloadsCollectionViewController *)self calculateCellWidth:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTDownloadsCollectionViewController;
  id v7 = a4;
  -[MTDownloadsCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [(MTDownloadsCollectionViewController *)self calculateCellWidth:width];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CBEFC;
  v8[3] = &unk_10054E878;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTDownloadsCollectionViewController;
  [(MTDownloadsCollectionViewController *)&v7 traitCollectionDidChange:v4];
  double v5 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v5 bounds];
  double Width = CGRectGetWidth(v8);

  [(MTDownloadsCollectionViewController *)self calculateCellWidth:Width];
  [(MTDownloadsCollectionViewController *)self configureBarButtonItems];
  if ([(MTDownloadsCollectionViewController *)self isHorizontallyCompact]
    && [v4 horizontalSizeClass] != (id)1)
  {
    [(MTDownloadsCollectionViewController *)self tuckHeader];
  }
}

- (id)tabBarItem
{
  tabBarItem = self->_tabBarItem;
  if (!tabBarItem)
  {
    id v4 = +[UIImage imageNamed:@"UITabBarDownloads"];
    double v5 = [v4 imageWithRenderingMode:2];

    objc_super v6 = [@"UITabBarDownloads" stringByAppendingString:@"Selected"];
    objc_super v7 = +[UIImage imageNamed:v6];
    CGRect v8 = [v7 imageWithRenderingMode:2];

    objc_super v9 = +[NSBundle mainBundle];
    double v10 = [v9 localizedStringForKey:@"Downloads" value:&stru_10056A8A0 table:0];

    double v11 = (UITabBarItem *)[objc_alloc((Class)UITabBarItem) initWithTitle:v10 image:v5 selectedImage:v8];
    double v12 = self->_tabBarItem;
    self->_tabBarItem = v11;

    [(UITabBarItem *)self->_tabBarItem setTag:1685548132];
    tabBarItem = self->_tabBarItem;
  }

  return tabBarItem;
}

- (void)setCalculatedCellSize:(CGSize)a3
{
  if (self->_calculatedCellSize.width != a3.width || self->_calculatedCellSize.height != a3.height)
  {
    self->_calculatedCellSize = a3;
    double v5 = [(MTDownloadsCollectionViewController *)self collectionViewLayout];
    [v5 invalidateLayout];

    id v6 = [(MTDownloadsCollectionViewController *)self collectionView];
    [v6 reloadData];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v5 = [v4 numberOfDownloads];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGRect v8 = +[MTGenericCollectionCell reuseIdentifier];
  objc_super v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  id v10 = [v6 row];
  [(MTDownloadsCollectionViewController *)self configureCell:v9 atIndex:v10];

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return [a3 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DownloadHeader" forIndexPath:a5];
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  [a4 cancelAllButton:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 addTarget:self action:"cancelDownloads:" forControlEvents:64];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  [a4 cancelAllButton:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 removeTarget:self action:"cancelDownloads:" forControlEvents:64];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(MTDownloadsCollectionViewController *)self calculatedCellSize];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = a3;
  if ([(MTDownloadsCollectionViewController *)self isHorizontallyCompact])
  {
    [v6 bounds];
    CGFloat Width = CGRectGetWidth(v12);
    CGFloat height = 44.0;
  }
  else
  {
    CGFloat Width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v9 = Width;
  double v10 = height;
  result.CGFloat height = v10;
  result.double width = v9;
  return result;
}

- (void)downloadManagerDidAddDownload:(id)a3
{
  id v4 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v4 reloadData];

  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)downloadManagerWillRemoveDownload:(id)a3
{
  id v4 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v5 = [v4 numberOfDownloads];

  if (!v5)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"done:" object:0];
    [(MTDownloadsCollectionViewController *)self performSelector:"done:" withObject:0 afterDelay:1.0];
  }
  id v6 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v6 reloadData];

  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)downloadManagerDidRemoveDownloads:(id)a3
{
  id v4 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v5 = [v4 numberOfDownloads];

  if (!v5)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"done:" object:0];
    [(MTDownloadsCollectionViewController *)self performSelector:"done:" withObject:0 afterDelay:1.0];
  }
  id v6 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v6 reloadData];

  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)downloadManagerDidUpdateDownload:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
    id v5 = [v4 indexForDownload:v9];

    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = +[NSIndexPath indexPathForRow:v5 inSection:0];
      double v7 = [(MTDownloadsCollectionViewController *)self collectionView];
      double v8 = [v7 cellForItemAtIndexPath:v6];

      [(MTDownloadsCollectionViewController *)self configureCell:v8 atIndex:v5];
    }
  }
  [(MTDownloadsCollectionViewController *)self updateDownloadCount];
}

- (void)cellDidPressDelete:(id)a3
{
  id v4 = a3;
  id v5 = [(MTDownloadsCollectionViewController *)self collectionView];
  id v9 = [v5 indexPathForCell:v4];

  id v6 = -[MTDownloadsCollectionViewController episodeForDownloadAtIndex:](self, "episodeForDownloadAtIndex:", [v9 row]);
  if (v6)
  {
    double v7 = [(MTDownloadsCollectionViewController *)self libraryActionControllerBridge];
    double v8 = [v6 uuid];
    [v7 cancelDownloadForEpisodeUuid:v8];
  }
}

- (void)cellDidPressToggleDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(MTDownloadsCollectionViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  [(MTDownloadsCollectionViewController *)self toggleDownloadForIndex:v6];
}

- (id)episodeForDownloadAtIndex:(unint64_t)a3
{
  id v5 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v6 = [v5 numberOfDownloads];

  if ((unint64_t)v6 <= a3)
  {
    CGRect v12 = 0;
  }
  else
  {
    double v7 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
    double v8 = [v7 downloadAtIndex:a3];

    if (v8)
    {
      id v9 = +[MTDB sharedInstance];
      double v10 = [v9 mainQueueContext];

      double v11 = [v8 episodeUuid];
      CGRect v12 = [v10 episodeForUuid:v11];
    }
    else
    {
      CGRect v12 = 0;
    }
  }

  return v12;
}

- (void)cancelDownloads:(id)a3
{
  id v3 = [(MTDownloadsCollectionViewController *)self libraryActionControllerBridge];
  [v3 cancelAllDownloadsUserInitiated:1];
}

- (void)updateDownloadCount
{
  id v3 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v4 = [v3 numberOfDownloads];

  if (v4)
  {
    id v5 = +[NSNumber numberWithUnsignedInteger:v4];
    IMAccessibilityLocalizedNumber();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  id v6 = [(MTDownloadsCollectionViewController *)self tabBarItem];
  [v6 setBadgeValue:v9];

  double v7 = [(MTDownloadsCollectionViewController *)self navigationController];
  double v8 = [v7 tabBarItem];
  [v8 setBadgeValue:v9];
}

- (void)toggleDownloadForIndex:(id)a3
{
  -[MTDownloadsCollectionViewController episodeForDownloadAtIndex:](self, "episodeForDownloadAtIndex:", [a3 row]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v4 = [(MTDownloadsCollectionViewController *)self libraryActionControllerBridge];
    id v5 = [v6 uuid];
    [v4 resumeOrPauseEpisodeDownloadWithUuid:v5];
  }
}

- (void)calculateCellWidth:(double)a3
{
  double v3 = a3;
  if (a3 >= 703.0)
  {
    +[MTGenericCollectionCell preferredContentWidth];
    double v3 = floor(v3 / (double)(unint64_t)ceil(v3 / v5));
  }
  +[MTGenericCollectionCell heightForWidth:v3];

  -[MTDownloadsCollectionViewController setCalculatedCellSize:](self, "setCalculatedCellSize:", v3, v6);
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v10 = a3;
  double v6 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
  id v7 = [v6 numberOfDownloads];

  if ((unint64_t)v7 > a4)
  {
    double v8 = [(MTDownloadsCollectionViewController *)self _downloadDataSource];
    id v9 = [v8 downloadAtIndex:a4];

    [v10 updateWithObject:v9];
  }
}

- (void)configureBarButtonItems
{
  if ([(MTDownloadsCollectionViewController *)self isHorizontallyRegular])
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    id v4 = +[NSBundle mainBundle];
    double v5 = [v4 localizedStringForKey:@"Cancel All" value:&stru_10056A8A0 table:0];
    id v12 = [v3 initWithTitle:v5 style:2 target:self action:"cancelDownloads:"];
  }
  else
  {
    id v12 = 0;
  }
  double v6 = [(MTDownloadsCollectionViewController *)self navigationController];
  id v7 = [v6 presentingViewController];

  double v8 = [(MTDownloadsCollectionViewController *)self navigationItem];
  id v9 = v8;
  if (v7)
  {
    [v8 setLeftBarButtonItem:v12];

    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"done:"];
    double v11 = [(MTDownloadsCollectionViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v10];
  }
  else
  {
    [v8 setRightBarButtonItem:v12];

    id v10 = [(MTDownloadsCollectionViewController *)self navigationItem];
    [v10 setLeftBarButtonItem:0];
  }
}

- (void)tuckHeader
{
  id v3 = [(MTDownloadsCollectionViewController *)self collectionView];
  id v4 = [(MTDownloadsCollectionViewController *)self collectionViewLayout];
  [(MTDownloadsCollectionViewController *)self collectionView:v3 layout:v4 referenceSizeForHeaderInSection:0];
  double v6 = v5;

  id v7 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v7 adjustedContentInset];
  double v9 = v8;

  id v10 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v10 setContentOffset:0, 0.0, v6 - v9];
}

- (void)sizeCategoryChanged:(id)a3
{
}

- (void)updateCellSizes
{
  id v3 = [(MTDownloadsCollectionViewController *)self collectionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v6);

  [(MTDownloadsCollectionViewController *)self calculateCellWidth:Width];
}

- (void)done:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"done:" object:0];
  id v4 = self;
  if (v4)
  {
    while (1)
    {
      v19 = v4;
      double v5 = [(MTDownloadsCollectionViewController *)v4 presentingViewController];

      if (v5)
      {
        double v13 = [(MTDownloadsCollectionViewController *)v19 presentingViewController];
        [v13 dismissViewControllerAnimated:1 completion:0];

        goto LABEL_13;
      }
      CGRect v6 = [(MTDownloadsCollectionViewController *)v19 navigationController];
      if (v6)
      {
        id v7 = [(MTDownloadsCollectionViewController *)v19 navigationController];
        double v8 = [v7 viewControllers];
        if ((unint64_t)[v8 count] <= 1)
        {
        }
        else
        {
          double v9 = [(MTDownloadsCollectionViewController *)v19 navigationController];
          id v10 = [v9 viewControllers];
          id v11 = [v10 indexOfObject:v19];

          if (v11)
          {
            double v14 = [(MTDownloadsCollectionViewController *)v19 navigationController];
            double v15 = [v14 viewControllers];

            v16 = [v15 objectAtIndex:[v15 indexOfObject:v19] - 1];
            v17 = [(MTDownloadsCollectionViewController *)v19 navigationController];
            id v18 = [v17 popToViewController:v16 animated:1];

            goto LABEL_13;
          }
        }
      }
      if (objc_opt_respondsToSelector()) {
        break;
      }
      uint64_t v12 = [(MTDownloadsCollectionViewController *)v19 parentViewController];

      id v4 = (MTDownloadsCollectionViewController *)v12;
      if (!v12) {
        return;
      }
    }
    [(MTDownloadsCollectionViewController *)v19 performSelector:"showDefaultDetailsWithCompletion:" withObject:0];
LABEL_13:
  }
}

- (id)metricsName
{
  return @"Downloads";
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CGSize)calculatedCellSize
{
  double width = self->_calculatedCellSize.width;
  double height = self->_calculatedCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge)libraryActionControllerBridge
{
  return self->_libraryActionControllerBridge;
}

- (void)setLibraryActionControllerBridge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryActionControllerBridge, 0);

  objc_storeStrong((id *)&self->_tabBarItem, 0);
}

@end