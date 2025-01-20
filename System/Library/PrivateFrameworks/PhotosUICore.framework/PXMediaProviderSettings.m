@interface PXMediaProviderSettings
+ (PXMediaProviderSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)simulateError;
- (BOOL)wantsSimulation;
- (double)simulatedDelay;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setSimulateError:(BOOL)a3;
- (void)setSimulatedDelay:(double)a3;
- (void)setWantsSimulation:(BOOL)a3;
@end

@implementation PXMediaProviderSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXMediaProviderSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXMediaProviderSettings *)self setWantsSimulation:0];
  [(PXMediaProviderSettings *)self setSimulateError:1];
  [(PXMediaProviderSettings *)self setSimulatedDelay:3.0];
}

- (void)setWantsSimulation:(BOOL)a3
{
  self->_wantsSimulation = a3;
}

- (void)setSimulatedDelay:(double)a3
{
  self->_simulatedDelay = a3;
}

- (void)setSimulateError:(BOOL)a3
{
  self->_simulateError = a3;
}

- (double)simulatedDelay
{
  return self->_simulatedDelay;
}

- (BOOL)simulateError
{
  return self->_simulateError;
}

- (BOOL)wantsSimulation
{
  return self->_wantsSimulation;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v19 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v25 = NSStringFromSelector(sel_wantsSimulation);
  v24 = [v3 rowWithTitle:@"Simulation" valueKeyPath:v25];
  v27 = v24;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v22 = [v2 sectionWithRows:v23];
  v28[0] = v22;
  v4 = (void *)MEMORY[0x1E4F94160];
  v5 = (void *)MEMORY[0x1E4F941F0];
  v21 = NSStringFromSelector(sel_simulateError);
  v20 = [v5 rowWithTitle:@"Error" valueKeyPath:v21];
  v26[0] = v20;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v7 = NSStringFromSelector(sel_simulatedDelay);
  v8 = [v6 rowWithTitle:@"Delay" valueKeyPath:v7];
  v9 = [v8 minValue:0.0 maxValue:10.0];
  v26[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = NSStringFromSelector(sel_wantsSimulation);
  v13 = objc_msgSend(v11, "predicateWithFormat:", @"%K != 0", v12);
  v14 = [v4 sectionWithRows:v10 title:@"Simulation" condition:v13];
  v28[1] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v28[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v17 = [v19 moduleWithTitle:@"Media Provider" contents:v16];

  return v17;
}

+ (PXMediaProviderSettings)sharedInstance
{
  if (sharedInstance_onceToken_103882 != -1) {
    dispatch_once(&sharedInstance_onceToken_103882, &__block_literal_global_103883);
  }
  v2 = (void *)sharedInstance_sharedInstance_103884;
  return (PXMediaProviderSettings *)v2;
}

void __41__PXMediaProviderSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 mediaProviderSettings];
  v1 = (void *)sharedInstance_sharedInstance_103884;
  sharedInstance_sharedInstance_103884 = v0;
}

@end