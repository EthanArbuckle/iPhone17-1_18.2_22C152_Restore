@interface PBUIWallpaperPrototypeSettings
+ (id)settingsControllerModule;
- (PBUIWallpaperParallaxSettings)homeScreenParallaxSettings;
- (PBUIWallpaperParallaxSettings)lockScreenParallaxSettings;
- (PTOutlet)resetWallpaperOutlet;
- (id)parallaxSettingsForVariant:(int64_t)a3;
- (void)setDefaultValues;
- (void)setHomeScreenParallaxSettings:(id)a3;
- (void)setLockScreenParallaxSettings:(id)a3;
- (void)setResetWallpaperOutlet:(id)a3;
@end

@implementation PBUIWallpaperPrototypeSettings

- (id)parallaxSettingsForVariant:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.super.isa + *off_1E62B4B80[a3 + 1]);
  }
  return v4;
}

- (void)setDefaultValues
{
  v47.receiver = self;
  v47.super_class = (Class)PBUIWallpaperPrototypeSettings;
  [(PTSettings *)&v47 setDefaultValues];
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  v5 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
  [v5 setSlideEnabled:1];

  v6 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
  [v6 setSlideDirectionX:-1];

  v7 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
  [v7 setSlideDirectionY:-1];

  v8 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
  v9 = v8;
  if (v4 == 1)
  {
    [v8 setSlidePixelsX:30.0];

    v10 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v10 setSlidePixelsY:40.0];

    v11 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v11 setTiltEnabled:1];

    v12 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v12 setTiltDirectionX:-1];

    v13 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v13 setTiltDirectionY:-1];

    v14 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v14 setTiltDegreesX:3.3];

    v15 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v15 setTiltDegreesY:5.7];

    v16 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v16 setDistanceFromScreen:-100];

    v17 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v17 setIncreaseEnabled:1];

    v18 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v18 setSlideIncreaseY:50.0];

    v19 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v19 setSlideEnabled:1];

    v20 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v20 setSlideDirectionX:-1];

    v21 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v21 setSlideDirectionY:-1];

    v22 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v22 setSlidePixelsX:60.0];

    v23 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    v24 = v23;
    double v25 = 80.0;
  }
  else
  {
    [v8 setSlidePixelsX:10.0];

    v26 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v26 setSlidePixelsY:12.0];

    v27 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v27 setTiltEnabled:1];

    v28 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v28 setTiltDirectionX:-1];

    v29 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v29 setTiltDirectionY:-1];

    v30 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v30 setTiltDegreesX:3.3];

    v31 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v31 setTiltDegreesY:5.7];

    v32 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v32 setDistanceFromScreen:-100];

    v33 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v33 setIncreaseEnabled:1];

    v34 = [(PBUIWallpaperPrototypeSettings *)self homeScreenParallaxSettings];
    [v34 setSlideIncreaseY:50.0];

    v35 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v35 setSlideEnabled:1];

    v36 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v36 setSlideDirectionX:-1];

    v37 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v37 setSlideDirectionY:-1];

    v38 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    [v38 setSlidePixelsX:30.0];

    v23 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
    v24 = v23;
    double v25 = 40.0;
  }
  [v23 setSlidePixelsY:v25];

  v39 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v39 setTiltEnabled:1];

  v40 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v40 setTiltDirectionX:-1];

  v41 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v41 setTiltDirectionY:-1];

  v42 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v42 setTiltDegreesX:3.3];

  v43 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v43 setTiltDegreesY:5.7];

  v44 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v44 setDistanceFromScreen:-100];

  v45 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v45 setIncreaseEnabled:1];

  v46 = [(PBUIWallpaperPrototypeSettings *)self lockScreenParallaxSettings];
  [v46 setSlideIncreaseY:50.0];
}

+ (id)settingsControllerModule
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Home Screen Parallax" childSettingsKeyPath:@"homeScreenParallaxSettings"];
  v18[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Lock Screen Parallax" childSettingsKeyPath:@"lockScreenParallaxSettings"];
  v18[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  v5 = [MEMORY[0x1E4F94160] sectionWithRows:v4];
  v6 = (void *)MEMORY[0x1E4F940F8];
  v7 = [MEMORY[0x1E4F94170] action];
  v8 = [v6 rowWithTitle:@"Restore Defaults" action:v7];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Set Default Wallpaper (Kills SpringBoard)" outletKeyPath:@"resetWallpaperOutlet"];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v11 = [MEMORY[0x1E4F94160] sectionWithRows:v10];
  v12 = (void *)MEMORY[0x1E4F94160];
  v16[0] = v5;
  v16[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v14 = [v12 moduleWithTitle:@"Wallpaper" contents:v13];

  return v14;
}

- (PTOutlet)resetWallpaperOutlet
{
  return self->_resetWallpaperOutlet;
}

- (void)setResetWallpaperOutlet:(id)a3
{
}

- (PBUIWallpaperParallaxSettings)homeScreenParallaxSettings
{
  return self->_homeScreenParallaxSettings;
}

- (void)setHomeScreenParallaxSettings:(id)a3
{
}

- (PBUIWallpaperParallaxSettings)lockScreenParallaxSettings
{
  return self->_lockScreenParallaxSettings;
}

- (void)setLockScreenParallaxSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenParallaxSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenParallaxSettings, 0);
  objc_storeStrong((id *)&self->_resetWallpaperOutlet, 0);
}

@end