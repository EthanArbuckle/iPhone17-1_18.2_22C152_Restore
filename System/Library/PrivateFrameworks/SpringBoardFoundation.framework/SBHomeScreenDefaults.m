@interface SBHomeScreenDefaults
- (BOOL)automaticallyAddsNewApplicationsExists;
- (id)iconTintColor;
- (id)observeIconTintColorOnQueue:(id)a3 withBlock:(id)a4;
- (void)_bindAndRegisterDefaults;
- (void)setIconTintColor:(id)a3;
@end

@implementation SBHomeScreenDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"sidebarPinned"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBHomeSidebarIsPinned" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"shouldUseLargeDefaultSizedIcons"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBHomeLargeIcons" toDefaultValue:v4 options:1];

  v6 = [NSString stringWithUTF8String:"shouldUseLargeIcons"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBHomeHideLabels" toDefaultValue:v4 options:1];

  v7 = [NSString stringWithUTF8String:"shouldFudgeShortcutsToCauseMaximumPain"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBFudgeShortcutsToCauseMaximumPain" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"shouldHideReportWidgetStackRotationQuickAction"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBHideReportWidgetStackRotationQuickAction" toDefaultValue:v4 options:1];

  v9 = [NSString stringWithUTF8String:"shouldPrepareDefaultTodayList"];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBShouldResetDefaultTodayList" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v11 = [NSString stringWithUTF8String:"shouldPrepareStackForDefaultTodayList"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBShouldResetStackForDefaultTodayList" toDefaultValue:v10 options:1];

  v12 = [NSString stringWithUTF8String:"shouldUpgradeEnableWidgetSuggestions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBShouldUpgradeEnableWidgetSuggestions" toDefaultValue:v10 options:1];

  v13 = [NSString stringWithUTF8String:"shouldAddDefaultWidgetsToHomeScreen"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBShouldAddDefaultWidgetsToHomeScreen" toDefaultValue:v10 options:1];

  v14 = [NSString stringWithUTF8String:"enableModalWidgetDiscoverabilityForTesting"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBEnableModalWidgetDiscoverabilityForTesting" toDefaultValue:v4 options:1];

  v15 = [NSString stringWithUTF8String:"overriddenScreenType"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"SBHomeScreenScreenTypeOverride" toDefaultValue:0 options:1];

  v16 = [NSString stringWithUTF8String:"automaticallyAddsNewApplications"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"SBHomeAutomaticallyAddsNewApplications" toDefaultValue:v10 options:1];

  v17 = [NSString stringWithUTF8String:"showsBadgesInAppLibrary"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"SBHomeScreenShowsBadgesInAppLibrary" toDefaultValue:v4 options:1];

  v18 = [NSString stringWithUTF8String:"showsHomeScreenSearchAffordance"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"SBHomeScreenShowsSearchAffordance" toDefaultValue:v10 options:1];

  v19 = [NSString stringWithUTF8String:"pagesHaveEverBeenHidden"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"SBHomeScreenPagesHaveEverBeenHidden" toDefaultValue:v4 options:1];

  v20 = [NSString stringWithUTF8String:"shouldShowLibraryEducationView"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v20 withDefaultKey:@"SBHomeShouldShowLibraryEducationView" toDefaultValue:v10 options:1];

  v21 = [NSString stringWithUTF8String:"shouldShowWidgetIntroductionPopover"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v21 withDefaultKey:@"SBShouldShowWidgetIntroductionPage" toDefaultValue:v10 options:1];

  v22 = [NSString stringWithUTF8String:"userHasDeletedSuggestedWidget"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v22 withDefaultKey:@"SBUserHasDeletedSuggestedWidget" toDefaultValue:v4 options:1];

  v23 = [NSString stringWithUTF8String:"userDidUndoSuggestedWidget"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v23 withDefaultKey:@"SBUserDidUndoSuggestedWidget" toDefaultValue:v4 options:1];

  v24 = [NSString stringWithUTF8String:"focusModesRequiringIntroduction"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v24 withDefaultKey:@"SBFocusModesRequiringIntroduction" toDefaultValue:0 options:8];

  v25 = [NSString stringWithUTF8String:"leftOfHomeAppBundleIdentifier"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v25 withDefaultKey:@"SBLeftOfHomeAppBundleIdentifier" toDefaultValue:0 options:1];

  v26 = [NSString stringWithUTF8String:"shouldIgnoreMinimumRequiredSDKVersionForWidgets"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v26 withDefaultKey:@"SBIgnoreMinimumRequiredSDKVersionForWidgets" toDefaultValue:v4 options:1];

  v27 = [NSString stringWithUTF8String:"iconTintColorData"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v27 withDefaultKey:@"SBHomeIconTintColor" toDefaultValue:0 options:1];

  v28 = [NSString stringWithUTF8String:"iconUserInterfaceStyle"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v28 withDefaultKey:@"SBHomeIconUserInterfaceStyle" toDefaultValue:@"light" options:1];

  v29 = [NSString stringWithUTF8String:"iconUserInterfaceStyleVariation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v29 withDefaultKey:@"SBHomeIconUserInterfaceStyleVariation" toDefaultValue:0 options:1];

  v30 = [NSString stringWithUTF8String:"iconUserInterfaceStyleLuminance"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v30 withDefaultKey:@"SBHomeIconUserInterfaceStyleLuminance" toDefaultValue:0 options:1];

  v31 = [NSString stringWithUTF8String:"iconUserInterfaceStyleSaturation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v31 withDefaultKey:@"SBHomeIconUserInterfaceStyleSaturation" toDefaultValue:0 options:1];

  v32 = [NSString stringWithUTF8String:"enableHomeScreenWallpaperDimming"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v32 withDefaultKey:@"SBEnableHomeScreenWallpaperDimming" toDefaultValue:v4 options:1];

  id v33 = [NSString stringWithUTF8String:"didMigrateHomeScreenDefaultsTintToPosterBoard"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v33 withDefaultKey:@"SBMigratedHomeScreenDefaultsTintToPosterBoard" toDefaultValue:v4 options:1];
}

- (BOOL)automaticallyAddsNewApplicationsExists
{
  v2 = [(BSAbstractDefaultDomain *)self _store];
  char v3 = objc_msgSend(v2, "bs_defaultExists:", @"SBHomeAutomaticallyAddsNewApplications");

  return v3;
}

- (id)iconTintColor
{
  v2 = [(BSAbstractDefaultDomain *)self _store];
  char v3 = [v2 dataForKey:@"SBHomeIconTintColor"];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    v5 = self;
    v6 = [v4 unarchivedObjectOfClass:v5 fromData:v3 error:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setIconTintColor:(id)a3
{
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
    uint64_t v4 = [(BSAbstractDefaultDomain *)self _store];
    [v4 setObject:v5 forKey:@"SBHomeIconTintColor"];
  }
  else
  {
    id v5 = [(BSAbstractDefaultDomain *)self _store];
    [v5 removeObjectForKey:@"SBHomeIconTintColor"];
  }
}

- (id)observeIconTintColorOnQueue:(id)a3 withBlock:(id)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 stringWithUTF8String:"iconTintColorData"];
  v16[0] = v9;
  uint64_t v10 = [NSString stringWithUTF8String:"iconUserInterfaceStyle"];
  v16[1] = v10;
  v11 = [NSString stringWithUTF8String:"iconUserInterfaceStyleLuminance"];
  v16[2] = v11;
  v12 = [NSString stringWithUTF8String:"iconUserInterfaceStyleVariation"];
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  v14 = [(BSAbstractDefaultDomain *)self observeDefaults:v13 onQueue:v8 withBlock:v7];

  return v14;
}

@end