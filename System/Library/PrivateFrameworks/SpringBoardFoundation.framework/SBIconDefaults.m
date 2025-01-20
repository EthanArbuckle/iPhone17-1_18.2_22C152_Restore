@interface SBIconDefaults
- (void)_bindAndRegisterDefaults;
- (void)clearLegacyDefaults;
@end

@implementation SBIconDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"maxIconListCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBMaxIconListCount" toDefaultValue:&unk_1ED89E4B8 options:1];

  v4 = [NSString stringWithUTF8String:"didShowIconReorderAlert"];
  v5 = [NSNumber numberWithBool:0];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBDidShowReorderText" toDefaultValue:v5 options:1];

  v6 = [NSString stringWithUTF8String:"shouldDisableLiveIcons"];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBDisableLiveIcons" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v8 = [NSString stringWithUTF8String:"suppressAppShortcutTruncation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBSuppressAppShortcutTruncation" toDefaultValue:@"NO" options:4];

  v9 = [NSString stringWithUTF8String:"suppressSetCurrentPage"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBFolderViewSuppressSetCurrentPage" toDefaultValue:v7 options:4];

  v10 = [NSString stringWithUTF8String:"legacyIconState"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"iconState" toDefaultValue:0 options:1];

  id v11 = [NSString stringWithUTF8String:"legacyIconState2"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"iconState2" toDefaultValue:0 options:1];
}

- (void)clearLegacyDefaults
{
  id v5 = [(BSAbstractDefaultDomain *)self _store];
  v3 = [v5 objectForKey:@"iconState"];
  if (v3)
  {
  }
  else
  {
    v4 = [v5 objectForKey:@"iconState2"];

    if (!v4) {
      goto LABEL_5;
    }
  }
  [v5 removeObjectForKey:@"iconState"];
  [v5 removeObjectForKey:@"iconState2"];
  [(BSAbstractDefaultDomain *)self synchronizeDefaults];
LABEL_5:
}

@end