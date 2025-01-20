@interface BookReaderAccessoryNotesController
- (_TtC5Books34BookReaderAccessoryNotesController)init;
- (void)dealloc;
@end

@implementation BookReaderAccessoryNotesController

- (void)dealloc
{
  v2 = self;
  sub_1007DEA28();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_adornmentState;
  uint64_t v4 = sub_1007FB040();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_delegate);
  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_paginatingService);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_readingSettingsProvider);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_annotationProviderService);
  swift_weakDestroy();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books34BookReaderAccessoryNotesController_currentTheme, &qword_100B2ABC0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC5Books34BookReaderAccessoryNotesController)init
{
  result = (_TtC5Books34BookReaderAccessoryNotesController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end