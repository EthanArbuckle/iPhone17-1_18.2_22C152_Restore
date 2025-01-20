@interface NSFileManager
+ (id)dmd_legacyUserConfigurationEngineDatabaseURL;
+ (id)dmd_systemConfigurationDatabaseURL;
+ (id)dmd_systemConfigurationEngineDirectoryURL;
+ (id)dmd_systemDMDDirectoryURL;
+ (id)dmd_systemLibraryURL;
+ (id)dmd_userConfigurationDatabaseURL;
+ (id)dmd_userConfigurationEngineDirectoryURL;
+ (id)dmd_userDMDDirectoryURL;
+ (id)dmd_userDarwinUserTempDirectoryURL;
+ (id)dmd_userEffectivePoliciesDatabaseURL;
+ (id)dmd_userFontDatabaseDirectoryURL;
+ (id)dmd_userHomeURL;
+ (id)dmd_userImageDatabaseDirectoryURL;
+ (id)dmd_userLibraryURL;
+ (void)dmd_createUserDMDDirectoryDataVault;
+ (void)dmd_setUserDirSuffix:(char *)a3;
@end

@implementation NSFileManager

+ (id)dmd_systemLibraryURL
{
  if (qword_1000FBD80 != -1) {
    dispatch_once(&qword_1000FBD80, &stru_1000CC110);
  }
  v2 = (void *)qword_1000FBD78;

  return v2;
}

+ (id)dmd_systemDMDDirectoryURL
{
  v2 = [a1 dmd_systemLibraryURL];
  v3 = [v2 URLByAppendingPathComponent:@"dmd" isDirectory:1];

  return v3;
}

+ (id)dmd_systemConfigurationEngineDirectoryURL
{
  v2 = [a1 dmd_systemDMDDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"ConfigurationEngine" isDirectory:1];

  return v3;
}

+ (id)dmd_systemConfigurationDatabaseURL
{
  v2 = [a1 dmd_systemConfigurationEngineDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Database" isDirectory:0];

  return v3;
}

+ (id)dmd_userHomeURL
{
  if (qword_1000FBD90 != -1) {
    dispatch_once(&qword_1000FBD90, &stru_1000CC130);
  }
  v2 = (void *)qword_1000FBD88;

  return v2;
}

+ (id)dmd_userLibraryURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DF74;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBDA0 != -1) {
    dispatch_once(&qword_1000FBDA0, block);
  }
  v2 = (void *)qword_1000FBD98;

  return v2;
}

+ (id)dmd_userDarwinUserTempDirectoryURL
{
  if (qword_1000FBDB0 != -1) {
    dispatch_once(&qword_1000FBDB0, &stru_1000CC150);
  }
  v2 = (void *)qword_1000FBDA8;

  return v2;
}

+ (id)dmd_userDMDDirectoryURL
{
  v2 = [a1 dmd_userLibraryURL];
  v3 = [v2 URLByAppendingPathComponent:@"dmd" isDirectory:1];

  return v3;
}

+ (id)dmd_userConfigurationEngineDirectoryURL
{
  v2 = [a1 dmd_userDMDDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"ConfigurationEngine" isDirectory:1];

  return v3;
}

+ (id)dmd_userConfigurationDatabaseURL
{
  v2 = [a1 dmd_userConfigurationEngineDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Database" isDirectory:0];

  return v3;
}

+ (id)dmd_userImageDatabaseDirectoryURL
{
  v2 = [a1 dmd_userConfigurationEngineDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Images" isDirectory:1];

  return v3;
}

+ (id)dmd_userFontDatabaseDirectoryURL
{
  v2 = [a1 dmd_userConfigurationEngineDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Font" isDirectory:1];

  return v3;
}

+ (id)dmd_userEffectivePoliciesDatabaseURL
{
  v2 = [a1 dmd_userDMDDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Policies" isDirectory:1];
  v4 = [v3 URLByAppendingPathComponent:@"Database" isDirectory:0];

  return v4;
}

+ (void)dmd_createUserDMDDirectoryDataVault
{
  v2 = [a1 dmd_userDMDDirectoryURL];
  v3 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]");
    [v7 handleFailureInFunction:v8, @"NSFileManager+DMDAdditions.m", 190, @"Failed to create data vault directory: %@", v5 file lineNumber description];
  }
  id v6 = v2;
  [v6 fileSystemRepresentation];
  if (rootless_convert_to_datavault())
  {
    v9 = +[NSAssertionHandler currentHandler];
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]");
    v11 = __error();
    v12 = +[NSString stringWithUTF8String:strerror(*v11)];
    [v9 handleFailureInFunction:v10, @"NSFileManager+DMDAdditions.m", 193, @"Failed to enable data vault: %@ (%d)", v12, *__error() file lineNumber description];
  }
}

+ (void)dmd_setUserDirSuffix:(char *)a3
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_setUserDirSuffix:]");
    unsigned __int8 v4 = __error();
    id v5 = +[NSString stringWithUTF8String:strerror(*v4)];
    [v6 handleFailureInFunction:v3, @"NSFileManager+DMDAdditions.m", 197, @"Failed to set the user directory suffix: %@ (%d)", v5, *__error() file lineNumber description];
  }
}

+ (id)dmd_legacyUserConfigurationEngineDatabaseURL
{
  v2 = [a1 dmd_userDMDDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"Configurations" isDirectory:0];

  return v3;
}

@end