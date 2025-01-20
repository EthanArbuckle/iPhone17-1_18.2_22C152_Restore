@interface BKLibraryBookshelfWantToReadBookCell
- (AEAssetAudiobookStatus)audiobookStatus;
- (BCBuyGetTwoStateButton)readBuyButton;
- (BCUCoverEffectsEnvironment)coverEffectsEnvironment;
- (BFMAsset)asset;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookshelfCellMetrics)metrics;
- (BKLibraryBookshelfCellMetrics_WantToRead)wantToReadMetrics;
- (BKLibraryBookshelfColumnMetrics)columnMetrics;
- (BKLibraryBookshelfCoverView)coverView;
- (BKLibraryBookshelfLayoutManager)layoutManager;
- (BKLibraryBookshelfStorageProvider)storageProvider;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BKLibraryBookshelfWantToReadBookCell)initWithFrame:(CGRect)a3;
- (BKLibraryDownloadStatus)libraryDownloadStatus;
- (BKLibraryStarRating)starRating;
- (BOOL)accessibilityActivate;
- (BOOL)canPreorder;
- (BOOL)isAccessibilityElement;
- (BOOL)isAudiobook;
- (BOOL)isCloud;
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isRTL;
- (BOOL)isSample;
- (BOOL)isStore;
- (BOOL)needsAsset;
- (BOOL)shouldDragWithTouch:(id)a3;
- (BOOL)shouldShowCloud;
- (BOOL)shouldShowDownloadProgressButton;
- (BOOL)shouldShowMoreButton;
- (BOOL)stackedLayout;
- (BOOL)storeReachable;
- (BOOL)wasPreordered;
- (CAShapeLayer)separatorline;
- (CGRect)coverArea;
- (CGRect)coverContainerFrame;
- (CGRect)coverFrame;
- (CGSize)bookCoverSize;
- (IMRadialProgressButton)downloadProgressButton;
- (IMTouchInsetsButton)moreButton;
- (NSIndexPath)indexPath;
- (UIImageView)checkmarkView;
- (UIImageView)cloudView;
- (UIImageView)dragBarView;
- (UILabel)authorLabel;
- (UILabel)bookDescription;
- (UILabel)starRatingCountLabel;
- (UILabel)titleLabel;
- (double)bookCoverLeftMargin;
- (double)editMargin;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)coverImage;
- (id)coverLayer;
- (id)dragPreview;
- (id)dragPreviewParametersForDrop:(BOOL)a3;
- (int)layoutDebugMode;
- (void)_cancelDownload:(id)a3;
- (void)_updateAssetStrings;
- (void)_updateTintedImages;
- (void)applyLayoutAttributes:(id)a3;
- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5;
- (void)cleanupCell;
- (void)configureDebugLayout;
- (void)dealloc;
- (void)handleTapWithCompletion:(id)a3;
- (void)layoutCoverView;
- (void)layoutSubviews;
- (void)nightModeChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)reachabilityChanged:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudiobookStatus:(id)a3;
- (void)setAuthorLabel:(id)a3;
- (void)setBookCoverLeftMargin:(double)a3;
- (void)setBookCoverSize:(CGSize)a3;
- (void)setBookDescription:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setCloudView:(id)a3;
- (void)setColumnMetrics:(id)a3;
- (void)setCoverEffectsEnvironment:(id)a3;
- (void)setCoverHidden:(BOOL)a3;
- (void)setCoverView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDownloadProgressButton:(id)a3;
- (void)setDragBarView:(id)a3;
- (void)setEditMargin:(double)a3;
- (void)setIndexPath:(id)a3;
- (void)setInitialAsset:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setLayoutDebugMode:(int)a3;
- (void)setLayoutManager:(id)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setLibraryDownloadStatus:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setReadBuyButton:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeparatorline:(id)a3;
- (void)setStackedLayout:(BOOL)a3;
- (void)setStarRating:(id)a3;
- (void)setStarRatingCountLabel:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWantToReadMetrics:(id)a3;
- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4;
- (void)togglePlayPause:(id)a3;
- (void)updateBuyReadButton;
- (void)updateStarRatingProductProfile;
- (void)updateTextForProductProfile;
@end

@implementation BKLibraryBookshelfWantToReadBookCell

- (BKLibraryBookshelfWantToReadBookCell)initWithFrame:(CGRect)a3
{
  v64.receiver = self;
  v64.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIApplication sharedApplication];
    v3->_isRTL = [v4 userInterfaceLayoutDirection] == (id)1;

    v5 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v5;

    v7 = [(BKLibraryBookshelfCoverView *)v3->_coverView coverLayer];
    [v7 setBottomAligned:0];

    v8 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v8 addSubview:v3->_coverView];

    id v9 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v13;

    v15 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v15 addSubview:v3->_checkmarkView];

    v16 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:]([BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"Not downloaded" value:&stru_100A70340 table:0];
    [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v16 setAccessibilityLabel:v18];

    [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v16 setAccessibilityTraits:(unint64_t)[(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v16 accessibilityTraits] & ~UIAccessibilityTraitImage];
    cloudView = v3->_cloudView;
    v3->_cloudView = &v16->super;
    v20 = v16;

    v21 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v21 addSubview:v3->_cloudView];

    v22 = [objc_alloc((Class)IMRadialProgressButton) initWithFrame:0.0, 0.0, 17.0, 17.0];
    downloadProgressButton = v3->_downloadProgressButton;
    v3->_downloadProgressButton = v22;

    [(IMRadialProgressButton *)v3->_downloadProgressButton setCenterImageNormal:0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setCenterImageSelected:0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setInscribeProgress:0];
    v24 = +[UIColor bc_booksKeyColor];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressColor:v24];

    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressLineCap:1];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressThickness:2.0];
    v25 = +[UIColor bc_booksTableSelectionColor];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackColor:v25];

    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackDiameter:17.0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackThickness:2.0];
    -[IMRadialProgressButton setTouchInsets:](v3->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
    [(IMRadialProgressButton *)v3->_downloadProgressButton addTarget:v3 action:"_cancelDownload:" forControlEvents:64];
    [(BKLibraryDownloadStatus *)v3->_libraryDownloadStatus progressValue];
    *(float *)&double v26 = v26;
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgress:v26];
    v27 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v27 addSubview:v3->_downloadProgressButton];

    v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v28;

    v30 = v3->_titleLabel;
    unint64_t v31 = (unint64_t)[(UILabel *)v30 accessibilityTraits];
    [(UILabel *)v30 setAccessibilityTraits:UIAccessibilityTraitHeader | v31];
    [(UILabel *)v3->_titleLabel setLineBreakMode:4];
    v32 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    authorLabel = v3->_authorLabel;
    v3->_authorLabel = v32;

    [(UILabel *)v3->_authorLabel setLineBreakMode:4];
    v34 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v34 addSubview:v3->_titleLabel];

    v35 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v35 addSubview:v3->_authorLabel];

    v36 = -[BKLibraryStarRating initWithFrame:]([BKLibraryStarRating alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    starRating = v3->_starRating;
    v3->_starRating = v36;

    [(BKLibraryStarRating *)v3->_starRating setDelegate:v3];
    [(BKLibraryStarRating *)v3->_starRating setEnabled:0];
    [(BKLibraryStarRating *)v3->_starRating setIsRTL:v3->_isRTL];
    v38 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v38 addSubview:v3->_starRating];

    v39 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    starRatingCountLabel = v3->_starRatingCountLabel;
    v3->_starRatingCountLabel = v39;

    v41 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v41 addSubview:v3->_starRatingCountLabel];

    uint64_t v42 = +[IMTouchInsetsButton buttonWithType:0];
    moreButton = v3->_moreButton;
    v3->_moreButton = (IMTouchInsetsButton *)v42;

    -[IMTouchInsetsButton setTouchInsets:](v3->_moreButton, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v44 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v44 addSubview:v3->_moreButton];

    v45 = (BCBuyGetTwoStateButton *)objc_alloc_init((Class)BCBuyGetTwoStateButton);
    readBuyButton = v3->_readBuyButton;
    v3->_readBuyButton = v45;

    [(BCBuyGetTwoStateButton *)v3->_readBuyButton setClipsToBounds:1];
    [(BCBuyGetTwoStateButton *)v3->_readBuyButton setDelegate:v3];
    v47 = [(BCBuyGetTwoStateButton *)v3->_readBuyButton titleLabel];
    [v47 setAdjustsFontSizeToFitWidth:1];

    v48 = [(BCBuyGetTwoStateButton *)v3->_readBuyButton titleLabel];
    [v48 setBaselineAdjustment:1];

    v49 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v49 addSubview:v3->_readBuyButton];

    v50 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    bookDescription = v3->_bookDescription;
    v3->_bookDescription = v50;

    [(UILabel *)v3->_bookDescription setTextAlignment:4];
    [(UILabel *)v3->_bookDescription setUserInteractionEnabled:0];
    v52 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v52 addSubview:v3->_bookDescription];

    v53 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dragBarView = v3->_dragBarView;
    v3->_dragBarView = v53;

    v55 = [(BKLibraryBookshelfWantToReadBookCell *)v3 contentView];
    [v55 addSubview:v3->_dragBarView];

    uint64_t v56 = +[CAShapeLayer layer];
    separatorline = v3->_separatorline;
    v3->_separatorline = (CAShapeLayer *)v56;

    v58 = +[UIScreen mainScreen];
    [v58 scale];
    [(CAShapeLayer *)v3->_separatorline setLineWidth:1.0 / v59];

    v60 = [(BKLibraryBookshelfWantToReadBookCell *)v3 layer];
    [v60 addSublayer:v3->_separatorline];

    v61 = +[NSNotificationCenter defaultCenter];
    [v61 addObserver:v3 selector:"reachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:0];

    v62 = +[UIColor bc_booksTableSelectionColor];

    [(BKLibraryBookshelfCollectionViewCell *)v3 setHighlightBackgroundColor:v62];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"kNetworkReachabilityChangedNotification" object:0];

  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1F688];
  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1F690];
  libraryAsset = self->_libraryAsset;
  if (libraryAsset && ([(BKLibraryAsset *)libraryAsset isContainer] & 1) == 0)
  {
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"combinedState" context:off_100B1F698];
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1F6A0];
    [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1F6A0];
  }
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1F6A8];
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1F6B0];
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v5 dealloc];
}

