@interface StockActivityItemsConfiguration
- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithItemProviders:(id)a3;
- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithObjects:(id)a3;
@end

@implementation StockActivityItemsConfiguration

- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithObjects:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_20A4D42C0(0, &qword_26763B7E8);
  sub_20A8CE5E0();
  v5 = (void *)sub_20A8CE5D0();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(StockActivityItemsConfiguration *)&v8 initWithObjects:v5];

  return v6;
}

- (_TtC8StocksUI31StockActivityItemsConfiguration)initWithItemProviders:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_20A519C88();
  sub_20A8CE5E0();
  v5 = (void *)sub_20A8CE5D0();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(StockActivityItemsConfiguration *)&v8 initWithItemProviders:v5];

  return v6;
}

@end