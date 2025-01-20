@interface BookReaderAccessoryHighlightsController
- (_TtC5Books39BookReaderAccessoryHighlightsController)init;
- (void)dealloc;
@end

@implementation BookReaderAccessoryHighlightsController

- (void)dealloc
{
  v2 = self;
  BookReaderAccessoryHighlightsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_adornmentState;
  uint64_t v4 = sub_1007FB040();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_highlightRenderingController));
  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_paginatingService);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_readingSettingsProvider);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_annotationProviderService);
  swift_weakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_selectionHighlightController);
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books39BookReaderAccessoryHighlightsController_currentTheme, &qword_100B2ABC0);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC5Books39BookReaderAccessoryHighlightsController)init
{
  result = (_TtC5Books39BookReaderAccessoryHighlightsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end