@interface INStorageAppsRequest
+ (Class)responseClass;
- (INStorageAppsRequest)init;
- (INStorageAppsRequest)initWithAccount:(id)a3 withBackupDeviceUDID:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INStorageAppsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (INStorageAppsRequest)initWithAccount:(id)a3 withBackupDeviceUDID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INStorageAppsRequest;
  v9 = [(INStorageAppsRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_backupDeviceUDID, a4);
  }

  return v10;
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    v4 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    v5 = [v4 objectForKey:@"settingsStorageAppListURL"];
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

- (INStorageAppsRequest)init
{
  return 0;
}

- (id)urlRequest
{
  v7.receiver = self;
  v7.super_class = (Class)INStorageAppsRequest;
  v3 = [(INStorageAppsRequest *)&v7 urlRequest];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "ind_addQuotaHeadersForAccount:", self->_account);
  [v4 addValue:self->_backupDeviceUDID forHTTPHeaderField:@"X-Client-Backup-UUID"];
  if ([(ACAccount *)self->_account isEnabledForDataclass:kAccountDataclassBackup])CFStringRef v5 = @"ON"; {
  else
  }
    CFStringRef v5 = @"OFF";
  [v4 addValue:v5 forHTTPHeaderField:@"X-Client-Backup"];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDeviceUDID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end