- (id)coverLayer
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
  v3 = [v2 coverLayer];

  return v3;
}

- (void)cleanupCell
{
  [(BKLibraryBookshelfWantToReadBookCell *)self setLibraryDownloadStatus:0];
  [(BKLibraryBookshelfWantToReadBookCell *)self setLibraryAsset:0];

  [(BKLibraryBookshelfWantToReadBookCell *)self setAudiobookStatus:0];
}

- (void)prepareForReuse
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v5 prepareForReuse];
  [(BKLibraryBookshelfWantToReadBookCell *)self cleanupCell];
  v3 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  unsigned int v4 = [v3 isHidden];

  if (v4) {
    [(BKLibraryBookshelfWantToReadBookCell *)self setCoverHidden:0];
  }
  +[CATransaction commit];
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  v3 = [v2 coverEffectsEnvironment];

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v5 setCoverEffectsEnvironment:v4];
}

- (void)handleTapWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  unsigned __int8 v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    v7 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v7 resetButtonState];
  }
  id v9 = [(BKLibraryBookshelfWantToReadBookCell *)self actionHandler];
  v8 = [(BKLibraryBookshelfWantToReadBookCell *)self indexPath];
  [v9 bookTapped:v8 completion:v4];
}

- (id)dragPreview
{
  id v3 = objc_alloc((Class)UIDragPreview);
  id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
  id v5 = [v3 initWithView:v4];

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  id v5 = [(BKLibraryBookshelfWantToReadBookCell *)self traitCollection];
  unsigned __int8 v6 = [v5 traitCollectionByModifyingTraits:&stru_100A483C0];

  v7 = +[UIColor bc_booksBackground];
  v8 = [v7 resolvedColorWithTraitCollection:v6];
  [v4 setBackgroundColor:v8];

  return v4;
}

- (void)setCoverHidden:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v5 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
  [v5 setHidden:v3];

  +[CATransaction commit];
}

- (id)coverImage
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  BOOL v3 = [v2 image];

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  BOOL v3 = [(BKLibraryBookshelfWantToReadBookCell *)self layer];
  id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v4 coverBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v3 convertRect:v13 fromLayer:v6, v8, v10, v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)coverContainerFrame
{
  [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  [(BKLibraryBookshelfWantToReadBookCell *)self frame];
  double v10 = v9 * 0.5 - v8 * 0.5;
  uint64_t v11 = v4;
  uint64_t v12 = v6;
  double v13 = v8;

  return CGRectIntegral(*(CGRect *)&v11);
}

- (CGRect)coverArea
{
  [(BKLibraryBookshelfWantToReadBookCell *)self bounds];
  uint64_t v3 = [(BKLibraryBookshelfWantToReadBookCell *)self columnMetrics];
  [v3 margins];
  [(BKLibraryBookshelfWantToReadBookCell *)self bookCoverLeftMargin];

  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    uint64_t v4 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    [v4 editModeMargin];
    uint64_t v5 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
    uint64_t v6 = [v5 image];
    [v6 size];
    double v7 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    [v7 checkMarkSpacing];
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self bookCoverSize];
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  [(BKLibraryBookshelfWantToReadBookCell *)self bounds];

  IMRectFlippedForRTL();
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.x = v8;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if (off_100B1F698 == a6)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100148760;
    v25[3] = &unk_100A43F90;
    v25[4] = self;
    double v13 = &v26;
    objc_copyWeak(&v26, &location);
    double v14 = v25;
LABEL_12:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    objc_destroyWeak(v13);
    goto LABEL_13;
  }
  if (off_100B1F6A8 == a6)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001487C4;
    v23[3] = &unk_100A43F68;
    double v13 = &v24;
    objc_copyWeak(&v24, &location);
    double v14 = v23;
    goto LABEL_12;
  }
  if (off_100B1F6B0 == a6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100148854;
    v21[3] = &unk_100A43F68;
    double v13 = &v22;
    objc_copyWeak(&v22, &location);
    double v14 = v21;
    goto LABEL_12;
  }
  if (off_100B1F6A0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001488EC;
    block[3] = &unk_100A43F68;
    double v13 = &v20;
    objc_copyWeak(&v20, &location);
    double v14 = block;
    goto LABEL_12;
  }
  if (off_100B1F688 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10014894C;
    v18[3] = &unk_100A43D60;
    v18[4] = self;
    double v15 = v18;
LABEL_16:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    goto LABEL_13;
  }
  if (off_100B1F690 == a6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100148954;
    v17[3] = &unk_100A43D60;
    v17[4] = self;
    double v15 = v17;
    goto LABEL_16;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  [(BKLibraryBookshelfWantToReadBookCell *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_13:
  objc_destroyWeak(&location);
}

- (void)reachabilityChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100148A44;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)nightModeChanged
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v3 nightModeChanged];
  [(BKLibraryBookshelfWantToReadBookCell *)self setNeedsLayout];
}

- (void)buyButton:(id)a3 initialBuy:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [v11 length];
  double v9 = [(BKLibraryBookshelfWantToReadBookCell *)self actionHandler];
  id v10 = [(BKLibraryBookshelfWantToReadBookCell *)self indexPath];
  if (v8)
  {
    [v9 directBuyTapped:v10 buyParameters:v11 completion:v7];
  }
  else
  {
    [v9 bookTapped:v10];

    double v9 = (void (**)(void, void))objc_retainBlock(v7);
    if (v9) {
      v9[2](v9, 1);
    }
  }
}

- (BOOL)isStore
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned __int8 v3 = [v2 isStore];

  return v3;
}

- (BOOL)isDownloading
{
  unsigned __int8 v3 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  if ([v3 isDownloading])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    uint64_t v5 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    unsigned __int8 v4 = [v5 isDownloadingSupplementalContent];
  }
  return v4;
}

- (BOOL)isLocal
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned __int8 v3 = [v2 isLocal];

  return v3;
}

- (BOOL)isCloud
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned __int8 v3 = [v2 isCloud];

  return v3;
}

- (BOOL)isSample
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned __int8 v3 = [v2 isSample];

  return v3;
}

- (BOOL)isAudiobook
{
  unsigned __int8 v3 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  if ([v3 isAudiobook])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    uint64_t v5 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    uint64_t v6 = [v5 isStoreAudiobook];
    unsigned __int8 v4 = [v6 BOOLValue];
  }
  return v4;
}

- (BOOL)canPreorder
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self asset];
  unsigned __int8 v3 = [v2 isPreorder];

  return v3;
}

- (BOOL)wasPreordered
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned __int8 v3 = [v2 isPreorderBook];

  return v3;
}

- (BOOL)storeReachable
{
  v2 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
  unsigned __int8 v3 = [v2 storeReachable];

  return v3;
}

- (BOOL)shouldShowCloud
{
  unsigned __int8 v3 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  if ([v3 isCloud])
  {
    unsigned __int8 v4 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    unsigned int v5 = [v4 isPreorderBook] ^ 1;
  }
  else
  {
    unsigned int v5 = 0;
  }

  uint64_t v6 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned int v7 = [v6 isAudiobook];

  id v8 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned int v9 = [v8 isBook];

  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    LOBYTE(v10) = 0;
  }
  else if ((v9 | v7) & v5)
  {
    return ![(BKLibraryBookshelfWantToReadBookCell *)self isDownloading];
  }
  else
  {
    id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    if ([v11 isNonLocalSample]) {
      unsigned int v10 = ![(BKLibraryBookshelfWantToReadBookCell *)self isDownloading];
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (BOOL)shouldShowDownloadProgressButton
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 0;
  }

  return [(BKLibraryBookshelfWantToReadBookCell *)self isDownloading];
}

- (BOOL)shouldShowMoreButton
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 0;
  }
  else {
    return ![(BKLibraryBookshelfWantToReadBookCell *)self isDownloading];
  }
}

- (void)layoutCoverView
{
  unsigned __int8 v4 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  [(BKLibraryBookshelfWantToReadBookCell *)self frame];
  v41.origin.double y = v15 * 0.5 - v14 * 0.5;
  v41.origin.double x = v10;
  v41.size.double width = v12;
  v41.size.double height = v14;
  CGRect v42 = CGRectIntegral(v41);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  id v20 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[1] = v21;
  v40[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v20 setAffineTransform:v40];

  if (v6 != CGSizeZero.width || v8 != CGSizeZero.height) {
    +[UIView inheritedAnimationDuration];
  }
  double v23 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
  [v23 setFrame:CGRectMake(x, y, width, height)];

  if ([(BKLibraryBookshelfWantToReadBookCell *)self isSelected])
  {
    memset(&v39, 0, sizeof(v39));
    id v24 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    [v24 shrinkAmount];
    CGFloat v26 = v25;
    v27 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    [v27 shrinkAmount];
    CGAffineTransformMakeScale(&v39, v26, v28);

    CGAffineTransform v38 = v39;
    v29 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
    CGAffineTransform v37 = v38;
    [v29 setAffineTransform:&v37];

    v30 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
    LODWORD(v31) = 1.0;
    [v30 setOpacity:v31];
  }
  else
  {
    unsigned int v32 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
    if (v32)
    {
      v2 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
      [v2 shrinkAlpha];
      float v34 = v33;
    }
    else
    {
      float v34 = 1.0;
    }
    v35 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
    *(float *)&double v36 = v34;
    [v35 setOpacity:v36];

    if (v32) {
  }
    }
}

