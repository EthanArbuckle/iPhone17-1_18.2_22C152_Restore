@interface SNWiFiRecordInternal
- (BOOL)isCaptive;
- (NSDate)timestamp;
- (NSString)channelInfo;
- (NSString)phyMode;
- (SNWiFiRecordInternal)init;
- (SNWiFiRecordInternal)initWithRssi:(int64_t)a3 snr:(int64_t)a4 cca:(int64_t)a5 channelInfo:(id)a6 phyMode:(id)a7 isCaptive:(BOOL)a8 timestamp:(id)a9;
- (int64_t)cca;
- (int64_t)rssi;
- (int64_t)snr;
@end

@implementation SNWiFiRecordInternal

- (int64_t)rssi
{
  return WiFiRecordRepresentation.rssi.getter();
}

- (int64_t)snr
{
  return WiFiRecordRepresentation.snr.getter();
}

- (int64_t)cca
{
  return WiFiRecordRepresentation.cca.getter();
}

- (NSString)channelInfo
{
  return (NSString *)@objc WiFiRecordRepresentation.channelInfo.getter((uint64_t)self, (uint64_t)a2, WiFiRecordRepresentation.channelInfo.getter);
}

- (NSString)phyMode
{
  return (NSString *)@objc WiFiRecordRepresentation.channelInfo.getter((uint64_t)self, (uint64_t)a2, WiFiRecordRepresentation.phyMode.getter);
}

- (BOOL)isCaptive
{
  return WiFiRecordRepresentation.isCaptive.getter() & 1;
}

- (NSDate)timestamp
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  WiFiRecordRepresentation.timestamp.getter();
  v6.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6.super.isa;
}

- (SNWiFiRecordInternal)initWithRssi:(int64_t)a3 snr:(int64_t)a4 cca:(int64_t)a5 channelInfo:(id)a6 phyMode:(id)a7 isCaptive:(BOOL)a8 timestamp:(id)a9
{
  BOOL v23 = a8;
  uint64_t v12 = type metadata accessor for Date();
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  return (SNWiFiRecordInternal *)WiFiRecordRepresentation.init(rssi:snr:cca:channelInfo:phyMode:isCaptive:timestamp:)(a3, a4, a5, v15, v17, v18, v20, v23, (uint64_t)v14);
}

- (SNWiFiRecordInternal)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___SNWiFiRecordInternal_timestamp;
  type metadata accessor for Date();
  OUTLINED_FUNCTION_0_7();
  NSDate v6 = *(void (**)(char *, uint64_t))(v5 + 8);

  v6(v3, v4);
}

@end