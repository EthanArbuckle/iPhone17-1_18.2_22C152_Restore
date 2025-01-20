@interface MRDNearbyGroup
+ (void)createWithCompletion:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)sessionSecret;
- (_TtC12mediaremoted14MRDNearbyGroup)init;
- (void)setSessionSecret:(id)a3;
@end

@implementation MRDNearbyGroup

- (NSString)identifier
{
  return (NSString *)sub_1001BC2F0(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_nearbyGroup, (void (*)(void))&NearbyGroup.id.getter);
}

- (NSString)sessionSecret
{
  v2 = self;
  sub_1001BB808();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setSessionSecret:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup____lazy_storage___sessionSecret);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

+ (void)createWithCompletion:(id)a3
{
  uint64_t v5 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100478EA8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100478EB0;
  v12[5] = v11;
  sub_10000B340((uint64_t)v7, (uint64_t)&unk_100478EB8, (uint64_t)v12);
  swift_release();
}

- (NSString)description
{
  swift_getObjectType();
  NSString v3 = self;
  v4._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 8250;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  v8._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0x68))(v6, v7);
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 62;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v10;
}

- (_TtC12mediaremoted14MRDNearbyGroup)init
{
  result = (_TtC12mediaremoted14MRDNearbyGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  NSString v3 = (char *)self + OBJC_IVAR____TtC12mediaremoted14MRDNearbyGroup_autoApproveKey;
  uint64_t v4 = type metadata accessor for SymmetricKey();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end