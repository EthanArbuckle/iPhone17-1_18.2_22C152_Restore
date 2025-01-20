@interface PXDragAndDropSettings
+ (PXDragAndDropSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)alwaysAllowDragsWithinUserAlbums;
- (BOOL)dragOutEnabled;
- (BOOL)springLoadingEnabled;
- (BOOL)useData;
- (BOOL)useFileProvider;
- (double)dropGestureSpeedLimit;
- (id)parentSettings;
- (int64_t)reorderCadence;
- (void)setAlwaysAllowDragsWithinUserAlbums:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDragOutEnabled:(BOOL)a3;
- (void)setDropGestureSpeedLimit:(double)a3;
- (void)setReorderCadence:(int64_t)a3;
- (void)setSpringLoadingEnabled:(BOOL)a3;
- (void)setUseData:(BOOL)a3;
- (void)setUseFileProvider:(BOOL)a3;
@end

@implementation PXDragAndDropSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXDragAndDropSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXDragAndDropSettings *)self setUseData:0];
  [(PXDragAndDropSettings *)self setUseFileProvider:1];
  [(PXDragAndDropSettings *)self setDragOutEnabled:PLIsCamera() ^ 1];
  [(PXDragAndDropSettings *)self setAlwaysAllowDragsWithinUserAlbums:1];
  [(PXDragAndDropSettings *)self setSpringLoadingEnabled:1];
  [(PXDragAndDropSettings *)self setReorderCadence:2];
  [(PXDragAndDropSettings *)self setDropGestureSpeedLimit:100.0];
}

- (void)setUseFileProvider:(BOOL)a3
{
  self->_useFileProvider = a3;
}

- (void)setUseData:(BOOL)a3
{
  self->_useData = a3;
}

- (void)setSpringLoadingEnabled:(BOOL)a3
{
  self->_springLoadingEnabled = a3;
}

- (void)setReorderCadence:(int64_t)a3
{
  self->_reorderCadence = a3;
}

- (void)setDropGestureSpeedLimit:(double)a3
{
  self->_dropGestureSpeedLimit = a3;
}

- (void)setDragOutEnabled:(BOOL)a3
{
  self->_dragOutEnabled = a3;
}

- (void)setAlwaysAllowDragsWithinUserAlbums:(BOOL)a3
{
  self->_alwaysAllowDragsWithinUserAlbums = a3;
}

- (BOOL)dragOutEnabled
{
  return self->_dragOutEnabled;
}

+ (PXDragAndDropSettings)sharedInstance
{
  if (sharedInstance_onceToken_127155 != -1) {
    dispatch_once(&sharedInstance_onceToken_127155, &__block_literal_global_127156);
  }
  v2 = (void *)sharedInstance_sharedInstance_127157;
  return (PXDragAndDropSettings *)v2;
}

void __39__PXDragAndDropSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 dragAndDrop];
  v1 = (void *)sharedInstance_sharedInstance_127157;
  sharedInstance_sharedInstance_127157 = v0;
}

- (double)dropGestureSpeedLimit
{
  return self->_dropGestureSpeedLimit;
}

- (int64_t)reorderCadence
{
  return self->_reorderCadence;
}

- (BOOL)springLoadingEnabled
{
  return self->_springLoadingEnabled;
}

- (BOOL)alwaysAllowDragsWithinUserAlbums
{
  return self->_alwaysAllowDragsWithinUserAlbums;
}

- (BOOL)useFileProvider
{
  return self->_useFileProvider;
}

- (BOOL)useData
{
  return self->_useData;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use NSData for images" valueKeyPath:@"useData"];
  v21[0] = v19;
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Drag out enabled" valueKeyPath:@"dragOutEnabled"];
  v21[1] = v18;
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Spring-loading enabled" valueKeyPath:@"springLoadingEnabled"];
  v21[2] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always allow drags in User Albums" valueKeyPath:@"alwaysAllowDragsWithinUserAlbums"];
  v21[3] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use File Provider Extension" valueKeyPath:@"useFileProvider"];
  v21[4] = v5;
  v6 = [MEMORY[0x1E4F94108] rowWithTitle:@"Reorder Cadence" valueKeyPath:@"reorderCadence"];
  v7 = [v6 possibleValues:&unk_1F02D5518 titles:&unk_1F02D5530];
  v21[5] = v7;
  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Drop Gesture Speed Limit" valueKeyPath:@"dropGestureSpeedLimit"];
  v9 = [v8 minValue:0.0 maxValue:1000.0];
  v10 = objc_msgSend(v9, "px_increment:", 1.0);
  v21[6] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  v12 = [v2 sectionWithRows:v11 title:@"Settings"];

  v13 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v14 = (void *)MEMORY[0x1E4F94160];
  v20[0] = v12;
  v20[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v16 = [v14 moduleWithTitle:@"Drag & Drop" contents:v15];

  return v16;
}

@end