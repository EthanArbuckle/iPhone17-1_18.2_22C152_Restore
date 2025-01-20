@interface SATimerSet
+ (id)set;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SATimerObject)timer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimer:(id)a3;
@end

@implementation SATimerSet

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"Set";
}

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SATimerObject)timer
{
  return (SATimerObject *)AceObjectAceObjectForProperty(self, @"timer");
}

- (void)setTimer:(id)a3
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