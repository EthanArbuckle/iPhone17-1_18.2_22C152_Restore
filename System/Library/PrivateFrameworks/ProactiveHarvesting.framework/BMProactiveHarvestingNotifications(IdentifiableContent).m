@interface BMProactiveHarvestingNotifications(IdentifiableContent)
- (__CFString)domainId;
@end

@implementation BMProactiveHarvestingNotifications(IdentifiableContent)

- (__CFString)domainId
{
  return @"com.apple.usernotifications";
}

@end