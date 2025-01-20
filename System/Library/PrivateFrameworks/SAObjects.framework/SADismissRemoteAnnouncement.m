@interface SADismissRemoteAnnouncement
- (BOOL)requiresResponse;
- (NSString)announcementIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnnouncementIdentifier:(id)a3;
@end

@implementation SADismissRemoteAnnouncement

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DismissRemoteAnnouncement";
}

- (NSString)announcementIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"announcementIdentifier"];
}

- (void)setAnnouncementIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end