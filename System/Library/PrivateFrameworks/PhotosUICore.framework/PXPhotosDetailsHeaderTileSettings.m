@interface PXPhotosDetailsHeaderTileSettings
+ (PXPhotosDetailsHeaderTileSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)showAlways;
- (double)aspectRatio;
- (double)maximumAbsoluteHeight;
- (double)maximumHeightRelativeToScreenHeight;
- (id)parentSettings;
- (void)setAspectRatio:(double)a3;
- (void)setDefaultValues;
- (void)setMaximumAbsoluteHeight:(double)a3;
- (void)setMaximumHeightRelativeToScreenHeight:(double)a3;
- (void)setShowAlways:(BOOL)a3;
@end

@implementation PXPhotosDetailsHeaderTileSettings

- (void)setDefaultValues
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsHeaderTileSettings;
  [(PTSettings *)&v6 setDefaultValues];
  [(PXPhotosDetailsHeaderTileSettings *)self setAspectRatio:1.77777779];
  [(PXPhotosDetailsHeaderTileSettings *)self setMaximumHeightRelativeToScreenHeight:0.666666687];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 400.0;
  if (v4 == 2) {
    double v5 = 720.0;
  }
  [(PXPhotosDetailsHeaderTileSettings *)self setMaximumAbsoluteHeight:v5];
  [(PXPhotosDetailsHeaderTileSettings *)self setShowAlways:1];
}

- (void)setShowAlways:(BOOL)a3
{
  self->_showAlways = a3;
}

- (void)setMaximumHeightRelativeToScreenHeight:(double)a3
{
  self->_maximumHeightRelativeToScreenHeight = a3;
}

- (void)setMaximumAbsoluteHeight:(double)a3
{
  self->_maximumAbsoluteHeight = a3;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

+ (id)settingsControllerModule
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Aspect Ratio" valueKeyPath:@"aspectRatio"];
  uint64_t v4 = [v3 minValue:1.0 maxValue:3.0];
  v19[0] = v4;
  double v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Height (Relative to Screen)" valueKeyPath:@"maximumHeightRelativeToScreenHeight"];
  objc_super v6 = [v5 minValue:0.0 maxValue:1.0];
  v19[1] = v6;
  v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Absolute Height" valueKeyPath:@"maximumAbsoluteHeight"];
  v8 = [v7 minValue:0.0 maxValue:2000.0];
  v9 = objc_msgSend(v8, "px_increment:", 10.0);
  v19[2] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Always" valueKeyPath:@"showAlways"];
  v19[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v12 = [v2 sectionWithRows:v11 title:@"Settings"];

  v13 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v14 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v12;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"Photos Details Header Tile" contents:v15];

  return v16;
}

- (BOOL)showAlways
{
  return self->_showAlways;
}

- (double)maximumAbsoluteHeight
{
  return self->_maximumAbsoluteHeight;
}

- (double)maximumHeightRelativeToScreenHeight
{
  return self->_maximumHeightRelativeToScreenHeight;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXPhotosDetailsHeaderTileSettings)sharedInstance
{
  if (sharedInstance_onceToken_218683 != -1) {
    dispatch_once(&sharedInstance_onceToken_218683, &__block_literal_global_218684);
  }
  v2 = (void *)sharedInstance_sharedInstance_218685;
  return (PXPhotosDetailsHeaderTileSettings *)v2;
}

void __51__PXPhotosDetailsHeaderTileSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 photosDetailsHeaderTile];
  v1 = (void *)sharedInstance_sharedInstance_218685;
  sharedInstance_sharedInstance_218685 = v0;
}

@end