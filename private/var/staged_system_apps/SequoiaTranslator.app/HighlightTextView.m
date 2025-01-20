@interface HighlightTextView
- (_TtC17SequoiaTranslator17HighlightTextView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator17HighlightTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation HighlightTextView

- (_TtC17SequoiaTranslator17HighlightTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC17SequoiaTranslator17HighlightTextView *)sub_1000FC19C(a4, x, y, width, height);
}

- (_TtC17SequoiaTranslator17HighlightTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s17SequoiaTranslator17HighlightTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator17HighlightTextView_highlightColor);
}

@end