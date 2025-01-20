@interface UGCMorePhotosFeedViewController
- (BOOL)shouldCancelImageDownloads;
- (BOOL)shouldShowAddPhotosButton;
- (BOOL)shouldShowFloatingButtons;
- (BOOL)supportsPhotoAlbums;
- (ErrorModeView)errorModeView;
- (GEOMapItemPhotoOptions)thumbnailOptionsForMorePhotosFeed;
- (LoadingModeView)loadingModeView;
- (MKMapItem)mapItem;
- (NSArray)photoList;
- (NSString)downloadToken;
- (UGCMorePhotosFeedViewController)initWithMapItem:(id)a3;
- (UGCMorePhotosFeedViewControllerDelegate)delegate;
- (double)_scaledGradientHeight;
- (id)_thumbnailGalleryLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (id)imageViewForIndex:(unint64_t)a3;
- (id)keyCommands;
- (id)userUploadDataProviderForDataSource:(id)a3;
- (unint64_t)selectedAlbumIndex;
- (unint64_t)startingImageIndex;
- (void)_attachErrorView;
- (void)_captureUserAction:(int)a3;
- (void)_captureUserAction:(int)a3 index:(unint64_t)a4;
- (void)_captureUserAction:(int)a3 value:(id)a4;
- (void)_doneButtonPressed;
- (void)_handleScrollDown;
- (void)_handleScrollUp;
- (void)_updateHeaderIfNeeded;
- (void)_updateHeaderViewWithTitleText:(id)a3 subtitleText:(id)a4 options:(unint64_t)a5;
- (void)_updateSnapshotForCurrentState;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)photoFeedHeaderView:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5;
- (void)photoFeedHeaderView:(id)a3 selectedDoneWithPresentationOptions:(id)a4;
- (void)photoViewerDataSourceDidUpdate:(id)a3;
- (void)photoViewerDataSourceDidUpdate:(id)a3 withError:(id)a4;
- (void)scrollToPhotoAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)scrollableSegmentedPickerView:(id)a3 didChangeSelectedIndex:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setPhotoList:(id)a3;
- (void)setSelectedAlbumIndex:(unint64_t)a3;
- (void)setStartingImageIndex:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation UGCMorePhotosFeedViewController

- (NSString)downloadToken
{
  downloadToken = self->_downloadToken;
  if (!downloadToken)
  {
    v4 = +[UGCPhotoDownloadManager generateRandomizedDownloadTokenForClass:objc_opt_class()];
    v5 = self->_downloadToken;
    self->_downloadToken = v4;

    downloadToken = self->_downloadToken;
  }

  return downloadToken;
}

- (GEOMapItemPhotoOptions)thumbnailOptionsForMorePhotosFeed
{
  if (qword_1016103E0 != -1) {
    dispatch_once(&qword_1016103E0, &stru_101313A60);
  }
  v2 = (void *)qword_1016103D8;

  return (GEOMapItemPhotoOptions *)v2;
}

- (BOOL)shouldShowFloatingButtons
{
  return sub_1000BBB44(self) != 5;
}

- (BOOL)shouldShowAddPhotosButton
{
  return [(UGCPhotoViewerDataSource *)self->_dataSource isAllowedToShowAddPhotosCallToAction];
}

- (BOOL)supportsPhotoAlbums
{
  dataSource = self->_dataSource;
  if (dataSource) {
    LOBYTE(dataSource) = [(UGCPhotoViewerDataSource *)dataSource numberOfCategories] > 1;
  }
  return (char)dataSource;
}

