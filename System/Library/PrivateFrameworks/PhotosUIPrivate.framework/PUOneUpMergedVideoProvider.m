@interface PUOneUpMergedVideoProvider
- (BOOL)isEnabled;
- (ISLivePhotoPlayer)livePhotoPlayer;
- (NSCache)dataCache;
- (NSError)error;
- (PUBrowsingViewModel)browsingViewModel;
- (PUMergedLivePhotosVideo)mergedVideo;
- (PUMergedLivePhotosVideoRequest)currentRequest;
- (PUOneUpMergedVideoProvider)initWithBrowsingViewModel:(id)a3;
- (id)wrappedVideoPlayerForPlayer:(id)a3;
- (int64_t)state;
- (void)_handleRequestChanges:(id)a3;
- (void)_updateLivePhotoPlayerItem;
- (void)_updateRequest;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)playerWillRelinquishVideoPlayer:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDataCache:(id)a3;
- (void)setError:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setMergedVideo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpMergedVideoProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayer, 0);
  objc_storeStrong((id *)&self->_mergedVideo, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (void)setDataCache:(id)a3
{
}

- (NSCache)dataCache
{
  return self->_dataCache;
}

- (void)setCurrentRequest:(id)a3
{
}

- (PUMergedLivePhotosVideoRequest)currentRequest
{
  return self->_currentRequest;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

- (ISLivePhotoPlayer)livePhotoPlayer
{
  return self->_livePhotoPlayer;
}

- (PUMergedLivePhotosVideo)mergedVideo
{
  return self->_mergedVideo;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)_updateLivePhotoPlayerItem
{
  v3 = [(PUOneUpMergedVideoProvider *)self mergedVideo];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 mergedVideoAsset];
    v6 = [v4 mergedVideoComposition];
    uint64_t v7 = 2 * ([v4 options] & 1);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F8EB98]) initWithVideoAsset:v5 UIImage:0 photoTime:0 photoEXIFOrientation:v7 options:0.0];
    v9 = (void *)MEMORY[0x1E4F8EBB0];
    v10 = NSNumber;
    [v4 videoAspectRatio];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    objc_msgSend(v9, "playerItemWithAsset:targetSize:contentAspectRatio:", v8, v11, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    [v13 setVideoComposition:v6];
  }
  else
  {
    id v13 = 0;
  }
  v12 = [(PUOneUpMergedVideoProvider *)self livePhotoPlayer];
  [v12 setPlayerItem:v13];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PUOneUpMergedVideoProvider *)self signalChange:1];
  }
}

- (void)setError:(id)a3
{
  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    [(PUOneUpMergedVideoProvider *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setMergedVideo:(id)a3
{
  v5 = (PUMergedLivePhotosVideo *)a3;
  if (self->_mergedVideo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mergedVideo, a3);
    [(PUOneUpMergedVideoProvider *)self _updateLivePhotoPlayerItem];
    [(PUOneUpMergedVideoProvider *)self signalChange:2];
    v5 = v6;
  }
}

- (void)_handleRequestChanges:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_4;
      v8[3] = &unk_1E5F2E5A8;
      v8[4] = self;
      [(PUOneUpMergedVideoProvider *)self performChanges:v8];
      break;
    case 2:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_3;
      v9[3] = &unk_1E5F2E5A8;
      v9[4] = self;
      [(PUOneUpMergedVideoProvider *)self performChanges:v9];
      [v4 unregisterChangeObserver:self context:0];
      break;
    case 3:
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke;
      v12[3] = &unk_1E5F2E5D0;
      v12[4] = self;
      id v5 = v4;
      id v13 = v5;
      [(PUOneUpMergedVideoProvider *)self performChanges:v12];
      [v5 unregisterChangeObserver:self context:0];
      v6 = v13;
      goto LABEL_6;
    case 4:
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_2;
      v10[3] = &unk_1E5F2E5D0;
      v10[4] = self;
      id v7 = v4;
      id v11 = v7;
      [(PUOneUpMergedVideoProvider *)self performChanges:v10];
      [v7 unregisterChangeObserver:self context:0];
      v6 = v11;
LABEL_6:

      break;
    default:
      break;
  }
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) mergedVideo];
  [*(id *)(a1 + 32) setMergedVideo:v2];

  [*(id *)(a1 + 32) setError:0];
  v3 = *(void **)(a1 + 32);
  return [v3 setState:2];
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMergedVideo:0];
  v2 = [*(id *)(a1 + 40) error];
  [*(id *)(a1 + 32) setError:v2];

  v3 = *(void **)(a1 + 32);
  return [v3 setState:3];
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setMergedVideo:0];
  [*(id *)(a1 + 32) setError:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:0];
}

uint64_t __52__PUOneUpMergedVideoProvider__handleRequestChanges___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setMergedVideo:0];
  [*(id *)(a1 + 32) setError:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:1];
}

