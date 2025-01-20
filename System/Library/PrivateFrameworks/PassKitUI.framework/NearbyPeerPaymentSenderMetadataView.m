@interface NearbyPeerPaymentSenderMetadataView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)init;
- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithCoder:(id)a3;
- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentSenderMetadataView

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)init
{
  return (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView *)sub_19F684678();
}

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F6850E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F684A88();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_19F684DEC(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_avatarController));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_image);
}

@end