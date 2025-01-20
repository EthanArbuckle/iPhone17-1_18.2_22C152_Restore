@interface MIBUTestPreferences
+ (id)sharedInstance;
- (BOOL)factorySUCertExist;
- (BOOL)inBoxUpdateMode;
- (BOOL)skipCertDeletion;
- (BOOL)skipDaemonDisable;
- (BOOL)skipWiFiAssociation;
- (BOOL)useAppleConnect;
- (BOOL)useLiveTatsu;
- (id)factorySUCertPath;
- (id)factorySUKeyIsSEP;
- (id)factorySUKeyPath;
- (id)fakeTatsuPayloadPath;
- (id)getValueFromTestPreferencesForKey:(id)a3;
- (id)initialBuddySetupComplete;
- (id)isActivated;
- (id)isOnLockScreen;
- (id)iseTrustCertName;
- (id)iseTrustCertPaths;
- (id)nfcIdleTime;
- (id)wifiSSID;
@end

@implementation MIBUTestPreferences

+ (id)sharedInstance
{
  if (qword_10006C8C0 != -1) {
    dispatch_once(&qword_10006C8C0, &stru_100059E20);
  }
  v2 = (void *)qword_10006C8B8;

  return v2;
}

- (BOOL)useLiveTatsu
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"UseLiveTatsu"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (id)fakeTatsuPayloadPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FakeTatsuPayloadPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)useAppleConnect
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"UseAppleConnect"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)nfcIdleTime
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"NFCIdleTime"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)isActivated
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"IsActivated"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)factorySUCertExist
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUCertExist"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)inBoxUpdateMode
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"InBoxUpdateMode"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)initialBuddySetupComplete
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"InitialBuddySetupComplete"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)isOnLockScreen
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"IsOnLockScreen"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUCertPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUCertPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUKeyPath
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUKeyPath"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)factorySUKeyIsSEP
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"FactorySUKeyIsSEP"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)iseTrustCertPaths
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"ISETrustCertPaths"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)iseTrustCertName
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"ISETrustCertName"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)wifiSSID
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"WiFiSSID"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)skipWiFiAssociation
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipWiFiAssociation"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)skipDaemonDisable
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipDaemonDisable"];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (BOOL)skipCertDeletion
{
  v2 = [(MIBUTestPreferences *)self getValueFromTestPreferencesForKey:@"SkipCertDeletion"];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if (!CFPreferencesSynchronize(@"com.apple.MobileInBoxUpdater.test", kCFPreferencesAnyUser, kCFPreferencesCurrentHost))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059E40);
    }
    v4 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F210(v4);
    }
  }
  v5 = (void *)CFPreferencesCopyValue(v3, @"com.apple.MobileInBoxUpdater.test", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);

  return v5;
}

@end