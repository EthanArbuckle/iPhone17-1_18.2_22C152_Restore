@interface PUAssetSharedViewModelChange
- (BOOL)deferredProcessingNeededChanged;
- (BOOL)flippingFullSizeRenderStateChanged;
- (BOOL)hasChanges;
- (BOOL)loadingStatusChanged;
- (BOOL)needsDeferredProcessingChanged;
- (BOOL)saveProgressChanged;
- (BOOL)saveStateChanged;
- (void)setDeferredProcessingNeededChanged:(BOOL)a3;
- (void)setFlippingFullSizeRenderStateChanged:(BOOL)a3;
- (void)setLoadingStatusChanged:(BOOL)a3;
- (void)setNeedsDeferredProcessingChanged:(BOOL)a3;
- (void)setSaveProgressChanged:(BOOL)a3;
- (void)setSaveStateChanged:(BOOL)a3;
@end

@implementation PUAssetSharedViewModelChange

- (void)setFlippingFullSizeRenderStateChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

- (BOOL)flippingFullSizeRenderStateChanged
{
  return *(&self->super._hasChanges + 6);
}

- (void)setDeferredProcessingNeededChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)deferredProcessingNeededChanged
{
  return *(&self->super._hasChanges + 5);
}

- (void)setNeedsDeferredProcessingChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)needsDeferredProcessingChanged
{
  return *(&self->super._hasChanges + 4);
}

- (void)setSaveStateChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)saveStateChanged
{
  return *(&self->super._hasChanges + 3);
}

- (void)setSaveProgressChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)saveProgressChanged
{
  return *(&self->super._hasChanges + 2);
}

- (void)setLoadingStatusChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)loadingStatusChanged
{
  return *(&self->super._hasChanges + 1);
}

- (BOOL)hasChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetSharedViewModelChange;
  return [(PUViewModelChange *)&v4 hasChanges]
      || [(PUAssetSharedViewModelChange *)self loadingStatusChanged]
      || [(PUAssetSharedViewModelChange *)self saveProgressChanged]
      || [(PUAssetSharedViewModelChange *)self saveStateChanged]
      || [(PUAssetSharedViewModelChange *)self needsDeferredProcessingChanged]
      || [(PUAssetSharedViewModelChange *)self deferredProcessingNeededChanged]
      || [(PUAssetSharedViewModelChange *)self flippingFullSizeRenderStateChanged];
}

@end