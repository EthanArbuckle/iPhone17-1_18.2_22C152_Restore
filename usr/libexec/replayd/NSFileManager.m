@interface NSFileManager
- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording;
- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording;
- (id)_srGetCreationDateForFile:(id)a3;
- (id)_srTempPath;
- (id)dateSuffix;
- (id)outputPath:(int)a3 bundleID:(id)a4;
- (id)trimmedOutputPath:(id)a3;
- (int64_t)_srDeleteAllAndSystemTempFiles;
- (int64_t)_srDeleteAllTempFiles;
- (int64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:(double)a3 deleteSystemFiles:(BOOL)a4;
- (int64_t)_srSizeOfTempDir:(id *)a3;
- (unint64_t)_srDeviceFreeDiskSpace;
- (void)_srDeleteFilesWithPrefix:(id)a3;
- (void)_srMoveFileFromURL:(id)a3 toURL:(id)a4 completion:(id)a5;
- (void)_srRemoveFile:(id)a3 completion:(id)a4;
- (void)_srSetupTempDirectory;
@end

@implementation NSFileManager

- (id)_srTempPath
{
  return [@"/private/var/mobile/Library/ReplayKit/" stringByExpandingTildeInPath];
}

- (void)_srSetupTempDirectory
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_srSetupTempDirectory", buf, 2u);
  }
  v3 = [(NSFileManager *)self _srTempPath];
  unsigned __int8 v4 = [(NSFileManager *)self fileExistsAtPath:v3 isDirectory:0];

  if (v4)
  {
    [(NSFileManager *)self _srDeleteAllAndSystemTempFiles];
  }
  else
  {
    v5 = [(NSFileManager *)self _srTempPath];
    id v7 = 0;
    [(NSFileManager *)self createDirectoryAtPath:v5 withIntermediateDirectories:0 attributes:0 error:&v7];
    id v6 = v7;

    if (v6)
    {
      NSLog(@"error: %@", v6);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004ED34();
      }
    }
  }
}

- (id)dateSuffix
{
  v2 = +[NSDate date];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
  unsigned __int8 v4 = [v3 stringFromDate:v2];
  v5 = [v4 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

  return v5;
}

- (id)outputPath:(int)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = [(NSFileManager *)self dateSuffix];
  if (a3 == 1)
  {
    v8 = +[NSFileManager defaultManager];
    v9 = [v8 _srTempPath];
    +[NSString stringWithFormat:@"%@/ClipRecording_%@.mp4", v9, v7];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v8 = +[NSFileManager defaultManager];
    v9 = [v8 _srTempPath];
    +[NSString stringWithFormat:@"%@/ScreenRecording_%@.mp4", v9, v7];
    v10 = LABEL_5:;
    goto LABEL_7;
  }
  v8 = +[NSFileManager defaultManager];
  v9 = [v8 _srTempPath];
  v11 = +[NSBundle _rpLocalizedAppNameFromBundleID:v6];
  v10 = +[NSString stringWithFormat:@"%@/%@_%@.mp4", v9, v11, v7];

LABEL_7:

  return v10;
}

- (id)trimmedOutputPath:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSFileManager defaultManager];
  v5 = [v4 _srTempPath];
  id v6 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];

  id v7 = +[NSString stringWithFormat:@"%@/%@_trimmed.mp4", v5, v6];

  return v7;
}

- (int64_t)_srSizeOfTempDir:(id *)a3
{
  v5 = +[NSFileManager defaultManager];
  id v6 = [(NSFileManager *)self _srTempPath];
  id v7 = [v5 attributesOfItemAtPath:v6 error:a3];

  id v8 = [v7 fileSize];
  return (int64_t)v8;
}

- (int64_t)_srDeleteAllTempFiles
{
  return [(NSFileManager *)self _srDeleteFilesOlderThanTimeToLiveInSeconds:0 deleteSystemFiles:0.0];
}

- (int64_t)_srDeleteAllAndSystemTempFiles
{
  return [(NSFileManager *)self _srDeleteFilesOlderThanTimeToLiveInSeconds:1 deleteSystemFiles:0.0];
}

- (int64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:(double)a3 deleteSystemFiles:(BOOL)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = (int)a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_srDeleteFilesOlderThanTimeToLiveInSeconds: %i", buf, 8u);
  }
  id v7 = +[NSFileManager defaultManager];
  id v8 = [(NSFileManager *)self _srTempPath];
  id v39 = 0;
  v9 = [v7 contentsOfDirectoryAtPath:v8 error:&v39];
  id v10 = v39;

  sub_100002D34(v11, v10);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    int64_t v32 = 0;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (a4
          || ([*(id *)(*((void *)&v35 + 1) + 8 * i) containsString:@"ScreenRecording_"] & 1) == 0)
        {
          v17 = [(NSFileManager *)self _srTempPath];
          v18 = +[NSString stringWithFormat:@"%@/%@", v17, v16];

          id v34 = v10;
          v19 = [(NSFileManager *)self attributesOfItemAtPath:v18 error:&v34];
          id v20 = v34;

          sub_100002D34(v21, v20);
          v22 = +[NSDate date];
          v23 = [v19 fileModificationDate];
          [v22 timeIntervalSinceDate:v23];
          double v25 = v24;

          id v26 = [v19 fileSize];
          if (a3 == 0.0 || v25 > a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "deleting old file", buf, 2u);
            }
            id v33 = v20;
            [(NSFileManager *)self removeItemAtPath:v18 error:&v33];
            id v27 = v33;

            sub_100002D34(v28, v27);
            if (v27) {
              id v29 = 0;
            }
            else {
              id v29 = v26;
            }
            v32 += (int64_t)v29;
            id v20 = v27;
          }

          id v10 = v20;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }
  else
  {
    int64_t v32 = 0;
  }

  return v32;
}

- (void)_srRemoveFile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002E74;
  block[3] = &unk_100084D88;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_srMoveFileFromURL:(id)a3 toURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003034;
  v15[3] = &unk_100084DB0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)_srDeleteFilesWithPrefix:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000031B0;
  v7[3] = &unk_100084DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_srGetCreationDateForFile:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v5 = [v3 path];

  id v6 = [v4 attributesOfItemAtPath:v5 error:0];

  id v7 = [v6 objectForKey:NSFileCreationDate];

  return v7;
}

- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording
{
  return [(NSFileManager *)self _srDeviceFreeDiskSpace] > 0x5F5E100;
}

- (unint64_t)_srDeviceFreeDiskSpace
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(NSFileManager *)self _srTempPath];
  v5 = [v3 attributesOfFileSystemForPath:v4 error:0];

  id v6 = [v5 objectForKeyedSubscript:NSFileSystemFreeSize];
  id v7 = [v6 unsignedLongValue];

  return (unint64_t)v7;
}

- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording
{
  unint64_t v3 = 2 * [(NSFileManager *)self _srSizeOfTempDir:0] + 20000000;
  return v3 < [(NSFileManager *)self _srDeviceFreeDiskSpace];
}

@end