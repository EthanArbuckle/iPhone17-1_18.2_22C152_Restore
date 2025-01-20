@interface SACalendarEventSnippet
+ (id)eventSnippet;
- (NSArray)events;
- (NSDate)snippetEndDate;
- (NSDate)snippetStartDate;
- (NSString)timeZoneId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEvents:(id)a3;
- (void)setSnippetEndDate:(id)a3;
- (void)setSnippetStartDate:(id)a3;
- (void)setTimeZoneId:(id)a3;
@end

@implementation SACalendarEventSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"EventSnippet";
}

+ (id)eventSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)events
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"events", v3);
}

- (void)setEvents:(id)a3
{
}

- (NSDate)snippetEndDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"snippetEndDate"];
}

- (void)setSnippetEndDate:(id)a3
{
}

- (NSDate)snippetStartDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"snippetStartDate"];
}

- (void)setSnippetStartDate:(id)a3
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