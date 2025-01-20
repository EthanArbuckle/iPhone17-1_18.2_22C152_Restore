@interface ACAccount
- (id)fmipAccountInfoForProactiveChanges;
- (id)fmipAccountInfoWithTokens:(BOOL)a3;
- (id)fmwAccountInfoForProactiveChanges;
- (id)fmwAccountInfoWithTokens:(BOOL)a3;
@end

@implementation ACAccount

- (id)fmipAccountInfoWithTokens:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = off_10031D4C8;
  v7 = [(ACAccount *)self username];
  [v5 fm_safelyMapKey:v6 toObject:v7];

  v8 = off_10031D4D0;
  v9 = [(ACAccount *)self aa_personID];
  [v5 fm_safelyMapKey:v8 toObject:v9];

  v10 = off_10031D4D8;
  v11 = [(ACAccount *)self aa_altDSID];
  [v5 fm_safelyMapKey:v10 toObject:v11];

  if (v3)
  {
    v12 = off_10031D4E0;
    v13 = [(ACAccount *)self aa_fmipToken];
    [v5 fm_safelyMapKey:v12 toObject:v13];

    v14 = off_10031D4E8;
    v15 = [(ACAccount *)self aa_authToken];
    [v5 fm_safelyMapKey:v14 toObject:v15];
  }
  v16 = off_10031D4F0;
  v17 = [(ACAccount *)self identifier];
  [v5 fm_safelyMapKey:v16 toObject:v17];

  v18 = [(ACAccount *)self dataclassProperties];
  v19 = [v18 objectForKeyedSubscript:@"com.apple.Dataclass.DeviceLocator"];

  v20 = off_10031D4F8;
  v21 = [v19 objectForKeyedSubscript:@"hostname"];
  [v5 fm_safelyMapKey:v20 toObject:v21];

  [v5 fm_safelyMapKey:@"https" toObject:off_10031D500];
  v22 = off_10031D508;
  v23 = [v19 objectForKeyedSubscript:@"apsEnv"];
  [v5 fm_safelyMapKey:v22 toObject:v23];

  v24 = +[FMPreferencesUtil stringForKey:@"configURL" inDomain:kFMDNotBackedUpPrefDomain];
  if (v24)
  {
    v25 = off_10031D510;
    v26 = v5;
    CFStringRef v27 = v24;
LABEL_5:
    [v26 fm_safelyMapKey:v25 toObject:v27];
    goto LABEL_8;
  }
  v28 = [v19 objectForKeyedSubscript:@"configURL"];

  v29 = off_10031D510;
  if (!v28)
  {
    CFStringRef v27 = @"https://gateway.icloud.com/fmadminws/findkit";
    v26 = v5;
    v25 = off_10031D510;
    goto LABEL_5;
  }
  v30 = [v19 objectForKeyedSubscript:@"configURL"];
  [v5 fm_safelyMapKey:v29 toObject:v30];

LABEL_8:
  v31 = +[FMPreferencesUtil stringForKey:@"pairingURL" inDomain:kFMDNotBackedUpPrefDomain];
  if (v31)
  {
    v32 = off_10031D518;
    v33 = v5;
    CFStringRef v34 = v31;
LABEL_10:
    [v33 fm_safelyMapKey:v32 toObject:v34];
    goto LABEL_13;
  }
  v35 = [v19 objectForKeyedSubscript:@"pairingURL"];

  v36 = off_10031D518;
  if (!v35)
  {
    CFStringRef v34 = @"https://gateway.icloud.com/fmadminws";
    v33 = v5;
    v32 = off_10031D518;
    goto LABEL_10;
  }
  v37 = [v19 objectForKeyedSubscript:@"pairingURL"];
  [v5 fm_safelyMapKey:v36 toObject:v37];

LABEL_13:
  id v38 = [v5 copy];

  return v38;
}

- (id)fmipAccountInfoForProactiveChanges
{
  v2 = [(ACAccount *)self fmipAccountInfoWithTokens:0];
  id v3 = [v2 mutableCopy];

  [v3 removeObjectForKey:off_10031D4F0];
  id v4 = [v3 copy];

  return v4;
}

- (id)fmwAccountInfoWithTokens:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = off_10031D4C8;
  v7 = [(ACAccount *)self username];
  [v5 fm_safelyMapKey:v6 toObject:v7];

  v8 = off_10031D4D0;
  v9 = [(ACAccount *)self aa_personID];
  [v5 fm_safelyMapKey:v8 toObject:v9];

  v10 = off_10031D4D8;
  v11 = [(ACAccount *)self aa_altDSID];
  [v5 fm_safelyMapKey:v10 toObject:v11];

  if (v3)
  {
    v12 = off_10031D4E0;
    v13 = [(ACAccount *)self aa_fmipToken];
    [v5 fm_safelyMapKey:v12 toObject:v13];
  }
  v14 = [(ACAccount *)self dataclassProperties];
  v15 = [v14 objectForKeyedSubscript:@"com.apple.Dataclass.DeviceLocator"];

  v16 = off_10031D4F8;
  v17 = [v15 objectForKeyedSubscript:@"hostname"];
  [v5 fm_safelyMapKey:v16 toObject:v17];

  [v5 fm_safelyMapKey:@"https" toObject:off_10031D500];
  v18 = off_10031D508;
  v19 = [v15 objectForKeyedSubscript:@"apsEnv"];
  [v5 fm_safelyMapKey:v18 toObject:v19];

  id v20 = [v5 copy];

  return v20;
}

- (id)fmwAccountInfoForProactiveChanges
{
  v2 = [(ACAccount *)self fmipAccountInfoWithTokens:0];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 copy];

  return v4;
}

@end