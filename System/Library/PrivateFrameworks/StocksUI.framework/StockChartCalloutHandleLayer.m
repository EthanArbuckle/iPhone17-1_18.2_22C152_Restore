@interface StockChartCalloutHandleLayer
- (_TtC8StocksUI28StockChartCalloutHandleLayer)init;
- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithCoder:(id)a3;
- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation StockChartCalloutHandleLayer

- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLocation) = 0;

  result = (_TtC8StocksUI28StockChartCalloutHandleLayer *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI28StockChartCalloutHandleLayer)init
{
  return (_TtC8StocksUI28StockChartCalloutHandleLayer *)sub_20A6DEDE0();
}

- (void)layoutSublayers
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(StockChartCalloutHandleLayer *)&v4 layoutSublayers];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLayer];
  objc_msgSend(v2, sel_frame, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setPosition_, CGRectGetWidth(v5) * 0.5, *(double *)&v2[OBJC_IVAR____TtC8StocksUI28StockChartCalloutHandleLayer_knobLocation]);
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (_TtC8StocksUI28StockChartCalloutHandleLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_20A8CF270();
  swift_unknownObjectRelease();
  result = (_TtC8StocksUI28StockChartCalloutHandleLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end