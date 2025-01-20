@interface SBHHomeScreenSettings
+ (id)homeScreenDefaults;
+ (id)settingsControllerModule;
- (BOOL)showPopOvers;
- (BOOL)usesMinimumViableHomeScreen;
- (SBHAppLibrarySettings)appLibrarySettings;
- (SBHFolderSettings)folderSettings;
- (SBHHomePullToSearchSettings)coversheetPullToSearchSettings;
- (SBHHomePullToSearchSettings)homeScreenPullToSearchSettings;
- (SBHHomePullToSearchSettings)libraryPullToSearchSettings;
- (SBHHomePullToSearchSettings)todayViewPullToSearchSettings;
- (SBHIconAnimationRootSettings)iconAnimationSettings;
- (SBHIconEditingSettings)iconEditingSettings;
- (SBHIconResizingSettings)iconResizingSettings;
- (SBHIconSettings)iconSettings;
- (SBHRootFolderSettings)rootFolderSettings;
- (SBHWidgetIntroductionSettings)widgetIntroductionSettings;
- (SBHWidgetSettings)widgetSettings;
- (void)setAppLibrarySettings:(id)a3;
- (void)setCoversheetPullToSearchSettings:(id)a3;
- (void)setDefaultValues;
- (void)setFolderSettings:(id)a3;
- (void)setHomeScreenPullToSearchSettings:(id)a3;
- (void)setIconAnimationSettings:(id)a3;
- (void)setIconEditingSettings:(id)a3;
- (void)setIconResizingSettings:(id)a3;
- (void)setIconSettings:(id)a3;
- (void)setLibraryPullToSearchSettings:(id)a3;
- (void)setRootFolderSettings:(id)a3;
- (void)setShowPopOvers:(BOOL)a3;
- (void)setTodayViewPullToSearchSettings:(id)a3;
- (void)setUsesMinimumViableHomeScreen:(BOOL)a3;
- (void)setWidgetIntroductionSettings:(id)a3;
- (void)setWidgetSettings:(id)a3;
@end

@implementation SBHHomeScreenSettings

- (SBHFolderSettings)folderSettings
{
  return self->_folderSettings;
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

- (SBHIconResizingSettings)iconResizingSettings
{
  return self->_iconResizingSettings;
}

- (SBHIconSettings)iconSettings
{
  return self->_iconSettings;
}

+ (id)homeScreenDefaults
{
  if (homeScreenDefaults_onceToken_0 != -1) {
    dispatch_once(&homeScreenDefaults_onceToken_0, &__block_literal_global_25);
  }
  v2 = (void *)homeScreenDefaults_homeScreenDefaults_0;
  return v2;
}

void __43__SBHHomeScreenSettings_homeScreenDefaults__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA60A0]);
  v1 = (void *)homeScreenDefaults_homeScreenDefaults_0;
  homeScreenDefaults_homeScreenDefaults_0 = (uint64_t)v0;
}

