@interface BKLibraryBookshelfCollectionInfoHeader
+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4;
+ (void)adjustHeight:(id)a3 withDataSource:(id)a4;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryBookshelfCollectionInfoHeader)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BKLibraryLayoutAttributes)attrs;
- (BOOL)isObservingPropertyChanges;
- (BOOL)isRTL;
- (BOOL)isSeriesCollection;
- (BOOL)waitingForCloudButtonHideDelay;
- (BOOL)wantsCloudButton;
- (BUCoalescingCallBlock)coalescedReloadData;
- (IMTouchInsetsButton)cloudButton;
- (NSFetchedResultsController)frc;
- (NSSet)propertiesOfInterest;
- (UILabel)infoLabel;
- (UINavigationController)uploadProgressNavigationController;
- (double)cloudButtonSpacing;
- (id)bookTypeStringFromBookType:(signed __int16)a3 count:(unint64_t)a4;
- (id)importStatusString;
- (id)libraryUploadStatusPresentingViewController;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_delayedHideCloudStatus;
- (void)_mocWillSave:(id)a3;
- (void)_ownershipDidChange:(id)a3;
- (void)_updateMetricsForUploadStatusViewController;
- (void)applyLayoutAttributes:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)libraryUploadStatusViewControllerDismissed:(id)a3;
- (void)networkReachabilityChanged:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setAttrs:(id)a3;
- (void)setCloudButton:(id)a3;
- (void)setCloudButtonSpacing:(double)a3;
- (void)setCoalescedReloadData:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFrc:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setIsObservingPropertyChanges:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setIsSeriesCollection:(BOOL)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setPropertiesOfInterest:(id)a3;
- (void)setUploadProgressNavigationController:(id)a3;
- (void)setWaitingForCloudButtonHideDelay:(BOOL)a3;
- (void)setWantsCloudButton:(BOOL)a3;
- (void)sortModeDidChange;
- (void)updateAndLayoutCloudButtonAnimated;
- (void)updateCloudButton;
- (void)updateCounts;
- (void)uploadProgressButtonPressed:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation BKLibraryBookshelfCollectionInfoHeader

+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100B4A4F0 != -1) {
    dispatch_once(&qword_100B4A4F0, &stru_100A48988);
  }
  v7 = [v5 mainHeaderMetrics];
  v8 = [v7 collectionInfoLabelFontAttributes];
  v9 = +[TUIFontSpec attributedStringWith:@" " attributes:v8];

  v10 = [v7 cloudButtonFontAttributes];
  v11 = +[TUIFontSpec attributedStringWith:@" " attributes:v10];

  [v7 collectionInfoHeaderVerticalMargin];
  double v13 = v12;
  [v7 cloudButtonSpacing];
  v15 = 0;
  if (!v9) {
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_7;
  }
  double v16 = v14;
  v37[0] = @"attributedInfoText";
  v37[1] = @"attributedCloudText";
  v38[0] = v9;
  v38[1] = v11;
  v37[2] = @"vertMargin";
  v17 = +[NSNumber numberWithDouble:v13];
  v38[2] = v17;
  v37[3] = @"spacing";
  v18 = +[NSNumber numberWithDouble:v16];
  v38[3] = v18;
  v15 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

  v19 = [(id)qword_100B4A4F8 objectForKeyedSubscript:v15];
  if (v19)
  {
    id v20 = v19;
    [v19 doubleValue];
    double v22 = v21;
  }
  else
  {
LABEL_7:
    id v20 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v20 setAttributedText:v9];
    id v23 = objc_alloc_init((Class)IMTouchInsetsButton);
    [v23 setContentEdgeInsets:0.0, 0.0, 0.0, -1.0];
    [v23 setAttributedTitle:v11 forState:0];
    [v5 frame];
    double v25 = v24;
    double v27 = v26;
    [v20 sizeThatFits:v24 v26];
    double v29 = v28;
    [v23 sizeThatFits:v25, v27];
    double v31 = v29 + v30;
    [v7 collectionInfoHeaderVerticalMargin];
    double v33 = v31 + v32 * 2.0;
    [v7 cloudButtonSpacing];
    double v22 = ceil(v34 + v33);
    if (v15)
    {
      v35 = +[NSNumber numberWithDouble:v22];
      [(id)qword_100B4A4F8 setObject:v35 forKeyedSubscript:v15];
    }
  }

  return v22;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v6 = a4;
  id v15 = a3;
  [v15 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [a1 _cachedHeight:v15 withDataSource:v6];
  double v14 = v13;

  [v15 setFrame:v8, v10, v12, v14];
}

