@interface DMDPaths
+ (NSString)managedAppsManifest;
+ (NSString)managedNonStoreBooksDirectory;
+ (NSString)managedNonStoreBooksManifestPath;
+ (NSString)managedStoreBooksManifestPath;
+ (NSString)managementPromptPolicyPath;
+ (NSString)mdmFilePath;
+ (NSString)purchasedBooksDirectory;
+ (NSString)purchasedBooksManifest;
+ (NSString)systemLostModeRequestPath;
+ (id)_managedNonStoreBooksSystemGroupContainer;
+ (id)_systemGroupContainerPathWithGroupIdentifier:(id)a3;
+ (id)_systemProfileLibraryDirectory;
+ (id)_systemProfileStorageDirectory;
+ (id)_userDirectory;
+ (id)configurationProfilesSystemGroupContainer;
@end

@implementation DMDPaths

+ (id)configurationProfilesSystemGroupContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E9C0;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBB98 != -1) {
    dispatch_once(&qword_1000FBB98, block);
  }
  v2 = (void *)qword_1000FBB90;

  return v2;
}

+ (NSString)managementPromptPolicyPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EB0C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBA8 != -1) {
    dispatch_once(&qword_1000FBBA8, block);
  }
  v2 = (void *)qword_1000FBBA0;

  return (NSString *)v2;
}

+ (NSString)managedAppsManifest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EC0C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBB8 != -1) {
    dispatch_once(&qword_1000FBBB8, block);
  }
  v2 = (void *)qword_1000FBBB0;

  return (NSString *)v2;
}

+ (NSString)purchasedBooksManifest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005ED0C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBC8 != -1) {
    dispatch_once(&qword_1000FBBC8, block);
  }
  v2 = (void *)qword_1000FBBC0;

  return (NSString *)v2;
}

+ (NSString)purchasedBooksDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EE0C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBD8 != -1) {
    dispatch_once(&qword_1000FBBD8, block);
  }
  v2 = (void *)qword_1000FBBD0;

  return (NSString *)v2;
}

+ (NSString)managedStoreBooksManifestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EF0C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBE8 != -1) {
    dispatch_once(&qword_1000FBBE8, block);
  }
  v2 = (void *)qword_1000FBBE0;

  return (NSString *)v2;
}

+ (NSString)managedNonStoreBooksDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F00C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBBF8 != -1) {
    dispatch_once(&qword_1000FBBF8, block);
  }
  v2 = (void *)qword_1000FBBF0;

  return (NSString *)v2;
}

+ (NSString)managedNonStoreBooksManifestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F10C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC08 != -1) {
    dispatch_once(&qword_1000FBC08, block);
  }
  v2 = (void *)qword_1000FBC00;

  return (NSString *)v2;
}

+ (NSString)systemLostModeRequestPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F20C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC18 != -1) {
    dispatch_once(&qword_1000FBC18, block);
  }
  v2 = (void *)qword_1000FBC10;

  return (NSString *)v2;
}

+ (NSString)mdmFilePath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F30C;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC28 != -1) {
    dispatch_once(&qword_1000FBC28, block);
  }
  v2 = (void *)qword_1000FBC20;

  return (NSString *)v2;
}

+ (id)_userDirectory
{
  return @"/var/mobile/";
}

+ (id)_systemProfileStorageDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F418;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC38 != -1) {
    dispatch_once(&qword_1000FBC38, block);
  }
  v2 = (void *)qword_1000FBC30;

  return v2;
}

+ (id)_systemProfileLibraryDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F518;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC48 != -1) {
    dispatch_once(&qword_1000FBC48, block);
  }
  v2 = (void *)qword_1000FBC40;

  return v2;
}

+ (id)_managedNonStoreBooksSystemGroupContainer
{
  v3 = (void *)qword_1000FBC50;
  if (!qword_1000FBC50)
  {
    uint64_t v4 = [a1 _systemGroupContainerPathWithGroupIdentifier:@"systemgroup.com.apple.media.books.managed"];
    v5 = (void *)qword_1000FBC50;
    qword_1000FBC50 = v4;

    v3 = (void *)qword_1000FBC50;
    if (!qword_1000FBC50)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000868B4();
      }
      v3 = (void *)qword_1000FBC50;
    }
  }

  return v3;
}

+ (id)_systemGroupContainerPathWithGroupIdentifier:(id)a3
{
  uint64_t v8 = 1;
  id v3 = a3;
  [v3 UTF8String];
  uint64_t v4 = container_system_group_path_for_identifier();
  if (v4)
  {
    v5 = (void *)v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10008698C((uint64_t)v3, (uint64_t)v5);
    }
    v6 = +[NSString stringWithCString:v5 encoding:4];
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000868FC((uint64_t)v3, &v8);
    }
    v6 = 0;
  }

  return v6;
}

@end