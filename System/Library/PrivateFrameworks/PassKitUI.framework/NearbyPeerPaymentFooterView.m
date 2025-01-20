@interface NearbyPeerPaymentFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithCoder:(id)a3;
- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentFooterView

- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_stateLabelsView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentStateLabelsView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_buttonsView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentButtonsView(0)), sel_init);

  result = (_TtC9PassKitUI27NearbyPeerPaymentFooterView *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FC1BF28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_19FC1C284(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9PassKitUI27NearbyPeerPaymentFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_stateLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_buttonsView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_appearAsView);
}

@end