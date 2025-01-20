@interface StoryColorGradeEditorContentLayout
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)init;
- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)initWithDecoratedLayout:(id)a3;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
@end

@implementation StoryColorGradeEditorContentLayout

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9B1B0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_1AEAAE630((uint64_t)v7);

  uint64_t v10 = sub_1AEF93960();
  v11 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) != 1)
  {
    v11 = (void *)sub_1AEF93900();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
  }
  return v11;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4 = sub_1AEAAE854();
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5 = a4;
  float v6 = self;
  int64_t v7 = sub_1AEAAE880();

  return v7;
}

- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)initWithDecoratedLayout:(id)a3
{
  id v3 = a3;
  sub_1AEAAE8D0();
}

- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout_viewModel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout_overlayLayout);
}

@end