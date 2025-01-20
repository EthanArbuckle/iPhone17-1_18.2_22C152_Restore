@interface CurrentLocationController
- (_TtC5Books25CurrentLocationController)init;
@end

@implementation CurrentLocationController

- (_TtC5Books25CurrentLocationController)init
{
  result = (_TtC5Books25CurrentLocationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_bookEntity);
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_historyController);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_storedUpdate, &qword_100B47028);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_sendTimer, &qword_100B2AB90);
  v3 = (char *)self + OBJC_IVAR____TtC5Books25CurrentLocationController_log;
  uint64_t v4 = sub_1007F6BC0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end