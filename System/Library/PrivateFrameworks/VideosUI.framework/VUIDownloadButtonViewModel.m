@interface VUIDownloadButtonViewModel
+ (BOOL)shouldShowExpiredImageWithDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6;
+ (id)viewModelForSeasonDownloadWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 useShowCanonicalIdForSeasonDownload:(BOOL)a6;
+ (id)viewModelWithAssetController:(id)a3;
+ (id)viewModelWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 downloadType:(unint64_t)a6;
+ (id)viewModelWithMPMediaItem:(id)a3 seasonMediaItemCollection:(id)a4;
+ (id)viewModelWithMPMediaItemCollection:(id)a3;
+ (id)viewModelWithVideoManagedObject:(id)a3;
+ (id)viewModelWithVideosPlayable:(id)a3;
- (BOOL)allowsManualDownloadRenewal;
- (BOOL)downloadFailedDueToError;
- (BOOL)isExpired;
- (BOOL)isExpiringSoon;
- (BOOL)renewsOfflineKeysAutomatically;
- (BOOL)shouldUseShowCanonicalIdForSeasonDownload;
- (NSArray)downloadStateToString;
- (NSDate)availabilityEndDate;
- (NSDate)downloadExpirationDate;
- (NSNumber)locationPosition;
- (NSString)accessibilityIdentifier;
- (NSString)brandID;
- (NSString)brandName;
- (NSString)canonicalId;
- (NSString)downloadStateStringValue;
- (NSString)title;
- (VUIDownloadButtonViewModel)initWithAssetController:(id)a3;
- (VUIDownloadButtonViewModel)initWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 useShowCanonicalIdForSeason:(BOOL)a6 downloadType:(unint64_t)a7;
- (VUIDownloadButtonViewModel)initWithMPMediaItem:(id)a3 seasonMediaItemCollection:(id)a4;
- (VUIDownloadButtonViewModel)initWithMPMediaItemCollection:(id)a3;
- (VUIDownloadButtonViewModel)initWithVideoManagedObject:(id)a3;
- (VUIDownloadButtonViewModel)initWithVideosPlayable:(id)a3;
- (VUIMediaEntity)mediaEntity;
- (VUIMediaEntityAssetController)assetController;
- (VUIVideosPlayable)videosPlayable;
- (double)downloadProgress;
- (id)_createDownloadStateToStringArrayMap;
- (id)confirmationViewModel;
- (int64_t)episodeCount;
- (unint64_t)_downloadStateFromAssetsControllerStatus:(unint64_t)a3;
- (unint64_t)downloadState;
- (unint64_t)downloadType;
- (void)_assetControllerStateDidChange:(id)a3;
- (void)_downloadQueueManagerDidAddDownload:(id)a3;
- (void)_downloadQueueManagerDidRemoveDownload:(id)a3;
- (void)_initDownloadButtonStateForTVShowOrSeason;
- (void)_updateDownloadStateFromAssetControllerState:(id)a3;
- (void)dealloc;
- (void)deleteDownload;
- (void)fetchNewKeysForDownloadedVideo;
- (void)pauseDownload;
- (void)preflightPresentingViewController:(id)a3 completion:(id)a4;
- (void)resumeDownload;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAvailabilityEndDate:(id)a3;
- (void)setCanonicalId:(id)a3;
- (void)setConfirmationViewModel:(id)a3;
- (void)setDownloadExpirationDate:(id)a3;
- (void)setDownloadFailedDueToError:(BOOL)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setDownloadState:(unint64_t)a3;
- (void)setDownloadStateStringValue:(id)a3;
- (void)setDownloadStateToString:(id)a3;
- (void)setDownloadType:(unint64_t)a3;
- (void)setEpisodeCount:(int64_t)a3;
- (void)setLocationPosition:(id)a3;
- (void)setMediaEntity:(id)a3;
- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3;
- (void)setShouldUseShowCanonicalIdForSeasonDownload:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVideosPlayable:(id)a3;
- (void)startDownloadAllowingCellular:(BOOL)a3 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6;
- (void)stopDownload;
@end

@implementation VUIDownloadButtonViewModel

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (BOOL)isExpiringSoon
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  v3 = [(VUIDownloadButtonViewModel *)self downloadExpirationDate];
  LOBYTE(v2) = [v2 shouldShowLabelForDownloadExpirationDate:v3];

  return (char)v2;
}

