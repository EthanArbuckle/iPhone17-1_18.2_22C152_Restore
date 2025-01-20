@interface BKLibraryBookshelfInfoCell
- (AEAssetAudiobookStatus)audiobookStatus;
- (BCInsetsFittingButton)cloudButton;
- (BCInsetsFittingButton)moreButton;
- (BFMAsset)asset;
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookshelfCellMetrics)metrics;
- (BKLibraryBookshelfInfoBadge)badge;
- (BKLibraryBookshelfInfoCell)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfInfoCellDelegate)delegate;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BKLibraryDownloadStatus)libraryDownloadStatus;
- (BOOL)_shouldRemovePriceBadge;
- (BOOL)isAssetDownloading;
- (BOOL)leftAlignedCloudIcon;
- (BOOL)showsDateBadge;
- (BOOL)showsPlaybackProgress;
- (CALayer)audiobookBadge;
- (CGSize)audiobookBadgeSize;
- (IMRadialProgressButton)downloadProgressButton;
- (MPUNowPlayingIndicatorView)nowPlayingIndicator;
- (NSNumber)bkaxAudiobookReadPercentage;
- (NSSet)seriesBooks;
- (UIColor)badgeBackgroundColor;
- (UIColor)badgeFrameColor;
- (UILabel)dateBadge;
- (id)cellMetrics;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)infoKind;
- (int64_t)_bookshelfCloudState;
- (int64_t)currentUserInterfaceStyle;
- (void)_downloadStatusNotification:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)createOrUpdateAudiobookBadge;
- (void)createOrUpdateBadgeWithBadgeBackgroundColor:(id)a3 badgeFrameColor:(id)a4 textConfigurationBlock:(id)a5;
- (void)createOrUpdateCloudButton;
- (void)createOrUpdateDateBadge;
- (void)createOrUpdateDownloadProgressButton;
- (void)createOrUpdateFinishedLabelIfNeeded;
- (void)createOrUpdateMoreButton;
- (void)createOrUpdatePriceBadge;
- (void)dealloc;
- (void)layoutAudioViews:(CGRect *)a3 bounds:(CGRect)a4 isRTL:(BOOL)a5;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reachabilityChanged:(id)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAudiobookBadge:(id)a3;
- (void)setAudiobookBadgeSize:(CGSize)a3;
- (void)setAudiobookStatus:(id)a3;
- (void)setBadge:(id)a3;
- (void)setBadgeBackgroundColor:(id)a3;
- (void)setBadgeFrameColor:(id)a3;
- (void)setBkaxAudiobookReadPercentage:(id)a3;
- (void)setCloudButton:(id)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDateBadge:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadProgressButton:(id)a3;
- (void)setInfoKind:(int)a3;
- (void)setLeftAlignedCloudIcon:(BOOL)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setLibraryDownloadStatus:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setNowPlayingIndicator:(id)a3;
- (void)setSeriesBooks:(id)a3;
- (void)setupMenu;
- (void)updateConfiguration:(BOOL)a3;
- (void)updateInfoKind;
@end

@implementation BKLibraryBookshelfInfoCell

- (BKLibraryBookshelfInfoCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfInfoCell;
  v3 = -[BKLibraryBookshelfInfoCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKLibraryBookshelfInfoCell *)v3 setOpaque:0];
    v5 = +[NSNotificationCenter defaultCenter];
    v6 = +[BKReachability sharedReachabilityForInternetConnection];
    [v5 addObserver:v4 selector:"reachabilityChanged:" name:@"kNetworkReachabilityChangedNotification" object:v6];

    [v5 addObserver:v4 selector:"_downloadStatusNotification:" name:BKLibraryDownloadStatusNotification object:0];
    v7 = [(BKLibraryBookshelfInfoCell *)v4 traitCollection];
    v4->_currentUserInterfaceStyle = (int64_t)[v7 userInterfaceStyle];

    v8 = +[BURestrictionsProvider sharedInstance];
    [v8 addObserver:v4];

    v9 = +[UITraitCollection bc_allAPITraits];
    id v10 = [(BKLibraryBookshelfInfoCell *)v4 registerForTraitChanges:v9 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = +[BKReachability sharedReachabilityForInternetConnection];
  [v3 removeObserver:self name:@"kNetworkReachabilityChangedNotification" object:v4];

  [v3 removeObserver:self name:BKLibraryDownloadStatusNotification object:0];
  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1FF80];
  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1FF88];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"combinedState" context:off_100B1FF90];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"isNew" context:off_100B1FF98];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"readingProgress" context:off_100B1FFA0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_seriesBooks;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) removeObserver:self forKeyPath:@"isFinished" context:off_100B1FFA8];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1FFB0];
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackTimeRemaining" context:off_100B1FFB8];
  id v10 = +[BURestrictionsProvider sharedInstance];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfInfoCell;
  [(BKLibraryBookshelfInfoCell *)&v11 dealloc];
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
}

