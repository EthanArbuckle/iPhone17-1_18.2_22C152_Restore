@interface NearbyPeerPaymentButtonsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)init;
- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithCoder:(id)a3;
- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithFrame:(CGRect)a3;
- (void)closeTapped;
- (void)layoutSubviews;
- (void)primaryTapped;
- (void)secondaryTapped;
@end

@implementation NearbyPeerPaymentButtonsView

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)init
{
  return (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)sub_19F7C5CA0();
}

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)sub_19F7C5E18(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F7C7114();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_19F7C753C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)closeTapped
{
}

- (void)primaryTapped
{
}

- (void)secondaryTapped
{
}

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F7C85FC((uint64_t)self + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_style, type metadata accessor for NearbyPeerPaymentButtonsView.Style);
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_closeAction));
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_primaryAction));
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_secondaryAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_singleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_primaryButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_secondaryButton);
}

@end