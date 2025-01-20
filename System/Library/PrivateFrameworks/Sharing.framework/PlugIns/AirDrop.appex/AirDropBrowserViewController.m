@interface AirDropBrowserViewController
+ (BOOL)airDropActivityCanPerformActivityWithItemClasses:(id)a3;
- (AirDropBrowserViewController)initWithCoder:(id)a3;
- (AirDropBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AirDropBrowserViewControllerDelegate)airDropDelegate;
- (AirDropNoContentView)airDropNoContentView;
- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8;
- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6;
- (BOOL)addItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7;
- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)canShowNoContentView;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9;
- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5;
- (BOOL)showNoContentView;
- (CGSize)suggestedThumbnailSize;
- (NSArray)knownPeople;
- (NSArray)mePeople;
- (NSArray)unknownPeople;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSLayoutConstraint)collectionViewTopConstraint;
- (NSMutableArray)activeSecurityContexts;
- (NSMutableSet)realNamesWithTransfersStartedFromMagicHead;
- (NSUUID)magicHeadUUID;
- (SFAirDropMagicHeadViewController)magicHeadVC;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIVisualEffectView)backgroundView;
- (id)airDropCollectionViewLayout;
- (id)cellForPerson:(id)a3;
- (void)_collectTelemetryForPeople:(id)a3;
- (void)_emitTelemetryForPerson:(id)a3;
- (void)_startTelemetry;
- (void)_stopTelemetry;
- (void)allowContentViewToShow;
- (void)browserDidUpdateMePeople:(id)a3 knownPeople:(id)a4 unknownPeople:(id)a5;
- (void)cancelTransferForCell:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4 cellInitiator:(BOOL)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)donePressed;
- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3;
- (void)handleImageItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (void)handleLivePhotoItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (void)handleOtherItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7;
- (void)layoutAirDropCollectionViewAnimated:(BOOL)a3;
- (void)magicHeadViewControllerDidFinishTransferForNode:(id)a3;
- (void)magicHeadViewControllerDidStartTransferForNode:(id)a3;
- (void)magicHeadViewControllerDidTerminateTransferForNode:(id)a3;
- (void)magicHeadViewControllerToggleSelectionForNode:(id)a3;
- (void)noContentViewActionTriggered:(id)a3;
- (void)personCollectionViewCellDidFinishTransfer:(id)a3;
- (void)personCollectionViewCellDidStartTransfer:(id)a3;
- (void)personCollectionViewCellDidTerminateTransfer:(id)a3;
- (void)requestingSharedItemsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveSecurityContexts:(id)a3;
- (void)setAirDropDelegate:(id)a3;
- (void)setAirDropNoContentView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCanShowNoContentView:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewTopConstraint:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setKnownPeople:(id)a3;
- (void)setMagicHeadUUID:(id)a3;
- (void)setMagicHeadVC:(id)a3;
- (void)setMePeople:(id)a3;
- (void)setRealNamesWithTransfersStartedFromMagicHead:(id)a3;
- (void)setShowNoContentView:(BOOL)a3;
- (void)setUnknownPeople:(id)a3;
- (void)startBrowsing;
- (void)startTransferForPeople:(id)a3;
- (void)stopBrowsing;
- (void)subscribeToProgresses;
- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4;
- (void)unpublishedProgressForPersonWithRealName:(id)a3;
- (void)unsubscribeToProgresses;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)wirelessSettingsDidChange:(id)a3;
@end

@implementation AirDropBrowserViewController

