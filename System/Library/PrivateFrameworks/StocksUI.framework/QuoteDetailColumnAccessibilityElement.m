@interface QuoteDetailColumnAccessibilityElement
- (NSArray)accessibilityElements;
- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)init;
- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation QuoteDetailColumnAccessibilityElement

- (NSArray)accessibilityElements
{
  v2 = self;
  id v3 = sub_20A5F8E40();

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

- (void)setAccessibilityElements:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_20A8CE5E0();
    v6 = self;
    a3 = (id)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(QuoteDetailColumnAccessibilityElement *)&v8 setAccessibilityElements:a3];
}

- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_20A8CF270();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = sub_20A8CF740();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(QuoteDetailColumnAccessibilityElement *)&v8 initWithAccessibilityContainer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8StocksUI37QuoteDetailColumnAccessibilityElement)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(QuoteDetailColumnAccessibilityElement *)&v3 init];
}

@end