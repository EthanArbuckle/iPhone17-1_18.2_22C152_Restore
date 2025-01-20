@interface TextCorrectionMarkerView
- (CGRect)frame;
- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithCoder:(id)a3;
- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)textViewLayoutDidChange:(id)a3;
@end

@implementation TextCorrectionMarkerView

- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor24TextCorrectionMarkerView *)sub_20C036DC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor24TextCorrectionMarkerView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_markers) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_minimumMarkerWidth) = (Class)0x4034000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TextCorrectionMarkerView_markerYOffset) = (Class)0xC020000000000000;
  id v5 = a3;

  result = (_TtC11NotesEditor24TextCorrectionMarkerView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(TextCorrectionMarkerView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v7 = v8.receiver;
  -[TextCorrectionMarkerView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  objc_msgSend(v7, sel_ic_setNeedsDisplay, v8.receiver, v8.super_class);
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  sub_20C037204(x, y, width, height);
}

- (void)textViewLayoutDidChange:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  objc_super v8 = self;
  sub_20C037018();
  [(TextCorrectionMarkerView *)v8 ic_setNeedsDisplay];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end