- (AirDropBrowserViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AirDropBrowserViewController;
  return [(AirDropBrowserViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (AirDropBrowserViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AirDropBrowserViewController;
  return [(AirDropBrowserViewController *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  [(AirDropBrowserViewController *)self stopBrowsing];
  v3.receiver = self;
  v3.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v150.receiver = self;
  v150.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v150 viewDidLoad];
  objc_super v3 = +[NSMutableSet set];
  selectedNodes = self->_selectedNodes;
  self->_selectedNodes = v3;

  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"AIRDROP_NAVIGATION_TITLE" value:&stru_100031788 table:0];
  [(AirDropBrowserViewController *)self setTitle:v6];

  v7 = [(AirDropBrowserViewController *)self view];
  [v7 setBackgroundColor:0];

  v8 = +[NSMutableArray array];
  activeSecurityContexts = self->_activeSecurityContexts;
  self->_activeSecurityContexts = v8;

  self->_attachmentCount = 0;
  v10 = +[NSMutableDictionary dictionary];
  personToProgress = self->_personToProgress;
  self->_personToProgress = v10;

  v12 = +[NSMutableDictionary dictionary];
  personToStoredTransferFinalState = self->_personToStoredTransferFinalState;
  self->_personToStoredTransferFinalState = v12;

  v14 = +[NSMutableDictionary dictionary];
  personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
  self->_personToSharedItemsRequestID = v14;

  v16 = +[NSMutableDictionary dictionary];
  sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
  self->_sharedItemsRequestIDToPreviewPhoto = v16;

  v18 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  cachedSharedItems = self->_cachedSharedItems;
  self->_cachedSharedItems = v18;

  v20 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v20;

  [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
  self->_sharedItemsCount = 0;
  v22 = +[NSMutableDictionary dictionary];
  sharedItemsMap = self->_sharedItemsMap;
  self->_sharedItemsMap = v22;

  v24 = +[NSUUID UUID];
  v25 = [v24 UUIDString];
  objc_msgSend(v25, "substringWithRange:", 24, 12);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionID = self->_sessionID;
  self->_sessionID = v26;

  self->_browserPaused = 1;
  self->_canShowNoContentView = [(AirDropBrowserViewController *)self showNoContentView];
  [(AirDropBrowserViewController *)self startBrowsing];
  v144 = +[UIBlurEffect effectWithStyle:9];
  id v28 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v144];
  [(AirDropBrowserViewController *)self setBackgroundView:v28];
  v29 = [(AirDropBrowserViewController *)self backgroundView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(AirDropBrowserViewController *)self view];
  v31 = [(AirDropBrowserViewController *)self backgroundView];
  [v30 addSubview:v31];

  v32 = objc_alloc_init(AirDropNoContentView);
  [(AirDropBrowserViewController *)self setAirDropNoContentView:v32];

  v33 = [(AirDropBrowserViewController *)self airDropNoContentView];
  [v33 setDelegate:self];

  v34 = [(AirDropBrowserViewController *)self airDropNoContentView];
  [v34 setAlpha:0.0];

  v35 = [(AirDropBrowserViewController *)self airDropNoContentView];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = [(AirDropBrowserViewController *)self view];
  v37 = [(AirDropBrowserViewController *)self airDropNoContentView];
  [v36 addSubview:v37];

  if (IsAppleInternalBuild()) {
    BOOL v38 = CFPreferencesGetAppBooleanValue(@"ShowMagicHead", @"com.apple.Sharing", 0) != 0;
  }
  else {
    BOOL v38 = 0;
  }
  v39 = magic_head_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    sub_100022734(v38, v39);
  }

  if (v38)
  {
    v40 = objc_opt_new();
    [(AirDropBrowserViewController *)self setRealNamesWithTransfersStartedFromMagicHead:v40];

    v41 = objc_opt_new();
    [(AirDropBrowserViewController *)self setMagicHeadUUID:v41];

    id v42 = [objc_alloc((Class)SFAirDropMagicHeadViewController) initWithNibName:0 bundle:0];
    [(AirDropBrowserViewController *)self setMagicHeadVC:v42];

    v43 = [(AirDropBrowserViewController *)self magicHeadVC];
    [v43 setNumberOfDots:25];

    v44 = [(AirDropBrowserViewController *)self magicHeadVC];
    [v44 setDotsRadius:2.0];

    v45 = [(AirDropBrowserViewController *)self magicHeadVC];
    [v45 setDelegate:self];
  }
  id v46 = objc_alloc((Class)UICollectionView);
  v47 = [(AirDropBrowserViewController *)self view];
  [v47 bounds];
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  v56 = [(AirDropBrowserViewController *)self airDropCollectionViewLayout];
  id v57 = objc_msgSend(v46, "initWithFrame:collectionViewLayout:", v56, v49, v51, v53, v55);
  [(AirDropBrowserViewController *)self setCollectionView:v57];

  v58 = [(AirDropBrowserViewController *)self collectionView];
  [v58 setDelegate:self];

  v59 = [(AirDropBrowserViewController *)self collectionView];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = [(AirDropBrowserViewController *)self collectionView];
  [v60 setBackgroundColor:0];

  v61 = [(AirDropBrowserViewController *)self collectionView];
  [v61 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"OtherCellID"];

  v62 = [(AirDropBrowserViewController *)self collectionView];
  [v62 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PersonCellID"];

  v63 = [(AirDropBrowserViewController *)self collectionView];
  [v63 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID"];

  v64 = [(AirDropBrowserViewController *)self collectionView];
  [v64 setAlwaysBounceVertical:1];

  v65 = [(AirDropBrowserViewController *)self collectionView];
  [v65 setAllowsMultipleSelection:1];

  v66 = [(AirDropBrowserViewController *)self collectionView];
  [v66 setShowsHorizontalScrollIndicator:0];

  v67 = [(AirDropBrowserViewController *)self collectionView];
  [v67 setShowsVerticalScrollIndicator:0];

  v68 = [(AirDropBrowserViewController *)self collectionView];
  [v68 setRemembersLastFocusedIndexPath:1];

  v69 = [(AirDropBrowserViewController *)self view];
  v70 = [(AirDropBrowserViewController *)self collectionView];
  [v69 addSubview:v70];

  v71 = objc_opt_new();
  v72 = [(AirDropBrowserViewController *)self backgroundView];

  if (v72)
  {
    v73 = [(AirDropBrowserViewController *)self backgroundView];
    v74 = [v73 leadingAnchor];
    v75 = [(AirDropBrowserViewController *)self view];
    v76 = [v75 leadingAnchor];
    v77 = [v74 constraintEqualToAnchor:v76];
    [v71 addObject:v77];

    v78 = [(AirDropBrowserViewController *)self backgroundView];
    v79 = [v78 trailingAnchor];
    v80 = [(AirDropBrowserViewController *)self view];
    v81 = [v80 trailingAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    [v71 addObject:v82];

    v83 = [(AirDropBrowserViewController *)self backgroundView];
    v84 = [v83 topAnchor];
    v85 = [(AirDropBrowserViewController *)self view];
    v86 = [v85 topAnchor];
    v87 = [v84 constraintEqualToAnchor:v86];
    [v71 addObject:v87];

    v88 = [(AirDropBrowserViewController *)self backgroundView];
    v89 = [v88 bottomAnchor];
    v90 = [(AirDropBrowserViewController *)self view];
    v91 = [v90 bottomAnchor];
    v92 = [v89 constraintEqualToAnchor:v91];
    [v71 addObject:v92];
  }
  v93 = [(AirDropBrowserViewController *)self collectionView];
  v94 = [v93 leftAnchor];
  v95 = [(AirDropBrowserViewController *)self view];
  v96 = [v95 leftAnchor];
  v97 = [v94 constraintEqualToAnchor:v96];
  [v71 addObject:v97];

  v98 = [(AirDropBrowserViewController *)self collectionView];
  v99 = [v98 rightAnchor];
  v100 = [(AirDropBrowserViewController *)self view];
  v101 = [v100 rightAnchor];
  v102 = [v99 constraintEqualToAnchor:v101];
  [v71 addObject:v102];

  v103 = [(AirDropBrowserViewController *)self collectionView];
  v104 = [v103 bottomAnchor];
  v105 = [(AirDropBrowserViewController *)self view];
  v106 = [v105 bottomAnchor];
  v107 = [v104 constraintEqualToAnchor:v106];
  [v71 addObject:v107];

  v108 = [(AirDropBrowserViewController *)self collectionViewTopConstraint];

  if (!v108)
  {
    v109 = [(AirDropBrowserViewController *)self collectionView];
    v110 = [v109 topAnchor];
    v111 = [(AirDropBrowserViewController *)self view];
    v112 = [v111 topAnchor];
    v113 = [v110 constraintEqualToAnchor:v112];
    [(AirDropBrowserViewController *)self setCollectionViewTopConstraint:v113];
  }
  v114 = [(AirDropBrowserViewController *)self airDropNoContentView];
  v115 = [v114 leadingAnchor];
  v116 = [(AirDropBrowserViewController *)self view];
  v117 = [v116 leadingAnchor];
  v118 = [v115 constraintEqualToAnchor:v117 constant:24.0];
  [v71 addObject:v118];

  v119 = [(AirDropBrowserViewController *)self airDropNoContentView];
  v120 = [v119 trailingAnchor];
  v121 = [(AirDropBrowserViewController *)self view];
  v122 = [v121 trailingAnchor];
  v123 = [v120 constraintEqualToAnchor:v122 constant:-24.0];
  [v71 addObject:v123];

  v124 = [(AirDropBrowserViewController *)self airDropNoContentView];
  v125 = [(AirDropBrowserViewController *)self view];
  v126 = +[NSLayoutConstraint constraintWithItem:v124 attribute:10 relatedBy:0 toItem:v125 attribute:10 multiplier:0.95 constant:0.0];
  [v71 addObject:v126];

  +[NSLayoutConstraint activateConstraints:v71];
  v127 = [(AirDropBrowserViewController *)self collectionViewTopConstraint];
  [v127 setActive:1];

  id location = 0;
  objc_initWeak(&location, self);
  id v128 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v129 = [(AirDropBrowserViewController *)self collectionView];
  v147[0] = _NSConcreteStackBlock;
  v147[1] = 3221225472;
  v147[2] = sub_100006FC4;
  v147[3] = &unk_100030F60;
  objc_copyWeak(&v148, &location);
  id v130 = [v128 initWithCollectionView:v129 cellProvider:v147];

  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_100007288;
  v145[3] = &unk_100030F88;
  objc_copyWeak(&v146, &location);
  [v130 setSupplementaryViewProvider:v145];
  [(AirDropBrowserViewController *)self setDataSource:v130];
  v131 = [(AirDropBrowserViewController *)self view];
  [v131 setClipsToBounds:1];

  v132 = +[UIDevice currentDevice];
  id v133 = [v132 userInterfaceIdiom];

  if (v133 == (id)6)
  {
    id v134 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"donePressed"];
    v135 = [(AirDropBrowserViewController *)self navigationItem];
    [v135 setLeftBarButtonItem:v134];
  }
  else
  {
    id v134 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"donePressed"];
    v135 = [(AirDropBrowserViewController *)self navigationItem];
    [v135 setRightBarButtonItem:v134];
  }

  v136 = [(AirDropBrowserViewController *)self navigationItem];
  [v136 _setManualScrollEdgeAppearanceEnabled:1];

  id v137 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v137 configureWithTransparentBackground];
  v138 = +[UIColor separatorColor];
  [v137 setShadowColor:v138];

  v139 = [(AirDropBrowserViewController *)self navigationItem];
  [v139 setScrollEdgeAppearance:v137];

  id v140 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v140 configureWithDefaultBackground];
  v141 = +[UIColor separatorColor];
  [v140 setShadowColor:v141];

  v142 = [(AirDropBrowserViewController *)self navigationItem];
  [v142 setStandardAppearance:v140];

  v143 = [(AirDropBrowserViewController *)self navigationItem];
  [v143 _setManualScrollEdgeAppearanceProgress:1.0];

  objc_destroyWeak(&v146);
  objc_destroyWeak(&v148);
  objc_destroyWeak(&location);
}

- (id)airDropCollectionViewLayout
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007520;
  v5[3] = &unk_100030FB0;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v30 = a4;
  id v7 = a5;
  v8 = [(AirDropBrowserViewController *)self currentSnapshot];
  v9 = [v8 sectionIdentifiers];
  id v10 = [v7 section];

  v11 = [v9 objectAtIndexedSubscript:v10];

  if ([v11 isEqualToString:@"OtherSection"])
  {
    v12 = [(AirDropBrowserViewController *)self magicHeadVC];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 view];
      v15 = [v30 contentView];
      [v15 bounds];
      objc_msgSend(v14, "setFrame:");
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      v16 = [v15 subviews];
      [v16 makeObjectsPerformSelector:"removeFromSuperview"];

      [v13 willMoveToParentViewController:self];
      [(AirDropBrowserViewController *)self addChildViewController:v13];
      [v15 addSubview:v14];
      [v13 didMoveToParentViewController:self];
      v17 = objc_opt_new();
      v18 = [v14 leftAnchor];
      v19 = [v15 leftAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      [v17 addObject:v20];

      v21 = [v14 rightAnchor];
      v22 = [v15 rightAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v17 addObject:v23];

      v24 = [v14 topAnchor];
      v25 = [v15 topAnchor];
      v26 = [v24 constraintEqualToAnchor:v25 constant:22.0];
      [v17 addObject:v26];

      v27 = [v14 bottomAnchor];
      id v28 = [v15 bottomAnchor];
      v29 = [v27 constraintEqualToAnchor:v28];
      [v17 addObject:v29];

      +[NSLayoutConstraint activateConstraints:v17];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v4 addObserver:self selector:"willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  objc_super v5 = [(AirDropBrowserViewController *)self airDropDelegate];
  id v6 = [v5 _hostApplicationBundleIdentifier];
  sendingAppBundleID = self->_sendingAppBundleID;
  self->_sendingAppBundleID = v6;

  [(AirDropBrowserViewController *)self subscribeToProgresses];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v5 viewDidAppear:a3];
  id v3 = airdrop_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AirDropBrowserViewController did appear", v4, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  [v5 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
  [(AirDropBrowserViewController *)self stopBrowsing];
  v6.receiver = self;
  v6.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewLayoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)AirDropBrowserViewController;
  [(AirDropBrowserViewController *)&v5 viewLayoutMarginsDidChange];
  BOOL v3 = [(AirDropBrowserViewController *)self collectionView];
  objc_super v4 = [(AirDropBrowserViewController *)self airDropCollectionViewLayout];
  [v3 setCollectionViewLayout:v4];
}

- (void)startBrowsing
{
  if (self->_browserPaused)
  {
    self->_browserPaused = 0;
    if (self->_browser) {
      [(AirDropBrowserViewController *)self stopBrowsing];
    }
    [(AirDropBrowserViewController *)self _startTelemetry];
    BOOL v3 = (SFAirDropBrowser *)objc_alloc_init((Class)SFAirDropBrowser);
    browser = self->_browser;
    self->_browser = v3;

    [(SFAirDropBrowser *)self->_browser setSessionID:self->_sessionID];
    [(SFAirDropBrowser *)self->_browser setDiffableDelegate:self];
    [(SFAirDropBrowser *)self->_browser start];
    objc_super v5 = (SFWirelessSettingsController *)objc_alloc_init((Class)SFWirelessSettingsController);
    wirelessSettingsController = self->_wirelessSettingsController;
    self->_wirelessSettingsController = v5;

    id v7 = self->_wirelessSettingsController;
    [(SFWirelessSettingsController *)v7 setDelegate:self];
  }
}

