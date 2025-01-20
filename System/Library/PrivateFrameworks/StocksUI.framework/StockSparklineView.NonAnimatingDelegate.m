@interface StockSparklineView.NonAnimatingDelegate
- (_TtCC8StocksUI18StockSparklineViewP33_D110489D7989A286557923EB4206D59120NonAnimatingDelegate)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation StockSparklineView.NonAnimatingDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = objc_allocWithZone(MEMORY[0x263EFF9D0]);
  id v7 = a3;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_init);

  return v9;
}

- (_TtCC8StocksUI18StockSparklineViewP33_D110489D7989A286557923EB4206D59120NonAnimatingDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StockSparklineView.NonAnimatingDelegate();
  return [(StockSparklineView.NonAnimatingDelegate *)&v3 init];
}

@end