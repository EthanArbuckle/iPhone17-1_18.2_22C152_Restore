@interface LiveButton
- (_TtC10StickersUI10LiveButton)init;
- (_TtC10StickersUI10LiveButton)initWithCoder:(id)a3;
- (_TtC10StickersUI10LiveButton)initWithFrame:(CGRect)a3;
@end

@implementation LiveButton

- (_TtC10StickersUI10LiveButton)init
{
  return (_TtC10StickersUI10LiveButton *)LiveButton.init()();
}

- (_TtC10StickersUI10LiveButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC10StickersUI10LiveButton_isLive) = 0;
  id v4 = a3;

  result = (_TtC10StickersUI10LiveButton *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

- (_TtC10StickersUI10LiveButton)initWithFrame:(CGRect)a3
{
  result = (_TtC10StickersUI10LiveButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end