- (void)stopBrowsing
{
  if (!self->_browserPaused)
  {
    self->_browserPaused = 1;
    [(AirDropBrowserViewController *)self unsubscribeToProgresses];
    [(SFAirDropBrowser *)self->_browser stop];
    [(SFAirDropBrowser *)self->_browser setDiffableDelegate:0];
    browser = self->_browser;
    self->_browser = 0;

    id v4 = [(AirDropBrowserViewController *)self magicHeadVC];
    [v4 setEnabled:0];
  }
}

- (void)donePressed
{
  BOOL v3 = [(AirDropBrowserViewController *)self airDropDelegate];
  [v3 airDropViewServiceDidRequestDismissal];

  [(AirDropBrowserViewController *)self stopBrowsing];
}

- (void)allowContentViewToShow
{
}

- (void)noContentViewActionTriggered:(id)a3
{
  id v4 = a3;
  id v5 = [(AirDropBrowserViewController *)self airDropNoContentView];

  if (v5 == v4)
  {
    [(AirDropBrowserViewController *)self setCanShowNoContentView:0];
    [(SFWirelessSettingsController *)self->_wirelessSettingsController setWifiEnabled:1];
    [(SFWirelessSettingsController *)self->_wirelessSettingsController setBluetoothEnabled:1];
    [(SFWirelessSettingsController *)self->_wirelessSettingsController setWirelessAccessPointEnabled:0];
    id location = 0;
    objc_initWeak(&location, self);
    objc_super v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    objc_super v8 = sub_100008414;
    v9 = &unk_100030FD8;
    objc_copyWeak(&v10, &location);
    +[UIView animateWithDuration:&v6 animations:0.25];
    -[AirDropBrowserViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "allowContentViewToShow", 0, 2.0, v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)wirelessSettingsDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isWifiEnabled];
  unsigned int v6 = [v4 isBluetoothEnabled];
  unsigned int v7 = [v4 isWirelessAccessPointEnabled];
  unsigned int v8 = [v4 deviceSupportsWAPI];
  id v9 = [v4 ultraWideBandStatus];
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "no";
    if (v9 != (id)1) {
      v11 = "yes";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UWB Status in AirDrop is %s", buf, 0xCu);
  }
  BOOL v12 = v9 != (id)1;

  v13 = [(AirDropBrowserViewController *)self currentSnapshot];
  v14 = [v13 sectionIdentifiers];
  unsigned int v15 = [v14 containsObject:@"OtherSection"];

  if ((v15 & v12 & 1) == 0) {
    [(AirDropBrowserViewController *)self layoutAirDropCollectionViewAnimated:1];
  }
  if (v7)
  {
    v16 = [(AirDropBrowserViewController *)self airDropNoContentView];
    [v16 setViewType:7];
  }
  else
  {
    v17 = [(AirDropBrowserViewController *)self airDropNoContentView];
    v16 = v17;
    if ((v5 | v6))
    {
      if (v5)
      {
        if (v6) {
          [v17 setViewType:0];
        }
        else {
          [v17 setViewType:3];
        }
      }
      else if (v8)
      {
        [v17 setViewType:2];
      }
      else
      {
        [v17 setViewType:1];
      }
    }
    else if (v8)
    {
      [v17 setViewType:5];
    }
    else
    {
      [v17 setViewType:4];
    }
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_100008794;
  v21 = &unk_100031000;
  char v23 = v5;
  char v24 = v6;
  char v25 = v7;
  objc_copyWeak(&v22, (id *)buf);
  +[UIView animateWithDuration:&v18 animations:0.25];
  -[AirDropBrowserViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "allowContentViewToShow", 0, 2.0, v18, v19, v20, v21);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)browserDidUpdateMePeople:(id)a3 knownPeople:(id)a4 unknownPeople:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(AirDropBrowserViewController *)self setMePeople:a3];
  [(AirDropBrowserViewController *)self setKnownPeople:v9];

  [(AirDropBrowserViewController *)self setUnknownPeople:v8];
  id v10 = [(AirDropBrowserViewController *)self currentSnapshot];
  BOOL v11 = [v10 numberOfItems] != 0;

  [(AirDropBrowserViewController *)self layoutAirDropCollectionViewAnimated:v11];
  id v12 = objc_alloc((Class)NSMutableArray);
  v13 = [(AirDropBrowserViewController *)self mePeople];
  v14 = (char *)[v13 count];
  unsigned int v15 = [(AirDropBrowserViewController *)self knownPeople];
  v16 = &v14[(void)[v15 count]];
  v17 = [(AirDropBrowserViewController *)self unknownPeople];
  id v22 = objc_msgSend(v12, "initWithCapacity:", (char *)objc_msgSend(v17, "count") + (void)v16);

  v18 = [(AirDropBrowserViewController *)self mePeople];
  [v22 addObjectsFromArray:v18];

  uint64_t v19 = [(AirDropBrowserViewController *)self knownPeople];
  [v22 addObjectsFromArray:v19];

  v20 = [(AirDropBrowserViewController *)self magicHeadVC];
  [v20 updateNodes:v22 withPersonToProgress:self->_personToProgress];

  v21 = [(AirDropBrowserViewController *)self unknownPeople];
  [v22 addObjectsFromArray:v21];

  [(AirDropBrowserViewController *)self _collectTelemetryForPeople:v22];
}

- (void)layoutAirDropCollectionViewAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  unsigned int v6 = [(AirDropBrowserViewController *)self mePeople];
  if ([v6 count])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [(AirDropBrowserViewController *)self knownPeople];
    if ([v8 count])
    {
      BOOL v7 = 0;
    }
    else
    {
      id v9 = [(AirDropBrowserViewController *)self unknownPeople];
      BOOL v7 = [v9 count] == 0;
    }
  }

  unsigned int v10 = [(SFWirelessSettingsController *)self->_wirelessSettingsController isWifiEnabled];
  id location = 0;
  objc_initWeak(&location, self);
  if (v7)
  {
    if ((([(AirDropBrowserViewController *)self canShowNoContentView] | v10 ^ 1) & 1) == 0) {
      goto LABEL_16;
    }
  }
  else if (v10)
  {
    goto LABEL_16;
  }
  BOOL v11 = airdrop_ui_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v43 = v7;
    unsigned int v44 = v3;
    id v12 = [(AirDropBrowserViewController *)self mePeople];
    id v13 = [v12 count];
    v14 = [(AirDropBrowserViewController *)self knownPeople];
    id v15 = [v14 count];
    v16 = [(AirDropBrowserViewController *)self unknownPeople];
    id v17 = [v16 count];
    CFStringRef v18 = @"off";
    *(_DWORD *)buf = 134218754;
    id v53 = v13;
    __int16 v54 = 2048;
    if (v10) {
      CFStringRef v18 = @"on";
    }
    id v55 = v15;
    __int16 v56 = 2048;
    id v57 = v17;
    __int16 v58 = 2112;
    CFStringRef v59 = v18;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Showing AirDrop no content view, found %lu mePeople, %lu knownPeople, %lu unknownPeople when wifi is %@", buf, 0x2Au);

    BOOL v7 = v43;
    uint64_t v3 = v44;
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000090AC;
  v48[3] = &unk_100030FD8;
  objc_copyWeak(&v49, &location);
  +[UIView animateWithDuration:v48 animations:0.25];
  objc_destroyWeak(&v49);
LABEL_16:
  uint64_t v19 = [(AirDropBrowserViewController *)self magicHeadVC];
  if ([v19 shouldBeHidden])
  {
LABEL_22:

    goto LABEL_23;
  }
  v20 = [(AirDropBrowserViewController *)self magicHeadUUID];
  v21 = v20;
  if (!v20 || v7)
  {

    goto LABEL_22;
  }
  BOOL v22 = [(SFWirelessSettingsController *)self->_wirelessSettingsController ultraWideBandStatus] == (id)1;

  if (!v22)
  {
    char v23 = [(AirDropBrowserViewController *)self magicHeadVC];
    [v23 setEnabled:1];

    [v5 appendSectionsWithIdentifiers:&off_100032078];
    char v24 = [(AirDropBrowserViewController *)self magicHeadUUID];
    double v51 = v24;
    char v25 = +[NSArray arrayWithObjects:&v51 count:1];
    [v5 appendItemsWithIdentifiers:v25 intoSectionWithIdentifier:@"OtherSection"];

    goto LABEL_24;
  }
LABEL_23:
  char v24 = [(AirDropBrowserViewController *)self magicHeadVC];
  [v24 setEnabled:0];
