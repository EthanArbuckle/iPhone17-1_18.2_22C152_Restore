@interface PUTabbedLibrarySettings
+ (PUTabbedLibrarySettings)sharedInstance;
+ (id)settingsControllerModule;
+ (id)transientProperties;
- (BOOL)isSidebarEnabled;
- (BOOL)sidebarAnimateDataSourceUpdates;
- (BOOL)sidebarAnimateSelectionUpdates;
- (BOOL)sidebarEditAutoExpandToEditableItem;
- (BOOL)sidebarHideNavBackButtonForSelectedItem;
- (BOOL)sidebarLaunchAnimateLoad;
- (BOOL)sidebarOnlyScrollOffscreenItemOnScreen;
- (BOOL)sidebarPauseChangeProcessingWhenHidden;
- (BOOL)sidebarScrollSelectedItemToCenter;
- (BOOL)sidebarSimulateNonIncrementalChanges;
- (BOOL)sidebarSymbolImagesOnly;
- (BOOL)sidebarUseMacStructure;
- (id)parentSettings;
- (int64_t)sidebarEnabledMode;
- (int64_t)sidebarLaunchLoadMode;
- (int64_t)sidebarPausedChangeDetailsBufferLength;
- (void)setDefaultValues;
- (void)setSidebarAnimateDataSourceUpdates:(BOOL)a3;
- (void)setSidebarAnimateSelectionUpdates:(BOOL)a3;
- (void)setSidebarEditAutoExpandToEditableItem:(BOOL)a3;
- (void)setSidebarEnabledMode:(int64_t)a3;
- (void)setSidebarHideNavBackButtonForSelectedItem:(BOOL)a3;
- (void)setSidebarLaunchAnimateLoad:(BOOL)a3;
- (void)setSidebarLaunchLoadMode:(int64_t)a3;
- (void)setSidebarOnlyScrollOffscreenItemOnScreen:(BOOL)a3;
- (void)setSidebarPauseChangeProcessingWhenHidden:(BOOL)a3;
- (void)setSidebarPausedChangeDetailsBufferLength:(int64_t)a3;
- (void)setSidebarScrollSelectedItemToCenter:(BOOL)a3;
- (void)setSidebarSimulateNonIncrementalChanges:(BOOL)a3;
- (void)setSidebarSymbolImagesOnly:(BOOL)a3;
- (void)setSidebarUseMacStructure:(BOOL)a3;
@end

@implementation PUTabbedLibrarySettings

+ (PUTabbedLibrarySettings)sharedInstance
{
  if (sharedInstance_onceToken_90269 != -1) {
    dispatch_once(&sharedInstance_onceToken_90269, &__block_literal_global_90270);
  }
  v2 = (void *)sharedInstance_sharedInstance_90271;
  return (PUTabbedLibrarySettings *)v2;
}

void __41__PUTabbedLibrarySettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 tabbedLibrarySettings];
  v1 = (void *)sharedInstance_sharedInstance_90271;
  sharedInstance_sharedInstance_90271 = v0;
}

- (BOOL)isSidebarEnabled
{
  int64_t v2 = [(PUTabbedLibrarySettings *)self sidebarEnabledMode];
  if (v2 == 1) {
    return 1;
  }
  if (v2) {
    return 0;
  }
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  return v4;
}

- (int64_t)sidebarEnabledMode
{
  return self->_sidebarEnabledMode;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUTabbedLibrarySettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUTabbedLibrarySettings *)self setSidebarEnabledMode:0];
  [(PUTabbedLibrarySettings *)self setSidebarAnimateSelectionUpdates:1];
  [(PUTabbedLibrarySettings *)self setSidebarScrollSelectedItemToCenter:1];
  [(PUTabbedLibrarySettings *)self setSidebarOnlyScrollOffscreenItemOnScreen:1];
  [(PUTabbedLibrarySettings *)self setSidebarAnimateDataSourceUpdates:1];
  [(PUTabbedLibrarySettings *)self setSidebarUseMacStructure:0];
  [(PUTabbedLibrarySettings *)self setSidebarEditAutoExpandToEditableItem:1];
  [(PUTabbedLibrarySettings *)self setSidebarHideNavBackButtonForSelectedItem:1];
  [(PUTabbedLibrarySettings *)self setSidebarLaunchLoadMode:3];
  [(PUTabbedLibrarySettings *)self setSidebarLaunchAnimateLoad:1];
  [(PUTabbedLibrarySettings *)self setSidebarSymbolImagesOnly:0];
  [(PUTabbedLibrarySettings *)self setSidebarSimulateNonIncrementalChanges:0];
  [(PUTabbedLibrarySettings *)self setSidebarPauseChangeProcessingWhenHidden:1];
  [(PUTabbedLibrarySettings *)self setSidebarPausedChangeDetailsBufferLength:5];
}

