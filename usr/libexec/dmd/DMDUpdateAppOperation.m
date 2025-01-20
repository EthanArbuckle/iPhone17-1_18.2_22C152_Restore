@interface DMDUpdateAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)didPromptUser;
- (void)_endOperationWithBundleIdentifier:(id)a3;
- (void)_promptIfNeededAndUpdateAppForRequest:(id)a3 metadata:(id)a4;
- (void)_resumeUpdateForBundleIdentifier:(id)a3;
- (void)_runWithRequest:(id)a3 metadata:(id)a4;
- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4;
- (void)_showUpdateFailurePromptIfNeededForRequest:(id)a3 metadata:(id)a4;
- (void)_startUpdateAppForRequest:(id)a3 metadata:(id)a4;
- (void)endOperationWithError:(id)a3;
- (void)endOperationWithResultObject:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setDidPromptUser:(BOOL)a3;
@end

@implementation DMDUpdateAppOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000D3320;
}

- (void)endOperationWithResultObject:(id)a3
{
  id v4 = a3;
  if (([(DMDUpdateAppOperation *)self isFinished] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDUpdateAppOperation;
    [(DMDUpdateAppOperation *)&v5 endOperationWithResultObject:v4];
  }
}

- (void)endOperationWithError:(id)a3
{
  id v4 = a3;
  if (([(DMDUpdateAppOperation *)self isFinished] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)DMDUpdateAppOperation;
    [(DMDUpdateAppOperation *)&v5 endOperationWithError:v4];
  }
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[DMDAppController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007741C;
  v7[3] = &unk_1000CB228;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (void)_runWithRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 bundleIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (+[DMDAppController sharedController],
        v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 stateForBundleIdentifier:v8],
        v9,
        v10 != (id)12))
  {
    v12 = [v7 lifeCycle];
    unint64_t v13 = (unint64_t)[v12 currentState];

    if (v13 <= 8)
    {
      if (((1 << v13) & 0x10F) != 0)
      {
        uint64_t v15 = DMFBundleIdentifierErrorKey;
        v16 = v8;
        v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        v14 = DMFErrorWithCodeAndUserInfo();
        [(DMDUpdateAppOperation *)self endOperationWithError:v14];

        goto LABEL_7;
      }
      if (((1 << v13) & 0x60) != 0)
      {
        [(DMDUpdateAppOperation *)self _endOperationWithBundleIdentifier:v8];
        goto LABEL_8;
      }
      if (v13 == 7)
      {
        [(DMDUpdateAppOperation *)self _resumeUpdateForBundleIdentifier:v8];
        goto LABEL_8;
      }
    }
    [(DMDUpdateAppOperation *)self _promptIfNeededAndUpdateAppForRequest:v6 metadata:v7];
    goto LABEL_8;
  }
  v11 = DMFErrorWithCodeAndUserInfo();
  [(DMDUpdateAppOperation *)self endOperationWithError:v11];
LABEL_7:

LABEL_8:
}

- (void)_resumeUpdateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = DMFAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resume update for bundle identifier: %{public}@", buf, 0xCu);
  }

  id v6 = +[DMDAppController sharedController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000777B8;
  v8[3] = &unk_1000C9B78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 resumeAppUpdateWithBundleIdentifier:v7 completion:v8];
}

