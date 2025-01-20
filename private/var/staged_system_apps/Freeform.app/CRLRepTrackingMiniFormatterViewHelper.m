@interface CRLRepTrackingMiniFormatterViewHelper
- (NSArray)decoratorOverlayRenderables;
- (_TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper)init;
- (id)crlaxRepToFocus;
- (void)didEndDynamicOperation;
- (void)didEndScrollingOperation;
- (void)didEndZoomingOperation;
- (void)unobscuredFrameDidChange;
- (void)willBeginDynamicOperation;
- (void)willBeginScrollingOperation;
- (void)willBeginZoomingOperation;
@end

@implementation CRLRepTrackingMiniFormatterViewHelper

- (id)crlaxRepToFocus
{
  v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  v4 = (void *)sub_10099985C(v3);

  swift_bridgeObjectRelease();

  return v4;
}

- (_TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper)init
{
  result = (_TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_delegate);
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (NSArray)decoratorOverlayRenderables
{
  sub_10050E85C();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)willBeginDynamicOperation
{
  NSArray v2 = self;
  sub_10080B688();
}

- (void)didEndDynamicOperation
{
  NSArray v2 = self;
  sub_10080B988();
}

- (void)willBeginScrollingOperation
{
  uint64_t v2 = qword_10166FB30;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v4 = (id)static OS_os_log.crlMiniFormatter;
  uint64_t v5 = static os_log_type_t.default.getter();
  sub_100BAC898((uint64_t)v4, (uint64_t)&_mh_execute_header, v5, (uint64_t)"[MiniFormatter] RepTrackingViewHelper is beginning scroll operation", 67, 2, (uint64_t)_swiftEmptyArrayStorage);

  *((unsigned char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_isScrollingBoard) = 1;
}

- (void)didEndScrollingOperation
{
  uint64_t v2 = qword_10166FB30;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v4 = (id)static OS_os_log.crlMiniFormatter;
  uint64_t v5 = static os_log_type_t.default.getter();
  sub_100BAC898((uint64_t)v4, (uint64_t)&_mh_execute_header, v5, (uint64_t)"[MiniFormatter] RepTrackingViewHelper is ending scroll operation", 64, 2, (uint64_t)_swiftEmptyArrayStorage);

  *((unsigned char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_isScrollingBoard) = 0;
  sub_10080B038();
}

- (void)willBeginZoomingOperation
{
  uint64_t v2 = self;
  sub_10080BE0C();
}

- (void)didEndZoomingOperation
{
  uint64_t v2 = self;
  sub_10080BFBC();
}

- (void)unobscuredFrameDidChange
{
  uint64_t v2 = self;
  sub_10080B038();
}

@end