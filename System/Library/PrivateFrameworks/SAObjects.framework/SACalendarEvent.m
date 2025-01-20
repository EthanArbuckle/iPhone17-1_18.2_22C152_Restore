@interface SACalendarEvent
+ (id)event;
- (BOOL)allDay;
- (NSArray)alerts;
- (NSArray)attendees;
- (NSArray)recurrences;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)includeRecurrences;
- (NSNumber)readOnly;
- (NSString)location;
- (NSString)notes;
- (NSString)selfParticipantStatus;
- (NSString)status;
- (NSString)timeZoneId;
- (NSString)title;
- (NSURL)calendarId;
- (NSURL)calendarPunchoutURI;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlerts:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setAttendees:(id)a3;
- (void)setCalendarId:(id)a3;
- (void)setCalendarPunchoutURI:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setIncludeRecurrences:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setReadOnly:(id)a3;
- (void)setRecurrences:(id)a3;
- (void)setSelfParticipantStatus:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SACalendarEvent

- (id)groupIdentifier
{
  return @"com.apple.ace.calendar";
}

- (id)encodedClassName
{
  return @"Event";
}

+ (id)event
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alerts
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"alerts"];
}

- (void)setAlerts:(id)a3
{
}

- (BOOL)allDay
{
  return AceObjectBoolForProperty(self, @"allDay");
}

- (void)setAllDay:(BOOL)a3
{
}

- (NSArray)attendees
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"attendees", v3);
}

- (void)setAttendees:(id)a3
{
}

- (NSURL)calendarId
{
  return (NSURL *)AceObjectURLForProperty(self, @"calendarId");
}

- (void)setCalendarId:(id)a3
{
}

- (NSURL)calendarPunchoutURI
{
  return (NSURL *)AceObjectURLForProperty(self, @"calendarPunchoutURI");
}

- (void)setCalendarPunchoutURI:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)includeRecurrences
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"includeRecurrences"];
}

- (void)setIncludeRecurrences:(id)a3
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

- (NSNumber)readOnly
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"readOnly"];
}

- (void)setReadOnly:(id)a3
{
}

- (NSArray)recurrences
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"recurrences", v3);
}

- (void)setRecurrences:(id)a3
{
}

- (NSString)selfParticipantStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selfParticipantStatus"];
}

- (void)setSelfParticipantStatus:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
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

@end