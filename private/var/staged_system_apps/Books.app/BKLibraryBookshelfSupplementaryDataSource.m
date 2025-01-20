@interface BKLibraryBookshelfSupplementaryDataSource
- (BKCollection)collection;
- (BKLibraryBookshelfSupplementaryDataSource)init;
- (BKLibrarySortByMode)currentSortMode;
- (BOOL)canChangeViewMode;
- (BOOL)collectionIsSeries;
- (BOOL)fromActionMenu;
- (BOOL)hasSeriesSequenceLabel;
- (BOOL)hideTopSeparatorLine;
- (BOOL)isInDragSession;
- (BOOL)showCancelNavigationBarItem;
- (BOOL)storeReachable;
- (BOOL)supplementalContentPDFPicker;
- (NSArray)sortControlConfig;
- (NSMutableDictionary)templateCloudImages;
- (NSNumber)currentStoreAccountID;
- (NSString)actionMenuImageName;
- (NSString)cloudDownloadImageName;
- (NSString)cloudErrorImageName;
- (NSString)cloudUploadingImageName;
- (NSString)collectionDescription;
- (NSString)collectionDescriptionPlaceHolder;
- (NSString)collectionTitle;
- (NSString)dragBarName;
- (NSString)infoBarAudiobookImageName;
- (NSString)infoBarBuy;
- (NSString)infoBarDownloadPaused;
- (NSString)infoBarDownloadWaiting;
- (NSString)infoBarDownloading;
- (NSString)infoBarNew;
- (NSString)infoBarNext;
- (NSString)infoBarPreOrderable;
- (NSString)infoBarPreOrdered;
- (NSString)infoBarProof;
- (NSString)infoBarSample;
- (NSString)infoExpectedDateString;
- (NSString)moreButtonAccessibilityLabel;
- (NSString)moreText;
- (NSString)noBooksDescription;
- (NSString)noBooksDescriptionHeader;
- (NSString)readingListButtonText;
- (NSString)reviewBackgroundName;
- (NSString)selectedCheckmarkName;
- (NSString)seriesID;
- (NSString)sortButtonTitle;
- (NSString)sortByLabelText;
- (NSString)starRatingCountAccessibilityLabel;
- (NSString)starRatingCountLabel;
- (NSString)supplementalContentPDFPickerTitle;
- (NSString)supplementalContentStorePlaylistID;
- (NSString)unselectedCheckmarkName;
- (UIColor)actionMenuImageTintColor;
- (UIColor)dragBarTintColor;
- (UIColor)infoBarAudiobookImageTintColor;
- (UIImage)actionMenuImageWithTintColor;
- (UIImage)dragBarImage;
- (UIImage)infoBarAudiobookImageWithTintColor;
- (UIImage)selectedCheckmarkImage;
- (UIImage)unselectedCheckmarkImage;
- (id)actionMenuImageWithTintColor:(id)a3;
- (id)dragBarImageWithTintColor:(id)a3;
- (id)infoBarAudiobookImageWithTintColor:(id)a3;
- (id)selectedCheckmarkImageForSelectedState:(BOOL)a3;
- (id)stringFromSectionData:(id)a3;
- (id)templateCloudImageForCloudState:(int64_t)a3;
- (int64_t)selectedSortIndex;
- (int64_t)storeStatus;
- (unint64_t)sortMode;
- (unint64_t)viewMode;
- (void)_updateStoreStatus;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)setActionMenuImageName:(id)a3;
- (void)setActionMenuImageTintColor:(id)a3;
- (void)setActionMenuImageWithTintColor:(id)a3;
- (void)setCanChangeViewMode:(BOOL)a3;
- (void)setCloudDownloadImageName:(id)a3;
- (void)setCloudErrorImageName:(id)a3;
- (void)setCloudUploadingImageName:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setCollectionDescriptionPlaceHolder:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setCurrentStoreAccountID:(id)a3;
- (void)setDragBarImage:(id)a3;
- (void)setDragBarName:(id)a3;
- (void)setDragBarTintColor:(id)a3;
- (void)setFromActionMenu:(BOOL)a3;
- (void)setHasSeriesSequenceLabel:(BOOL)a3;
- (void)setHideTopSeparatorLine:(BOOL)a3;
- (void)setInfoBarAudiobookImageName:(id)a3;
- (void)setInfoBarAudiobookImageTintColor:(id)a3;
- (void)setInfoBarAudiobookImageWithTintColor:(id)a3;
- (void)setInfoBarBuy:(id)a3;
- (void)setInfoBarDownloadPaused:(id)a3;
- (void)setInfoBarDownloadWaiting:(id)a3;
- (void)setInfoBarDownloading:(id)a3;
- (void)setInfoBarNew:(id)a3;
- (void)setInfoBarNext:(id)a3;
- (void)setInfoBarPreOrderable:(id)a3;
- (void)setInfoBarPreOrdered:(id)a3;
- (void)setInfoBarProof:(id)a3;
- (void)setInfoBarSample:(id)a3;
- (void)setInfoExpectedDateString:(id)a3;
- (void)setIsInDragSession:(BOOL)a3;
- (void)setMoreButtonAccessibilityLabel:(id)a3;
- (void)setMoreText:(id)a3;
- (void)setNoBooksDescription:(id)a3;
- (void)setNoBooksDescriptionHeader:(id)a3;
- (void)setReadingListButtonText:(id)a3;
- (void)setReviewBackgroundName:(id)a3;
- (void)setSelectedCheckmarkImage:(id)a3;
- (void)setSelectedCheckmarkName:(id)a3;
- (void)setSeriesID:(id)a3;
- (void)setShowCancelNavigationBarItem:(BOOL)a3;
- (void)setSortControlConfig:(id)a3;
- (void)setSortMode:(unint64_t)a3;
- (void)setStarRatingCountAccessibilityLabel:(id)a3;
- (void)setStarRatingCountLabel:(id)a3;
- (void)setStoreStatus:(int64_t)a3;
- (void)setSupplementalContentPDFPicker:(BOOL)a3;
- (void)setSupplementalContentPDFPickerTitle:(id)a3;
- (void)setSupplementalContentStorePlaylistID:(id)a3;
- (void)setTemplateCloudImages:(id)a3;
- (void)setUnselectedCheckmarkImage:(id)a3;
- (void)setUnselectedCheckmarkName:(id)a3;
- (void)setViewMode:(unint64_t)a3;
@end

