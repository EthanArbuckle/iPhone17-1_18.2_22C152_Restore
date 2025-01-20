@interface SATimerDismiss
+ (id)dismiss;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)timerIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimerIds:(id)a3;
@end

@implementation SATimerDismiss

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"Dismiss";
}

+ (id)dismiss
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)timerIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"timerIds");
}

- (void)setTimerIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end