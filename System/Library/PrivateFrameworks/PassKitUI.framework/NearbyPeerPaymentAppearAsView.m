@interface NearbyPeerPaymentAppearAsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithCoder:(id)a3;
- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentAppearAsView

- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F77EB88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F77DEFC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_19F77E4D8(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_avatarController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_appearAsLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_nameLabel);
}

@end