- (void)_downloadStatusNotification:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v16 = v4;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:BKLibraryDownloadStatusKey];
  id v7 = BUDynamicCast();

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) assetID];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100171884;
        v19[3] = &unk_100A43DD8;
        v19[4] = self;
        id v14 = v13;
        id v20 = v14;
        long long v15 = objc_retainBlock(v19);
        if (v15)
        {
          if (+[NSThread isMainThread])
          {
            ((void (*)(void *))v15[2])(v15);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100171940;
            block[3] = &unk_100A442B8;
            v18 = v15;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (([(BKLibraryBookshelfInfoCell *)self isHiddenOrHasHiddenAncestor] & 1) == 0)
  {
    [(BKLibraryBookshelfInfoCell *)self alpha];
    if (v8 == 1.0)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = [(BKLibraryBookshelfInfoCell *)self subviews];
      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            [v14 convertPoint:self x:y];
            double v16 = v15;
            double v18 = v17;
            if (objc_msgSend(v14, "pointInside:withEvent:", v7))
            {
              v19 = [v14 hitTest:v7 withEvent:v16];

              goto LABEL_13;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)BKLibraryBookshelfInfoCell;
  v19 = -[BKLibraryBookshelfInfoCell hitTest:withEvent:](&v21, "hitTest:withEvent:", v7, x, y);
LABEL_13:

  return v19;
}

- (id)cellMetrics
{
  objc_opt_class();
  v3 = [(BKLibraryBookshelfInfoCell *)self metrics];
  id v4 = BUDynamicCast();

  return v4;
}

- (void)setLibraryAsset:(id)a3
{
  v5 = (BKLibraryAsset *)a3;
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  if (libraryAsset != v5)
  {
    v33 = v5;
    [(BKLibraryAsset *)libraryAsset removeObserver:self forKeyPath:@"combinedState" context:off_100B1FF90];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"isNew" context:off_100B1FF98];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"readingProgress" context:off_100B1FFA0];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v8 = self->_seriesBooks;
    id v9 = [(NSSet *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * i) removeObserver:self forKeyPath:@"isFinished" context:off_100B1FFA8];
        }
        id v10 = [(NSSet *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_libraryAsset, a3);
    if (*p_libraryAsset)
    {
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"combinedState" options:0 context:off_100B1FF90];
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"isNew" options:0 context:off_100B1FF98];
      [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"readingProgress" options:0 context:off_100B1FFA0];
      long long v13 = [(BKLibraryAsset *)*p_libraryAsset seriesBooks];
      id v14 = (NSSet *)[v13 copy];
      seriesBooks = self->_seriesBooks;
      self->_seriesBooks = v14;

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      double v16 = self->_seriesBooks;
      id v17 = [(NSSet *)v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
      v5 = v33;
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
            [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) addObserver:self forKeyPath:@"isFinished" options:0 context:off_100B1FFA8];
          }
          id v18 = [(NSSet *)v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v18);
      }

      if (*p_libraryAsset)
      {
        objc_super v21 = +[BKLibraryAssetStatusController sharedController];
        long long v22 = [(BKLibraryAsset *)*p_libraryAsset permanentOrTemporaryAssetID];
        long long v23 = [v21 statusForAssetID:v22];
        [(BKLibraryBookshelfInfoCell *)self setLibraryDownloadStatus:v23];
      }
      else
      {
        [(BKLibraryBookshelfInfoCell *)self setLibraryDownloadStatus:0];
      }
      asset = self->_asset;
      if (asset)
      {
        v27 = [(BFMAsset *)asset id];
        v28 = [(BKLibraryAsset *)*p_libraryAsset assetID];
        unsigned __int8 v29 = [v27 isEqualToString:v28];

        if ((v29 & 1) == 0)
        {
          v30 = self->_asset;
          self->_asset = 0;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

      if (WeakRetained)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100172054;
        v36[3] = &unk_100A43D60;
        v36[4] = self;
        v32 = objc_retainBlock(v36);
        if (v32)
        {
          if (+[NSThread isMainThread])
          {
            ((void (*)(void *))v32[2])(v32);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100172060;
            block[3] = &unk_100A442B8;
            v35 = v32;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
    }
    else
    {
      [(BKLibraryBookshelfInfoCell *)self setLibraryDownloadStatus:0];
      long long v24 = self->_asset;
      self->_asset = 0;

      long long v25 = self->_seriesBooks;
      self->_seriesBooks = 0;

      v5 = v33;
    }
  }
}

- (void)setupMenu
{
  v3 = [(BKLibraryBookshelfInfoCell *)self moreButton];
  sub_100172104(self, v3);

  id v4 = [(BKLibraryBookshelfInfoCell *)self cloudButton];
  sub_100172104(self, v4);

  id v5 = [(BKLibraryBookshelfInfoCell *)self downloadProgressButton];
  sub_100172104(self, v5);
}

- (void)setLibraryDownloadStatus:(id)a3
{
  id v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = (id *)&self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    if (!v5)
    {
      [(BCInsetsFittingButton *)self->_cloudButton removeFromSuperview];
      cloudButton = self->_cloudButton;
      self->_cloudButton = 0;

      libraryDownloadStatus = (BKLibraryDownloadStatus *)*p_libraryDownloadStatus;
    }
    [(BKLibraryDownloadStatus *)libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1FF80];
    [*p_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1FF88];
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    if (*p_libraryDownloadStatus)
    {
      [*p_libraryDownloadStatus addObserver:self forKeyPath:@"combinedState" options:0 context:off_100B1FF80];
      [*p_libraryDownloadStatus addObserver:self forKeyPath:@"progressValue" options:0 context:off_100B1FF88];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

    if (WeakRetained)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100172460;
      v13[3] = &unk_100A43D60;
      v13[4] = self;
      id v10 = objc_retainBlock(v13);
      if (v10)
      {
        if (+[NSThread isMainThread])
        {
          ((void (*)(void *))v10[2])(v10);
        }
        else
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10017246C;
          v11[3] = &unk_100A442B8;
          uint64_t v12 = v10;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
        }
      }
    }
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    id v5 = obj;
    if (self->_libraryAsset)
    {
      [(BKLibraryBookshelfInfoCell *)self updateConfiguration:1];
      id v5 = obj;
    }
  }
}

