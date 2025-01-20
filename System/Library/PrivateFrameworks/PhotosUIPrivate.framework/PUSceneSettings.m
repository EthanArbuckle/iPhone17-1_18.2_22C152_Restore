@interface PUSceneSettings
+ (PUSceneSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)showConfidenceOverlay;
- (id)parentSettings;
- (unint64_t)inspectorSortOrder;
- (void)setDefaultValues;
- (void)setInspectorSortOrder:(unint64_t)a3;
- (void)setShowConfidenceOverlay:(BOOL)a3;
@end

@implementation PUSceneSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUSceneSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUSceneSettings *)self setShowConfidenceOverlay:1];
  [(PUSceneSettings *)self setInspectorSortOrder:0];
}

- (void)setShowConfidenceOverlay:(BOOL)a3
{
  self->_showConfidenceOverlay = a3;
}

- (void)setInspectorSortOrder:(unint64_t)a3
{
  self->_inspectorSortOrder = a3;
}

- (unint64_t)inspectorSortOrder
{
  return self->_inspectorSortOrder;
}

- (BOOL)showConfidenceOverlay
{
  return self->_showConfidenceOverlay;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Confidence Overlay" valueKeyPath:@"showConfidenceOverlay"];
  v23[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v5 = [v2 sectionWithRows:v4 title:@"Scene Inspector Grid View"];

  v6 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Scene Inspector", &__block_literal_global_17_81372);
  v7 = (void *)MEMORY[0x1E4F94160];
  v22 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v9 = [v7 sectionWithRows:v8];

  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = (void *)MEMORY[0x1E4F940F8];
  v12 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v13 = [v11 rowWithTitle:@"Restore Defaults" action:v12];
  v21 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v15 = [v10 sectionWithRows:v14];

  v16 = (void *)MEMORY[0x1E4F94160];
  v20[0] = v5;
  v20[1] = v9;
  v20[2] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v18 = [v16 moduleWithTitle:@"Scenes Settings" contents:v17];

  return v18;
}

void __43__PUSceneSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v4 = [[PUSceneDebugInspectorViewController alloc] initWithStyle:0];
  objc_super v3 = [[PUNavigationController alloc] initWithRootViewController:v4];
  [v2 presentViewController:v3 animated:1 completion:0];
}

+ (PUSceneSettings)sharedInstance
{
  if (sharedInstance_onceToken_81391 != -1) {
    dispatch_once(&sharedInstance_onceToken_81391, &__block_literal_global_81392);
  }
  id v2 = (void *)sharedInstance_sharedInstance_81393;
  return (PUSceneSettings *)v2;
}

void __33__PUSceneSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 sceneSettings];
  v1 = (void *)sharedInstance_sharedInstance_81393;
  sharedInstance_sharedInstance_81393 = v0;
}

@end