@interface SBHIconAnimationRootSettings
+ (id)settingsControllerModule;
- (SBHCenterAcceleratedAppSuspendSettings)centerAcceleratedSuspendSettings;
- (SBHCenterAppLaunchSettings)centerLaunchSettings;
- (SBHCenterAppSuspendSettings)centerSuspendSettings;
- (SBHCrossfadeAcceleratedAppSuspendSettings)crossfadeAcceleratedSuspendSettings;
- (SBHCrossfadeAppLaunchSettings)crossfadeLaunchSettings;
- (SBHCrossfadeAppSuspendSettings)crossfadeSuspendSettings;
- (SBHFolderCloseSettings)folderCloseSettings;
- (SBHFolderOpenSettings)folderOpenSettings;
- (SBHLibraryIndicatorIconSettings)libraryIndicatorIconSettings;
- (SBHLibraryPodCloseSettings)libraryPodCloseSettings;
- (SBHLibraryPodOpenSettings)libraryPodOpenSettings;
- (SBHLibraryWaveCloseSettings)libraryWaveCloseSettings;
- (SBHLibraryWaveOpenSettings)libraryWaveOpenSettings;
- (SBHReducedMotionFadeSettings)reducedMotionSettings;
- (SBHUnlockSettings)unlockSettings;
- (double)maxAppLaunchWallpaperScale;
- (double)maxAppSuspendHintProgress;
- (double)maxFolderCloseHintProgress;
- (void)setCenterAcceleratedSuspendSettings:(id)a3;
- (void)setCenterLaunchSettings:(id)a3;
- (void)setCenterSuspendSettings:(id)a3;
- (void)setCrossfadeAcceleratedSuspendSettings:(id)a3;
- (void)setCrossfadeLaunchSettings:(id)a3;
- (void)setCrossfadeSuspendSettings:(id)a3;
- (void)setDefaultValues;
- (void)setFolderCloseSettings:(id)a3;
- (void)setFolderOpenSettings:(id)a3;
- (void)setLibraryIndicatorIconSettings:(id)a3;
- (void)setLibraryPodCloseSettings:(id)a3;
- (void)setLibraryPodOpenSettings:(id)a3;
- (void)setLibraryWaveCloseSettings:(id)a3;
- (void)setLibraryWaveOpenSettings:(id)a3;
- (void)setMaxAppLaunchWallpaperScale:(double)a3;
- (void)setMaxAppSuspendHintProgress:(double)a3;
- (void)setMaxFolderCloseHintProgress:(double)a3;
- (void)setReducedMotionSettings:(id)a3;
- (void)setUnlockSettings:(id)a3;
@end

@implementation SBHIconAnimationRootSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconAnimationRootSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHIconAnimationRootSettings *)self setMaxAppSuspendHintProgress:0.05];
  [(SBHIconAnimationRootSettings *)self setMaxAppLaunchWallpaperScale:1.1];
  [(SBHIconAnimationRootSettings *)self setMaxFolderCloseHintProgress:0.1];
}