- (BKLibraryBookshelfCollectionInfoHeader)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  v3 = -[BKLibraryBookshelfCollectionInfoHeader initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)v3 setTag:47];
    id v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    infoLabel = v4->_infoLabel;
    v4->_infoLabel = v5;

    [(BKLibraryBookshelfCollectionInfoHeader *)v4 addSubview:v4->_infoLabel];
    double v7 = (IMTouchInsetsButton *)objc_alloc_init((Class)IMTouchInsetsButton);
    cloudButton = v4->_cloudButton;
    v4->_cloudButton = v7;

    -[IMTouchInsetsButton setContentEdgeInsets:](v4->_cloudButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, -1.0);
    [(BKLibraryBookshelfCollectionInfoHeader *)v4 addSubview:v4->_cloudButton];
    [(BKLibraryBookshelfCollectionInfoHeader *)v4 updateCloudButton];
    double v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v4 selector:"networkReachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:0];

    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v4 selector:"_mocWillSave:" name:NSManagedObjectContextWillSaveNotification object:0];

    double v11 = +[NSSet setWithObjects:@"expectedDate", @"isSample", @"state", @"purchasedAndLocalParent", @"seriesContainer", 0];
    [(BKLibraryBookshelfCollectionInfoHeader *)v4 setPropertiesOfInterest:v11];

    objc_initWeak(&location, v4);
    id v12 = objc_alloc((Class)BUCoalescingCallBlock);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100160C84;
    v16[3] = &unk_100A451B8;
    objc_copyWeak(&v17, &location);
    double v13 = (BUCoalescingCallBlock *)[v12 initWithNotifyBlock:v16 blockDescription:@"BKLibraryBookshelfCollectionInfoHeader"];
    coalescedReloadData = v4->_coalescedReloadData;
    v4->_coalescedReloadData = v13;

    [(BUCoalescingCallBlock *)v4->_coalescedReloadData setCoalescingDelay:1.0];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
  [v4 removeObserver:self forKeyPath:@"sortMode" context:off_100B1FCB8];

  if ([(BKLibraryBookshelfCollectionInfoHeader *)self isObservingPropertyChanges])
  {
    id v5 = +[BKLibraryAssetStatusController sharedController];
    id v6 = [v5 uploadAssets];
    [v6 removeObserver:self forKeyPath:@"arrangedObjects" context:off_100B1FCC0];
    [v5 removeObserver:self forKeyPath:@"uploadStatus" context:off_100B1FCC8];
    double v7 = +[BKLibraryImportStatusController sharedController];
    [v7 removeObserver:self forKeyPath:@"totalImportOperationsProcessed" context:off_100B1FCD0];
  }
  uploadProgressNavigationController = self->_uploadProgressNavigationController;
  if (uploadProgressNavigationController)
  {
    double v9 = [(UINavigationController *)uploadProgressNavigationController popoverPresentationController];
    [v9 setDelegate:0];

    double v10 = [(BKLibraryBookshelfCollectionInfoHeader *)self actionHandler];
    double v11 = [v10 presentationController];
    [v11 dismissViewControllerAnimated:0 completion:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  [(BKLibraryBookshelfCollectionInfoHeader *)&v12 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self window];
  id v6 = (void *)v5;
  if (v4 && !v5)
  {
    if (![(BKLibraryBookshelfCollectionInfoHeader *)self isObservingPropertyChanges])
    {
      double v7 = +[BKLibraryAssetStatusController sharedController];
      double v8 = [v7 uploadAssets];
      [v8 addObserver:self forKeyPath:@"arrangedObjects" options:1 context:off_100B1FCC0];
      [v7 addObserver:self forKeyPath:@"uploadStatus" options:1 context:off_100B1FCC8];
      double v9 = +[BKLibraryImportStatusController sharedController];
      [v9 addObserver:self forKeyPath:@"totalImportOperationsProcessed" options:1 context:off_100B1FCD0];

      [(BKLibraryBookshelfCollectionInfoHeader *)self setIsObservingPropertyChanges:1];
    }
    goto LABEL_10;
  }
  if (v4 || !v5)
  {
    if (v4)
    {
LABEL_10:
      [(BKLibraryBookshelfCollectionInfoHeader *)self updateCounts];
      [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];
      [(BKLibraryBookshelfCollectionInfoHeader *)self setNeedsLayout];
    }
  }
  else if ([(BKLibraryBookshelfCollectionInfoHeader *)self isObservingPropertyChanges])
  {
    double v10 = +[BKLibraryAssetStatusController sharedController];
    double v11 = [v10 uploadAssets];
    [v11 removeObserver:self forKeyPath:@"arrangedObjects" context:off_100B1FCC0];
    [v10 removeObserver:self forKeyPath:@"uploadStatus" context:off_100B1FCC8];
    objc_super v12 = +[BKLibraryImportStatusController sharedController];
    [v12 removeObserver:self forKeyPath:@"totalImportOperationsProcessed" context:off_100B1FCD0];

    [(BKLibraryBookshelfCollectionInfoHeader *)self setIsObservingPropertyChanges:0];
  }
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  [(BKLibraryBookshelfCollectionInfoHeader *)&v13 willMoveToWindow:v4];
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
  id v4 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
  [v4 removeTarget:0 action:0 forControlEvents:64];
  [v4 addTarget:self action:"uploadProgressButtonPressed:" forControlEvents:64];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  [(BKLibraryBookshelfCollectionInfoHeader *)&v27 layoutSubviews];
  [(BKLibraryBookshelfCollectionInfoHeader *)self bounds];
  double v4 = v3;
  CGFloat v25 = v5;
  double v7 = v6;
  double v9 = v8;
  double v10 = [(BKLibraryBookshelfCollectionInfoHeader *)self infoLabel];
  double v11 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
  [v10 sizeThatFits:v7, v9];
  double v13 = v12;
  [v11 sizeThatFits:v7, v9];
  double v26 = v14;
  double v16 = v15;
  if ([(BKLibraryBookshelfCollectionInfoHeader *)self wantsCloudButton])
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButtonSpacing];
    double v18 = v17;
LABEL_4:
    double v22 = v13 + v16 + v18;
    double v21 = 1.0;
    goto LABEL_5;
  }
  unsigned int v19 = [(BKLibraryBookshelfCollectionInfoHeader *)self waitingForCloudButtonHideDelay];
  [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButtonSpacing];
  double v18 = v20;
  double v21 = 0.0;
  double v22 = v13;
  if (v19) {
    goto LABEL_4;
  }
