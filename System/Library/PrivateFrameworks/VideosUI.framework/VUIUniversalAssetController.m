@interface VUIUniversalAssetController
- (BOOL)_isVideoFullyDownloadedCheckingSidebandLibrary:(BOOL)a3;
- (BOOL)allowsManualDownloadRenewal;
- (BOOL)contentAllowsCellularDownload;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPurchasedRentedOrSynced;
- (BOOL)supportsRedownloadingContent;
- (BOOL)supportsStartingDownload;
- (MPMediaItem)mpMediaItem;
- (MPMediaItemCollection)mpMediaItemCollection;
- (MPStoreDownload)storeDownload;
- (NSString)brandID;
- (NSString)brandName;
- (NSString)description;
- (OS_dispatch_queue)completionDispatchQueueInternal;
- (TVPDownload)download;
- (VUIContentRating)contentRating;
- (VUIMediaEntityAssetControllerState)stateInternal;
- (VUIUniversalAssetController)initWithMPMediaItem:(id)a3;
- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3;
- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3 mpMediaItem:(id)a4 videosPlayable:(id)a5;
- (VUIUniversalAssetController)initWithVideosPlayable:(id)a3;
- (VUIVideoManagedObject)videoManagedObject;
- (VUIVideosPlayable)videosPlayable;
- (id)_adamIDString;
- (id)_createAndSaveVideoManagedObjectForMPMediaItem:(id)a3;
- (id)_createAndSaveVideoManagedObjectForPlayable:(id)a3;
- (id)seasonCanonicalId;
- (id)showCanonicalId;
- (unint64_t)hash;
- (void)_createAndSaveVideoManagedObjectForDownloadInitiationAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6;
- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3;
- (void)_updateDownloadStateAndNotifyListeners;
- (void)_updateObservedDownload;
- (void)_videoManagedObjectPlaybackExpirationDidChange:(id)a3;
- (void)_videoManagedObjectWasCreated:(id)a3;
- (void)cancelAndRemoveDownload;
- (void)cancelKeyFetch;
- (void)dealloc;
- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6;
- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5;
- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4;
- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)fetchNewKeysForDownloadedVideo;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseDownload;
- (void)resumeDownload;
- (void)setCompletionDispatchQueue:(id)a3;
- (void)setCompletionDispatchQueueInternal:(id)a3;
- (void)setDownload:(id)a3;
- (void)setMpMediaItem:(id)a3;
- (void)setMpMediaItemCollection:(id)a3;
- (void)setStateInternal:(id)a3;
- (void)setStoreDownload:(id)a3;
- (void)setVideoManagedObject:(id)a3;
- (void)setVideosPlayable:(id)a3;
- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7;
@end

@implementation VUIUniversalAssetController

- (VUIMediaEntityAssetControllerState)stateInternal
{
  return self->_stateInternal;
}

- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3 mpMediaItem:(id)a4 videosPlayable:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VUIUniversalAssetController;
  v11 = [(VUIUniversalAssetController *)&v31 init];
  if (v11)
  {
    if (v8)
    {
      v12 = +[VUIMediaLibraryManager defaultManager];
      v13 = [v12 sidebandMediaLibrary];
      uint64_t v14 = [v13 mainContextVideoForVideo:v8];

      id v8 = (id)v14;
    }
    objc_storeStrong((id *)&v11->_videoManagedObject, v8);
    objc_storeStrong((id *)&v11->_mpMediaItem, a4);
    objc_storeStrong((id *)&v11->_videosPlayable, a5);
    objc_storeStrong((id *)&v11->_completionDispatchQueueInternal, MEMORY[0x1E4F14428]);
    v15 = objc_alloc_init(VUIMediaEntityAssetControllerState);
    stateInternal = v11->_stateInternal;
    v11->_stateInternal = v15;

    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setStatus:0];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setDownloadProgress:-1.0];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setSupportsCancellation:1];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setSupportsPausing:1];
    videoManagedObject = v11->_videoManagedObject;
    if (videoManagedObject)
    {
      [(VUIVideoManagedObject *)videoManagedObject addObserver:v11 forKeyPath:@"downloadState" options:0 context:__VideoManagedObjectDownloadStateKVOContext];
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v19 = [(VUIVideoManagedObject *)v11->_videoManagedObject objectID];
      [v18 addObserver:v11 selector:sel__videoManagedObjectPlaybackExpirationDidChange_ name:@"VUIVideoManagedObjectPlaybackExpirationDidChangeNotification" object:v19];
    }
    if (v9)
    {
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v21 = *MEMORY[0x1E4F31558];
      v22 = [v9 mediaLibrary];
      [v20 addObserver:v11 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:v21 object:v22];

      v23 = [MEMORY[0x1E4F31A50] sharedManager];
      [v23 addObserver:v11 forDownloads:0];

      v24 = [MEMORY[0x1E4F31A50] sharedManager];
      v25 = [v24 downloadForMediaItem:v9];

      if (v25)
      {
        v26 = VUIDefaultLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v11;
          __int16 v34 = 2112;
          v35 = v25;
          _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to: %@", buf, 0x16u);
        }

        objc_storeStrong((id *)&v11->_storeDownload, v25);
      }
    }
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v11 selector:sel__videoManagedObjectWasCreated_ name:@"VUIUniversalAssetControllerDidCreateVideoManagedObject" object:0];

    v28 = +[VUIDownloadManager sharedInstance];
    [v28 addDelegate:v11];

    [(VUIUniversalAssetController *)v11 _updateObservedDownload];
    [(VUIUniversalAssetController *)v11 _updateDownloadStateAndNotifyListeners];
    v29 = VUIDefaultLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "%@ created ", buf, 0xCu);
    }
  }
  return v11;
}