- (void)viewDidLoad
{
  v120.receiver = self;
  v120.super_class = (Class)UGCMorePhotosFeedViewController;
  [(UGCMorePhotosFeedViewController *)&v120 viewDidLoad];
  [(UGCPhotoViewerDataSource *)self->_dataSource setActive:1];
  id v3 = objc_alloc((Class)UICollectionView);
  v4 = [(UGCMorePhotosFeedViewController *)self _thumbnailGalleryLayout];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height collectionViewLayout:v4];
  collectionView = self->_collectionView;
  self->_collectionView = v8;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setBounces:1];
  [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
  [(UICollectionView *)self->_collectionView setAutomaticallyAdjustsScrollIndicatorInsets:0];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  v10 = +[UIColor systemBackgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v10];

  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"PhotosFeedCollectionView"];
  id v11 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v12 = self->_collectionView;
  v13 = sub_10001CBB8(self);
  v14 = (UICollectionViewDiffableDataSource *)[v11 initWithCollectionView:v12 cellProvider:v13];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v14;

  if ([(UGCMorePhotosFeedViewController *)self shouldShowFloatingButtons])
  {
    if ([(UGCMorePhotosFeedViewController *)self shouldShowAddPhotosButton]) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = [[UGCPhotoFeedHeaderView alloc] initWithOptions:v16];
  headerGradientView = self->_headerGradientView;
  self->_headerGradientView = v17;

  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setPreservesSuperviewLayoutMargins:1];
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setDelegate:self];
  v19 = +[UIColor blackColor];
  uint64_t v20 = [v19 colorWithAlphaComponent:0.42];

  v21 = +[UIColor blackColor];
  uint64_t v22 = [v21 colorWithAlphaComponent:0.4];

  v23 = +[UIColor blackColor];
  uint64_t v24 = [v23 colorWithAlphaComponent:0.13];

  v25 = +[UIColor blackColor];
  uint64_t v26 = [v25 colorWithAlphaComponent:0.0];

  v116 = (void *)v22;
  v117 = (void *)v20;
  v124[0] = v20;
  v124[1] = v22;
  v114 = (void *)v26;
  v115 = (void *)v24;
  v124[2] = v24;
  v124[3] = v26;
  v27 = +[NSArray arrayWithObjects:v124 count:4];
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setColors:v27];

  v123[0] = &off_1013AF758;
  v123[1] = &off_1013AF528;
  v123[2] = &off_1013AF538;
  v123[3] = &off_1013AF768;
  v28 = +[NSArray arrayWithObjects:v123 count:4];
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setLocations:v28];

  if ([(UGCPhotoViewerDataSource *)self->_dataSource numberOfCategories] >= 2)
  {
    v29 = [objc_alloc((Class)MUScrollableSegmentedPickerView) initWithFrame:CGRectZero.origin.x, y, width, height];
    albumFilterView = self->_albumFilterView;
    self->_albumFilterView = v29;

    [(MUScrollableSegmentedPickerView *)self->_albumFilterView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = [(UGCPhotoViewerDataSource *)self->_dataSource albumCategories];
    v32 = sub_100099700(v31, &stru_101313AA0);
    [(MUScrollableSegmentedPickerView *)self->_albumFilterView setViewModels:v32];

    [(MUScrollableSegmentedPickerView *)self->_albumFilterView setSelectedIndex:[(UGCMorePhotosFeedViewController *)self selectedAlbumIndex]];
    [(MUScrollableSegmentedPickerView *)self->_albumFilterView setDelegate:self];
  }
  v33 = [LoadingModeView alloc];
  v34 = +[NSBundle mainBundle];
  v35 = [v34 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
  v36 = [(LoadingModeView *)v33 initWithTitle:v35];
  loadingModeView = self->_loadingModeView;
  self->_loadingModeView = v36;

  [(LoadingModeView *)self->_loadingModeView setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = objc_alloc_init(ErrorModeView);
  errorModeView = self->_errorModeView;
  self->_errorModeView = v38;

  [(ErrorModeView *)self->_errorModeView setTranslatesAutoresizingMaskIntoConstraints:0];
  v40 = [(UGCMorePhotosFeedViewController *)self view];
  [v40 setAccessibilityIdentifier:@"PhotosFeedView"];
  [v40 addSubview:self->_collectionView];
  [v40 addSubview:self->_loadingModeView];
  v118 = v40;
  [v40 addSubview:self->_headerGradientView];
  if ([(UGCMorePhotosFeedViewController *)self supportsPhotoAlbums]) {
    [v40 addSubview:self->_albumFilterView];
  }
  v41 = self->_collectionView;
  uint64_t v42 = objc_opt_class();
  v43 = +[UGCPhotoThumbnailCollectionViewCell reuseIdentifier];
  [(UICollectionView *)v41 registerClass:v42 forCellWithReuseIdentifier:v43];

  v44 = self->_collectionView;
  uint64_t v45 = objc_opt_class();
  v46 = +[MKCollectionBatchCell reuseIdentifier];
  [(UICollectionView *)v44 registerClass:v45 forCellWithReuseIdentifier:v46];

  v47 = [(UGCPhotoFeedHeaderView *)self->_headerGradientView heightAnchor];
  [(UGCMorePhotosFeedViewController *)self _scaledGradientHeight];
  [v47 constraintEqualToConstant:];
  v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  gradientHeightConstraint = self->_gradientHeightConstraint;
  self->_gradientHeightConstraint = v48;

  id v119 = objc_alloc_init((Class)NSMutableArray);
  v110 = [(UICollectionView *)self->_collectionView topAnchor];
  v112 = [(UGCMorePhotosFeedViewController *)self view];
  v108 = [v112 topAnchor];
  v106 = [v110 constraintEqualToAnchor:v108];
  v122[0] = v106;
  v104 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v105 = [(UGCMorePhotosFeedViewController *)self view];
  v103 = [v105 leadingAnchor];
  v102 = [v104 constraintEqualToAnchor:v103];
  v122[1] = v102;
  v100 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v101 = [(UGCMorePhotosFeedViewController *)self view];
  v99 = [v101 trailingAnchor];
  v98 = [v100 constraintEqualToAnchor:v99];
  v122[2] = v98;
  v96 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v97 = [(UGCMorePhotosFeedViewController *)self view];
  v95 = [v97 bottomAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v122[3] = v94;
  v92 = [(LoadingModeView *)self->_loadingModeView topAnchor];
  v93 = [(UGCMorePhotosFeedViewController *)self view];
  v91 = [v93 topAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v122[4] = v90;
  v88 = [(LoadingModeView *)self->_loadingModeView leadingAnchor];
  v89 = [(UGCMorePhotosFeedViewController *)self view];
  v87 = [v89 leadingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v122[5] = v86;
  v84 = [(LoadingModeView *)self->_loadingModeView trailingAnchor];
  v85 = [(UGCMorePhotosFeedViewController *)self view];
  v83 = [v85 trailingAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v122[6] = v82;
  v80 = [(LoadingModeView *)self->_loadingModeView bottomAnchor];
  v81 = [(UGCMorePhotosFeedViewController *)self view];
  v79 = [v81 bottomAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v122[7] = v78;
  v76 = [(UGCPhotoFeedHeaderView *)self->_headerGradientView topAnchor];
  v77 = [(UGCMorePhotosFeedViewController *)self view];
  v75 = [v77 topAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v122[8] = v74;
  v72 = [(UGCPhotoFeedHeaderView *)self->_headerGradientView leadingAnchor];
  v73 = [(UGCMorePhotosFeedViewController *)self view];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v122[9] = v70;
  v50 = [(UGCPhotoFeedHeaderView *)self->_headerGradientView trailingAnchor];
  v51 = [(UGCMorePhotosFeedViewController *)self view];
  v52 = [v51 trailingAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  v122[10] = v53;
  v54 = [(UGCPhotoFeedHeaderView *)self->_headerGradientView bottomAnchor];
  v55 = [(UGCMorePhotosFeedViewController *)self view];
  v56 = [v55 bottomAnchor];
  v57 = [v54 constraintLessThanOrEqualToAnchor:v56];
  v58 = self->_gradientHeightConstraint;
  v122[11] = v57;
  v122[12] = v58;
  v59 = +[NSArray arrayWithObjects:v122 count:13];
  [v119 addObjectsFromArray:v59];

  if ([(UGCMorePhotosFeedViewController *)self supportsPhotoAlbums])
  {
    v111 = [(MUScrollableSegmentedPickerView *)self->_albumFilterView leadingAnchor];
    v113 = [v118 layoutMarginsGuide];
    v109 = [v113 leadingAnchor];
    v107 = [v111 constraintEqualToAnchor:v109];
    v121[0] = v107;
    v60 = [(MUScrollableSegmentedPickerView *)self->_albumFilterView trailingAnchor];
    v61 = [v118 layoutMarginsGuide];
    v62 = [v61 trailingAnchor];
    v63 = [v60 constraintEqualToAnchor:v62];
    v121[1] = v63;
    v64 = [(MUScrollableSegmentedPickerView *)self->_albumFilterView bottomAnchor];
    v65 = [v118 layoutMarginsGuide];
    v66 = [v65 bottomAnchor];
    v67 = [v64 constraintEqualToAnchor:v66 constant:-8.0];
    v121[2] = v67;
    v68 = +[NSArray arrayWithObjects:v121 count:3];
    [v119 addObjectsFromArray:v68];
  }
  id v69 = [v119 copy];
  +[NSLayoutConstraint activateConstraints:v69];

  [(UGCPhotoViewerDataSource *)self->_dataSource setAlbumIndex:[(UGCMorePhotosFeedViewController *)self selectedAlbumIndex]];
  [(UGCPhotoViewerDataSource *)self->_dataSource setIndexOfTappedPhoto:[(UGCMorePhotosFeedViewController *)self startingImageIndex]];
  [(UGCMorePhotosFeedViewController *)self _updateHeaderIfNeeded];
  [(UGCPhotoViewerDataSource *)self->_dataSource fetchNextBatchRequestIfNeeded];
}

- (void)_attachErrorView
{
  [(LoadingModeView *)self->_loadingModeView removeFromSuperview];
  errorModeView = self->_errorModeView;
  v4 = +[UGCErrorStringBuilder buildBestErrorStringForCurrentNetworkState];
  [(ErrorModeView *)errorModeView setTitle:&stru_101324E70 andMessage:v4];

  v5 = [(UGCMorePhotosFeedViewController *)self view];
  [v5 insertSubview:self->_errorModeView aboveSubview:self->_collectionView];

  v6 = self->_errorModeView;
  id v8 = [(UGCMorePhotosFeedViewController *)self view];
  v7 = [(ErrorModeView *)v6 _maps_constraintsForCenteringInView:v8];
  +[NSLayoutConstraint activateConstraints:v7];
}

- (UGCMorePhotosFeedViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UGCMorePhotosFeedViewController;
  v6 = [(UGCMorePhotosFeedViewController *)&v15 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    uint64_t v8 = +[UGCPhotoDownloadManager sharedDownloadManager];
    photoDownloadManager = v7->_photoDownloadManager;
    v7->_photoDownloadManager = (UGCPhotoDownloadManager *)v8;

    v10 = [UGCPhotoViewerDataSource alloc];
    id v11 = [(UGCMorePhotosFeedViewController *)v7 mapItem];
    v12 = [(UGCPhotoViewerDataSource *)v10 initWithMapItem:v11 delegate:v7];
    dataSource = v7->_dataSource;
    v7->_dataSource = v12;

    v7->_shouldCancelImageDownloads = GEOConfigGetBOOL();
  }

  return v7;
}

- (id)_thumbnailGalleryLayout
{
  v2 = [(UGCMorePhotosFeedViewController *)self traitCollection];
  id v3 = +[UGCMorePhotosFeedLayoutBuilder thumbnailGalleryLayoutForTraitCollection:v2];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UGCMorePhotosFeedViewController;
  [(UGCMorePhotosFeedViewController *)&v16 traitCollectionDidChange:v4];
  id v5 = [v4 verticalSizeClass];
  v6 = [(UGCMorePhotosFeedViewController *)self traitCollection];
  if (v5 != [v6 verticalSizeClass])
  {

    goto LABEL_5;
  }
  id v7 = [v4 horizontalSizeClass];
  uint64_t v8 = [(UGCMorePhotosFeedViewController *)self traitCollection];
  id v9 = [v8 horizontalSizeClass];

  if (v7 != v9)
  {
LABEL_5:
    collectionView = self->_collectionView;
    id v11 = [(UGCMorePhotosFeedViewController *)self _thumbnailGalleryLayout];
    [(UICollectionView *)collectionView setCollectionViewLayout:v11];
  }
  v12 = [(UGCMorePhotosFeedViewController *)self traitCollection];
  v13 = [v12 preferredContentSizeCategory];
  v14 = [v4 preferredContentSizeCategory];
  uint64_t v15 = sub_1000E93B0(v13, v14);

  if (v15)
  {
    [(UGCMorePhotosFeedViewController *)self _scaledGradientHeight];
    -[NSLayoutConstraint setConstant:](self->_gradientHeightConstraint, "setConstant:");
  }
}

- (void)_updateHeaderIfNeeded
{
  if ([(UGCMorePhotosFeedViewController *)self shouldShowFloatingButtons])
  {
    if ([(UGCMorePhotosFeedViewController *)self shouldShowAddPhotosButton]) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(MKMapItem *)self->_mapItem _allPhotoAttributions];
  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Photos" value:@"localized string not found" table:0];

  if ([v4 count])
  {
    id v7 = +[MUPlacePhotoHeaderAttributionFormatter formattedHeaderStringForPhotoAttributions:v4];
    if ([v7 length])
    {
      uint64_t v8 = +[NSBundle mainBundle];
      id v9 = [v8 localizedStringForKey:@"Photos from %@" value:@"localized string not found" table:0];

      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = v6;
    }
  }
  else
  {
    id v28 = v6;
  }

  v10 = [(MKMapItem *)self->_mapItem name];
  unint64_t v11 = [(UGCPhotoViewerDataSource *)self->_dataSource totalNumberOfPhotosForCurrentDataProvider];
  id v12 = v10;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"%@ · %lu [Photo viewer header subtitle]" value:@"localized string not found" table:0];

  uint64_t v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12, v11);

  if (![(UGCMorePhotosFeedViewController *)self supportsPhotoAlbums])
  {
    v23 = self;
    id v24 = v28;
    id v25 = v15;
LABEL_19:
    [(UGCMorePhotosFeedViewController *)v23 _updateHeaderViewWithTitleText:v24 subtitleText:v25 options:v3];
    goto LABEL_20;
  }
  id v16 = [(MUScrollableSegmentedPickerView *)self->_albumFilterView selectedIndex];
  v17 = [(UGCPhotoViewerDataSource *)self->_dataSource albumCategories];
  id v18 = [v17 count];

  if (v16 >= v18
    || ([(UGCPhotoViewerDataSource *)self->_dataSource albumCategories],
        v19 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "objectAtIndexedSubscript:", -[MUScrollableSegmentedPickerView selectedIndex](self->_albumFilterView, "selectedIndex")), uint64_t v20 = objc_claimAutoreleasedReturnValue(), v19, !v20))
  {
    v23 = self;
    id v24 = v28;
    id v25 = v28;
    goto LABEL_19;
  }
  id v21 = [v20 categoryType];
  if ((unint64_t)v21 < 2)
  {
    id v22 = v28;
LABEL_26:
    id v27 = v15;
    goto LABEL_27;
  }
  if (v21 == (id)2)
  {
    uint64_t v26 = +[NSBundle mainBundle];
    id v22 = [v26 localizedStringForKey:@"Photos From You" value:@"localized string not found" table:0];

    goto LABEL_26;
  }
  id v22 = 0;
  id v27 = 0;
LABEL_27:
  [(UGCMorePhotosFeedViewController *)self _updateHeaderViewWithTitleText:v22 subtitleText:v27 options:v3];

LABEL_20:
}

- (void)_updateHeaderViewWithTitleText:(id)a3 subtitleText:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(UGCPhotoFeedHeaderTitleModel);
  [(UGCPhotoFeedHeaderTitleModel *)v10 setShowPunchoutSymbol:[(UGCPhotoViewerDataSource *)self->_dataSource isSingleVendorThatHasPhotosNeedingObfuscation]];
  [(UGCPhotoFeedHeaderTitleModel *)v10 setTitleText:v9];

  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setTitleModel:v10];
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setSubtitleText:v8];

  [(UGCPhotoFeedHeaderView *)self->_headerGradientView setOptions:a5];
}

- (double)_scaledGradientHeight
{
  [(UGCPhotoFeedHeaderView *)self->_headerGradientView heightForUnscaledHeight:200.0];
  return result;
}

- (void)photoFeedHeaderView:(id)a3 selectedDoneWithPresentationOptions:(id)a4
{
}

- (void)_doneButtonPressed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 photoThumbnailGalleryViewControllerDidSelectDone:self];
  }
}

