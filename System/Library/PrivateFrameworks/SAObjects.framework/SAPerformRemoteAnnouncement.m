@interface SAPerformRemoteAnnouncement
- (BOOL)requiresResponse;
- (NSDate)announcementTimestamp;
- (NSNumber)announcementNotificationType;
- (NSNumber)announcementPlatform;
- (NSNumber)announcementType;
- (NSString)announcementIdentifier;
- (SAStartLocalRequest)startLocalRequest;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnnouncementIdentifier:(id)a3;
- (void)setAnnouncementNotificationType:(id)a3;
- (void)setAnnouncementPlatform:(id)a3;
- (void)setAnnouncementTimestamp:(id)a3;
- (void)setAnnouncementType:(id)a3;
- (void)setStartLocalRequest:(id)a3;
@end

@implementation SAPerformRemoteAnnouncement

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PerformRemoteAnnouncement";
}

- (NSString)announcementIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"announcementIdentifier"];
}

- (void)setAnnouncementIdentifier:(id)a3
{
}

- (NSNumber)announcementNotificationType
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"announcementNotificationType"];
}

- (void)setAnnouncementNotificationType:(id)a3
{
}

- (NSNumber)announcementPlatform
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"announcementPlatform"];
}

- (void)setAnnouncementPlatform:(id)a3
{
}

- (NSDate)announcementTimestamp
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"announcementTimestamp"];
}

- (void)setAnnouncementTimestamp:(id)a3
{
}

- (NSNumber)announcementType
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"announcementType"];
}

- (void)setAnnouncementType:(id)a3
{
}

- (SAStartLocalRequest)startLocalRequest
{
  return (SAStartLocalRequest *)AceObjectAceObjectForProperty(self, @"startLocalRequest");
}

- (void)setStartLocalRequest:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end