- (void)_updateObservedDownload
{
  id v7 = [(VUIUniversalAssetController *)self videoManagedObject];
  v3 = [(VUIUniversalAssetController *)self download];
  v4 = [v7 adamID];
  v5 = +[VUIDownloadManager sharedInstance];
  v6 = [v5 existingDownloadForAdamID:v4];

  if (v6 != v3)
  {
    [v6 addDelegate:self];
    [v3 removeDelegate:self];
    [(VUIUniversalAssetController *)self setDownload:v6];
  }
}

- (void)_updateDownloadStateAndNotifyListeners
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIUniversalAssetController *)self videoManagedObject];
  queue = [(VUIUniversalAssetController *)self completionDispatchQueueInternal];
  v4 = [(VUIUniversalAssetController *)self download];
  if ([(VUIUniversalAssetController *)self _isVideoFullyDownloadedCheckingSidebandLibrary:1])
  {
    v5 = [(VUIUniversalAssetController *)self storeDownload];

    if (v5)
    {
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = self;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to nil", buf, 0xCu);
      }

      [(VUIUniversalAssetController *)self setStoreDownload:0];
    }
    uint64_t v7 = 4;
    if (v3) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    double v8 = -1.0;
    goto LABEL_15;
  }
  uint64_t v7 = 0;
  if (!v3) {
    goto LABEL_10;
  }
LABEL_7:
  if ([v3 downloadState] == 2)
  {
    double v8 = -1.0;
    uint64_t v7 = 4;
  }
  else if ([v3 downloadState] == 3)
  {
    uint64_t v7 = 5;
    double v8 = 0.0;
  }
  else
  {
    double v8 = -1.0;
  }
  v13 = [v3 expirationDate];
  v12 = [v3 offlineKeyRenewalPolicy];
  v11 = [v3 availabilityEndDate];
  uint64_t v10 = [v3 allowsCellular];
  uint64_t v9 = [v3 downloadFailedDueToError];
LABEL_15:
  if (v7 == 4) {
    goto LABEL_16;
  }
  if (!v4)
  {
    v17 = [(VUIUniversalAssetController *)self storeDownload];

    if (!v17) {
      goto LABEL_16;
    }
    v18 = [(VUIUniversalAssetController *)self storeDownload];
    [v18 percentComplete];
    double v8 = v19;

    v20 = [(VUIUniversalAssetController *)self storeDownload];
    uint64_t v21 = [v20 phaseIdentifier];

    v33 = v21;
    if (([v21 isEqualToString:*MEMORY[0x1E4F317D0]] & 1) != 0
      || ([v21 isEqualToString:*MEMORY[0x1E4F317F8]] & 1) != 0
      || ([v21 isEqualToString:*MEMORY[0x1E4F31800]] & 1) != 0
      || [v21 isEqualToString:*MEMORY[0x1E4F317E8]])
    {
      uint64_t v22 = 1;
      if (v8 > 0.00000011920929) {
        uint64_t v22 = 2;
      }
    }
    else
    {
      if ([v21 isEqualToString:*MEMORY[0x1E4F317D8]])
      {
        uint64_t v31 = 0;
        uint64_t v9 = 1;
        goto LABEL_33;
      }
      if ([v21 isEqualToString:*MEMORY[0x1E4F317C8]])
      {
        uint64_t v31 = 0;
        goto LABEL_33;
      }
      if ([v21 isEqualToString:*MEMORY[0x1E4F317E0]])
      {
        v32 = [(VUIUniversalAssetController *)self storeDownload];
        v26 = [v32 failureError];
        v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          v30 = [(VUIUniversalAssetController *)self storeDownload];
          id v28 = [v30 purchaseError];
        }
        uint64_t v31 = 4 * (v28 == 0);
        if (v28) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v9;
        }

        goto LABEL_33;
      }
      int v29 = [v21 isEqualToString:*MEMORY[0x1E4F317F0]];
      uint64_t v22 = 3;
      if (!v29) {
        uint64_t v22 = 1;
      }
    }
    uint64_t v31 = v22;
LABEL_33:
    v23 = [(VUIUniversalAssetController *)self storeDownload];
    int v24 = [v23 isCanceled];

    if (v24) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v31;
    }

    goto LABEL_16;
  }
  switch([v4 state])
  {
    case 0:
    case 4:
    case 5:
      uint64_t v7 = 0;
      break;
    case 1:
      [v4 progress];
      double v8 = v25;
      uint64_t v7 = 2;
      break;
    case 2:
      uint64_t v7 = 3;
      break;
    case 3:
      uint64_t v7 = 4;
      break;
    case 6:
      uint64_t v7 = 1;
      break;
    default:
      break;
  }