- (void)layoutSubviews
{
  v537.receiver = self;
  v537.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  [(BKLibraryBookshelfWantToReadBookCell *)&v537 layoutSubviews];
  unsigned __int8 v3 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  [(BKLibraryBookshelfWantToReadBookCell *)self updateBuyReadButton];
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    [v3 editModeMargin];
    double v5 = v4;
  }
  else
  {
    double v6 = [(BKLibraryBookshelfWantToReadBookCell *)self columnMetrics];
    [v6 margins];
    double v5 = v7;
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self bounds];
  rect_24.origin.CGFloat x = v8;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  rect_24.size.CGFloat height = v13;
  [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  [(BKLibraryBookshelfWantToReadBookCell *)self frame];
  v538.origin.CGFloat y = v22 * 0.5 - v21 * 0.5;
  CGFloat rect = v15;
  v538.origin.CGFloat x = v15;
  v538.size.CGFloat width = v19;
  v538.size.CGFloat height = v21;
  CGRect v539 = CGRectIntegral(v538);
  CGFloat y = v539.origin.y;
  CGFloat x = v539.origin.x;
  CGFloat height = v539.size.height;
  CGFloat width = v539.size.width;
  double v23 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  unsigned int v24 = [v23 isStore];

  double v25 = [(BKLibraryBookshelfWantToReadBookCell *)self dragBarView];
  CGFloat v26 = [v25 image];
  [v26 size];
  double v495 = v28;
  double v498 = v27;

  if (v24) {
    unsigned int v29 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  }
  else {
    unsigned int v29 = 1;
  }
  uint64_t v30 = v24 ^ 1;
  double v31 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  [v31 setHidden:v30];

  unsigned int v32 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
  [v32 setHidden:v30];

  +[UIView inheritedAnimationDuration];
  double v518 = v5;
  if (v33 != 0.0)
  {
    unsigned __int8 v34 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
    double v35 = 0.0;
    if ((v34 & 1) == 0)
    {
      +[UIView inheritedAnimationDuration];
      double v35 = v36 + -0.08;
    }
    v535[0] = _NSConcreteStackBlock;
    v535[1] = 3221225472;
    v535[2] = sub_10014B0AC;
    v535[3] = &unk_100A44E60;
    v535[4] = self;
    char v536 = v29;
    +[UIView animateWithDuration:32 delay:v535 options:0 animations:0.08 completion:v35];
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
    {
      double v37 = 0.18;
    }
    else
    {
      +[UIView inheritedAnimationDuration];
      double v37 = v57 + -0.26;
    }
    v534[0] = _NSConcreteStackBlock;
    v534[1] = 3221225472;
    v534[2] = sub_10014B204;
    v534[3] = &unk_100A43D60;
    v534[4] = self;
    +[UIView animateWithDuration:32 delay:v534 options:0 animations:0.08 completion:v37];
    if (v29) {
      goto LABEL_37;
    }
LABEL_34:
    v54 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
    v55 = [v54 text];
    BOOL v56 = [v55 length] != 0;

    goto LABEL_38;
  }
  if (v29) {
    double v38 = 0.0;
  }
  else {
    double v38 = 1.0;
  }
  CGAffineTransform v39 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  [v39 setAlpha:v38];

  if ([(BKLibraryBookshelfWantToReadBookCell *)self shouldShowCloud]) {
    double v40 = 1.0;
  }
  else {
    double v40 = 0.0;
  }
  CGRect v41 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  [v41 setAlpha:v40];

  BOOL v42 = [(BKLibraryBookshelfWantToReadBookCell *)self shouldShowCloud];
  v43 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  [v43 setIsAccessibilityElement:v42];

  if ([(BKLibraryBookshelfWantToReadBookCell *)self shouldShowDownloadProgressButton])
  {
    double v44 = 1.0;
  }
  else
  {
    double v44 = 0.0;
  }
  v45 = [(BKLibraryBookshelfWantToReadBookCell *)self downloadProgressButton];
  [v45 setAlpha:v44];

  if ([(BKLibraryBookshelfWantToReadBookCell *)self shouldShowMoreButton]) {
    double v46 = 1.0;
  }
  else {
    double v46 = 0.0;
  }
  v47 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v47 setAlpha:v46];

  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    double v48 = 0.0;
  }
  else {
    double v48 = 1.0;
  }
  v49 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  [v49 setAlpha:v48];

  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    double v50 = 1.0;
  }
  else {
    double v50 = 0.0;
  }
  v51 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
  [v51 setAlpha:v50];

  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    double v52 = 1.0;
  }
  else {
    double v52 = 0.0;
  }
  v53 = [(BKLibraryBookshelfWantToReadBookCell *)self dragBarView];
  [v53 setAlpha:v52];

  if ((v29 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_37:
  BOOL v56 = 0;
LABEL_38:
  [(BKLibraryBookshelfWantToReadBookCell *)self layoutCoverView];
  [(BKLibraryBookshelfWantToReadBookCell *)self bookCoverLeftMargin];
  double v59 = v5 + v58;
  v540.origin.CGFloat x = rect;
  v540.origin.CGFloat y = v17;
  v540.size.CGFloat width = v19;
  v540.size.CGFloat height = v21;
  double v60 = v59 + CGRectGetWidth(v540);
  [v3 lockupMargin];
  double v62 = v60 + v61;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    v63 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
    objc_super v64 = [v63 image];
    [v64 size];
    double v66 = v65;
    [v3 checkMarkSpacing];
    double v62 = v62 + v66 + v67;
  }
  double rect_8 = v62;
  v541.origin.CGFloat x = rect_24.origin.x;
  v541.origin.CGFloat y = v10;
  v541.size.CGFloat width = v12;
  v541.size.CGFloat height = rect_24.size.height;
  double v68 = CGRectGetWidth(v541) - (v5 + v62);
  v69 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  [v69 alignmentSizeThatFits:1.79769313e308, 1.79769313e308];
  double v71 = v70;
  double v73 = v72;

  rect_24.origin.CGFloat y = v10;
  rect_24.size.CGFloat width = v12;
  double rect_16 = v68;
  CGFloat v509 = v21;
  CGFloat v510 = v19;
  if (_os_feature_enabled_impl())
  {
    double v515 = v73;
    if (v71 > v68)
    {
      v74 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      v75 = [v74 configuration];
      id v76 = [v75 copy];

      [v76 contentInsets];
      double v77 = v71;
      double v79 = v78;
      [v76 contentInsets];
      double v81 = v79 + v80;
      v82 = [v76 image];
      [v82 size];
      double v84 = v81 + v83;
      [v76 imagePadding];
      double v86 = v85 + v84;

      double v87 = v68 - v86;
      double v88 = v77 + v86;
      double v89 = 1.0;
      if (v77 > v87)
      {
        if (v88 <= rect_16 || v88 == 0.0) {
          double v89 = 1.0;
        }
        else {
          double v89 = rect_16 / v88;
        }
      }
      [v76 contentInsets];
      [v76 setContentInsets:v89 * v91, v89 * v92, v89 * v93, v89 * v94];
      v95 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v95 setConfiguration:v76];

      double v515 = ceil(v515 * fmax(v89, 0.75));
      v96 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v96 setButtonShrinkFactor:v89];

      v97 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      v98 = [v97 buttonFont];

      [v98 pointSize];
      v100 = [v98 fontWithSize:ceil(v89 * v99)];

      v101 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v101 setButtonFont:v100];

      double v71 = v86 + ceil(v88 * v89);
      double v68 = rect_16;
    }
  }
  else
  {
    double v102 = v17;
    v103 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v103 titleEdgeInsets];
    double v104 = v71;
    double v106 = v105;
    v107 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v107 titleEdgeInsets];
    double v109 = v106 + v108;

    double v110 = 1.0;
    if (v104 > v68 - v109)
    {
      double v111 = v104 + v109;
      BOOL v112 = v104 + v109 <= v68 || v111 == 0.0;
      double v113 = v68 / v111;
      if (v112) {
        double v110 = 1.0;
      }
      else {
        double v110 = v113;
      }
    }
    v114 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v114 setButtonShrinkFactor:v110];

    double v115 = ceil(v104 * v110);
    double v515 = ceil(v73 * v110);
    v116 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v116 titleEdgeInsets];
    double v118 = v117;
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;

    v125 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v125 setTitleEdgeInsets:v110 * v118, v110 * v120, v110 * v122, v110 * v124];

    v126 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v126 contentEdgeInsets];
    double v128 = v127;
    double v130 = v129;
    double v132 = v131;
    double v134 = v133;

    v135 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    double v136 = v110 * v130;
    double v68 = rect_16;
    [v135 setContentEdgeInsets:v110 * v128, v136, v110 * v132, v110 * v134];

    double v71 = v115 + floor(v109 * v110);
    CGFloat v12 = rect_24.size.width;
    CGFloat v17 = v102;
    double v21 = v509;
    CGFloat v19 = v510;
  }
  double v137 = v68;
  if (![(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    [v3 readBuyLeadingEdgeSpacing];
    double v137 = v68 - (v71 + v138);
  }
  double v513 = v71;
  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout]
    || [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
    {
      v542.origin.CGFloat x = rect_24.origin.x;
      v542.origin.CGFloat y = rect_24.origin.y;
      v542.size.CGFloat width = v12;
      v542.size.CGFloat height = rect_24.size.height;
      double v139 = CGRectGetWidth(v542);
      [v3 dragHandleHorizontalSpacing];
      double v141 = v498 + rect_8 + v140;
      v142 = [(BKLibraryBookshelfWantToReadBookCell *)self columnMetrics];
      [v142 margins];
      double rect_16 = v139 - (v141 + v143);
    }
  }
  else
  {
    [v3 readBuyLeadingEdgeSpacing];
    double rect_16 = rect_16 - (v71 + v144);
  }
  double v526 = v137;
  unsigned int v145 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  v543.origin.CGFloat x = rect_24.origin.x;
  v543.origin.CGFloat y = rect_24.origin.y;
  v543.size.CGFloat width = v12;
  v543.size.CGFloat height = rect_24.size.height;
  double MaxX = CGRectGetMaxX(v543);
  double v146 = v518;
  if (v145)
  {
    v147 = [(BKLibraryBookshelfWantToReadBookCell *)self columnMetrics];
    [v147 margins];
    double v146 = v148;
  }
  double v503 = v146;
  v149 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  [v149 sizeThatFits:rect_16];
  CGFloat v520 = v150;

  v544.origin.CGFloat x = rect;
  v544.origin.CGFloat y = v17;
  CGFloat v502 = v17;
  v544.size.CGFloat width = v19;
  v544.size.CGFloat height = v21;
  double MinY = CGRectGetMinY(v544);
  [v3 titleSpacing];
  CGFloat v153 = MinY + v152;
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v155 = v154;
  double v157 = v156;
  double v159 = v158;
  double v161 = v160;
  v162 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  [v162 setFrame:v155, v157, v159, v161];

  v163 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  [v163 sizeThatFits:rect_16];
  CGFloat v165 = v164;

  v545.origin.CGFloat x = rect_8;
  v545.origin.CGFloat y = v153;
  v545.size.CGFloat width = rect_16;
  v545.size.CGFloat height = v520;
  double MaxY = CGRectGetMaxY(v545);
  [v3 authorSpacing];
  CGFloat v168 = MaxY + v167;
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v170 = v169;
  double v172 = v171;
  double v174 = v173;
  double v176 = v175;
  v177 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  [v177 setFrame:v170, v172, v174, v176];

  v546.origin.CGFloat x = rect_8;
  CGFloat v487 = v168;
  CGFloat v488 = v165;
  v546.origin.CGFloat y = v168;
  v546.size.CGFloat width = rect_16;
  v546.size.CGFloat height = v165;
  double v178 = CGRectGetMaxY(v546);
  v179 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  unsigned __int8 v180 = [v179 isHidden];

  v181 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  unsigned int v182 = [v181 isHidden];

  [v3 ratingWidth];
  double v184 = v183;
  [v3 ratingHorizontalSpacing];
  double v186 = rect_16 - (v184 + v185);
  v187 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
  [v187 sizeThatFits:v186];
  double v189 = v188;
  double v191 = v190;

  double v521 = v186;
  if (v189 > v186) {
    int v192 = 1;
  }
  else {
    int v192 = v182;
  }
  [v3 ratingSpacing];
  double v194 = v178 + v193;
  if ((v192 & 1) == 0)
  {
    [v3 ratingHeight];
    if (v191 > v195)
    {
      [v3 ratingHeight];
      double v194 = v194 + (v191 - v196) * 0.5;
    }
  }
  double v516 = v191;
  double v524 = v178;
  CGFloat v197 = 0.0;
  double v198 = 0.0;
  if ((v180 & 1) == 0)
  {
    [v3 ratingWidth];
    CGFloat v197 = v199;
    [v3 ratingHeight];
    double v198 = v200;
  }
  BOOL v201 = [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  v202 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  [v202 setIsRTL:v201];

  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v204 = v203;
  double v206 = v205;
  double v208 = v207;
  double v210 = v209;
  v211 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  [v211 setFrame:v204, v206, v208, v210];

  v547.origin.CGFloat x = rect_8;
  v547.origin.CGFloat y = v194;
  CGFloat v511 = v197;
  v547.size.CGFloat width = v197;
  CGFloat v212 = v198;
  v547.size.CGFloat height = v198;
  double v213 = CGRectGetMaxX(v547);
  [v3 ratingHorizontalSpacing];
  CGFloat v215 = v213 + v214;
  CGFloat v500 = v194;
  double v216 = v194 + (v198 - v516) * 0.5;
  CGFloat v217 = v215;
  double v218 = floor(v216);
  if (v192) {
    double v219 = CGSizeZero.height;
  }
  else {
    double v219 = v516;
  }
  if (v192) {
    double v220 = CGSizeZero.width;
  }
  else {
    double v220 = v521;
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  CGFloat v522 = v218;
  IMRectFlippedForRTL();
  double v222 = v221;
  double v224 = v223;
  double v226 = v225;
  double v228 = v227;
  v229 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
  double v230 = v222;
  double v231 = rect_8;
  [v229 setFrame:v230, v224, v226, v228];

  double v232 = v524;
  if ((v180 & 1) == 0)
  {
    v548.origin.CGFloat x = rect_8;
    v548.origin.CGFloat y = v500;
    v548.size.CGFloat width = v511;
    v548.size.CGFloat height = v212;
    double v232 = CGRectGetMaxY(v548);
    v549.origin.CGFloat x = v217;
    v549.origin.CGFloat y = v522;
    v549.size.CGFloat width = v220;
    v549.size.CGFloat height = v219;
    double v233 = CGRectGetMaxY(v549);
    if (v232 < v233) {
      double v232 = v233;
    }
  }
  [v3 descriptionLeftMargin];
  double v235 = v526 - v234;
  [v3 descriptionRightMargin];
  double v237 = v235 - v236;
  v238 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  [v238 sizeThatFits:v237];
  double v240 = v239;

  [v3 descriptionTopMargin];
  double v242 = v240 + v241;
  [v3 descriptionBottomMargin];
  double v244 = v242 + v243;
  [v3 descriptionSpacing];
  double v246 = v232 + v245;
  [v3 descriptionLeftMargin];
  double v525 = rect_8 + v247;
  [v3 descriptionTopMargin];
  double v523 = v246 + v248;
  double v249 = rect_8;
  double v250 = v246;
  double v251 = v526;
  double v252 = v244;
  if (v56)
  {
    double v253 = CGRectGetMaxY(*(CGRect *)&v249);
  }
  else
  {
    double v254 = CGRectGetMinY(*(CGRect *)&v249);
    [v3 descriptionSpacing];
    double v253 = v254 + v255;
  }
  double v517 = v253;
  double v256 = MaxX - v503;
  v550.origin.CGFloat y = v523;
  v550.origin.CGFloat x = v525;
  v550.size.CGFloat width = v237;
  CGFloat v501 = v240;
  v550.size.CGFloat height = v240;
  double v257 = CGRectGetMinY(v550);
  double v527 = MaxX - v503;
  CGFloat v512 = v237;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    v258 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
    v259 = [v258 image];
    [v259 size];
    uint64_t v504 = v260;
    double v262 = v261;

    v551.origin.CGFloat x = x;
    v551.origin.CGFloat y = y;
    v551.size.CGFloat width = width;
    v551.size.CGFloat height = height;
    CGFloat v263 = CGRectGetMidY(v551) - v262 * 0.5;
    v552.origin.CGFloat x = x;
    v552.origin.CGFloat y = y;
    v552.size.CGFloat width = width;
    v552.size.CGFloat height = height;
    v533[1] = 3221225472;
    v533[0] = _NSConcreteStackBlock;
    v533[2] = sub_10014B2AC;
    v533[3] = &unk_100A483E8;
    v533[4] = self;
    *(double *)&v533[5] = v518;
    *(CGFloat *)&v533[6] = v263;
    v533[7] = v504;
    *(double *)&v533[8] = v262;
    double v231 = rect_8;
    v533[9] = *(void *)&rect_24.origin.x;
    v533[10] = *(void *)&rect_24.origin.y;
    v533[11] = *(void *)&rect_24.size.width;
    v533[12] = *(void *)&rect_24.size.height;
    *(double *)&v533[13] = v527 - v498;
    v533[14] = round(CGRectGetMidY(v552) - v495 * 0.5);
    double v256 = v527;
    *(double *)&v533[15] = v498;
    *(double *)&v533[16] = v495;
    +[UIView performWithoutAnimation:v533];
  }
  if (rect_16 >= v513) {
    CGFloat v264 = v513;
  }
  else {
    CGFloat v264 = rect_16;
  }
  unsigned int v265 = [(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout];
  if (v265) {
    CGFloat v266 = v517;
  }
  else {
    CGFloat v266 = v257;
  }
  if (v265) {
    double v267 = v231;
  }
  else {
    double v267 = v256 - v513;
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  CGFloat v519 = v267;
  IMRectFlippedForRTL();
  double v269 = v268;
  double v271 = v270;
  double v273 = v272;
  double v275 = v274;
  v276 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  [v276 setAlignmentFrame:v269, v271, v273, v275];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v277 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    v278 = [v277 layer];
    [v278 setCornerRadius:v515 * 0.5];
  }
  v553.origin.CGFloat x = v519;
  v553.origin.CGFloat y = v266;
  v553.size.CGFloat width = v264;
  v553.size.CGFloat height = v515;
  double v279 = CGRectGetMaxY(v553);
  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    v554.origin.CGFloat x = v519;
    v554.origin.CGFloat y = v266;
    v554.size.CGFloat width = v264;
    v554.size.CGFloat height = v515;
    double v517 = CGRectGetMaxY(v554);
  }
  v555.origin.CGFloat x = v519;
  v555.origin.CGFloat y = v266;
  v555.size.CGFloat width = v264;
  v555.size.CGFloat height = v515;
  double MidY = CGRectGetMidY(v555);
  v281 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v281 sizeThatFits:1.79769313e308, 1.79769313e308];
  double v283 = v282;

  [v3 moreHeight];
  double v514 = v284;
  CGFloat v492 = v266;
  CGFloat v494 = v264;
  double v496 = MidY;
  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    v556.origin.CGFloat x = v519;
    v556.origin.CGFloat y = v266;
    v556.size.CGFloat width = v264;
    v556.size.CGFloat height = v515;
    double v285 = CGRectGetMaxX(v556);
    [v3 stackedButtonHorizontalSpacing];
    double v508 = v285 + v286;
    double v287 = floor(MidY + v514 * -0.5);
  }
  else
  {
    double v508 = v256 - v283;
    [v3 moreSpacing];
    double v287 = v279 + v288;
  }
  CGFloat v505 = v287;
  CGFloat v289 = v283;
  v290 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  [v290 moreSpacing];
  double v292 = v291;
  double v293 = -v291;

  if (v292 >= 10.0) {
    double v294 = v293;
  }
  else {
    double v294 = -10.0;
  }
  v295 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  [v295 stackedButtonHorizontalSpacing];
  double v297 = v296;
  double v298 = -v296;

  if (v297 >= 10.0) {
    double v299 = v298;
  }
  else {
    double v299 = -10.0;
  }
  v300 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  [v300 cloudSpacing];
  double v302 = v301;
  double v303 = -v301;

  if (v302 >= 10.0) {
    double v304 = v303;
  }
  else {
    double v304 = -10.0;
  }
  v305 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  [v305 stackedButtonHorizontalSpacing];
  double v307 = v306;
  double v308 = -v306;

  if (v307 >= 10.0) {
    double v309 = v308;
  }
  else {
    double v309 = -10.0;
  }
  v310 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v310 setTouchInsets:v294, v299, v304, v309];

  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v312 = v311;
  double v314 = v313;
  double v316 = v315;
  double v318 = v317;
  v319 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v319 setFrame:v312, v314, v316, v318];

  v557.origin.CGFloat x = v508;
  v557.origin.CGFloat y = v505;
  CGFloat v499 = v289;
  v557.size.CGFloat width = v289;
  v557.size.CGFloat height = v514;
  double v320 = CGRectGetMaxY(v557);
  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    v558.origin.CGFloat x = v519;
    v558.origin.CGFloat y = v266;
    v558.size.CGFloat width = v494;
    v558.size.CGFloat height = v515;
    CGRectGetMaxX(v558);
    [v3 stackedButtonHorizontalSpacing];
  }
  else
  {
    [v3 cloudSpacing];
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v322 = v321;
  double v324 = v323;
  double v326 = v325;
  double v328 = v327;
  v329 = [(BKLibraryBookshelfWantToReadBookCell *)self downloadProgressButton];
  [v329 setFrame:v322, v324, v326, v328];

  v330 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  v331 = [v330 image];
  [v331 size];
  double v333 = v332;
  double v335 = v334;

  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    v559.origin.CGFloat y = v505;
    v559.origin.CGFloat x = v508;
    v559.size.CGFloat width = v289;
    v559.size.CGFloat height = v514;
    double v336 = CGRectGetMaxX(v559);
    [v3 stackedButtonHorizontalSpacing];
    double v338 = v336 + v337;
    double v339 = floor(v496 + v335 * -0.5);
  }
  else
  {
    double v338 = v527 - v333;
    [v3 cloudSpacing];
    double v339 = v320 + v340;
  }
  [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  IMRectFlippedForRTL();
  CGFloat v506 = v333;
  double v342 = v341;
  double v344 = v343;
  double v346 = v345;
  double v348 = v347;
  v349 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  [v349 setFrame:v342, v344, v346, v348];

  if ([(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
  {
    v560.origin.CGFloat x = v338;
    v560.origin.CGFloat y = v339;
    v560.size.CGFloat width = v506;
    v560.size.CGFloat height = v335;
    double v350 = CGRectGetMaxX(v560);
    CGFloat v351 = rect_24.origin.x;
    CGFloat v352 = rect_24.origin.y;
    if (v350 > CGRectGetWidth(rect_24))
    {
      v353 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
      [v353 moreSpacing];
      CGFloat v497 = v517 + v354;

      [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v356 = v355;
      double v358 = v357;
      double v360 = v359;
      double v362 = v361;
      v363 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
      [v363 setFrame:v356, v358, v360, v362];

      v364 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
      [v364 moreSpacing];

      [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v366 = v365;
      double v368 = v367;
      double v370 = v369;
      double v372 = v371;
      v373 = [(BKLibraryBookshelfWantToReadBookCell *)self downloadProgressButton];
      [v373 setFrame:v366, v368, v370, v372];

      v561.origin.CGFloat x = rect_8;
      v561.origin.CGFloat y = v497;
      v561.size.CGFloat width = v499;
      v561.size.CGFloat height = v514;
      double v374 = CGRectGetMidY(v561);
      v562.origin.CGFloat x = rect_8;
      v562.origin.CGFloat y = v497;
      v562.size.CGFloat width = v499;
      v562.size.CGFloat height = v514;
      double v375 = CGRectGetMaxX(v562);
      [v3 stackedButtonHorizontalSpacing];
      CGFloat v377 = v375 + v376;
      [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v379 = v378;
      double v381 = v380;
      double v383 = v382;
      double v385 = v384;
      v386 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
      double v387 = v383;
      double v388 = v385;
      CGFloat v351 = rect_24.origin.x;
      CGFloat v352 = rect_24.origin.y;
      [v386 setFrame:v379, v381, v387, v388];

      v563.origin.CGFloat x = v377;
      v563.origin.CGFloat y = floor(v374 + v335 * -0.5);
      v563.size.CGFloat width = v506;
      v563.size.CGFloat height = v335;
      double v517 = CGRectGetMaxY(v563);
    }
  }
  else
  {
    CGFloat v351 = rect_24.origin.x;
    CGFloat v352 = rect_24.origin.y;
  }
  CGFloat v389 = v512;
  unsigned int v390 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  [(BKLibraryBookshelfWantToReadBookCell *)self frame];
  double v391 = CGRectGetHeight(v564);
  if (v390)
  {
    double v392 = v391 * 0.5;
    v565.origin.CGFloat x = rect_8;
    v565.origin.CGFloat y = v487;
    v565.size.CGFloat height = v488;
    v565.size.CGFloat width = rect_16;
    double v393 = floor((v392 - CGRectGetMinY(v565)) / 1.5);
    double v394 = 0.0;
  }
  else
  {
    double v393 = floor((v391 - v517) * 0.5);
    if (v56 || [(BKLibraryBookshelfWantToReadBookCell *)self stackedLayout])
    {
      double v394 = v393;
    }
    else
    {
      [(BKLibraryBookshelfWantToReadBookCell *)self frame];
      CGFloat v395 = CGRectGetHeight(v566) * 0.5;
      v567.origin.CGFloat x = v519;
      v567.origin.CGFloat y = v492;
      v567.size.CGFloat width = v494;
      v567.size.CGFloat height = v515;
      double v394 = floor(v395 - CGRectGetMaxY(v567));
    }
  }
  if (v393 == 0.0)
  {
    CGFloat v420 = v501;
  }
  else
  {
    v396 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
    [v396 frame];
    CGRect v569 = CGRectOffset(v568, 0.0, v393);
    double v397 = v569.origin.x;
    double v398 = v569.origin.y;
    double v399 = v569.size.width;
    double v400 = v569.size.height;
    v401 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
    [v401 setFrame:v397, v398, v399, v400];

    v402 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
    [v402 frame];
    CGRect v571 = CGRectOffset(v570, 0.0, v393);
    double v403 = v571.origin.x;
    double v404 = v571.origin.y;
    double v405 = v571.size.width;
    double v406 = v571.size.height;
    v407 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
    [v407 setFrame:v403, v404, v405, v406];

    v408 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    [v408 frame];
    CGRect v573 = CGRectOffset(v572, 0.0, v393);
    double v409 = v573.origin.x;
    double v410 = v573.origin.y;
    double v411 = v573.size.width;
    double v412 = v573.size.height;
    v413 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    [v413 setFrame:v409, v410, v411, v412];

    v414 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
    [v414 frame];
    CGRect v575 = CGRectOffset(v574, 0.0, v393);
    double v415 = v575.origin.x;
    double v416 = v575.origin.y;
    double v417 = v575.size.width;
    double v418 = v575.size.height;
    v419 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
    [v419 setFrame:v415, v416, v417, v418];

    v576.origin.CGFloat y = v523;
    v576.origin.CGFloat x = v525;
    v576.size.CGFloat width = v512;
    v576.size.CGFloat height = v501;
    CGRect v577 = CGRectOffset(v576, 0.0, v393);
    double v523 = v577.origin.y;
    double v525 = v577.origin.x;
    CGFloat v389 = v577.size.width;
    CGFloat v420 = v577.size.height;
  }
  if (v394 != 0.0)
  {
    v421 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v421 frame];
    CGRect v579 = CGRectOffset(v578, 0.0, v394);
    double v422 = v579.origin.x;
    double v423 = v579.origin.y;
    double v424 = v579.size.width;
    double v425 = v351;
    double v426 = v420;
    double v427 = v579.size.height;
    v428 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v428 setFrame:v422, v423, v424, v427];

    v429 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
    [v429 frame];
    CGRect v581 = CGRectOffset(v580, 0.0, v394);
    double v430 = v581.origin.x;
    double v431 = v581.origin.y;
    double v432 = v581.size.width;
    double v433 = v581.size.height;
    v434 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
    [v434 setFrame:v430, v431, v432, v433];

    v435 = [(BKLibraryBookshelfWantToReadBookCell *)self downloadProgressButton];
    [v435 frame];
    CGRect v583 = CGRectOffset(v582, 0.0, v394);
    double v436 = v583.origin.x;
    double v437 = v583.origin.y;
    double v438 = v583.size.width;
    CGFloat v439 = v583.size.height;
    v440 = [(BKLibraryBookshelfWantToReadBookCell *)self downloadProgressButton];
    double v441 = v439;
    CGFloat v420 = v426;
    CGFloat v351 = v425;
    CGFloat v352 = rect_24.origin.y;
    [v440 setFrame:v436, v437, v438, v441];

    v442 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
    [v442 frame];
    CGRect v585 = CGRectOffset(v584, 0.0, v394);
    double v443 = v585.origin.x;
    double v444 = v585.origin.y;
    double v445 = v585.size.width;
    double v446 = v585.size.height;
    v447 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
    [v447 setFrame:v443, v444, v445, v446];
  }
  +[UIView inheritedAnimationDuration];
  if (v448 == 0.0)
  {
    [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  }
  else
  {
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
      goto LABEL_143;
    }
    v532[0] = _NSConcreteStackBlock;
    v532[1] = 3221225472;
    v532[2] = sub_10014B39C;
    v532[3] = &unk_100A44EF0;
    v532[4] = self;
    *(double *)&v532[5] = v525;
    *(double *)&v532[6] = v523;
    *(CGFloat *)&v532[7] = v389;
    *(CGFloat *)&v532[8] = v420;
    *(CGFloat *)&v532[9] = v351;
    *(CGFloat *)&v532[10] = v352;
    v532[11] = *(void *)&rect_24.size.width;
    v532[12] = *(void *)&rect_24.size.height;
    +[UIView performWithoutAnimation:v532];
    [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
  }
  IMRectFlippedForRTL();
  double v450 = v449;
  double v452 = v451;
  double v454 = v453;
  double v456 = v455;
  v457 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  [v457 setFrame:v450, v452, v454, v456];

LABEL_143:
  v458 = +[UIBezierPath bezierPath];
  v459 = [(BKLibraryBookshelfWantToReadBookCell *)self separatorline];
  [v459 lineWidth];
  double v461 = v460 * -0.5 + 1.0;

  v586.origin.CGFloat x = rect;
  v586.origin.CGFloat y = v502;
  v586.size.CGFloat width = v510;
  v586.size.CGFloat height = v509;
  double MinX = CGRectGetMinX(v586);
  if ([(BKLibraryBookshelfWantToReadBookCell *)self isRTL])
  {
    v587.origin.CGFloat x = rect;
    v587.origin.CGFloat y = v502;
    v587.size.CGFloat width = v510;
    v587.size.CGFloat height = v509;
    double MinX = CGRectGetMaxX(v587);
    CGFloat v463 = v351;
    v588.origin.CGFloat x = v351;
    v588.origin.CGFloat y = v352;
    CGFloat v465 = rect_24.size.width;
    CGFloat v464 = rect_24.size.height;
    v588.size.CGFloat width = rect_24.size.width;
    v588.size.CGFloat height = rect_24.size.height;
    double v466 = CGRectGetMaxX(v588) - v527;
  }
  else
  {
    double v466 = v527;
    CGFloat v463 = v351;
    CGFloat v465 = rect_24.size.width;
    CGFloat v464 = rect_24.size.height;
  }
  v589.origin.CGFloat x = v463;
  v589.origin.CGFloat y = v352;
  v589.size.CGFloat width = v465;
  v589.size.CGFloat height = v464;
  [v458 moveToPoint:MinX, CGRectGetMaxY(v589) - v461];
  v590.origin.CGFloat x = v463;
  v590.origin.CGFloat y = v352;
  v590.size.CGFloat width = v465;
  v590.size.CGFloat height = v464;
  [v458 addLineToPoint:v466, CGRectGetMaxY(v590) - v461];
  v467 = +[CABasicAnimation animationWithKeyPath:@"path"];
  id v468 = v458;
  [v467 setToValue:[v468 CGPath]];
  +[UIView inheritedAnimationDuration];
  [v467 setDuration:];
  v469 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v467 setTimingFunction:v469];

  [v467 setFillMode:kCAFillModeForwards];
  [v467 setRemovedOnCompletion:0];
  v470 = [(BKLibraryBookshelfWantToReadBookCell *)self separatorline];
  [v470 addAnimation:v467 forKey:0];

  id v471 = v468;
  id v472 = [v471 CGPath];
  v473 = [(BKLibraryBookshelfWantToReadBookCell *)self separatorline];
  [v473 setPath:v472];

  v474 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  if (v474)
  {
    [v3 audiobookControlMargin];
    double v476 = v475;
    [v474 frame];
    CGFloat v478 = v477;
    double v480 = v479;
    [(BKLibraryBookshelfWantToReadBookCell *)self coverFrame];
    CGFloat v482 = v476 + v481;
    CGFloat v485 = v484 + v483 - v480 - v476;
    [v474 frame];
    v592.origin.CGFloat x = v482;
    v592.origin.CGFloat y = v485;
    v592.size.CGFloat width = v478;
    v592.size.CGFloat height = v480;
    if (!CGRectEqualToRect(v591, v592))
    {
      [(BKLibraryBookshelfWantToReadBookCell *)self isRTL];
      IMRectFlippedForRTL();
      [v474 setFrame:];
    }
  }
  v486 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  [v486 updateButton];
}

- (void)_updateTintedImages
{
  uint64_t v3 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];

    if (v5)
    {
      double v6 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
      id v22 = [v6 moreTintColor];

      double v7 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      CGFloat v8 = [v7 dragBarImageWithTintColor:v22];
      double v9 = [(BKLibraryBookshelfWantToReadBookCell *)self dragBarView];
      [v9 setImage:v8];

      CGFloat v10 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      double v11 = [v10 selectedCheckmarkImageForSelectedState:[self isSelected]];
      CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
      [v12 setImage:v11];

      if ([(BKLibraryBookshelfWantToReadBookCell *)self isSelected]) {
        +[UIColor bc_booksKeyColor];
      }
      else {
      CGFloat v13 = +[UIColor bc_booksTertiaryLabelColor];
      }
      double v14 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
      [v14 setTintColor:v13];

      CGFloat v15 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
      double v16 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      CGFloat v17 = [v16 actionMenuImageWithTintColor:v22];
      [v15 setImage:v17 forState:0];

      double v18 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      CGFloat v19 = [v18 templateCloudImageForCloudState:1];
      double v20 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
      [v20 setImage:v19];

      double v21 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
      [v21 setTintColor:v22];
    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v53.receiver = self;
  v53.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  id v4 = a3;
  [(BKLibraryBookshelfCollectionViewCell *)&v53 applyLayoutAttributes:v4];
  objc_opt_class();
  double v5 = BUDynamicCast();
  double v6 = [v4 indexPath];

  [(BKLibraryBookshelfWantToReadBookCell *)self setIndexPath:v6];
  double v7 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfWantToReadBookCell setIsRTL:](self, "setIsRTL:", [v7 userInterfaceLayoutDirection] == (id)1);

  -[BKLibraryBookshelfWantToReadBookCell setLayoutDebugMode:](self, "setLayoutDebugMode:", [v5 layoutDebugMode]);
  if ([v5 layoutDebugMode])
  {
    [(BKLibraryBookshelfWantToReadBookCell *)self configureDebugLayout];
  }
  else
  {
    CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self layer];
    [v8 setBorderWidth:0.0];
  }
  double v9 = [v5 cellMetrics];
  [(BKLibraryBookshelfWantToReadBookCell *)self setMetrics:v9];

  CGFloat v10 = [v5 columnMetrics];
  [(BKLibraryBookshelfWantToReadBookCell *)self setColumnMetrics:v10];

  id v11 = [v5 lastItem];
  CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self separatorline];
  [v12 setHidden:v11];

  objc_opt_class();
  CGFloat v13 = [v5 cellMetrics];
  double v14 = BUDynamicCast();

  CGFloat v15 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];

  if (v14 != v15)
  {
    [(BKLibraryBookshelfWantToReadBookCell *)self setWantToReadMetrics:v14];
    [(BKLibraryBookshelfWantToReadBookCell *)self setMetrics:v14];
    [v14 bookCoverSize];
    -[BKLibraryBookshelfWantToReadBookCell setBookCoverSize:](self, "setBookCoverSize:");
    [v14 bookCoverLeftMargin];
    -[BKLibraryBookshelfWantToReadBookCell setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
    -[BKLibraryBookshelfWantToReadBookCell setStackedLayout:](self, "setStackedLayout:", [v14 stackedLayout]);
    [v14 titleMaxLines];
    uint64_t v17 = (uint64_t)v16;
    double v18 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
    [v18 setNumberOfLines:v17];

    id v19 = [v14 descriptionVisibleRows];
    double v20 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
    [v20 setNumberOfLines:v19];

    double v21 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    id v22 = [v21 frameColor];
    double v23 = [v14 ratingFrameColor];

    if (v22 != v23)
    {
      unsigned int v24 = [v14 ratingFrameColor];
      double v25 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
      [v25 setFrameColor:v24];
    }
    CGFloat v26 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    double v27 = [v26 fillColor];
    double v28 = [v14 ratingFillColor];

    if (v27 != v28)
    {
      unsigned int v29 = [v14 ratingFillColor];
      uint64_t v30 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
      [v30 setFillColor:v29];
    }
    double v31 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    unsigned int v32 = [v31 emptyColor];
    double v33 = [v14 ratingEmptyColor];

    if (v32 != v33)
    {
      unsigned __int8 v34 = [v14 ratingEmptyColor];
      double v35 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
      [v35 setEmptyColor:v34];
    }
    [v14 editMargin];
    -[BKLibraryBookshelfWantToReadBookCell setEditMargin:](self, "setEditMargin:");
    id v36 = [v14 cellSeparatorColor];
    id v37 = [v36 CGColor];
    double v38 = [(BKLibraryBookshelfWantToReadBookCell *)self separatorline];
    [v38 setStrokeColor:v37];

    [(BKLibraryBookshelfWantToReadBookCell *)self updateTextForProductProfile];
    [(BKLibraryBookshelfWantToReadBookCell *)self updateStarRatingProductProfile];
    [(BKLibraryBookshelfWantToReadBookCell *)self _updateTintedImages];
  }
  CGAffineTransform v39 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];

  if (v39)
  {
    +[UIView inheritedAnimationDuration];
    double v41 = v40;
    BOOL v42 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
    v43 = [v42 coverLayer];
    if (v41 == 0.0)
    {
      libraryAsset = self->_libraryAsset;
      [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
      [v43 setLibraryAsset:libraryAsset size:v48 v49];
    }
    else
    {
      [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
      [v43 preloadCoverImageAtSize:v44, v45];

      dispatch_time_t v46 = dispatch_time(0, (uint64_t)(v41 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10014BC20;
      block[3] = &unk_100A43D60;
      void block[4] = self;
      dispatch_after(v46, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    double v50 = [(BKLibraryBookshelfWantToReadBookCell *)self coverView];
    v51 = [v50 coverLayer];
    [v51 setAnimateFrameChange:1];

    [(BKLibraryBookshelfWantToReadBookCell *)self layoutIfNeeded];
  }
}

- (void)setSelected:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  -[BKLibraryBookshelfWantToReadBookCell setSelected:](&v7, "setSelected:");
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10014BD90;
    v5[3] = &unk_100A44E60;
    v5[4] = self;
    BOOL v6 = a3;
    +[UIView animateWithDuration:v5 animations:0.2];
  }
}

- (void)setLibraryAsset:(id)a3
{
  double v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    uint64_t v17 = v5;
    if (libraryAsset && ([(BKLibraryAsset *)libraryAsset isContainer] & 1) == 0)
    {
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"combinedState" context:off_100B1F698];
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1F6A0];
      [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1F6A0];
    }
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    if (*p_libraryAsset)
    {
      CGFloat v8 = +[BKLibraryAssetStatusController sharedController];
      double v9 = [(BKLibraryAsset *)*p_libraryAsset permanentOrTemporaryAssetID];
      CGFloat v10 = [v8 statusForAssetID:v9];
      [(BKLibraryBookshelfWantToReadBookCell *)self setLibraryDownloadStatus:v10];
    }
    else
    {
      [(BKLibraryBookshelfWantToReadBookCell *)self setLibraryDownloadStatus:0];
    }
    id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self asset];
    [(BKLibraryBookshelfWantToReadBookCell *)self setAsset:0];
    if (*p_libraryAsset && ([(BKLibraryAsset *)*p_libraryAsset isContainer] & 1) == 0)
    {
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"combinedState" options:0 context:off_100B1F698];
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"title" options:0 context:off_100B1F6A0];
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"author" options:0 context:off_100B1F6A0];
    }
    if (!v11)
    {
      CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v12 resetButtonState];
    }
    CGFloat v13 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    if (v13)
    {
      double v14 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
      [(BKLibraryBookshelfWantToReadBookCell *)self coverArea];
      [v14 setLibraryAsset:v13 size:v15, v16];

      [(BKLibraryBookshelfWantToReadBookCell *)self _updateAssetStrings];
      [(BKLibraryBookshelfWantToReadBookCell *)self setNeedsLayout];
    }

    double v5 = v17;
  }
}

