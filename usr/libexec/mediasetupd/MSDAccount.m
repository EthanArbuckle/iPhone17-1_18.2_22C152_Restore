@interface MSDAccount
+ (ACAccount)activeiTunesAccount;
- (BOOL)_accountHasLocalPlayableContent:(id)a3;
- (BOOL)hasValidSubscription;
- (MSDAccount)initWithHomeIdentifier:(id)a3;
- (MSDAccount)initWithHomeUserIdentifier:(id)a3;
- (NSString)iTunesAccountName;
- (NSUUID)homeIdentifier;
- (NSUUID)homeUserIdentifier;
@end

@implementation MSDAccount

- (MSDAccount)initWithHomeUserIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDAccount;
  v6 = [(MSDAccount *)&v11 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeUserIdentifier, a3);
    v7->_syncLock._os_unfair_lock_opaque = 0;
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sub_100031A80();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10001A138(v9);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (MSDAccount)initWithHomeIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDAccount;
  v6 = [(MSDAccount *)&v11 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeIdentifier, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sub_100031A80();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10001A17C(v9);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (NSString)iTunesAccountName
{
  v3 = +[ACAccountStore ams_sharedAccountStore];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000197D4;
  v16 = sub_1000197E4;
  id v17 = 0;
  os_unfair_lock_lock(&self->_syncLock);
  objc_initWeak(&location, self);
  v4 = [v3 ams_mediaAccountForHomeWithIdentifier:self->_homeIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000197EC;
  v9[3] = &unk_10004D818;
  objc_copyWeak(&v10, &location);
  v9[4] = &v12;
  [v4 resultWithTimeout:v9 completion:2.0];
  id v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(id)v13[5] username];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User Active iTunes Account: %@", buf, 0xCu);
  }
  v7 = [(id)v13[5] username];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return (NSString *)v7;
}

- (BOOL)hasValidSubscription
{
  if (qword_100056790 != -1) {
    dispatch_once(&qword_100056790, &stru_10004D838);
  }
  v3 = +[ACAccountStore ams_sharedAccountStore];
  v4 = [v3 ams_iTunesAccountWithHomeUserIdentifier:self->_homeUserIdentifier];

  if (v4)
  {
    id v5 = [v4 ams_DSID];
    v6 = [(id)qword_100056788 objectForKey:v5];
    v7 = v6;
    if (v6)
    {
      unsigned __int8 v8 = [v6 BOOLValue];
    }
    else
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      char v33 = 1;
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      id v10 = sub_100031A80();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v35 = v4;
        __int16 v36 = 2113;
        v37 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UserAccount %{private}@ with DSID %{private}@", buf, 0x16u);
      }

      objc_super v11 = +[ICUserIdentity specificAccountWithDSID:v5];
      uint64_t v12 = sub_100031A80();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v35 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UserIdentity %{private}@", buf, 0xCu);
      }

      id v24 = [objc_alloc((Class)ICStoreRequestContext) initWithIdentity:v11];
      id v13 = [objc_alloc((Class)ICMusicSubscriptionStatusRequest) initWithStoreRequestContext:v24];
      [v13 setShouldReturnLastKnownStatusOnly:1];
      uint64_t v14 = (char *)MSDGenerateSignpostID();
      v15 = MSDSignpostFacility();
      v16 = v15;
      if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "CheckSubscriptionStatus", (const char *)&unk_10003DE0E, buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      id v17 = +[ICMusicSubscriptionStatusController sharedStatusController];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100019D7C;
      v25[3] = &unk_10004D860;
      v28 = &v30;
      objc_copyWeak(v29, (id *)buf);
      id v18 = v11;
      id v26 = v18;
      v29[1] = v14;
      v19 = v9;
      v27 = v19;
      [v17 performSubscriptionStatusRequest:v13 withStatusHandler:v25];
      dispatch_time_t v20 = dispatch_time(0, 1000000000 * MSiTunesCloudSubscriptionStatusMaxTimeOut);
      dispatch_semaphore_wait(v19, v20);
      v21 = (void *)qword_100056788;
      v22 = +[NSNumber numberWithBool:*((unsigned __int8 *)v31 + 24)];
      [v21 setObject:v22 forKey:v5];

      unsigned __int8 v8 = *((unsigned char *)v31 + 24) != 0;
      objc_destroyWeak(v29);

      objc_destroyWeak((id *)buf);
      _Block_object_dispose(&v30, 8);
    }
  }
  else
  {
    id v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001A24C((uint64_t *)&self->_homeUserIdentifier, v5);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_accountHasLocalPlayableContent:(id)a3
{
  id v3 = a3;
  v4 = +[MPMediaQuery songsQuery];
  id v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v3];

  [v4 setIgnoreSystemFilterPredicates:1];
  [v4 setMediaLibrary:v5];
  v6 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyHasNonPurgeableAsset];
  [v4 addFilterPredicate:v6];

  LOBYTE(v6) = [v4 _hasItems];
  return (char)v6;
}

+ (ACAccount)activeiTunesAccount
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  id v3 = [v2 ams_activeiTunesAccount];

  return (ACAccount *)v3;
}

- (NSUUID)homeUserIdentifier
{
  return self->_homeUserIdentifier;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);

  objc_storeStrong((id *)&self->_homeUserIdentifier, 0);
}

@end