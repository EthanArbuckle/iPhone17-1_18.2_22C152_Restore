@interface NSDictionary(UNSNotificationRecord)
- (uint64_t)uns_notificationIdentifier;
@end

@implementation NSDictionary(UNSNotificationRecord)

- (uint64_t)uns_notificationIdentifier
{
  return [a1 objectForKey:@"AppNotificationIdentifier"];
}

@end