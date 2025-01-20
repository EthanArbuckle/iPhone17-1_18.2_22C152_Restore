@interface PXWorkaroundSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)shouldWorkAround102440195;
- (BOOL)shouldWorkAround104295292;
- (BOOL)shouldWorkAround128269285;
- (BOOL)shouldWorkAround133571598;
- (BOOL)shouldWorkAround53118165;
- (BOOL)shouldWorkAround92398340;
- (id)parentSettings;
- (int64_t)version;
- (void)setDefaultValues;
- (void)setShouldWorkAround102440195:(BOOL)a3;
- (void)setShouldWorkAround104295292:(BOOL)a3;
- (void)setShouldWorkAround128269285:(BOOL)a3;
- (void)setShouldWorkAround133571598:(BOOL)a3;
- (void)setShouldWorkAround53118165:(BOOL)a3;
- (void)setShouldWorkAround92398340:(BOOL)a3;
@end

@implementation PXWorkaroundSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PXWorkaroundSettings;
  [(PTSettings *)&v5 setDefaultValues];
  if (PXIsOLEDDevice_onceToken != -1) {
    dispatch_once(&PXIsOLEDDevice_onceToken, &__block_literal_global_31804);
  }
  if (PXIsOLEDDevice_isOLEDDevice)
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v3 = [v4 userInterfaceIdiom] == 0;
  }
  [(PXWorkaroundSettings *)self setShouldWorkAround53118165:v3];
  [(PXWorkaroundSettings *)self setShouldWorkAround92398340:1];
  [(PXWorkaroundSettings *)self setShouldWorkAround102440195:1];
  [(PXWorkaroundSettings *)self setShouldWorkAround104295292:1];
  [(PXWorkaroundSettings *)self setShouldWorkAround128269285:1];
  [(PXWorkaroundSettings *)self setShouldWorkAround133571598:1];
}

- (void)setShouldWorkAround92398340:(BOOL)a3
{
  self->_shouldWorkAround92398340 = a3;
}

- (void)setShouldWorkAround53118165:(BOOL)a3
{
  self->_shouldWorkAround53118165 = a3;
}

- (void)setShouldWorkAround133571598:(BOOL)a3
{
  self->_shouldWorkAround133571598 = a3;
}

- (void)setShouldWorkAround128269285:(BOOL)a3
{
  self->_shouldWorkAround128269285 = a3;
}

- (void)setShouldWorkAround104295292:(BOOL)a3
{
  self->_shouldWorkAround104295292 = a3;
}

- (void)setShouldWorkAround102440195:(BOOL)a3
{
  self->_shouldWorkAround102440195 = a3;
}

- (BOOL)shouldWorkAround133571598
{
  return self->_shouldWorkAround133571598;
}

- (BOOL)shouldWorkAround128269285
{
  return self->_shouldWorkAround128269285;
}

- (BOOL)shouldWorkAround104295292
{
  return self->_shouldWorkAround104295292;
}

- (BOOL)shouldWorkAround102440195
{
  return self->_shouldWorkAround102440195;
}

- (BOOL)shouldWorkAround92398340
{
  return self->_shouldWorkAround92398340;
}

- (BOOL)shouldWorkAround53118165
{
  return self->_shouldWorkAround53118165;
}

- (int64_t)version
{
  return 1;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_85599 != -1) {
    dispatch_once(&sharedInstance_onceToken_85599, &__block_literal_global_85600);
  }
  v2 = (void *)sharedInstance_sharedInstance_85601;
  return v2;
}

void __38__PXWorkaroundSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 workaroundSettings];
  v1 = (void *)sharedInstance_sharedInstance_85601;
  sharedInstance_sharedInstance_85601 = v0;
}

+ (id)settingsControllerModule
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  BOOL v3 = (void *)MEMORY[0x1E4F941F0];
  v26 = NSStringFromSelector(sel_shouldWorkAround53118165);
  v25 = [v3 rowWithTitle:@"53118165" valueKeyPath:v26];
  v27[0] = v25;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v24 = NSStringFromSelector(sel_shouldWorkAround92398340);
  v23 = [v4 rowWithTitle:@"92398340" valueKeyPath:v24];
  v27[1] = v23;
  objc_super v5 = (void *)MEMORY[0x1E4F941F0];
  v22 = NSStringFromSelector(sel_shouldWorkAround102440195);
  v21 = [v5 rowWithTitle:@"102440195" valueKeyPath:v22];
  v27[2] = v21;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v20 = NSStringFromSelector(sel_shouldWorkAround104295292);
  v7 = [v6 rowWithTitle:@"104295292" valueKeyPath:v20];
  v27[3] = v7;
  v8 = (void *)MEMORY[0x1E4F941F0];
  v9 = NSStringFromSelector(sel_shouldWorkAround128269285);
  v10 = [v8 rowWithTitle:@"128269285 (status bar & safe area inset)" valueKeyPath:v9];
  v27[4] = v10;
  v11 = (void *)MEMORY[0x1E4F941F0];
  v12 = NSStringFromSelector(sel_shouldWorkAround133571598);
  v13 = [v11 rowWithTitle:@"133571598 @Observable property twice" valueKeyPath:v12];
  v27[5] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];
  v15 = [v2 sectionWithRows:v14];
  v28[0] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v28[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v18 = [v2 moduleWithTitle:@"Workarounds" contents:v17];

  return v18;
}

@end