LABEL_5:
  v28.origin.x = v4;
  v28.origin.y = v25;
  v28.size.width = v7;
  v28.size.height = v9;
  double v23 = floor((CGRectGetHeight(v28) - v22) * 0.5);
  [v11 setAlpha:v21];
  v29.origin.x = v4;
  v29.origin.y = v25;
  v29.size.width = v7;
  v29.size.height = v9;
  [v10 setFrame:v4, v23, CGRectGetWidth(v29), v13];
  v30.origin.x = v4;
  v30.origin.y = v25;
  v30.size.width = v7;
  v30.size.height = v9;
  [v11 setFrame:CGRectMake(v4, v18 + v13 + v23, CGRectGetWidth(v30), v16)];
  v31.origin.x = v4;
  v31.origin.y = v25;
  v31.size.width = v7;
  v31.size.height = v9;
  CGFloat Width = CGRectGetWidth(v31);
  [v11 setTouchInsets:0.0, (Width - v26) * 0.5, 0.0, (Width - v26) * 0.5];
}

- (id)importStatusString
{
  v2 = +[BKLibraryImportStatusController sharedController];
  id v3 = [v2 totalImportOperations];
  id v4 = [v2 completedImportOperations];
  id v5 = [v2 failedImportOperations];
  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"Importing: %ld of %ld. Failed: %ld" value:&stru_100A70340 table:0];

  if (v3)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4, v3, v5);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)updateCloudButton
{
  id v9 = [(BKLibraryBookshelfCollectionInfoHeader *)self importStatusString];
  if ([v9 length])
  {
    id v3 = v9;
  }
  else
  {
    uint64_t v4 = +[BKLibraryUploadStatusViewController titleForUploadButton];

    id v3 = (void *)v4;
  }
  id v10 = v3;
  if ([v3 length])
  {
    id v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
    double v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self mainHeaderMetrics];
    double v7 = [v6 cloudButtonFontAttributes];
    double v8 = +[TUIFontSpec attributedStringWith:v10 attributes:v7];
    [v5 setAttributedTitle:v8 forState:0];

    [(BKLibraryBookshelfCollectionInfoHeader *)self setWantsCloudButton:1];
    [(BKLibraryBookshelfCollectionInfoHeader *)self setWaitingForCloudButtonHideDelay:0];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_delayedHideCloudStatus" object:0];
  }
  else if ([(BKLibraryBookshelfCollectionInfoHeader *)self wantsCloudButton])
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)self setWantsCloudButton:0];
    if (![(BKLibraryBookshelfCollectionInfoHeader *)self waitingForCloudButtonHideDelay])
    {
      [(BKLibraryBookshelfCollectionInfoHeader *)self setWaitingForCloudButtonHideDelay:1];
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_delayedHideCloudStatus" object:0];
      [(BKLibraryBookshelfCollectionInfoHeader *)self performSelector:"_delayedHideCloudStatus" withObject:0 afterDelay:10.0];
    }
  }
}