LABEL_24:

  v26 = [(AirDropBrowserViewController *)self knownPeople];
  id v27 = [v26 count];

  if (v27)
  {
    [v5 appendSectionsWithIdentifiers:&off_100032090];
    id v28 = [(AirDropBrowserViewController *)self knownPeople];
    v29 = [v28 valueForKey:@"nodeIdentifier"];
    [v5 appendItemsWithIdentifiers:v29 intoSectionWithIdentifier:@"AIRDROP_HEADER_KNOWN_PEOPLE"];
  }
  id v30 = [(AirDropBrowserViewController *)self mePeople];
  id v31 = [v30 count];

  if (v31)
  {
    [v5 appendSectionsWithIdentifiers:&off_1000320A8];
    v32 = [(AirDropBrowserViewController *)self mePeople];
    v33 = [v32 valueForKey:@"nodeIdentifier"];
    [v5 appendItemsWithIdentifiers:v33 intoSectionWithIdentifier:@"AIRDROP_HEADER_YOUR_DEVICES"];
  }
  v34 = [(AirDropBrowserViewController *)self unknownPeople];
  id v35 = [v34 count];

  if (v35)
  {
    [v5 appendSectionsWithIdentifiers:&off_1000320C0];
    v36 = [(AirDropBrowserViewController *)self unknownPeople];
    v37 = [v36 valueForKey:@"nodeIdentifier"];
    [v5 appendItemsWithIdentifiers:v37 intoSectionWithIdentifier:@"AIRDROP_HEADER_UNKNOWN_DEVICES"];
  }
  id v38 = [(AirDropBrowserViewController *)self currentSnapshot];
  id v39 = v5;
  v40 = v39;
  if (v38 == v39)
  {
  }
  else
  {
    if ((v39 != 0) != (v38 == 0))
    {
      unsigned __int8 v41 = [v38 isEqual:v39];

      if (v41) {
        goto LABEL_37;
      }
    }
    else
    {
    }
    [(AirDropBrowserViewController *)self setCurrentSnapshot:v40];
    id v42 = [(AirDropBrowserViewController *)self dataSource];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000913C;
    v45[3] = &unk_100031028;
    BOOL v47 = v7;
    objc_copyWeak(&v46, &location);
    [v42 applySnapshot:v40 animatingDifferences:v3 completion:v45];

    objc_destroyWeak(&v46);
  }
LABEL_37:
  objc_destroyWeak(&location);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v16 = a3;
  id v4 = [(AirDropBrowserViewController *)self collectionView];

  id v5 = v16;
  if (v4 == v16)
  {
    unsigned int v6 = [(AirDropBrowserViewController *)self navigationController];
    BOOL v7 = [v6 navigationBar];
    [v7 frame];
    double v9 = v8;

    [v16 contentOffset];
    if (v10 <= -v9)
    {
      id v13 = [(AirDropBrowserViewController *)self navigationItem];
      v14 = v13;
      double v15 = 0.0;
    }
    else
    {
      [v16 contentOffset];
      double v12 = fmin((v9 + v11) * 10.0, 100.0) / 100.0;
      id v13 = [(AirDropBrowserViewController *)self navigationItem];
      v14 = v13;
      double v15 = v12;
    }
    [v13 _setManualScrollEdgeAppearanceProgress:v15];

    id v5 = v16;
  }
}

- (id)cellForPerson:(id)a3
{
  dataSource = self->_dataSource;
  id v5 = [a3 nodeIdentifier];
  unsigned int v6 = [(UICollectionViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5];

  BOOL v7 = [(AirDropBrowserViewController *)self collectionView];
  double v8 = [v7 cellForItemAtIndexPath:v6];

  return v8;
}

- (void)startTransferForPeople:(id)a3
{
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = a3;
  id v42 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v54;
    *(void *)&long long v3 = 138412546;
    long long v38 = v3;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        unsigned int v44 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [(AirDropBrowserViewController *)self _emitTelemetryForPerson:v38];
        personToSharedItemsRequestID = self->_personToSharedItemsRequestID;
        id v5 = [v44 realName];
        unsigned int v6 = [(NSMutableDictionary *)personToSharedItemsRequestID objectForKeyedSubscript:v5];

        if (v6)
        {
          BOOL v7 = [(NSMutableDictionary *)self->_sharedItemsRequestIDToPreviewPhoto objectForKeyedSubscript:v6];
          id v46 = +[NSMutableArray array];
          double v8 = self->_cachedSharedItems;
          objc_sync_enter(v8);
          id v9 = [(NSMutableOrderedSet *)self->_cachedSharedItems copy];
          objc_sync_exit(v8);

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v47 = v9;
          unsigned __int8 v10 = 0;
          unsigned __int8 v11 = 0;
          double v12 = 0;
          id v13 = [v47 countByEnumeratingWithState:&v49 objects:v61 count:16];
          if (!v13) {
            goto LABEL_22;
          }
          uint64_t v14 = *(void *)v50;
          while (1)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v50 != v14) {
                objc_enumerationMutation(v47);
              }
              id v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
              id v17 = [v16 identifer];
              if (v17 == [v6 integerValue])
              {
                CFStringRef v18 = [v16 URL];
                BOOL v19 = v18 == 0;

                if (!v19)
                {
                  if (v7)
                  {
                    if (!v12)
                    {
LABEL_18:
                      double v12 = [v16 payloadDescription];
                    }
                  }
                  else
                  {
                    BOOL v7 = [v16 previewImage];
                    if (!v12) {
                      goto LABEL_18;
                    }
                  }
                  unsigned __int8 v20 = [v16 wasString];
                  [v46 addObject:v16];
                  v10 |= v20;
                  v11 |= v20 ^ 1;
                  continue;
                }
              }
            }
            id v13 = [v47 countByEnumeratingWithState:&v49 objects:v61 count:16];
            if (!v13)
            {
LABEL_22:

              v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v46 count]);
              if ([v46 count])
              {
                unint64_t v22 = 0;
                do
                {
                  char v23 = [v46 objectAtIndexedSubscript:v22];
                  char v24 = v23;
                  if ((v10 & v11 & 1) == 0 || ([v23 wasString] & 1) == 0)
                  {
                    char v25 = [v24 URL];
                    [v21 addObject:v25];
                  }
                  ++v22;
                }
                while ((unint64_t)[v46 count] > v22);
              }
              id v48 = 0;
              unsigned __int8 v26 = [(AirDropBrowserViewController *)self isValidPayload:v21 toPerson:v44 invalidMessage:&v48];
              id v27 = v48;
              if (v26)
              {
                sendingAppBundleID = self->_sendingAppBundleID;
                sessionID = self->_sessionID;
                SFScaleAndRotateImage();
                id v30 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:", sendingAppBundleID, sessionID, v21, v12, objc_msgSend(v30, "CGImage"), 0);
              }
              else
              {
                id v30 = (id)objc_opt_new();
                v32 = SFLocalizedStringForKey();
                [v30 setTitle:v32];

                [v30 setMessage:v27];
                v33 = SFLocalizedStringForKey();
                [v30 setDefaultButtonTitle:v33];

                [v30 present];
                v34 = [(AirDropBrowserViewController *)self cellForPerson:v44];

                [v34 userDidCancel];
                id v35 = [(AirDropBrowserViewController *)self collectionView];
                v36 = [(AirDropBrowserViewController *)self collectionView];
                v37 = [v36 indexPathForCell:v34];
                [v35 deselectItemAtIndexPath:v37 animated:0];

                id v27 = v34;
              }

              goto LABEL_34;
            }
          }
        }
        BOOL v7 = airdrop_ui_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          id v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = v38;
          __int16 v58 = v31;
          __int16 v59 = 2112;
          v60 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ failed to find request ID for %@", buf, 0x16u);
        }
LABEL_34:
      }
      id v42 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v42);
  }
}

- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  SFFakeFilesAndItemsArrayForURLs();
  id v8 = 0;
  id v9 = 0;
  __int16 v70 = 0;
  uint64_t v69 = 0;
  id v57 = SFContentTypes();
  id v55 = 0;
  long long v56 = v9;
  if (([v7 supportsPasses] & 1) == 0)
  {
    __int16 v58 = v7;
    id v53 = v6;
    id v54 = v8;
    unsigned __int8 v20 = [v8 firstObject];
    v21 = [v20 objectForKeyedSubscript:kSFOperationFileNameKey];
    id v12 = [v21 pathExtension];

    [v57 allKeys];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v22 = (char *)[obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v22)
    {
      char v23 = v22;
      uint64_t v24 = *(void *)v66;
      char v25 = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(obj);
          }
          if (SFIsPass())
          {
            unsigned int v27 = [v58 isUnknown];
            id v28 = @"TRANSFER_TO_PERSON_NO_WALLET_TEXT";
            if (v27) {
              id v28 = @"TRANSFER_TO_DEVICE_NO_WALLET_TEXT";
            }
            v29 = v28;
            id v30 = SFLocalizedStringForKey();
            SFLocalizedStringForKey();
            v32 = id v31 = v12;

            v33 = [v58 displayName];
            v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33);
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v34);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            id v12 = v31;
            char v25 = 0;
          }
        }
        char v23 = (char *)[obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v23);
    }
    else
    {
      char v25 = 1;
    }

    id v6 = v53;
    goto LABEL_27;
  }
  if ([v7 supportsFMF])
  {
    if (![v7 supportsCredentials] || objc_msgSend(v7, "isUnknown"))
    {
      unsigned __int8 v10 = [v9 firstObject];
      unsigned __int8 v11 = [v10 scheme];
      id v12 = [v11 lowercaseString];

      int MyFriendsLink = SFIsCredential();
      if (MyFriendsLink)
      {
        uint64_t v14 = [v56 firstObject];
        SFIsPasskeyCredentialLink();

        double v15 = SFLocalizedStringForKey();
        id v16 = SFLocalizedStringForKeyInStringsFileNamed();
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v74[0] = @"supportsCredentials";
        id v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsCredentials]);
        v74[1] = @"unknownPeer";
        v75[0] = v17;
        CFStringRef v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isUnknown]);
        v75[1] = v18;
        BOOL v19 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];

        SFMetricsLog();
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v12 = v6;
    id v45 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (!v45)
    {
      char v25 = 1;
      goto LABEL_28;
    }
    id v46 = v45;
    id v54 = v8;
    __int16 v58 = v7;
    uint64_t v47 = *(void *)v62;
    while (2)
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v12);
        }
        uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
        long long v50 = +[LSApplicationWorkspace defaultWorkspace];
        if ([v50 isApplicationAvailableToOpenURL:v49 error:0])
        {
        }
        else
        {
          long long v51 = +[LSApplicationWorkspace defaultWorkspace];
          unsigned int v52 = [v51 isApplicationAvailableToOpenURL:v49 includePrivateURLSchemes:1 error:0];

          if (v52)
          {
            [v12 count];
            SFLocalizedStringForKey();
            char v25 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
      }
      id v46 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
      char v25 = 1;
      if (v46) {
        continue;
      }
      break;
    }
