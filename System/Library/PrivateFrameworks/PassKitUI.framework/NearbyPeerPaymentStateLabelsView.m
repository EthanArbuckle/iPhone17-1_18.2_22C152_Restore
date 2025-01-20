@interface NearbyPeerPaymentStateLabelsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)init;
- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithCoder:(id)a3;
- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentStateLabelsView

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)init
{
  uint64_t v3 = OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel;
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for NearbyPeerPaymentStateLabelsView();
  v7 = -[NearbyPeerPaymentStateLabelsView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_19FCEFF88();

  return v7;
}

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *)sub_19FCEFE90(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FCF01DC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel);
  uint64_t v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v8 = v7;
  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel), sel_sizeThatFits_, width, height);
  double v10 = v9;
  if (qword_1E949DA30 != -1) {
    swift_once();
  }
  double v11 = v8 + v10;
  double v12 = *(double *)&qword_1E94B7680;

  double v13 = v11 + v12;
  double v14 = width;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel);
}

@end