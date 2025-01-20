@interface UARemotePasteboardBecameAvailableEvent
- (id)eventName;
- (id)eventPayload;
@end

@implementation UARemotePasteboardBecameAvailableEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.Available";
}

- (id)eventPayload
{
  return 0;
}

@end