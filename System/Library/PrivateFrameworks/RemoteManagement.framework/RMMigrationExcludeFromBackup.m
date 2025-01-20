@interface RMMigrationExcludeFromBackup
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
@end

@implementation RMMigrationExcludeFromBackup

- (NSString)identifier
{
  return (NSString *)@"RMMigrationExcludeFromBackup";
}

- (BOOL)executeReturningError:(id *)a3
{
  v4 = +[RMLocations baseDirectoryURLCreateIfNeeded:0];
  v5 = +[NSFileManager defaultManager];
  v6 = [v4 path];
  unsigned int v7 = [v5 fileExistsAtPath:v6];

  if (!v7)
  {
    v11 = +[RMLog migrationExcludeFromBackup];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100052740(v11);
    }
    goto LABEL_7;
  }
  v8 = [v4 path];
  char v9 = DMCSetSkipBackupAttributeToItemAtPath();

  v10 = +[RMLog migrationExcludeFromBackup];
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100052664(v11);
    }
LABEL_7:
    BOOL v12 = 1;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000526A8(v4, v11);
  }

  if (!a3)
  {
    BOOL v12 = 0;
    goto LABEL_9;
  }
  v14 = +[RMErrorUtilities createInternalError];
  v11 = v14;
  if (v14)
  {
    v11 = v14;
    BOOL v12 = 0;
    *a3 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_8:

LABEL_9:
  return v12;
}

@end