- (void)setMetrics:(id)a3
{
  id v5 = (BKLibraryBookshelfCellMetrics *)a3;
  if (self->_metrics != v5)
  {
    v35 = v5;
    objc_opt_class();
    id v6 = BUDynamicCast();
    objc_opt_class();
    id v7 = BUDynamicCast();
    [v6 infoBarHeight];
    double v9 = v8;
    [v7 infoBarHeight];
    if (v9 != v10) {
      goto LABEL_6;
    }
    [v6 dotsSpacing];
    double v12 = v11;
    [v7 dotsSpacing];
    if (v12 != v13) {
      goto LABEL_6;
    }
    [v6 cloudSpacing];
    double v15 = v14;
    [v7 cloudSpacing];
    if (v15 == v16
      && ([v6 infoBarDateSpacing], double v18 = v17, objc_msgSend(v7, "infoBarDateSpacing"), v18 == v19))
    {
      long long v22 = [v6 priceColor];
      long long v23 = [v7 priceColor];
      if ([v22 isEqual:v23])
      {
        long long v24 = [v6 infoBadgeFontAttributes];
        long long v25 = [v7 infoBadgeFontAttributes];
        if ([v24 isEqual:v25])
        {
          v26 = [v6 expectedDateFontAttributes];
          v33 = [v7 expectedDateFontAttributes];
          v34 = v26;
          if (objc_msgSend(v26, "isEqual:")
            && ([v6 audioBadgeSpacing], double v28 = v27, objc_msgSend(v7, "audioBadgeSpacing"), v28 == v29))
          {
            [v6 badgeEndCapWidth];
            double v31 = v30;
            [v7 badgeEndCapWidth];
            BOOL v20 = v31 != v32;
          }
          else
          {
            BOOL v20 = 1;
          }
        }
        else
        {
          BOOL v20 = 1;
        }
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
LABEL_6:
      BOOL v20 = 1;
    }
    objc_storeStrong((id *)&self->_metrics, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

    if (WeakRetained && v20) {
      [(BKLibraryBookshelfInfoCell *)self updateConfiguration:1];
    }

    id v5 = v35;
  }
}

- (void)layoutAudioViews:(CGRect *)a3 bounds:(CGRect)a4 isRTL:(BOOL)a5
{
  nowPlayingIndicator = self->_nowPlayingIndicator;
  memset(&v18, 0, sizeof(v18));
  if (nowPlayingIndicator)
  {
    [(MPUNowPlayingIndicatorView *)nowPlayingIndicator bk_width];
    CGRectDivide(*a3, &v18, a3, v8, CGRectMinXEdge);
    [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicator maximumLevelHeight];
    CGFloat v10 = v9;
    v18.origin.double y = v18.origin.y + (CGRectGetHeight(v18) - v9) * 0.5;
    v18.size.double height = v10;
    IMRectFlippedForRTL();
    -[MPUNowPlayingIndicatorView setFrame:](self->_nowPlayingIndicator, "setFrame:");
    double v11 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
    [v11 audioBadgeSpacing];
    CGRectDivide(*a3, &v18, a3, v12, CGRectMinXEdge);

    audiobookBadge = self->_audiobookBadge;
    uint64_t v14 = 1;
  }
  else
  {
    CGRectDivide(*a3, &v18, a3, self->_audiobookBadgeSize.width, CGRectMinXEdge);
    double height = self->_audiobookBadgeSize.height;
    v18.origin.double y = v18.origin.y + (CGRectGetHeight(v18) - height) * 0.5;
    v18.size.double height = height;
    IMRectFlippedForRTL();
    -[CALayer setFrame:](self->_audiobookBadge, "setFrame:");
    double v16 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
    [v16 audioBadgeSpacing];
    CGRectDivide(*a3, &v18, a3, v17, CGRectMinXEdge);

    audiobookBadge = self->_audiobookBadge;
    uint64_t v14 = 0;
  }
  [(CALayer *)audiobookBadge setHidden:v14];
}

- (BOOL)showsDateBadge
{
  return self->_dateBadge != 0;
}

- (BOOL)showsPlaybackProgress
{
  return self->_audiobookStatus != 0;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(BKLibraryBookshelfInfoCell *)self traitCollection];
  -[BKLibraryBookshelfInfoCell setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", [v5 userInterfaceStyle]);
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)BKLibraryBookshelfInfoCell;
  [(BKLibraryBookshelfInfoCell *)&v63 layoutSubviews];
  [(BKLibraryBookshelfInfoCell *)self bounds];
  if (v5 > 0.0)
  {
    double v7 = v3;
    double v8 = v4;
    double v9 = v5;
    double v10 = v6;
    double v11 = +[UIApplication sharedApplication];
    id v12 = [v11 userInterfaceLayoutDirection];

    remainder.origin.double x = v7;
    remainder.origin.double y = v8;
    remainder.size.width = v9;
    remainder.size.double height = v10;
    memset(&slice, 0, sizeof(slice));
    double v13 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
    [v13 infoBarExpectedDateHeight];
    CGFloat v15 = v14;

    double v16 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
    [v16 infoBarDateSpacing];
    double v18 = v17;

    v64.origin.double x = v7;
    v64.origin.double y = v8;
    v64.size.width = v9;
    v64.size.double height = v10;
    CGRectDivide(v64, &slice, &remainder, v15, CGRectMaxYEdge);
    remainder.size.double height = remainder.size.height - v18;
    double v19 = [(BCInsetsFittingButton *)self->_moreButton superview];

    if (v19)
    {
      memset(&v60, 0, sizeof(v60));
      [(BCInsetsFittingButton *)self->_moreButton bounds];
      CGFloat Width = CGRectGetWidth(v65);
      CGRectDivide(remainder, &v60, &remainder, Width, CGRectMaxXEdge);
      IMRectFlippedForRTL();
      -[BCInsetsFittingButton setFrame:](self->_moreButton, "setFrame:");
      objc_super v21 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
      [v21 dotsSpacing];
      CGRectDivide(remainder, &v60, &remainder, v22, CGRectMaxXEdge);
    }
    long long v23 = [(BKLibraryBookshelfInfoCell *)self dataSource];
    long long v24 = [v23 collection];

    long long v25 = [v24 collectionID];
    LODWORD(v26) = [v25 isEqualToString:kBKCollectionDefaultIDFinished];

    if (self->_audiobookBadge)
    {
      int v27 = [(BKLibraryBookshelfInfoCell *)self infoKind] == 10 ? 1 : (int)v26;
      if (v27 == 1) {
        -[BKLibraryBookshelfInfoCell layoutAudioViews:bounds:isRTL:](self, "layoutAudioViews:bounds:isRTL:", &remainder, v12 == (id)1, v7, v8, v9, v10);
      }
    }
    double v28 = [(BCInsetsFittingButton *)self->_cloudButton superview];

    if (v28)
    {
      memset(&v60, 0, sizeof(v60));
      [(BCInsetsFittingButton *)self->_cloudButton bounds];
      CGFloat v29 = CGRectGetWidth(v66);
      CGRectDivide(remainder, &v60, &remainder, v29, CGRectMaxXEdge);
      IMRectFlippedForRTL();
      -[BCInsetsFittingButton setFrame:](self->_cloudButton, "setFrame:");
      double v30 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
      [v30 cloudSpacing];
      CGRectDivide(remainder, &v60, &remainder, v31, CGRectMaxXEdge);
    }
    if (self->_downloadProgressButton)
    {
      memset(&v60, 0, sizeof(v60));
      double v32 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
      [v32 infoBarHeight];
      CGRectDivide(remainder, &v60, &remainder, v33, CGRectMaxXEdge);

      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      IMRectFlippedForRTL();
      -[IMRadialProgressButton setFrame:](self->_downloadProgressButton, "setFrame:");
      +[CATransaction commit];
      v34 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
      [v34 cloudSpacing];
      CGRectDivide(remainder, &v60, &remainder, v35, CGRectMaxXEdge);
    }
    badge = self->_badge;
    if (badge)
    {
      v59 = v24;
      CGSize size = CGRectZero.size;
      v60.origin = CGRectZero.origin;
      v60.CGSize size = size;
      char v38 = (char)v26;
      if (self->_badgeBackgroundColor)
      {
        -[BKLibraryBookshelfInfoBadge sizeThatFits:](badge, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
        double v40 = v39;
        long long v41 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v41 badgeEndCapWidth];
        CGFloat v43 = v40 + v42 * 2.0;

        CGRectDivide(remainder, &v60, &remainder, v43, CGRectMinXEdge);
      }
      else
      {
        CGRect v60 = remainder;
      }
      IMRectFlippedForRTL();
      -[BKLibraryBookshelfInfoBadge setFrame:](self->_badge, "setFrame:");
      CGFloat v44 = CGRectGetHeight(v60) * 0.5;
      v45 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
      [v45 setCornerRadius:v44];

      v46 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
      [v46 cloudSpacing];
      CGRectDivide(remainder, &v60, &remainder, v47, CGRectMinXEdge);

      v48 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:[(BKLibraryBookshelfInfoCell *)self currentUserInterfaceStyle]];
      v49 = [(BKLibraryBookshelfInfoCell *)self badgeFrameColor];
      id v50 = [v49 resolvedColorWithTraitCollection:v48];
      id v51 = [v50 CGColor];
      v52 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
      [v52 setBorderColor:v51];

      v53 = [(BKLibraryBookshelfInfoCell *)self badgeBackgroundColor];
      id v26 = [v53 resolvedColorWithTraitCollection:v48];
      id v54 = [v26 CGColor];
      v55 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
      [v55 setBackgroundColor:v54];

      LOBYTE(v26) = v38;
      long long v24 = v59;
    }
    if (self->_audiobookBadge)
    {
      char v56 = [(BKLibraryBookshelfInfoCell *)self infoKind] == 10 ? 1 : (char)v26;
      if ((v56 & 1) == 0) {
        -[BKLibraryBookshelfInfoCell layoutAudioViews:bounds:isRTL:](self, "layoutAudioViews:bounds:isRTL:", &remainder, v12 == (id)1, v7, v8, v9, v10);
      }
    }
    dateBadge = self->_dateBadge;
    if (dateBadge)
    {
      [(UILabel *)dateBadge bounds];
      double Height = CGRectGetHeight(v67);
      slice.origin.double y = CGRectGetMaxY(slice) - Height;
      slice.size.double height = Height;
      IMRectFlippedForRTL();
      -[UILabel setFrame:](self->_dateBadge, "setFrame:");
    }
  }
}

