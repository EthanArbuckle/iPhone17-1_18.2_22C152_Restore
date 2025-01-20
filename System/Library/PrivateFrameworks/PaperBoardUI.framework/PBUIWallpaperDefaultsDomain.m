@interface PBUIWallpaperDefaultsDomain
- (PBUIWallpaperDefaultsDomain)init;
- (void)_bindAndRegisterDefaults;
- (void)clearLegacyDefaults;
@end

@implementation PBUIWallpaperDefaultsDomain

- (PBUIWallpaperDefaultsDomain)init
{
  return (PBUIWallpaperDefaultsDomain *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"homeScreenWallpapers"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBHomeScreenWallpapers" toDefaultValue:0 options:1];

  v4 = [NSString stringWithUTF8String:"lockScreenWallpapers"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBLockScreenWallpapers" toDefaultValue:0 options:1];

  v5 = [NSString stringWithUTF8String:"enableWallpaperDimming"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBEnableWallpaperDimming" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"dateWallpaperLastChanged"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBWallpaperLastChangeUserDefaultKey" toDefaultValue:0 options:1];

  v8 = [NSString stringWithUTF8String:"dateIrisWallpaperLastPlayed"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBIrisActivationDateUserDefaultKey" toDefaultValue:0 options:1];

  v9 = [NSString stringWithUTF8String:"irisWallpaperPlayCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBIrisActivationCountUserDefaultKey" toDefaultValue:&unk_1F162C6F0 options:1];

  id v10 = [NSString stringWithUTF8String:"legacyUsesUniqueHomeScreenWallpaper"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBUseUniqueHomeScreenWallpaper" toDefaultValue:v6 options:1];
}

- (void)clearLegacyDefaults
{
  v3 = [(BSAbstractDefaultDomain *)self _store];
  [v3 removeObjectForKey:@"SBUseUniqueHomeScreenWallpaper"];

  [(BSAbstractDefaultDomain *)self synchronizeDefaults];
}

@end