- (BOOL)isExpired
{
  v3 = [(VUIDownloadButtonViewModel *)self downloadExpirationDate];
  if (v3)
  {
    v4 = [(VUIDownloadButtonViewModel *)self downloadExpirationDate];
    char v5 = objc_msgSend(v4, "vui_isInThePast");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldShowExpiredImageWithDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  switch(a3)
  {
    case 0uLL:
      return a4 || a6;
    case 4uLL:
      return a4 || a5;
    case 3uLL:
      return a4 || a6;
  }
  return 0;
}

- (void)_assetControllerStateDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 object];
  v6 = [v4 userInfo];

  v7 = [v6 objectForKey:@"VUIMediaEntityAssetControllerStateKey"];

  v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = VUIMediaEntityAssetControllerStatusLogString([v7 status]);
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "Asset controller %@ state changed to: %@", (uint8_t *)&v10, 0x16u);
  }
  [(VUIDownloadButtonViewModel *)self _updateDownloadStateFromAssetControllerState:v7];
}

- (void)setDownloadStateToString:(id)a3
{
}

- (void)setAssetController:(id)a3
{
  char v5 = (VUIMediaEntityAssetController *)a3;
  if (self->_assetController != v5)
  {
    v9 = v5;
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:0];

    objc_storeStrong((id *)&self->_assetController, a3);
    if (v9)
    {
      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:self selector:sel__assetControllerStateDidChange_ name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:v9];

      v8 = [(VUIMediaEntityAssetController *)v9 state];
      [(VUIDownloadButtonViewModel *)self _updateDownloadStateFromAssetControllerState:v8];
    }
    else
    {
      [(VUIDownloadButtonViewModel *)self setDownloadState:0];
    }
    char v5 = v9;
  }
}

- (id)_createDownloadStateToStringArrayMap
{
  return &unk_1F3F3E480;
}

- (void)_updateDownloadStateFromAssetControllerState:(id)a3
{
  id v23 = a3;
  unint64_t v4 = -[VUIDownloadButtonViewModel _downloadStateFromAssetsControllerStatus:](self, "_downloadStateFromAssetsControllerStatus:", [v23 status]);
  [v23 downloadProgress];
  if (v4 == 5 || v4 == 2)
  {
    double v7 = v5;
    [(VUIDownloadButtonViewModel *)self downloadProgress];
    double v9 = v8;
    [(VUIDownloadButtonViewModel *)self setDownloadProgress:v7];
    if (v9 != v7)
    {
      int v10 = [v23 downloadExpirationDate];
      [(VUIDownloadButtonViewModel *)self setDownloadExpirationDate:v10];

LABEL_9:
      -[VUIDownloadButtonViewModel setRenewsOfflineKeysAutomatically:](self, "setRenewsOfflineKeysAutomatically:", [v23 renewsOfflineKeysAutomatically]);
LABEL_10:
      uint64_t v14 = [v23 availabilityEndDate];
      [(VUIDownloadButtonViewModel *)self setAvailabilityEndDate:v14];

LABEL_11:
      int v15 = 1;
      goto LABEL_12;
    }
  }
  v11 = [(VUIDownloadButtonViewModel *)self downloadExpirationDate];
  __int16 v12 = [v23 downloadExpirationDate];

  v13 = [v23 downloadExpirationDate];
  [(VUIDownloadButtonViewModel *)self setDownloadExpirationDate:v13];

  if (v11 != v12) {
    goto LABEL_9;
  }
  int v17 = [(VUIDownloadButtonViewModel *)self renewsOfflineKeysAutomatically];
  int v18 = [v23 renewsOfflineKeysAutomatically];
  -[VUIDownloadButtonViewModel setRenewsOfflineKeysAutomatically:](self, "setRenewsOfflineKeysAutomatically:", [v23 renewsOfflineKeysAutomatically]);
  if (v17 != v18) {
    goto LABEL_10;
  }
  v19 = [(VUIDownloadButtonViewModel *)self availabilityEndDate];
  v20 = [v23 availabilityEndDate];

  v21 = [v23 availabilityEndDate];
  [(VUIDownloadButtonViewModel *)self setAvailabilityEndDate:v21];

  if (v19 != v20) {
    goto LABEL_11;
  }
  BOOL v22 = [(VUIDownloadButtonViewModel *)self downloadFailedDueToError];
  int v15 = v22 ^ [v23 downloadFailedDueToError];
LABEL_12:
  -[VUIDownloadButtonViewModel setDownloadFailedDueToError:](self, "setDownloadFailedDueToError:", [v23 downloadFailedDueToError]);
  if ([(VUIDownloadButtonViewModel *)self downloadState] == v4)
  {
    if (v15)
    {
      [(VUIDownloadButtonViewModel *)self setDownloadState:v4];
      if (_os_feature_enabled_impl())
      {
        v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v16 postNotificationName:@"VUIDownloadViewModelDownloadStateDidChangeNotification" object:self];
      }
    }
  }
  else
  {
    [(VUIDownloadButtonViewModel *)self setDownloadState:v4];
  }
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (NSDate)downloadExpirationDate
{
  return self->_downloadExpirationDate;
}

