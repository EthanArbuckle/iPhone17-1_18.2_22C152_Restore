@interface PXVolumeController
- (BOOL)isInSilentMode;
- (PXVolumeController)init;
- (PXVolumeController)initWithIsInSilentMode:(BOOL)a3;
- (void)decreaseVolume;
- (void)increaseVolume;
- (void)performChanges:(id)a3;
- (void)setIsInSilentMode:(BOOL)a3;
@end

@implementation PXVolumeController

- (BOOL)isInSilentMode
{
  return self->_isInSilentMode;
}

- (void)decreaseVolume
{
}

- (void)increaseVolume
{
}

- (void)setIsInSilentMode:(BOOL)a3
{
  if (self->_isInSilentMode != a3)
  {
    self->_isInSilentMode = a3;
    [(PXVolumeController *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVolumeController.m", 33, @"%s must be called on the main thread", "-[PXVolumeController performChanges:]");
  }
  v7.receiver = self;
  v7.super_class = (Class)PXVolumeController;
  [(PXVolumeController *)&v7 performChanges:v5];
}

- (PXVolumeController)initWithIsInSilentMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXVolumeController;
  result = [(PXVolumeController *)&v5 init];
  if (result) {
    result->_isInSilentMode = a3;
  }
  return result;
}

- (PXVolumeController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVolumeController.m", 21, @"%s is not available as initializer", "-[PXVolumeController init]");

  abort();
}

@end