- (void)setLibraryDownloadStatus:(id)a3
{
  double v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = &self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    CGFloat v8 = v5;
    [(BKLibraryDownloadStatus *)libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1F688];
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1F690];
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus addObserver:self forKeyPath:@"combinedState" options:0 context:off_100B1F688];
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus addObserver:self forKeyPath:@"progressValue" options:0 context:off_100B1F690];
    double v5 = v8;
  }
}

- (void)_updateAssetStrings
{
  id v13 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  uint64_t v3 = [v13 title];
  id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  double v5 = [v4 titleFontAttributes];
  BOOL v6 = +[TUIFontSpec attributedStringWith:v3 attributes:v5];
  objc_super v7 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  [v7 setAttributedText:v6];

  CGFloat v8 = [v13 displayAuthor];
  double v9 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  CGFloat v10 = [v9 authorFontAttributes];
  id v11 = +[TUIFontSpec attributedStringWith:v8 attributes:v10];
  CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  [v12 setAttributedText:v11];
}

- (void)setInitialAsset:(id)a3
{
  [(BKLibraryBookshelfWantToReadBookCell *)self setAsset:a3];
  id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  [v4 resetButtonState];
}

- (void)setAsset:(id)a3
{
  double v5 = (BFMAsset *)a3;
  p_asset = (id *)&self->_asset;
  if (self->_asset != v5)
  {
    double v16 = v5;
    if (!v5) {
      goto LABEL_4;
    }
    objc_super v7 = [(BFMAsset *)v5 id];
    CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    double v9 = [v8 assetID];
    unsigned int v10 = [v7 isEqualToString:v9];

    double v5 = v16;
    if (v10)
    {
LABEL_4:
      objc_storeStrong((id *)&self->_asset, a3);
      id v11 = *p_asset;
      CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v12 setAsset:v11];

      [*p_asset averageRating];
      double v14 = v13;
      double v15 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
      [v15 setRating:v14];

      [(BKLibraryBookshelfWantToReadBookCell *)self updateTextForProductProfile];
      [(BKLibraryBookshelfWantToReadBookCell *)self updateStarRatingProductProfile];
      double v5 = v16;
    }
  }
}

