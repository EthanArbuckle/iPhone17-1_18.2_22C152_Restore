@interface FMSymbolBulletedListHeaderView
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (_TtC6FindMy30FMSymbolBulletedListHeaderView)init;
- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation FMSymbolBulletedListHeaderView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel) firstBaselineAnchor];

  return (NSLayoutYAxisAnchor *)v2;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView) bottomAnchor];

  return (NSLayoutYAxisAnchor *)v2;
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)init
{
  return (_TtC6FindMy30FMSymbolBulletedListHeaderView *)sub_100361040();
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIView) init];

  result = (_TtC6FindMy30FMSymbolBulletedListHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy30FMSymbolBulletedListHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView);
}

@end