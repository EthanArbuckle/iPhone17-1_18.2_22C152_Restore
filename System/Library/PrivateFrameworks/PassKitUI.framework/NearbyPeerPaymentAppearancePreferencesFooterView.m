@interface NearbyPeerPaymentAppearancePreferencesFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithCoder:(id)a3;
- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NearbyPeerPaymentAppearancePreferencesFooterView

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19F920CFC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v4 = qword_1E949D810;
  uint64_t v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label), sel_sizeThatFits_, width - (*(double *)&qword_1E94ABD00 + *(double *)&qword_1E94ABD00), 1.79769313e308);
  double v7 = v6;
  double v9 = v8;
  if (qword_1E949D808 != -1) {
    swift_once();
  }
  double v10 = *(double *)&qword_1E94ABCF8;

  double v11 = v9 + v10 + v10;
  double v12 = v7;
  result.height = v11;
  result.double width = v12;
  return result;
}

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label));
}

@end