- (BOOL)downloadFailedDueToError
{
  return self->_downloadFailedDueToError;
}

- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3
{
  self->_renewsOfflineKeysAutomatically = a3;
}

- (void)setDownloadFailedDueToError:(BOOL)a3
{
  self->_downloadFailedDueToError = a3;
}

- (void)setDownloadExpirationDate:(id)a3
{
}

- (void)setAvailabilityEndDate:(id)a3
{
}

- (BOOL)renewsOfflineKeysAutomatically
{
  return self->_renewsOfflineKeysAutomatically;
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (unint64_t)_downloadStateFromAssetsControllerStatus:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)viewModelWithVideosPlayable:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[VUIDownloadButtonViewModel alloc] initWithVideosPlayable:v3];

  return v4;
}

- (VUIDownloadButtonViewModel)initWithVideosPlayable:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIDownloadButtonViewModel;
  double v5 = [(VUIDownloadButtonViewModel *)&v16 init];
  if (v5
    && ([v4 adamID],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    [(VUIDownloadButtonViewModel *)v5 setVideosPlayable:v4];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    __int16 v12 = __53__VUIDownloadButtonViewModel_initWithVideosPlayable___block_invoke;
    v13 = &unk_1E6DF3F68;
    uint64_t v14 = (VUIDownloadButtonViewModel *)v4;
    double v8 = v5;
    int v15 = v8;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v11, 3221225472)) {
      v12((uint64_t)&v11);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], &v11);
    }
    double v9 = [(VUIDownloadButtonViewModel *)v8 _createDownloadStateToStringArrayMap];
    [(VUIDownloadButtonViewModel *)v8 setDownloadStateToString:v9];

    double v5 = v14;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

void __53__VUIDownloadButtonViewModel_initWithVideosPlayable___block_invoke(uint64_t a1)
{
  v2 = [[VUIUniversalAssetController alloc] initWithVideosPlayable:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setAssetController:v2];
}

+ (id)viewModelWithAssetController:(id)a3
{
  id v3 = a3;
  id v4 = [[VUIDownloadButtonViewModel alloc] initWithAssetController:v3];

  return v4;
}

+ (id)viewModelWithMPMediaItem:(id)a3 seasonMediaItemCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[VUIDownloadButtonViewModel alloc] initWithMPMediaItem:v6 seasonMediaItemCollection:v5];

  return v7;
}

+ (id)viewModelWithVideoManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = [[VUIDownloadButtonViewModel alloc] initWithVideoManagedObject:v3];

  return v4;
}

+ (id)viewModelWithMPMediaItemCollection:(id)a3
{
  id v3 = a3;
  id v4 = [[VUIDownloadButtonViewModel alloc] initWithMPMediaItemCollection:v3];

  return v4;
}

- (VUIDownloadButtonViewModel)initWithAssetController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadButtonViewModel;
  id v5 = [(VUIDownloadButtonViewModel *)&v9 init];
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      [(VUIDownloadButtonViewModel *)v5 setAssetController:v4];
      uint64_t v7 = [(VUIDownloadButtonViewModel *)v6 _createDownloadStateToStringArrayMap];
      [(VUIDownloadButtonViewModel *)v6 setDownloadStateToString:v7];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = v5;
    id v6 = 0;
  }

  return v6;
}

