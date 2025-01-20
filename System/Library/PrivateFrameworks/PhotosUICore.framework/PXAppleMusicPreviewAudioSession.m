@interface PXAppleMusicPreviewAudioSession
- (PXAppleMusicPreviewAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (void)_handleRequestedAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6;
- (void)_handleValuesLoadedForAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6;
- (void)cancelMediaRequest;
- (void)requestMediaWithResultHandler:(id)a3;
@end

@implementation PXAppleMusicPreviewAudioSession

- (void)_handleValuesLoadedForAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6
{
  self->_requestID = 0;
  (*((void (**)(id, id, id, id))a6 + 2))(a6, a3, a4, a5);
}

- (void)_handleRequestedAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v10)
  {
    v10;
    PXExists();
  }
  self->_requestID = 0;
  (*((void (**)(id, void, id, id))v13 + 2))(v13, 0, v11, v12);
}

BOOL __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) statusOfValueForKey:a2 error:0] != 2;
}

void __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke_7(uint64_t a1)
{
  PLAudioPlaybackGetLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v2, OS_SIGNPOST_INTERVAL_END, v4, "PXAppleMusicPreviewAudioSessionLoadAssetKeys", " enableTelemetry=YES ", v6, 2u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleValuesLoadedForAsset:*(void *)(a1 + 40) audioMix:*(void *)(a1 + 48) info:*(void *)(a1 + 56) resultHandler:*(void *)(a1 + 64)];
}

- (void)cancelMediaRequest
{
  id v3 = +[PXAppleMusicMediaProvider sharedInstance];
  [v3 cancelRequest:self->_requestID];
}

- (void)requestMediaWithResultHandler:(id)a3
{
  id v4 = a3;
  if (!self->_requestID)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(PXAudioRequestOptions);
    [(PXAudioRequestOptions *)v5 setIntent:1];
    CMTimeMakeWithSeconds(&v18, 1.0, PXAudioDefaultCMTimeScale);
    CMTime v17 = v18;
    [(PXAudioRequestOptions *)v5 setFadeOutDuration:&v17];
    CMTimeMakeWithSeconds(&v16, 30.0, PXAudioDefaultCMTimeScale);
    CMTime v15 = v16;
    [(PXAudioRequestOptions *)v5 setMaximumDuration:&v15];
    PLAudioPlaybackGetLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXAppleMusicPreviewAudioSessionRequestMedia", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v9 = +[PXAppleMusicMediaProvider sharedInstance];
    id v10 = [(PXAudioSession *)self asset];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PXAppleMusicPreviewAudioSession_requestMediaWithResultHandler___block_invoke;
    v11[3] = &unk_1E5DBBD28;
    v11[4] = self;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    self->_requestID = [v9 requestMediaForAsset:v10 options:v5 resultHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __65__PXAppleMusicPreviewAudioSession_requestMediaWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  PLAudioPlaybackGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXAppleMusicPreviewAudioSessionRequestMedia", " enableTelemetry=YES ", v14, 2u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleRequestedAsset:v9 audioMix:v8 info:v7 resultHandler:*(void *)(a1 + 40)];
}

- (PXAppleMusicPreviewAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicPreviewAudioSession;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  result = -[PXAVPlayerAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v9, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, a3, &v8, a6, a7);
  if (result) {
    result->_requestID = 0;
  }
  return result;
}

@end