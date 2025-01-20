@interface PXDiagnosticsSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)enableCompleteMyMomentService;
- (BOOL)enableContextualGesture;
- (BOOL)enableDebugDictionaryService;
- (BOOL)enableGenericService;
- (BOOL)enableGraphService;
- (BOOL)enableInternalSettingsService;
- (BOOL)enableScrollService;
- (BOOL)enableTitleFontService;
- (double)scrollSpeed;
- (id)parentSettings;
- (int64_t)scrollIterations;
- (void)setDefaultValues;
- (void)setEnableCompleteMyMomentService:(BOOL)a3;
- (void)setEnableContextualGesture:(BOOL)a3;
- (void)setEnableDebugDictionaryService:(BOOL)a3;
- (void)setEnableGenericService:(BOOL)a3;
- (void)setEnableGraphService:(BOOL)a3;
- (void)setEnableInternalSettingsService:(BOOL)a3;
- (void)setEnableScrollService:(BOOL)a3;
- (void)setEnableTitleFontService:(BOOL)a3;
- (void)setScrollIterations:(int64_t)a3;
- (void)setScrollSpeed:(double)a3;
@end

@implementation PXDiagnosticsSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21228 != -1) {
    dispatch_once(&sharedInstance_onceToken_21228, &__block_literal_global_21229);
  }
  v2 = (void *)sharedInstance_sharedInstance_21230;
  return v2;
}

- (BOOL)enableContextualGesture
{
  return self->_enableContextualGesture;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXDiagnosticsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXDiagnosticsSettings *)self setEnableContextualGesture:1];
  [(PXDiagnosticsSettings *)self setEnableInternalSettingsService:1];
  [(PXDiagnosticsSettings *)self setEnableGenericService:0];
  [(PXDiagnosticsSettings *)self setEnableGraphService:1];
  [(PXDiagnosticsSettings *)self setEnableTitleFontService:0];
  [(PXDiagnosticsSettings *)self setEnableCompleteMyMomentService:1];
  [(PXDiagnosticsSettings *)self setEnableDebugDictionaryService:1];
  [(PXDiagnosticsSettings *)self setEnableScrollService:0];
  [(PXDiagnosticsSettings *)self setScrollSpeed:20.0];
  [(PXDiagnosticsSettings *)self setScrollIterations:0];
}

- (void)setScrollSpeed:(double)a3
{
  self->_scrollSpeed = a3;
}

- (void)setScrollIterations:(int64_t)a3
{
  self->_scrollIterations = a3;
}

- (void)setEnableTitleFontService:(BOOL)a3
{
  self->_enableTitleFontService = a3;
}

- (void)setEnableScrollService:(BOOL)a3
{
  self->_enableScrollService = a3;
}

- (void)setEnableInternalSettingsService:(BOOL)a3
{
  self->_enableInternalSettingsService = a3;
}

- (void)setEnableGraphService:(BOOL)a3
{
  self->_enableGraphService = a3;
}

- (void)setEnableGenericService:(BOOL)a3
{
  self->_enableGenericService = a3;
}

- (void)setEnableDebugDictionaryService:(BOOL)a3
{
  self->_enableDebugDictionaryService = a3;
}

- (void)setEnableContextualGesture:(BOOL)a3
{
  self->_enableContextualGesture = a3;
}

- (void)setEnableCompleteMyMomentService:(BOOL)a3
{
  self->_enableCompleteMyMomentService = a3;
}

void __39__PXDiagnosticsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 diagnostics];
  v1 = (void *)sharedInstance_sharedInstance_21230;
  sharedInstance_sharedInstance_21230 = v0;
}

- (int64_t)scrollIterations
{
  return self->_scrollIterations;
}

- (double)scrollSpeed
{
  return self->_scrollSpeed;
}

- (BOOL)enableScrollService
{
  return self->_enableScrollService;
}

