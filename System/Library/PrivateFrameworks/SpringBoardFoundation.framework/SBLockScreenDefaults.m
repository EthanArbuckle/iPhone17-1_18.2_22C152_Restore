@interface SBLockScreenDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBLockScreenDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"limitFeaturesForRemoteLock"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBFeaturesLockedForRemoteLock" toDefaultValue:MEMORY[0x1E4F1CC28] options:6];

  v5 = [NSString stringWithUTF8String:"showLegalText"];
  v6 = [NSNumber numberWithBool:MEMORY[0x18C132BD0]("-[SBLockScreenDefaults _bindAndRegisterDefaults]")];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBShowLegalTextOnLockScreen" toDefaultValue:v6 options:1];

  v7 = [NSString stringWithUTF8String:"showAuthenticationEngineeringUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBShowAuthenticationEngineeringUI" toDefaultValue:v4 options:4];

  v8 = [NSString stringWithUTF8String:"showSupervisionText"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBShowSupervisionTextOnLockScreen" toDefaultValue:v4 options:1];

  v9 = [NSString stringWithUTF8String:"showQuickNoteFingerGestureRecognizer"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBShowQuickNoteFingerGestureRecognizer" toDefaultValue:v4 options:1];

  v10 = [NSString stringWithUTF8String:"forceWakeToMaps"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBCoverSheetForceWakeToMaps" toDefaultValue:v4 options:1];

  v11 = [NSString stringWithUTF8String:"nowPlayingTimeout"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBCoverSheetPlayerTimeout" toDefaultValue:&unk_1ED89EC48 options:1];

  v12 = [NSString stringWithUTF8String:"weDontNeedNoEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBCoverSheetWeDontNeedNoEducation" toDefaultValue:v4 options:1];

  v13 = [NSString stringWithUTF8String:"useDefaultsValuesForCameraPrewarm"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBCoverSheetUseDefaultsValuesForCameraPrewarm" toDefaultValue:v4 options:1];

  v14 = [NSString stringWithUTF8String:"prewarmCameraOnSwipe"];
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBCoverSheetPrewarmCameraOnSwipe" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v16 = [NSString stringWithUTF8String:"cameraSwipePrewarmThreshold"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"SBCoverSheetCameraPrewarmThreshold" toDefaultValue:&unk_1ED89EC58 options:1];

  v17 = [NSString stringWithUTF8String:"prelaunchCameraOnSwipe"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"SBCoverSheetPrelaunchCameraOnSwipe" toDefaultValue:v15 options:1];

  v18 = [NSString stringWithUTF8String:"cameraSwipePrelaunchThreshold"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"SBCoverSheetCameraPrelaunchThreshold" toDefaultValue:&unk_1ED89EC58 options:1];

  v19 = [NSString stringWithUTF8String:"prewarmCameraOnButtonTouch"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"SBCoverSheetPrewarmCameraOnButtonTouch" toDefaultValue:v15 options:1];

  v20 = [NSString stringWithUTF8String:"prelaunchCameraOnButtonTouch"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v20 withDefaultKey:@"SBCoverSheetPrelaunchCameraOnButtonTouch" toDefaultValue:v15 options:1];

  v21 = [NSString stringWithUTF8String:"useDefaultsValuesForDateTimeOverrides"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v21 withDefaultKey:@"SBCoverSheetUseDefaultsForDateTimeOverrides" toDefaultValue:v4 options:1];

  v22 = [NSString stringWithUTF8String:"dateTimeOverridesIntervalSince1970"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v22 withDefaultKey:@"SBCoverSheetOverridesDateTimeIntervalSince1970" toDefaultValue:&unk_1ED89E4E8 options:1];

  v23 = [NSString stringWithUTF8String:"overridesDateTimeToDefaultToday"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v23 withDefaultKey:@"SBCoverSheetOverridesDateTimeToDefaultToday" toDefaultValue:v4 options:1];

  v24 = [NSString stringWithUTF8String:"overridesDateTimeToDefaultPast"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v24 withDefaultKey:@"SBCoverSheetOverridesDateTimeToDefaultPast" toDefaultValue:v4 options:1];

  v25 = [NSString stringWithUTF8String:"sessionTestWidgetInfo"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v25 withDefaultKey:@"SBCoverSheetSessionTestWidgetInfo" toDefaultValue:0 options:4];

  v26 = [NSString stringWithUTF8String:"quickActionOverrideBundleLeading"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v26 withDefaultKey:@"SBCoverSheetQuickActionOverrideBundleLeading" toDefaultValue:0 options:4];

  v27 = [NSString stringWithUTF8String:"quickActionOverrideContainerLeading"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v27 withDefaultKey:@"SBCoverSheetQuickActionOverrideContainerLeading" toDefaultValue:0 options:4];

  v28 = [NSString stringWithUTF8String:"quickActionOverrideKindLeading"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v28 withDefaultKey:@"SBCoverSheetQuickActionOverrideKindLeading" toDefaultValue:0 options:4];

  v29 = [NSString stringWithUTF8String:"quickActionOverrideBundleTrailing"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v29 withDefaultKey:@"SBCoverSheetQuickActionOverrideBundleTrailing" toDefaultValue:0 options:4];

  v30 = [NSString stringWithUTF8String:"quickActionOverrideContainerTrailing"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v30 withDefaultKey:@"SBCoverSheetQuickActionOverrideContainerTrailing" toDefaultValue:0 options:4];

  id v31 = [NSString stringWithUTF8String:"quickActionOverrideKindTrailing"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v31 withDefaultKey:@"SBCoverSheetQuickActionOverrideKindTrailing" toDefaultValue:0 options:4];
}

@end