- (void)updateTextForProductProfile
{
  id v23 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
  uint64_t v3 = [(BFMAsset *)self->_asset name];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [v23 title];
  }
  double v5 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  BOOL v6 = [v5 titleFontAttributes];
  objc_super v7 = +[TUIFontSpec attributedStringWith:v4 attributes:v6];
  CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  [v8 setAttributedText:v7];

  if (!v3) {
  double v9 = [(BFMAsset *)self->_asset artistName];
  }
  unsigned int v10 = v9;
  if (!v9)
  {
    unsigned int v10 = [v23 displayAuthor];
  }
  id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  CGFloat v12 = [v11 authorFontAttributes];
  double v13 = +[TUIFontSpec attributedStringWith:v10 attributes:v12];
  double v14 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  [v14 setAttributedText:v13];

  if (!v9) {
  double v15 = +[BCMAssetWrapper htmlStrippedStandardNotesForAsset:self->_asset];
  }
  double v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = +[BCMAssetWrapper htmlStrippedStandardDescriptionForAsset:self->_asset];
  }
  double v18 = v17;

  id v19 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
  double v20 = [v19 descriptionFontAttributes];
  double v21 = +[TUIFontSpec attributedStringWith:v18 attributes:v20];
  id v22 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  [v22 setAttributedText:v21];

  [(BKLibraryBookshelfWantToReadBookCell *)self setNeedsLayout];
}

