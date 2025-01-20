@interface PXDocumentMenuSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)enableActionsMenuOnPad;
- (BOOL)enableActionsMenuOnPhone;
- (BOOL)excludeActionsFromShareSheet;
- (BOOL)showAddToSharedAlbumAction;
- (id)parentSettings;
- (int64_t)actionsMenuLocation;
- (void)setActionsMenuLocation:(int64_t)a3;
- (void)setDefaultValues;
- (void)setEnableActionsMenuOnPad:(BOOL)a3;
- (void)setEnableActionsMenuOnPhone:(BOOL)a3;
- (void)setExcludeActionsFromShareSheet:(BOOL)a3;
- (void)setShowAddToSharedAlbumAction:(BOOL)a3;
@end

@implementation PXDocumentMenuSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXDocumentMenuSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXDocumentMenuSettings *)self setActionsMenuLocation:1];
  [(PXDocumentMenuSettings *)self setShowAddToSharedAlbumAction:0];
  [(PXDocumentMenuSettings *)self setExcludeActionsFromShareSheet:1];
  [(PXDocumentMenuSettings *)self setEnableActionsMenuOnPad:1];
  [(PXDocumentMenuSettings *)self setEnableActionsMenuOnPhone:1];
}

- (void)setShowAddToSharedAlbumAction:(BOOL)a3
{
  self->_showAddToSharedAlbumAction = a3;
}

- (void)setExcludeActionsFromShareSheet:(BOOL)a3
{
  self->_excludeActionsFromShareSheet = a3;
}

- (void)setEnableActionsMenuOnPhone:(BOOL)a3
{
  self->_enableActionsMenuOnPhone = a3;
}

- (void)setEnableActionsMenuOnPad:(BOOL)a3
{
  self->_enableActionsMenuOnPad = a3;
}

- (void)setActionsMenuLocation:(int64_t)a3
{
  self->_actionsMenuLocation = a3;
}

- (int64_t)actionsMenuLocation
{
  return self->_actionsMenuLocation;
}

- (BOOL)enableActionsMenuOnPhone
{
  return self->_enableActionsMenuOnPhone;
}

- (BOOL)enableActionsMenuOnPad
{
  return self->_enableActionsMenuOnPad;
}

- (BOOL)excludeActionsFromShareSheet
{
  return self->_excludeActionsFromShareSheet;
}

- (BOOL)showAddToSharedAlbumAction
{
  return self->_showAddToSharedAlbumAction;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v22 = [MEMORY[0x1E4F94108] rowWithTitle:@"Actions Location" valueKeyPath:@"actionsMenuLocation"];
  v21 = [v22 possibleValues:&unk_1F02D3B68 titles:&unk_1F02D3B80];
  v23[0] = v21;
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v20 = NSStringFromSelector(sel_enableActionsMenuOnPad);
  v19 = [v3 rowWithTitle:@"Enable Actions Menu on iPad" valueKeyPath:v20];
  v23[1] = v19;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v18 = NSStringFromSelector(sel_enableActionsMenuOnPhone);
  v5 = [v4 rowWithTitle:@"Enable Actions Menu on iPhone" valueKeyPath:v18];
  v23[2] = v5;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v7 = NSStringFromSelector(sel_showAddToSharedAlbumAction);
  v8 = [v6 rowWithTitle:@"Show Add To Shared Album Action" valueKeyPath:v7];
  v23[3] = v8;
  v9 = (void *)MEMORY[0x1E4F941F0];
  v10 = NSStringFromSelector(sel_excludeActionsFromShareSheet);
  v11 = [v9 rowWithTitle:@"Exclude actions from Share Sheet" valueKeyPath:v10];
  v23[4] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v13 = [v2 sectionWithRows:v12 title:@"Actions Settings"];
  v24[0] = v13;
  v14 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v24[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v16 = [v2 moduleWithTitle:@"In-App Actions" contents:v15];

  return v16;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_55075 != -1) {
    dispatch_once(&sharedInstance_onceToken_55075, &__block_literal_global_55076);
  }
  v2 = (void *)sharedInstance_sharedInstance_55077;
  return v2;
}

void __40__PXDocumentMenuSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 documentMenuSettings];
  v1 = (void *)sharedInstance_sharedInstance_55077;
  sharedInstance_sharedInstance_55077 = v0;
}

@end