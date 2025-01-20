@interface StepperTableViewCell
- (_TtC5TeaUI20StepperTableViewCell)initWithCoder:(id)a3;
- (_TtC5TeaUI20StepperTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)valueChanged;
@end

@implementation StepperTableViewCell

- (_TtC5TeaUI20StepperTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC5TeaUI20StepperTableViewCell *)sub_1B614CBE8(a3, (uint64_t)a4, v6);
}

- (_TtC5TeaUI20StepperTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B614D23C();
}

- (void)valueChanged
{
  v2 = self;
  sub_1B614D32C();
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI20StepperTableViewCell_onChange));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI20StepperTableViewCell_valueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI20StepperTableViewCell_stepper);
}

@end