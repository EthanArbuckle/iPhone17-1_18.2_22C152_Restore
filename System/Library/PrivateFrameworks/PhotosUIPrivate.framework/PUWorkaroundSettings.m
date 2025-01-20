@interface PUWorkaroundSettings
+ (PUWorkaroundSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)addRemoveVideoLayer;
- (BOOL)shouldWorkAround124016315;
- (BOOL)shouldWorkAround124981589;
- (BOOL)shouldWorkAround54502886;
- (id)parentSettings;
- (void)setAddRemoveVideoLayer:(BOOL)a3;
- (void)setDefaultValues;
- (void)setShouldWorkAround124016315:(BOOL)a3;
- (void)setShouldWorkAround124981589:(BOOL)a3;
- (void)setShouldWorkAround54502886:(BOOL)a3;
@end

@implementation PUWorkaroundSettings

- (void)setShouldWorkAround124981589:(BOOL)a3
{
  self->_shouldWorkAround124981589 = a3;
}

- (void)setDefaultValues
{
  [(PUWorkaroundSettings *)self setAddRemoveVideoLayer:1];
  [(PUWorkaroundSettings *)self setShouldWorkAround54502886:1];
  [(PUWorkaroundSettings *)self setShouldWorkAround124016315:1];
  [(PUWorkaroundSettings *)self setShouldWorkAround124981589:1];
}

- (void)setShouldWorkAround54502886:(BOOL)a3
{
  self->_shouldWorkAround54502886 = a3;
}

- (void)setShouldWorkAround124016315:(BOOL)a3
{
  self->_shouldWorkAround124016315 = a3;
}

- (void)setAddRemoveVideoLayer:(BOOL)a3
{
  self->_addRemoveVideoLayer = a3;
}

+ (id)settingsControllerModule
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = (void *)MEMORY[0x1E4F941F0];
  v4 = NSStringFromSelector(sel_addRemoveVideoLayer);
  v5 = [v3 rowWithTitle:@"Remove/add video layer on appearance" valueKeyPath:v4];
  v22[0] = v5;
  v6 = (void *)MEMORY[0x1E4F941F0];
  v7 = NSStringFromSelector(sel_shouldWorkAround54502886);
  v8 = [v6 rowWithTitle:@"54502886 (1-up Dismissal to Camera)" valueKeyPath:v7];
  v22[1] = v8;
  v9 = (void *)MEMORY[0x1E4F941F0];
  v10 = NSStringFromSelector(sel_shouldWorkAround124016315);
  v11 = [v9 rowWithTitle:@"124016315 (Text Selection Jump)" valueKeyPath:v10];
  v22[2] = v11;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v13 = NSStringFromSelector(sel_shouldWorkAround124981589);
  v14 = [v12 rowWithTitle:@"124981589 (VK contents rect)" valueKeyPath:v13];
  v22[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  v16 = [v2 sectionWithRows:v15];

  v17 = (void *)MEMORY[0x1E4F94160];
  v21 = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v19 = [v17 moduleWithTitle:@"Workaround" contents:v18];

  return v19;
}

+ (PUWorkaroundSettings)sharedInstance
{
  if (sharedInstance_onceToken_101859 != -1) {
    dispatch_once(&sharedInstance_onceToken_101859, &__block_literal_global_101860);
  }
  v2 = (void *)sharedInstance_sharedInstance_101861;
  return (PUWorkaroundSettings *)v2;
}

void __38__PUWorkaroundSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 workaroundSettings];
  v1 = (void *)sharedInstance_sharedInstance_101861;
  sharedInstance_sharedInstance_101861 = v0;
}

- (BOOL)shouldWorkAround124981589
{
  return self->_shouldWorkAround124981589;
}

- (BOOL)shouldWorkAround124016315
{
  return self->_shouldWorkAround124016315;
}

- (BOOL)shouldWorkAround54502886
{
  return self->_shouldWorkAround54502886;
}

- (BOOL)addRemoveVideoLayer
{
  return self->_addRemoveVideoLayer;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

@end