- (void)updateStarRatingProductProfile
{
  uint64_t v3 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
  if (v3)
  {
    id v4 = (void *)v3;
    double v5 = [(BKLibraryBookshelfWantToReadBookCell *)self asset];

    if (v5)
    {
      BOOL v6 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      objc_super v7 = [v6 starRatingCountLabel];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [(BFMAsset *)self->_asset ratingCount]);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
      double v9 = [v8 starRatingCountFontAttributes];
      unsigned int v10 = +[TUIFontSpec attributedStringWith:v16 attributes:v9];
      id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
      [v11 setAttributedText:v10];

      CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
      double v13 = [v12 starRatingCountAccessibilityLabel];
      double v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [(BFMAsset *)self->_asset ratingCount]);
      double v15 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
      [v15 setAccessibilityLabel:v14];

      [(BKLibraryBookshelfWantToReadBookCell *)self setNeedsLayout];
    }
  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
  double v5 = [v4 moreButtonAccessibilityLabel];
  [(IMTouchInsetsButton *)self->_moreButton setAccessibilityLabel:v5];

  [(BKLibraryBookshelfWantToReadBookCell *)self _updateTintedImages];
  [(BKLibraryBookshelfWantToReadBookCell *)self updateStarRatingProductProfile];

  [(BKLibraryBookshelfWantToReadBookCell *)self setNeedsLayout];
}

