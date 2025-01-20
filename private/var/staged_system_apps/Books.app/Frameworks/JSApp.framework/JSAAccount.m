@interface JSAAccount
+ (BOOL)isMultiUser;
- (BOOL)hasRecommendationsEnabled;
- (BOOL)hasiCloudDriveEnabled;
- (BOOL)isManagedAppleID;
- (BOOL)isSignedInToiCloudAccount;
- (JSAAccount)initWithDelegate:(id)a3;
- (JSAAccountDelegate)delegate;
- (NSString)accountName;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)localizedName;
- (NSString)uniqueIdentifier;
- (void)setDelegate:(id)a3;
- (void)signOut:(id)a3;
- (void)signOutWithCompletion:(id)a3;
@end

@implementation JSAAccount

+ (BOOL)isMultiUser
{
  return +[BLLibraryUtility _isMultiUser];
}

- (JSAAccount)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JSAAccount;
  v5 = [(JSAAccount *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (NSString)uniqueIdentifier
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 activeStoreAccount];
  id v4 = [v3 ams_DSID];
  v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (NSString)accountName
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 activeStoreAccount];
  id v4 = [v3 username];

  return (NSString *)v4;
}

- (NSString)firstName
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 activeStoreAccount];
  id v4 = [v3 ams_firstName];

  return (NSString *)v4;
}

- (NSString)lastName
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 activeStoreAccount];
  id v4 = [v3 ams_lastName];

  return (NSString *)v4;
}

- (NSString)localizedName
{
  v2 = +[BUAccountsProvider sharedProvider];
  v3 = [v2 activeStoreAccount];
  id v4 = [v3 ams_fullName];

  return (NSString *)v4;
}

- (BOOL)isManagedAppleID
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isStoreAccountManagedAppleID];

  return v3;
}

- (BOOL)isSignedInToiCloudAccount
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isUserSignedInToiCloud];

  return v3;
}

- (BOOL)hasiCloudDriveEnabled
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isGlobalICloudDriveSyncOptedIn];

  return v3;
}

- (BOOL)hasRecommendationsEnabled
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 hasRecommendationsEnabled];

  return v3;
}

- (void)signOut:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13880;
  v5[3] = &unk_B28E8;
  id v6 = a3;
  id v4 = v6;
  [(JSAAccount *)self signOutWithCompletion:v5];
}

- (void)signOutWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[BUAccountsProvider sharedProvider];
  id v6 = [v5 activeStoreAccount];

  if (v6)
  {
    v7 = [(JSAAccount *)self delegate];
    [v7 accountWillAttemptSignOut:self];

    objc_super v8 = [v6 bu_signOut];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_13AC0;
    v11[3] = &unk_B2910;
    v11[4] = self;
    id v12 = v4;
    [v8 addFinishBlock:v11];
  }
  else
  {
    id v9 = objc_retainBlock(v4);
    v10 = v9;
    if (v9) {
      (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    }
  }
}

- (JSAAccountDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (JSAAccountDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end