@interface SACalendarEventSearch
+ (id)eventSearch;
- (BOOL)requiresResponse;
- (NSArray)participants;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)limit;
- (NSString)location;
- (NSString)notes;
- (NSString)timeZoneId;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndDate:(id)a3;
- (void)setLimit:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SACalendarEventSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"EventSearch";
}

+ (id)eventSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)limit
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"limit"];
}

- (void)setLimit:(id)a3
{
}

- (NSString)location
{
  return (NSString *)[(AceObject *)self propertyForKey:@"location"];
}

- (void)setLocation:(id)a3
{
}

- (NSString)notes
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notes"];
}

- (void)setNotes:(id)a3
{
}

- (NSArray)participants
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"participants"];
}

- (void)setParticipants:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end