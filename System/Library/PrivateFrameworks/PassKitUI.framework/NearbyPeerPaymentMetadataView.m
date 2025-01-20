@interface NearbyPeerPaymentMetadataView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)init;
- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithCoder:(id)a3;
- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentMetadataView

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)init
{
  uint64_t v3 = OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_memoLabel;
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_senderMetadataView;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentSenderMetadataView()), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for NearbyPeerPaymentMetadataView();
  v7 = -[NearbyPeerPaymentMetadataView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_19F683B78();

  return v7;
}

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI29NearbyPeerPaymentMetadataView *)sub_19F683A84(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F683C58();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_19F683FD8(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_memoLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_senderMetadataView);
}

@end