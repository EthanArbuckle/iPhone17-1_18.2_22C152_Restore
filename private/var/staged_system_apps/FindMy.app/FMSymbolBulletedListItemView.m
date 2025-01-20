@interface FMSymbolBulletedListItemView
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithCoder:(id)a3;
- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithFrame:(CGRect)a3;
@end

@implementation FMSymbolBulletedListItemView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_titleLabel) firstBaselineAnchor];

  return (NSLayoutYAxisAnchor *)v2;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_subtitleLabel) lastBaselineAnchor];

  return (NSLayoutYAxisAnchor *)v2;
}

- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028E764();
}

- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy28FMSymbolBulletedListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_imageViewContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_verticalStackView);
}

@end