- (void)_delayedHideCloudStatus
{
  if ([(BKLibraryBookshelfCollectionInfoHeader *)self waitingForCloudButtonHideDelay])
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)self setWaitingForCloudButtonHideDelay:0];
    id v3 = [(BKLibraryBookshelfCollectionInfoHeader *)self superview];

    if (v3)
    {
      [(BKLibraryBookshelfCollectionInfoHeader *)self updateAndLayoutCloudButtonAnimated];
    }
  }
}

- (id)bookTypeStringFromBookType:(signed __int16)a3 count:(unint64_t)a4
{
  switch(a3)
  {
    case 1:
      id v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"%lu books";
      break;
    case 2:
      id v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"%lu PDFs";
      break;
    case 3:
      id v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"%lu audiobooks";
      break;
    case 4:
      id v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"%lu series";
      break;
    default:
      id v5 = +[NSBundle mainBundle];
      double v6 = v5;
      CFStringRef v7 = @"%lu unknown";
      break;
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_100A70340 table:0];

  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, a4);

  return v9;
}

- (void)updateCounts
{
  v2 = self;
  if ([(BKLibraryBookshelfCollectionInfoHeader *)self isSeriesCollection])
  {
    id v3 = +[BKLibraryManager defaultManager];
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v4 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 dataSource];
    id v5 = [v4 seriesID];

    double v6 = [v3 uiChildContext];
    [v3 countOfSeriesLibraryAssetsWithSeriesID:v5 total:&v80 purchased:&v79 context:v6];

    if (v79)
    {
      if (v79 != v80)
      {
        v71 = v3;
        v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
        double v11 = +[NSNumberFormatter localizedStringFromNumber:v54 numberStyle:1];

        v55 = +[NSNumber numberWithUnsignedInteger:v80];
        double v15 = +[NSNumberFormatter localizedStringFromNumber:v55 numberStyle:1];

        v56 = +[NSBundle mainBundle];
        double v8 = [v56 localizedStringForKey:@"You’ve purchased %@ of %@ books in this series." value:&stru_100A70340 table:0];

        v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v11, v15);
        v57 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
        v58 = [v57 collectionInfoLabelFontAttributes];
        v59 = +[TUIFontSpec attributedStringWith:v44 attributes:v58];

        [v59 size];
        double v61 = v60;
        [(BKLibraryBookshelfCollectionInfoHeader *)v2 bounds];
        if (v61 > CGRectGetWidth(v85))
        {
          v62 = +[NSBundle mainBundle];
          v63 = [v62 localizedStringForKey:@"%@ of %@ Purchased." value:&stru_100A70340 table:0];

          uint64_t v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v11, v15);

          v44 = (void *)v64;
        }

        id v3 = v71;
        goto LABEL_40;
      }
      CFStringRef v7 = +[NSBundle mainBundle];
      double v8 = [v7 localizedStringForKey:@"You’ve purchased all the books in this series." value:&stru_100A70340 table:0];

      id v9 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
      id v10 = [v9 collectionInfoLabelFontAttributes];
      double v11 = +[TUIFontSpec attributedStringWith:v8 attributes:v10];

      [v11 size];
      double v13 = v12;
      [(BKLibraryBookshelfCollectionInfoHeader *)v2 bounds];
      if (v13 > CGRectGetWidth(v82))
      {
        double v14 = +[NSBundle mainBundle];
        double v15 = v14;
        CFStringRef v16 = @"All books purchased.";
LABEL_31:
        v44 = [v14 localizedStringForKey:v16 value:&stru_100A70340 table:0];
LABEL_40:

        double v8 = v44;
      }
    }
    else
    {
      v39 = +[NSBundle mainBundle];
      double v8 = [v39 localizedStringForKey:@"You haven’t purchased any books in this series." value:&stru_100A70340 table:0];

      v40 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
      v41 = [v40 collectionInfoLabelFontAttributes];
      double v11 = +[TUIFontSpec attributedStringWith:v8 attributes:v41];

      [v11 size];
      double v43 = v42;
      [(BKLibraryBookshelfCollectionInfoHeader *)v2 bounds];
      if (v43 > CGRectGetWidth(v83))
      {
        double v14 = +[NSBundle mainBundle];
        double v15 = v14;
        CFStringRef v16 = @"No books purchased.";
        goto LABEL_31;
      }
    }

    v65 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
    v66 = [v65 collectionInfoLabelFontAttributes];
    v67 = +[TUIFontSpec attributedStringWith:v8 attributes:v66];
    [(UILabel *)v2->_infoLabel setAttributedText:v67];

    goto LABEL_42;
  }
  double v17 = +[NSBundle mainBundle];
  id v3 = [v17 localizedStringForKey:@", ", &stru_100A70340, 0 value table];

  double v18 = +[NSMutableArray array];
  unsigned int v19 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 frc];
  double v20 = [v19 sections];
  id v21 = [v20 mutableCopy];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v75 objects:v81 count:16];
  id obj = v22;
  if (v23)
  {
    id v24 = v23;
    v68 = v18;
    v69 = v2;
    v70 = v3;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v76;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v76 != v29) {
          objc_enumerationMutation(obj);
        }
        CGRect v31 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v32 = [v31 numberOfObjects];
        double v33 = [v31 name];
        id v34 = [v33 integerValue];

        switch((unint64_t)v34)
        {
          case 1uLL:
          case 2uLL:
          case 4uLL:
            v27 += (uint64_t)v32;
            break;
          case 3uLL:
            v72 += (uint64_t)v32;
            break;
          case 5uLL:
            v26 += (uint64_t)v32;
            break;
          case 6uLL:
            v25 += (uint64_t)v32;
            break;
          default:
            v73 += (uint64_t)v32;
            break;
        }
        v28 += (uint64_t)v32;
      }
      id v24 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v24);

    double v18 = v68;
    if (v27)
    {
      v35 = [(BKLibraryBookshelfCollectionInfoHeader *)v69 bookTypeStringFromBookType:1 count:v27];
      [v68 addObject:v35];
    }
    v2 = v69;
    if (v26)
    {
      v36 = [(BKLibraryBookshelfCollectionInfoHeader *)v69 bookTypeStringFromBookType:4 count:v26];
      [v68 addObject:v36];
    }
    if (v25)
    {
      v37 = [(BKLibraryBookshelfCollectionInfoHeader *)v69 bookTypeStringFromBookType:3 count:v25];
      [v68 addObject:v37];
    }
    if (v72)
    {
      v38 = -[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v69, "bookTypeStringFromBookType:count:", 2);
      [v68 addObject:v38];
    }
    id v3 = v70;
    if (!v73) {
      goto LABEL_34;
    }
    -[BKLibraryBookshelfCollectionInfoHeader bookTypeStringFromBookType:count:](v69, "bookTypeStringFromBookType:count:", 0);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [v68 addObject:v22];
  }
  else
  {
    uint64_t v28 = 0;
  }