- (void)setAsset:(id)a3
{
  double v5 = (BFMAsset *)a3;
  if (self->_asset != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(BKLibraryBookshelfInfoCell *)self updateConfiguration:1];
    double v5 = v6;
  }
}

- (void)updateInfoKind
{
  if ([(BKLibraryAsset *)self->_libraryAsset isNew]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  if ([(BKLibraryAsset *)self->_libraryAsset isContainer])
  {
    uint64_t v3 = 9;
    goto LABEL_19;
  }
  if ([(BKLibraryAsset *)self->_libraryAsset isProof])
  {
    uint64_t v3 = 4;
    goto LABEL_19;
  }
  if ([(BKLibraryAsset *)self->_libraryAsset isPreorderBook])
  {
    uint64_t v3 = 6;
    goto LABEL_19;
  }
  if ([(BFMAsset *)self->_asset isPreorder])
  {
    uint64_t v3 = 5;
    goto LABEL_19;
  }
  unsigned int v4 = [(BKLibraryAsset *)self->_libraryAsset state];
  libraryAsset = self->_libraryAsset;
  if (v4 == 5)
  {
    BOOL v6 = [(BKLibraryAsset *)libraryAsset seriesNextFlag] == 0;
    unsigned int v7 = 3;
    goto LABEL_16;
  }
  unsigned int v8 = [(BKLibraryAsset *)libraryAsset isAudiobook];
  double v9 = self->_libraryAsset;
  if (v8)
  {
    BOOL v6 = [(BKLibraryAsset *)v9 isOwned] == 0;
    unsigned int v7 = 10;
LABEL_16:
    if (v6) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = v7;
    }
    goto LABEL_19;
  }
  if (([(BKLibraryAsset *)v9 isSample] & 1) != 0
    || ([(BKLibraryAsset *)self->_libraryAsset isOwned] & 1) == 0
    && ([(BKLibraryAsset *)self->_libraryAsset isInSamples] & 1) != 0)
  {
    uint64_t v3 = 7;
  }
  else if ([(BKLibraryAsset *)self->_libraryAsset state] != 1)
  {
    if ([(BKLibraryAsset *)self->_libraryAsset state] == 6) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = v3;
    }
  }
