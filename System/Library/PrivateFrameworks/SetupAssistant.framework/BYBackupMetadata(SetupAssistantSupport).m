@interface BYBackupMetadata(SetupAssistantSupport)
- (void)expressSettings;
@end

@implementation BYBackupMetadata(SetupAssistantSupport)

- (void)expressSettings
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Failed to parse settings data from backup metadata", v1, 2u);
}

@end