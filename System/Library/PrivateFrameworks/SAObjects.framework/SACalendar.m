@interface SACalendar
+ (id)calendar;
- (NSDate)date;
- (NSString)timeZoneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDate:(id)a3;
- (void)setTimeZoneId:(id)a3;
@end

@implementation SACalendar

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Calendar";
}

+ (id)calendar
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)date
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"date"];
}

- (void)setDate:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

@end