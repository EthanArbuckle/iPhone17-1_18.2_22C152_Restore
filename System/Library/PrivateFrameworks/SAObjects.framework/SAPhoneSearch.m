@interface SAPhoneSearch
+ (id)search;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)contacts;
- (NSDate)end;
- (NSDate)start;
- (NSNumber)faceTime;
- (NSNumber)faceTimeAudio;
- (NSNumber)isNew;
- (NSNumber)last;
- (NSNumber)missed;
- (NSNumber)outgoing;
- (NSNumber)voiceMail;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContacts:(id)a3;
- (void)setEnd:(id)a3;
- (void)setFaceTime:(id)a3;
- (void)setFaceTimeAudio:(id)a3;
- (void)setIsNew:(id)a3;
- (void)setLast:(id)a3;
- (void)setMissed:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setStart:(id)a3;
- (void)setVoiceMail:(id)a3;
@end

@implementation SAPhoneSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)contacts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"contacts", v3);
}

- (void)setContacts:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"end"];
}

- (void)setEnd:(id)a3
{
}

- (NSNumber)faceTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"faceTime"];
}

- (void)setFaceTime:(id)a3
{
}

- (NSNumber)faceTimeAudio
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"faceTimeAudio"];
}

- (void)setFaceTimeAudio:(id)a3
{
}

- (NSNumber)isNew
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isNew"];
}

- (void)setIsNew:(id)a3
{
}

- (NSNumber)last
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"last"];
}

- (void)setLast:(id)a3
{
}

- (NSNumber)missed
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"missed"];
}

- (void)setMissed:(id)a3
{
}

- (NSNumber)outgoing
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"outgoing"];
}

- (void)setOutgoing:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"start"];
}

- (void)setStart:(id)a3
{
}

- (NSNumber)voiceMail
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"voiceMail"];
}

- (void)setVoiceMail:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end