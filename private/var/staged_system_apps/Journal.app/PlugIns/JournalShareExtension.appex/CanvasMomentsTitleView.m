@interface CanvasMomentsTitleView
- (UIResponder)nextResponder;
- (_TtC21JournalShareExtension22CanvasMomentsTitleView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension22CanvasMomentsTitleView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_accessibilityResponderElement;
- (void)insertText:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
@end

@implementation CanvasMomentsTitleView

- (_TtC21JournalShareExtension22CanvasMomentsTitleView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21JournalShareExtension22CanvasMomentsTitleView_journalEntry) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CanvasMomentsTitleView();
  id v9 = a4;
  v10 = -[CanvasMomentsTitleView initWithFrame:textContainer:](&v12, "initWithFrame:textContainer:", v9, x, y, width, height);
  sub_1000589FC();

  return v10;
}

- (_TtC21JournalShareExtension22CanvasMomentsTitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC21JournalShareExtension22CanvasMomentsTitleView_journalEntry) = 0;
  id v4 = a3;

  result = (_TtC21JournalShareExtension22CanvasMomentsTitleView *)sub_10010AA60();
  __break(1u);
  return result;
}

- (UIResponder)nextResponder
{
  v2 = self;
  id v3 = [(CanvasMomentsTitleView *)v2 superview];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 superview];

    if (v5)
    {
      type metadata accessor for CanvasTextView();
      v6 = (void *)swift_dynamicCastClass();
      if (v6)
      {
        v7 = (UIResponder *)[v6 nextResponder];

        goto LABEL_7;
      }
    }
  }
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for CanvasMomentsTitleView();
  v7 = [(CanvasMomentsTitleView *)&v9 nextResponder];

LABEL_7:

  return v7;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    uint64_t v7 = sub_100109D30();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_100058DA0(v7, v9, location, length);

  swift_bridgeObjectRelease();
}

- (void)insertText:(id)a3
{
  uint64_t v16 = sub_100109D30();
  uint64_t v17 = v4;
  uint64_t v14 = 10;
  unint64_t v15 = 0xE100000000000000;
  uint64_t v12 = 32;
  unint64_t v13 = 0xE100000000000000;
  unint64_t v5 = sub_10005058C();
  v6 = self;
  unint64_t v9 = v5;
  unint64_t v10 = v5;
  unint64_t v8 = v5;
  sub_10010A780();
  NSString v7 = sub_100109CF0();
  swift_bridgeObjectRelease();
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for CanvasMomentsTitleView();
  -[CanvasMomentsTitleView insertText:](&v11, "insertText:", v7, &type metadata for String, v8, v9, v10);

  swift_bridgeObjectRelease();
}

- (id)_accessibilityResponderElement
{
  v2 = self;
  sub_100058FE0(v10);

  uint64_t v3 = v11;
  if (v11)
  {
    uint64_t v4 = sub_10000B718(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    __chkstk_darwin(v4);
    NSString v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    unint64_t v8 = (void *)sub_10010AC90();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    sub_10000B7B0((uint64_t)v10);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_100059798(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end