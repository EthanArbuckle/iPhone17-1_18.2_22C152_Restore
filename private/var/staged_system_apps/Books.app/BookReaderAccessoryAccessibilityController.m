@interface BookReaderAccessoryAccessibilityController
- (_TtC5Books42BookReaderAccessoryAccessibilityController)init;
- (void)dealloc;
@end

@implementation BookReaderAccessoryAccessibilityController

- (void)dealloc
{
  v2 = self;
  sub_10050D7A0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_adornmentState;
  uint64_t v4 = sub_1007FB040();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_logger;
  uint64_t v6 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_paginatingService);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_annotationProviderService);
  swift_weakDestroy();
  sub_10023E454((uint64_t)self+ OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_bookContentAccessoryAccessibilityHandler);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_pageNumberProvider);
  swift_weakDestroy();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_currentLocation, &qword_100B38690);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books42BookReaderAccessoryAccessibilityController_currentTheme, &qword_100B2ABC0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC5Books42BookReaderAccessoryAccessibilityController)init
{
  result = (_TtC5Books42BookReaderAccessoryAccessibilityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end