@interface SANotificationOnDeviceObject
- (NSData)request;
- (NSNumber)isHighlight;
- (NSString)announcementType;
- (NSString)body;
- (NSString)senderHandle;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)threadSummary;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnnouncementType:(id)a3;
- (void)setBody:(id)a3;
- (void)setIsHighlight:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSenderHandle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setThreadSummary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SANotificationOnDeviceObject

- (id)groupIdentifier
{
  return @"com.apple.ace.notification";
}

- (id)encodedClassName
{
  return @"OnDeviceObject";
}

- (NSString)announcementType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"announcementType"];
}

- (void)setAnnouncementType:(id)a3
{
}

- (NSString)body
{
  return (NSString *)[(AceObject *)self propertyForKey:@"body"];
}

- (void)setBody:(id)a3
{
}

- (NSNumber)isHighlight
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isHighlight"];
}

- (void)setIsHighlight:(id)a3
{
}

- (NSData)request
{
  return (NSData *)[(AceObject *)self propertyForKey:@"request"];
}

- (void)setRequest:(id)a3
{
}

- (NSString)senderHandle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"senderHandle"];
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"summary"];
}

- (void)setSummary:(id)a3
{
}

- (NSString)threadSummary
{
  return (NSString *)[(AceObject *)self propertyForKey:@"threadSummary"];
}

- (void)setThreadSummary:(id)a3
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