LABEL_34:
  double v8 = [v18 componentsJoinedByString:v3];
  v45 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
  v46 = [v45 collectionInfoLabelFontAttributes];
  v47 = +[TUIFontSpec attributedStringWith:v8 attributes:v46];

  [v47 size];
  double v49 = v48;
  [(BKLibraryBookshelfCollectionInfoHeader *)v2 bounds];
  if (v49 > CGRectGetWidth(v84))
  {
    uint64_t v50 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 bookTypeStringFromBookType:1 count:v28];

    v51 = [(BKLibraryBookshelfCollectionInfoHeader *)v2 mainHeaderMetrics];
    v52 = [v51 collectionInfoLabelFontAttributes];
    uint64_t v53 = +[TUIFontSpec attributedStringWith:v50 attributes:v52];

    v47 = (void *)v53;
    double v8 = (void *)v50;
  }
  [(UILabel *)v2->_infoLabel setAttributedText:v47];

LABEL_42:
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  [(BKLibraryBookshelfCollectionInfoHeader *)&v37 applyLayoutAttributes:v4];
  id v5 = v4;
  double v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self attrs];
  unsigned __int8 v7 = [v6 isEqual:v5];

  if ((v7 & 1) == 0)
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)self setAttrs:v5];
    double v8 = +[UIApplication sharedApplication];
    -[BKLibraryBookshelfCollectionInfoHeader setIsRTL:](self, "setIsRTL:", [v8 userInterfaceLayoutDirection] == (id)1);

    id v9 = [(BKLibraryBookshelfCollectionInfoHeader *)self infoLabel];
    id v10 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
    double v11 = [(BKLibraryBookshelfCollectionInfoHeader *)self attrs];
    unsigned int v12 = [v11 layoutDebugMode];

    if (v12)
    {
      double v13 = +[UIColor redColor];
      id v14 = [v13 colorWithAlphaComponent:0.2];
      id v15 = [v14 CGColor];
      CFStringRef v16 = [(BKLibraryBookshelfCollectionInfoHeader *)self layer];
      [v16 setBorderColor:v15];

      double v17 = [(BKLibraryBookshelfCollectionInfoHeader *)self layer];
      [v17 setBorderWidth:0.5];

      double v18 = +[UIColor redColor];
      id v19 = [v18 colorWithAlphaComponent:0.2];
      id v20 = [v19 CGColor];
      id v21 = [v9 layer];
      [v21 setBorderColor:v20];

      id v22 = [v9 layer];
      [v22 setBorderWidth:0.5];

      id v23 = +[UIColor redColor];
      id v24 = [v23 colorWithAlphaComponent:0.2];
      id v25 = [v24 CGColor];
      uint64_t v26 = [v10 layer];
      [v26 setBorderColor:v25];

      uint64_t v27 = [v10 layer];
      uint64_t v28 = v27;
      double v29 = 0.5;
    }
    else
    {
      CGRect v30 = [(BKLibraryBookshelfCollectionInfoHeader *)self layer];
      [v30 setBorderWidth:0.0];

      CGRect v31 = [v9 layer];
      [v31 setBorderWidth:0.0];

      uint64_t v27 = [v10 layer];
      uint64_t v28 = v27;
      double v29 = 0.0;
    }
    [v27 setBorderWidth:v29];

    id v32 = [(BKLibraryBookshelfCollectionInfoHeader *)self attrs];
    double v33 = [v32 mainHeaderMetrics];

    [(BKLibraryBookshelfCollectionInfoHeader *)self setMainHeaderMetrics:v33];
    id v34 = [(BKLibraryBookshelfCollectionInfoHeader *)self backgroundColor];
    v35 = [v33 headerBackgroundColor];

    if (v34 != v35)
    {
      v36 = [v33 headerBackgroundColor];
      [(BKLibraryBookshelfCollectionInfoHeader *)self setBackgroundColor:v36];
    }
    [v10 setContentHorizontalAlignment:0];
    [v33 cloudButtonSpacing];
    -[BKLibraryBookshelfCollectionInfoHeader setCloudButtonSpacing:](self, "setCloudButtonSpacing:");
    [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];
    [(BKLibraryBookshelfCollectionInfoHeader *)self updateCounts];
    [(BKLibraryBookshelfCollectionInfoHeader *)self _updateMetricsForUploadStatusViewController];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    id v5 = +[BKLibraryManager defaultManager];
    double v6 = +[NSNotificationCenter defaultCenter];
    unsigned __int8 v7 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
    [v7 removeObserver:self forKeyPath:@"sortMode" context:off_100B1FCB8];

    double v8 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];

    if (v8) {
      [v6 removeObserver:self name:BKLibraryOwnershipDidChangeNotification object:v5];
    }
    objc_storeWeak((id *)&self->_dataSource, obj);
    id v9 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
    -[BKLibraryBookshelfCollectionInfoHeader setIsSeriesCollection:](self, "setIsSeriesCollection:", [v9 collectionIsSeries]);

    uint64_t v10 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
    if (v10)
    {
      double v11 = (void *)v10;
      unsigned int v12 = [(BKLibraryBookshelfCollectionInfoHeader *)self isSeriesCollection];

      if (v12) {
        [v6 addObserver:self selector:"_ownershipDidChange:" name:BKLibraryOwnershipDidChangeNotification object:v5];
      }
    }
    double v13 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
    [v13 addObserver:self forKeyPath:@"sortMode" options:0 context:off_100B1FCB8];

    [(BKLibraryBookshelfCollectionInfoHeader *)self sortModeDidChange];
  }
}

