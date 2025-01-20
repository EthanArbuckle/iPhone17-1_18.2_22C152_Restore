@interface NearbySessionsListenerImplementation
- (BOOL)hasDiscoveredSessionForIdentifier:(id)a3;
- (MRDGroupSessionListenerDelegate)delegate;
- (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation)init;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)requestToJoinDiscoveredSession:(NSString *)a3 completion:(id)a4;
- (void)requestToJoinSession:(MRGroupSessionToken *)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NearbySessionsListenerImplementation

- (MRDGroupSessionListenerDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MRDGroupSessionListenerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_100197CF4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation____lazy_storage___homeObserver));
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)hasDiscoveredSessionForIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_100197F5C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)requestToJoinDiscoveredSession:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100478798;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1004787A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000B340((uint64_t)v9, (uint64_t)&unk_1004787A8, (uint64_t)v14);
  swift_release();
}

- (void)requestToJoinSession:(MRGroupSessionToken *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100478758;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100478768;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000B340((uint64_t)v9, (uint64_t)&unk_100478778, (uint64_t)v14);
  swift_release();
}

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1001A0C34(a3);
}

- (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation)init
{
  result = (_TtC12mediaremotedP33_A89A4181BFB0A82ECB9159988E1E4AC136NearbySessionsListenerImplementation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end