+ (id)settingsControllerModule
{
  v48[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94130] rowWithTitle:@"Reduced Motion" childSettingsKeyPath:@"reducedMotionSettings"];
  v48[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];

  v41 = [MEMORY[0x1E4F94160] sectionWithRows:v3 title:0];
  v4 = [MEMORY[0x1E4F94130] rowWithTitle:@"Unlock" childSettingsKeyPath:@"unlockSettings"];
  v47 = v4;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];

  v40 = [MEMORY[0x1E4F94160] sectionWithRows:v38 title:0];
  v39 = [MEMORY[0x1E4F94130] rowWithTitle:@"Center Launch" childSettingsKeyPath:@"centerLaunchSettings"];
  v46[0] = v39;
  v5 = [MEMORY[0x1E4F94130] rowWithTitle:@"Center Suspend" childSettingsKeyPath:@"centerSuspendSettings"];
  v46[1] = v5;
  v6 = [MEMORY[0x1E4F94130] rowWithTitle:@"Center Accelerated Suspend" childSettingsKeyPath:@"centerAcceleratedSuspendSettings"];
  v46[2] = v6;
  v7 = [MEMORY[0x1E4F94130] rowWithTitle:@"Crossfade Launch" childSettingsKeyPath:@"crossfadeLaunchSettings"];
  v46[3] = v7;
  v8 = [MEMORY[0x1E4F94130] rowWithTitle:@"Crossfade Suspend" childSettingsKeyPath:@"crossfadeSuspendSettings"];
  v46[4] = v8;
  v9 = [MEMORY[0x1E4F94130] rowWithTitle:@"Crossfade Accelerated Suspend" childSettingsKeyPath:@"crossfadeAcceleratedSuspendSettings"];
  v46[5] = v9;
  v10 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Suspend Hint Progress" valueKeyPath:@"maxAppSuspendHintProgress"];
  v11 = [v10 minValue:0.0 maxValue:1.0];
  v46[6] = v11;
  v12 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max App Launch Wallpaper Scale" valueKeyPath:@"maxAppLaunchWallpaperScale"];
  v13 = [v12 minValue:1.0 maxValue:3.0];
  v46[7] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:8];

  v15 = [MEMORY[0x1E4F94160] sectionWithRows:v14 title:@"Launch/Suspend Animations"];
  v16 = [MEMORY[0x1E4F94130] rowWithTitle:@"Folder Open" childSettingsKeyPath:@"folderOpenSettings"];
  v45[0] = v16;
  v17 = [MEMORY[0x1E4F94130] rowWithTitle:@"Folder Close" childSettingsKeyPath:@"folderCloseSettings"];
  v45[1] = v17;
  v18 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max Close Hint Progress" valueKeyPath:@"maxFolderCloseHintProgress"];
  v19 = [v18 minValue:0.0 maxValue:1.0];
  v45[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];

  v21 = [MEMORY[0x1E4F94160] sectionWithRows:v20 title:@"Folder Animations"];
  v22 = [MEMORY[0x1E4F94130] rowWithTitle:@"Library Wave Open" childSettingsKeyPath:@"libraryWaveOpenSettings"];
  v44[0] = v22;
  v23 = [MEMORY[0x1E4F94130] rowWithTitle:@"Library Wave Close" childSettingsKeyPath:@"libraryWaveCloseSettings"];
  v44[1] = v23;
  v24 = [MEMORY[0x1E4F94130] rowWithTitle:@"Library Pod Open" childSettingsKeyPath:@"libraryPodOpenSettings"];
  v44[2] = v24;
  v25 = [MEMORY[0x1E4F94130] rowWithTitle:@"Library Pod Close" childSettingsKeyPath:@"libraryPodCloseSettings"];
  v44[3] = v25;
  v26 = [MEMORY[0x1E4F94130] rowWithTitle:@"Library Indicator Icon" childSettingsKeyPath:@"libraryIndicatorIconSettings"];
  v44[4] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];

  v28 = [MEMORY[0x1E4F94160] sectionWithRows:v27 title:@"Library Animations"];
  v29 = (void *)MEMORY[0x1E4F940F8];
  v30 = [MEMORY[0x1E4F94170] action];
  v31 = [v29 rowWithTitle:@"Restore Defaults" action:v30];
  v43 = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];

  v33 = [MEMORY[0x1E4F94160] sectionWithRows:v32];
  v34 = (void *)MEMORY[0x1E4F94160];
  v42[0] = v41;
  v42[1] = v40;
  v42[2] = v15;
  v42[3] = v28;
  v42[4] = v21;
  v42[5] = v33;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:6];
  v36 = [v34 moduleWithTitle:@"Icon Animations" contents:v35];

  return v36;
}

- (SBHReducedMotionFadeSettings)reducedMotionSettings
{
  return self->_reducedMotionSettings;
}

- (void)setReducedMotionSettings:(id)a3
{
}

- (SBHUnlockSettings)unlockSettings
{
  return self->_unlockSettings;
}

- (void)setUnlockSettings:(id)a3
{
}

- (SBHCenterAppLaunchSettings)centerLaunchSettings
{
  return self->_centerLaunchSettings;
}

- (void)setCenterLaunchSettings:(id)a3
{
}

- (SBHCenterAppSuspendSettings)centerSuspendSettings
{
  return self->_centerSuspendSettings;
}

