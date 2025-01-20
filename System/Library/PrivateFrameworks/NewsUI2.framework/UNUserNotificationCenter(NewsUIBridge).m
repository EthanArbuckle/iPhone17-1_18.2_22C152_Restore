@interface UNUserNotificationCenter(NewsUIBridge)
- (void)ts_replaceContentForRequestWithIdentifier:()NewsUIBridge replacementContent:completionHandler:;
@end

@implementation UNUserNotificationCenter(NewsUIBridge)

- (void)ts_replaceContentForRequestWithIdentifier:()NewsUIBridge replacementContent:completionHandler:
{
  v7 = (void *)MEMORY[0x1E4F44680];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 currentNotificationCenter];
  [v11 replaceContentForRequestWithIdentifier:v10 replacementContent:v9 completionHandler:v8];
}

@end