- (void)_updateRequest
{
  v3 = [(PUOneUpMergedVideoProvider *)self browsingViewModel];
  id v4 = [v3 currentAssetReference];
  id v5 = [(PUOneUpMergedVideoProvider *)self currentRequest];
  v6 = [v5 assetReference];
  int v7 = [v3 isVideoContentAllowed];
  if (v4 && v7 && ([v3 isScrubbing] & 1) == 0)
  {
    v8 = [v6 asset];
    id v9 = [v4 asset];
    id v10 = v8;
    id v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      uint64_t v12 = [v9 isContentEqualTo:v10];
      if (!v12) {
        uint64_t v12 = [v11 isContentEqualTo:v9];
      }

      if (v12 != 2)
      {
LABEL_12:
        [v5 cancel];
        v14 = [v3 assetsDataSource];
        if (v14)
        {
          v15 = [v4 asset];
          uint64_t v16 = [v15 playbackStyle];

          if (v16 == 3)
          {
            v17 = [PUMergedLivePhotosVideoRequest alloc];
            v18 = [(PUOneUpMergedVideoProvider *)self dataCache];
            v19 = [(PUMergedLivePhotosVideoRequest *)v17 initWithAssetReference:v4 dataSource:v14 dataCache:v18];

            [(PUMergedLivePhotosVideoRequest *)v19 registerChangeObserver:self context:0];
            [(PUOneUpMergedVideoProvider *)self setCurrentRequest:v19];
          }
        }

LABEL_16:
        v20 = [v3 assetViewModelForCurrentAssetReference];
        if ([v20 isFullyInFocus])
        {
          BOOL v21 = [(PUOneUpMergedVideoProvider *)self isEnabled];

          if (!v21)
          {
LABEL_20:

            goto LABEL_21;
          }
          v20 = [(PUOneUpMergedVideoProvider *)self currentRequest];
          [v20 start];
        }

        goto LABEL_20;
      }
    }
    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class()) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  [v5 cancel];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__PUOneUpMergedVideoProvider__updateRequest__block_invoke;
  v22[3] = &unk_1E5F2E5A8;
  v22[4] = self;
  [(PUOneUpMergedVideoProvider *)self performChanges:v22];
LABEL_21:
}

uint64_t __44__PUOneUpMergedVideoProvider__updateRequest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMergedVideo:0];
  [*(id *)(a1 + 32) setError:0];
  [*(id *)(a1 + 32) setState:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setCurrentRequest:0];
}

- (void)playerWillRelinquishVideoPlayer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F908C0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 checkInReusableWrappedPlayer:v4];
}

- (id)wrappedVideoPlayerForPlayer:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F908C0], "sharedInstance", a3);
  id v4 = [v3 checkOutReusableWrappedPlayer];

  return v4;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5 = a4;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    id v8 = v6;
    px_dispatch_on_main_queue();
  }
}

void __59__PUOneUpMergedVideoProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v12 = *(id *)(a1 + 32);
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v10);
    id v11 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v3 handleFailureInMethod:v8, v9, @"PUOneUpMergedVideoProvider.m", 79, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v7, v11 object file lineNumber description];
  }
  else
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    [v3 handleFailureInMethod:v4, v5, @"PUOneUpMergedVideoProvider.m", 79, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v7 object file lineNumber description];
  }

LABEL_3:
  id v2 = [*(id *)(a1 + 40) currentRequest];

  if (v12 == v2) {
    [*(id *)(a1 + 40) _handleRequestChanges:v12];
  }
  else {
    [v12 unregisterChangeObserver:*(void *)(a1 + 40) context:*(void *)(a1 + 56)];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((([v6 currentAssetDidChange] & 1) != 0
     || ([v6 videoOverlayPlayStateDidChange] & 1) != 0
     || ([v6 isVideoContentAllowedDidChange] & 1) != 0
     || ([v6 isScrubbingDidChange] & 1) != 0
     || [v6 currentAssetTransitionProgressDidChange])
    && ![v7 videoOverlayPlayState])
  {
    [(PUOneUpMergedVideoProvider *)self _updateRequest];
  }
}

- (void)setIsEnabled:(BOOL)a3
{
  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    [(PUOneUpMergedVideoProvider *)self _updateRequest];
  }
}

- (PUOneUpMergedVideoProvider)initWithBrowsingViewModel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpMergedVideoProvider;
  id v6 = [(PUOneUpMergedVideoProvider *)&v12 init];
  if (v6)
  {
    id v7 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBA0]);
    livePhotoPlayer = v6->_livePhotoPlayer;
    v6->_livePhotoPlayer = v7;

    [(ISLivePhotoPlayer *)v6->_livePhotoPlayer setTargetReadiness:2];
    [(ISLivePhotoPlayer *)v6->_livePhotoPlayer setDelegate:v6];
    uint64_t v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dataCache = v6->_dataCache;
    v6->_dataCache = v9;

    v6->_state = 0;
    objc_storeStrong((id *)&v6->_browsingViewModel, a3);
    [v5 registerChangeObserver:v6];
  }

  return v6;
}

@end