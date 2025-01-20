@interface NearbyPeerPaymentAppearancePreferencesHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithCoder:(id)a3;
- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithFrame:(CGRect)a3;
- (void)closeTapped;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentAppearancePreferencesHeaderView

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F92898C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F920594();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_titleLabel);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v8 = v7;
  if (qword_1E949D7F8 != -1) {
    swift_once();
  }
  double v9 = *(double *)&qword_1E94ABCE8;
  if (qword_1E949D7F0 != -1) {
    swift_once();
  }
  double v10 = v8 + v9 + v9;
  double v11 = *(double *)&qword_1E94ABCE0;

  if (v10 > v11) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  double v13 = width;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)closeTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_19F48BAB4((uint64_t)v2);
    v2(v3);
    sub_19F48BB68((uint64_t)v2);
  }
}

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeAction);

  sub_19F48BB68(v3);
}

@end