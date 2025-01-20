@interface PXMapSettings
+ (PXMapSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)enableCuratedPlacesAlbumSnapshot;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setEnableCuratedPlacesAlbumSnapshot:(BOOL)a3;
@end

@implementation PXMapSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXMapSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXMapSettings *)self setEnableCuratedPlacesAlbumSnapshot:1];
}

- (void)setEnableCuratedPlacesAlbumSnapshot:(BOOL)a3
{
  self->_enableCuratedPlacesAlbumSnapshot = a3;
}

+ (id)settingsControllerModule
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v4 = NSStringFromSelector(sel_enableCuratedPlacesAlbumSnapshot);
  v5 = [v3 rowWithTitle:@"Enable Curated Places Album Snapshot" valueKeyPath:v4];
  v14[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v7 = [v2 sectionWithRows:v6];

  v8 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v9 = (void *)MEMORY[0x1E4F94160];
  v13[0] = v7;
  v13[1] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v9 moduleWithTitle:@"Maps" contents:v10];

  return v11;
}

- (BOOL)enableCuratedPlacesAlbumSnapshot
{
  return self->_enableCuratedPlacesAlbumSnapshot;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXMapSettings)sharedInstance
{
  if (sharedInstance_onceToken_301306 != -1) {
    dispatch_once(&sharedInstance_onceToken_301306, &__block_literal_global_301307);
  }
  v2 = (void *)sharedInstance_sharedInstance_301308;
  return (PXMapSettings *)v2;
}

void __31__PXMapSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 mapSettings];
  v1 = (void *)sharedInstance_sharedInstance_301308;
  sharedInstance_sharedInstance_301308 = v0;
}

@end