- (VUIDownloadButtonViewModel)initWithMPMediaItem:(id)a3 seasonMediaItemCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VUIDownloadButtonViewModel;
  double v8 = [(VUIDownloadButtonViewModel *)&v16 init];
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v11 = __76__VUIDownloadButtonViewModel_initWithMPMediaItem_seasonMediaItemCollection___block_invoke;
    __int16 v12 = &unk_1E6DF45D8;
    id v13 = v6;
    id v14 = v7;
    int v15 = v8;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v11((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  return v8;
}

void __76__VUIDownloadButtonViewModel_initWithMPMediaItem_seasonMediaItemCollection___block_invoke(uint64_t a1)
{
  id v4 = [[VUIUniversalAssetController alloc] initWithMPMediaItem:*(void *)(a1 + 32)];
  [(VUIUniversalAssetController *)v4 setMpMediaItemCollection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAssetController:v4];
  v2 = *(void **)(a1 + 48);
  id v3 = [v2 _createDownloadStateToStringArrayMap];
  [v2 setDownloadStateToString:v3];
}

- (VUIDownloadButtonViewModel)initWithVideoManagedObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadButtonViewModel;
  id v5 = [(VUIDownloadButtonViewModel *)&v12 init];
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    double v8 = __57__VUIDownloadButtonViewModel_initWithVideoManagedObject___block_invoke;
    objc_super v9 = &unk_1E6DF3F68;
    id v10 = v4;
    uint64_t v11 = v5;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, 3221225472)) {
      v8((uint64_t)&v7);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], &v7);
    }
  }
  return v5;
}

void __57__VUIDownloadButtonViewModel_initWithVideoManagedObject___block_invoke(uint64_t a1)
{
  id v4 = [[VUIUniversalAssetController alloc] initWithVideoManagedObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setAssetController:v4];
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 _createDownloadStateToStringArrayMap];
  [v2 setDownloadStateToString:v3];
}

- (VUIDownloadButtonViewModel)initWithMPMediaItemCollection:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadButtonViewModel;
  id v5 = [(VUIDownloadButtonViewModel *)&v12 init];
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    double v8 = __60__VUIDownloadButtonViewModel_initWithMPMediaItemCollection___block_invoke;
    objc_super v9 = &unk_1E6DF3F68;
    id v10 = v4;
    uint64_t v11 = v5;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7, 3221225472)) {
      v8((uint64_t)&v7);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], &v7);
    }
  }
  return v5;
}

void __60__VUIDownloadButtonViewModel_initWithMPMediaItemCollection___block_invoke(uint64_t a1)
{
  id v4 = [[VUIUniversalCollectionAssetController alloc] initWithMediaItemCollection:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setAssetController:v4];
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 _createDownloadStateToStringArrayMap];
  [v2 setDownloadStateToString:v3];
}

+ (id)viewModelWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 downloadType:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[VUIDownloadButtonViewModel alloc] initWithCanonicalId:v10 title:v9 episodeCount:a5 useShowCanonicalIdForSeason:0 downloadType:a6];

  return v11;
}

+ (id)viewModelForSeasonDownloadWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 useShowCanonicalIdForSeasonDownload:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[VUIDownloadButtonViewModel alloc] initWithCanonicalId:v10 title:v9 episodeCount:a5 useShowCanonicalIdForSeason:v6 downloadType:2];

  return v11;
}

- (VUIDownloadButtonViewModel)initWithCanonicalId:(id)a3 title:(id)a4 episodeCount:(int64_t)a5 useShowCanonicalIdForSeason:(BOOL)a6 downloadType:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VUIDownloadButtonViewModel;
  id v14 = [(VUIDownloadButtonViewModel *)&v26 init];
  int v15 = v14;
  if (v14)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    int v18 = __110__VUIDownloadButtonViewModel_initWithCanonicalId_title_episodeCount_useShowCanonicalIdForSeason_downloadType___block_invoke;
    v19 = &unk_1E6DFB2A8;
    v20 = v14;
    id v21 = v12;
    id v22 = v13;
    int64_t v23 = a5;
    unint64_t v24 = a7;
    BOOL v25 = a6;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v17, 3221225472)) {
      v18((uint64_t)&v17);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], &v17);
    }
  }
  return v15;
}

