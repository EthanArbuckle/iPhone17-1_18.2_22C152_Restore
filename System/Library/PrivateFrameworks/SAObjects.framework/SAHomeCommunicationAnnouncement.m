@interface SAHomeCommunicationAnnouncement
- (NSDate)datePlaybackFinished;
- (NSDate)datePlaybackStarted;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDatePlaybackFinished:(id)a3;
- (void)setDatePlaybackStarted:(id)a3;
@end

@implementation SAHomeCommunicationAnnouncement

- (id)groupIdentifier
{
  return @"com.apple.ace.homecommunication";
}

- (id)encodedClassName
{
  return @"Announcement";
}

- (NSDate)datePlaybackFinished
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"datePlaybackFinished"];
}

- (void)setDatePlaybackFinished:(id)a3
{
}

- (NSDate)datePlaybackStarted
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"datePlaybackStarted"];
}

- (void)setDatePlaybackStarted:(id)a3
{
}

@end