@implementation BKLibraryBookshelfSupplementaryDataSource

- (BKLibraryBookshelfSupplementaryDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfSupplementaryDataSource;
  v2 = [(BKLibraryBookshelfSupplementaryDataSource *)&v9 init];
  if (v2)
  {
    v3 = +[BUAccountsProvider sharedProvider];
    [v3 addObserver:v2 accountTypes:1];

    v4 = +[BUAccountsProvider sharedProvider];
    v5 = [v4 activeStoreAccount];
    uint64_t v6 = [v5 ams_DSID];
    currentStoreAccountID = v2->_currentStoreAccountID;
    v2->_currentStoreAccountID = (NSNumber *)v6;

    [(BKLibraryBookshelfSupplementaryDataSource *)v2 _updateStoreStatus];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[BUAccountsProvider sharedProvider];
  [v3 removeObserver:self accountTypes:1];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfSupplementaryDataSource;
  [(BKLibraryBookshelfSupplementaryDataSource *)&v4 dealloc];
}

- (void)_updateStoreStatus
{
  id v5 = +[BUAccountsProvider sharedProvider];
  if ([v5 isStoreAccountManagedAppleID])
  {
    [(BKLibraryBookshelfSupplementaryDataSource *)self setStoreStatus:2];
  }
  else
  {
    v3 = +[BURestrictionsProvider sharedInstance];
    if ([v3 isBookStoreAllowed]) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    [(BKLibraryBookshelfSupplementaryDataSource *)self setStoreStatus:v4];
  }
}

- (BOOL)storeReachable
{
  if (![(BKLibraryBookshelfSupplementaryDataSource *)self storeStatus]) {
    [(BKLibraryBookshelfSupplementaryDataSource *)self _updateStoreStatus];
  }
  if ((id)[(BKLibraryBookshelfSupplementaryDataSource *)self storeStatus] == (id)1) {
    return +[BKReachability isOffline] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)collectionIsSeries
{
  v2 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)templateCloudImageForCloudState:(int64_t)a3
{
  if (!a3)
  {
    v7 = 0;
    goto LABEL_20;
  }
  id v5 = [(BKLibraryBookshelfSupplementaryDataSource *)self templateCloudImages];
  if (!v5)
  {
    id v5 = +[NSMutableDictionary dictionary];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setTemplateCloudImages:v5];
  }
  uint64_t v6 = +[NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];
  if (!v7)
  {
    switch(a3)
    {
      case 3:
        uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self cloudErrorImageName];
        break;
      case 2:
        uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self cloudUploadingImageName];
        break;
      case 1:
        uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self cloudDownloadImageName];
        break;
      default:
        v7 = 0;
        objc_super v9 = 0;
LABEL_18:

        goto LABEL_19;
    }
    objc_super v9 = (void *)v8;
    if (v8)
    {
      v10 = +[BSUITemplate manager];
      v11 = [v10 imageResourceCache];
      v12 = +[UIScreen mainScreen];
      [v12 scale];
      LOBYTE(v21) = 1;
      v14 = [v11 symbolImageWithName:v9 compatibleWithFontSize:5 weight:2 scale:0 renderingMode:0 colors:0 style:13.0 contentsScale:13.0 layoutDirection:0 insets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0 baseline:0];
      id v15 = [v14 newImageWithoutContentInsets];
      v7 = [v15 imageWithRenderingMode:2];

      if (v7) {
        goto LABEL_15;
      }
      v16 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:13.0];
      v17 = BSUIBundle();
      v18 = +[UIImage imageNamed:v9 inBundle:v17 withConfiguration:v16];
      v7 = [v18 imageWithRenderingMode:2];

      if (v7)
      {
LABEL_15:
        v19 = [(BKLibraryBookshelfSupplementaryDataSource *)self templateCloudImages];
        [v19 setObject:v7 forKeyedSubscript:v6];
      }
    }
    else
    {
      v7 = 0;
    }
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:

  return v7;
}