LABEL_16:
  uint64_t v14 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  [(VUIMediaEntityAssetControllerState *)v14 setStatus:v7];
  [(VUIMediaEntityAssetControllerState *)v14 setDownloadProgress:v8];
  [(VUIMediaEntityAssetControllerState *)v14 setDownloadFailedDueToError:v9];
  [(VUIMediaEntityAssetControllerState *)v14 setSupportsCancellation:1];
  [(VUIMediaEntityAssetControllerState *)v14 setSupportsPausing:1];
  [(VUIMediaEntityAssetControllerState *)v14 setDownloadExpirationDate:v13];
  -[VUIMediaEntityAssetControllerState setRenewsOfflineKeysAutomatically:](v14, "setRenewsOfflineKeysAutomatically:", [v12 integerValue] == 1);
  [(VUIMediaEntityAssetControllerState *)v14 setAvailabilityEndDate:v11];
  [(VUIMediaEntityAssetControllerState *)v14 setAllowsCellular:v10];
  if (v4) {
    -[VUIMediaEntityAssetControllerState setPerformsKeyFetchOnly:](v14, "setPerformsKeyFetchOnly:", [v4 performKeyFetchOnly]);
  }
  [(VUIUniversalAssetController *)self setStateInternal:v14];
  if (v14)
  {
    v38 = @"VUIMediaEntityAssetControllerStateKey";
    v39 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  }
  else
  {
    v15 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VUIUniversalAssetController__updateDownloadStateAndNotifyListeners__block_invoke;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v37, (id *)buf);
  id v36 = v15;
  id v16 = v15;
  dispatch_async(queue, block);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
}

- (VUIVideoManagedObject)videoManagedObject
{
  return self->_videoManagedObject;
}

- (TVPDownload)download
{
  return self->_download;
}

- (MPStoreDownload)storeDownload
{
  return self->_storeDownload;
}

- (void)setStateInternal:(id)a3
{
}

- (OS_dispatch_queue)completionDispatchQueueInternal
{
  return self->_completionDispatchQueueInternal;
}

void __69__VUIUniversalAssetController__updateDownloadStateAndNotifyListeners__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:WeakRetained userInfo:*(void *)(a1 + 32)];
  }
}

- (VUIUniversalAssetController)initWithMPMediaItem:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "vui_adamIDString");
  if (v5)
  {
    v6 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v7 = [v6 sidebandMediaLibrary];
    double v8 = [v7 videoForAdamID:v5 useMainThreadContext:1];
  }
  else
  {
    double v8 = 0;
  }
  uint64_t v9 = [(VUIUniversalAssetController *)self initWithVideoManagedObject:v8 mpMediaItem:v4 videosPlayable:0];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIUniversalAssetController *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(VUIUniversalAssetController *)v5 _adamIDString];
    uint64_t v7 = [(VUIUniversalAssetController *)self _adamIDString];
    double v8 = (void *)v7;
    char v9 = 0;
    if (v6 && v7) {
      char v9 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VUIUniversalAssetController;
  unint64_t v3 = [(VUIUniversalAssetController *)&v7 hash];
  id v4 = [(VUIUniversalAssetController *)self _adamIDString];
  v5 = v4;
  if (v4) {
    v3 ^= [v4 hash];
  }

  return v3;
}

- (BOOL)_isVideoFullyDownloadedCheckingSidebandLibrary:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(VUIUniversalAssetController *)self mpMediaItem];

  if (!v5)
  {
    LOBYTE(v15) = 0;
LABEL_12:
    if (v3)
    {
      id v16 = [(VUIUniversalAssetController *)self videoManagedObject];
      LOBYTE(v15) = [v16 downloadState] == 2;
    }
    return v15;
  }
  v6 = [(VUIUniversalAssetController *)self mpMediaItem];
  uint64_t v7 = *MEMORY[0x1E4F313E0];
  uint64_t v8 = *MEMORY[0x1E4F31410];
  char v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F313E0], *MEMORY[0x1E4F31410], 0);
  uint64_t v10 = [v6 valuesForProperties:v9];

  v11 = [v10 objectForKey:v7];
  uint64_t v12 = [v10 objectForKey:v8];
  v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || ![v11 BOOLValue]) {
    LOBYTE(v15) = 0;
  }
  else {
    int v15 = [v13 BOOLValue] ^ 1;
  }

  if ((v15 & 1) == 0) {
    goto LABEL_12;
  }
  return v15;
}

