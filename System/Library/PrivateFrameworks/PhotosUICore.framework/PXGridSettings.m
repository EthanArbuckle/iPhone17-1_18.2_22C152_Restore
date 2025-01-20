@interface PXGridSettings
+ (PXGridSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)disableSelectionOverlayView;
- (BOOL)enableAutomaticTransitionToSelectMode;
- (BOOL)simulateLongTitles;
- (id)parentSettings;
- (int64_t)simulatedNumberOfLocations;
- (int64_t)weightingScheme;
- (void)setDefaultValues;
- (void)setDisableSelectionOverlayView:(BOOL)a3;
- (void)setEnableAutomaticTransitionToSelectMode:(BOOL)a3;
- (void)setSimulateLongTitles:(BOOL)a3;
- (void)setSimulatedNumberOfLocations:(int64_t)a3;
- (void)setWeightingScheme:(int64_t)a3;
@end

@implementation PXGridSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXGridSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXGridSettings *)self setDisableSelectionOverlayView:0];
  [(PXGridSettings *)self setWeightingScheme:0];
  [(PXGridSettings *)self setEnableAutomaticTransitionToSelectMode:0];
  [(PXGridSettings *)self setSimulateLongTitles:0];
  [(PXGridSettings *)self setSimulatedNumberOfLocations:0];
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (void)setSimulatedNumberOfLocations:(int64_t)a3
{
  self->_simulatedNumberOfLocations = a3;
}

- (void)setSimulateLongTitles:(BOOL)a3
{
  self->_simulateLongTitles = a3;
}

- (void)setEnableAutomaticTransitionToSelectMode:(BOOL)a3
{
  self->_enableAutomaticTransitionToSelectMode = a3;
}

- (void)setDisableSelectionOverlayView:(BOOL)a3
{
  self->_disableSelectionOverlayView = a3;
}

+ (id)settingsControllerModule
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Selection Overlay" valueKeyPath:@"disableSelectionOverlayView"];
  v21[0] = v19;
  objc_super v3 = [MEMORY[0x1E4F94108] rowWithTitle:@"Layout Weight" valueKeyPath:@"weightingScheme"];
  v4 = [v3 possibleValues:&unk_1F02D4138 titles:&unk_1F02D4150];
  v21[1] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Automatic Transition To Select Mode" valueKeyPath:@"enableAutomaticTransitionToSelectMode"];
  v21[2] = v5;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v7 = NSStringFromSelector(sel_simulateLongTitles);
  v8 = [v6 rowWithTitle:@"Fake Long Titles" valueKeyPath:v7];
  v21[3] = v8;
  v9 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fake Locations" valueKeyPath:@"simulatedNumberOfLocations"];
  v10 = [v9 minValue:0.0 maxValue:10.0];
  v11 = objc_msgSend(v10, "px_increment:", 1.0);
  v21[4] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  v13 = [v2 sectionWithRows:v12 title:@"Settings"];

  v14 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v15 = (void *)MEMORY[0x1E4F94160];
  v20[0] = v13;
  v20[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v17 = [v15 moduleWithTitle:@"Grid" contents:v16];

  return v17;
}

- (int64_t)simulatedNumberOfLocations
{
  return self->_simulatedNumberOfLocations;
}

- (BOOL)simulateLongTitles
{
  return self->_simulateLongTitles;
}

- (BOOL)enableAutomaticTransitionToSelectMode
{
  return self->_enableAutomaticTransitionToSelectMode;
}

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

- (BOOL)disableSelectionOverlayView
{
  return self->_disableSelectionOverlayView;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXGridSettings)sharedInstance
{
  if (sharedInstance_onceToken_114666 != -1) {
    dispatch_once(&sharedInstance_onceToken_114666, &__block_literal_global_114667);
  }
  v2 = (void *)sharedInstance_sharedInstance_114668;
  return (PXGridSettings *)v2;
}

void __32__PXGridSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 grid];
  v1 = (void *)sharedInstance_sharedInstance_114668;
  sharedInstance_sharedInstance_114668 = v0;
}

@end