- (void)setSidebarUseMacStructure:(BOOL)a3
{
  self->_sidebarUseMacStructure = a3;
}

- (void)setSidebarSymbolImagesOnly:(BOOL)a3
{
  self->_sidebarSymbolImagesOnly = a3;
}

- (void)setSidebarSimulateNonIncrementalChanges:(BOOL)a3
{
  self->_sidebarSimulateNonIncrementalChanges = a3;
}

- (void)setSidebarScrollSelectedItemToCenter:(BOOL)a3
{
  self->_sidebarScrollSelectedItemToCenter = a3;
}

- (void)setSidebarPausedChangeDetailsBufferLength:(int64_t)a3
{
  self->_sidebarPausedChangeDetailsBufferLength = a3;
}

- (void)setSidebarPauseChangeProcessingWhenHidden:(BOOL)a3
{
  self->_sidebarPauseChangeProcessingWhenHidden = a3;
}

- (void)setSidebarOnlyScrollOffscreenItemOnScreen:(BOOL)a3
{
  self->_sidebarOnlyScrollOffscreenItemOnScreen = a3;
}

- (void)setSidebarLaunchLoadMode:(int64_t)a3
{
  self->_sidebarLaunchLoadMode = a3;
}

- (void)setSidebarLaunchAnimateLoad:(BOOL)a3
{
  self->_sidebarLaunchAnimateLoad = a3;
}

- (void)setSidebarHideNavBackButtonForSelectedItem:(BOOL)a3
{
  self->_sidebarHideNavBackButtonForSelectedItem = a3;
}

- (void)setSidebarEnabledMode:(int64_t)a3
{
  self->_sidebarEnabledMode = a3;
}

- (void)setSidebarEditAutoExpandToEditableItem:(BOOL)a3
{
  self->_sidebarEditAutoExpandToEditableItem = a3;
}

- (void)setSidebarAnimateSelectionUpdates:(BOOL)a3
{
  self->_sidebarAnimateSelectionUpdates = a3;
}

- (void)setSidebarAnimateDataSourceUpdates:(BOOL)a3
{
  self->_sidebarAnimateDataSourceUpdates = a3;
}

- (int64_t)sidebarPausedChangeDetailsBufferLength
{
  return self->_sidebarPausedChangeDetailsBufferLength;
}

- (BOOL)sidebarPauseChangeProcessingWhenHidden
{
  return self->_sidebarPauseChangeProcessingWhenHidden;
}

- (BOOL)sidebarSimulateNonIncrementalChanges
{
  return self->_sidebarSimulateNonIncrementalChanges;
}

- (BOOL)sidebarSymbolImagesOnly
{
  return self->_sidebarSymbolImagesOnly;
}

- (BOOL)sidebarLaunchAnimateLoad
{
  return self->_sidebarLaunchAnimateLoad;
}

- (int64_t)sidebarLaunchLoadMode
{
  return self->_sidebarLaunchLoadMode;
}

- (BOOL)sidebarHideNavBackButtonForSelectedItem
{
  return self->_sidebarHideNavBackButtonForSelectedItem;
}

- (BOOL)sidebarEditAutoExpandToEditableItem
{
  return self->_sidebarEditAutoExpandToEditableItem;
}

- (BOOL)sidebarUseMacStructure
{
  return self->_sidebarUseMacStructure;
}

- (BOOL)sidebarAnimateDataSourceUpdates
{
  return self->_sidebarAnimateDataSourceUpdates;
}

- (BOOL)sidebarOnlyScrollOffscreenItemOnScreen
{
  return self->_sidebarOnlyScrollOffscreenItemOnScreen;
}

- (BOOL)sidebarScrollSelectedItemToCenter
{
  return self->_sidebarScrollSelectedItemToCenter;
}

- (BOOL)sidebarAnimateSelectionUpdates
{
  return self->_sidebarAnimateSelectionUpdates;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)transientProperties
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PUTabbedLibrarySettings;
  int64_t v2 = objc_msgSendSuper2(&v5, sel_transientProperties);
  objc_super v3 = [v2 setByAddingObject:@"sidebarEnabled"];

  return v3;
}

