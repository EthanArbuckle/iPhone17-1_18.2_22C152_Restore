@interface MRDNearbyInvitation
+ (void)createWithNearbyGroup:(_TtC12mediaremoted14MRDNearbyGroup *)a3 displayName:(NSString *)a4 routeType:(unsigned __int8)a5 completion:(id)a6;
- (NSData)invitationData;
- (NSString)description;
- (NSString)identifier;
- (_TtC12mediaremoted19MRDNearbyInvitation)init;
- (void)markAsUsed;
@end

@implementation MRDNearbyInvitation

- (NSData)invitationData
{
  v2 = self;
  uint64_t v3 = dispatch thunk of NearbyInvitation.invitationData.getter();
  unint64_t v5 = v4;

  v6.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10018FE9C(v3, v5);

  return (NSData *)v6.super.isa;
}

- (NSString)identifier
{
  return (NSString *)sub_1001BC2F0(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC12mediaremoted19MRDNearbyInvitation_nearbyInvitation, (void (*)(void))&NearbyInvitation.id.getter);
}

+ (void)createWithNearbyGroup:(_TtC12mediaremoted14MRDNearbyGroup *)a3 displayName:(NSString *)a4 routeType:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v11 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = a1;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100478E88;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100478E90;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  sub_10000B340((uint64_t)v13, (uint64_t)&unk_100478E98, (uint64_t)v18);
  swift_release();
}

- (NSString)description
{
  swift_getObjectType();
  uint64_t v3 = self;
  v4._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3D6469203ALL;
  v5._object = (void *)0xE500000000000000;
  String.append(_:)(v5);
  v8._countAndFlagsBits = (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0x60))(v6, v7);
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 62;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v10;
}

- (void)markAsUsed
{
  v2 = self;
  sub_1001BC9F0();
}

- (_TtC12mediaremoted19MRDNearbyInvitation)init
{
  result = (_TtC12mediaremoted19MRDNearbyInvitation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end