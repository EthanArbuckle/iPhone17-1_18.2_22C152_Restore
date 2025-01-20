@interface INBagRenewal
+ (void)attemptRenewCredentialsWithAccount:(id)a3 completion:(id)a4;
@end

@implementation INBagRenewal

+ (void)attemptRenewCredentialsWithAccount:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[ACAccountStore defaultStore];
  v8 = objc_msgSend(v5, "aa_altDSID");
  v18[0] = kACRenewCredentialsShouldAvoidUIKey;
  v18[1] = kACRenewCredentialsShouldForceKey;
  v19[0] = &__kCFBooleanTrue;
  v19[1] = &__kCFBooleanFalse;
  v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002674C((uint64_t)v8, v10);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000062C8;
  v14[3] = &unk_100040E78;
  id v16 = v8;
  id v17 = v6;
  id v15 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  [v12 renewCredentialsForAccount:v5 options:v9 completion:v14];
}

@end