- (id)_adamIDString
{
  BOOL v3 = [(VUIUniversalAssetController *)self videosPlayable];

  if (v3)
  {
    id v4 = [(VUIUniversalAssetController *)self videosPlayable];
LABEL_3:
    v5 = v4;
    uint64_t v6 = [v4 adamID];
    goto LABEL_6;
  }
  uint64_t v7 = [(VUIUniversalAssetController *)self mpMediaItem];

  if (!v7)
  {
    id v4 = [(VUIUniversalAssetController *)self videoManagedObject];
    goto LABEL_3;
  }
  v5 = [(VUIUniversalAssetController *)self mpMediaItem];
  uint64_t v6 = objc_msgSend(v5, "vui_adamIDString");
LABEL_6:
  uint64_t v8 = (void *)v6;

  return v8;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (VUIUniversalAssetController)initWithVideoManagedObject:(id)a3
{
  return [(VUIUniversalAssetController *)self initWithVideoManagedObject:a3 mpMediaItem:0 videosPlayable:0];
}

- (VUIUniversalAssetController)initWithVideosPlayable:(id)a3
{
  id v4 = a3;
  v5 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v6 = [v5 sidebandMediaLibrary];
  uint64_t v7 = [v4 adamID];
  uint64_t v8 = [v6 videoForAdamID:v7 useMainThreadContext:1];

  if (![v4 isiTunesPurchaseOrRental]
    || ([v4 isFamilySharingContent] & 1) != 0)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  char v9 = (void *)MEMORY[0x1E4F31928];
  uint64_t v10 = [v4 adamID];
  v11 = objc_msgSend(v9, "vui_mediaItemForStoreIdentifierString:", v10);

  if (!v11)
  {
    uint64_t v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VUIUniversalAssetController initWithVideosPlayable:](v4, v12);
    }

    goto LABEL_7;
  }
LABEL_8:
  v13 = [(VUIUniversalAssetController *)self initWithVideoManagedObject:v8 mpMediaItem:v11 videosPlayable:v4];

  return v13;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(VUIVideoManagedObject *)self->_videoManagedObject removeObserver:self forKeyPath:@"downloadState" context:__VideoManagedObjectDownloadStateKVOContext];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_mpMediaItem)
  {
    id v4 = [MEMORY[0x1E4F31A50] sharedManager];
    [v4 removeObserver:self forDownloads:0];
  }
  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "%@ deallocated ", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)VUIUniversalAssetController;
  [(VUIUniversalAssetController *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)__VideoManagedObjectDownloadStateKVOContext == a6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__VUIUniversalAssetController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6DF3D58;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIUniversalAssetController;
    -[VUIUniversalAssetController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __78__VUIUniversalAssetController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDownloadStateAndNotifyListeners];
}

- (void)setVideoManagedObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_super v6 = +[VUIMediaLibraryManager defaultManager];
    uint64_t v7 = [v6 sidebandMediaLibrary];
    obja = [v7 mainContextVideoForVideo:v5];

    uint64_t v8 = obja;
  }
  else
  {
    uint64_t v8 = 0;
  }
  videoManagedObject = self->_videoManagedObject;
  if (videoManagedObject != v8)
  {
    obj = v8;
    if (videoManagedObject)
    {
      [(VUIVideoManagedObject *)videoManagedObject removeObserver:self forKeyPath:@"downloadState" context:__VideoManagedObjectDownloadStateKVOContext];
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v11 = [(VUIVideoManagedObject *)self->_videoManagedObject objectID];
      [v10 removeObserver:self name:@"VUIVideoManagedObjectPlaybackExpirationDidChangeNotification" object:v11];

      uint64_t v8 = obj;
    }
    objc_storeStrong((id *)&self->_videoManagedObject, v8);
    if (obj)
    {
      [(VUIVideoManagedObject *)obj addObserver:self forKeyPath:@"downloadState" options:0 context:__VideoManagedObjectDownloadStateKVOContext];
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v13 = [(VUIVideoManagedObject *)self->_videoManagedObject objectID];
      [v12 addObserver:self selector:sel__videoManagedObjectPlaybackExpirationDidChange_ name:@"VUIVideoManagedObjectPlaybackExpirationDidChangeNotification" object:v13];
    }
    [(VUIUniversalAssetController *)self _updateObservedDownload];
    [(VUIUniversalAssetController *)self _updateDownloadStateAndNotifyListeners];
    uint64_t v8 = obj;
  }
}

- (BOOL)supportsStartingDownload
{
  BOOL v3 = [(VUIUniversalAssetController *)self mpMediaItem];

  if (!v3)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v10 = objc_msgSend(v8, "ams_activeiTunesAccount");
    v11 = objc_msgSend(v10, "ams_DSID");
    char v9 = v11 != 0;
LABEL_8:

    goto LABEL_9;
  }
  id v4 = [(VUIUniversalAssetController *)self mpMediaItem];
  v5 = [v4 valueForProperty:*MEMORY[0x1E4F31500]];
  uint64_t v6 = [v5 unsignedLongLongValue];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(VUIUniversalAssetController *)self mpMediaItem];
  uint64_t v8 = [v7 valueForProperty:*MEMORY[0x1E4F314C8]];

  if (([v8 isEqual:&unk_1F3F3CAD0] & 1) == 0)
  {
    if (v8)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
      uint64_t v12 = objc_msgSend(v11, "ams_DSID");
      char v9 = [v12 isEqual:v8];

      goto LABEL_8;
    }
    return 0;
  }
  char v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)supportsRedownloadingContent
{
  v2 = [(VUIUniversalAssetController *)self mpMediaItem];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)contentAllowsCellularDownload
{
  return 1;
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = MEMORY[0x1E4F14428];
    id v4 = (id)MEMORY[0x1E4F14428];
  }
  id v6 = v4;
  [(VUIUniversalAssetController *)self setCompletionDispatchQueueInternal:v4];
}

- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v10 = a3;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  if ([(VUIUniversalAssetController *)self supportsStartingDownload])
  {
    [(VUIUniversalAssetController *)self _createAndSaveVideoManagedObjectForDownloadInitiationAllowingCellular:v10 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:v8 prefer3DOrImmersiveDownload:v7];
    id v13 = [(VUIUniversalAssetController *)self videoManagedObject];
    if (v13)
    {
      if (_os_feature_enabled_impl())
      {
        BOOL v14 = +[VUIInterfaceFactory sharedInstance];
        int v15 = [v14 downloadQueueManager];

        v28[0] = v13;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        [v15 enqueueDownloadsForVideoManagedObjects:v16];

        v17 = +[VUIDownloadManager sharedInstance];
        [v17 loadImageForVideoManagedObject:v13];
      }
      else
      {
        uint64_t v22 = +[VUIDownloadManager sharedInstance];
        [v22 addDownloadForVideoManagedObject:v13 allowCellular:v10 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:v8 prefer3DOrImmersiveDownload:v7];
      }
    }
    else
    {
      uint64_t v21 = VUIDefaultLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[VUIUniversalAssetController startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:]();
      }
    }
    v23 = [(VUIUniversalAssetController *)self completionDispatchQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_32;
    v24[3] = &unk_1E6DF3DD0;
    id v25 = v12;
    id v20 = v12;
    dispatch_async(v23, v24);
  }
  else
  {
    v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VUIUniversalAssetController startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:]();
    }

    double v19 = [(VUIUniversalAssetController *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke;
    block[3] = &unk_1E6DF3DD0;
    id v27 = v12;
    id v13 = v12;
    dispatch_async(v19, block);

    id v20 = v27;
  }
}

uint64_t __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __151__VUIUniversalAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  id v13 = a6;
  uint64_t v10 = [(VUIUniversalAssetController *)self mpMediaItem];
  if (v10)
  {
    v11 = (void *)v10;
    BOOL v12 = [(VUIUniversalAssetController *)self _isVideoFullyDownloadedCheckingSidebandLibrary:0];

    if (v12) {
      [(VUIUniversalAssetController *)self cancelAndRemoveDownload];
    }
  }
  [(VUIUniversalAssetController *)self startDownloadAllowingCellular:v8 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:v6 prefer3DOrImmersiveDownload:1 completion:v13];
}

- (void)fetchNewKeysForDownloadedVideo
{
  id v3 = [(VUIUniversalAssetController *)self videoManagedObject];
  v2 = +[VUIDownloadManager sharedInstance];
  [v2 fetchNewKeysForDownloadedVideoManagedObject:v3];
}

- (void)pauseDownload
{
  id v5 = [(VUIUniversalAssetController *)self videoManagedObject];
  v2 = [v5 adamID];
  id v3 = +[VUIDownloadManager sharedInstance];
  id v4 = [v3 existingDownloadForAdamID:v2];

  [v4 pause];
}

- (void)resumeDownload
{
  id v5 = [(VUIUniversalAssetController *)self videoManagedObject];
  v2 = [v5 adamID];
  id v3 = +[VUIDownloadManager sharedInstance];
  id v4 = [v3 existingDownloadForAdamID:v2];

  [v4 start];
}

- (void)cancelAndRemoveDownload
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "%@ Unable to delete download", v2, v3, v4, v5, v6);
}

void __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VUIRentalManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke_2;
  v5[3] = &unk_1E6DF6A38;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v2 checkInRentalWithID:v3 dsid:v4 completion:v5];

  objc_destroyWeak(&v6);
}

void __54__VUIUniversalAssetController_cancelAndRemoveDownload__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = VUIBoolLogString();
    BOOL v8 = [v4 description];
    int v9 = 138412802;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    BOOL v12 = v7;
    __int16 v13 = 2112;
    BOOL v14 = v8;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Finished checking-in rental, success:[%@], error:[%@]", (uint8_t *)&v9, 0x20u);
  }
}

- (void)cancelKeyFetch
{
  id v4 = [(VUIUniversalAssetController *)self videoManagedObject];
  uint64_t v2 = [v4 adamID];
  uint64_t v3 = +[VUIDownloadManager sharedInstance];
  [v3 cancelDownloadForAdamID:v2];
}

- (VUIContentRating)contentRating
{
  uint64_t v3 = [(VUIUniversalAssetController *)self mpMediaItem];

  if (v3)
  {
    id v4 = [(VUIUniversalAssetController *)self mpMediaItem];
    uint64_t v5 = objc_msgSend(v4, "vui_contentRating");
  }
  else
  {
    id v6 = [(VUIUniversalAssetController *)self videosPlayable];

    if (!v6)
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    BOOL v7 = [(VUIUniversalAssetController *)self videosPlayable];
    BOOL v8 = [v7 metadata];
    id v4 = [v8 ratingName];

    int v9 = [(VUIUniversalAssetController *)self videosPlayable];
    id v10 = [v9 metadata];
    __int16 v11 = [v10 ratingSystem];

    if ([v11 length] && objc_msgSend(v4, "length"))
    {
      BOOL v12 = [(VUIUniversalAssetController *)self videosPlayable];
      __int16 v13 = [v12 metadata];
      BOOL v14 = [v13 ratingValue];

      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3C60]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v11, v4, objc_msgSend(v14, "unsignedIntegerValue"), 0);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
LABEL_11:
  return (VUIContentRating *)v5;
}

