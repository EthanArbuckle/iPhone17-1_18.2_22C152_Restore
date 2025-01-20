@interface DaemonBiometricStore
+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3;
+ (id)_dispatchQueueUpdateToken;
+ (int64_t)tokenUpdateState;
+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
+ (void)_resetAccount:(id)a3 withConnection:(id)a4;
+ (void)getAllCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4;
+ (void)getCachedBiometricAuthenticationContextWithMessage:(id)a3 connection:(id)a4;
+ (void)getCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4;
+ (void)getConstraintsDictionaryWithMessage:(id)a3 connection:(id)a4;
+ (void)getCurrentACLVersionWithMessage:(id)a3 connection:(id)a4;
+ (void)getIdentityMapCountWithMessage:(id)a3 connection:(id)a4;
+ (void)getKeyCountWithMessage:(id)a3 connection:(id)a4;
+ (void)getStateWithMessage:(id)a3 connection:(id)a4;
+ (void)isIdentityMapValidWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)resetAccountWithMessage:(id)a3 connection:(id)a4;
+ (void)resetWithMessage:(id)a3 connection:(id)a4;
+ (void)saveIdentityMapWithMessage:(id)a3 connection:(id)a4;
+ (void)setAllowedWithMessage:(id)a3 connection:(id)a4;
+ (void)setEnabledWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateDidFinishWithLogKey:(id)a3;
+ (void)tokenUpdateDidFinishWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateShouldStartWithMessage:(id)a3 connection:(id)a4;
+ (void)tokenUpdateStateWithMessage:(id)a3 connection:(id)a4;
- (BOOL)canPerformBiometricOptIn;
- (BOOL)isBiometricStateEnabled;
- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3;
- (NSNumber)lastRegisteredAccountIdentifier;
- (id)_bootDate;
- (id)identityMap;
- (int64_t)biometricState;
- (int64_t)tokenAvailabilityForAccountIdentifier:(id)a3;
- (unint64_t)keyCountForAccountIdentifier:(id)a3;
- (void)_deleteKeychainTokensForAccountIdentifier:(id)a3;
- (void)clearLastRegisteredAccountIdentifier;
- (void)obliterateBiometricsForAccountIdentifier:(id)a3;
- (void)registerAccountIdentifier:(id)a3;
- (void)saveIdentityMap:(id)a3 forAccountIdentifier:(id)a4;
- (void)setBiometricState:(int64_t)a3;
@end

@implementation DaemonBiometricStore

- (int64_t)biometricState
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AMSDeviceBiometricsState", @"com.apple.AppleMediaServices", 0);
  if (AppIntegerValue == 2) {
    return 1;
  }
  else {
    return 2 * (AppIntegerValue == 1);
  }
}

- (BOOL)canPerformBiometricOptIn
{
  v2 = [(DaemonBiometricStore *)self identityMap];
  if ([v2 count])
  {
    v3 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v4 = [v3 isPasscodeSet];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)clearLastRegisteredAccountIdentifier
{
  v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v9) = 138543362;
  *(void *)((char *)&v9 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v9 + 4);
  LODWORD(v8) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v9, v8, v9);
    free(v7);
    SSFileLog();
LABEL_11:
  }
  CFPreferencesSetAppValue(@"BiometricAccountID", 0, kSSUserDefaultsIdentifier);
}

- (id)identityMap
{
  if (+[SSDevice deviceIsAudioAccessory])
  {
    v2 = 0;
  }
  else
  {
    unsigned int v3 = [(id)ISWeakLinkedClassForString() manager];
    v2 = [v3 identities:0];
  }

  return v2;
}

- (BOOL)isBiometricStateEnabled
{
  return CFPreferencesGetAppIntegerValue(@"BiometricStateEnabled", kSSUserDefaultsIdentifier, 0) == 2;
}

