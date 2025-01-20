@interface StockFeedViewOverlayView
- (_TtC8StocksUI24StockFeedViewOverlayView)initWithCoder:(id)a3;
- (_TtC8StocksUI24StockFeedViewOverlayView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation StockFeedViewOverlayView

- (_TtC8StocksUI24StockFeedViewOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI24StockFeedViewOverlayView *)sub_20A8B99F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI24StockFeedViewOverlayView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onTap;
  sub_20A49A408(0, (unint64_t *)&qword_26AC6AAE8, MEMORY[0x263F7E048]);
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC8StocksUI24StockFeedViewOverlayView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_20A8B9CE0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI24StockFeedViewOverlayView_onHitTest);

  sub_20A459CA4(v3);
}

@end