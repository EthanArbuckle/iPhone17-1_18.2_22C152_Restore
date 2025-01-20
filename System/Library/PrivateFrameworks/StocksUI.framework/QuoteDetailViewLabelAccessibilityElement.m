@interface QuoteDetailViewLabelAccessibilityElement
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGRect)accessibilityFrame;
- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)init;
- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (void)accessibilityElementDidBecomeFocused;
- (void)setAccessibilityFrame:(CGRect)a3;
@end

@implementation QuoteDetailViewLabelAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = self;
  double v3 = sub_20A6C3344();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  -[QuoteDetailViewLabelAccessibilityElement setAccessibilityFrame:](&v7, sel_setAccessibilityFrame_, x, y, width, height);
}

- (void)accessibilityElementDidBecomeFocused
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(QuoteDetailViewLabelAccessibilityElement *)&v3 accessibilityElementDidBecomeFocused];
  if (MEMORY[0x2105289B0](&v2[OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate]))
  {
    sub_20A5B3BEC(v2);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = MEMORY[0x2105289B0]((char *)self + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate);
  objc_super v7 = self;
  double v8 = v7;
  if (v6 && (unsigned __int8 v9 = sub_20A5B3E2C((uint64_t)v7, a3), swift_unknownObjectRelease(), (v9 & 1) != 0))
  {

    return 1;
  }
  else
  {
    v12.receiver = v8;
    v12.super_class = ObjectType;
    BOOL v10 = [(QuoteDetailViewLabelAccessibilityElement *)&v12 accessibilityScroll:a3];
  }
  return v10;
}

- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_20A8CF270();
  swift_unknownObjectRelease();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_20A8CF740();
  v8.receiver = self;
  v8.super_class = ObjectType;
  uint64_t v6 = [(QuoteDetailViewLabelAccessibilityElement *)&v8 initWithAccessibilityContainer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(QuoteDetailViewLabelAccessibilityElement *)&v5 init];
}

- (void).cxx_destruct
{
  sub_20A4380C4((uint64_t)self + OBJC_IVAR____TtC8StocksUI40QuoteDetailViewLabelAccessibilityElement_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end