- (void)setAudiobookStatus:(id)a3
{
  double v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    double v9 = v5;
    if (audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1F6A8];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1F6B0];
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" options:0 context:off_100B1F6A8];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" options:0 context:off_100B1F6B0];
    }
    CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    [v8 audiobookControlDiameter];
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v9);

    double v5 = v9;
  }
}

- (void)updateBuyReadButton
{
  uint64_t v3 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];

  if (v3)
  {
    id v47 = [(BKLibraryBookshelfWantToReadBookCell *)self wantToReadMetrics];
    if (![(BKLibraryBookshelfWantToReadBookCell *)self isCloud]
      && ![(BKLibraryBookshelfWantToReadBookCell *)self isLocal]
      && ![(BKLibraryBookshelfWantToReadBookCell *)self isDownloading]
      && [(BKLibraryBookshelfWantToReadBookCell *)self isStore]
      || [(BKLibraryBookshelfWantToReadBookCell *)self isSample]
      || [(BKLibraryBookshelfWantToReadBookCell *)self canPreorder]
      || [(BKLibraryBookshelfWantToReadBookCell *)self wasPreordered])
    {
      id v4 = [v47 readBuyStoreFontAttributes];
      double v5 = [v4 font];
      BOOL v6 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v6 setButtonFont:v5];

      objc_super v7 = [v47 readBuyStoreTextColor];
      CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v8 setTextColor:v7];

      double v9 = [v47 readBuyStoreFillColor];
      unsigned int v10 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v10 setBackgroundFillColor:v9];

      id v11 = [v47 readBuyStoreTextHilightColor];
      CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v12 setTextHilightColor:v11];

      double v13 = [v47 readBuyStoreFillHilightColor];
      double v14 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v14 setBackgroundFillHighlightColor:v13];

      uint64_t v15 = [v47 readBuyStoreFrameColor];
    }
    else
    {
      id v36 = [v47 readBuyFontAttributes];
      id v37 = [v36 font];
      double v38 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v38 setButtonFont:v37];

      CGAffineTransform v39 = [v47 readBuyTextColor];
      double v40 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v40 setTextColor:v39];

      double v41 = [v47 readBuyFillColor];
      BOOL v42 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v42 setBackgroundFillColor:v41];

      v43 = [v47 readBuyTextHilightColor];
      double v44 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v44 setTextHilightColor:v43];

      double v45 = [v47 readBuyFillHilightColor];
      dispatch_time_t v46 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v46 setBackgroundFillHighlightColor:v45];

      uint64_t v15 = [v47 readBuyFrameColor];
    }
    id v16 = (void *)v15;
    id v17 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v17 setFrameColor:v16];

    [v47 readBuyFrameWidth];
    double v19 = v18;
    double v20 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v20 setFrameWidth:v19];

    double v21 = [v47 readBuyStoreTextDisabledColor];
    id v22 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v22 setDisabledTextColor:v21];

    id v23 = [v47 buyStateBackgroundFillColor];
    unsigned int v24 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v24 setBuyStateBackgroundFillColor:v23];

    double v25 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    CGFloat v26 = [v25 configuration];
    id v27 = [v26 copy];

    [v27 setContentInsets:6.0, 20.0, 6.0, 20.0];
    double v28 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v28 setConfiguration:v27];

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      [v47 readBuyTitleInset];
      double v30 = v29;
      [v47 readBuyTitleInset];
      double v32 = v31;
      double v33 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v33 setTitleEdgeInsets:0.0, v30, 0.0, v32];

      unsigned __int8 v34 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
      [v34 setContentEdgeInsets:6.0, 0.0, 6.0, 0.0];
    }
    double v35 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
    [v35 updateButton];
  }
}

- (void)_cancelDownload:(id)a3
{
  if ([(BKLibraryBookshelfWantToReadBookCell *)self isDownloading])
  {
    id v6 = [(BKLibraryBookshelfWantToReadBookCell *)self actionHandler];
    id v4 = [(BKLibraryBookshelfWantToReadBookCell *)self libraryAsset];
    [v6 bookCancelDownload:v4];
  }
  else
  {
    double v5 = BKLibraryUILog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1007EB37C(v5);
    }
  }
}