+ (id)settingsControllerModule
{
  v73[14] = *MEMORY[0x1E4F143B8];
  int64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sidebarEnabled == YES"];
  v54 = (void *)MEMORY[0x1E4F94160];
  v70 = [MEMORY[0x1E4F94108] rowWithTitle:@"Sidebar Mode" valueKeyPath:@"sidebarEnabledMode"];
  v69 = [v70 possibleValues:&unk_1F078B708 titles:&unk_1F078B720];
  v73[0] = v69;
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v68 = NSStringFromSelector(sel_sidebarAnimateSelectionUpdates);
  v67 = [v3 rowWithTitle:@"Animate sidebar selection updates" valueKeyPath:v68];
  v66 = [v67 condition:v2];
  v73[1] = v66;
  BOOL v4 = (void *)MEMORY[0x1E4F941F0];
  v65 = NSStringFromSelector(sel_sidebarScrollSelectedItemToCenter);
  v64 = [v4 rowWithTitle:@"Scroll selected item to center" valueKeyPath:v65];
  v63 = [v64 condition:v2];
  v73[2] = v63;
  objc_super v5 = (void *)MEMORY[0x1E4F941F0];
  v62 = NSStringFromSelector(sel_sidebarOnlyScrollOffscreenItemOnScreen);
  v60 = [v5 rowWithTitle:@"Only scroll offscreen items onto screen" valueKeyPath:v62];
  v6 = (void *)MEMORY[0x1E4F28BA0];
  v72[0] = v2;
  v61 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sidebarScrollSelectedItemToCenter == YES"];
  v72[1] = v61;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  v58 = [v6 andPredicateWithSubpredicates:v59];
  v57 = [v60 condition:v58];
  v73[3] = v57;
  v7 = (void *)MEMORY[0x1E4F941F0];
  v56 = NSStringFromSelector(sel_sidebarAnimateDataSourceUpdates);
  v53 = [v7 rowWithTitle:@"Animate data source updates" valueKeyPath:v56];
  v52 = [v53 condition:v2];
  v73[4] = v52;
  v8 = (void *)MEMORY[0x1E4F941F0];
  v51 = NSStringFromSelector(sel_sidebarUseMacStructure);
  v50 = [v8 rowWithTitle:@"Use macOS structure" valueKeyPath:v51];
  v49 = [v50 condition:v2];
  v73[5] = v49;
  v9 = (void *)MEMORY[0x1E4F941F0];
  v48 = NSStringFromSelector(sel_sidebarEditAutoExpandToEditableItem);
  v47 = [v9 rowWithTitle:@"Edit reveals editable item" valueKeyPath:v48];
  v46 = [v47 condition:v2];
  v73[6] = v46;
  v10 = (void *)MEMORY[0x1E4F941F0];
  v45 = NSStringFromSelector(sel_sidebarHideNavBackButtonForSelectedItem);
  v44 = [v10 rowWithTitle:@"Hide Nav Back button for selected item" valueKeyPath:v45];
  v43 = [v44 condition:v2];
  v73[7] = v43;
  v11 = (void *)MEMORY[0x1E4F94108];
  v42 = NSStringFromSelector(sel_sidebarLaunchLoadMode);
  v41 = [v11 rowWithTitle:@"Photos App Sidebar Launch: Load Mode" valueKeyPath:v42];
  v40 = [v41 possibleValues:&unk_1F078B738 titles:&unk_1F078B750];
  v39 = [v40 condition:v2];
  v73[8] = v39;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v38 = NSStringFromSelector(sel_sidebarLaunchAnimateLoad);
  v37 = [v12 rowWithTitle:@"Sidebar Launch: Animate update" valueKeyPath:v38];
  v36 = [v37 condition:v2];
  v73[9] = v36;
  v13 = (void *)MEMORY[0x1E4F941F0];
  v35 = NSStringFromSelector(sel_sidebarSymbolImagesOnly);
  v34 = [v13 rowWithTitle:@"Sidebar symbol images only" valueKeyPath:v35];
  v33 = [v34 condition:v2];
  v73[10] = v33;
  v14 = (void *)MEMORY[0x1E4F941F0];
  v32 = NSStringFromSelector(sel_sidebarSimulateNonIncrementalChanges);
  v31 = [v14 rowWithTitle:@"Simulate Non-Incremental Changes" valueKeyPath:v32];
  v15 = [v31 condition:v2];
  v73[11] = v15;
  v16 = (void *)MEMORY[0x1E4F941F0];
  v17 = NSStringFromSelector(sel_sidebarPauseChangeProcessingWhenHidden);
  v18 = [v16 rowWithTitle:@"Pause Changes When hidden" valueKeyPath:v17];
  v19 = [v18 condition:v2];
  v73[12] = v19;
  v20 = (void *)MEMORY[0x1E4F941D8];
  v21 = NSStringFromSelector(sel_sidebarPausedChangeDetailsBufferLength);
  v22 = [v20 rowWithTitle:@"Paused Change Details Buffer" valueKeyPath:v21];
  v23 = [v22 minValue:0.0 maxValue:20.0];
  v24 = [v23 condition:v2];
  v73[13] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:14];
  v55 = [v54 sectionWithRows:v25 title:@"Sidebar"];

  v26 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v27 = (void *)MEMORY[0x1E4F94160];
  v71[0] = v55;
  v71[1] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  v29 = [v27 moduleWithTitle:@"Tab Settings" contents:v28];

  return v29;
}

@end