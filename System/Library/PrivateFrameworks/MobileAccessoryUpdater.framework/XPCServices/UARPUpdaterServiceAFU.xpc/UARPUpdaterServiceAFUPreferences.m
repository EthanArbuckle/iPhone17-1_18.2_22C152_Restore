@interface UARPUpdaterServiceAFUPreferences
+ (id)sharedInstance;
- (NSURL)overriddenFirmwareAssetDirectoryURL;
- (UARPUpdaterServiceAFUPreferences)init;
@end

@implementation UARPUpdaterServiceAFUPreferences

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000234C;
  block[3] = &unk_100004290;
  block[4] = a1;
  if (qword_100008B70 != -1) {
    dispatch_once(&qword_100008B70, block);
  }
  v2 = (void *)qword_100008B68;
  return v2;
}

- (UARPUpdaterServiceAFUPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPUpdaterServiceAFUPreferences;
  v2 = [(UARPUpdaterServiceAFUPreferences *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.UARPUpdaterServiceAFU", "preferences");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.accessoryupdater.UARPUpdaterServiceAFU"];
    userPrefs = v2->_userPrefs;
    v2->_userPrefs = v5;
  }
  return v2;
}

- (NSURL)overriddenFirmwareAssetDirectoryURL
{
  os_log_t v3 = [(NSUserDefaults *)self->_userPrefs objectForKey:@"OverrideAssetDirectoryURL"];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000028D4((uint64_t)v3, log);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[NSURL fileURLWithPath:v3];
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrefs, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end