@interface SASSpeechPacket
+ (id)speechPacket;
- (BOOL)requiresResponse;
- (NSArray)packets;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)packetNumber;
- (void)setPacketNumber:(int64_t)a3;
- (void)setPackets:(id)a3;
@end

@implementation SASSpeechPacket

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechPacket";
}

+ (id)speechPacket
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)packetNumber
{
  return AceObjectIntegerForProperty(self, @"packetNumber");
}

- (void)setPacketNumber:(int64_t)a3
{
}

- (NSArray)packets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"packets"];
}

- (void)setPackets:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end