- (void)photoFeedHeaderView:(id)a3 selectedAddPhotoWithEntryPoint:(int64_t)a4 usingPresentationOptions:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained photoThumbnailGalleryViewController:self selectedAddPhotosUsingEntryPoint:a4 presentationOptions:v8];
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"_doneButtonPressed"];
  char v5 = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  if ([a5 isEqual:@"LoadingCellIdentifier"])
  {
    v10 = +[MKCollectionBatchCell reuseIdentifier];
    id v11 = [v9 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v8];

    [v11 startedLoadingBatch];
  }
  else
  {
    id v12 = +[UGCPhotoThumbnailCollectionViewCell reuseIdentifier];
    v13 = [v9 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v8];

    v14 = [(UGCMorePhotosFeedViewController *)self photoList];
    id v15 = [v8 row];

    id v16 = [v14 objectAtIndex:v15];

    v17 = [(UGCMorePhotosFeedViewController *)self traitCollection];
    [v17 displayScale];
    double v19 = v18;

    uint64_t v20 = [v16 geoMapItemPhoto];
    [v13 frame];
    double v22 = v21;
    double v24 = v23;
    id v25 = [(UGCMorePhotosFeedViewController *)self thumbnailOptionsForMorePhotosFeed];
    uint64_t v26 = [v20 bestPhotoForFrameSize:v25 displayScale:v22 options:v24 v19];

    id v27 = [v16 photoID];
    [v13 setAssetIdentifier:v27];

    id v28 = +[UGCDownloadablePhotoInfoComposer downloadablePhotoForGeoMapItemPhotoInfo:v26];
    unsigned __int8 v29 = [v16 needsObfuscationWhenRenderedInFullScreen];
    v30 = [(UGCMorePhotosFeedViewController *)self mapItem];
    v31 = [v30 _allPhotoAttributions];
    id v32 = [v31 count];

    if (v32 == (id)1 || (v29 & 1) == 0)
    {
      [v13 setProviderName:0];
    }
    else
    {
      v33 = [v16 attribution];
      v34 = [v33 providerName];
      [v13 setProviderName:v34];
    }
    photoDownloadManager = self->_photoDownloadManager;
    v36 = [(UGCMorePhotosFeedViewController *)self downloadToken];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1009E5364;
    v41[3] = &unk_101313AC8;
    id v37 = v13;
    id v42 = v37;
    v43 = v16;
    id v38 = v16;
    [(UGCPhotoDownloadManager *)photoDownloadManager fetchImageForPhotoInfo:v28 downloadToken:v36 completion:v41];

    v39 = v43;
    id v11 = v37;
  }

  return v11;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    dataSource = self->_dataSource;
    [(UGCPhotoViewerDataSource *)dataSource fetchNextBatchRequestIfNeeded];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v20 = a4;
  id v7 = a5;
  if ([(UGCMorePhotosFeedViewController *)self shouldCancelImageDownloads])
  {
    id v8 = [v7 row];
    id v9 = [(UGCMorePhotosFeedViewController *)self photoList];
    id v10 = [v9 count];

    if (v8 < v10)
    {
      id v11 = [(UGCMorePhotosFeedViewController *)self photoList];
      id v12 = [v11 objectAtIndex:[v7 row]];

      v13 = [v12 geoMapItemPhoto];
      [v20 frame];
      id v16 = [v13 bestPhotoForSize:1 allowSmaller:v14, v15];

      v17 = +[UGCDownloadablePhotoInfoComposer downloadablePhotoForGeoMapItemPhotoInfo:v16];
      photoDownloadManager = self->_photoDownloadManager;
      double v19 = [(UGCMorePhotosFeedViewController *)self downloadToken];
      [(UGCPhotoDownloadManager *)photoDownloadManager cancelRequestForPhotoInfo:v17 downloadToken:v19];
    }
  }
}

