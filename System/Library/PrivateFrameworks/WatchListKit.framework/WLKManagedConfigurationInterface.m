@interface WLKManagedConfigurationInterface
+ (void)setTVAppAllowed:(BOOL)a3;
+ (void)setTVAppAllowed:(BOOL)a3 silent:(BOOL)a4;
@end

@implementation WLKManagedConfigurationInterface

+ (void)setTVAppAllowed:(BOOL)a3
{
}

+ (void)setTVAppAllowed:(BOOL)a3 silent:(BOOL)a4
{
  BOOL v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3, a4);
  uint64_t v6 = *MEMORY[0x1E4F74158];
  int v7 = [v5 userBoolValueForSetting:*MEMORY[0x1E4F74158]];

  if (v4) {
    int v8 = 2;
  }
  else {
    int v8 = 1;
  }
  if (v7 == v8)
  {
    NSLog(&cfstr_Wlkmanagedconf.isa);
    v9 = [MEMORY[0x1E4F74230] sharedConnection];
    [v9 removeBoolSetting:v6];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 MCSetBoolRestriction:v6 value:v4];
  v11 = [MEMORY[0x1E4F74230] sharedConnection];
  id v14 = 0;
  char v12 = [v11 applyRestrictionDictionary:v10 clientType:@"com.apple.WatchListKit.isTVAllowed" clientUUID:@"com.apple.WatchListKit.isTVAllowed" localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v14];
  id v13 = v14;

  if ((v12 & 1) == 0) {
    NSLog(&cfstr_Wlkmanagedconf_0.isa, v13);
  }
}

@end