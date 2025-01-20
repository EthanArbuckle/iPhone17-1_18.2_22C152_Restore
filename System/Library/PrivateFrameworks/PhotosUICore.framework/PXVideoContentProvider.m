@interface PXVideoContentProvider
- (BOOL)mayContainAudio;
- (ISWrappedAVAudioSession)audioSession;
- (NSDictionary)analyticsPayload;
- (NSNumber)videoAspectRatio;
- (NSString)contentIdentifier;
- (PXVideoContentProviderLoadingResult)loadingResult;
- (double)loadingProgress;
- (void)beginLoadingWithPriority:(int64_t)a3;
- (void)cancelLoading;
- (void)makeUniqueContentIdentifier;
- (void)setLoadingProgress:(double)a3;
- (void)setLoadingResult:(id)a3;
- (void)setVideoAspectRatio:(id)a3;
@end

@implementation PXVideoContentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_videoAspectRatio, 0);
  objc_storeStrong((id *)&self->_loadingResult, 0);
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setVideoAspectRatio:(id)a3
{
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (PXVideoContentProviderLoadingResult)loadingResult
{
  return self->_loadingResult;
}

- (NSNumber)videoAspectRatio
{
  v2 = [(PXVideoContentProvider *)self loadingResult];
  v3 = [v2 playerItem];

  if (v3)
  {
    [v3 presentationSize];
    PXSizeIsEmpty();
  }

  return (NSNumber *)0;
}

- (NSDictionary)analyticsPayload
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (void)setLoadingResult:(id)a3
{
  v5 = (PXVideoContentProviderLoadingResult *)a3;
  if (self->_loadingResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_loadingResult, a3);
    [(PXVideoContentProvider *)self signalChange:1];
    v5 = v6;
  }
}

- (void)setLoadingProgress:(double)a3
{
}

- (void)cancelLoading
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXVideoContentProvider.m", 40, @"Method %s is a responsibility of subclass %@", "-[PXVideoContentProvider cancelLoading]", v6 object file lineNumber description];

  abort();
}

- (void)beginLoadingWithPriority:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXVideoContentProvider.m", 36, @"Method %s is a responsibility of subclass %@", "-[PXVideoContentProvider beginLoadingWithPriority:]", v7 object file lineNumber description];

  abort();
}

- (void)makeUniqueContentIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXVideoContentProvider.m", 32, @"Method %s is a responsibility of subclass %@", "-[PXVideoContentProvider makeUniqueContentIdentifier]", v6 object file lineNumber description];

  abort();
}

- (BOOL)mayContainAudio
{
  return 1;
}

@end