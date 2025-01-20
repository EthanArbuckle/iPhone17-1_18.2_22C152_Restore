@interface STEyeReliefMicaView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithCoder:(id)a3;
- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithFrame:(CGRect)a3;
- (id)makeCAPackage;
- (void)layoutSubviews;
@end

@implementation STEyeReliefMicaView

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithFrame:(CGRect)a3
{
  return (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView *)STEyeReliefMicaView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_225C013C0();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STEyeReliefMicaView();
  id v2 = v3.receiver;
  [(STEyeReliefMicaView *)&v3 layoutSubviews];
  sub_225C007EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v8.size.double height = a3.height;
  v8.size.double width = a3.width;
  *(void *)&v6.size.double width = *(Class *)((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC20ScreenTimeSettingsUI19STEyeReliefMicaView_originalSize);
  v6.size.double height = *(CGFloat *)((char *)&self->super.super.super._responderFlags
                              + OBJC_IVAR____TtC20ScreenTimeSettingsUI19STEyeReliefMicaView_originalSize);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  CGRect v7 = CGRectIntersection(v6, v8);
  double width = v7.size.width;
  double height = v7.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)makeCAPackage
{
  id v2 = self;
  objc_super v3 = (void *)sub_225C00A88();

  return v3;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end