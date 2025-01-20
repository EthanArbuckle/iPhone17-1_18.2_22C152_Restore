@interface PXGVideoPlayerViewConfiguration
- (BOOL)toneMapToStandardDynamicRange;
- (PXGVideoPlayerViewConfiguration)init;
- (PXGVideoPlayerViewConfiguration)initWithVideoSession:(id)a3 toneMapToStandardDynamicRange:(BOOL)a4;
- (PXVideoSession)videoSession;
@end

@implementation PXGVideoPlayerViewConfiguration

- (void).cxx_destruct
{
}

- (BOOL)toneMapToStandardDynamicRange
{
  return self->_toneMapToStandardDynamicRange;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (PXGVideoPlayerViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGVideoPlayerView.m", 92, @"%s is not available as initializer", "-[PXGVideoPlayerViewConfiguration init]");

  abort();
}

- (PXGVideoPlayerViewConfiguration)initWithVideoSession:(id)a3 toneMapToStandardDynamicRange:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGVideoPlayerViewConfiguration;
  v8 = [(PXGVideoPlayerViewConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_videoSession, a3);
    v9->_toneMapToStandardDynamicRange = a4;
  }

  return v9;
}

@end