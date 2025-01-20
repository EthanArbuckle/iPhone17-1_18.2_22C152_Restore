@interface ACAccount
- (id)fmfAccountInfoForProactiveChanges;
- (id)fmfAccountInfoWithTokens:(BOOL)a3;
@end

@implementation ACAccount

- (id)fmfAccountInfoWithTokens:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableDictionary dictionary];
  v6 = [(ACAccount *)self username];
  [v5 fm_safelyMapKey:@"username" toObject:v6];

  v7 = [(ACAccount *)self aa_personID];
  [v5 fm_safelyMapKey:@"dsid" toObject:v7];

  if (v3)
  {
    id v8 = objc_alloc_init((Class)ACAccountStore);
    v9 = [(ACAccount *)self aa_fmfAccount];
    id v21 = 0;
    v10 = [v8 credentialForAccount:v9 error:&v21];
    id v11 = v21;

    if (!v10)
    {
      v12 = sub_10001B6D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100038E10((uint64_t)v11, v12);
      }
    }
    v13 = [v10 credentialItemForKey:ACFindMyFriendsAppTokenKey];
    [v5 fm_safelyMapKey:@"appToken" toObject:v13];

    v14 = [v10 credentialItemForKey:ACFindMyFriendsTokenKey];
    [v5 fm_safelyMapKey:@"internalToken" toObject:v14];
  }
  v15 = [(ACAccount *)self propertiesForDataclass:@"com.apple.Dataclass.ShareLocation"];
  v16 = [v15 objectForKeyedSubscript:@"appHostname"];
  [v5 fm_safelyMapKey:@"appHostname" toObject:v16];

  v17 = [v15 objectForKeyedSubscript:@"hostname"];
  [v5 fm_safelyMapKey:@"hostname" toObject:v17];

  [v5 fm_safelyMapKey:@"scheme" toObject:@"https"];
  v18 = [v15 objectForKeyedSubscript:@"apsEnv"];
  [v5 fm_safelyMapKey:@"apsEnv" toObject:v18];

  id v19 = [v5 copy];

  return v19;
}

- (id)fmfAccountInfoForProactiveChanges
{
  v2 = [(ACAccount *)self fmfAccountInfoWithTokens:0];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 copy];

  return v4;
}

@end