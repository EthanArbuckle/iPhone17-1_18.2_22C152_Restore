@interface KTZoneSetup
- (BOOL)initialFetch;
- (_TtC13transparencyd11KTZoneSetup)init;
- (_TtC13transparencyd11KTZoneSetup)initWithCkdatabase:(id)a3 analytics:(id)a4 context:(id)a5 zoneCreate:(id)a6;
- (void)groupStart;
- (void)setInitialFetch:(BOOL)a3;
@end

@implementation KTZoneSetup

- (BOOL)initialFetch
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess();
  return *v2;
}

- (void)setInitialFetch:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC13transparencyd11KTZoneSetup)initWithCkdatabase:(id)a3 analytics:(id)a4 context:(id)a5 zoneCreate:(id)a6
{
  sub_10008E0A0(0, &qword_10031F8E0);
  v10 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneCreate) = v10;
  type metadata accessor for KTCKZone();
  v11 = (objc_class *)swift_allocObject();
  *((void *)v11 + 2) = a5;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneHandler) = v11;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for KTZoneSetup();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  return [(KTGroupOperation *)&v16 init];
}

- (void)groupStart
{
  v2 = self;
  KTZoneSetup.groupStart()();
}

- (_TtC13transparencyd11KTZoneSetup)init
{
  result = (_TtC13transparencyd11KTZoneSetup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics);
}

@end