@interface PXModelSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (double)photoAnalysisGraphInitialGraceDelay;
- (double)photoAnalysisGraphProgressUpdateInterval;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setPhotoAnalysisGraphInitialGraceDelay:(double)a3;
- (void)setPhotoAnalysisGraphProgressUpdateInterval:(double)a3;
@end

@implementation PXModelSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXModelSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXModelSettings *)self setPhotoAnalysisGraphInitialGraceDelay:0.4];
  [(PXModelSettings *)self setPhotoAnalysisGraphProgressUpdateInterval:0.5];
}

- (void)setPhotoAnalysisGraphProgressUpdateInterval:(double)a3
{
  self->_photoAnalysisGraphProgressUpdateInterval = a3;
}

- (void)setPhotoAnalysisGraphInitialGraceDelay:(double)a3
{
  self->_photoAnalysisGraphInitialGraceDelay = a3;
}

- (double)photoAnalysisGraphProgressUpdateInterval
{
  return self->_photoAnalysisGraphProgressUpdateInterval;
}

- (double)photoAnalysisGraphInitialGraceDelay
{
  return self->_photoAnalysisGraphInitialGraceDelay;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32641 != -1) {
    dispatch_once(&sharedInstance_onceToken_32641, &__block_literal_global_32642);
  }
  v2 = (void *)sharedInstance_sharedInstance_32643;
  return v2;
}

void __33__PXModelSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 model];
  v1 = (void *)sharedInstance_sharedInstance_32643;
  sharedInstance_sharedInstance_32643 = v0;
}

+ (id)settingsControllerModule
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Initial Grace Delay" valueKeyPath:@"photoAnalysisGraphInitialGraceDelay"];
  v4 = [v3 minValue:0.0 maxValue:2.0];
  v5 = objc_msgSend(v4, "px_increment:", 0.1);
  v17[0] = v5;
  v6 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Progress Update Interval" valueKeyPath:@"photoAnalysisGraphProgressUpdateInterval"];
  v7 = [v6 minValue:0.0 maxValue:1.0];
  v8 = objc_msgSend(v7, "px_increment:", 0.1);
  v17[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v10 = [v2 sectionWithRows:v9 title:@"Photo Analysis Graph"];

  v11 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v12 = (void *)MEMORY[0x1E4F94160];
  v16[0] = v10;
  v16[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v14 = [v12 moduleWithTitle:@"Model" contents:v13];

  return v14;
}

@end