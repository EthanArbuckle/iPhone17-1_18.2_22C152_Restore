@interface SymbolAndPlatterFallbackView
- (_TtC7Journal28SymbolAndPlatterFallbackView)initWithCoder:(id)a3;
- (_TtC7Journal28SymbolAndPlatterFallbackView)initWithFrame:(CGRect)a3;
@end

@implementation SymbolAndPlatterFallbackView

- (_TtC7Journal28SymbolAndPlatterFallbackView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal28SymbolAndPlatterFallbackView *)sub_1005CB810();
}

- (_TtC7Journal28SymbolAndPlatterFallbackView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal28SymbolAndPlatterFallbackView_platterView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC7Journal28SymbolAndPlatterFallbackView_platterLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UILabel) init];
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7Journal28SymbolAndPlatterFallbackView_platterText);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC7Journal28SymbolAndPlatterFallbackView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28SymbolAndPlatterFallbackView_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28SymbolAndPlatterFallbackView_platterLabel));

  swift_bridgeObjectRelease();
}

@end