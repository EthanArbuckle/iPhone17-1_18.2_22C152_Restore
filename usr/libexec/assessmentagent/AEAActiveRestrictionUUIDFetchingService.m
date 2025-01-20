@interface AEAActiveRestrictionUUIDFetchingService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15assessmentagent39AEAActiveRestrictionUUIDFetchingService)init;
- (void)dealloc;
- (void)fetchSetOfActiveRestrictionUUIDsWithClientType:(id)a3 completion:(id)a4;
@end

@implementation AEAActiveRestrictionUUIDFetchingService

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15assessmentagent39AEAActiveRestrictionUUIDFetchingService_XPCListener);
  v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AEAActiveRestrictionUUIDFetchingService();
  [(AEAActiveRestrictionUUIDFetchingService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15assessmentagent39AEAActiveRestrictionUUIDFetchingService_XPCListener);
}

- (_TtC15assessmentagent39AEAActiveRestrictionUUIDFetchingService)init
{
  result = (_TtC15assessmentagent39AEAActiveRestrictionUUIDFetchingService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_10001BFE8(v7);

  return v9 & 1;
}

- (void)fetchSetOfActiveRestrictionUUIDsWithClientType:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void *, Class, void))_Block_copy(a4);
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_beginAccess();
  id v7 = self;
  swift_bridgeObjectRetain();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v6[2](v6, isa, 0);
  swift_bridgeObjectRelease();

  _Block_release(v6);
  swift_bridgeObjectRelease();
}

@end