- (id)actionMenuImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfSupplementaryDataSource *)self actionMenuImageTintColor];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = +[BSUITemplate manager];
    uint64_t v8 = [v7 imageResourceCache];
    objc_super v9 = [(BKLibraryBookshelfSupplementaryDataSource *)self actionMenuImageName];
    v10 = +[UIScreen mainScreen];
    [v10 scale];
    LOBYTE(v17) = 1;
    v12 = [v8 symbolImageWithName:v9 compatibleWithFontSize:7 weight:3 scale:0 renderingMode:0 colors:13.0 style:v11 contentsScale:13.0 layoutDirection:UIEdgeInsetsZero.top insets:UIEdgeInsetsZero.left baseline:UIEdgeInsetsZero.bottom];
    id v13 = [v12 newImageWithoutContentInsets];
    v14 = [v13 imageMaskWithColor:v4];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setActionMenuImageWithTintColor:v14];

    [(BKLibraryBookshelfSupplementaryDataSource *)self setActionMenuImageTintColor:v4];
  }
  id v15 = [(BKLibraryBookshelfSupplementaryDataSource *)self actionMenuImageWithTintColor];

  return v15;
}

- (id)infoBarAudiobookImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfSupplementaryDataSource *)self infoBarAudiobookImageTintColor];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = +[BSUITemplate manager];
    uint64_t v8 = [v7 imageResourceCache];
    objc_super v9 = [(BKLibraryBookshelfSupplementaryDataSource *)self infoBarAudiobookImageName];
    uint64_t v10 = UIImageSymbolSizeMedium;
    double v11 = +[UIScreen mainScreen];
    [v11 scale];
    LOBYTE(v18) = 1;
    id v13 = [v8 symbolImageWithName:v9 compatibleWithFontSize:5 weight:v10 scale:0 renderingMode:0 colors:v12 style:13.0 contentsScale:UIEdgeInsetsZero.top contentsScale:UIEdgeInsetsZero.left contentsScale:UIEdgeInsetsZero.bottom contentsScale:UIEdgeInsetsZero.right baseline:1 v18];
    id v14 = [v13 newImageWithoutContentInsets];
    id v15 = [v14 imageMaskWithColor:v4];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setInfoBarAudiobookImageWithTintColor:v15];

    [(BKLibraryBookshelfSupplementaryDataSource *)self setInfoBarAudiobookImageTintColor:v4];
  }
  v16 = [(BKLibraryBookshelfSupplementaryDataSource *)self infoBarAudiobookImageWithTintColor];

  return v16;
}

