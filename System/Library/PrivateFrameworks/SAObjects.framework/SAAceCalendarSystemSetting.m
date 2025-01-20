@interface SAAceCalendarSystemSetting
+ (id)aceCalendarSystemSetting;
- (NSString)calendarType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCalendarType:(id)a3;
@end

@implementation SAAceCalendarSystemSetting

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceCalendarSystemSetting";
}

+ (id)aceCalendarSystemSetting
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)calendarType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"calendarType"];
}

- (void)setCalendarType:(id)a3
{
}

@end