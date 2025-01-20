@interface StockSearchCellView
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (_TtC8StocksUI19StockSearchCellView)initWithCoder:(id)a3;
- (_TtC8StocksUI19StockSearchCellView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation StockSearchCellView

- (_TtC8StocksUI19StockSearchCellView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI19StockSearchCellView *)sub_20A7401B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI19StockSearchCellView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A741614();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_exchangeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_priceChangeLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI19StockSearchCellView_watchlistSelectionButton);
}

- (BOOL)isAccessibilityElement
{
  v2 = self;
  char v3 = sub_20A740898();

  return v3 & 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(StockSearchCellView *)&v4 setIsAccessibilityElement:v3];
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = sub_20A740A70();

  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(StockSearchCellView *)&v4 setAccessibilityTraits:a3];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (NSString)accessibilityHint
{
  type metadata accessor for Localized();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  objc_super v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_20A8C2370();

  v7 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_20A740D6C();

  if (v3)
  {
    sub_20A42CFF0(0, &qword_26AC83118);
    objc_super v4 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_20A42CFF0(0, &qword_26AC83118);
    sub_20A8CE5E0();
    id v6 = self;
    a3 = (id)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(StockSearchCellView *)&v8 setAccessibilityCustomActions:a3];
}

@end