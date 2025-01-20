@interface ICQBubbleBannerView
- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithCoder:(id)a3;
- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithFrame:(CGRect)a3;
- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithOffer:(id)a3 bannerSpecification:(id)a4;
- (_TtP13iCloudQuotaUI27ICQBubbleBannerViewDelegate_)delegate;
- (void)setDelegate:(id)a3;
- (void)updateBannerView;
@end

@implementation ICQBubbleBannerView

- (_TtP13iCloudQuotaUI27ICQBubbleBannerViewDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F711D0](v2);
  return (_TtP13iCloudQuotaUI27ICQBubbleBannerViewDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithOffer:(id)a3 bannerSpecification:(id)a4
{
  return (_TtC13iCloudQuotaUI19ICQBubbleBannerView *)ICQBubbleBannerView.init(offer:bannerSpecification:)(a3, a4);
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_actionButtons) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  swift_unknownObjectWeakInit();
  v5 = self;
  swift_bridgeObjectRelease();
  sub_22C98D6D4((uint64_t)v4);

  type metadata accessor for ICQBubbleBannerView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)updateBannerView
{
  v2 = self;
  sub_22C98C824();
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC13iCloudQuotaUI19ICQBubbleBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_subTitleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_closeButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_bannerSpecification));
  v3 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI19ICQBubbleBannerView_delegate;
  sub_22C98D6D4((uint64_t)v3);
}

@end