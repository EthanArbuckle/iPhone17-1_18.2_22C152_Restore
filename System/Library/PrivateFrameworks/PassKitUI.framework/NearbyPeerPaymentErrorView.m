@interface NearbyPeerPaymentErrorView
- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)init;
- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)initWithCoder:(id)a3;
- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentErrorView

- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)init
{
  return (_TtC9PassKitUI26NearbyPeerPaymentErrorView *)sub_19FCC8254();
}

- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI26NearbyPeerPaymentErrorView *)sub_19FCC83F0(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FCC896C();
}

- (_TtC9PassKitUI26NearbyPeerPaymentErrorView)initWithFrame:(CGRect)a3
{
  result = (_TtC9PassKitUI26NearbyPeerPaymentErrorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_buttonsView));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_delegate);
  sub_19F48B93C((uint64_t)self + OBJC_IVAR____TtC9PassKitUI26NearbyPeerPaymentErrorView_error, &qword_1E94A44A8);
}

@end