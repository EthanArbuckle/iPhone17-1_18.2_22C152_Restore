@interface PXDuplicatesSettings
+ (PXDuplicatesSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)showDuplicateGroupsWithASingleAsset;
- (id)parentSettings;
- (void)setDefaultValues;
- (void)setShowDuplicateGroupsWithASingleAsset:(BOOL)a3;
@end

@implementation PXDuplicatesSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXDuplicatesSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXDuplicatesSettings *)self setShowDuplicateGroupsWithASingleAsset:0];
}

- (void)setShowDuplicateGroupsWithASingleAsset:(BOOL)a3
{
  self->_showDuplicateGroupsWithASingleAsset = a3;
}

+ (id)settingsControllerModule
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Process Identical Duplicates", &__block_literal_global_7823);
  v15[0] = v3;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v5 = NSStringFromSelector(sel_showDuplicateGroupsWithASingleAsset);
  v6 = [v4 rowWithTitle:@"Show Groups with a Single Asset" valueKeyPath:v5];
  v15[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v8 = [v2 sectionWithRows:v7];

  v9 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v10 = (void *)MEMORY[0x1E4F94160];
  v14[0] = v8;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 moduleWithTitle:@"Duplicates" contents:v11];

  return v12;
}

void __52__PXDuplicatesSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = +[PXAlertController activityAlertControllerWithTitle:@"Processing..." cancelHandler:&__block_literal_global_210];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___ProcessDuplicates_block_invoke_2;
  v6[3] = &unk_1E5DD32A8;
  id v7 = v3;
  id v8 = v2;
  id v4 = v3;
  id v5 = v2;
  [v5 presentViewController:v4 animated:1 completion:v6];
}

- (BOOL)showDuplicateGroupsWithASingleAsset
{
  return self->_showDuplicateGroupsWithASingleAsset;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXDuplicatesSettings)sharedInstance
{
  if (sharedInstance_onceToken_291766 != -1) {
    dispatch_once(&sharedInstance_onceToken_291766, &__block_literal_global_291767);
  }
  id v2 = (void *)sharedInstance_sharedInstance_291768;
  return (PXDuplicatesSettings *)v2;
}

void __38__PXDuplicatesSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 duplicatesSettings];
  v1 = (void *)sharedInstance_sharedInstance_291768;
  sharedInstance_sharedInstance_291768 = v0;
}

@end