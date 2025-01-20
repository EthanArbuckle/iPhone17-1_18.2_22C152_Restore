@interface AADeviceRecord
- (NSDate)audiogramCreationTimestamp;
- (NSString)bluetoothAddress;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC15audioaccessoryd14AADeviceRecord)init;
- (_TtC15audioaccessoryd14AADeviceRecord)initWithDevice:(id)a3 error:(id *)a4;
- (char)allowNoiseManagementOff;
- (char)headGestureMode;
- (unsigned)acceptReplyPlayPauseConfig;
- (unsigned)declineDismissSkipConfig;
- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3;
- (void)setAllowNoiseManagementOff:(char)a3;
- (void)setAudiogramCreationTimestamp:(id)a3;
- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3;
- (void)setHeadGestureMode:(char)a3;
@end

@implementation AADeviceRecord

- (NSString)bluetoothAddress
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig);
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_acceptReplyPlayPauseConfig) = a3;
}

- (char)allowNoiseManagementOff
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff);
}

- (void)setAllowNoiseManagementOff:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_allowNoiseManagementOff) = a3;
}

- (NSDate)audiogramCreationTimestamp
{
  uint64_t v3 = sub_1000AA024(&qword_100261D90);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp;
  swift_beginAccess();
  sub_1000F7934((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setAudiogramCreationTimestamp:(id)a3
{
  uint64_t v5 = sub_1000AA024(&qword_100261D90);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1000F7A3C((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (unsigned)declineDismissSkipConfig
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig);
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_declineDismissSkipConfig) = a3;
}

- (char)headGestureMode
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode);
}

- (void)setHeadGestureMode:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_headGestureMode) = a3;
}

- (NSString)description
{
  NSString v2 = self;
  AADeviceRecord.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  NSString v2 = self;
  NSString v3 = [(AADeviceRecord *)v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC15audioaccessoryd14AADeviceRecord)initWithDevice:(id)a3 error:(id *)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  UUID.init()();
  id v9 = objc_allocWithZone((Class)type metadata accessor for AADeviceRecord());
  v10 = sub_10012C4A8((uint64_t)v7, 0, 0xC000000000000000, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC15audioaccessoryd14AADeviceRecord *)v10;
}

- (_TtC15audioaccessoryd14AADeviceRecord)init
{
  result = (_TtC15audioaccessoryd14AADeviceRecord *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000AA8F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata), *(void *)&self->cloudMetadata[OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_cloudMetadata]);
  NSString v3 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_identifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_1000AA894((uint64_t)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_audiogramCreationTimestamp, &qword_100261D90);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC15audioaccessoryd14AADeviceRecord_lastModifiedDate;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end