- (NSString)brandName
{
  uint64_t v3 = [(VUIUniversalAssetController *)self videoManagedObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 brandName];
  }
  else
  {
    id v6 = [(VUIUniversalAssetController *)self videosPlayable];

    if (v6)
    {
      BOOL v7 = [(VUIUniversalAssetController *)self videosPlayable];
      uint64_t v5 = [v7 channelName];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)brandID
{
  uint64_t v3 = [(VUIUniversalAssetController *)self videoManagedObject];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 brandID];
  }
  else
  {
    id v6 = [(VUIUniversalAssetController *)self videosPlayable];

    if (v6)
    {
      BOOL v7 = [(VUIUniversalAssetController *)self videosPlayable];
      uint64_t v5 = [v7 channelID];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (BOOL)allowsManualDownloadRenewal
{
  uint64_t v2 = [(VUIUniversalAssetController *)self videoManagedObject];
  char v3 = [v2 allowsManualRenewal];

  return v3;
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  [(VUIUniversalAssetController *)self _updateObservedDownload];
  [(VUIUniversalAssetController *)self _updateDownloadStateAndNotifyListeners];
}

- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__VUIUniversalAssetController_downloadManager_didAddDownloads_removeDownloads___block_invoke;
  block[3] = &unk_1E6DF45D8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__VUIUniversalAssetController_downloadManager_didAddDownloads_removeDownloads___block_invoke(id *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] mpMediaItem];
  char v3 = [v2 valueForProperty:*MEMORY[0x1E4F31500]];
  uint64_t v4 = [v3 unsignedLongLongValue];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = a1[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v10 storeItemIdentifier] == v4)
        {
          __int16 v11 = VUIDefaultLogObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = a1[4];
            *(_DWORD *)buf = 138412546;
            id v38 = v12;
            __int16 v39 = 2112;
            v40 = v10;
            _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "%@ Store download added: %@", buf, 0x16u);
          }

          [a1[4] setStoreDownload:v10];
          [a1[4] _updateDownloadStateAndNotifyListeners];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = a1[6];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v29;
    *(void *)&long long v15 = 138412290;
    long long v27 = v15;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v13);
        }
        double v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v19, "storeItemIdentifier", v27) == v4)
        {
          id v20 = VUIDefaultLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = a1[4];
            *(_DWORD *)buf = 138412546;
            id v38 = v21;
            __int16 v39 = 2112;
            v40 = v19;
            _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "%@ Store download removed: %@", buf, 0x16u);
          }

          uint64_t v22 = [a1[4] storeDownload];
          char v23 = [v22 isFinished];

          if ((v23 & 1) == 0)
          {
            int v24 = [a1[4] storeDownload];

            if (v24)
            {
              id v25 = VUIDefaultLogObject();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = a1[4];
                *(_DWORD *)buf = v27;
                id v38 = v26;
                _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "%@ Setting store download to nil", buf, 0xCu);
              }

              [a1[4] setStoreDownload:0];
              [a1[4] _updateDownloadStateAndNotifyListeners];
            }
          }
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }
}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__VUIUniversalAssetController_downloadManager_downloadDidProgress___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __67__VUIUniversalAssetController_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) storeDownload];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 _updateDownloadStateAndNotifyListeners];
  }
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__VUIUniversalAssetController_downloadManager_downloadDidFinish___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __65__VUIUniversalAssetController_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) storeDownload];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 _updateDownloadStateAndNotifyListeners];
  }
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  uint64_t v4 = [(VUIUniversalAssetController *)self mpMediaItem];
  uint64_t v5 = *MEMORY[0x1E4F31430];
  id v6 = [v4 valueForProperty:*MEMORY[0x1E4F31430]];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F31968] predicateWithValue:v6 forProperty:v5];
    id v8 = objc_alloc(MEMORY[0x1E4F31970]);
    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, 0);
    id v10 = (void *)[v8 initWithFilterPredicates:v9];

    [v10 setEntityLimit:1];
  }
  else
  {
    id v10 = 0;
  }
  __int16 v11 = [v10 items];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__VUIUniversalAssetController__handleMediaLibraryContentsDidChangeNotification___block_invoke;
    block[3] = &unk_1E6DF3D58;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __80__VUIUniversalAssetController__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDownloadStateAndNotifyListeners];
}

- (void)_videoManagedObjectPlaybackExpirationDidChange:(id)a3
{
  uint64_t v4 = [a3 object];
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = [(VUIUniversalAssetController *)self videoManagedObject];
    id v6 = [v5 objectID];

    uint64_t v4 = v7;
    if (v7 == v6)
    {
      [(VUIUniversalAssetController *)self _updateDownloadStateAndNotifyListeners];
      uint64_t v4 = v7;
    }
  }
}

