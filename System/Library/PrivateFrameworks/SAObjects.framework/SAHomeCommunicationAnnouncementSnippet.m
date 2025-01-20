@interface SAHomeCommunicationAnnouncementSnippet
- (NSString)announcerName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAnnouncerName:(id)a3;
@end

@implementation SAHomeCommunicationAnnouncementSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.homecommunication";
}

- (id)encodedClassName
{
  return @"AnnouncementSnippet";
}

- (NSString)announcerName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"announcerName"];
}

- (void)setAnnouncerName:(id)a3
{
}

@end