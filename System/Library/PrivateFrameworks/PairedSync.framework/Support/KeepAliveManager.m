@interface KeepAliveManager
+ (void)createPathFile;
+ (void)deletePathFile;
@end

@implementation KeepAliveManager

+ (void)createPathFile
{
  v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/PairedSyncKeepAlive" isDirectory:0];

  if ((v3 & 1) == 0)
  {
    v4 = psd_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating KeepAlive file", buf, 2u);
      }
    }
    v7 = +[NSData data];
    id v16 = 0;
    unsigned __int8 v8 = [v7 writeToFile:@"/var/mobile/Library/PairedSyncKeepAlive" options:268435457 error:&v16];
    id v9 = v16;

    if (v8) {
      goto LABEL_15;
    }
    v10 = [v9 domain];
    if ([v10 isEqualToString:NSCocoaErrorDomain])
    {
      id v11 = [v9 code];

      if (v11 == (id)516)
      {
LABEL_15:
        byte_1000384C0 = 0;

        return;
      }
    }
    else
    {
    }
    v12 = psd_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = psd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v9, "psy_safeDescription");
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to create KeepAlive file with error: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
}

+ (void)deletePathFile
{
  if ((byte_1000384C0 & 1) == 0)
  {
    v2 = +[NSFileManager defaultManager];
    unsigned __int8 v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/PairedSyncKeepAlive" isDirectory:0];

    if ((v3 & 1) == 0)
    {
      byte_1000384C0 = 1;
      return;
    }
    v4 = psd_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting KeepAlive file", buf, 2u);
      }
    }
    v7 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v8 = [v7 removeItemAtPath:@"/var/mobile/Library/PairedSyncKeepAlive" error:&v16];
    id v9 = v16;

    if (v8)
    {
      byte_1000384C0 = 1;
LABEL_18:

      return;
    }
    v10 = [v9 domain];
    if ([v10 isEqualToString:NSCocoaErrorDomain])
    {
      id v11 = [v9 code];

      if (v11 == (id)4) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v12 = psd_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = psd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v9, "psy_safeDescription");
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete KeepAlive file with error: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
}

@end