- (BOOL)enableDebugDictionaryService
{
  return self->_enableDebugDictionaryService;
}

- (BOOL)enableCompleteMyMomentService
{
  return self->_enableCompleteMyMomentService;
}

- (BOOL)enableTitleFontService
{
  return self->_enableTitleFontService;
}

- (BOOL)enableGraphService
{
  return self->_enableGraphService;
}

- (BOOL)enableGenericService
{
  return self->_enableGenericService;
}

- (BOOL)enableInternalSettingsService
{
  return self->_enableInternalSettingsService;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[PXDiagnosticsController sharedController];
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v4 = (void *)MEMORY[0x1E4F940F8];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke;
  v40[3] = &unk_1E5DD36F8;
  id v5 = v2;
  id v41 = v5;
  v6 = objc_msgSend(v4, "px_rowWithTitle:postDismissalAction:", @"Present Contextual Diagnostics", v40);
  v45[0] = v6;
  v7 = (void *)MEMORY[0x1E4F94130];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke_2;
  v38[3] = &unk_1E5DBFCB0;
  id v39 = v5;
  id v37 = v5;
  v8 = objc_msgSend(v7, "px_rowWithTitle:action:", @"Generic Service", v38);
  v9 = [v8 conditionFormat:@"enableGenericService != 0"];
  v45[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v36 = [v3 sectionWithRows:v10];

  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Gesture (4-Finger Double-Tap)" valueKeyPath:@"enableContextualGesture"];
  v44[0] = v12;
  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Internal Settings" valueKeyPath:@"enableInternalSettingsService"];
  v44[1] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Generic Service" valueKeyPath:@"enableGenericService"];
  v44[2] = v14;
  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Graph Service" valueKeyPath:@"enableGraphService"];
  v44[3] = v15;
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Title Font Service" valueKeyPath:@"enableTitleFontService"];
  v44[4] = v16;
  v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Complete My Moment Service" valueKeyPath:@"enableCompleteMyMomentService"];
  v44[5] = v17;
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Debug Dictionary Service" valueKeyPath:@"enableDebugDictionaryService"];
  v44[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:7];
  v35 = [v11 sectionWithRows:v19 title:@"Settings"];

  v20 = (void *)MEMORY[0x1E4F94160];
  v21 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Scroll Stress" valueKeyPath:@"enableScrollService"];
  v43[0] = v21;
  v22 = [MEMORY[0x1E4F941A0] rowWithTitle:@"Scroll Speed (pt/f)" valueKeyPath:@"scrollSpeed"];
  v23 = objc_msgSend(v22, "px_possibleValues:", &unk_1F02D46C0);
  v24 = [v23 conditionFormat:@"enableScrollService != 0"];
  v43[1] = v24;
  v25 = [MEMORY[0x1E4F941A0] rowWithTitle:@"Iterations" valueKeyPath:@"scrollIterations"];
  v26 = objc_msgSend(v25, "px_possibleValues:", &unk_1F02D46D8);
  v27 = [v26 conditionFormat:@"enableScrollService != 0"];
  v43[2] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  v29 = [v20 sectionWithRows:v28 title:@"Scroll"];

  v30 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v31 = (void *)MEMORY[0x1E4F94160];
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v29;
  v42[3] = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  v33 = [v31 moduleWithTitle:@"Diagnostics" contents:v32];

  return v33;
}

uint64_t __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentContextualDiagnostics];
}

void __53__PXDiagnosticsSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_super v3 = [*(id *)(a1 + 32) currentItemProviders];
  v4 = [(PXDiagnosticsService *)[PXGenericDiagnosticsService alloc] initWithItemProviders:v3];
  if ([(PXGenericDiagnosticsService *)v4 canProvideSettingsViewController])
  {
    id v5 = [(PXGenericDiagnosticsService *)v4 settingsViewController];
    [v6 pushViewController:v5 animated:1];
  }
}

@end