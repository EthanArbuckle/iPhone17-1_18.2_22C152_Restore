@interface SymbolAndTextFallbackView
- (_TtC7Journal25SymbolAndTextFallbackView)initWithCoder:(id)a3;
- (_TtC7Journal25SymbolAndTextFallbackView)initWithFrame:(CGRect)a3;
@end

@implementation SymbolAndTextFallbackView

- (_TtC7Journal25SymbolAndTextFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal25SymbolAndTextFallbackView *)sub_100110C40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal25SymbolAndTextFallbackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001132BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25SymbolAndTextFallbackView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25SymbolAndTextFallbackView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25SymbolAndTextFallbackView_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25SymbolAndTextFallbackView_titleStack));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end