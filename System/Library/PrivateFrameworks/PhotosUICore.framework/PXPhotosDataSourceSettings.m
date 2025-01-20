@interface PXPhotosDataSourceSettings
+ (PXPhotosDataSourceSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)disableKeyAssetCuration;
- (BOOL)slowBackgroundFetch;
- (double)delayChanges;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setDelayChanges:(double)a3;
- (void)setDisableKeyAssetCuration:(BOOL)a3;
- (void)setSlowBackgroundFetch:(BOOL)a3;
@end

@implementation PXPhotosDataSourceSettings

+ (PXPhotosDataSourceSettings)sharedInstance
{
  if (sharedInstance_onceToken_212718 != -1) {
    dispatch_once(&sharedInstance_onceToken_212718, &__block_literal_global_212719);
  }
  v2 = (void *)sharedInstance_sharedInstance_212720;
  return (PXPhotosDataSourceSettings *)v2;
}

- (BOOL)disableKeyAssetCuration
{
  return self->_disableKeyAssetCuration;
}

- (BOOL)slowBackgroundFetch
{
  return self->_slowBackgroundFetch;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSourceSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPhotosDataSourceSettings *)self setSlowBackgroundFetch:0];
  [(PXPhotosDataSourceSettings *)self setDisableKeyAssetCuration:0];
  [(PXPhotosDataSourceSettings *)self setDelayChanges:0.0];
}

- (void)setSlowBackgroundFetch:(BOOL)a3
{
  self->_slowBackgroundFetch = a3;
}

- (void)setDisableKeyAssetCuration:(BOOL)a3
{
  self->_disableKeyAssetCuration = a3;
}

- (void)setDelayChanges:(double)a3
{
  self->_delayChanges = a3;
}

void __44__PXPhotosDataSourceSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 photosDataSource];
  v1 = (void *)sharedInstance_sharedInstance_212720;
  sharedInstance_sharedInstance_212720 = v0;
}

+ (id)settingsControllerModule
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v24 = NSStringFromSelector(sel_slowBackgroundFetch);
  v23 = [v3 rowWithTitle:@"Slow Background Fetch" valueKeyPath:v24];
  v26[0] = v23;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v22 = NSStringFromSelector(sel_disableKeyAssetCuration);
  v21 = [v4 rowWithTitle:@"Disable Key Asset Curation" valueKeyPath:v22];
  v26[1] = v21;
  v5 = (void *)MEMORY[0x1E4F941D8];
  v20 = NSStringFromSelector(sel_delayChanges);
  v19 = [v5 rowWithTitle:@"Delay Changes" valueKeyPath:v20];
  v6 = [v19 minValue:0.0 maxValue:60.0];
  v7 = objc_msgSend(v6, "px_increment:", 0.1);
  v26[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v9 = [v2 sectionWithRows:v8 title:@"Data Source"];
  v27[0] = v9;
  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = (void *)MEMORY[0x1E4F940F8];
  v12 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v13 = [v11 rowWithTitle:@"Restore Defaults" action:v12];
  v25 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v15 = [v10 sectionWithRows:v14];
  v27[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v17 = [v2 moduleWithTitle:@"Data Source" contents:v16];

  return v17;
}

- (double)delayChanges
{
  return self->_delayChanges;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end