LABEL_19:
  unsigned int v10 = [(BKLibraryBookshelfInfoCell *)self infoKind];
  if (v3 == 2 || v10 != v3)
  {
    [(BKLibraryBookshelfInfoCell *)self setInfoKind:v3];
    double v11 = [(BKLibraryBookshelfInfoCell *)self badge];
    [v11 removeFromSuperview];

    [(BKLibraryBookshelfInfoCell *)self setBadge:0];
  }
}

- (BOOL)isAssetDownloading
{
  if (([(BKLibraryAsset *)self->_libraryAsset isDownloading] & 1) == 0
    && ![(BKLibraryAsset *)self->_libraryAsset isDownloadingSupplementalContent])
  {
    return 0;
  }
  uint64_t v3 = [(BKLibraryBookshelfInfoCell *)self libraryDownloadStatus];
  BOOL v4 = [v3 combinedState] == (id)4;

  return v4;
}

- (void)updateConfiguration:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001733C8;
  v3[3] = &unk_100A44E60;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView performWithoutAnimation:v3];
}

- (BOOL)_shouldRemovePriceBadge
{
  v2 = [(BKLibraryBookshelfInfoCell *)self dataSource];
  uint64_t v3 = [v2 collection];

  uint64_t v4 = [v3 collectionID];
  unsigned __int8 v5 = [(id)v4 isEqualToString:kBKCollectionDefaultIDFinished];

  LOBYTE(v4) = +[BKReachability isOffline];
  BOOL v6 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v7 = [v6 isBookStoreAllowed];

  return v4 | v7 ^ 1 | v5;
}

- (void)createOrUpdateFinishedLabelIfNeeded
{
  uint64_t v3 = [(BKLibraryBookshelfInfoCell *)self dataSource];
  uint64_t v4 = [v3 collection];

  unsigned __int8 v5 = [v4 collectionID];
  unsigned int v6 = [v5 isEqualToString:kBKCollectionDefaultIDFinished];

  if ([(BKLibraryAsset *)self->_libraryAsset isFinished]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    unsigned int v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"Finished_Infobar" value:@"Finished" table:&stru_100A70340];

    unsigned int v10 = +[UIColor bc_booksGray];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001749EC;
    v12[3] = &unk_100A48BC0;
    id v13 = v9;
    id v11 = v9;
    [(BKLibraryBookshelfInfoCell *)self createOrUpdateBadgeWithBadgeBackgroundColor:0 badgeFrameColor:v10 textConfigurationBlock:v12];
  }
}

- (void)createOrUpdateDateBadge
{
  if (!self->_dateBadge)
  {
    uint64_t v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    dateBadge = self->_dateBadge;
    self->_dateBadge = v3;

    [(UILabel *)self->_dateBadge setUserInteractionEnabled:0];
    [(BKLibraryBookshelfInfoCell *)self addSubview:self->_dateBadge];
  }
  unsigned __int8 v5 = [(BKLibraryBookshelfInfoCell *)self libraryAsset];
  id v20 = [v5 expectedDate];

  id v6 = v20;
  if (!v20)
  {
    BOOL v7 = [(BKLibraryBookshelfInfoCell *)self asset];
    unsigned int v8 = [v7 expectedReleaseDate];
    double v9 = v8;
    if (v8)
    {
      id v21 = v8;
    }
    else
    {
      unsigned int v10 = [(BKLibraryBookshelfInfoCell *)self asset];
      id v21 = [v10 releaseDate];
    }
    id v6 = v21;
  }
  id v22 = v6;
  id v11 = +[JSADateFormatter stringFromDate:v6 dateStyle:1 timeStyle:0];
  id v12 = [(BKLibraryBookshelfInfoCell *)self dataSource];
  id v13 = [v12 infoExpectedDateString];
  double v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);

  CGFloat v15 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
  double v16 = [v15 expectedDateFontAttributes];
  double v17 = +[TUIFontSpec attributedStringWith:v14 attributes:v16];
  [(UILabel *)self->_dateBadge setAttributedText:v17];

  [(UILabel *)self->_dateBadge setTextAlignment:4];
  -[UILabel sizeThatFits:](self->_dateBadge, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v19 = v18;
  [(BKLibraryBookshelfInfoCell *)self bounds];
  -[UILabel setBounds:](self->_dateBadge, "setBounds:", 0.0, 0.0, CGRectGetWidth(v24), v19);
}