- (void)_ownershipDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100162624;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_mocWillSave:(id)a3
{
  id v4 = a3;
  if (![(BKLibraryBookshelfCollectionInfoHeader *)self isSeriesCollection])
  {
    id v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self frc];
    double v6 = [v5 fetchRequest];
    unsigned __int8 v7 = [v6 entityName];
    unsigned int v8 = [v7 isEqualToString:@"BKCollectionMember"];

    if (v8)
    {
      id v9 = [v4 object];
      [v9 updatedObjects];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      unsigned int v12 = v10;
      if (v11)
      {
        id v13 = v11;
        id v25 = v9;
        id v26 = v4;
        uint64_t v27 = self;
        uint64_t v14 = *(void *)v29;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v10);
            }
            CFStringRef v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            double v17 = [v16 entity];
            double v18 = [v17 name];
            unsigned int v19 = [v18 isEqualToString:@"BKLibraryAsset"];

            if (v19)
            {
              id v20 = [v16 changedValues];
              id v21 = [v20 allKeys];
              id v22 = +[NSSet setWithArray:v21];
              id v23 = [(BKLibraryBookshelfCollectionInfoHeader *)v27 propertiesOfInterest];
              unsigned int v24 = [v22 intersectsSet:v23];

              if (v24)
              {

                unsigned int v12 = [(BKLibraryBookshelfCollectionInfoHeader *)v27 coalescedReloadData];
                [v12 signalWithCompletion:&stru_100A489A8];
                goto LABEL_14;
              }
            }
          }
          id v13 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        unsigned int v12 = v10;
