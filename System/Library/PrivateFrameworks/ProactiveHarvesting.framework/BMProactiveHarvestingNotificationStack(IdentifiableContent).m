@interface BMProactiveHarvestingNotificationStack(IdentifiableContent)
- (__CFString)domainId;
@end

@implementation BMProactiveHarvestingNotificationStack(IdentifiableContent)

- (__CFString)domainId
{
  return @"com.apple.usernotifications.groups";
}

@end