@interface AdBackgroundView
- (_TtC8AppStore16AdBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore16AdBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation AdBackgroundView

- (_TtC8AppStore16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16AdBackgroundView *)sub_10053D418(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16AdBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16AdBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC8AppStore16AdBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end