- (void)_promptIfNeededAndUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[DMDDeviceController shared],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 isInSingleAppMode],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 BOOLValue],
        v9,
        v8,
        !v10))
  {
    id v11 = [v7 bundleIdentifier];
    v12 = +[DMDAppController sharedController];
    unint64_t v13 = [v12 foregroundBundleIdentifiers];
    unsigned __int8 v14 = [v13 containsObject:v11];

    if (v14)
    {
      [(DMDUpdateAppOperation *)self setDidPromptUser:1];
      [(DMDUpdateAppOperation *)self _setState:12 forBundleIdentifier:v11];
      uint64_t v15 = [v6 originator];
      v32 = (void *)v15;
      unsigned int v16 = [v7 isStoreApp];
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      if (v16) {
        CFStringRef v19 = @"%@ is about to update the app “%@” from the App Store.";
      }
      else {
        CFStringRef v19 = @"%@ is about to update the app “%@”.";
      }
      v31 = [v17 localizedStringForKey:v19 value:&stru_1000CC390 table:@"DMFNotifications"];

      v20 = objc_opt_new();
      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"App Update" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v20 setHeader:v22];

      v23 = [v7 displayName];
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v15, v23);
      [v20 setMessage:v24];

      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"Update" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v20 setDefaultButtonTitle:v26];

      v27 = +[NSBundle bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
      [v20 setAlternateButtonTitle:v28];

      v29 = +[DMDUserNotificationController sharedController];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100077BCC;
      v33[3] = &unk_1000CBED8;
      v33[4] = self;
      id v30 = v11;
      id v34 = v30;
      id v35 = v6;
      id v36 = v7;
      [v29 showNotification:v20 completion:v33];

      [(DMDUpdateAppOperation *)self _endOperationWithBundleIdentifier:v30];
    }
    else
    {
      [(DMDUpdateAppOperation *)self _startUpdateAppForRequest:v6 metadata:v7];
    }
  }
  else
  {
    [(DMDUpdateAppOperation *)self _startUpdateAppForRequest:v6 metadata:v7];
  }
}

- (void)_startUpdateAppForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 bundleIdentifier];
  id v9 = [v7 bundleIdentifier];
  [v6 setBundleIdentifier:v9];

  unsigned int v10 = [v7 storeItemIdentifier];
  [v6 setStoreItemIdentifier:v10];

  id v11 = DMFAppLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start updating app for request: %{public}@", buf, 0xCu);
  }

  v12 = +[DMDAppController sharedController];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100077E34;
  v16[3] = &unk_1000CBF00;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v19 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v6;
  [v12 startUpdatingAppForRequest:v15 metadata:v14 completion:v16];
}

- (void)_showUpdateFailurePromptIfNeededForRequest:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [(DMDUpdateAppOperation *)self didPromptUser])
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v10 = [v9 localizedStringForKey:@"The app “%@” could not be updated." value:&stru_1000CC390 table:@"DMFNotifications"];

    id v11 = objc_opt_new();
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"App Update" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v11 setHeader:v13];

    id v14 = [v6 displayName];
    id v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v14);
    [v11 setMessage:v15];

    unsigned int v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"Dismiss" value:&stru_1000CC390 table:@"DMFNotifications"];
    [v11 setDefaultButtonTitle:v17];

    id v18 = DMFAppLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000884B4(v18);
    }

    id v19 = +[DMDUserNotificationController sharedController];
    [v19 showNotification:v11 completion:0];
  }
}

- (void)_setState:(unint64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(DMDUpdateAppOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = +[DMDAppController sharedController];
    id v12 = 0;
    unsigned __int8 v10 = [v9 setState:a3 forBundleIdentifier:v6 error:&v12];
    id v11 = v12;

    if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000884F8(a3, (uint64_t)v6);
    }
  }
}

- (void)_endOperationWithBundleIdentifier:(id)a3
{
  id v9 = a3;
  id v4 = [(DMDUpdateAppOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = +[DMDAppController sharedController];
    id v7 = [v6 stateForBundleIdentifier:v9];

    id v8 = [objc_alloc((Class)DMFMDMv1InstallAppResultObject) initWithBundleIdentifier:v9 state:v7];
  }
  else
  {
    id v8 = 0;
  }
  [(DMDUpdateAppOperation *)self endOperationWithResultObject:v8];
}

- (BOOL)didPromptUser
{
  return self->_didPromptUser;
}

- (void)setDidPromptUser:(BOOL)a3
{
  self->_didPromptUser = a3;
}

@end