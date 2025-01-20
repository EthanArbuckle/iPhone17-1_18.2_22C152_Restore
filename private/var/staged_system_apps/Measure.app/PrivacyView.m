@interface PrivacyView
- (_TtC7Measure11PrivacyView)initWithCoder:(id)a3;
- (_TtC7Measure11PrivacyView)initWithFrame:(CGRect)a3;
@end

@implementation PrivacyView

- (_TtC7Measure11PrivacyView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure11PrivacyView *)sub_10015A188(a3.origin.x, a3.origin.y);
}

- (_TtC7Measure11PrivacyView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11PrivacyView_blurred) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11PrivacyView_visualEffectView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11PrivacyView_blurEffectAnimation) = 0;
  id v4 = a3;

  result = (_TtC7Measure11PrivacyView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11PrivacyView_blurEffectAnimation);
}

@end