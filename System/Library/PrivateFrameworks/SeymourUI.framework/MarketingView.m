@interface MarketingView
- (UIImageView)logoImageView;
- (_TtC9SeymourUI13MarketingView)initWithCoder:(id)a3;
- (_TtC9SeymourUI13MarketingView)initWithFrame:(CGRect)a3;
- (void)actionItemButtonTapped:(id)a3;
- (void)dismissButtonTapped:(id)a3;
- (void)layoutSubviews;
@end

@implementation MarketingView

- (UIImageView)logoImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC9SeymourUI13MarketingView_logoImageView));
}

- (_TtC9SeymourUI13MarketingView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13MarketingView *)sub_23A47111C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13MarketingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A476A34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A471E9C();
}

- (void)actionItemButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A4739D8(v4);
}

- (void)dismissButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A476D70();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_delegate);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onElementAppearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onElementDisappearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onVisibleBoundsChange));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13MarketingView_onImpressionableBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13MarketingView_backgroundImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13MarketingView_supportingTextLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_offer, (uint64_t *)&unk_268A0E510);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13MarketingView_pendingOffer, (uint64_t *)&unk_268A0E510);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13MarketingView_lastTappedActionItemButton);
}

@end