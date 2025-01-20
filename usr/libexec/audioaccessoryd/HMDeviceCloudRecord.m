@interface HMDeviceCloudRecord
- (NSString)bluetoothAddress;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd19HMDeviceCloudRecord)init;
- (char)mediaAssistEnabled;
- (char)pmeMediaEnabled;
- (char)pmeVoiceEnabled;
- (char)swipeGainEnabled;
- (id)hmDeviceCloudRecordInfo;
- (unsigned)haRegionStatus;
- (unsigned)hpRegionStatus;
- (void)setHaRegionStatus:(unsigned __int8)a3;
- (void)setHpRegionStatus:(unsigned __int8)a3;
- (void)setMediaAssistEnabled:(char)a3;
- (void)setPmeMediaEnabled:(char)a3;
- (void)setPmeVoiceEnabled:(char)a3;
- (void)setSwipeGainEnabled:(char)a3;
@end

@implementation HMDeviceCloudRecord

- (NSString)bluetoothAddress
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unsigned)haRegionStatus
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_haRegionStatus);
}

- (void)setHaRegionStatus:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_haRegionStatus) = a3;
}

- (unsigned)hpRegionStatus
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_hpRegionStatus);
}

- (void)setHpRegionStatus:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_hpRegionStatus) = a3;
}

- (char)mediaAssistEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_mediaAssistEnabled);
}

- (void)setMediaAssistEnabled:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_mediaAssistEnabled) = a3;
}

- (char)pmeMediaEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeMediaEnabled);
}

- (void)setPmeMediaEnabled:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeMediaEnabled) = a3;
}

- (char)pmeVoiceEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeVoiceEnabled);
}

- (void)setPmeVoiceEnabled:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_pmeVoiceEnabled) = a3;
}

- (char)swipeGainEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_swipeGainEnabled);
}

- (void)setSwipeGainEnabled:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_swipeGainEnabled) = a3;
}

- (NSString)description
{
  NSString v2 = self;
  HMDeviceCloudRecord.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  NSString v2 = self;
  NSString v3 = [(HMDeviceCloudRecord *)v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC15audioaccessoryd19HMDeviceCloudRecord)init
{
  result = (_TtC15audioaccessoryd19HMDeviceCloudRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000AA8F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata), *(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_cloudMetadata]);
  NSString v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_1000AA894((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_latestDiagnosticTimestampLeft, &qword_100261D90);
  sub_1000AA894((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_latestDiagnosticTimestampRight, &qword_100261D90);
  v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd19HMDeviceCloudRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (id)hmDeviceCloudRecordInfo
{
  NSString v2 = self;
  id v3 = sub_100138420();

  return v3;
}

@end