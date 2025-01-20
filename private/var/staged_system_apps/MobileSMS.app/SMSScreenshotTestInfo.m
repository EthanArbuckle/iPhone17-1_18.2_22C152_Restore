@interface SMSScreenshotTestInfo
+ (BOOL)isValidScreenshotTestName:(id)a3;
+ (id)screenshotTestName_IsolatedTranscriptUI;
+ (int64_t)screenshotTestNameEnumValue:(id)a3;
@end

@implementation SMSScreenshotTestInfo

+ (BOOL)isValidScreenshotTestName:(id)a3
{
  return +[SMSScreenshotTestInfo screenshotTestNameEnumValue:a3] != -1;
}

+ (int64_t)screenshotTestNameEnumValue:(id)a3
{
  return [a3 isEqualToString:@"SMSApplicationTranscriptOnly"] - 1;
}

+ (id)screenshotTestName_IsolatedTranscriptUI
{
  return @"SMSApplicationTranscriptOnly";
}

@end