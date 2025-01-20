@interface SAReminderTrigger
+ (id)trigger;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAReminderTrigger

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"Trigger";
}

+ (id)trigger
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end