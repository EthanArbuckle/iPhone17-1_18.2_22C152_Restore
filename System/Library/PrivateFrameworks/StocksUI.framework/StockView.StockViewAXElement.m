@interface StockView.StockViewAXElement
- (CGRect)accessibilityFrame;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityUserInputLabels;
- (NSAttributedString)accessibilityAttributedLabel;
- (NSAttributedString)accessibilityAttributedValue;
- (_TtCC8StocksUI9StockView18StockViewAXElement)init;
- (_TtCC8StocksUI9StockView18StockViewAXElement)initWithAccessibilityContainer:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation StockView.StockViewAXElement

- (NSAttributedString)accessibilityAttributedValue
{
  uint64_t v3 = MEMORY[0x2105289B0]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    v6 = (void *)sub_20A74937C();
  }
  else
  {
    v6 = 0;
  }

  return (NSAttributedString *)v6;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = sub_20A748714();

  if (v3)
  {
    v4 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_20A748BB8();

  if (v3)
  {
    sub_20A42CFF0(0, &qword_26AC83118);
    v4 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = MEMORY[0x2105289B0]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_accessibilityFrame);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = 0.0;
    double v13 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = MEMORY[0x2105289B0]((char *)self + OBJC_IVAR____TtCC8StocksUI9StockView18StockViewAXElement_stockView, a2);
  if (!v3)
  {
    double v7 = self;
LABEL_6:
    double v6 = (unint64_t *)MEMORY[0x263F83288];
    v4 = self;
    goto LABEL_7;
  }
  v4 = (_TtCC8StocksUI9StockView18StockViewAXElement *)v3;
  v5 = (unsigned char *)(v3 + OBJC_IVAR____TtC8StocksUI9StockView_isSelected);
  swift_beginAccess();
  if ((*v5 & 1) == 0)
  {
    double v8 = self;

    goto LABEL_6;
  }
  double v6 = (unint64_t *)MEMORY[0x263F832A8];
LABEL_7:
  unint64_t v9 = *v6;

  return v9;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  v2 = self;
  uint64_t v3 = (void *)sub_20A748DD0();

  return (NSAttributedString *)v3;
}

- (_TtCC8StocksUI9StockView18StockViewAXElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_20A8CF270();
  swift_unknownObjectRelease();
  CGRect result = (_TtCC8StocksUI9StockView18StockViewAXElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC8StocksUI9StockView18StockViewAXElement)init
{
  CGRect result = (_TtCC8StocksUI9StockView18StockViewAXElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end