- (id)dragBarImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfSupplementaryDataSource *)self dragBarTintColor];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:20.0];
    uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self dragBarName];
    objc_super v9 = +[UIImage systemImageNamed:v8];
    uint64_t v10 = [v9 imageWithConfiguration:v7];
    double v11 = [v10 imageMaskWithColor:v4];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setDragBarImage:v11];

    [(BKLibraryBookshelfSupplementaryDataSource *)self setDragBarTintColor:v4];
  }
  double v12 = [(BKLibraryBookshelfSupplementaryDataSource *)self dragBarImage];

  return v12;
}

- (id)selectedCheckmarkImageForSelectedState:(BOOL)a3
{
  id v5 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:22.0];
  unsigned __int8 v6 = [(BKLibraryBookshelfSupplementaryDataSource *)self selectedCheckmarkImage];

  if (!v6)
  {
    v7 = [(BKLibraryBookshelfSupplementaryDataSource *)self selectedCheckmarkName];
    uint64_t v8 = +[UIImage systemImageNamed:v7];
    objc_super v9 = [v8 imageWithConfiguration:v5];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setSelectedCheckmarkImage:v9];
  }
  uint64_t v10 = [(BKLibraryBookshelfSupplementaryDataSource *)self unselectedCheckmarkImage];

  if (!v10)
  {
    double v11 = [(BKLibraryBookshelfSupplementaryDataSource *)self unselectedCheckmarkName];
    double v12 = +[UIImage systemImageNamed:v11];
    id v13 = [v12 imageWithConfiguration:v5];
    [(BKLibraryBookshelfSupplementaryDataSource *)self setUnselectedCheckmarkImage:v13];
  }
  if (a3) {
    [(BKLibraryBookshelfSupplementaryDataSource *)self selectedCheckmarkImage];
  }
  else {
  id v14 = [(BKLibraryBookshelfSupplementaryDataSource *)self unselectedCheckmarkImage];
  }

  return v14;
}

- (void)setCollectionTitle:(id)a3
{
  id v12 = a3;
  if (!-[NSString isEqualToString:](self->_collectionTitle, "isEqualToString:"))
  {
    id v4 = (NSString *)[v12 copy];
    collectionTitle = self->_collectionTitle;
    self->_collectionTitle = v4;

    unsigned __int8 v6 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
    v7 = [v6 title];
    if (([v7 isEqualToString:v12] & 1) == 0)
    {
      if (v12)
      {
      }
      else
      {
        uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
        objc_super v9 = [v8 title];

        if (!v9) {
          goto LABEL_8;
        }
      }
      uint64_t v10 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
      [v10 setTitle:v12];

      unsigned __int8 v6 = +[BKLibraryManager defaultManager];
      v7 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
      double v11 = [v7 managedObjectContext];
      [v6 saveManagedObjectContext:v11];
    }
  }
LABEL_8:
}

- (void)setCollectionDescription:(id)a3
{
  id v14 = a3;
  if (-[NSString isEqualToString:](self->_collectionDescription, "isEqualToString:")) {
    goto LABEL_14;
  }
  id v4 = (NSString *)[v14 copy];
  collectionDescription = self->_collectionDescription;
  self->_collectionDescription = v4;

  unsigned __int8 v6 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
  v7 = [v6 details];
  if (!v7 && ![v14 length])
  {
LABEL_13:

LABEL_14:
    id v13 = v14;
    goto LABEL_15;
  }
  uint64_t v8 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
  objc_super v9 = [v8 details];
  if ([v9 isEqualToString:v14])
  {

LABEL_12:
    goto LABEL_13;
  }
  if (v14)
  {

LABEL_9:
    if (![v14 length])
    {

      id v14 = 0;
    }
    id v12 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
    [v12 setDetails:v14];

    unsigned __int8 v6 = +[BKLibraryManager defaultManager];
    v7 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
    uint64_t v8 = [v7 managedObjectContext];
    [v6 saveManagedObjectContext:v8];
    goto LABEL_12;
  }
  uint64_t v10 = [(BKLibraryBookshelfSupplementaryDataSource *)self collection];
  double v11 = [v10 details];

  if (v11) {
    goto LABEL_9;
  }
  id v13 = 0;
LABEL_15:
}

- (NSString)sortButtonTitle
{
  BOOL v3 = [(BKLibraryBookshelfSupplementaryDataSource *)self sortControlConfig];
  id v4 = [v3 objectAtIndexedSubscript:[self selectedSortIndex]];
  id v5 = [v4 title];

  return (NSString *)v5;
}

