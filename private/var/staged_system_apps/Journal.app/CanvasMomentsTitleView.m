@interface CanvasMomentsTitleView
- (UIResponder)nextResponder;
- (_TtC7Journal22CanvasMomentsTitleView)initWithCoder:(id)a3;
- (_TtC7Journal22CanvasMomentsTitleView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_accessibilityResponderElement;
- (void)insertText:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
@end

@implementation CanvasMomentsTitleView

- (_TtC7Journal22CanvasMomentsTitleView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal22CanvasMomentsTitleView_journalEntry) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CanvasMomentsTitleView();
  id v9 = a4;
  v10 = -[CanvasMomentsTitleView initWithFrame:textContainer:](&v12, "initWithFrame:textContainer:", v9, x, y, width, height);
  sub_100088F58();

  return v10;
}

- (_TtC7Journal22CanvasMomentsTitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal22CanvasMomentsTitleView_journalEntry) = 0;
  id v4 = a3;

  result = (_TtC7Journal22CanvasMomentsTitleView *)_assertionFailure(_:_:file:line:flags:)();
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
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_1000892FC(v7, v9, location, length);

  swift_bridgeObjectRelease();
}

- (void)insertText:(id)a3
{
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v4;
  uint64_t v14 = 10;
  unint64_t v15 = 0xE100000000000000;
  uint64_t v12 = 32;
  unint64_t v13 = 0xE100000000000000;
  unint64_t v5 = sub_100014344();
  v6 = self;
  unint64_t v9 = v5;
  unint64_t v10 = v5;
  unint64_t v8 = v5;
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for CanvasMomentsTitleView();
  -[CanvasMomentsTitleView insertText:](&v11, "insertText:", v7, &type metadata for String, v8, v9, v10);

  swift_bridgeObjectRelease();
}

- (id)_accessibilityResponderElement
{
  v2 = self;
  sub_10008953C(v11);

  uint64_t v3 = v12;
  if (v12)
  {
    uint64_t v4 = sub_10002E0BC(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = __chkstk_darwin(v4);
    unint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    unint64_t v9 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v11);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  __n128 v6 = self;
  sub_100089CF4(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end