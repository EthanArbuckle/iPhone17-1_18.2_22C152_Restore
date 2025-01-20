@interface SDBuildInfo
+ (BOOL)currentBuildIsSeed;
+ (BOOL)isFeedbackAssistantAvailable;
+ (void)isFeedbackAssistantAvailable;
@end

@implementation SDBuildInfo

+ (BOOL)currentBuildIsSeed
{
  return 0;
}

+ (BOOL)isFeedbackAssistantAvailable
{
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"applefeedback://"];
  id v9 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v2 error:&v9];
  id v4 = v9;
  if (v4)
  {
    v5 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SDBuildInfo isFeedbackAssistantAvailable];
    }
    char v6 = 0;
  }
  else
  {
    if (!v3)
    {
      char v6 = 0;
      goto LABEL_8;
    }
    v5 = [v3 bundleRecord];
    v7 = [v5 bundleIdentifier];
    char v6 = [v7 isEqual:@"com.apple.appleseed.FeedbackAssistant"];
  }
LABEL_8:

  return v6;
}

+ (void)isFeedbackAssistantAvailable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Error checking FBA url scheme %{public}@", (uint8_t *)&v2, 0xCu);
}

@end