- (void)_updateSnapshotForCurrentState
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [v3 appendSectionsWithIdentifiers:&off_1013AE3A0];
  id v4 = [(UGCMorePhotosFeedViewController *)self photoList];

  if (v4)
  {
    char v5 = [(UGCMorePhotosFeedViewController *)self photoList];
    [v3 appendItemsWithIdentifiers:v5];
  }
  if (![(UGCPhotoViewerDataSource *)self->_dataSource hasReachedTotalCount])
  {
    [v3 appendSectionsWithIdentifiers:&off_1013AE3B8];
    [v3 appendItemsWithIdentifiers:&off_1013AE3D0];
  }
  objc_initWeak(&location, self);
  diffableDataSource = self->_diffableDataSource;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009E58A0;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  [(UICollectionViewDiffableDataSource *)diffableDataSource applySnapshot:v3 animatingDifferences:1 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 row];
  id v14 = [v7 cellForItemAtIndexPath:v6];

  id v9 = [v6 row];
  [(UGCMorePhotosFeedViewController *)self _captureUserAction:6006 index:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = [(UGCMorePhotosFeedViewController *)self photoList];
  id v12 = [(UGCPhotoViewerDataSource *)self->_dataSource currentAlbumCategory];
  v13 = [v14 photoImageView];
  [WeakRetained photoThumbnailGalleryViewController:self selectedPhotoAtIndex:v8 photoList:v11 albumCategory:v12 imageViewForTransition:v13];
}