- (NSString)sortByLabelText
{
  BOOL v3 = [(BKLibraryBookshelfSupplementaryDataSource *)self sortControlConfig];
  id v4 = [v3 objectAtIndexedSubscript:[self selectedSortIndex]];
  id v5 = [v4 label];

  return (NSString *)v5;
}

- (BKLibrarySortByMode)currentSortMode
{
  BOOL v3 = [(BKLibraryBookshelfSupplementaryDataSource *)self sortControlConfig];
  id v4 = [v3 objectAtIndexedSubscript:[self selectedSortIndex]];

  return (BKLibrarySortByMode *)v4;
}

- (int64_t)selectedSortIndex
{
  unint64_t v3 = [(BKLibraryBookshelfSupplementaryDataSource *)self sortMode];
  id v4 = [(BKLibraryBookshelfSupplementaryDataSource *)self sortControlConfig];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A3208;
  v7[3] = &unk_100A49BA8;
  v7[4] = v3;
  id v5 = [v4 indexOfObjectPassingTest:v7];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return (int64_t)v5;
  }
}

- (id)stringFromSectionData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v4 = [v5 localizedStringForKey:@"Unknown" value:&stru_100A70340 table:0];
  }

  return v4;
}

- (NSString)moreButtonAccessibilityLabel
{
  moreButtonAccessibilityLabel = self->_moreButtonAccessibilityLabel;
  if (!moreButtonAccessibilityLabel)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"More Actions" value:&stru_100A70340 table:0];
    unsigned __int8 v6 = self->_moreButtonAccessibilityLabel;
    self->_moreButtonAccessibilityLabel = v5;

    moreButtonAccessibilityLabel = self->_moreButtonAccessibilityLabel;
  }

  return moreButtonAccessibilityLabel;
}

- (NSString)starRatingCountLabel
{
  starRatingCountLabel = self->_starRatingCountLabel;
  if (!starRatingCountLabel)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"(%lu)" value:&stru_100A70340 table:0];
    unsigned __int8 v6 = self->_starRatingCountLabel;
    self->_starRatingCountLabel = v5;

    starRatingCountLabel = self->_starRatingCountLabel;
  }

  return starRatingCountLabel;
}

- (NSString)starRatingCountAccessibilityLabel
{
  starRatingCountAccessibilityLabel = self->_starRatingCountAccessibilityLabel;
  if (!starRatingCountAccessibilityLabel)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"%lu rating(s)" value:&stru_100A70340 table:0];
    unsigned __int8 v6 = self->_starRatingCountAccessibilityLabel;
    self->_starRatingCountAccessibilityLabel = v5;

    starRatingCountAccessibilityLabel = self->_starRatingCountAccessibilityLabel;
  }

  return starRatingCountAccessibilityLabel;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A34F8;
  v4[3] = &unk_100A43F68;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (NSString)collectionDescriptionPlaceHolder
{
  return self->_collectionDescriptionPlaceHolder;
}

