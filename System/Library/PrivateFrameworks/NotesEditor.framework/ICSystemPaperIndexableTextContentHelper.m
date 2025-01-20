@interface ICSystemPaperIndexableTextContentHelper
- (ICSystemPaperIndexableTextContentHelper)init;
- (ICSystemPaperIndexableTextContentHelper)initWithPaperAttachment:(id)a3;
- (PKDrawing)drawing;
- (id)searchWithQuery:(id)a3;
- (void)setDrawing:(id)a3;
@end

@implementation ICSystemPaperIndexableTextContentHelper

- (PKDrawing)drawing
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676BFAE8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing;
  swift_beginAccess();
  sub_20C159290((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_20C1629A0();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_20C162980();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (PKDrawing *)v9;
}

- (void)setDrawing:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676BFAE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v8 = self;
    id v9 = a3;
    sub_20C162990();

    uint64_t v10 = sub_20C1629A0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_20C1629A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    v12 = self;
  }
  v13 = (char *)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing;
  swift_beginAccess();
  sub_20C1594B0((uint64_t)v7, (uint64_t)v13);
  swift_endAccess();
}

- (ICSystemPaperIndexableTextContentHelper)initWithPaperAttachment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (ICSystemPaperIndexableTextContentHelper *)sub_20C159C50(v3);

  return v4;
}

- (id)searchWithQuery:(id)a3
{
  uint64_t v4 = sub_20C162AC0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  ICSystemPaperIndexableTextContentHelper.search(query:)(v4, v6);

  swift_bridgeObjectRelease();
  sub_20C15A470();
  uint64_t v8 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v8;
}

- (ICSystemPaperIndexableTextContentHelper)init
{
  result = (ICSystemPaperIndexableTextContentHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_drawing, &qword_2676BFAE8);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperIndexableTextContentHelper_attachment);
}

@end