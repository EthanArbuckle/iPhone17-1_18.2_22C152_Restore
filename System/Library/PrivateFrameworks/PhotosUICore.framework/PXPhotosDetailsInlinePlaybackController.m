@interface PXPhotosDetailsInlinePlaybackController
- (BOOL)_isRecognizedTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)canPlayAsset:(id)a3;
- (BOOL)shouldEnablePlayback;
- (CGRect)currentVisibleRect;
- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4;
- (PXPhotosDetailsInlinePlaybackController)init;
- (PXPhotosDetailsInlinePlaybackController)initWithTilingController:(id)a3;
- (PXPhotosDetailsInlinePlaybackControllerDelegate)delegate;
- (PXTileIdentifier)_currentTileIdentifierForRecord:(SEL)a3;
- (PXTilingController)tilingController;
- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5;
- (id)currentHoveredDisplayAsset;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PXPhotosDetailsInlinePlaybackController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_recordCreationQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosDetailsInlinePlaybackControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosDetailsInlinePlaybackControllerDelegate *)WeakRetained;
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (BOOL)canPlayAsset:(id)a3
{
  switch([a3 playbackStyle])
  {
    case 2:
      v3 = +[PXAssetsSceneSettings sharedInstance];
      char v4 = [v3 allowAnimatedImagePlayback];
      goto LABEL_7;
    case 3:
      v3 = +[PXAssetsSceneSettings sharedInstance];
      char v4 = [v3 allowLivePhotoPlayback];
      goto LABEL_7;
    case 4:
      v3 = +[PXAssetsSceneSettings sharedInstance];
      char v4 = [v3 allowVideoPlayback];
      goto LABEL_7;
    case 5:
      v3 = +[PXAssetsSceneSettings sharedInstance];
      char v4 = [v3 allowLoopingVideoPlayback];
LABEL_7:
      BOOL v5 = v4;

      break;
    default:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v5 = a3;
  v6 = [(PXPhotosDetailsInlinePlaybackController *)self tilingController];
  v7 = [v6 currentLayout];

  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(PXPhotosDetailsInlinePlaybackController *)self _currentTileIdentifierForRecord:v5];

  double v9 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);

  double v12 = v9;
  double v13 = v8;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)currentHoveredDisplayAsset
{
  return 0;
}

- (CGRect)currentVisibleRect
{
  v2 = [(PXPhotosDetailsInlinePlaybackController *)self tilingController];
  v3 = [v2 currentLayout];
  [v3 visibleRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(PXGridInlinePlaybackRecord *)[_PXDetailsPlaybackRecord alloc] initWithDisplayAsset:v9 mediaProvider:v8 geometryReference:v7];

  return v10;
}

