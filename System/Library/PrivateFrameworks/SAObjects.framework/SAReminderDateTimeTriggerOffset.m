@interface SAReminderDateTimeTriggerOffset
+ (id)dateTimeTriggerOffset;
- (NSNumber)offsetValue;
- (NSString)offsetTimeUnit;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOffsetTimeUnit:(id)a3;
- (void)setOffsetValue:(id)a3;
@end

@implementation SAReminderDateTimeTriggerOffset

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"DateTimeTriggerOffset";
}

+ (id)dateTimeTriggerOffset
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)offsetTimeUnit
{
  return (NSString *)[(AceObject *)self propertyForKey:@"offsetTimeUnit"];
}

- (void)setOffsetTimeUnit:(id)a3
{
}

- (NSNumber)offsetValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"offsetValue"];
}

- (void)setOffsetValue:(id)a3
{
}

@end