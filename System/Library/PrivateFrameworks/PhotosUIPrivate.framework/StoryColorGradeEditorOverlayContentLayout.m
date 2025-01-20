@interface StoryColorGradeEditorOverlayContentLayout
- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5;
- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)init;
- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)initWithComposition:(id)a3;
- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4;
- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)referenceSizeDidChange;
- (void)update;
@end

@implementation StoryColorGradeEditorOverlayContentLayout

- (void)update
{
  v2 = self;
  sub_1AEAAEEC0();
}

- (void)referenceSizeDidChange
{
  v2 = self;
  sub_1AEAAF0B0();
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AEF97980();
  swift_unknownObjectRelease();
  int64_t v9 = sub_1AEAAF4D4(v11, a4, a5);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  return v9;
}

- (int64_t)scrollableAxis
{
  return OUTLINED_FUNCTION_46_1();
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = sub_1AEAB1074((uint64_t)v6, a4);

  return v8;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  CGSizeMake(a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  sub_1AEAB12C8(&v12);
  uint64_t v4 = v13;
  if (v13)
  {
    double v5 = __swift_project_boxed_opaque_existential_0Tm(&v12, v13);
    uint64_t v6 = *(void *)(v4 - 8);
    __n128 v7 = MEMORY[0x1F4188790](v5);
    int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v6 + 16))(v9, v7);
    v10 = (void *)sub_1AEF97E10();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v12);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)initWithComposition:(id)a3
{
  id v3 = a3;
  sub_1AEAB1410();
}

- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout_viewModel));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end