- (BOOL)isIdentityMapValidForAccountIdentifier:(id)a3
{
  unsigned int v3 = +[AMSBiometricsSecurityService isIdentityMapValid];
  id v15 = 0;
  unsigned __int8 v4 = [v3 resultWithError:&v15];
  id v5 = v15;

  if (v5)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    long long v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      v10 = objc_opt_class();
      int v16 = 138543618;
      v17 = v10;
      __int16 v18 = 2114;
      id v19 = v5;
      id v11 = v10;
      LODWORD(v14) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        goto LABEL_14;
      }
      long long v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

- (unint64_t)keyCountForAccountIdentifier:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[DaemonBiometricKeychain sharedInstance];
  id v30 = 0;
  id v5 = objc_msgSend(v4, "publicKeyDataForAccountIdentifier_:purpose:regenerateKeys:error:", v3, 0, 0, &v30);
  id v6 = v30;

  if (v6)
  {
    unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      unsigned int v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      int v31 = 138543618;
      v32 = v11;
      __int16 v33 = 2114;
      id v34 = v6;
      id v12 = v11;
      LODWORD(v28) = 22;
      v27 = &v31;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v31, v28);
      free(v13);
      v27 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  uint64_t v14 = +[DaemonBiometricKeychain sharedInstance];
  id v29 = v6;
  id v15 = objc_msgSend(v14, "publicKeyDataForAccountIdentifier_:purpose:regenerateKeys:error:", v3, 1, 0, &v29);
  id v16 = v29;

  if (!v16) {
    goto LABEL_27;
  }
  v17 = +[SSLogConfig sharedDaemonConfig];
  if (!v17)
  {
    v17 = +[SSLogConfig sharedConfig];
  }
  unsigned int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_25;
  }
  v21 = objc_opt_class();
  int v31 = 138543618;
  v32 = v21;
  __int16 v33 = 2114;
  id v34 = v16;
  id v22 = v21;
  LODWORD(v28) = 22;
  v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v31, v28);
    free(v23);
    SSFileLog();
LABEL_25:
  }
LABEL_27:
  uint64_t v24 = 1;
  if (v5) {
    uint64_t v24 = 2;
  }
  if (v15) {
    unint64_t v25 = v24;
  }
  else {
    unint64_t v25 = v5 != 0;
  }

  return v25;
}

- (NSNumber)lastRegisteredAccountIdentifier
{
  v2 = (void *)CFPreferencesCopyAppValue(@"BiometricAccountID", kSSUserDefaultsIdentifier);

  return (NSNumber *)v2;
}

- (int64_t)tokenAvailabilityForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int64_t v17 = 4;
    goto LABEL_22;
  }
  id v5 = +[MCProfileConnection sharedConnection];
  unsigned int v6 = [v5 isPasscodeSet];

  if (!v6
    || ([(DaemonBiometricStore *)self identityMap],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        !v8))
  {
    int64_t v17 = 3;
    goto LABEL_22;
  }
  if (![(DaemonBiometricStore *)self isIdentityMapValidForAccountIdentifier:v4])
  {
    int64_t v17 = 2;
    goto LABEL_22;
  }
  int v9 = [(DaemonBiometricStore *)self lastRegisteredAccountIdentifier];
  unsigned __int8 v10 = [v9 isEqualToNumber:v4];

  if ((v10 & 1) == 0)
  {
    id v11 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v11)
    {
      id v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(v20) = 138543362;
      *(void *)((char *)&v20 + 4) = objc_opt_class();
      id v15 = *(id *)((char *)&v20 + 4);
      LODWORD(v19) = 12;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v20, v19, v20);
      free(v16);
      SSFileLog();
    }

    goto LABEL_17;
  }
LABEL_18:
  int64_t v17 = 0;
LABEL_22:

  return v17;
}

- (void)obliterateBiometricsForAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  *(_DWORD *)unsigned int v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2112;
  *(void *)&v12[14] = v4;
  id v9 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  unsigned __int8 v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  [(DaemonBiometricStore *)self setBiometricState:0];
}

- (void)registerAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  *(_DWORD *)unsigned int v12 = 138543618;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2114;
  *(void *)&v12[14] = v3;
  id v8 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    int v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  CFStringRef v10 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"BiometricAccountID", v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v10);
}

