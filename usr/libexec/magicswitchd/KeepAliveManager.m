@interface KeepAliveManager
+ (void)createMagicSwitchPathFile;
+ (void)deleteMagicSwitchPathFile;
@end

@implementation KeepAliveManager

+ (void)createMagicSwitchPathFile
{
  if (qword_100021A20 != 2)
  {
    if (!qword_100021A28)
    {
      uint64_t v2 = os_transaction_create();
      v3 = (void *)qword_100021A28;
      qword_100021A28 = v2;
    }
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Creating KeepAlive file", buf, 2u);
    }
    v5 = +[NSData data];
    id v11 = 0;
    unsigned __int8 v6 = [v5 writeToFile:@"/var/mobile/Library/DeviceRegistry/MagicSwitchKeepAlive" options:268435457 error:&v11];
    id v7 = v11;

    if (v6) {
      goto LABEL_9;
    }
    v8 = [v7 domain];
    if ([v8 isEqualToString:NSCocoaErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)516)
      {
LABEL_9:
        qword_100021A20 = 2;
LABEL_13:

        return;
      }
    }
    else
    {
    }
    v10 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Failed to create KeepAlive file with error: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
}

+ (void)deleteMagicSwitchPathFile
{
  if (qword_100021A20 != 1)
  {
    uint64_t v2 = (void *)qword_100021A28;
    if (qword_100021A28)
    {
      qword_100021A28 = 0;
    }
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Deleting KeepAlive file", buf, 2u);
    }
    v4 = +[NSFileManager defaultManager];
    id v10 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:@"/var/mobile/Library/DeviceRegistry/MagicSwitchKeepAlive" error:&v10];
    id v6 = v10;

    if (v5) {
      goto LABEL_9;
    }
    id v7 = [v6 domain];
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)4)
      {
LABEL_9:
        qword_100021A20 = 1;
LABEL_13:

        return;
      }
    }
    else
    {
    }
    id v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "KeepAliveManager --- Failed to delete KeepAlive file with error: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
}

@end