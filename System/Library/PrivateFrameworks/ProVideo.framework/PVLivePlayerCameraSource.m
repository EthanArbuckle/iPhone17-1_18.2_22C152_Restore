@interface PVLivePlayerCameraSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3;
- (PVLivePlayerCameraSource)init;
- (id)imageBufferForHostTime:(double)a3;
- (void)cameraFrameSetDropped;
- (void)cameraFrameSetRecieved:(id)a3;
- (void)dealloc;
- (void)registerRenderLink:(id)a3;
@end

@implementation PVLivePlayerCameraSource

- (PVLivePlayerCameraSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVLivePlayerCameraSource;
  if ([(PVLivePlayerCameraSource *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  lock = self->_lock;
  if (lock) {
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVLivePlayerCameraSource;
  [(PVLivePlayerCameraSource *)&v4 dealloc];
}

- (void)cameraFrameSetRecieved:(id)a3
{
  id v5 = a3;
  lock = self->_lock;
  char v8 = 0;
  HGSynchronizable::Lock(lock);
  objc_storeStrong((id *)&self->_mostRecentFrameSet, a3);
  v6 = self->_renderLink;
  HGSynchronizer::~HGSynchronizer(&lock);
  if (v6) {
    [(PVLivePlayerCameraRenderLink *)v6 cameraSourceRecievedFrameSet:v5];
  }
}

- (void)cameraFrameSetDropped
{
  lock = self->_lock;
  char v5 = 0;
  HGSynchronizable::Lock(lock);
  objc_super v3 = self->_renderLink;
  HGSynchronizer::~HGSynchronizer(&lock);
  if (v3) {
    [(PVLivePlayerCameraRenderLink *)v3 cameraSourceDroppedFrame];
  }
}

- (void)registerRenderLink:(id)a3
{
  objc_super v4 = (PVLivePlayerCameraRenderLink *)a3;
  lock = self->_lock;
  char v7 = 0;
  HGSynchronizable::Lock(lock);
  renderLink = self->_renderLink;
  self->_renderLink = v4;

  HGSynchronizer::~HGSynchronizer(&lock);
}

- (id)imageBufferForHostTime:(double)a3
{
  lock = self->_lock;
  char v7 = 0;
  HGSynchronizable::Lock(lock);
  objc_super v4 = self->_mostRecentFrameSet;
  HGSynchronizer::~HGSynchronizer(&lock);

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderLink, 0);

  objc_storeStrong((id *)&self->_mostRecentFrameSet, 0);
}

@end