LABEL_14:
        id v9 = v25;
        id v4 = v26;
      }
    }
  }
}

- (void)sortModeDidChange
{
  if ([(BKLibraryBookshelfCollectionInfoHeader *)self isSeriesCollection])
  {
    [(BKLibraryBookshelfCollectionInfoHeader *)self updateCounts];
    [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];
    [(BKLibraryBookshelfCollectionInfoHeader *)self setNeedsLayout];
  }
  else
  {
    id v3 = [(BKLibraryBookshelfCollectionInfoHeader *)self dataSource];
    id v4 = [v3 currentSortMode];

    id v5 = [v4 predicate];
    double v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self frc];
    unsigned __int8 v7 = [v6 fetchRequest];
    unsigned int v8 = [v7 predicate];
    unsigned __int8 v9 = [v5 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = objc_alloc((Class)NSFetchRequest);
      id v11 = [v4 entityName];
      id v12 = [v10 initWithEntityName:v11];

      id v13 = [v4 entityName];
      unsigned int v14 = [v13 isEqualToString:@"BKLibraryAsset"];

      [v12 setPredicate:v5];
      if (v14) {
        CFStringRef v15 = @"contentType";
      }
      else {
        CFStringRef v15 = @"asset.contentType";
      }
      CFStringRef v16 = +[NSSortDescriptor sortDescriptorWithKey:v15 ascending:1];
      unsigned int v24 = v16;
      double v17 = +[NSArray arrayWithObjects:&v24 count:1];
      [v12 setSortDescriptors:v17];

      id v18 = objc_alloc((Class)NSFetchedResultsController);
      unsigned int v19 = +[BKLibraryManager defaultManager];
      id v20 = [v19 uiChildContext];
      id v21 = [v18 initWithFetchRequest:v12 managedObjectContext:v20 sectionNameKeyPath:v15 cacheName:0];
      [(BKLibraryBookshelfCollectionInfoHeader *)self setFrc:v21];

      id v22 = [(BKLibraryBookshelfCollectionInfoHeader *)self frc];
      [v22 performFetch:0];

      id v23 = [(BKLibraryBookshelfCollectionInfoHeader *)self frc];
      [v23 setDelegate:self];

      [(BKLibraryBookshelfCollectionInfoHeader *)self updateCounts];
      [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];
      [(BKLibraryBookshelfCollectionInfoHeader *)self setNeedsLayout];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  [(BKLibraryBookshelfCollectionInfoHeader *)self updateCounts];
  [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];

  [(BKLibraryBookshelfCollectionInfoHeader *)self setNeedsLayout];
}

- (void)updateAndLayoutCloudButtonAnimated
{
  [(BKLibraryBookshelfCollectionInfoHeader *)self updateCloudButton];
  id v3 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
  [v3 layoutIfNeeded];

  [(BKLibraryBookshelfCollectionInfoHeader *)self setNeedsLayout];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100162C80;
  v4[3] = &unk_100A43D60;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B1FCB8 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100162EC0;
    v18[3] = &unk_100A43D60;
    v18[4] = self;
    id v13 = v18;
LABEL_10:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_11;
  }
  if (off_100B1FCC0 == a6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100162EC8;
    v17[3] = &unk_100A43D60;
    v17[4] = self;
    id v13 = v17;
    goto LABEL_10;
  }
  if (off_100B1FCC8 == a6)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100162ED0;
    v16[3] = &unk_100A43D60;
    void v16[4] = self;
    id v13 = v16;
    goto LABEL_10;
  }
  if (off_100B1FCD0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100162F54;
    block[3] = &unk_100A43D60;
    block[4] = self;
    id v13 = block;
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfCollectionInfoHeader;
  [(BKLibraryBookshelfCollectionInfoHeader *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_11:
}

- (void)networkReachabilityChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100162FD0;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_updateMetricsForUploadStatusViewController
{
  objc_opt_class();
  id v3 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
  id v4 = [v3 topViewController];
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self mainHeaderMetrics];
  [v6 setMainHeaderMetrics:v5];
}

- (void)uploadProgressButtonPressed:(id)a3
{
  if ([(BKLibraryBookshelfCollectionInfoHeader *)self wantsCloudButton])
  {
    id v4 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];

    if (!v4)
    {
      id v5 = [BKLibraryUploadStatusViewController alloc];
      id v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self mainHeaderMetrics];
      uint64_t v27 = [(BKLibraryUploadStatusViewController *)v5 initWithMetrics:v6];

      [(BKLibraryUploadStatusViewController *)v27 setDelegate:self];
      unsigned __int8 v7 = [[BKLibraryUploadStatusNavigationController alloc] initWithRootViewController:v27];
      [(BKLibraryBookshelfCollectionInfoHeader *)self setUploadProgressNavigationController:v7];

      unsigned int v8 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
      [v8 setModalPresentationStyle:7];

      unsigned __int8 v9 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
      id v10 = [v9 popoverPresentationController];

      [v10 setDelegate:self];
      id v11 = [(BKLibraryBookshelfCollectionInfoHeader *)self cloudButton];
      [v10 setSourceView:v11];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      [v11 touchInsets];
      [v10 setSourceRect:v13 + v23, v15 + v20, v17 - (v23 + v21), v19 - (v20 + v22)];
      unsigned int v24 = [(BKLibraryBookshelfCollectionInfoHeader *)self actionHandler];
      id v25 = [v24 presentationController];
      id v26 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
      [v25 presentViewController:v26 animated:1 completion:0];
    }
  }
}

