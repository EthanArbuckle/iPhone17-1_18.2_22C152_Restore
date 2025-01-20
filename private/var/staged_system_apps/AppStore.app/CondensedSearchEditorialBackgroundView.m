@interface CondensedSearchEditorialBackgroundView
- (_TtC8AppStore38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedSearchEditorialBackgroundView

- (_TtC8AppStore38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38CondensedSearchEditorialBackgroundView *)sub_1004E60A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore38CondensedSearchEditorialBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC8AppStore38CondensedSearchEditorialBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004E6320(a3);
}

@end