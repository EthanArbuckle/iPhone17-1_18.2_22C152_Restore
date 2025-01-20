@interface BookReaderHighlightEditorController
- (_TtC5Books35BookReaderHighlightEditorController)init;
- (void)didHideAnnotationEditor:(id)a3;
- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5;
@end

@implementation BookReaderHighlightEditorController

- (_TtC5Books35BookReaderHighlightEditorController)init
{
  result = (_TtC5Books35BookReaderHighlightEditorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_annotationProviderService);
  sub_1006E4E88((uint64_t)self + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_currentTheme);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_noteEditor);
}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  sub_1007FDC70();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1006E49C8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didHideAnnotationEditor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1006E40E0(a3);
  swift_unknownObjectRelease();
}

@end