- (void)_videoManagedObjectWasCreated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];

  if (v5 != self)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:@"VUIUniversalAssetControllerAdamIDStringKey"];

    if (v7)
    {
      id v8 = [(VUIUniversalAssetController *)self mpMediaItem];

      if (v8)
      {
        id v9 = [(VUIUniversalAssetController *)self mpMediaItem];
        uint64_t v10 = objc_msgSend(v9, "vui_adamIDString");
      }
      else
      {
        __int16 v11 = [(VUIUniversalAssetController *)self videosPlayable];

        if (v11) {
          [(VUIUniversalAssetController *)self videosPlayable];
        }
        else {
        id v9 = [(VUIUniversalAssetController *)self videoManagedObject];
        }
        uint64_t v10 = [v9 adamID];
      }
      uint64_t v12 = (void *)v10;

      if (v12 && [v12 isEqualToString:v7])
      {
        id v13 = VUIDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412546;
          uint64_t v17 = self;
          __int16 v18 = 2112;
          double v19 = v7;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "%@ updating videoManagedObject with adam ID %@", (uint8_t *)&v16, 0x16u);
        }

        uint64_t v14 = [v4 userInfo];
        long long v15 = [v14 objectForKey:@"VUIUniversalAssetControllerVideoManagedObjectkey"];

        [(VUIUniversalAssetController *)self setVideoManagedObject:v15];
      }
    }
  }
}

- (void)_createAndSaveVideoManagedObjectForDownloadInitiationAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v9 = a3;
  v43[2] = *MEMORY[0x1E4F143B8];
  __int16 v11 = [(VUIUniversalAssetController *)self mpMediaItem];

  if (v11)
  {
    uint64_t v12 = [(VUIUniversalAssetController *)self mpMediaItem];
    __int16 v11 = [(VUIUniversalAssetController *)self _createAndSaveVideoManagedObjectForMPMediaItem:v12];

    id v13 = [(VUIUniversalAssetController *)self mpMediaItem];
    uint64_t v14 = objc_msgSend(v13, "vui_adamIDString");
  }
  else
  {
    uint64_t v14 = 0;
  }
  long long v15 = [(VUIUniversalAssetController *)self videosPlayable];

  if (v15)
  {
    int v16 = [(VUIUniversalAssetController *)self videosPlayable];
    uint64_t v17 = [v16 adamID];

    __int16 v18 = [(VUIUniversalAssetController *)self videosPlayable];
    uint64_t v19 = [(VUIUniversalAssetController *)self _createAndSaveVideoManagedObjectForPlayable:v18];

    uint64_t v14 = (void *)v17;
    __int16 v11 = (void *)v19;
  }
  uint64_t v20 = [(VUIUniversalAssetController *)self mpMediaItem];
  if (v20)
  {
  }
  else
  {
    id v21 = [(VUIUniversalAssetController *)self videosPlayable];

    if (!v21)
    {
      uint64_t v22 = VUIDefaultLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[VUIUniversalAssetController _createAndSaveVideoManagedObjectForDownloadInitiationAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:]();
      }
    }
  }
  if (v11)
  {
    objc_opt_class();
    char v23 = &off_1E6DF2000;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v24 = v11;
    id v25 = [v24 season];
    if (!v25)
    {
      uint64_t v30 = [(VUIUniversalAssetController *)self mpMediaItem];
      if (!v30) {
        goto LABEL_16;
      }
      long long v31 = (void *)v30;
      long long v32 = [(VUIUniversalAssetController *)self mpMediaItemCollection];

      if (!v32) {
        goto LABEL_16;
      }
      id v25 = [(MPMediaItemCollection *)self->_mpMediaItemCollection valueForProperty:*MEMORY[0x1E4F312B0]];
      if (v25)
      {
        v40 = +[VUIMediaLibraryManager defaultManager];
        id v38 = [v40 sidebandMediaLibrary];
        long long v33 = [v38 seasonForCanonicalIDOrAdamID:v25 createIfNeeded:1];

        v41 = v33;
        long long v34 = [v33 canonicalID];

        if (!v34)
        {
          [v41 setCanonicalID:v25];
          long long v35 = [(MPMediaItemCollection *)self->_mpMediaItemCollection representativeItem];
          __int16 v39 = [v35 valueForProperty:*MEMORY[0x1E4F314A0]];

          if (v39)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v41 setSeasonNumber:v39];
            }
          }
          id v36 = [(MPMediaItemCollection *)self->_mpMediaItemCollection representativeItem];
          id v37 = [v36 valueForProperty:*MEMORY[0x1E4F31498]];

          if (v37)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v41 setTitle:v37];
            }
          }
        }
        objc_msgSend(v24, "setSeason:", v41, v37);
      }
    }

LABEL_16:
    char v23 = &off_1E6DF2000;
