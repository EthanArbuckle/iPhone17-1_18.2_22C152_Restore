@interface CatalogTipSummaryView
- (_TtC9SeymourUI21CatalogTipSummaryView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21CatalogTipSummaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)learnMoreButtonTapped;
- (void)seeMoreButtonTapped;
@end

@implementation CatalogTipSummaryView

- (_TtC9SeymourUI21CatalogTipSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A24F344();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A24D8D8();
}

- (void)learnMoreButtonTapped
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_presenter);
  v5 = self;
  sub_23A4ED7B8(0xD000000000000015, 0x800000023A85F250);
  id v3 = *(void (**)(uint64_t))(v2 + 32);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_239C25118((uint64_t)v3);
  }
}

- (void)seeMoreButtonTapped
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_presenter);
  v5 = self;
  sub_23A4ED7B8(0x5465726F4D656553, 0xEB00000000737069);
  id v3 = *(void (**)(uint64_t))(v2 + 48);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_239C25118((uint64_t)v3);
  }
}

- (_TtC9SeymourUI21CatalogTipSummaryView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI21CatalogTipSummaryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_buttonLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_summaryCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21CatalogTipSummaryView_seeMoreButton));

  swift_release();
}

@end