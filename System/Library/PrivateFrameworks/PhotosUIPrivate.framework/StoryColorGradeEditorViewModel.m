@interface StoryColorGradeEditorViewModel
- (_TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel)init;
@end

@implementation StoryColorGradeEditorViewModel

- (_TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_storyModel));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_mediaProvider));
  swift_bridgeObjectRelease();
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_selectionHandler));
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_cancelHandler));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_specManager));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_layoutSpec);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel__tungstenView;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9E6E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end