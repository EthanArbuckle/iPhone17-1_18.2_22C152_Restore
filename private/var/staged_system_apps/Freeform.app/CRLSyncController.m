@interface CRLSyncController
- (_TtC8Freeform17CRLSyncController)init;
@end

@implementation CRLSyncController

- (_TtC8Freeform17CRLSyncController)init
{
  result = (_TtC8Freeform17CRLSyncController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_dataSource);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncLogicProvider);
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_fetchStatusObserver);

  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncEngine, &qword_101685C68);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncPriorityProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform17CRLSyncController_syncMetadata, &qword_101685C60);

  swift_release();
}

@end