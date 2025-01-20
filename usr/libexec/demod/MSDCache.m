@interface MSDCache
+ (id)sharedInstance;
- (BOOL)checkIfFileIsInContainer:(id)a3 container:(id)a4;
- (BOOL)containerExist:(id)a3;
- (BOOL)createContainer:(id)a3;
- (BOOL)deleteContainer:(id)a3;
- (BOOL)deleteDataBlob:(id)a3;
- (BOOL)moveFile:(id)a3 toLocation:(id)a4 fromContainer:(id)a5 error:(id)a6;
- (BOOL)storeDataBlob:(id)a3 withContainerIdentifier:(id)a4;
- (MSDCache)init;
- (MSDTargetDevice)device;
- (NSFileManager)fileManager;
- (NSMutableDictionary)deletionList;
- (id)retrieveDataBlob:(id)a3;
- (void)setDeletionList:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFileManager:(id)a3;
@end

@implementation MSDCache

+ (id)sharedInstance
{
  if (qword_100189948 != -1) {
    dispatch_once(&qword_100189948, &stru_1001525F0);
  }
  v2 = (void *)qword_100189940;

  return v2;
}

- (MSDCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDCache;
  v2 = [(MSDCache *)&v7 init];
  if (v2)
  {
    v3 = +[NSFileManager defaultManager];
    [(MSDCache *)v2 setFileManager:v3];

    v4 = +[MSDTargetDevice sharedInstance];
    [(MSDCache *)v2 setDevice:v4];

    v5 = v2;
  }

  return v2;
}

- (BOOL)createContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSDCache *)v5 fileManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage"];

  if ((v7 & 1) == 0)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "creating container:%{public}@", (uint8_t *)&v16, 0xCu);
    }

    v9 = [(MSDCache *)v5 device];
    [v9 manageDemoVolume:@"Setup"];
  }
  v10 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4];
  v11 = [(MSDCache *)v5 fileManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    v14 = +[MSDHelperAgent sharedInstance];
    unsigned __int8 v13 = [v14 prepareWorkDirectory:v10 writableByNonRoot:1];
  }
  objc_sync_exit(v5);

  return v13;
}

- (BOOL)containerExist:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSDCache *)v5 fileManager];
  unsigned __int8 v7 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)deleteContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4];
  unsigned __int8 v7 = [(MSDCache *)v5 fileManager];
  unsigned int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    unsigned __int8 v12 = sub_100068730();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CB900((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
    }

    unsigned __int8 v10 = 0;
  }
  else
  {
    v9 = +[MSDHelperAgent sharedInstance];
    unsigned __int8 v10 = [v9 removeWorkDirectory:v6];
  }
  objc_sync_exit(v5);

  return v10;
}

- (BOOL)checkIfFileIsInContainer:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  v9 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v7];
  unsigned __int8 v10 = [v9 stringByAppendingPathComponent:v6];
  v11 = [(MSDCache *)v8 fileManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  objc_sync_exit(v8);
  return v12;
}

- (BOOL)moveFile:(id)a3 toLocation:(id)a4 fromContainer:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  objc_sync_enter(v14);
  uint64_t v15 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v12];
  uint64_t v16 = [v15 stringByAppendingPathComponent:v10];
  uint64_t v17 = [(MSDCache *)v14 fileManager];
  id v21 = v13;
  unsigned __int8 v18 = [v17 moveItemAtPath:v16 toPath:v11 error:&v21];
  id v19 = v21;

  objc_sync_exit(v14);
  return v18;
}

- (BOOL)storeDataBlob:(id)a3 withContainerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  v9 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v7];
  id v10 = [(MSDCache *)v8 fileManager];
  unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0 && ![(MSDCache *)v8 createContainer:v7])
  {
    uint64_t v15 = sub_100068730();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CB9B4((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_10;
  }
  if ((unint64_t)[v6 length] >= 0x400000)
  {
    uint64_t v15 = sub_100068730();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CB96C(v22, (uint64_t)[v6 length], v15);
    }
LABEL_10:

    unsigned __int8 v13 = 0;
    id v12 = @"PersistentDataBlob";
    goto LABEL_5;
  }
  id v12 = [v9 stringByAppendingPathComponent:@"PersistentDataBlob"];
  unsigned __int8 v13 = [v6 writeToFile:v12 atomically:1];
LABEL_5:

  objc_sync_exit(v8);
  return v13;
}

- (id)retrieveDataBlob:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4];
  id v7 = [(MSDCache *)v5 fileManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    v9 = [v6 stringByAppendingPathComponent:@"PersistentDataBlob"];
    id v10 = [(MSDCache *)v5 fileManager];
    unsigned int v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      id v12 = +[NSData dataWithContentsOfFile:v9];
      goto LABEL_10;
    }
  }
  else
  {
    unsigned __int8 v13 = sub_100068730();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CBA20((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    }

    v9 = @"PersistentDataBlob";
  }
  uint64_t v20 = sub_100068600();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543362;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "persistent data blob file does not exist:%{public}@", (uint8_t *)&v22, 0xCu);
  }

  id v12 = 0;
LABEL_10:

  objc_sync_exit(v5);

  return v12;
}

- (BOOL)deleteDataBlob:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByAppendingPathComponent:v4];
  id v7 = [(MSDCache *)v5 fileManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    v9 = [(MSDCache *)v5 fileManager];
    id v13 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v6 error:&v13];
    unsigned int v11 = v13;
  }
  else
  {
    unsigned int v11 = sub_100068730();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CBA8C(v11);
    }
    unsigned __int8 v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (NSMutableDictionary)deletionList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeletionList:(id)a3
{
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileManager:(id)a3
{
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_deletionList, 0);
}

@end