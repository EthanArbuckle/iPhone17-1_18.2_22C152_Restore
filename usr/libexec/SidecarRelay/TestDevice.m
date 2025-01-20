@interface TestDevice
- (NSString)description;
- (NSString)identifier;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (_TtC12SidecarRelay10TestDevice)init;
- (_TtC12SidecarRelay10TestDevice)initWithCoder:(id)a3;
- (_TtC12SidecarRelay10TestDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6;
- (unint64_t)statusFlags;
- (void)setIdentifier:(id)a3;
@end

@implementation TestDevice

- (_TtC12SidecarRelay10TestDevice)init
{
  return (_TtC12SidecarRelay10TestDevice *)sub_10005AF3C();
}

- (_TtC12SidecarRelay10TestDevice)initWithCoder:(id)a3
{
}

- (NSString)description
{
  return (NSString *)sub_10005C470(self, (uint64_t)a2, (void (*)(void))sub_10005B0B4);
}

- (NSString)identifier
{
  v2 = self;
  sub_10005B240();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setIdentifier:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v4 = self;
  sub_10005B2D0();
}

- (NSString)idsDeviceIdentifier
{
  return (NSString *)sub_10005C470(self, (uint64_t)a2, (void (*)(void))sub_10005B240);
}

- (NSString)model
{
  v2 = self;
  sub_10005B364();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)name
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unint64_t)statusFlags
{
  return 4;
}

- (_TtC12SidecarRelay10TestDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (!a5)
    {
LABEL_3:
      if (!a6) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if (!a5)
  {
    goto LABEL_3;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a6) {
LABEL_4:
  }
    sub_10005B414();
LABEL_7:
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10005B414();
}

- (void).cxx_destruct
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC12SidecarRelay10TestDevice_uuid;
  type metadata accessor for UUID();
  sub_1000139D0();
  NSString v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end