LABEL_27:
    id v7 = v58;
    id v8 = v54;
    goto LABEL_28;
  }
  id v35 = [v9 firstObject];
  v36 = [v35 scheme];
  id v12 = [v36 lowercaseString];

  int MyFriendsLink = SFIsFindMyFriendsLink();
  if (MyFriendsLink)
  {
    unsigned int v37 = [v7 isUnknown];
    long long v38 = @"TRANSFER_TO_PERSON_NO_FMF_TEXT";
    if (v37) {
      long long v38 = @"TRANSFER_TO_DEVICE_NO_FMF_TEXT";
    }
    id v39 = v12;
    v40 = v38;
    BOOL v19 = SFLocalizedStringForKey();
    uint64_t v41 = SFLocalizedStringForKey();

    id v42 = [v7 displayName];
    BOOL v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v42);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v43);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = v39;
    goto LABEL_23;
  }
LABEL_24:
  char v25 = MyFriendsLink ^ 1;
LABEL_28:

  return v25 & 1;
}

- (void)subscribeToProgresses
{
  if (!self->_progressToken)
  {
    long long v3 = +[NSProgress sf_publishingKeyForApp:self->_sendingAppBundleID sessionID:self->_sessionID];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A284;
    v6[3] = &unk_100031078;
    v6[4] = self;
    id v4 = +[NSProgress _addSubscriberForCategory:v3 usingPublishingHandler:v6];
    id progressToken = self->_progressToken;
    self->_id progressToken = v4;
  }
}

- (void)unsubscribeToProgresses
{
  if (self->_progressToken)
  {
    +[NSProgress _removeSubscriber:](NSProgress, "_removeSubscriber:");
    id progressToken = self->_progressToken;
    self->_id progressToken = 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)self->_personToProgress allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AirDropBrowserViewController *)self unpublishedProgressForPersonWithRealName:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_personToProgress removeAllObjects];
}

- (void)subscribedProgress:(id)a3 forPersonWithRealName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v20 = v6;
  [(NSMutableDictionary *)self->_personToProgress setObject:v6 forKeyedSubscript:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(AirDropBrowserViewController *)self collectionView];
  long long v9 = [v8 visibleCells];

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v15 = [v14 person];
          id v16 = [v15 realName];
          unsigned int v17 = [v16 isEqualToString:v7];

          if (v17) {
            [v14 setProgress:v20];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  CFStringRef v18 = [(AirDropBrowserViewController *)self magicHeadVC];
  BOOL v19 = v18;
  if (v18) {
    [v18 subscribedProgress:v20 forPersonWithRealName:v7];
  }
}

- (void)unpublishedProgressForPersonWithRealName:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_personToProgress objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = (char *)objc_msgSend(v5, "sf_transferState");
    if ((unint64_t)(v7 - 4) <= 2)
    {
      id v8 = +[NSNumber numberWithInteger:v7];
      [(NSMutableDictionary *)self->_personToStoredTransferFinalState setObject:v8 forKeyedSubscript:v4];
    }
  }
  BOOL v19 = v6;
  [(NSMutableDictionary *)self->_personToProgress removeObjectForKey:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v9 = [(AirDropBrowserViewController *)self collectionView];
  id v10 = [v9 visibleCells];

  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v15 person];
          unsigned int v17 = [v16 realName];
          unsigned int v18 = [v17 isEqualToString:v4];

          if (v18) {
            [v15 setProgress:0];
          }
        }
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)personCollectionViewCellDidTerminateTransfer:(id)a3
{
  id v4 = a3;
  selectedNodes = self->_selectedNodes;
  id v13 = v4;
  id v6 = [v4 person];
  LODWORD(selectedNodes) = [(NSMutableSet *)selectedNodes containsObject:v6];

  if (selectedNodes)
  {
    id v7 = self->_selectedNodes;
    id v8 = [v13 person];
    [(NSMutableSet *)v7 removeObject:v8];
  }
  long long v9 = [(AirDropBrowserViewController *)self collectionView];
  id v10 = [(AirDropBrowserViewController *)self collectionView];
  id v11 = [v10 indexPathForCell:v13];
  [v9 deselectItemAtIndexPath:v11 animated:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropDelegate);
  [WeakRetained airDropViewServiceDidFinishTransferWithSuccess:0];
}

- (void)personCollectionViewCellDidStartTransfer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropDelegate);
  [WeakRetained airDropViewServiceDidStartTransfer];
}

- (void)personCollectionViewCellDidFinishTransfer:(id)a3
{
  id v4 = a3;
  selectedNodes = self->_selectedNodes;
  id v13 = v4;
  id v6 = [v4 person];
  LODWORD(selectedNodes) = [(NSMutableSet *)selectedNodes containsObject:v6];

  if (selectedNodes)
  {
    id v7 = self->_selectedNodes;
    id v8 = [v13 person];
    [(NSMutableSet *)v7 removeObject:v8];
  }
  long long v9 = [(AirDropBrowserViewController *)self collectionView];
  id v10 = [(AirDropBrowserViewController *)self collectionView];
  id v11 = [v10 indexPathForCell:v13];
  [v9 deselectItemAtIndexPath:v11 animated:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropDelegate);
  [WeakRetained airDropViewServiceDidFinishTransferWithSuccess:1];
}