- (void)createOrUpdateAudiobookBadge
{
  if ([(BKLibraryAsset *)self->_libraryAsset isAudiobook]
    && [(BKLibraryAsset *)self->_libraryAsset contentType] != 5)
  {
    if (!self->_audiobookBadge)
    {
      BOOL v7 = +[CALayer layer];
      audiobookBadge = self->_audiobookBadge;
      self->_audiobookBadge = v7;

      double v9 = [(BKLibraryBookshelfInfoCell *)self layer];
      [v9 addSublayer:self->_audiobookBadge];
    }
    unsigned int v10 = [(BKLibraryBookshelfInfoCell *)self dataSource];
    id v11 = +[UIColor bc_booksGray];
    id v12 = [v10 infoBarAudiobookImageWithTintColor:v11];

    [v12 size];
    self->_audiobookBadgeSize.width = v13;
    self->_audiobookBadgeSize.double height = v14;
    -[CALayer setBounds:](self->_audiobookBadge, "setBounds:", 0.0, 0.0, v13, v14);
    id v30 = v12;
    -[CALayer setContents:](self->_audiobookBadge, "setContents:", [v30 CGImage]);
    audiobookStatus = self->_audiobookStatus;
    if (audiobookStatus)
    {
      if (!self->_nowPlayingIndicator)
      {
        double v16 = [objc_alloc((Class)MPUNowPlayingIndicatorView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        nowPlayingIndicator = self->_nowPlayingIndicator;
        self->_nowPlayingIndicator = v16;

        double v18 = +[UIColor bc_booksGray];
        [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicator setLevelGuttersColor:v18];

        double v19 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v19 nowPlayingInterLevelSpacing];
        -[MPUNowPlayingIndicatorView setInterLevelSpacing:](self->_nowPlayingIndicator, "setInterLevelSpacing:");

        id v20 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v20 nowPlayingLevelCornerRadius];
        -[MPUNowPlayingIndicatorView setLevelCornerRadius:](self->_nowPlayingIndicator, "setLevelCornerRadius:");

        id v21 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v21 nowPlayingLevelWidth];
        -[MPUNowPlayingIndicatorView setLevelWidth:](self->_nowPlayingIndicator, "setLevelWidth:");

        id v22 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v22 nowPlayingMaximumLevelHeight];
        -[MPUNowPlayingIndicatorView setMaximumLevelHeight:](self->_nowPlayingIndicator, "setMaximumLevelHeight:");

        long long v23 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        [v23 nowPlayingMinimumLevelHeight];
        -[MPUNowPlayingIndicatorView setMinimumLevelHeight:](self->_nowPlayingIndicator, "setMinimumLevelHeight:");

        CGRect v24 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
        -[MPUNowPlayingIndicatorView setNumberOfLevels:](self->_nowPlayingIndicator, "setNumberOfLevels:", [v24 nowPlayingNumberOfLevels]);

        [(BKLibraryBookshelfInfoCell *)self addSubview:self->_nowPlayingIndicator];
        audiobookStatus = self->_audiobookStatus;
      }
      unsigned int v25 = [(AEAssetAudiobookStatus *)audiobookStatus assetAudiobookStatusIsPlaying];
      id v26 = self->_nowPlayingIndicator;
      if (v25)
      {
        [(MPUNowPlayingIndicatorView *)v26 setAlpha:1.0];
        int v27 = self->_nowPlayingIndicator;
        uint64_t v28 = 1;
      }
      else
      {
        [(MPUNowPlayingIndicatorView *)v26 setAlpha:0.6];
        int v27 = self->_nowPlayingIndicator;
        uint64_t v28 = 2;
      }
      [(MPUNowPlayingIndicatorView *)v27 setPlaybackState:v28];
    }
    else
    {
      [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicator removeFromSuperview];
      CGFloat v29 = self->_nowPlayingIndicator;
      self->_nowPlayingIndicator = 0;
    }
    [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
  }
  else
  {
    uint64_t v3 = [(BKLibraryBookshelfInfoCell *)self audiobookBadge];

    if (v3)
    {
      [(CALayer *)self->_audiobookBadge removeFromSuperlayer];
      uint64_t v4 = self->_audiobookBadge;
      self->_audiobookBadge = 0;

      [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
    }
    unsigned __int8 v5 = [(BKLibraryBookshelfInfoCell *)self nowPlayingIndicator];

    if (v5)
    {
      [(MPUNowPlayingIndicatorView *)self->_nowPlayingIndicator removeFromSuperview];
      id v6 = self->_nowPlayingIndicator;
      self->_nowPlayingIndicator = 0;

      [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
    }
  }
}

- (void)createOrUpdateMoreButton
{
  moreButton = self->_moreButton;
  if (!moreButton)
  {
    uint64_t v4 = [(BKLibraryBookshelfInfoCell *)self dataSource];
    unsigned __int8 v5 = +[UIColor bc_booksGray];
    id v6 = [v4 actionMenuImageWithTintColor:v5];

    BOOL v7 = +[BCInsetsFittingButton buttonWithType:0];
    unsigned int v8 = self->_moreButton;
    self->_moreButton = v7;

    [v6 size];
    double v10 = v9;
    [v6 size];
    double v11 = 0.0;
    -[BCInsetsFittingButton setBounds:](self->_moreButton, "setBounds:", 0.0, 0.0, v10, v12);
    [v6 size];
    double v14 = 0.0;
    if ((44.0 - v13) * 0.5 >= 0.0)
    {
      [v6 size];
      double v14 = (44.0 - v15) * 0.5;
    }
    [v6 size];
    if ((44.0 - v16) * 0.5 >= 0.0)
    {
      [v6 size];
      double v11 = (44.0 - v17) * 0.5;
    }
    -[BCInsetsFittingButton setTouchInsets:](self->_moreButton, "setTouchInsets:", -v11, -v14, -v11, -v14);
    [(BCInsetsFittingButton *)self->_moreButton setImage:v6 forState:0];

    moreButton = self->_moreButton;
  }
  double v18 = [(BCInsetsFittingButton *)moreButton superview];

  if (!v18)
  {
    double v19 = self->_moreButton;
    [(BKLibraryBookshelfInfoCell *)self addSubview:v19];
  }
}

- (void)createOrUpdateCloudButton
{
  int64_t v3 = [(BKLibraryBookshelfInfoCell *)self _bookshelfCloudState];
  if (v3 && (int64_t v4 = v3, [(BKLibraryAsset *)self->_libraryAsset contentType] != 5))
  {
    if (!self->_cloudButton)
    {
      id v6 = +[BCInsetsFittingButton buttonWithType:0];
      cloudButton = self->_cloudButton;
      self->_cloudButton = v6;

      unsigned int v8 = [(BCInsetsFittingButton *)self->_cloudButton layer];
      [v8 setMasksToBounds:1];

      double v9 = +[UIColor bc_booksGray];
      [(BCInsetsFittingButton *)self->_cloudButton setTintColor:v9];
    }
    double v10 = [(BKLibraryBookshelfInfoCell *)self dataSource];
    id v21 = [v10 templateCloudImageForCloudState:v4];

    [v21 size];
    double v12 = v11;
    [v21 size];
    double v13 = 0.0;
    -[BCInsetsFittingButton setBounds:](self->_cloudButton, "setBounds:", 0.0, 0.0, v12, v14);
    [v21 size];
    double v16 = 0.0;
    if ((44.0 - v15) * 0.5 >= 0.0)
    {
      [v21 size];
      double v16 = (44.0 - v17) * 0.5;
    }
    [v21 size];
    if ((44.0 - v18) * 0.5 >= 0.0)
    {
      [v21 size];
      double v13 = (44.0 - v19) * 0.5;
    }
    -[BCInsetsFittingButton setTouchInsets:](self->_cloudButton, "setTouchInsets:", -v13, -v16, -v13, -v16);
    [(BCInsetsFittingButton *)self->_cloudButton setImage:v21 forState:0];
    id v20 = [(BCInsetsFittingButton *)self->_cloudButton superview];

    if (!v20)
    {
      [(BKLibraryBookshelfInfoCell *)self addSubview:self->_cloudButton];
      [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
    }
  }
  else
  {
    unsigned __int8 v5 = [(BCInsetsFittingButton *)self->_cloudButton superview];

    if (v5)
    {
      [(BCInsetsFittingButton *)self->_cloudButton removeFromSuperview];
      [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
    }
  }
}

- (void)createOrUpdateDownloadProgressButton
{
  if ([(BKLibraryBookshelfInfoCell *)self isAssetDownloading]
    && [(BKLibraryAsset *)self->_libraryAsset contentType] != 5)
  {
    if ([(BKLibraryBookshelfInfoCell *)self isAssetDownloading])
    {
      if (!self->_downloadProgressButton)
      {
        unsigned __int8 v5 = [objc_alloc((Class)IMRadialProgressButton) initWithFrame:0.0, 0.0, 17.0, 17.0];
        downloadProgressButton = self->_downloadProgressButton;
        self->_downloadProgressButton = v5;

        [(IMRadialProgressButton *)self->_downloadProgressButton setCenterImageNormal:0];
        [(IMRadialProgressButton *)self->_downloadProgressButton setCenterImageSelected:0];
        [(IMRadialProgressButton *)self->_downloadProgressButton setInscribeProgress:0];
        BOOL v7 = +[UIColor bc_booksKeyColor];
        [(IMRadialProgressButton *)self->_downloadProgressButton setProgressColor:v7];

        [(IMRadialProgressButton *)self->_downloadProgressButton setProgressLineCap:1];
        [(IMRadialProgressButton *)self->_downloadProgressButton setProgressThickness:2.0];
        unsigned int v8 = +[UIColor bc_booksTableSelectionColor];
        [(IMRadialProgressButton *)self->_downloadProgressButton setTrackColor:v8];

        [(IMRadialProgressButton *)self->_downloadProgressButton setTrackDiameter:17.0];
        [(IMRadialProgressButton *)self->_downloadProgressButton setTrackThickness:2.0];
        -[IMRadialProgressButton setTouchInsets:](self->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
        sub_100172104(self, self->_downloadProgressButton);
        [(BKLibraryBookshelfInfoCell *)self addSubview:self->_downloadProgressButton];
      }
      [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus progressValue];
      *(float *)&double v9 = v9;
      [(IMRadialProgressButton *)self->_downloadProgressButton setProgress:v9];
    }
  }
  else
  {
    int64_t v3 = [(IMRadialProgressButton *)self->_downloadProgressButton superview];

    if (v3)
    {
      [(IMRadialProgressButton *)self->_downloadProgressButton removeFromSuperview];
      int64_t v4 = self->_downloadProgressButton;
      self->_downloadProgressButton = 0;
    }
  }

  [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
}

- (void)createOrUpdatePriceBadge
{
  if ([(BKLibraryBookshelfInfoCell *)self infoKind] != 5
    && [(BKLibraryBookshelfInfoCell *)self infoKind] != 6)
  {
    int64_t v3 = +[BKLibraryManager defaultManager];
    int64_t v4 = [v3 priceManager];

    unsigned __int8 v5 = [(BKLibraryBookshelfInfoCell *)self libraryAsset];
    id v6 = [v5 storeID];

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100175718;
    v8[3] = &unk_100A48C60;
    objc_copyWeak(&v10, &location);
    id v7 = v6;
    id v9 = v7;
    [v4 fetchPriceForAssetID:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)createOrUpdateBadgeWithBadgeBackgroundColor:(id)a3 badgeFrameColor:(id)a4 textConfigurationBlock:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, BKLibraryBookshelfInfoBadge *))a5;
  if (!self->_badge)
  {
    id v10 = objc_alloc_init(BKLibraryBookshelfInfoBadge);
    badge = self->_badge;
    self->_badge = v10;

    [(BKLibraryBookshelfInfoBadge *)self->_badge setUserInteractionEnabled:0];
    [(BKLibraryBookshelfInfoCell *)self addSubview:self->_badge];
  }
  double v12 = [(BKLibraryBookshelfInfoCell *)self cellMetrics];
  [v12 infoBarHeight];
  double v14 = v13;

  v9[2](v9, self->_badge);
  double v15 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
  [v15 setBorderWidth:0.0];

  if (v22)
  {
    [(BKLibraryBookshelfInfoBadge *)self->_badge setTextAlignment:1];
    double v16 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
    [v16 setCornerRadius:v14 * 0.5];

    [(BKLibraryBookshelfInfoCell *)self setBadgeBackgroundColor:v22];
    double v17 = +[UIColor clearColor];
    unsigned int v18 = [v22 isEqual:v17];

    if (v18)
    {
      [(BKLibraryBookshelfInfoCell *)self setBadgeFrameColor:v8];
      double v19 = [(BKLibraryBookshelfInfoBadge *)self->_badge layer];
      [v19 setBorderWidth:1.0];
    }
    else
    {
      [(BKLibraryBookshelfInfoCell *)self setBadgeFrameColor:0];
    }
  }
  else
  {
    id v20 = +[UIApplication sharedApplication];
    BOOL v21 = [v20 userInterfaceLayoutDirection] == (id)1;

    [(BKLibraryBookshelfInfoBadge *)self->_badge setTextAlignment:2 * v21];
    [(BKLibraryBookshelfInfoCell *)self setBadgeFrameColor:0];
    [(BKLibraryBookshelfInfoCell *)self setBadgeBackgroundColor:0];
  }
  [(BKLibraryBookshelfInfoCell *)self setNeedsLayout];
}

- (int64_t)_bookshelfCloudState
{
  if ([(BKLibraryBookshelfInfoCell *)self infoKind] == 9
    || [(BKLibraryBookshelfInfoCell *)self infoKind] == 6
    || [(BKLibraryBookshelfInfoCell *)self isAssetDownloading])
  {
    return 0;
  }
  unsigned __int8 v5 = [(BKLibraryBookshelfInfoCell *)self libraryDownloadStatus];
  id v6 = v5;
  if (v5) {
    id v7 = [v5 state];
  }
  else {
    id v7 = 0;
  }
  unsigned __int8 v8 = [(BKLibraryAsset *)self->_libraryAsset isCloud];
  uint64_t v9 = 3;
  if (v7 != (id)10) {
    uint64_t v9 = 0;
  }
  if (v7 == (id)9) {
    uint64_t v9 = 2;
  }
  if (((v7 != (id)5) & v8) != 0) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = v9;
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100B1FF98 == a6 || off_100B1FFA0 == a6 || off_100B1FFA8 == a6)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100176044;
    v22[3] = &unk_100A43D60;
    v22[4] = self;
    double v15 = v22;
LABEL_21:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    goto LABEL_22;
  }
  if (off_100B1FF80 == a6)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001760A0;
    v21[3] = &unk_100A43D60;
    v21[4] = self;
    double v15 = v21;
    goto LABEL_21;
  }
  if (off_100B1FF88 == a6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001760AC;
    v20[3] = &unk_100A43D60;
    v20[4] = self;
    double v15 = v20;
    goto LABEL_21;
  }
  if (off_100B1FF90 == a6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001760B8;
    v19[3] = &unk_100A43D60;
    v19[4] = self;
    double v15 = v19;
    goto LABEL_21;
  }
  if (off_100B1FFB0 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001760C4;
    v18[3] = &unk_100A43D60;
    v18[4] = self;
    double v15 = v18;
    goto LABEL_21;
  }
  if (off_100B1FFB8 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001760D0;
    block[3] = &unk_100A43D60;
    void block[4] = self;
    double v15 = block;
    goto LABEL_21;
  }
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBookshelfInfoCell;
  [(BKLibraryBookshelfInfoCell *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_22:
}

- (void)reachabilityChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100176150;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setAudiobookStatus:(id)a3
{
  unsigned __int8 v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  if (self->_audiobookStatus != v5)
  {
    unsigned __int8 v8 = v5;
    unsigned int v7 = [(BKLibraryBookshelfInfoCell *)self infoKind];
    unsigned __int8 v5 = v8;
    if (!v8 || v7 == 10)
    {
      if (*p_audiobookStatus)
      {
        [(AEAssetAudiobookStatus *)*p_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1FFB0];
        [(AEAssetAudiobookStatus *)*p_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackTimeRemaining" context:off_100B1FFB8];
      }
      objc_storeStrong((id *)&self->_audiobookStatus, a3);
      if (*p_audiobookStatus)
      {
        [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" options:0 context:off_100B1FFB0];
        [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusTrackTimeRemaining" options:0 context:off_100B1FFB8];
      }
      [(BKLibraryBookshelfInfoCell *)self updateConfiguration:1];
      unsigned __int8 v5 = v8;
    }
  }
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryBookshelfInfoCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookshelfInfoCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)leftAlignedCloudIcon
{
  return self->_leftAlignedCloudIcon;
}

- (void)setLeftAlignedCloudIcon:(BOOL)a3
{
  self->_leftAlignedCloudIcon = a3;
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (NSNumber)bkaxAudiobookReadPercentage
{
  return self->_bkaxAudiobookReadPercentage;
}

- (void)setBkaxAudiobookReadPercentage:(id)a3
{
}

- (BCInsetsFittingButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (int)infoKind
{
  return self->_infoKind;
}

- (void)setInfoKind:(int)a3
{
  self->_infoKind = a3;
}

- (BKLibraryBookshelfInfoBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (UILabel)dateBadge
{
  return self->_dateBadge;
}

- (void)setDateBadge:(id)a3
{
}

- (CALayer)audiobookBadge
{
  return self->_audiobookBadge;
}

- (void)setAudiobookBadge:(id)a3
{
}

- (CGSize)audiobookBadgeSize
{
  double width = self->_audiobookBadgeSize.width;
  double height = self->_audiobookBadgeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAudiobookBadgeSize:(CGSize)a3
{
  self->_audiobookBadgeSize = a3;
}

- (BCInsetsFittingButton)cloudButton
{
  return self->_cloudButton;
}

- (void)setCloudButton:(id)a3
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

- (MPUNowPlayingIndicatorView)nowPlayingIndicator
{
  return self->_nowPlayingIndicator;
}

- (void)setNowPlayingIndicator:(id)a3
{
}

- (UIColor)badgeFrameColor
{
  return self->_badgeFrameColor;
}

- (void)setBadgeFrameColor:(id)a3
{
}

- (UIColor)badgeBackgroundColor
{
  return self->_badgeBackgroundColor;
}

- (void)setBadgeBackgroundColor:(id)a3
{
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (NSSet)seriesBooks
{
  return self->_seriesBooks;
}

- (void)setSeriesBooks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesBooks, 0);
  objc_storeStrong((id *)&self->_badgeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_badgeFrameColor, 0);
  objc_storeStrong((id *)&self->_nowPlayingIndicator, 0);
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_cloudButton, 0);
  objc_storeStrong((id *)&self->_audiobookBadge, 0);
  objc_storeStrong((id *)&self->_dateBadge, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_bkaxAudiobookReadPercentage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_libraryAsset, 0);
}

@end