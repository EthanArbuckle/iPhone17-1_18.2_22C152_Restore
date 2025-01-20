@interface BlockBarButtonItem
- (NSString)accessibilityLabel;
- (_TtC5TeaUI18BlockBarButtonItem)init;
- (_TtC5TeaUI18BlockBarButtonItem)initWithCoder:(id)a3;
- (void)barButtonItemPressedWithSender:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation BlockBarButtonItem

- (void)barButtonItemPressedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B6040008();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1B604015C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1B60402A0(v4, v6);
}

- (_TtC5TeaUI18BlockBarButtonItem)init
{
  return (_TtC5TeaUI18BlockBarButtonItem *)BlockBarButtonItem.init()();
}

- (_TtC5TeaUI18BlockBarButtonItem)initWithCoder:(id)a3
{
  return (_TtC5TeaUI18BlockBarButtonItem *)BlockBarButtonItem.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI18BlockBarButtonItem_actionHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI18BlockBarButtonItem_customContentView);
}

@end