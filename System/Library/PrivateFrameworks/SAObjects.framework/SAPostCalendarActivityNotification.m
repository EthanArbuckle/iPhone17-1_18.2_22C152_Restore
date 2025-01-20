@interface SAPostCalendarActivityNotification
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAPostCalendarActivityNotification

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PostCalendarActivityNotification";
}

- (BOOL)requiresResponse
{
  return 0;
}

@end