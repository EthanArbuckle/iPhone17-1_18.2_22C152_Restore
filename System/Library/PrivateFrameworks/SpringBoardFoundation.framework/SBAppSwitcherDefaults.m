@interface SBAppSwitcherDefaults
- (void)_bindAndRegisterDefaults;
- (void)clearLegacyDefaults;
@end

@implementation SBAppSwitcherDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"bottomEdgeGestureSwipeCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBSwitcherBottomEdgeGestureSwipeCount" toDefaultValue:&unk_1ED89E680 options:1];

  v4 = [NSString stringWithUTF8String:"springBoardKillable"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBKillableInAppSwitcher" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v6 = [NSString stringWithUTF8String:"trackpadSwitcherGesturesEnabled"];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBTrackpadSwitcherGesturesEnabled" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v8 = [NSString stringWithUTF8String:"recentsPlistRepresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBRecentAppLayoutsPlistRepresentation" toDefaultValue:0 options:1];

  v9 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBChamoisWindowingEnabled" toDefaultValue:v5 options:1];

  v10 = [NSString stringWithUTF8String:"chamoisEverEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBChamoisWindowingEverEnabled" toDefaultValue:v5 options:1];

  v11 = [NSString stringWithUTF8String:"chamoisHideStrips"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBChamoisHideStrips" toDefaultValue:v5 options:1];

  v12 = [NSString stringWithUTF8String:"chamoisHideDock"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBChamoisHideDock" toDefaultValue:v5 options:1];

  v13 = [NSString stringWithUTF8String:"chamoisHideStripsExternal"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBChamoisHideStripsExternal" toDefaultValue:v5 options:1];

  v14 = [NSString stringWithUTF8String:"chamoisHideDockExternal"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBChamoisHideDockExternal" toDefaultValue:v5 options:1];

  v15 = [NSString stringWithUTF8String:"legacyRecentApplications"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"SBRecentDisplays" toDefaultValue:0 options:1];

  v16 = [NSString stringWithUTF8String:"legacyRecentDisplayItems"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"SBRecentDisplayItems" toDefaultValue:0 options:1];

  v17 = [NSString stringWithUTF8String:"legacyRecentDisplayItemRoles"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"SBRecentDisplayItemRoles" toDefaultValue:0 options:1];

  v18 = [NSString stringWithUTF8String:"shouldShowSplitPeekEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"SBShouldShowSplitPeekEducation" toDefaultValue:v7 options:1];

  v19 = [NSString stringWithUTF8String:"shouldShowSlideOverPeekEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"SBShouldShowSlideOverPeekEducation" toDefaultValue:v7 options:1];

  v20 = [NSString stringWithUTF8String:"medusaMultitaskingEnabled"];
  v21 = NSNumber;
  int v22 = __sb__runningInSpringBoard();
  char v23 = v22;
  if (v22)
  {
    BOOL v24 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    v14 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v24 = [v14 userInterfaceIdiom] == 1;
  }
  v25 = [v21 numberWithInt:v24];
  [(BSAbstractDefaultDomain *)self _bindProperty:v20 withDefaultKey:@"SBMedusaMultitaskingEnabled" toDefaultValue:v25 options:1];

  if ((v23 & 1) == 0) {
  id v26 = [NSString stringWithUTF8String:"shouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates"];
  }
  [(BSAbstractDefaultDomain *)self _bindProperty:v26 withDefaultKey:@"SBShouldToggleExternalDisplayMirroringWhenWindowManagementStyleUpdates" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];
}

- (void)clearLegacyDefaults
{
  v3 = [(BSAbstractDefaultDomain *)self _store];
  [v3 removeObjectForKey:@"SBRecentDisplays"];

  v4 = [(BSAbstractDefaultDomain *)self _store];
  [v4 removeObjectForKey:@"SBRecentDisplayItems"];

  id v5 = [(BSAbstractDefaultDomain *)self _store];
  [v5 removeObjectForKey:@"SBRecentDisplayItemRoles"];
}

@end