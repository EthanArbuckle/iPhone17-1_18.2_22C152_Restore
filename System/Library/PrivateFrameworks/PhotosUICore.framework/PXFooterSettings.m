@interface PXFooterSettings
+ (PXFooterSettings)sharedInstance;
+ (id)settingsControllerModule;
+ (void)resetLastShownInfo;
- (BOOL)shouldAlternateTitleWithGridCycle;
- (BOOL)showFilterView;
- (BOOL)simulateAnimatedIconMode;
- (BOOL)simulateDisplayedProgress;
- (BOOL)simulateImportantInformation;
- (double)alternateTitleCyclingInterval;
- (double)alternateTitleGridCycleDelay;
- (double)animationDelay;
- (float)minimumDisplayedProgress;
- (float)simulatedProgressValue;
- (id)parentSettings;
- (int64_t)alternateTitleGridCycleCount;
- (int64_t)simulatedAnimatedIconMode;
- (void)setAlternateTitleCyclingInterval:(double)a3;
- (void)setAlternateTitleGridCycleCount:(int64_t)a3;
- (void)setAlternateTitleGridCycleDelay:(double)a3;
- (void)setAnimationDelay:(double)a3;
- (void)setDefaultValues;
- (void)setMinimumDisplayedProgress:(float)a3;
- (void)setShouldAlternateTitleWithGridCycle:(BOOL)a3;
- (void)setShowFilterView:(BOOL)a3;
- (void)setSimulateAnimatedIconMode:(BOOL)a3;
- (void)setSimulateDisplayedProgress:(BOOL)a3;
- (void)setSimulateImportantInformation:(BOOL)a3;
- (void)setSimulatedAnimatedIconMode:(int64_t)a3;
- (void)setSimulatedProgressValue:(float)a3;
@end

@implementation PXFooterSettings

- (BOOL)simulateDisplayedProgress
{
  return self->_simulateDisplayedProgress;
}

+ (PXFooterSettings)sharedInstance
{
  if (sharedInstance_onceToken_194684 != -1) {
    dispatch_once(&sharedInstance_onceToken_194684, &__block_literal_global_194685);
  }
  v2 = (void *)sharedInstance_sharedInstance_194686;
  return (PXFooterSettings *)v2;
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PXFooterSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(PXFooterSettings *)self setShouldAlternateTitleWithGridCycle:1];
  [(PXFooterSettings *)self setAlternateTitleGridCycleCount:2];
  [(PXFooterSettings *)self setAlternateTitleGridCycleDelay:0.1];
  [(PXFooterSettings *)self setAlternateTitleCyclingInterval:4.0];
  [(PXFooterSettings *)self setAnimationDelay:2.0];
  LODWORD(v3) = 1036831949;
  [(PXFooterSettings *)self setMinimumDisplayedProgress:v3];
  [(PXFooterSettings *)self setSimulateImportantInformation:0];
  [(PXFooterSettings *)self setSimulateAnimatedIconMode:0];
  [(PXFooterSettings *)self setSimulatedAnimatedIconMode:0];
  [(PXFooterSettings *)self setSimulateDisplayedProgress:0];
  LODWORD(v4) = 1051260355;
  [(PXFooterSettings *)self setSimulatedProgressValue:v4];
  [(PXFooterSettings *)self setShowFilterView:1];
}

- (void)setSimulatedProgressValue:(float)a3
{
  self->_simulatedProgressValue = a3;
}

- (void)setSimulatedAnimatedIconMode:(int64_t)a3
{
  self->_simulatedAnimatedIconMode = a3;
}

- (void)setSimulateImportantInformation:(BOOL)a3
{
  self->_simulateImportantInformation = a3;
}

- (void)setSimulateDisplayedProgress:(BOOL)a3
{
  self->_simulateDisplayedProgress = a3;
}

- (void)setSimulateAnimatedIconMode:(BOOL)a3
{
  self->_simulateAnimatedIconMode = a3;
}

- (void)setShowFilterView:(BOOL)a3
{
  self->_showFilterView = a3;
}

- (void)setShouldAlternateTitleWithGridCycle:(BOOL)a3
{
  self->_shouldAlternateTitleWithGridCycle = a3;
}

- (void)setMinimumDisplayedProgress:(float)a3
{
  self->_minimumDisplayedProgress = a3;
}

- (void)setAnimationDelay:(double)a3
{
  self->_animationDelay = a3;
}

- (void)setAlternateTitleGridCycleDelay:(double)a3
{
  self->_alternateTitleGridCycleDelay = a3;
}

- (void)setAlternateTitleGridCycleCount:(int64_t)a3
{
  self->_alternateTitleGridCycleCount = a3;
}

- (void)setAlternateTitleCyclingInterval:(double)a3
{
  self->_alternateTitleCyclingInterval = a3;
}

void __34__PXFooterSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 footerSettings];
  v1 = (void *)sharedInstance_sharedInstance_194686;
  sharedInstance_sharedInstance_194686 = v0;
}

