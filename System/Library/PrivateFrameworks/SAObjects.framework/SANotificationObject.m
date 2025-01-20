@interface SANotificationObject
+ (id)object;
- (NSDate)date;
- (NSDate)endDate;
- (NSDate)recencyDate;
- (NSNumber)dateIsAllDay;
- (NSNumber)previewRestricted;
- (NSString)applicationId;
- (NSString)notificationId;
- (NSString)priority;
- (NSString)source;
- (NSString)threadIdentifier;
- (NSString)timeZoneId;
- (NSString)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationId:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateIsAllDay:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setNotificationId:(id)a3;
- (void)setPreviewRestricted:(id)a3;
- (void)setPriority:(id)a3;
- (void)setRecencyDate:(id)a3;
- (void)setSource:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setTimeZoneId:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SANotificationObject

- (id)groupIdentifier
{
  return @"com.apple.ace.notification";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)applicationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationId"];
}

- (void)setApplicationId:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"date"];
}

- (void)setDate:(id)a3
{
}

- (NSNumber)dateIsAllDay
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"dateIsAllDay"];
}

- (void)setDateIsAllDay:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSString)notificationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationId"];
}

- (void)setNotificationId:(id)a3
{
}

- (NSNumber)previewRestricted
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"previewRestricted"];
}

- (void)setPreviewRestricted:(id)a3
{
}

- (NSString)priority
{
  return (NSString *)[(AceObject *)self propertyForKey:@"priority"];
}

- (void)setPriority:(id)a3
{
}

- (NSDate)recencyDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"recencyDate"];
}

- (void)setRecencyDate:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

- (NSString)threadIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"threadIdentifier"];
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSString)timeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeZoneId"];
}

- (void)setTimeZoneId:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end