@interface StockView.PriceChangeButton
- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithCoder:(id)a3;
- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithFrame:(CGRect)a3;
@end

@implementation StockView.PriceChangeButton

- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap;
  sub_20A74A660(0, (unint64_t *)&qword_26AC6AAE8, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F7E048]);
  id v10 = objc_allocWithZone(v9);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for StockView.PriceChangeButton();
  return -[StockView.PriceChangeButton initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC8StocksUI9StockView17PriceChangeButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap;
  sub_20A74A660(0, (unint64_t *)&qword_26AC6AAE8, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F7E048]);
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  Class v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for StockView.PriceChangeButton();
  id v10 = [(StockView.PriceChangeButton *)&v12 initWithCoder:v8];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8StocksUI9StockView17PriceChangeButton_onTap));
}

@end