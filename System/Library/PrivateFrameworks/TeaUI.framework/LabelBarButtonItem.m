@interface LabelBarButtonItem
- (_TtC5TeaUI18LabelBarButtonItem)init;
- (_TtC5TeaUI18LabelBarButtonItem)initWithCoder:(id)a3;
@end

@implementation LabelBarButtonItem

- (_TtC5TeaUI18LabelBarButtonItem)init
{
  return (_TtC5TeaUI18LabelBarButtonItem *)LabelBarButtonItem.init()();
}

- (_TtC5TeaUI18LabelBarButtonItem)initWithCoder:(id)a3
{
  id v3 = a3;
  LabelBarButtonItem.init(coder:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI18LabelBarButtonItem_label);
}

@end