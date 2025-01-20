@interface BlockQuoteLayerView
- (_TtC7Journal19BlockQuoteLayerView)initWithCoder:(id)a3;
- (_TtC7Journal19BlockQuoteLayerView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation BlockQuoteLayerView

- (_TtC7Journal19BlockQuoteLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19BlockQuoteLayerView *)sub_1002F64B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19BlockQuoteLayerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19BlockQuoteLayerView_quoteAreas) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19BlockQuoteLayerView_barInset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19BlockQuoteLayerView_topInset) = 0;
  id v4 = a3;

  result = (_TtC7Journal19BlockQuoteLayerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1002F695C(x, y, width, height);
}

- (void).cxx_destruct
{
}

@end