- (void)configureDebugLayout
{
  uint64_t v3 = +[UIColor redColor];
  id v4 = [v3 colorWithAlphaComponent:0.2];
  id v5 = [v4 CGColor];
  id v6 = [(BKLibraryBookshelfWantToReadBookCell *)self layer];
  [v6 setBorderColor:v5];

  objc_super v7 = [(BKLibraryBookshelfWantToReadBookCell *)self layer];
  [v7 setBorderWidth:0.5];

  CGFloat v8 = +[UIColor redColor];
  id v9 = [v8 colorWithAlphaComponent:0.2];
  id v10 = [v9 CGColor];
  id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v11 setBorderColor:v10];

  CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self coverLayer];
  [v12 setBorderWidth:0.5];

  double v13 = +[UIColor redColor];
  id v14 = [v13 colorWithAlphaComponent:0.2];
  id v15 = [v14 CGColor];
  id v16 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
  id v17 = [v16 layer];
  [v17 setBorderColor:v15];

  double v18 = [(BKLibraryBookshelfWantToReadBookCell *)self checkmarkView];
  double v19 = [v18 layer];
  [v19 setBorderWidth:0.5];

  double v20 = +[UIColor redColor];
  id v21 = [v20 colorWithAlphaComponent:0.2];
  id v22 = [v21 CGColor];
  id v23 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  unsigned int v24 = [v23 layer];
  [v24 setBorderColor:v22];

  double v25 = [(BKLibraryBookshelfWantToReadBookCell *)self cloudView];
  CGFloat v26 = [v25 layer];
  [v26 setBorderWidth:0.5];

  id v27 = +[UIColor redColor];
  id v28 = [v27 colorWithAlphaComponent:0.2];
  id v29 = [v28 CGColor];
  double v30 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  double v31 = [v30 layer];
  [v31 setBorderColor:v29];

  double v32 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  double v33 = [v32 layer];
  [v33 setBorderWidth:0.5];

  unsigned __int8 v34 = +[UIColor redColor];
  id v35 = [v34 colorWithAlphaComponent:0.2];
  id v36 = [v35 CGColor];
  id v37 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  double v38 = [v37 layer];
  [v38 setBorderColor:v36];

  CGAffineTransform v39 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
  double v40 = [v39 layer];
  [v40 setBorderWidth:0.5];

  double v41 = +[UIColor redColor];
  id v42 = [v41 colorWithAlphaComponent:0.2];
  id v43 = [v42 CGColor];
  double v44 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  double v45 = [v44 layer];
  [v45 setBorderColor:v43];

  dispatch_time_t v46 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  id v47 = [v46 layer];
  [v47 setBorderWidth:0.5];

  double v48 = +[UIColor redColor];
  id v49 = [v48 colorWithAlphaComponent:0.2];
  id v50 = [v49 CGColor];
  v51 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  double v52 = [v51 layer];
  [v52 setBorderColor:v50];

  objc_super v53 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
  v54 = [v53 layer];
  [v54 setBorderWidth:0.5];

  v55 = +[UIColor redColor];
  id v56 = [v55 colorWithAlphaComponent:0.2];
  id v57 = [v56 CGColor];
  double v58 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
  double v59 = [v58 layer];
  [v59 setBorderColor:v57];

  double v60 = [(BKLibraryBookshelfWantToReadBookCell *)self starRatingCountLabel];
  double v61 = [v60 layer];
  [v61 setBorderWidth:0.5];

  double v62 = +[UIColor redColor];
  id v63 = [v62 colorWithAlphaComponent:0.2];
  id v64 = [v63 CGColor];
  double v65 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  double v66 = [v65 layer];
  [v66 setBorderColor:v64];

  double v67 = [(BKLibraryBookshelfWantToReadBookCell *)self readBuyButton];
  double v68 = [v67 layer];
  [v68 setBorderWidth:0.5];

  v69 = +[UIColor redColor];
  id v70 = [v69 colorWithAlphaComponent:0.2];
  id v71 = [v70 CGColor];
  double v72 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  double v73 = [v72 layer];
  [v73 setBorderColor:v71];

  id v75 = [(BKLibraryBookshelfWantToReadBookCell *)self bookDescription];
  v74 = [v75 layer];
  [v74 setBorderWidth:0.5];
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  [a3 locationInView:self];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self dragBarView];
  [v8 frame];
  CGRect v23 = CGRectInset(v22, -20.0, -20.0);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  BOOL v13 = [(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  if (v13)
  {
    CGFloat v14 = x;
    CGFloat v15 = y;
    CGFloat v16 = width;
    CGFloat v17 = height;
    uint64_t v18 = v5;
    uint64_t v19 = v7;
    LOBYTE(v13) = CGRectContainsPoint(*(CGRect *)&v14, *(CGPoint *)&v18);
  }
  return v13;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGFloat v8 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  id v9 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
  id v10 = [v9 collection];
  id v19 = [v6 analyticsAssetPropertyProviderForLibraryAsset:v7 fromSourceView:v8 inCollection:v10];

  id v11 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  CGFloat v12 = [v6 tracker];
  [v11 setupAppAnalyticsReportingUsingTracker:v12 withPropertyProvider:v19];

  BOOL v13 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v13 setShowsMenuAsPrimaryAction:1];

  CGFloat v14 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  CGFloat v15 = [(BKLibraryBookshelfWantToReadBookCell *)self dataSource];
  CGFloat v16 = [v15 collection];
  CGFloat v17 = [v6 menuWithLibraryAsset:v7 sourceView:v14 collection:v16];

  uint64_t v18 = [(BKLibraryBookshelfWantToReadBookCell *)self moreButton];
  [v18 setMenu:v17];
}

- (void)togglePlayPause:(id)a3
{
  id v3 = [(BKLibraryBookshelfWantToReadBookCell *)self audiobookStatus];
  [v3 assetAudiobookStatusTogglePlayPause];
}

- (BOOL)needsAsset
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
  return [(BKLibraryBookshelfWantToReadBookCell *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  id v3 = +[NSMutableArray array];
  objc_super v4 = [(UILabel *)self->_titleLabel text];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
    id v7 = [v6 text];
    [v3 addObject:v7];
  }
  CGFloat v8 = [(UILabel *)self->_authorLabel text];
  id v9 = [v8 length];

  if (v9)
  {
    id v10 = [(BKLibraryBookshelfWantToReadBookCell *)self authorLabel];
    id v11 = [v10 text];
    [v3 addObject:v11];
  }
  CGFloat v12 = [v3 componentsJoinedByString:@", "];

  return v12;
}

- (id)accessibilityUserInputLabels
{
  id v3 = +[NSMutableArray array];
  objc_super v4 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
  id v5 = [v4 text];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = [(BKLibraryBookshelfWantToReadBookCell *)self titleLabel];
    CGFloat v8 = [v7 text];
    [v3 addObject:v8];
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    [(BKLibraryBookshelfWantToReadBookCell *)self setSelected:[(BKLibraryBookshelfWantToReadBookCell *)self isSelected] ^ 1];
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)BKLibraryBookshelfWantToReadBookCell;
    return [(BKLibraryBookshelfWantToReadBookCell *)&v4 accessibilityActivate];
  }
}

- (id)accessibilityCustomContent
{
  id v3 = +[NSMutableArray array];
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    objc_super v4 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    id v5 = [v4 accessibilityLabel];
    id v6 = [v5 accessibilityLabel];
    id v7 = [(BKLibraryBookshelfWantToReadBookCell *)self starRating];
    CGFloat v8 = [v7 accessibilityValue];
    id v9 = +[AXCustomContent customContentWithLabel:v6 value:v8];
    [v3 addObject:v9];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Ratings" value:&stru_100A70340 table:0];
    CGFloat v12 = [(BKLibraryBookshelfWantToReadBookCell *)self asset];
    BOOL v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%lu", [v12 ratingCount]);
    CGFloat v14 = +[AXCustomContent customContentWithLabel:v11 value:v13];
    [v3 addObject:v14];
  }

  return v3;
}

- (void)setCoverView:(id)a3
{
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageProvider);

  return (BKLibraryBookshelfStorageProvider *)WeakRetained;
}

- (void)setStorageProvider:(id)a3
{
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (BKLibraryBookshelfLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (BKLibraryActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (BKLibraryActionHandler *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (BKLibraryBookshelfCellMetrics_WantToRead)wantToReadMetrics
{
  return self->_wantToReadMetrics;
}

- (void)setWantToReadMetrics:(id)a3
{
}

- (CGSize)bookCoverSize
{
  double width = self->_bookCoverSize.width;
  double height = self->_bookCoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (BOOL)stackedLayout
{
  return self->_stackedLayout;
}

- (void)setStackedLayout:(BOOL)a3
{
  self->_stackedLayout = a3;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UIImageView)cloudView
{
  return self->_cloudView;
}

- (void)setCloudView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
}

- (IMTouchInsetsButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (BKLibraryStarRating)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
}

- (UILabel)starRatingCountLabel
{
  return self->_starRatingCountLabel;
}

- (void)setStarRatingCountLabel:(id)a3
{
}

- (BCBuyGetTwoStateButton)readBuyButton
{
  return self->_readBuyButton;
}

- (void)setReadBuyButton:(id)a3
{
}

- (UILabel)bookDescription
{
  return self->_bookDescription;
}

- (void)setBookDescription:(id)a3
{
}

- (double)editMargin
{
  return self->_editMargin;
}

- (void)setEditMargin:(double)a3
{
  self->_editMargin = a3;
}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
}

- (UIImageView)dragBarView
{
  return self->_dragBarView;
}

- (void)setDragBarView:(id)a3
{
}

- (IMRadialProgressButton)downloadProgressButton
{
  return self->_downloadProgressButton;
}

- (void)setDownloadProgressButton:(id)a3
{
}

- (BKLibraryDownloadStatus)libraryDownloadStatus
{
  return self->_libraryDownloadStatus;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_dragBarView, 0);
  objc_storeStrong((id *)&self->_separatorline, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_readBuyButton, 0);
  objc_storeStrong((id *)&self->_starRatingCountLabel, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cloudView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_wantToReadMetrics, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);

  objc_storeStrong((id *)&self->_coverView, 0);
}

@end