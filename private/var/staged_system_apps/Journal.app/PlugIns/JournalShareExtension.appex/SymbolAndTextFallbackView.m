@interface SymbolAndTextFallbackView
- (_TtC21JournalShareExtension25SymbolAndTextFallbackView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension25SymbolAndTextFallbackView)initWithFrame:(CGRect)a3;
@end

@implementation SymbolAndTextFallbackView

- (_TtC21JournalShareExtension25SymbolAndTextFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC21JournalShareExtension25SymbolAndTextFallbackView *)sub_10007D4BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21JournalShareExtension25SymbolAndTextFallbackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10007FB78();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension25SymbolAndTextFallbackView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension25SymbolAndTextFallbackView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension25SymbolAndTextFallbackView_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension25SymbolAndTextFallbackView_titleStack));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end