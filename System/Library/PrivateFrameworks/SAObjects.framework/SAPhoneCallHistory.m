@interface SAPhoneCallHistory
+ (id)callHistory;
- (NSNumber)blocked;
- (NSNumber)callCount;
- (NSNumber)faceTime;
- (NSNumber)faceTimeAudio;
- (NSNumber)missed;
- (NSNumber)outgoing;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBlocked:(id)a3;
- (void)setCallCount:(id)a3;
- (void)setFaceTime:(id)a3;
- (void)setFaceTimeAudio:(id)a3;
- (void)setMissed:(id)a3;
- (void)setOutgoing:(id)a3;
@end

@implementation SAPhoneCallHistory

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallHistory";
}

+ (id)callHistory
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)blocked
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"blocked"];
}

- (void)setBlocked:(id)a3
{
}

- (NSNumber)callCount
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"callCount"];
}

- (void)setCallCount:(id)a3
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

@end