void __110__VUIDownloadButtonViewModel_initWithCanonicalId_title_episodeCount_useShowCanonicalIdForSeason_downloadType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanonicalId:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setEpisodeCount:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setDownloadType:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setShouldUseShowCanonicalIdForSeasonDownload:*(unsigned __int8 *)(a1 + 72)];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _createDownloadStateToStringArrayMap];
  [v2 setDownloadStateToString:v3];

  if ((unint64_t)(*(void *)(a1 + 64) - 1) <= 1) {
    [*(id *)(a1 + 32) _initDownloadButtonStateForTVShowOrSeason];
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__downloadQueueManagerDidAddDownload_ name:@"VUIDownloadQueueManagerDidAddDownloads" object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__downloadQueueManagerDidRemoveDownload_ name:@"VUIDownloadQueueManagerDidRemoveDownloads" object:0];
}

- (void)_initDownloadButtonStateForTVShowOrSeason
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = +[VUIMediaLibraryManager defaultManager];
  id v5 = [v4 sidebandMediaLibrary];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3D328, &unk_1F3F3D340, &unk_1F3F3D358, &unk_1F3F3D370, 0);
  unint64_t downloadType = self->_downloadType;
  int64_t v23 = (void *)v6;
  if (downloadType != 1)
  {
    if (downloadType != 2)
    {
      uint64_t v11 = 0;
      id v9 = 0;
      goto LABEL_12;
    }
    if (!self->_shouldUseShowCanonicalIdForSeasonDownload)
    {
      double v8 = [(VUIDownloadButtonViewModel *)self canonicalId];
      if (v8)
      {
        id v9 = [v5 episodesWithDownloadStates:v6 seasonCanonicalId:v8 usingMainThreadContext:1];
        uint64_t v10 = [v5 countOfComingSoonVideosWithSeasonCanonicalId:v8];
        goto LABEL_6;
      }
LABEL_10:
      uint64_t v11 = 0;
      id v9 = 0;
      goto LABEL_11;
    }
  }
  double v8 = [(VUIDownloadButtonViewModel *)self canonicalId];
  if (!v8) {
    goto LABEL_10;
  }
  id v9 = [v5 episodesWithDownloadStates:v6 showCanonicalId:v8 usingMainThreadContext:1];
  uint64_t v10 = [v5 countOfComingSoonVideosWithShowCanonicalId:v8];
LABEL_6:
  uint64_t v11 = v10;
LABEL_11:

LABEL_12:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [[VUIUniversalAssetController alloc] initWithVideoManagedObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v3 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  int64_t v18 = self->_episodeCount - v11;
  BOOL v19 = self->_downloadType == 2;
  v20 = [VUIUniversalCollectionAssetController alloc];
  id v21 = (void *)[v3 copy];
  id v22 = [(VUIUniversalCollectionAssetController *)v20 initWithAssetControllers:v21 completionCount:v18 showDownloadingOnlyWhenWholeCollectionDownloads:v19];

  [(VUIDownloadButtonViewModel *)self setAssetController:v22];
}

- (void)_downloadQueueManagerDidAddDownload:(id)a3
{
  id v17 = [a3 userInfo];
  id v4 = [v17 objectForKeyedSubscript:@"VUIDownloadQueueDidAddDownloadsAssetControllersKey"];
  id v5 = [v17 objectForKeyedSubscript:@"VUIDownloadQueueDidAddDownloadsCompletionCountKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    unint64_t downloadType = self->_downloadType;
    if (downloadType == 2)
    {
      double v8 = [(VUIDownloadButtonViewModel *)self canonicalId];
      if (self->_shouldUseShowCanonicalIdForSeasonDownload) {
        [v6 showCanonicalId];
      }
      else {
      id v9 = [v6 seasonCanonicalId];
      }
      int v11 = [v8 isEqualToString:v9];
      int v10 = 0;
    }
    else
    {
      if (downloadType != 1)
      {
        int v11 = 0;
        int v10 = 0;
LABEL_12:
        if (v11) {
          goto LABEL_13;
        }
LABEL_23:

        goto LABEL_24;
      }
      double v8 = [(VUIDownloadButtonViewModel *)self canonicalId];
      id v9 = [v6 showCanonicalId];
      int v10 = [v9 isEqualToString:v8];
      int v11 = 0;
    }

    if (v10)
    {
LABEL_13:
      id v12 = [(VUIDownloadButtonViewModel *)self assetController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        if (v5)
        {
          if (v11)
          {
            objc_msgSend(v13, "setCompletionCount:", objc_msgSend(v5, "integerValue"));
          }
          else if (v10)
          {
            uint64_t v14 = [(VUIDownloadButtonViewModel *)self canonicalId];
            if (v14)
            {
              uint64_t v15 = +[VUIMediaLibraryManager defaultManager];
              objc_super v16 = [v15 sidebandMediaLibrary];

              objc_msgSend(v13, "setCompletionCount:", self->_episodeCount - objc_msgSend(v16, "countOfComingSoonVideosWithShowCanonicalId:", v14));
            }
          }
        }
        [v13 addAssetControllers:v4];
      }
      goto LABEL_23;
    }
    goto LABEL_12;
  }
LABEL_24:
}

