@interface PXMacSyncedAlbumsSettings
+ (PXMacSyncedAlbumsSettings)sharedInstance;
+ (id)settingsControllerModule;
- (id)parentSettings;
- (int64_t)simulationMode;
- (void)setDefaultValues;
- (void)setSimulationMode:(int64_t)a3;
@end

@implementation PXMacSyncedAlbumsSettings

+ (PXMacSyncedAlbumsSettings)sharedInstance
{
  if (sharedInstance_onceToken_197487 != -1) {
    dispatch_once(&sharedInstance_onceToken_197487, &__block_literal_global_197488);
  }
  v2 = (void *)sharedInstance_sharedInstance_197489;
  return (PXMacSyncedAlbumsSettings *)v2;
}

- (int64_t)simulationMode
{
  return self->_simulationMode;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXMacSyncedAlbumsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXMacSyncedAlbumsSettings *)self setSimulationMode:0];
}

- (void)setSimulationMode:(int64_t)a3
{
  self->_simulationMode = a3;
}

void __43__PXMacSyncedAlbumsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 macSyncedAlbumsSettings];
  v1 = (void *)sharedInstance_sharedInstance_197489;
  sharedInstance_sharedInstance_197489 = v0;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v4 = (void *)MEMORY[0x1E4F94108];
  v5 = NSStringFromSelector(sel_simulationMode);
  v6 = [v4 rowWithTitle:@"Simulation" valueKeyPath:v5];
  v7 = [v6 possibleValues:&unk_1F02D4D68 titles:&unk_1F02D4D80];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v9 = [v3 sectionWithRows:v8 title:@"General"];
  [v2 addObject:v9];

  v10 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Mac Synced Albums" contents:v2];

  return v10;
}

@end