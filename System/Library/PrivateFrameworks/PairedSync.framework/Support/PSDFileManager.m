@interface PSDFileManager
+ (id)defaultManager;
- (PSDFileManager)init;
- (id)storageURL;
@end

@implementation PSDFileManager

+ (id)defaultManager
{
  if (qword_100038528 != -1) {
    dispatch_once(&qword_100038528, &stru_10002D010);
  }
  v2 = (void *)qword_100038520;

  return v2;
}

- (PSDFileManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PSDFileManager;
  v2 = [(PSDFileManager *)&v12 init];
  if (v2)
  {
    v3 = +[PSYRegistrySingleton registry];
    v4 = [v3 pairingStorePath];

    if (!v4)
    {
      v9 = psd_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        v11 = psd_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10001D1AC(v11);
        }
      }
      exit(0);
    }
    v5 = [v4 stringByAppendingPathComponent:@"/PairedSync/"];
    uint64_t v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    storageURL = v2->_storageURL;
    v2->_storageURL = (NSURL *)v6;
  }
  return v2;
}

- (id)storageURL
{
  return self->_storageURL;
}

- (void).cxx_destruct
{
}

@end