- (void)magicHeadViewControllerToggleSelectionForNode:(id)a3
{
  dataSource = self->_dataSource;
  id v5 = [a3 nodeIdentifier];
  id v10 = [(UICollectionViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5];

  id v6 = [(AirDropBrowserViewController *)self collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v10];

  id v8 = [(AirDropBrowserViewController *)self collectionView];
  [v8 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];

  [v7 setSelected:1];
  long long v9 = [(AirDropBrowserViewController *)self collectionView];
  [(AirDropBrowserViewController *)self collectionView:v9 didSelectItemAtIndexPath:v10 cellInitiator:0];
}

- (void)magicHeadViewControllerDidStartTransferForNode:(id)a3
{
  id v4 = [(AirDropBrowserViewController *)self cellForPerson:a3];
  [(AirDropBrowserViewController *)self personCollectionViewCellDidStartTransfer:v4];
}

- (void)magicHeadViewControllerDidTerminateTransferForNode:(id)a3
{
  id v4 = [(AirDropBrowserViewController *)self cellForPerson:a3];
  [(AirDropBrowserViewController *)self personCollectionViewCellDidTerminateTransfer:v4];
}

- (void)magicHeadViewControllerDidFinishTransferForNode:(id)a3
{
  id v4 = [(AirDropBrowserViewController *)self cellForPerson:a3];
  [(AirDropBrowserViewController *)self personCollectionViewCellDidFinishTransfer:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AirDropBrowserViewController;
  id v7 = a4;
  -[AirDropBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000ADE0;
  v8[3] = &unk_1000310A0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_1000310E0];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  id v7 = [(AirDropBrowserViewController *)self currentSnapshot];
  id v8 = [v7 sectionIdentifiers];
  id v9 = [v8 count];

  if (v6 >= v9)
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    id v10 = [(AirDropBrowserViewController *)self currentSnapshot];
    id v11 = [v10 sectionIdentifiers];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

    unsigned int v13 = [v12 isEqualToString:@"OtherSection"] ^ 1;
  }

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 delegate];
  unsigned __int8 v8 = [v7 collectionView:v6 shouldHighlightItemAtIndexPath:v5];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4 cellInitiator:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SFAirDropBrowser *)self->_browser nodeIDToNode];
  id v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v9];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    unsigned int v13 = [v8 cellForItemAtIndexPath:v9];
    if (v13)
    {
      uint64_t v14 = [v12 realName];
      double v15 = airdrop_ui_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v12 displayName];
        *(_DWORD *)buf = 138412290;
        long long v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Node with display name %@ selected by user", buf, 0xCu);
      }
      if ([(NSMutableSet *)self->_selectedNodes containsObject:v12])
      {
        unsigned int v17 = airdrop_ui_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Node already selected", buf, 2u);
        }

        [v8 deselectItemAtIndexPath:v9 animated:1];
        [v13 setSelected:0];
        [(AirDropBrowserViewController *)self cancelTransferForCell:v13];
        unsigned int v18 = [(AirDropBrowserViewController *)self realNamesWithTransfersStartedFromMagicHead];
        [v18 addObject:v14];

        [v13 setCellState:0];
        [v8 setRemembersLastFocusedIndexPath:0];
        [v8 setNeedsFocusUpdate];
        [v8 updateFocusIfNeeded];
        [v8 setRemembersLastFocusedIndexPath:1];
      }
      else
      {
        [(NSMutableDictionary *)self->_personToStoredTransferFinalState removeObjectForKey:v14];
        BOOL v19 = [(AirDropBrowserViewController *)self realNamesWithTransfersStartedFromMagicHead];
        long long v20 = v19;
        if (v5)
        {
          [v19 removeObject:v14];

          [v13 userDidSelect];
          long long v21 = [(AirDropBrowserViewController *)self magicHeadVC];
          [v21 resetTransferStateWithRealName:v14];
        }
        else
        {
          [v19 addObject:v14];

          long long v22 = [(AirDropBrowserViewController *)self magicHeadVC];
          [v22 userSelectedWithRealName:v14];

          [v13 resetTransferState];
        }
        [(NSMutableSet *)self->_selectedNodes addObject:v12];
        id v23 = [objc_alloc((Class)SFShareSheetRecipient) initWithNode:v12];
        long long v24 = [(AirDropBrowserViewController *)self airDropDelegate];
        [v24 airDropViewServiceWillStartTransferToRecipient:v23];

        if (self->_itemsReady)
        {
          char v25 = +[NSNumber numberWithInteger:self->_sharedItemsRequestID];
          [(NSMutableDictionary *)self->_personToSharedItemsRequestID setObject:v25 forKeyedSubscript:v14];

          v36 = v12;
          unsigned __int8 v26 = +[NSArray arrayWithObjects:&v36 count:1];
          [(AirDropBrowserViewController *)self startTransferForPeople:v26];
        }
        else if (self->_itemsRequested)
        {
          unsigned __int8 v26 = +[NSNumber numberWithInteger:self->_sharedItemsRequestID];
          [(NSMutableDictionary *)self->_personToSharedItemsRequestID setObject:v26 forKeyedSubscript:v14];
        }
        else
        {
          self->_itemsRequested = 1;
          int64_t v27 = self->_sharedItemsRequestID + 1;
          self->_sharedItemsRequestID = v27;
          id v28 = +[NSNumber numberWithInteger:v27];
          [(NSMutableDictionary *)self->_personToSharedItemsRequestID setObject:v28 forKeyedSubscript:v14];

          self->_generatedPreviews = 0;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10000B4EC;
          v33[3] = &unk_100031130;
          v33[4] = self;
          v33[5] = v27;
          v29 = objc_retainBlock(v33);
          uint64_t v34 = SFAirDropActivityMaxPreviewsKey;
          id v35 = &off_1000320D8;
          id v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10000B74C;
          v31[3] = &unk_100031158;
          id v32 = v29;
          unsigned __int8 v26 = v29;
          [(AirDropBrowserViewController *)self requestingSharedItemsWithOptions:v30 completionHandler:v31];
        }
        [v8 setRemembersLastFocusedIndexPath:0];
        [v8 setNeedsFocusUpdate];
        [v8 updateFocusIfNeeded];
        [v8 setRemembersLastFocusedIndexPath:1];
      }
    }
    else
    {
      uint64_t v14 = airdrop_ui_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100022888(v14);
      }
    }
  }
  else
  {
    unsigned int v13 = airdrop_ui_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100022844(v13);
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  browser = self->_browser;
  id v8 = a3;
  id v9 = [(SFAirDropBrowser *)browser nodeIDToNode];
  id v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
  id v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = airdrop_ui_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v11 displayName];
    int v15 = 138412290;
    id v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Node with display name %@ deselected by user", (uint8_t *)&v15, 0xCu);
  }
  [v8 layoutIfNeeded];
  uint64_t v14 = [v8 cellForItemAtIndexPath:v6];

  [(AirDropBrowserViewController *)self cancelTransferForCell:v14];
}

- (void)cancelTransferForCell:(id)a3
{
  id v4 = a3;
  BOOL v5 = airdrop_ui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel transfer.", v14, 2u);
  }

  [v4 userDidCancel];
  selectedNodes = self->_selectedNodes;
  id v7 = [v4 person];
  LODWORD(selectedNodes) = [(NSMutableSet *)selectedNodes containsObject:v7];

  if (selectedNodes)
  {
    id v8 = self->_selectedNodes;
    id v9 = [v4 person];
    [(NSMutableSet *)v8 removeObject:v9];
  }
  id v10 = [v4 person];
  id v11 = [v10 realName];

  id v12 = [(AirDropBrowserViewController *)self magicHeadVC];
  [v12 transferCancelledToPerson:v11];

  unsigned int v13 = [(AirDropBrowserViewController *)self realNamesWithTransfersStartedFromMagicHead];
  [v13 removeObject:v11];
}

- (void)requestingSharedItemsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(AirDropExtensionActivity);
  [(AirDropExtensionActivity *)v8 setAirDropViewController:self];
  [(AirDropExtensionActivity *)v8 setAirdropCompletion:v6];

  id v9 = [v7 objectForKeyedSubscript:SFAirDropActivityMaxPreviewsKey];

  -[AirDropExtensionActivity setMaxPreviews:](v8, "setMaxPreviews:", [v9 integerValue]);
  id v10 = [(AirDropExtensionActivity *)v8 ss_activityTypeToReportToHost];
  id v11 = [(AirDropExtensionActivity *)v8 ss_activitySpecificExtensionItemDataRequestInfo];
  id v12 = +[UISUIActivityExtensionItemDataRequest requestForActivity:v8 activityType:v10 activitySpecificMetadata:v11];

  unsigned int v13 = [(AirDropBrowserViewController *)self airDropDelegate];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000BB8C;
  v15[3] = &unk_100031180;
  id v16 = v8;
  uint64_t v14 = v8;
  [v13 airDropViewServiceRequestingSharedItemsWithDataRequest:v12 completionHandler:v15];
}

- (CGSize)suggestedThumbnailSize
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  SFSuggestedAirDropThumbnailSize();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

+ (BOOL)airDropActivityCanPerformActivityWithItemClasses:(id)a3
{
  double v3 = +[NSSet setWithArray:a3];
  double v4 = airdrop_ui_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000228CC();
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v42;
    *(void *)&long long v7 = 138412290;
    long long v32 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "description", v32);
        if ((unint64_t)[v12 length] >= 0x3D)
        {
          unsigned int v13 = [v11 description];
          uint64_t v14 = [v13 substringToIndex:60];

          id v12 = (void *)v14;
        }
        int v15 = airdrop_ui_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v32;
          id v48 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Top level values: %@", buf, 0xCu);
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v8);
  }

  byte_1000380F0 = 0;
  if ((unint64_t)[v5 count] >= 2)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v5;
    id v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v37 + 1) + 8 * (void)j) isSubclassOfClass:objc_opt_class()])byte_1000380F0 = 1; {
        }
          }
        id v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v18);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v5;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    BOOL v24 = 0;
    char v25 = 0;
    char v26 = 0;
    uint64_t v27 = *(void *)v34;
    do
    {
      id v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v21);
        }
        v29 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v28);
        BOOL v24 = v24
           || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
           || [v29 isSubclassOfClass:objc_opt_class()];
        if (([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || ([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v29 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v24 = 1;
          char v26 = 1;
        }
        if (([v29 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || [v29 isSubclassOfClass:objc_opt_class()])
        {
          BOOL v24 = 1;
          char v25 = 1;
        }
        id v28 = (char *)v28 + 1;
      }
      while (v23 != v28);
      id v30 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
      id v23 = v30;
    }
    while (v30);
  }
  else
  {
    BOOL v24 = 0;
    char v25 = 0;
    char v26 = 0;
  }

  byte_1000380F0 = v25 & v26 & 1;
  return v24;
}

- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_ui_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    id v23 = NSStringFromCGSize(v45);
    *(_DWORD *)buf = 138413314;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 2112;
    long long v44 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "addURL:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  id v17 = [v12 scheme];

  if (v17)
  {
    self->_itemsReady = 0;
    if (v15 || (int64_t generatedPreviews = self->_generatedPreviews, generatedPreviews > 2))
    {
      operationQueue = self->_operationQueue;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000C578;
      v24[3] = &unk_1000311D0;
      char v25 = v12;
      id v26 = v14;
      id v27 = v15;
      id v28 = self;
      int v29 = a7;
      [(NSOperationQueue *)operationQueue addOperationWithBlock:v24];

      long long v20 = v25;
    }
    else
    {
      self->_int64_t generatedPreviews = generatedPreviews + 1;
      uint64_t v19 = self->_operationQueue;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000C39C;
      v30[3] = &unk_1000311A8;
      id v31 = v12;
      long long v32 = self;
      id v33 = v14;
      int v34 = a7;
      [(NSOperationQueue *)v19 addOperationWithBlock:v30];

      long long v20 = v31;
    }
  }
  else
  {
    long long v20 = airdrop_ui_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100022940();
    }
  }

  return 1;
}

- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_ui_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v12 size];
    int v29 = NSStringFromCGSize(v51);
    [v15 size];
    id v30 = NSStringFromCGSize(v52);
    *(_DWORD *)buf = 138413570;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v29;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2112;
    id v46 = v14;
    __int16 v47 = 2112;
    id v48 = v15;
    __int16 v49 = 2112;
    long long v50 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "addImage:[%@]-size:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x3Eu);
  }
  id v31 = v13;

  self->_itemsReady = 0;
  if (!v15) {
    id v15 = v12;
  }
  sessionID = self->_sessionID;
  int64_t v18 = self->_attachmentCount + 1;
  self->_attachmentCount = v18;
  uint64_t v19 = +[NSString stringWithFormat:@"IMG_%@-%ld", sessionID, v18];
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
  id v21 = NSTemporaryDirectory();
  id v22 = [v21 stringByAppendingPathComponent:SuggestedFilename];
  operationQueue = self->_operationQueue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000C904;
  v32[3] = &unk_1000311F8;
  id v33 = v12;
  id v34 = v22;
  id v35 = v14;
  id v36 = v15;
  __int16 v37 = self;
  int v38 = a7;
  id v24 = v15;
  id v25 = v14;
  id v26 = v22;
  id v27 = v12;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v32];

  return 1;
}

- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = (__CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = airdrop_ui_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v25 = [v14 length];
    [v18 size];
    id v26 = NSStringFromCGSize(v41);
    *(_DWORD *)buf = 134219522;
    id v28 = v14;
    __int16 v29 = 2048;
    id v30 = v25;
    __int16 v31 = 2112;
    long long v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    id v36 = v17;
    __int16 v37 = 2112;
    id v38 = v18;
    __int16 v39 = 2112;
    id v40 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "addData:[%p]-length:[%lu] ofType:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x48u);
  }
  self->_itemsReady = 0;
  id v20 = v18;
  id v21 = v20;
  if (!v20)
  {
    if (UTTypeConformsTo(v15, kUTTypeImage))
    {
      id v21 = +[UIImage imageWithData:v14];
    }
    else
    {
      id v21 = 0;
    }
  }
  if (v16) {
    id v22 = v16;
  }
  else {
    id v22 = v17;
  }
  BOOL v23 = [(AirDropBrowserViewController *)self createURLPayloadForData:v14 ofType:v15 withAttachmentName:v22 description:v17 previewImage:v21 itemIndex:v8 completion:0];

  return v23;
}

- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9
{
  id v14 = a3;
  CFStringRef v15 = (const __CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  __int16 v43 = v17;
  id v42 = (__CFString *)v15;
  if ([v16 length])
  {
    SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
    id v21 = (__CFString *)[SuggestedFilename mutableCopy];

    [(__CFString *)v21 replaceOccurrencesOfString:@"/", @"-", 0, 0, [(__CFString *)v21 length] withString options range];
    [(__CFString *)v21 replaceOccurrencesOfString:@":", @"-", 0, 0, [(__CFString *)v21 length] withString options range];
    if (self->_attachmentCount)
    {
      id v22 = v14;
      BOOL v23 = [(__CFString *)v21 pathExtension];
      if ([v23 length])
      {
        id v24 = [(__CFString *)v21 stringByDeletingPathExtension];
        int64_t v25 = self->_attachmentCount + 1;
        self->_attachmentCount = v25;
        id v26 = +[NSString stringWithFormat:@"%@-%ld.%@", v24, v25, v23];
      }
      else
      {
        int64_t v31 = self->_attachmentCount + 1;
        self->_attachmentCount = v31;
        id v26 = +[NSString stringWithFormat:@"%@-%ld.%@", v21, v31, v23];
      }
    }
    else
    {
      id v22 = v14;
      id v26 = v21;
      ++self->_attachmentCount;
    }
  }
  else
  {
    id v22 = v14;
    CFStringRef v27 = UTTypeCopyPreferredTagWithClass(v15, kUTTagClassFilenameExtension);
    if (v27) {
      id v21 = (__CFString *)v27;
    }
    else {
      id v21 = @"data";
    }
    id v28 = (__CFString *)UTTypeCopyDescription(v15);
    sessionID = self->_sessionID;
    int64_t v30 = self->_attachmentCount + 1;
    self->_attachmentCount = v30;
    id v26 = +[NSString stringWithFormat:@"%@-%@-%ld.%@", v28, sessionID, v30, v21];
  }
  long long v32 = NSTemporaryDirectory();
  __int16 v33 = [v32 stringByAppendingPathComponent:v26];
  operationQueue = self->_operationQueue;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000CF90;
  v44[3] = &unk_100031220;
  id v45 = v22;
  id v46 = v33;
  id v47 = v43;
  id v48 = v18;
  int v51 = a8;
  __int16 v49 = self;
  id v50 = v19;
  id v35 = v19;
  id v36 = v18;
  id v37 = v43;
  id v38 = v33;
  id v39 = v22;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v44];

  return 1;
}

- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = airdrop_ui_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v16 size];
    BOOL v23 = NSStringFromCGSize(v34);
    *(_DWORD *)buf = 138413314;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    __int16 v33 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  if (byte_1000380F0)
  {
    BOOL v18 = 1;
  }
  else
  {
    id v19 = [v13 dataUsingEncoding:4];
    if (v15)
    {
      id v20 = airdrop_ui_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        id v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ discarding description", buf, 0xCu);
      }
    }
    BOOL v18 = [(AirDropBrowserViewController *)self createURLPayloadForData:v19 ofType:kUTTypePlainText withAttachmentName:v14 description:v15 previewImage:v16 itemIndex:v7 completion:&stru_100031260];
  }
  return v18;
}

- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_ui_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    __int16 v26 = NSStringFromCGSize(v40);
    *(_DWORD *)buf = 138413314;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "addAttributedString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  if (byte_1000380F0)
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = [v12 length];
    NSAttributedStringDocumentAttributeKey v28 = NSDocumentTypeDocumentAttribute;
    NSAttributedStringDocumentType v29 = NSHTMLTextDocumentType;
    id v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v27 = 0;
    id v20 = objc_msgSend(v12, "dataFromRange:documentAttributes:error:", 0, v18, v19, &v27);
    id v21 = v27;

    if (v21)
    {
      id v22 = airdrop_ui_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100022A28();
      }

      id v23 = [v12 string];
    }
    else
    {
      id v23 = [objc_alloc((Class)NSString) initWithData:v20 encoding:4];
    }
    id v24 = v23;
    BOOL v17 = [(AirDropBrowserViewController *)self addString:v23 withAttachmentName:v13 description:v14 previewImage:v15 itemIndex:v7];
  }
  return v17;
}

- (void)handleLivePhotoItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12 = a3;
  id v26 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_10000D844;
  CGSize v40 = sub_10000D854;
  id v41 = 0;
  uint64_t v42 = NSItemProviderOptionsDispatchModeKey;
  uint64_t v43 = NSItemProviderOptionsDispatchModeAsynchronous;
  id v16 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000D85C;
  v33[3] = &unk_100031288;
  id v35 = &v36;
  BOOL v17 = v15;
  __int16 v34 = v17;
  [v12 loadItemForTypeIdentifier:kUTTypeLivePhoto options:v16 completionHandler:v33];
  dispatch_time_t v18 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v17, v18);
  id v19 = v14;
  id v20 = v19;
  if (!v19)
  {
    id v21 = objc_msgSend((id)v37[5], "imageURL", v26);
    id v22 = [v21 path];
    id v20 = +[UIImage imageWithContentsOfFile:v22];
  }
  operationQueue = self->_operationQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000D8C4;
  v27[3] = &unk_1000312B0;
  id v31 = &v36;
  id v24 = v13;
  id v28 = v24;
  id v25 = v20;
  id v29 = v25;
  __int16 v30 = self;
  int v32 = a7;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v27];

  _Block_object_dispose(&v36, 8);
}

- (void)handleImageItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10000D844;
  id v27 = sub_10000D854;
  id v28 = 0;
  uint64_t v29 = NSItemProviderOptionsDispatchModeKey;
  uint64_t v30 = NSItemProviderOptionsDispatchModeAsynchronous;
  BOOL v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000DC68;
  v20[3] = &unk_1000312D8;
  id v22 = &v23;
  dispatch_time_t v18 = v16;
  id v21 = v18;
  [v12 loadItemForTypeIdentifier:kUTTypeImage options:v17 completionHandler:v20];
  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v18, v19);
  [(AirDropBrowserViewController *)self addImage:v24[5] withAttachmentName:v13 description:v14 previewImage:v15 itemIndex:v7];

  _Block_object_dispose(&v23, 8);
}

