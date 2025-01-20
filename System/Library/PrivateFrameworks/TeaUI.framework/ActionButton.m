@interface ActionButton
- (_TtC5TeaUI12ActionButton)init;
- (_TtC5TeaUI12ActionButton)initWithCoder:(id)a3;
- (_TtC5TeaUI12ActionButton)initWithFrame:(CGRect)a3;
@end

@implementation ActionButton

- (_TtC5TeaUI12ActionButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12ActionButton *)ActionButton.init(frame:)();
}

- (_TtC5TeaUI12ActionButton)init
{
  return (_TtC5TeaUI12ActionButton *)sub_1B601B88C();
}

- (_TtC5TeaUI12ActionButton)initWithCoder:(id)a3
{
  id v3 = a3;
  ActionButton.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI12ActionButton_onTap));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI12ActionButton_onMenuPresentation);
}

@end