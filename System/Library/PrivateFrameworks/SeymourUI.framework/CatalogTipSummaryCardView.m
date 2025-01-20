@interface CatalogTipSummaryCardView
- (_TtC9SeymourUI25CatalogTipSummaryCardView)init;
- (_TtC9SeymourUI25CatalogTipSummaryCardView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25CatalogTipSummaryCardView)initWithFrame:(CGRect)a3;
@end

@implementation CatalogTipSummaryCardView

- (_TtC9SeymourUI25CatalogTipSummaryCardView)init
{
  return (_TtC9SeymourUI25CatalogTipSummaryCardView *)sub_23A371CF8();
}

- (_TtC9SeymourUI25CatalogTipSummaryCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A372BFC();
}

- (_TtC9SeymourUI25CatalogTipSummaryCardView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI25CatalogTipSummaryCardView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25CatalogTipSummaryCardView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25CatalogTipSummaryCardView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25CatalogTipSummaryCardView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI25CatalogTipSummaryCardView_descriptionLabel);
}

@end