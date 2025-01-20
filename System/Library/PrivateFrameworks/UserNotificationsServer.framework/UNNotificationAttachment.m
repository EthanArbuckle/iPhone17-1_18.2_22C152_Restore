@interface UNNotificationAttachment
@end

@implementation UNNotificationAttachment

void __56__UNNotificationAttachment_Staging___systemDirectoryURL__block_invoke()
{
  v0 = NSURL;
  BSSystemRootDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"System"];
  uint64_t v2 = [v0 fileURLWithPath:v1];
  v3 = (void *)_systemDirectoryURL___systemDirectoryURL;
  _systemDirectoryURL___systemDirectoryURL = v2;
}

@end