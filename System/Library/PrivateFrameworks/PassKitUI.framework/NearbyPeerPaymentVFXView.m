@interface NearbyPeerPaymentVFXView
+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess;
- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithCoder:(id)a3;
- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3;
- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3 options:(id)a4;
@end

@implementation NearbyPeerPaymentVFXView

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 0;
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    sub_1A03B47F8();
    v9 = (void *)sub_1A03B47E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  v10 = -[NearbyPeerPaymentVFXView initWithFrame:options:](&v12, sel_initWithFrame_options_, v9, x, y, width, height);

  return v10;
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  return -[NearbyPeerPaymentVFXView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  return [(NearbyPeerPaymentVFXView *)&v5 initWithCoder:a3];
}

@end