- (void)_captureUserAction:(int)a3
{
}

- (void)_captureUserAction:(int)a3 index:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = +[NSString stringWithFormat:@"%lu", a4];
  [(UGCMorePhotosFeedViewController *)self _captureUserAction:v4 value:v6];
}

- (void)_captureUserAction:(int)a3 value:(id)a4
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v7 = a3;
  if (y <= 0.0)
  {
    if (y >= 0.0) {
      goto LABEL_6;
    }
    id v8 = v7;
    [(UGCMorePhotosFeedViewController *)self _handleScrollUp];
  }
  else
  {
    id v8 = v7;
    [(UGCMorePhotosFeedViewController *)self _handleScrollDown];
  }
  id v7 = v8;
LABEL_6:
}

- (void)_handleScrollUp
{
}

- (void)_handleScrollDown
{
}

- (id)imageViewForIndex:(unint64_t)a3
{
  uint64_t v4 = +[NSIndexPath indexPathForRow:a3 inSection:0];
  char v5 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v4];
  id v6 = [v5 photoImageView];

  return v6;
}

- (void)scrollToPhotoAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSArray *)self->_photoList count] > a3)
  {
    collectionView = self->_collectionView;
    id v8 = +[NSIndexPath indexPathForRow:a3 inSection:0];
    [(UICollectionView *)collectionView scrollToItemAtIndexPath:v8 atScrollPosition:2 animated:v4];
  }
}