- (void)_downloadQueueManagerDidRemoveDownload:(id)a3
{
  id v14 = [a3 userInfo];
  id v4 = [v14 objectForKeyedSubscript:@"VUIDownloadQueueDidRemoveDownloadsAssetControllersKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t downloadType = self->_downloadType;
      if (downloadType == 2)
      {
        int v10 = [(VUIDownloadButtonViewModel *)self canonicalId];
        if (self->_shouldUseShowCanonicalIdForSeasonDownload) {
          [v5 showCanonicalId];
        }
        else {
        int v11 = [v5 seasonCanonicalId];
        }
        int v12 = [v10 isEqualToString:v11];

        if (!v12) {
          goto LABEL_14;
        }
      }
      else
      {
        if (downloadType != 1) {
          goto LABEL_14;
        }
        uint64_t v7 = [(VUIDownloadButtonViewModel *)self canonicalId];
        double v8 = [v5 showCanonicalId];
        char v9 = [v8 isEqualToString:v7];

        if ((v9 & 1) == 0) {
          goto LABEL_14;
        }
      }
      id v13 = [(VUIDownloadButtonViewModel *)self assetController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 removeAssetControllers:v4];
      }
    }
LABEL_14:
  }
}

- (void)dealloc
{
  [(VUIDownloadButtonViewModel *)self setAssetController:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadButtonViewModel;
  [(VUIDownloadButtonViewModel *)&v4 dealloc];
}

- (NSString)brandName
{
  id v3 = [(VUIDownloadButtonViewModel *)self assetController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VUIDownloadButtonViewModel *)self assetController];
    uint64_t v6 = [v5 brandName];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)brandID
{
  id v3 = [(VUIDownloadButtonViewModel *)self assetController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VUIDownloadButtonViewModel *)self assetController];
    uint64_t v6 = [v5 brandID];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)allowsManualDownloadRenewal
{
  id v3 = [(VUIDownloadButtonViewModel *)self assetController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(VUIDownloadButtonViewModel *)self assetController];
  char v6 = [v5 allowsManualDownloadRenewal];

  return v6;
}

- (void)startDownloadAllowingCellular:(BOOL)a3 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = [(VUIDownloadButtonViewModel *)self downloadState];
  if (v11 == 2)
  {
    int v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "The item is either already downloaded or being downloaded.", buf, 2u);
    }
  }
  else
  {
    unint64_t v13 = v11;
    id v14 = [(VUIDownloadButtonViewModel *)self assetController];
    int v12 = v14;
    if (v13 == 4 && ![v14 supportsRedownloadingContent])
    {
      objc_super v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "The item is already downloaded and does not support redownloading.", buf, 2u);
      }
    }
    else
    {
      [v12 startDownloadAllowingCellular:v9 quality:a5 shouldMarkAsDeletedOnCancellationOrFailure:v8 prefer3DOrImmersiveDownload:v6 completion:0];
      uint64_t v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v12;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_INFO, "Asset controller %@ starting download.", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      int64_t v18 = __139__VUIDownloadButtonViewModel_startDownloadAllowingCellular_shouldMarkAsDeletedOnCancellationOrFailure_quality_prefer3DOrImmersiveDownload___block_invoke;
      BOOL v19 = &unk_1E6DF3D58;
      v20 = self;
      if ([MEMORY[0x1E4F29060] isMainThread]) {
        v18((uint64_t)block);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
}

uint64_t __139__VUIDownloadButtonViewModel_startDownloadAllowingCellular_shouldMarkAsDeletedOnCancellationOrFailure_quality_prefer3DOrImmersiveDownload___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v6 = @"VUIDownloadModelNotificationUserInfo";
  v7[0] = v3;
  char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"VUIDownloadDidStartNotification" object:0 userInfo:v4];

  return +[VideosUI pushDownloadDidStartSignal];
}