- (void)saveIdentityMap:(id)a3 forAccountIdentifier:(id)a4
{
  id v4 = +[AMSBiometricsSecurityService saveIdentityMap];
}

- (void)setBiometricState:(int64_t)a3
{
  if ([(DaemonBiometricStore *)self biometricState] == a3) {
    return;
  }
  id v5 = [objc_alloc((Class)NSNumber) initWithInteger:a3];
  CFStringRef v6 = (const __CFString *)kSSUserDefaultsIdentifier;
  value = v5;
  CFPreferencesSetAppValue(@"BiometricState", v5, kSSUserDefaultsIdentifier);
  if ((unint64_t)(a3 - 1) <= 1) {
    CFPreferencesSetAppValue(@"BiometricStateEnabled", value, v6);
  }
  CFPreferencesAppSynchronize(v6);
  switch(a3)
  {
    case 0:
      uint64_t v7 = 0;
      goto LABEL_9;
    case 1:
      +[AMSDevice setBiometricState:2];
      id v8 = [(DaemonBiometricStore *)self lastRegisteredAccountIdentifier];
      if (v8) {
        [(DaemonBiometricStore *)self _deleteKeychainTokensForAccountIdentifier:v8];
      }
      id v9 = +[SSAccountStore defaultStore];
      CFStringRef v10 = [v9 activeAccount];
      uint64_t v11 = [v10 uniqueIdentifier];

      if (v11 && (!v8 || ([v11 isEqualToNumber:v8] & 1) == 0)) {
        [(DaemonBiometricStore *)self _deleteKeychainTokensForAccountIdentifier:v11];
      }

      break;
    case 2:
      uint64_t v7 = 1;
LABEL_9:
      +[AMSDevice setBiometricState:v7];
      break;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSBiometricsStateChangedNotification, 0, 0, 1u);
}

+ (void)tokenUpdateDidFinishWithLogKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _dispatchQueueUpdateToken];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016D010;
  block[3] = &unk_1003A3140;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (BOOL)tokenUpdateShouldStartWithLogKey:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v4 = [(id)objc_opt_class() _dispatchQueueUpdateToken];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016D290;
  v7[3] = &unk_1003A51F8;
  id v8 = v3;
  id v9 = &v10;
  id v5 = v3;
  dispatch_sync(v4, v7);

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

+ (int64_t)tokenUpdateState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(id)objc_opt_class() _dispatchQueueUpdateToken];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016D9B8;
  block[3] = &unk_1003A8188;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"getAllCachedBiometricHTTPHeadersWithMessage:connection:" forMessage:203];
  [v4 addObserver:a1 selector:"getCachedBiometricAuthenticationContextWithMessage:connection:" forMessage:195];
  [v4 addObserver:a1 selector:"getCachedBiometricHTTPHeadersWithMessage:connection:" forMessage:196];
  [v4 addObserver:a1 selector:"getConstraintsDictionaryWithMessage:connection:" forMessage:214];
  [v4 addObserver:a1 selector:"getCurrentACLVersionWithMessage:connection:" forMessage:213];
  [v4 addObserver:a1 selector:"getIdentityMapCountWithMessage:connection:" forMessage:182];
  [v4 addObserver:a1 selector:"getKeyCountWithMessage:connection:" forMessage:202];
  [v4 addObserver:a1 selector:"getStateWithMessage:connection:" forMessage:122];
  [v4 addObserver:a1 selector:"isIdentityMapValidWithMessage:connection:" forMessage:183];
  [v4 addObserver:a1 selector:"resetAccountWithMessage:connection:" forMessage:125];
  [v4 addObserver:a1 selector:"resetWithMessage:connection:" forMessage:124];
  [v4 addObserver:a1 selector:"saveIdentityMapWithMessage:connection:" forMessage:184];
  [v4 addObserver:a1 selector:"setEnabledWithMessage:connection:" forMessage:123];
  [v4 addObserver:a1 selector:"setAllowedWithMessage:connection:" forMessage:126];
  [v4 addObserver:a1 selector:"tokenUpdateDidFinishWithMessage:connection:" forMessage:206];
  [v4 addObserver:a1 selector:"tokenUpdateShouldStartWithMessage:connection:" forMessage:207];
  [v4 addObserver:a1 selector:"tokenUpdateStateWithMessage:connection:" forMessage:208];
}