- (void)setCollectionDescriptionPlaceHolder:(id)a3
{
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (NSString)readingListButtonText
{
  return self->_readingListButtonText;
}

- (void)setReadingListButtonText:(id)a3
{
}

- (NSString)noBooksDescriptionHeader
{
  return self->_noBooksDescriptionHeader;
}

- (void)setNoBooksDescriptionHeader:(id)a3
{
}

- (NSString)noBooksDescription
{
  return self->_noBooksDescription;
}

- (void)setNoBooksDescription:(id)a3
{
}

- (NSString)cloudDownloadImageName
{
  return self->_cloudDownloadImageName;
}

- (void)setCloudDownloadImageName:(id)a3
{
}

- (NSString)cloudUploadingImageName
{
  return self->_cloudUploadingImageName;
}

- (void)setCloudUploadingImageName:(id)a3
{
}

- (NSString)cloudErrorImageName
{
  return self->_cloudErrorImageName;
}

- (void)setCloudErrorImageName:(id)a3
{
}

- (NSString)actionMenuImageName
{
  return self->_actionMenuImageName;
}

- (void)setActionMenuImageName:(id)a3
{
}

- (NSString)dragBarName
{
  return self->_dragBarName;
}

- (void)setDragBarName:(id)a3
{
}

- (NSString)reviewBackgroundName
{
  return self->_reviewBackgroundName;
}

- (void)setReviewBackgroundName:(id)a3
{
}

- (NSString)selectedCheckmarkName
{
  return self->_selectedCheckmarkName;
}

- (void)setSelectedCheckmarkName:(id)a3
{
}

- (NSString)unselectedCheckmarkName
{
  return self->_unselectedCheckmarkName;
}

- (void)setUnselectedCheckmarkName:(id)a3
{
}

- (NSString)infoBarDownloading
{
  return self->_infoBarDownloading;
}

- (void)setInfoBarDownloading:(id)a3
{
}

- (NSString)infoBarDownloadWaiting
{
  return self->_infoBarDownloadWaiting;
}

- (void)setInfoBarDownloadWaiting:(id)a3
{
}

- (NSString)infoBarDownloadPaused
{
  return self->_infoBarDownloadPaused;
}

- (void)setInfoBarDownloadPaused:(id)a3
{
}

- (NSString)infoBarNew
{
  return self->_infoBarNew;
}

- (void)setInfoBarNew:(id)a3
{
}

- (NSString)infoBarNext
{
  return self->_infoBarNext;
}

- (void)setInfoBarNext:(id)a3
{
}

- (NSString)infoBarProof
{
  return self->_infoBarProof;
}

- (void)setInfoBarProof:(id)a3
{
}

- (NSString)infoBarPreOrderable
{
  return self->_infoBarPreOrderable;
}

- (void)setInfoBarPreOrderable:(id)a3
{
}

- (NSString)infoBarPreOrdered
{
  return self->_infoBarPreOrdered;
}

- (void)setInfoBarPreOrdered:(id)a3
{
}

- (NSString)infoBarSample
{
  return self->_infoBarSample;
}

- (void)setInfoBarSample:(id)a3
{
}

- (NSString)infoBarBuy
{
  return self->_infoBarBuy;
}

- (void)setInfoBarBuy:(id)a3
{
}

- (NSString)infoExpectedDateString
{
  return self->_infoExpectedDateString;
}

- (void)setInfoExpectedDateString:(id)a3
{
}

- (NSString)moreText
{
  return self->_moreText;
}

- (void)setMoreText:(id)a3
{
}

- (void)setMoreButtonAccessibilityLabel:(id)a3
{
}

- (void)setStarRatingCountLabel:(id)a3
{
}

- (void)setStarRatingCountAccessibilityLabel:(id)a3
{
}

- (NSNumber)currentStoreAccountID
{
  return self->_currentStoreAccountID;
}

- (void)setCurrentStoreAccountID:(id)a3
{
}

- (BKCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (NSString)infoBarAudiobookImageName
{
  return self->_infoBarAudiobookImageName;
}

- (void)setInfoBarAudiobookImageName:(id)a3
{
}

- (BOOL)hideTopSeparatorLine
{
  return self->_hideTopSeparatorLine;
}

- (void)setHideTopSeparatorLine:(BOOL)a3
{
  self->_hideTopSeparatorLine = a3;
}

- (BOOL)supplementalContentPDFPicker
{
  return self->_supplementalContentPDFPicker;
}

- (void)setSupplementalContentPDFPicker:(BOOL)a3
{
  self->_supplementalContentPDFPicker = a3;
}

- (BOOL)showCancelNavigationBarItem
{
  return self->_showCancelNavigationBarItem;
}

- (void)setShowCancelNavigationBarItem:(BOOL)a3
{
  self->_showCancelNavigationBarItem = a3;
}

- (NSString)supplementalContentPDFPickerTitle
{
  return self->_supplementalContentPDFPickerTitle;
}

- (void)setSupplementalContentPDFPickerTitle:(id)a3
{
}

- (NSString)supplementalContentStorePlaylistID
{
  return self->_supplementalContentStorePlaylistID;
}

- (void)setSupplementalContentStorePlaylistID:(id)a3
{
}

- (BOOL)fromActionMenu
{
  return self->_fromActionMenu;
}

- (void)setFromActionMenu:(BOOL)a3
{
  self->_fromActionMenu = a3;
}

- (NSArray)sortControlConfig
{
  return self->_sortControlConfig;
}

- (void)setSortControlConfig:(id)a3
{
}

- (unint64_t)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(unint64_t)a3
{
  self->_sortMode = a3;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(unint64_t)a3
{
  self->_viewMode = a3;
}

- (BOOL)canChangeViewMode
{
  return self->_canChangeViewMode;
}

- (void)setCanChangeViewMode:(BOOL)a3
{
  self->_canChangeViewMode = a3;
}

- (BOOL)isInDragSession
{
  return self->_isInDragSession;
}

- (void)setIsInDragSession:(BOOL)a3
{
  self->_isInDragSession = a3;
}

- (NSMutableDictionary)templateCloudImages
{
  return self->_templateCloudImages;
}

- (void)setTemplateCloudImages:(id)a3
{
}

- (UIColor)actionMenuImageTintColor
{
  return self->_actionMenuImageTintColor;
}

- (void)setActionMenuImageTintColor:(id)a3
{
}

- (UIImage)actionMenuImageWithTintColor
{
  return self->_actionMenuImageWithTintColor;
}

- (void)setActionMenuImageWithTintColor:(id)a3
{
}

- (UIColor)infoBarAudiobookImageTintColor
{
  return self->_infoBarAudiobookImageTintColor;
}

- (void)setInfoBarAudiobookImageTintColor:(id)a3
{
}

- (UIImage)infoBarAudiobookImageWithTintColor
{
  return self->_infoBarAudiobookImageWithTintColor;
}

- (void)setInfoBarAudiobookImageWithTintColor:(id)a3
{
}

- (UIColor)dragBarTintColor
{
  return self->_dragBarTintColor;
}

- (void)setDragBarTintColor:(id)a3
{
}

- (UIImage)dragBarImage
{
  return self->_dragBarImage;
}

- (void)setDragBarImage:(id)a3
{
}

- (UIImage)selectedCheckmarkImage
{
  return self->_selectedCheckmarkImage;
}

- (void)setSelectedCheckmarkImage:(id)a3
{
}

- (UIImage)unselectedCheckmarkImage
{
  return self->_unselectedCheckmarkImage;
}

- (void)setUnselectedCheckmarkImage:(id)a3
{
}

- (int64_t)storeStatus
{
  return self->_storeStatus;
}

- (void)setStoreStatus:(int64_t)a3
{
  self->_storeStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_dragBarImage, 0);
  objc_storeStrong((id *)&self->_dragBarTintColor, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageWithTintColor, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageTintColor, 0);
  objc_storeStrong((id *)&self->_actionMenuImageWithTintColor, 0);
  objc_storeStrong((id *)&self->_actionMenuImageTintColor, 0);
  objc_storeStrong((id *)&self->_templateCloudImages, 0);
  objc_storeStrong((id *)&self->_sortControlConfig, 0);
  objc_storeStrong((id *)&self->_supplementalContentStorePlaylistID, 0);
  objc_storeStrong((id *)&self->_supplementalContentPDFPickerTitle, 0);
  objc_storeStrong((id *)&self->_infoBarAudiobookImageName, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_currentStoreAccountID, 0);
  objc_storeStrong((id *)&self->_starRatingCountAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_starRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_moreButtonAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_moreText, 0);
  objc_storeStrong((id *)&self->_infoExpectedDateString, 0);
  objc_storeStrong((id *)&self->_infoBarBuy, 0);
  objc_storeStrong((id *)&self->_infoBarSample, 0);
  objc_storeStrong((id *)&self->_infoBarPreOrdered, 0);
  objc_storeStrong((id *)&self->_infoBarPreOrderable, 0);
  objc_storeStrong((id *)&self->_infoBarProof, 0);
  objc_storeStrong((id *)&self->_infoBarNext, 0);
  objc_storeStrong((id *)&self->_infoBarNew, 0);
  objc_storeStrong((id *)&self->_infoBarDownloadPaused, 0);
  objc_storeStrong((id *)&self->_infoBarDownloadWaiting, 0);
  objc_storeStrong((id *)&self->_infoBarDownloading, 0);
  objc_storeStrong((id *)&self->_unselectedCheckmarkName, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkName, 0);
  objc_storeStrong((id *)&self->_reviewBackgroundName, 0);
  objc_storeStrong((id *)&self->_dragBarName, 0);
  objc_storeStrong((id *)&self->_actionMenuImageName, 0);
  objc_storeStrong((id *)&self->_cloudErrorImageName, 0);
  objc_storeStrong((id *)&self->_cloudUploadingImageName, 0);
  objc_storeStrong((id *)&self->_cloudDownloadImageName, 0);
  objc_storeStrong((id *)&self->_noBooksDescription, 0);
  objc_storeStrong((id *)&self->_noBooksDescriptionHeader, 0);
  objc_storeStrong((id *)&self->_readingListButtonText, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_collectionDescriptionPlaceHolder, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);

  objc_storeStrong((id *)&self->_collectionDescription, 0);
}

@end