- (void)libraryUploadStatusViewControllerDismissed:(id)a3
{
}

- (id)libraryUploadStatusPresentingViewController
{
  v2 = [(BKLibraryBookshelfCollectionInfoHeader *)self actionHandler];
  id v3 = [v2 presentationController];

  return v3;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v6 = a3;
  id v4 = [v6 presentedViewController];
  id v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];

  if (v4 == v5)
  {
    [v6 setDelegate:0];
    [(BKLibraryBookshelfCollectionInfoHeader *)self setUploadProgressNavigationController:0];
  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = [a3 presentedViewController];
  id v5 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];

  if (v4 == v5)
  {
    objc_opt_class();
    id v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
    unsigned __int8 v7 = [v6 topViewController];
    BUDynamicCast();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    [v8 setPresentedInPopover:1];
  }
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5 = [a3 presentedViewController];
  id v6 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];

  if (v5 == v6)
  {
    objc_opt_class();
    unsigned __int8 v7 = [(BKLibraryBookshelfCollectionInfoHeader *)self uploadProgressNavigationController];
    id v8 = [v7 topViewController];
    unsigned __int8 v9 = BUDynamicCast();

    [v9 setPresentedInPopover:0];
  }
  return 0;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v4 = a4;
  id v5 = [v4 horizontalSizeClass];
  id v6 = [v4 verticalSizeClass];

  if (v6 == (id)1 || v5 == (id)1) {
    return 0;
  }
  else {
    return 7;
  }
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (BKLibraryActionHandler *)WeakRetained;
}

- (BKLibraryLayoutAttributes)attrs
{
  return self->_attrs;
}

- (void)setAttrs:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (IMTouchInsetsButton)cloudButton
{
  return self->_cloudButton;
}

- (void)setCloudButton:(id)a3
{
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)cloudButtonSpacing
{
  return self->_cloudButtonSpacing;
}

- (void)setCloudButtonSpacing:(double)a3
{
  self->_cloudButtonSpacing = a3;
}

- (BOOL)wantsCloudButton
{
  return self->_wantsCloudButton;
}

- (void)setWantsCloudButton:(BOOL)a3
{
  self->_wantsCloudButton = a3;
}

- (BOOL)waitingForCloudButtonHideDelay
{
  return self->_waitingForCloudButtonHideDelay;
}

- (void)setWaitingForCloudButtonHideDelay:(BOOL)a3
{
  self->_waitingForCloudButtonHideDelay = a3;
}

- (BOOL)isSeriesCollection
{
  return self->_isSeriesCollection;
}

- (void)setIsSeriesCollection:(BOOL)a3
{
  self->_isSeriesCollection = a3;
}

- (BOOL)isObservingPropertyChanges
{
  return self->_isObservingPropertyChanges;
}

- (void)setIsObservingPropertyChanges:(BOOL)a3
{
  self->_isObservingPropertyChanges = a3;
}

- (UINavigationController)uploadProgressNavigationController
{
  return self->_uploadProgressNavigationController;
}

- (void)setUploadProgressNavigationController:(id)a3
{
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (void)setPropertiesOfInterest:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedReloadData
{
  return self->_coalescedReloadData;
}

- (void)setCoalescedReloadData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedReloadData, 0);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_uploadProgressNavigationController, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_cloudButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
  objc_destroyWeak((id *)&self->_actionHandler);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end