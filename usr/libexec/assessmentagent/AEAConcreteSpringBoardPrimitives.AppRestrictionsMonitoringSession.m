@interface AEAConcreteSpringBoardPrimitives.AppRestrictionsMonitoringSession
- (_TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession)init;
- (void)cancel;
- (void)dealloc;
- (void)monitorDidLoseConnection;
- (void)monitorDidUpdateApplicationRestrictionState:(id)a3;
@end

@implementation AEAConcreteSpringBoardPrimitives.AppRestrictionsMonitoringSession

- (void)dealloc
{
  v2 = self;
  sub_100025354();
}

- (void).cxx_destruct
{
  sub_1000091B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession_invalidationHandler));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)cancel
{
  v2 = self;
  sub_100025658();
}

- (void)monitorDidUpdateApplicationRestrictionState:(id)a3
{
  uint64_t v5 = sub_1000048A0(&qword_1000ACAB0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  id v12 = [v10 allowedBundleIdentifiers];
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v14[1] = v13;
  CATAsyncStreamMulticaster.yield(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)monitorDidLoseConnection
{
  v2 = self;
  sub_10002585C();
}

- (_TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession)init
{
  result = (_TtCC15assessmentagent32AEAConcreteSpringBoardPrimitivesP33_045FAD156806D8E8B8D6866051B4907732AppRestrictionsMonitoringSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end