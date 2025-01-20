@interface INStorageSummaryRequest
+ (Class)responseClass;
- (INStorageSummaryRequest)init;
- (INStorageSummaryRequest)initWithAccount:(id)a3 withBackupDeviceUDID:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INStorageSummaryRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (INStorageSummaryRequest)initWithAccount:(id)a3 withBackupDeviceUDID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INStorageSummaryRequest;
  v9 = [(INStorageSummaryRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_backupDeviceUDID, a4);
  }

  return v10;
}

- (INStorageSummaryRequest)init
{
  return 0;
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    v4 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    v5 = [v4 objectForKey:@"settingsUsageDetailsURL"];
    v6 = [(ACAccount *)self->_account aa_personID];
    id v7 = +[AADeviceInfo udid];
    id v8 = +[INHelperFunctions urlStringFromFormat:v5 dsid:v6 udid:v7];
  }
  else
  {
    v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000261AC(v9);
    }

    id v8 = 0;
  }
  return v8;
}

- (id)urlRequest
{
  v19.receiver = self;
  v19.super_class = (Class)INStorageSummaryRequest;
  v3 = [(INStorageSummaryRequest *)&v19 urlRequest];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "ind_addQuotaHeadersForAccount:", self->_account);
  [v4 addValue:self->_backupDeviceUDID forHTTPHeaderField:@"X-Client-Backup-UUID"];
  if (_os_feature_enabled_impl()) {
    [v4 setValue:@"true" forHTTPHeaderField:@"x-apple-native-manage-storage"];
  }
  v5 = (void *)MGCopyAnswer();
  if (v5)
  {
    [v4 setValue:v5 forHTTPHeaderField:@"X-Mme-Device-Id"];
  }
  else
  {
    v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002AD9C(v6);
    }
  }
  id v7 = +[ACAccountStore ams_sharedAccountStore];
  id v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "ams_DSID");

    if (v10)
    {
      v11 = objc_msgSend(v9, "ams_DSID");
      objc_super v12 = [v11 stringValue];
      [v4 setValue:v12 forHTTPHeaderField:@"X-Apple-Itunes-DSID"];
    }
  }
  v13 = [(ACAccount *)self->_account aa_personID];
  v14 = +[ACAccountStore defaultStore];
  v15 = objc_msgSend(v14, "aa_primaryAppleAccount");
  v16 = objc_msgSend(v15, "aa_personID");

  if (v13 && v16)
  {
    if ([v13 isEqualToString:v16]) {
      CFStringRef v17 = @"true";
    }
    else {
      CFStringRef v17 = @"false";
    }
    [v4 setValue:v17 forHTTPHeaderField:@"X-Apple-Primary-Account"];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDeviceUDID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end