- (void)handleOtherItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v42 = a5;
  id v43 = a6;
  id v44 = a7;
  v61[0] = kUTTypeURL;
  v61[1] = kUTTypeImage;
  v61[2] = kUTTypeRTF;
  v61[3] = kUTTypePlainText;
  v61[4] = kUTTypeData;
  id v14 = +[NSArray arrayWithObjects:v61 count:5];
  id v15 = v14;
  if (v13)
  {
    uint64_t v16 = [v14 arrayByAddingObject:v13];

    id v15 = (void *)v16;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v18) {
    goto LABEL_36;
  }
  uint64_t v19 = *(void *)v55;
  while (2)
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(void *)v55 != v19) {
        objc_enumerationMutation(v17);
      }
      uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      if ([v12 hasItemConformingToTypeIdentifier:v21])
      {
        dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
        uint64_t v48 = 0;
        __int16 v49 = (id *)&v48;
        uint64_t v50 = 0x3032000000;
        int v51 = sub_10000D844;
        CGSize v52 = sub_10000D854;
        id v53 = 0;
        uint64_t v58 = NSItemProviderOptionsDispatchModeKey;
        uint64_t v59 = NSItemProviderOptionsDispatchModeAsynchronous;
        uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10000E2D8;
        v45[3] = &unk_100031300;
        id v47 = &v48;
        id v24 = v22;
        id v46 = v24;
        [v12 loadItemForTypeIdentifier:v21 options:v23 completionHandler:v45];
        dispatch_time_t v25 = dispatch_time(0, 5000000000);
        dispatch_semaphore_wait(v24, v25);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v27 = v49[5];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_22:
            objc_opt_class();
            unsigned __int8 v31 = objc_opt_isKindOfClass();
            id v32 = v49[5];
            if ((v31 & (byte_1000380F0 == 0)) == 1)
            {
              ++self->_sharedItemsCount;
              -[AirDropBrowserViewController addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v32, v42, v43, v44);
            }
            else
            {
              objc_opt_class();
              unsigned __int8 v33 = objc_opt_isKindOfClass();
              id v34 = v49[5];
              if ((v33 & (byte_1000380F0 == 0)) == 1)
              {
                ++self->_sharedItemsCount;
                -[AirDropBrowserViewController addAttributedString:withAttachmentName:description:previewImage:itemIndex:](self, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:", v34, v42, v43, v44);
              }
              else
              {
                objc_opt_class();
                char v35 = objc_opt_isKindOfClass();
                id v36 = v49[5];
                if (v35)
                {
                  ++self->_sharedItemsCount;
                  -[AirDropBrowserViewController addURL:withAttachmentName:description:previewImage:itemIndex:](self, "addURL:withAttachmentName:description:previewImage:itemIndex:", v36, v42, v43, v44);
                }
                else
                {
                  objc_opt_class();
                  char v37 = objc_opt_isKindOfClass();
                  id v38 = v49[5];
                  if (v37)
                  {
                    ++self->_sharedItemsCount;
                    -[AirDropBrowserViewController addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v38, v42, v43, v44);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (v13)
                      {
                        id v39 = v13;
                      }
                      else
                      {
                        CGSize v40 = [v12 registeredTypeIdentifiers];
                        id v39 = [v40 firstObject];
                      }
                      id v41 = v49[5];
                      ++self->_sharedItemsCount;
                      -[AirDropBrowserViewController addData:ofType:withAttachmentName:description:previewImage:itemIndex:](self, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:", v41, v39, v42, v43, v44);
                    }
                  }
                }
              }
            }

            _Block_object_dispose(&v48, 8);
            goto LABEL_36;
          }
          id v27 = [v49[5] string];
        }
        id v28 = +[NSURL URLWithString:v27];
        if ((isKindOfClass & 1) == 0) {

        }
        if (v28)
        {
          uint64_t v29 = [v28 scheme];
          BOOL v30 = v29 == 0;

          if (!v30) {
            objc_storeStrong(v49 + 5, v28);
          }
        }

        goto LABEL_22;
      }
    }
    id v18 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_36:
}

- (BOOL)addItemProvider:(id)a3 withDataType:(id)a4 attachmentName:(id)a5 description:(id)a6 previewImage:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  id v17 = airdrop_ui_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    uint64_t v19 = NSStringFromCGSize(v30);
    int v20 = 138413314;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addItemProvider:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", (uint8_t *)&v20, 0x34u);
  }
  self->_itemsReady = 0;
  [(AirDropBrowserViewController *)self handleOtherItemProvider:v12 withDataType:v16 attachmentName:v13 description:v14 previewImage:v15];

  return 1;
}

- (BOOL)addItemProvider:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6
{
  return [(AirDropBrowserViewController *)self addItemProvider:a3 withDataType:0 attachmentName:a4 description:a5 previewImage:a6];
}

- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3
{
  double v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  id v6 = self->_cachedSharedItems;
  objc_sync_enter(v6);
  id v7 = [(NSMutableOrderedSet *)self->_cachedSharedItems copy];
  objc_sync_exit(v6);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v12 identifer] == (id)a3)
        {
          id v13 = [v12 URL];
          if (v13)
          {
            id v14 = [v12 previewImage];
            BOOL v15 = v14 == 0;

            if (!v15)
            {
              id v16 = [v12 previewImage];
              [v4 addObject:v16];

              id v17 = [v12 URL];
              [v5 addObject:v17];
            }
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v4 count] >= 2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    id v18 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) pathExtension];
          PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v21, 0);
          if ((SFIsImage() & 1) == 0 && (SFIsVideo() & 1) == 0 && (SFIsLivePhotos() & 1) == 0)
          {

            goto LABEL_25;
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v23 = +[UIScreen mainScreen];
    [v23 scale];

    SFImageStackFromImages();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
    id v21 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)sharedItemsRequestIDToPreviewPhoto setObject:obj forKeyedSubscript:v21];
LABEL_25:
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v4 = [(AirDropBrowserViewController *)self collectionView];
  [v4 setNeedsLayout];
}

- (void)_startTelemetry
{
  self->_peopleStartTimestamp = mach_continuous_time();
  self->_realNameToFirstSeenTimestamp = +[NSMapTable weakToStrongObjectsMapTable];

  _objc_release_x1();
}

- (void)_stopTelemetry
{
  self->_realNameToFirstSeenTimestamp = 0;
  _objc_release_x1();
}

- (void)_collectTelemetryForPeople:(id)a3
{
  id v4 = a3;
  uint64_t v14 = mach_continuous_time();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) realName];
        if (v10)
        {
          id v11 = [(NSMapTable *)self->_realNameToFirstSeenTimestamp objectForKey:v10];
          if (!v11)
          {
            realNameToFirstSeenTimestamp = self->_realNameToFirstSeenTimestamp;
            id v13 = +[NSNumber numberWithUnsignedLongLong:v14];
            [(NSMapTable *)realNameToFirstSeenTimestamp setObject:v13 forKey:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_emitTelemetryForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [v4 realName];
  if (v5)
  {
    id v6 = [(NSMapTable *)self->_realNameToFirstSeenTimestamp objectForKey:v5];
    if (v6)
    {
      id v7 = airdrop_ui_log();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v4);

      id v9 = airdrop_ui_log();
      uint64_t v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        unint64_t peopleStartTimestamp = self->_peopleStartTimestamp;
        int v15 = 134349056;
        unint64_t v16 = peopleStartTimestamp;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "TimeToDiscoverPerson", " enableTelemetry=YES  %{public, signpost.description:begin_time}llu", (uint8_t *)&v15, 0xCu);
      }

      id v12 = airdrop_ui_log();
      id v13 = v12;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        id v14 = [v6 unsignedLongLongValue];
        int v15 = 134349056;
        unint64_t v16 = (unint64_t)v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v8, "TimeToDiscoverPerson", "%{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (BOOL)showNoContentView
{
  return self->_showNoContentView;
}

- (void)setShowNoContentView:(BOOL)a3
{
  self->_showNoContentView = a3;
}

- (AirDropBrowserViewControllerDelegate)airDropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropDelegate);

  return (AirDropBrowserViewControllerDelegate *)WeakRetained;
}

- (void)setAirDropDelegate:(id)a3
{
}

- (NSUUID)magicHeadUUID
{
  return self->_magicHeadUUID;
}

- (void)setMagicHeadUUID:(id)a3
{
}

- (SFAirDropMagicHeadViewController)magicHeadVC
{
  return self->_magicHeadVC;
}

- (void)setMagicHeadVC:(id)a3
{
}

- (NSMutableSet)realNamesWithTransfersStartedFromMagicHead
{
  return self->_realNamesWithTransfersStartedFromMagicHead;
}

- (void)setRealNamesWithTransfersStartedFromMagicHead:(id)a3
{
}

- (NSArray)mePeople
{
  return self->_mePeople;
}

- (void)setMePeople:(id)a3
{
}

- (NSArray)knownPeople
{
  return self->_knownPeople;
}

- (void)setKnownPeople:(id)a3
{
}

- (NSArray)unknownPeople
{
  return self->_unknownPeople;
}

- (void)setUnknownPeople:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSLayoutConstraint)collectionViewTopConstraint
{
  return self->_collectionViewTopConstraint;
}

- (void)setCollectionViewTopConstraint:(id)a3
{
}

- (AirDropNoContentView)airDropNoContentView
{
  return self->_airDropNoContentView;
}

- (void)setAirDropNoContentView:(id)a3
{
}

- (BOOL)canShowNoContentView
{
  return self->_canShowNoContentView;
}

- (void)setCanShowNoContentView:(BOOL)a3
{
  self->_canShowNoContentView = a3;
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);
  objc_storeStrong((id *)&self->_airDropNoContentView, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_unknownPeople, 0);
  objc_storeStrong((id *)&self->_knownPeople, 0);
  objc_storeStrong((id *)&self->_mePeople, 0);
  objc_storeStrong((id *)&self->_realNamesWithTransfersStartedFromMagicHead, 0);
  objc_storeStrong((id *)&self->_magicHeadVC, 0);
  objc_storeStrong((id *)&self->_magicHeadUUID, 0);
  objc_destroyWeak((id *)&self->_airDropDelegate);
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_sharedItemsMap, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
  objc_storeStrong((id *)&self->_cachedSharedItems, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, 0);
  objc_storeStrong((id *)&self->_personToSharedItemsRequestID, 0);
  objc_storeStrong((id *)&self->_personToStoredTransferFinalState, 0);
  objc_storeStrong((id *)&self->_personToProgress, 0);
  objc_storeStrong((id *)&self->_realNameToFirstSeenTimestamp, 0);
  objc_storeStrong((id *)&self->_wirelessSettingsController, 0);
  objc_storeStrong((id *)&self->_selectedNodes, 0);

  objc_storeStrong((id *)&self->_browser, 0);
}

@end