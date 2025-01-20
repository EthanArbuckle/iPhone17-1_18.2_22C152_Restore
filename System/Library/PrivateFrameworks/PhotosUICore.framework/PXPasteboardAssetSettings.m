@interface PXPasteboardAssetSettings
+ (id)sharedInstance;
- (BOOL)alwaysUseDataProviderForObjectReference;
- (BOOL)fileURLEnabled;
- (BOOL)imageDataEnabled;
- (BOOL)synchronousFullSizePreviewEnabled;
- (id)parentSettings;
- (void)setAlwaysUseDataProviderForObjectReference:(BOOL)a3;
- (void)setDefaultValues;
- (void)setFileURLEnabled:(BOOL)a3;
- (void)setImageDataEnabled:(BOOL)a3;
- (void)setSynchronousFullSizePreviewEnabled:(BOOL)a3;
@end

@implementation PXPasteboardAssetSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPasteboardAssetSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPasteboardAssetSettings *)self setFileURLEnabled:1];
  [(PXPasteboardAssetSettings *)self setImageDataEnabled:1];
  [(PXPasteboardAssetSettings *)self setSynchronousFullSizePreviewEnabled:0];
  [(PXPasteboardAssetSettings *)self setAlwaysUseDataProviderForObjectReference:0];
}

- (void)setSynchronousFullSizePreviewEnabled:(BOOL)a3
{
  self->_synchronousFullSizePreviewEnabled = a3;
}

- (void)setImageDataEnabled:(BOOL)a3
{
  self->_imageDataEnabled = a3;
}

- (void)setFileURLEnabled:(BOOL)a3
{
  self->_fileURLEnabled = a3;
}

- (void)setAlwaysUseDataProviderForObjectReference:(BOOL)a3
{
  self->_alwaysUseDataProviderForObjectReference = a3;
}

- (BOOL)synchronousFullSizePreviewEnabled
{
  return self->_synchronousFullSizePreviewEnabled;
}

- (BOOL)alwaysUseDataProviderForObjectReference
{
  return self->_alwaysUseDataProviderForObjectReference;
}

- (BOOL)imageDataEnabled
{
  return self->_imageDataEnabled;
}

- (BOOL)fileURLEnabled
{
  return self->_fileURLEnabled;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_58914 != -1) {
    dispatch_once(&sharedInstance_onceToken_58914, &__block_literal_global_58915);
  }
  v2 = (void *)sharedInstance_sharedInstance_58916;
  return v2;
}

void __43__PXPasteboardAssetSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 dragDropSettings];
  v1 = (void *)sharedInstance_sharedInstance_58916;
  sharedInstance_sharedInstance_58916 = v0;
}

@end