- (BOOL)shouldEnablePlayback
{
  v3 = [(PXPhotosDetailsInlinePlaybackController *)self delegate];
  if (v3)
  {
    double v4 = [(PXPhotosDetailsInlinePlaybackController *)self delegate];
    char v5 = [v4 shouldEnablePlaybackForController:self];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  long long v6 = *(_OWORD *)&a4->index[5];
  long long v17 = *(_OWORD *)&a4->index[3];
  long long v18 = v6;
  long long v19 = *(_OWORD *)&a4->index[7];
  unint64_t v20 = a4->index[9];
  long long v7 = *(_OWORD *)&a4->index[1];
  *(_OWORD *)location = *(_OWORD *)&a4->length;
  long long v16 = v7;
  if ([(PXPhotosDetailsInlinePlaybackController *)self _isRecognizedTileIdentifier:location])
  {
    id v8 = [a3 imageRequester];
    id v9 = [v8 asset];

    [(PXGridInlinePlaybackController *)self willCheckInPlaybackRecordForDisplayAsset:v9];
    objc_initWeak(location, self);
    recordCreationQueue = self->_recordCreationQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__PXPhotosDetailsInlinePlaybackController_checkInTile_withIdentifier___block_invoke;
    v12[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v14, location);
    id v13 = v9;
    id v11 = v9;
    dispatch_async(recordCreationQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

void __70__PXPhotosDetailsInlinePlaybackController_checkInTile_withIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained checkInPlaybackRecordForDisplayAsset:*(void *)(a1 + 32)];
}

- (void)checkOutTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  long long v7 = *(_OWORD *)&a4->index[5];
  id location[2] = *(_OWORD *)&a4->index[3];
  location[3] = v7;
  location[4] = *(_OWORD *)&a4->index[7];
  unint64_t v32 = a4->index[9];
  long long v8 = *(_OWORD *)&a4->index[1];
  location[0] = *(_OWORD *)&a4->length;
  location[1] = v8;
  if ([(PXPhotosDetailsInlinePlaybackController *)self _isRecognizedTileIdentifier:location])
  {
    id v9 = a3;
    double v10 = [v9 imageRequester];
    id v11 = [v10 asset];

    double v12 = [v9 imageRequester];
    id v13 = [v12 mediaProvider];

    objc_initWeak((id *)location, self);
    recordCreationQueue = self->_recordCreationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke;
    block[3] = &unk_1E5DCE3E8;
    objc_copyWeak(&v24, (id *)location);
    id v21 = v11;
    id v22 = v13;
    id v23 = v9;
    long long v15 = *(_OWORD *)&a4->index[5];
    long long v27 = *(_OWORD *)&a4->index[3];
    long long v28 = v15;
    long long v29 = *(_OWORD *)&a4->index[7];
    unint64_t v30 = a4->index[9];
    long long v16 = *(_OWORD *)&a4->index[1];
    long long v25 = *(_OWORD *)&a4->length;
    long long v26 = v16;
    id v17 = v9;
    id v18 = v13;
    id v19 = v11;
    dispatch_async(recordCreationQueue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
}

void __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke_2;
  v9[3] = &__block_descriptor_120_e34_v16__0___PXDetailsPlaybackRecord_8l;
  long long v6 = *(_OWORD *)(a1 + 112);
  long long v12 = *(_OWORD *)(a1 + 96);
  long long v13 = v6;
  long long v14 = *(_OWORD *)(a1 + 128);
  uint64_t v15 = *(void *)(a1 + 144);
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v10 = *(_OWORD *)(a1 + 64);
  long long v11 = v7;
  id v8 = (id)[WeakRetained checkOutPlaybackRecordForDisplayAsset:v3 mediaProvider:v4 geometryReference:v5 configurationBlock:v9];
}

uint64_t __71__PXPhotosDetailsInlinePlaybackController_checkOutTile_withIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 112);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return [a2 setTileIdentifier:v5];
}

- (PXTileIdentifier)_currentTileIdentifierForRecord:(SEL)a3
{
  id v6 = a4;
  long long v7 = v6;
  *(_OWORD *)&retstr->length = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->index[9] = 0;
  if (v6)
  {
    [v6 tileIdentifier];
    id v8 = &retstr->index[1];
    if (!retstr->length) {
      id v8 = (unint64_t *)off_1E5DAAED8;
    }
  }
  else
  {
    id v8 = (unint64_t *)off_1E5DAAED8;
  }
  unint64_t v9 = *v8;
  long long v10 = [(PXPhotosDetailsInlinePlaybackController *)self tilingController];
  long long v11 = [v10 currentLayout];

  if (v9 == *(void *)off_1E5DAAED8
    || ([v11 dataSource],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 identifier],
        v12,
        v13 != v9))
  {
    long long v14 = [(PXPhotosDetailsInlinePlaybackController *)self tilingController];
    uint64_t v15 = [v7 geometryReference];
    if (v14)
    {
      [v14 tileIdentifierForTile:v15];
    }
    else
    {
      unint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
    }
    long long v16 = v26;
    *(_OWORD *)&retstr->index[3] = v25;
    *(_OWORD *)&retstr->index[5] = v16;
    *(_OWORD *)&retstr->index[7] = v27;
    retstr->index[9] = v28;
    long long v17 = v24;
    *(_OWORD *)&retstr->length = v23;
    *(_OWORD *)&retstr->index[1] = v17;

    long long v18 = *(_OWORD *)&retstr->index[5];
    v21[2] = *(_OWORD *)&retstr->index[3];
    v21[3] = v18;
    v21[4] = *(_OWORD *)&retstr->index[7];
    unint64_t v22 = retstr->index[9];
    long long v19 = *(_OWORD *)&retstr->index[1];
    v21[0] = *(_OWORD *)&retstr->length;
    v21[1] = v19;
    [v7 setTileIdentifier:v21];
  }

  return result;
}

- (BOOL)_isRecognizedTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[0] - 6332439 < 3;
}

- (PXPhotosDetailsInlinePlaybackController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsInlinePlaybackController.m", 51, @"%s is not available as initializer", "-[PXPhotosDetailsInlinePlaybackController init]");

  abort();
}

- (PXPhotosDetailsInlinePlaybackController)initWithTilingController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsInlinePlaybackController;
  id v6 = [(PXGridInlinePlaybackController *)&v13 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tilingController, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.details.PlaybackRecordCreation", v9);
    recordCreationQueue = v7->_recordCreationQueue;
    v7->_recordCreationQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

@end