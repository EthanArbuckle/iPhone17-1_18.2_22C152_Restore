@interface SwitchTableViewCell
- (_TtC5TeaUI19SwitchTableViewCell)initWithCoder:(id)a3;
- (_TtC5TeaUI19SwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)valueChanged;
@end

@implementation SwitchTableViewCell

- (_TtC5TeaUI19SwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return (_TtC5TeaUI19SwitchTableViewCell *)sub_1B60AECD4(v4, v4, v6);
}

- (_TtC5TeaUI19SwitchTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B60AEE64();
}

- (void)valueChanged
{
  v2 = self;
  sub_1B60AEF28();
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI19SwitchTableViewCell_onChange));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI19SwitchTableViewCell_switchControl);
}

@end