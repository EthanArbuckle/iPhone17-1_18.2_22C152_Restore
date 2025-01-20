@interface InstallPagePreInstallPaidOfferView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithCoder:(id)a3;
- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstallPagePreInstallPaidOfferView

- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34InstallPagePreInstallPaidOfferView *)sub_100785A38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100787064();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1007867B0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100786AD4();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_metrics;
  uint64_t v4 = type metadata accessor for InstallPagePreInstallPaidLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_inAppPurchaseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_messageLabel));
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_lockupView);
}

@end