+ (id)settingsControllerModule
{
  v53[8] = *MEMORY[0x1E4F143B8];
  v43 = (void *)MEMORY[0x1E4F94160];
  v49 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Alt. Title with Grids" valueKeyPath:@"shouldAlternateTitleWithGridCycle"];
  v53[0] = v49;
  v47 = [MEMORY[0x1E4F94108] rowWithTitle:@"Alt. Titles Grid Cycle" valueKeyPath:@"alternateTitleGridCycleCount"];
  v45 = objc_msgSend(MEMORY[0x1E4F1C978], "px_integersFrom:to:", 1, 4);
  v42 = objc_msgSend(v47, "px_possibleValues:", v45);
  v41 = [v42 conditionFormat:@"shouldAlternateTitleWithGridCycle != 0"];
  v53[1] = v41;
  v40 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Alt. Titles Delay" valueKeyPath:@"alternateTitleGridCycleDelay"];
  v39 = [v40 minValue:0.0 maxValue:0.5];
  v38 = objc_msgSend(v39, "px_increment:", 0.01);
  v37 = [v38 conditionFormat:@"shouldAlternateTitleWithGridCycle != 0"];
  v53[2] = v37;
  v36 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Alt. Titles Interval" valueKeyPath:@"alternateTitleCyclingInterval"];
  v35 = [v36 minValue:0.0 maxValue:5.0];
  v34 = objc_msgSend(v35, "px_increment:", 0.2);
  v33 = [v34 conditionFormat:@"shouldAlternateTitleWithGridCycle == 0"];
  v53[3] = v33;
  v32 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Animation Delay" valueKeyPath:@"animationDelay"];
  id v2 = [v32 minValue:0.0 maxValue:5.0];
  double v3 = objc_msgSend(v2, "px_increment:", 0.2);
  v53[4] = v3;
  double v4 = (void *)MEMORY[0x1E4F940F8];
  objc_super v5 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_73185];
  v6 = [v4 rowWithTitle:@"Reset Last Shown Info" action:v5];
  v53[5] = v6;
  v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Minimum Progress" valueKeyPath:@"minimumDisplayedProgress"];
  v8 = [v7 minValue:0.0 maxValue:1.0];
  v9 = objc_msgSend(v8, "px_increment:", 0.01);
  v53[6] = v9;
  v10 = (void *)MEMORY[0x1E4F941F0];
  v11 = NSStringFromSelector(sel_showFilterView);
  v12 = [v10 rowWithTitle:@"Show Filter View" valueKeyPath:v11];
  v53[7] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:8];
  v44 = [v43 sectionWithRows:v13 title:@"Settings"];

  v14 = (void *)MEMORY[0x1E4F94160];
  v50 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Important Information" valueKeyPath:@"simulateImportantInformation"];
  v52[0] = v50;
  v48 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Animated Icon Mode" valueKeyPath:@"simulateAnimatedIconMode"];
  v52[1] = v48;
  v46 = [MEMORY[0x1E4F94108] rowWithTitle:@"Animated Icon Mode" valueKeyPath:@"simulatedAnimatedIconMode"];
  v15 = [v46 possibleValues:&unk_1F02D3D60 titles:&unk_1F02D3D78];
  v16 = [v15 conditionFormat:@"simulateAnimatedIconMode != 0"];
  v52[2] = v16;
  v17 = (void *)MEMORY[0x1E4F941F0];
  v18 = NSStringFromSelector(sel_simulateDisplayedProgress);
  v19 = [v17 rowWithTitle:@"Display Progress" valueKeyPath:v18];
  v52[3] = v19;
  v20 = (void *)MEMORY[0x1E4F941D8];
  v21 = NSStringFromSelector(sel_simulatedProgressValue);
  v22 = [v20 rowWithTitle:@"Progress Value" valueKeyPath:v21];
  v23 = [v22 minValue:0.0 maxValue:1.0];
  v24 = objc_msgSend(v23, "px_increment:", 0.1);
  v52[4] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
  v26 = [v14 sectionWithRows:v25 title:@"Simulate"];

  v27 = (void *)MEMORY[0x1E4F94160];
  v51[0] = v44;
  v51[1] = v26;
  v28 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v51[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
  v30 = [v27 moduleWithTitle:@"Footer" contents:v29];

  return v30;
}

uint64_t __48__PXFooterSettings_UI__settingsControllerModule__block_invoke()
{
  return 1;
}

- (BOOL)showFilterView
{
  return self->_showFilterView;
}

- (float)simulatedProgressValue
{
  return self->_simulatedProgressValue;
}

- (int64_t)simulatedAnimatedIconMode
{
  return self->_simulatedAnimatedIconMode;
}

- (BOOL)simulateAnimatedIconMode
{
  return self->_simulateAnimatedIconMode;
}

- (BOOL)simulateImportantInformation
{
  return self->_simulateImportantInformation;
}

- (float)minimumDisplayedProgress
{
  return self->_minimumDisplayedProgress;
}

- (double)animationDelay
{
  return self->_animationDelay;
}

- (double)alternateTitleCyclingInterval
{
  return self->_alternateTitleCyclingInterval;
}

- (double)alternateTitleGridCycleDelay
{
  return self->_alternateTitleGridCycleDelay;
}

- (int64_t)alternateTitleGridCycleCount
{
  return self->_alternateTitleGridCycleCount;
}

- (BOOL)shouldAlternateTitleWithGridCycle
{
  return self->_shouldAlternateTitleWithGridCycle;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (void)resetLastShownInfo
{
  id v2 = +[PXUserDefaults standardUserDefaults];
  [v2 setDidShowCurationFooter:0];
  [v2 setDidShowCompletedCurationFooterAnimation:0];
}

@end