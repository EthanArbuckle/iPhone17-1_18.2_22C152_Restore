@interface StoryColorGradeEditorItemLayout
- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)init;
- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)initWithComposition:(id)a3;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)referenceSizeDidChange;
- (void)update;
@end

@implementation StoryColorGradeEditorItemLayout

- (void)update
{
  v2 = self;
  sub_1AEB89068();
}

- (void)referenceSizeDidChange
{
  v2 = self;
  sub_1AEB89BC4((uint64_t)v2, type metadata accessor for StoryColorGradeEditorItemLayout, (SEL *)&selRef_referenceSizeDidChange, (uint64_t (*)(id))sub_1AEB88FE4);
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_1AEF97980();
  swift_unknownObjectRelease();
  int64_t v9 = sub_1AEB89254(v11, v8, a5);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  return v9;
}

- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)initWithComposition:(id)a3
{
  id v3 = a3;
  sub_1AEB8B6BC();
}

- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_clipLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_overlayLayout));
  swift_unknownObjectRelease();
}

@end