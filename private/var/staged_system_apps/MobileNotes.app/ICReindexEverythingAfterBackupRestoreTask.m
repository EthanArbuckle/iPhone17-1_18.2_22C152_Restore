@interface ICReindexEverythingAfterBackupRestoreTask
- (id)taskIdentifier;
- (void)runOneTimePerBackupRestoreLaunchTask;
@end

@implementation ICReindexEverythingAfterBackupRestoreTask

- (id)taskIdentifier
{
  return @"DidSetReindexEverythingFlagPerBackupRestore";
}

- (void)runOneTimePerBackupRestoreLaunchTask
{
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    v2 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1004DB9CC(v2);
    }
  }
  else
  {
    uint64_t v3 = kICReindexOnLaunchKey;
    +[ICSettingsUtilities setObject:&__kCFBooleanTrue forKey:v3];
  }
}

@end