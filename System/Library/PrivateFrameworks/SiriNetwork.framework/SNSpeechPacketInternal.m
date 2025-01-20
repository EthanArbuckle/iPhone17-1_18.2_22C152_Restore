@interface SNSpeechPacketInternal
- (BOOL)bufferingAllowedDuringActiveSession;
- (BOOL)isProvisional;
- (BOOL)isRestartable;
- (BOOL)isRetryable;
- (BOOL)supportedByLocalSession;
- (BOOL)supportedByRemoteLimitedSession;
- (NSArray)packets;
- (NSString)internalAceId;
- (NSString)internalRefId;
- (SNSpeechPacketInternal)init;
- (id)serializedAceDataAndReturnError:(id *)a3;
- (id)sessionRequestId;
- (int64_t)packetNumber;
- (void)setInternalAceId:(id)a3;
- (void)setInternalRefId:(id)a3;
- (void)setPacketNumber:(int64_t)a3;
- (void)setPackets:(id)a3;
- (void)setSessionRequestId:(id)a3;
@end

@implementation SNSpeechPacketInternal

- (NSString)internalAceId
{
  return (NSString *)@objc SpeechPacket.internalAceId.getter((uint64_t)self, (uint64_t)a2, SpeechPacket.internalAceId.getter);
}

- (void)setInternalAceId:(id)a3
{
}

- (NSString)internalRefId
{
  return (NSString *)@objc SpeechPacket.internalAceId.getter((uint64_t)self, (uint64_t)a2, SpeechPacket.internalRefId.getter);
}

- (void)setInternalRefId:(id)a3
{
}

- (NSArray)packets
{
  SpeechPacket.packets.getter();
  type metadata accessor for NSData();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setPackets:(id)a3
{
  type metadata accessor for NSData();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  SpeechPacket.packets.setter(v4);
}

- (int64_t)packetNumber
{
  return SpeechPacket.packetNumber.getter();
}

- (void)setPacketNumber:(int64_t)a3
{
}

- (SNSpeechPacketInternal)init
{
  return (SNSpeechPacketInternal *)SpeechPacket.init()();
}

- (id)serializedAceDataAndReturnError:(id *)a3
{
  v3 = self;
  uint64_t v4 = (void *)SpeechPacket.serializedAceData()();

  return v4;
}

- (BOOL)bufferingAllowedDuringActiveSession
{
  return 1;
}

- (BOOL)isRetryable
{
  return 1;
}

- (BOOL)isRestartable
{
  return 0;
}

- (BOOL)isProvisional
{
  return 0;
}

- (id)sessionRequestId
{
  return 0;
}

- (void)setSessionRequestId:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else if (((v3 ^ (2 * v3)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  swift_bridgeObjectRelease();
}

- (BOOL)supportedByLocalSession
{
  return 0;
}

- (BOOL)supportedByRemoteLimitedSession
{
  return 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end