- (void)fetchNewKeysForDownloadedVideo
{
  if ([(VUIDownloadButtonViewModel *)self downloadState] == 4)
  {
    id v4 = [(VUIDownloadButtonViewModel *)self assetController];
    [v4 fetchNewKeysForDownloadedVideo];
  }
  else
  {
    uint64_t v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Unable to fetch new keys because video is not in state Downloaded.", buf, 2u);
    }
  }
}

- (void)pauseDownload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIDownloadButtonViewModel *)self assetController];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ pausing download.", (uint8_t *)&v4, 0xCu);
  }

  [v2 pauseDownload];
}

- (void)resumeDownload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIDownloadButtonViewModel *)self assetController];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ resuming download.", (uint8_t *)&v4, 0xCu);
  }

  [v2 resumeDownload];
}

- (void)stopDownload
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIDownloadButtonViewModel *)self assetController];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ canceling download.", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [v2 state];
  int v5 = [v4 performsKeyFetchOnly];

  if (v5) {
    [v2 cancelKeyFetch];
  }
  else {
    [v2 cancelAndRemoveDownload];
  }
}

- (void)deleteDownload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [(VUIDownloadButtonViewModel *)self assetController];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    int v5 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ deleting download.", (uint8_t *)&v4, 0xCu);
  }

  [v2 cancelAndRemoveDownload];
}

- (void)preflightPresentingViewController:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 && v6)
  {
    uint64_t v7 = [(VUIDownloadButtonViewModel *)self assetController];
    uint64_t v8 = [(VUIDownloadButtonViewModel *)self videosPlayable];

    if (v8)
    {
      BOOL v9 = +[VUIDownloadManager sharedInstance];
      int v10 = [(VUIDownloadButtonViewModel *)self videosPlayable];
      objc_msgSend(v9, "preflightDownloadForVideosPlayable:presentingViewController:contentAllowsCellularDownload:completion:", v10, v14, objc_msgSend(v7, "contentAllowsCellularDownload"), v6);
    }
    else
    {
      unint64_t v11 = [(VUIDownloadButtonViewModel *)self assetController];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        unint64_t v13 = [(VUIDownloadButtonViewModel *)self assetController];
        BOOL v9 = [v13 contentRating];
      }
      else
      {
        BOOL v9 = 0;
      }
      int v10 = +[VUIDownloadManager sharedInstance];
      objc_msgSend(v10, "preflightDownloadForContentRating:presentingViewController:contentAllowsCellularDownload:completion:", v9, v14, objc_msgSend(v7, "contentAllowsCellularDownload"), v6);
    }
  }
}

- (NSString)downloadStateStringValue
{
  if ([(NSArray *)self->_downloadStateToString count] <= self->_downloadState)
  {
    uint64_t v3 = @"Unknown";
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_downloadStateToString, "objectAtIndexedSubscript:");
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(unint64_t)a3
{
  self->_unint64_t downloadType = a3;
}

- (id)confirmationViewModel
{
  return self->_confirmationViewModel;
}

- (void)setConfirmationViewModel:(id)a3
{
}

- (NSNumber)locationPosition
{
  return self->_locationPosition;
}

- (void)setLocationPosition:(id)a3
{
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (void)setVideosPlayable:(id)a3
{
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
}

- (void)setDownloadState:(unint64_t)a3
{
  self->_downloadState = a3;
}

- (void)setDownloadStateStringValue:(id)a3
{
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (VUIMediaEntityAssetController)assetController
{
  return self->_assetController;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSArray)downloadStateToString
{
  return self->_downloadStateToString;
}

- (int64_t)episodeCount
{
  return self->_episodeCount;
}

- (void)setEpisodeCount:(int64_t)a3
{
  self->_episodeCount = a3;
}

- (BOOL)shouldUseShowCanonicalIdForSeasonDownload
{
  return self->_shouldUseShowCanonicalIdForSeasonDownload;
}

- (void)setShouldUseShowCanonicalIdForSeasonDownload:(BOOL)a3
{
  self->_shouldUseShowCanonicalIdForSeasonDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStateToString, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_downloadExpirationDate, 0);
  objc_storeStrong((id *)&self->_downloadStateStringValue, 0);
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_locationPosition, 0);
  objc_storeStrong(&self->_confirmationViewModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end