- (void)setCenterSuspendSettings:(id)a3
{
}

- (SBHCenterAcceleratedAppSuspendSettings)centerAcceleratedSuspendSettings
{
  return self->_centerAcceleratedSuspendSettings;
}

- (void)setCenterAcceleratedSuspendSettings:(id)a3
{
}

- (SBHCrossfadeAppLaunchSettings)crossfadeLaunchSettings
{
  return self->_crossfadeLaunchSettings;
}

- (void)setCrossfadeLaunchSettings:(id)a3
{
}

- (SBHCrossfadeAppSuspendSettings)crossfadeSuspendSettings
{
  return self->_crossfadeSuspendSettings;
}

- (void)setCrossfadeSuspendSettings:(id)a3
{
}

- (SBHCrossfadeAcceleratedAppSuspendSettings)crossfadeAcceleratedSuspendSettings
{
  return self->_crossfadeAcceleratedSuspendSettings;
}

- (void)setCrossfadeAcceleratedSuspendSettings:(id)a3
{
}

- (double)maxAppSuspendHintProgress
{
  return self->_maxAppSuspendHintProgress;
}

- (void)setMaxAppSuspendHintProgress:(double)a3
{
  self->_maxAppSuspendHintProgress = a3;
}

- (double)maxAppLaunchWallpaperScale
{
  return self->_maxAppLaunchWallpaperScale;
}

- (void)setMaxAppLaunchWallpaperScale:(double)a3
{
  self->_maxAppLaunchWallpaperScale = a3;
}

- (SBHFolderOpenSettings)folderOpenSettings
{
  return self->_folderOpenSettings;
}

- (void)setFolderOpenSettings:(id)a3
{
}

- (SBHFolderCloseSettings)folderCloseSettings
{
  return self->_folderCloseSettings;
}

- (void)setFolderCloseSettings:(id)a3
{
}

- (double)maxFolderCloseHintProgress
{
  return self->_maxFolderCloseHintProgress;
}

- (void)setMaxFolderCloseHintProgress:(double)a3
{
  self->_maxFolderCloseHintProgress = a3;
}

- (SBHLibraryPodOpenSettings)libraryPodOpenSettings
{
  return self->_libraryPodOpenSettings;
}

- (void)setLibraryPodOpenSettings:(id)a3
{
}

- (SBHLibraryPodCloseSettings)libraryPodCloseSettings
{
  return self->_libraryPodCloseSettings;
}

- (void)setLibraryPodCloseSettings:(id)a3
{
}

- (SBHLibraryWaveOpenSettings)libraryWaveOpenSettings
{
  return self->_libraryWaveOpenSettings;
}

- (void)setLibraryWaveOpenSettings:(id)a3
{
}

- (SBHLibraryWaveCloseSettings)libraryWaveCloseSettings
{
  return self->_libraryWaveCloseSettings;
}

- (void)setLibraryWaveCloseSettings:(id)a3
{
}

- (SBHLibraryIndicatorIconSettings)libraryIndicatorIconSettings
{
  return self->_libraryIndicatorIconSettings;
}

- (void)setLibraryIndicatorIconSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIndicatorIconSettings, 0);
  objc_storeStrong((id *)&self->_libraryWaveCloseSettings, 0);
  objc_storeStrong((id *)&self->_libraryWaveOpenSettings, 0);
  objc_storeStrong((id *)&self->_libraryPodCloseSettings, 0);
  objc_storeStrong((id *)&self->_libraryPodOpenSettings, 0);
  objc_storeStrong((id *)&self->_folderCloseSettings, 0);
  objc_storeStrong((id *)&self->_folderOpenSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeAcceleratedSuspendSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeSuspendSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeLaunchSettings, 0);
  objc_storeStrong((id *)&self->_centerAcceleratedSuspendSettings, 0);
  objc_storeStrong((id *)&self->_centerSuspendSettings, 0);
  objc_storeStrong((id *)&self->_centerLaunchSettings, 0);
  objc_storeStrong((id *)&self->_unlockSettings, 0);
  objc_storeStrong((id *)&self->_reducedMotionSettings, 0);
}

@end