LABEL_17:
    [v11 setAllowsCellular:v9];
    [v11 setDownloadQuality:a4];
    [v11 setShouldMarkAsDeletedAfterCancellationOrFailure:v7];
    [v11 setPrefer3DOrImmersiveDownload:v6];
    id v26 = [v23[272] defaultManager];
    long long v27 = [v26 sidebandMediaLibrary];
    [v27 saveChangesToManagedObjects];

    [(VUIUniversalAssetController *)self setVideoManagedObject:v11];
    if (v14)
    {
      v42[0] = @"VUIUniversalAssetControllerAdamIDStringKey";
      v42[1] = @"VUIUniversalAssetControllerVideoManagedObjectkey";
      v43[0] = v14;
      v43[1] = v11;
      long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 postNotificationName:@"VUIUniversalAssetControllerDidCreateVideoManagedObject" object:self userInfo:v28];
    }
  }
}

- (id)_createAndSaveVideoManagedObjectForPlayable:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v5 = [v4 sidebandMediaLibrary];
  BOOL v6 = [v5 videoForPlayable:v3];

  BOOL v7 = [v3 startTimeInfos];
  id v8 = objc_alloc_init(VUIMediaStartTimeCollection);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        -[VUIMediaStartTimeCollection addStartTimeInfo:](v8, "addStartTimeInfo:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [(VUIMediaStartTimeCollection *)v8 preferredStartTimeInfo];
  if ([v14 type])
  {
    if ([v14 type] != 1) {
      goto LABEL_13;
    }
    long long v15 = [v14 startTime];
    [v6 setMainContentRelativeBookmarkTime:v15];

    int v16 = [v14 timestamp];
    [v6 setMainContentRelativeBookmarkTimeStamp:v16];
  }
  else
  {
    uint64_t v17 = [v14 startTime];
    [v6 setBookmarkTime:v17];

    int v16 = [v14 timestamp];
    [v6 setBookmarkTimeStamp:v16];
  }

LABEL_13:
  __int16 v18 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v19 = [v18 sidebandMediaLibrary];
  [v19 saveChangesToManagedObjects];

  return v6;
}

- (id)_createAndSaveVideoManagedObjectForMPMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = +[VUIMediaLibraryManager defaultManager];
  uint64_t v5 = [v4 sidebandMediaLibrary];
  BOOL v6 = [v5 videoForMPMediaItem:v3];

  return v6;
}

- (BOOL)isPurchasedRentedOrSynced
{
  uint64_t v2 = [(VUIUniversalAssetController *)self mpMediaItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)showCanonicalId
{
  BOOL v3 = [(VUIUniversalAssetController *)self videosPlayable];

  if (v3)
  {
    id v4 = [(VUIUniversalAssetController *)self videosPlayable];
    uint64_t v5 = [v4 metadata];

    BOOL v6 = [v5 showCanonicalId];
LABEL_5:

    goto LABEL_7;
  }
  BOOL v7 = [(VUIUniversalAssetController *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(VUIUniversalAssetController *)self videoManagedObject];
    id v9 = [v5 series];
    BOOL v6 = [v9 canonicalID];

    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:
  return v6;
}

- (id)seasonCanonicalId
{
  BOOL v3 = [(VUIUniversalAssetController *)self videosPlayable];

  if (v3)
  {
    id v4 = [(VUIUniversalAssetController *)self videosPlayable];
    uint64_t v5 = [v4 metadata];

    BOOL v6 = [v5 seasonCanonicalId];
LABEL_5:

    goto LABEL_7;
  }
  BOOL v7 = [(VUIUniversalAssetController *)self videoManagedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(VUIUniversalAssetController *)self videoManagedObject];
    id v9 = [v5 season];
    BOOL v6 = [v9 canonicalID];

    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_7:
  return v6;
}

- (NSString)description
{
  uint64_t v2 = NSString;
  BOOL v3 = [(VUIUniversalAssetController *)self _adamIDString];
  id v4 = [v2 stringWithFormat:@"assetController with adamID: %@", v3];

  return (NSString *)v4;
}

- (MPMediaItemCollection)mpMediaItemCollection
{
  return self->_mpMediaItemCollection;
}

- (void)setMpMediaItemCollection:(id)a3
{
}

- (void)setMpMediaItem:(id)a3
{
}

- (void)setVideosPlayable:(id)a3
{
}

- (void)setCompletionDispatchQueueInternal:(id)a3
{
}

- (void)setDownload:(id)a3
{
}

- (void)setStoreDownload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDownload, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_stateInternal, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
  objc_storeStrong((id *)&self->_videoManagedObject, 0);
  objc_storeStrong((id *)&self->_mpMediaItemCollection, 0);
}

- (void)initWithVideosPlayable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 adamID];
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIUniversalAssetController unable to retrieve MPMediaItem for adam ID %@", v4, 0xCu);
}

- (void)startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "%@ unable to add download since video managed object is nil", v2, v3, v4, v5, v6);
}

- (void)startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "%@ Not starting download since supportsStartingDownload is NO", v2, v3, v4, v5, v6);
}

- (void)_createAndSaveVideoManagedObjectForDownloadInitiationAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "%@ Unable to create video managed object since MPMediaItem and playable are both nil", v2, v3, v4, v5, v6);
}

@end