@interface SAReminderCompositeTrigger
+ (id)compositeTrigger;
- (SAReminderDateTimeTrigger)dateTimeTrigger;
- (SAReminderLocationTrigger)locationTrigger;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDateTimeTrigger:(id)a3;
- (void)setLocationTrigger:(id)a3;
@end

@implementation SAReminderCompositeTrigger

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"CompositeTrigger";
}

+ (id)compositeTrigger
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAReminderDateTimeTrigger)dateTimeTrigger
{
  return (SAReminderDateTimeTrigger *)AceObjectAceObjectForProperty(self, @"dateTimeTrigger");
}

- (void)setDateTimeTrigger:(id)a3
{
}

- (SAReminderLocationTrigger)locationTrigger
{
  return (SAReminderLocationTrigger *)AceObjectAceObjectForProperty(self, @"locationTrigger");
}

- (void)setLocationTrigger:(id)a3
{
}

@end