- (void)setDefaultValues
{
  v17.receiver = self;
  v17.super_class = (Class)SBHHomeScreenSettings;
  [(PTSettings *)&v17 setDefaultValues];
  [(SBHHomeScreenSettings *)self setUsesMinimumViableHomeScreen:0];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(SBHHomeScreenSettings *)self setShowPopOvers:(v4 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v5 = [(SBHHomeScreenSettings *)self homeScreenPullToSearchSettings];
  [v5 setDefaultValues];

  v6 = [(SBHHomeScreenSettings *)self todayViewPullToSearchSettings];
  [v6 setDefaultValues];
  [v6 setPullTransitionDistance:75.0];
  [v6 setPullTransitionActivationThreshold:37.5];
  [v6 setPullTransitionRubberbandThreshold:75.0];
  [v6 setPullGestureBeganFromTopLeeway:75.0];
  [v6 setAllowsKeyboardWhileInteractive:0];
  v7 = [(SBHHomeScreenSettings *)self coversheetPullToSearchSettings];
  [v7 setDefaultValues];
  [v7 setPullTransitionDistance:75.0];
  [v7 setPullTransitionActivationThreshold:37.5];
  [v7 setPullTransitionRubberbandThreshold:75.0];
  [v7 setPullGestureBeganFromTopLeeway:75.0];
  if ((SBHSearchAffordancePresentationAnimationEnabled([v7 setAllowsKeyboardWhileInteractive:0]) & 1) == 0)
  {
    v8 = [(SBHHomeScreenSettings *)self todayViewPullToSearchSettings];
    v9 = [v8 pullTransitionAnimationSettings];

    [v9 setDampingRatio:1.0];
    [v9 setResponse:0.54];
    v10 = [(SBHHomeScreenSettings *)self homeScreenPullToSearchSettings];
    [v10 setSearchContentFadeInStartThreshold:0.25];

    v11 = [(SBHHomeScreenSettings *)self todayViewPullToSearchSettings];
    [v11 setSearchContentFadeInStartThreshold:0.3];

    v12 = [(SBHHomeScreenSettings *)self coversheetPullToSearchSettings];
    [v12 setSearchContentFadeInStartThreshold:0.3];
  }
  v13 = [(SBHHomeScreenSettings *)self libraryPullToSearchSettings];
  [v13 setDefaultValues];
  [v13 setPullTransitionDistance:100.0];
  [v13 setPullTransitionActivationThreshold:0.5];
  [v13 setPullGestureBeganFromTopLeeway:100.0];
  v14 = [v13 pullTransitionAnimationSettings];
  [v14 setDampingRatio:1.0];
  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  [v14 setResponse:dbl_1D81E51D0[(v16 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
}

+ (id)settingsControllerModule
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Minimum Viable Home Screen" valueKeyPath:@"usesMinimumViableHomeScreen"];
  v37[0] = v2;
  v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Popovers in Quick Actions" valueKeyPath:@"showPopOvers"];
  v37[1] = v3;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

  v32 = [MEMORY[0x1E4F94160] sectionWithRows:v28 title:@"Features"];
  v31 = [MEMORY[0x1E4F94130] rowWithTitle:@"Icons" childSettingsKeyPath:@"iconSettings"];
  v36[0] = v31;
  v30 = [MEMORY[0x1E4F94130] rowWithTitle:@"Folders" childSettingsKeyPath:@"folderSettings"];
  v36[1] = v30;
  v29 = [MEMORY[0x1E4F94130] rowWithTitle:@"Root Folder" childSettingsKeyPath:@"rootFolderSettings"];
  v36[2] = v29;
  v27 = [MEMORY[0x1E4F94130] rowWithTitle:@"Icon Editing" childSettingsKeyPath:@"iconEditingSettings"];
  v36[3] = v27;
  uint64_t v4 = [MEMORY[0x1E4F94130] rowWithTitle:@"Icon Resizing" childSettingsKeyPath:@"iconResizingSettings"];
  v36[4] = v4;
  v5 = [MEMORY[0x1E4F94130] rowWithTitle:@"Widgets" childSettingsKeyPath:@"widgetSettings"];
  v36[5] = v5;
  v6 = [MEMORY[0x1E4F94130] rowWithTitle:@"Widget Introduction" childSettingsKeyPath:@"widgetIntroductionSettings"];
  v36[6] = v6;
  v7 = [MEMORY[0x1E4F94130] rowWithTitle:@"App Library" childSettingsKeyPath:@"appLibrarySettings"];
  v36[7] = v7;
  v8 = [MEMORY[0x1E4F94130] rowWithTitle:@"Home Screen Pull-to-Search" childSettingsKeyPath:@"homeScreenPullToSearchSettings"];
  v36[8] = v8;
  v9 = [MEMORY[0x1E4F94130] rowWithTitle:@"Today View Pull-to-Search" childSettingsKeyPath:@"todayViewPullToSearchSettings"];
  v36[9] = v9;
  v10 = [MEMORY[0x1E4F94130] rowWithTitle:@"Coversheet Pull-to-Search" childSettingsKeyPath:@"coversheetPullToSearchSettings"];
  v36[10] = v10;
  v11 = [MEMORY[0x1E4F94130] rowWithTitle:@"App Library Pull-to-Search" childSettingsKeyPath:@"libraryPullToSearchSettings"];
  v36[11] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:12];

  v13 = [MEMORY[0x1E4F94160] sectionWithRows:v12];
  v14 = (void *)MEMORY[0x1E4F94160];
  v15 = [MEMORY[0x1E4F94130] rowWithTitle:@"Icon Animations" childSettingsKeyPath:@"iconAnimationSettings"];
  v35 = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  objc_super v17 = [v14 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F940F8];
  v19 = [MEMORY[0x1E4F94170] action];
  v20 = [v18 rowWithTitle:@"Restore Defaults" action:v19];
  v34 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];

  v22 = [MEMORY[0x1E4F94160] sectionWithRows:v21];
  v23 = (void *)MEMORY[0x1E4F94160];
  v33[0] = v32;
  v33[1] = v13;
  v33[2] = v17;
  v33[3] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  v25 = [v23 moduleWithTitle:0 contents:v24];

  return v25;
}

- (BOOL)usesMinimumViableHomeScreen
{
  return self->_usesMinimumViableHomeScreen;
}

- (void)setUsesMinimumViableHomeScreen:(BOOL)a3
{
  self->_usesMinimumViableHomeScreen = a3;
}

- (BOOL)showPopOvers
{
  return self->_showPopOvers;
}

- (void)setShowPopOvers:(BOOL)a3
{
  self->_showPopOvers = a3;
}

- (SBHIconAnimationRootSettings)iconAnimationSettings
{
  return self->_iconAnimationSettings;
}

- (void)setIconAnimationSettings:(id)a3
{
}

- (void)setIconSettings:(id)a3
{
}

- (void)setFolderSettings:(id)a3
{
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (void)setRootFolderSettings:(id)a3
{
}

- (void)setIconEditingSettings:(id)a3
{
}

- (void)setIconResizingSettings:(id)a3
{
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
}

- (SBHAppLibrarySettings)appLibrarySettings
{
  return self->_appLibrarySettings;
}

- (void)setAppLibrarySettings:(id)a3
{
}

- (SBHHomePullToSearchSettings)homeScreenPullToSearchSettings
{
  return self->_homeScreenPullToSearchSettings;
}

- (void)setHomeScreenPullToSearchSettings:(id)a3
{
}

- (SBHHomePullToSearchSettings)todayViewPullToSearchSettings
{
  return self->_todayViewPullToSearchSettings;
}

- (void)setTodayViewPullToSearchSettings:(id)a3
{
}

- (SBHHomePullToSearchSettings)coversheetPullToSearchSettings
{
  return self->_coversheetPullToSearchSettings;
}

- (void)setCoversheetPullToSearchSettings:(id)a3
{
}

- (SBHHomePullToSearchSettings)libraryPullToSearchSettings
{
  return self->_libraryPullToSearchSettings;
}

- (void)setLibraryPullToSearchSettings:(id)a3
{
}

- (SBHWidgetIntroductionSettings)widgetIntroductionSettings
{
  return self->_widgetIntroductionSettings;
}

- (void)setWidgetIntroductionSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIntroductionSettings, 0);
  objc_storeStrong((id *)&self->_libraryPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_coversheetPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_todayViewPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_appLibrarySettings, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_iconResizingSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_iconAnimationSettings, 0);
}

@end