@interface PXAssetVariationsSettings
+ (PXAssetVariationsSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)addSimulatedProgressComponent;
- (BOOL)invalidateCachedPreviews;
- (BOOL)showLoopBadges;
- (BOOL)showStatusInDisclosureLabel;
- (BOOL)simulateLoadingFailure;
- (BOOL)simulateSavingFailure;
- (BOOL)useLiveRenderedPreviews;
- (BOOL)useNeutrinoRendering;
- (double)selectionDetailsDismissalDelay;
- (id)parentSettings;
- (int64_t)layoutStyle;
- (void)setAddSimulatedProgressComponent:(BOOL)a3;
- (void)setDefaultValues;
- (void)setInvalidateCachedPreviews:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSelectionDetailsDismissalDelay:(double)a3;
- (void)setShowLoopBadges:(BOOL)a3;
- (void)setShowStatusInDisclosureLabel:(BOOL)a3;
- (void)setSimulateLoadingFailure:(BOOL)a3;
- (void)setSimulateSavingFailure:(BOOL)a3;
- (void)setUseLiveRenderedPreviews:(BOOL)a3;
- (void)setUseNeutrinoRendering:(BOOL)a3;
@end

@implementation PXAssetVariationsSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetVariationsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXAssetVariationsSettings *)self setSelectionDetailsDismissalDelay:0.25];
  [(PXAssetVariationsSettings *)self setLayoutStyle:0];
  [(PXAssetVariationsSettings *)self setSimulateLoadingFailure:0];
  [(PXAssetVariationsSettings *)self setUseNeutrinoRendering:1];
  [(PXAssetVariationsSettings *)self setShowStatusInDisclosureLabel:0];
  [(PXAssetVariationsSettings *)self setShowLoopBadges:0];
  [(PXAssetVariationsSettings *)self setInvalidateCachedPreviews:1];
  [(PXAssetVariationsSettings *)self setUseLiveRenderedPreviews:1];
  [(PXAssetVariationsSettings *)self setSimulateSavingFailure:0];
}

- (void)setUseNeutrinoRendering:(BOOL)a3
{
  self->_useNeutrinoRendering = a3;
}

- (void)setUseLiveRenderedPreviews:(BOOL)a3
{
  self->_useLiveRenderedPreviews = a3;
}

- (void)setSimulateSavingFailure:(BOOL)a3
{
  self->_simulateSavingFailure = a3;
}

- (void)setSimulateLoadingFailure:(BOOL)a3
{
  self->_simulateLoadingFailure = a3;
}

- (void)setShowStatusInDisclosureLabel:(BOOL)a3
{
  self->_showStatusInDisclosureLabel = a3;
}

- (void)setShowLoopBadges:(BOOL)a3
{
  self->_showLoopBadges = a3;
}

- (void)setSelectionDetailsDismissalDelay:(double)a3
{
  self->_selectionDetailsDismissalDelay = a3;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)setInvalidateCachedPreviews:(BOOL)a3
{
  self->_invalidateCachedPreviews = a3;
}

+ (id)settingsControllerModule
{
  v23[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v21 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Selection Details Dismissal Delay" valueKeyPath:@"selectionDetailsDismissalDelay"];
  v20 = [v21 minValue:0.0 maxValue:1.0];
  v19 = objc_msgSend(v20, "px_increment:", 0.05);
  v23[0] = v19;
  v18 = [MEMORY[0x1E4F94108] rowWithTitle:@"Layout Style" valueKeyPath:@"layoutStyle"];
  objc_super v3 = [v18 possibleValues:&unk_1F02D4108 titles:&unk_1F02D4120];
  v23[1] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Loading Failure" valueKeyPath:@"simulateLoadingFailure"];
  v23[2] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Saving Failure" valueKeyPath:@"simulateSavingFailure"];
  v23[3] = v5;
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Full Edit Rendering" valueKeyPath:@"useNeutrinoRendering"];
  v23[4] = v6;
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Status" valueKeyPath:@"showStatusInDisclosureLabel"];
  v23[5] = v7;
  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Loop Badges" valueKeyPath:@"showLoopBadges"];
  v23[6] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Invalidate Previews on Edit" valueKeyPath:@"invalidateCachedPreviews"];
  v23[7] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Live Rendered Previews" valueKeyPath:@"useLiveRenderedPreviews"];
  v23[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:9];
  v12 = [v2 sectionWithRows:v11 title:@"Settings"];

  v13 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v14 = (void *)MEMORY[0x1E4F94160];
  v22[0] = v12;
  v22[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v16 = [v14 moduleWithTitle:@"Variations" contents:v15];

  return v16;
}

- (BOOL)useLiveRenderedPreviews
{
  return self->_useLiveRenderedPreviews;
}

- (BOOL)invalidateCachedPreviews
{
  return self->_invalidateCachedPreviews;
}

- (BOOL)showLoopBadges
{
  return self->_showLoopBadges;
}

- (BOOL)showStatusInDisclosureLabel
{
  return self->_showStatusInDisclosureLabel;
}

- (BOOL)useNeutrinoRendering
{
  return self->_useNeutrinoRendering;
}

- (BOOL)simulateSavingFailure
{
  return self->_simulateSavingFailure;
}

- (BOOL)simulateLoadingFailure
{
  return self->_simulateLoadingFailure;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setAddSimulatedProgressComponent:(BOOL)a3
{
  self->_addSimulatedProgressComponent = a3;
}

- (BOOL)addSimulatedProgressComponent
{
  return self->_addSimulatedProgressComponent;
}

- (double)selectionDetailsDismissalDelay
{
  return self->_selectionDetailsDismissalDelay;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXAssetVariationsSettings)sharedInstance
{
  if (sharedInstance_onceToken_114800 != -1) {
    dispatch_once(&sharedInstance_onceToken_114800, &__block_literal_global_114801);
  }
  v2 = (void *)sharedInstance_sharedInstance_114802;
  return (PXAssetVariationsSettings *)v2;
}

void __43__PXAssetVariationsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 variationsSettings];
  v1 = (void *)sharedInstance_sharedInstance_114802;
  sharedInstance_sharedInstance_114802 = v0;
}

@end