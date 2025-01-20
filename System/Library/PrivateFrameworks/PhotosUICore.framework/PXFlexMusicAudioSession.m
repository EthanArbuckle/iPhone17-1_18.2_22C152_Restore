@interface PXFlexMusicAudioSession
- (PXFlexMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7;
- (int64_t)audioRequestID;
- (void)cancelMediaRequest;
- (void)dealloc;
- (void)requestMediaWithResultHandler:(id)a3;
- (void)setAudioRequestID:(int64_t)a3;
@end

@implementation PXFlexMusicAudioSession

- (void)setAudioRequestID:(int64_t)a3
{
  self->_audioRequestID = a3;
}

- (int64_t)audioRequestID
{
  return self->_audioRequestID;
}

- (void)cancelMediaRequest
{
  id v3 = +[PXFlexMusicMediaProvider sharedInstance];
  objc_msgSend(v3, "cancelRequest:", -[PXFlexMusicAudioSession audioRequestID](self, "audioRequestID"));
}

- (void)requestMediaWithResultHandler:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PXFlexMusicLibrary sharedLibrary];
  v6 = [(PXFlexMusicAudioSession *)self flexMusicAsset];
  char v7 = [v5 hasLocalResourceForAsset:v6 resourceType:2];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E4F56658];
    uint64_t v24 = *MEMORY[0x1E4F56560];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v25[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    [v8 sendEvent:@"com.apple.photos.CPAnalytics.flexMusicDownloadRequiredAtPlaybackTime" withPayload:v11];
  }
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  v12 = [(PXFlexMusicAudioSession *)self flexMusicAsset];
  v13 = v12;
  if (v12)
  {
    [v12 targetDuration];
  }
  else
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
  }

  v14 = objc_alloc_init(PXAudioRequestOptions);
  long long v20 = v22;
  uint64_t v21 = v23;
  [(PXAudioRequestOptions *)v14 setPreferredDuration:&v20];
  v15 = +[PXFlexMusicMediaProvider sharedInstance];
  v16 = [(PXFlexMusicAudioSession *)self flexMusicAsset];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__PXFlexMusicAudioSession_requestMediaWithResultHandler___block_invoke;
  v18[3] = &unk_1E5DB8528;
  id v19 = v4;
  id v17 = v4;
  -[PXFlexMusicAudioSession setAudioRequestID:](self, "setAudioRequestID:", [v15 requestMediaForAsset:v16 options:v14 resultHandler:v18]);
}

uint64_t __57__PXFlexMusicAudioSession_requestMediaWithResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  id v3 = +[PXFlexMusicMediaProvider sharedInstance];
  objc_msgSend(v3, "cancelRequest:", -[PXFlexMusicAudioSession audioRequestID](self, "audioRequestID"));

  v4.receiver = self;
  v4.super_class = (Class)PXFlexMusicAudioSession;
  [(PXAVPlayerAudioSession *)&v4 dealloc];
}

- (PXFlexMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXFlexMusicAudioSession.m", 30, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:PXFlexMusicAsset.class]" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXFlexMusicAudioSession;
  long long v19 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  v16 = [(PXAVPlayerAudioSession *)&v21 initWithAsset:v13 volume:&v19 startTime:v14 queue:v15 audioSessionDelegate:COERCE_DOUBLE(__PAIR64__(DWORD1(v19), LODWORD(a4)))];

  return v16;
}

@end