- (void)photoViewerDataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  char v5 = [v4 currentPhotoList];
  [(UGCMorePhotosFeedViewController *)self setPhotoList:v5];

  LODWORD(v5) = [v4 hasDataToShow];
  if (v5) {
    [(LoadingModeView *)self->_loadingModeView removeFromSuperview];
  }
  [(UGCMorePhotosFeedViewController *)self _updateHeaderIfNeeded];

  [(UGCMorePhotosFeedViewController *)self _updateSnapshotForCurrentState];
}

- (void)photoViewerDataSourceDidUpdate:(id)a3 withError:(id)a4
{
  if (([a3 hasDataToShow] & 1) == 0)
  {
    [(UGCMorePhotosFeedViewController *)self _attachErrorView];
  }
}

- (id)userUploadDataProviderForDataSource:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 userUploadedDataProviderForThumbnailGallery:self];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)scrollableSegmentedPickerView:(id)a3 didChangeSelectedIndex:(unint64_t)a4
{
  [(UGCPhotoViewerDataSource *)self->_dataSource setAlbumIndex:a4];
  char v5 = [(UGCPhotoViewerDataSource *)self->_dataSource currentPhotoList];
  [(UGCMorePhotosFeedViewController *)self setPhotoList:v5];

  [(UGCMorePhotosFeedViewController *)self _updateHeaderIfNeeded];
  if ([(UGCPhotoViewerDataSource *)self->_dataSource hasDataToShow])
  {
    [(UGCMorePhotosFeedViewController *)self _updateSnapshotForCurrentState];
  }
  else
  {
    dataSource = self->_dataSource;
    [(UGCPhotoViewerDataSource *)dataSource fetchNextBatchRequestIfNeeded];
  }
}

- (unint64_t)startingImageIndex
{
  return self->_startingImageIndex;
}

- (void)setStartingImageIndex:(unint64_t)a3
{
  self->_startingImageIndex = a3;
}

- (unint64_t)selectedAlbumIndex
{
  return self->_selectedAlbumIndex;
}

- (void)setSelectedAlbumIndex:(unint64_t)a3
{
  self->_selectedAlbumIndex = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (UGCMorePhotosFeedViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCMorePhotosFeedViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)photoList
{
  return self->_photoList;
}

- (void)setPhotoList:(id)a3
{
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (ErrorModeView)errorModeView
{
  return self->_errorModeView;
}

- (BOOL)shouldCancelImageDownloads
{
  return self->_shouldCancelImageDownloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_photoList, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_gradientHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoDownloadManager, 0);
  objc_storeStrong((id *)&self->_albumFilterView, 0);
  objc_storeStrong((id *)&self->_headerGradientView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

@end