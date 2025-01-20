@interface PUPosterSettings
+ (id)_photosUICoreSettings;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (PUPosterHeadroomSettings)headroomSettings;
- (PUPosterSettings)initWithDefaultValues;
- (id)parentSettings;
- (id)reparentedRootSettings;
- (void)createChildren;
- (void)setHeadroomSettings:(id)a3;
@end

@implementation PUPosterSettings

- (void).cxx_destruct
{
}

- (void)setHeadroomSettings:(id)a3
{
}

- (PUPosterHeadroomSettings)headroomSettings
{
  return self->_headroomSettings;
}

- (id)reparentedRootSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _photosUICoreSettings];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)createChildren
{
  v3 = [(PTSettings *)[PUPosterHeadroomSettings alloc] initWithDefaultValues];
  headroomSettings = self->_headroomSettings;
  self->_headroomSettings = v3;
}

- (PUPosterSettings)initWithDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PUPosterSettings;
  v2 = [(PTSettings *)&v5 initWithDefaultValues];
  v3 = v2;
  if (v2) {
    [(PTSettings *)v2 _setObservationEnabled:1];
  }
  return v3;
}

- (id)parentSettings
{
  return 0;
}

+ (id)settingsControllerModule
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = (void *)MEMORY[0x1E4F94130];
  v4 = NSStringFromSelector(sel_headroomSettings);
  objc_super v5 = [v3 rowWithTitle:@"Headroom" childSettingsKeyPath:v4];
  v20[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v7 = [v2 sectionWithRows:v6];

  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F940F8];
  v10 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];
  v19 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v13 = [v8 sectionWithRows:v12];

  v14 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v7;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"Photos Poster" contents:v15];

  return v16;
}

+ (id)_photosUICoreSettings
{
  return (id)[MEMORY[0x1E4F90618] sharedInstance];
}

+ (id)sharedInstance
{
  os_unfair_lock_lock(MEMORY[0x1E4F91010]);
  if (!sharedInstance_sharedInstance_96732)
  {
    uint64_t v3 = [a1 createSharedInstance];
    v4 = (void *)sharedInstance_sharedInstance_96732;
    sharedInstance_sharedInstance_96732 = v3;
  }
  os_unfair_lock_unlock(MEMORY[0x1E4F91010]);
  objc_super v5 = (void *)sharedInstance_sharedInstance_96732;
  return v5;
}

@end