+ (void)getAllCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016E124;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getCachedBiometricAuthenticationContextWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016E808;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getCachedBiometricHTTPHeadersWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016EC3C;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getConstraintsDictionaryWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016F254;
  v7[3] = &unk_1003A81B0;
  id v8 = a3;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getCurrentACLVersionWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)getIdentityMapCountWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016F5C8;
  v4[3] = &unk_1003A8210;
  v4[4] = a1;
  [a1 _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

+ (void)getKeyCountWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016F768;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getStateWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016FA2C;
  v4[3] = &unk_1003A8210;
  v4[4] = a1;
  [a1 _handleMessage:a3 connection:a4 withReplyBlock:v4];
}

+ (void)isIdentityMapValidWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016FEBC;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)resetAccountWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100170088;
  v9[3] = &unk_1003A60E8;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];
}

+ (void)resetWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100170228;
  v7[3] = &unk_1003A60C0;
  id v8 = a4;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:a3 connection:v6 withReplyBlock:v7];
}

+ (void)saveIdentityMapWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001703E0;
  v7[3] = &unk_1003A60C0;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)setAllowedWithMessage:(id)a3 connection:(id)a4
{
}

+ (void)setEnabledWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100170694;
  v8[3] = &unk_1003A60E8;
  id v10 = a3;
  id v11 = a1;
  id v9 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v6 connection:v7 withReplyBlock:v8];
}

+ (void)tokenUpdateDidFinishWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100170D24;
  v9[3] = &unk_1003A8280;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)tokenUpdateShouldStartWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100170F0C;
  v9[3] = &unk_1003A8280;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [a1 _handleMessage:v8 connection:v7 withReplyBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)tokenUpdateStateWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001710FC;
  v8[3] = &unk_1003A82A8;
  objc_copyWeak(&v9, &location);
  [a1 _handleMessage:v6 connection:v7 withReplyBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001712C8;
  v15[3] = &unk_1003A6110;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (id)_bootDate
{
  v2 = +[NSProcessInfo processInfo];
  [v2 systemUptime];
  double v4 = v3;

  id v5 = +[NSDate date];
  id v6 = [v5 dateByAddingTimeInterval:-v4];

  return v6;
}

- (void)_deleteKeychainTokensForAccountIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = +[DaemonBiometricKeychain sharedInstance];
  id v15 = 0;
  unsigned __int8 v5 = objc_msgSend(v4, "deleteKeychainTokensForAccountIdentifier_:error:", v3, &v15);
  id v6 = v15;

  if ((v5 & 1) == 0)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      int v16 = 138543874;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2114;
      id v21 = v6;
      id v12 = v11;
      LODWORD(v14) = 32;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v16, v14);
      free(v13);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

+ (void)_resetAccount:(id)a3 withConnection:(id)a4
{
  id v5 = a3;
  id v6 = (void *)SSXPCConnectionCopyClientIdentifier();
  id v7 = +[SSLogConfig sharedConfig];
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_9;
  }
  *(_DWORD *)id v15 = 138543874;
  *(void *)&void v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2112;
  *(void *)&v15[14] = v5;
  *(_WORD *)&v15[22] = 2114;
  int v16 = v6;
  id v11 = *(id *)&v15[4];
  LODWORD(v14) = 32;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  id v13 = objc_alloc_init((Class)a1);
  [v13 obliterateBiometricsForAccountIdentifier:v5];
}

+ (id)_dispatchQueueUpdateToken
{
  if (qword_100401F58 != -1) {
    dispatch_once(&qword_100401F58, &stru_1003A82C8);
  }
  v2 = (void *)qword_100401F60;

  return v2;
}

@end