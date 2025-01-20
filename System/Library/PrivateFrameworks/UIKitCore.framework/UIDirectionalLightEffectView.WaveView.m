@interface UIDirectionalLightEffectView.WaveView
- (_TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView)initWithCoder:(id)a3;
- (_TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UIDirectionalLightEffectView.WaveView

- (_TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView)initWithFrame:(CGRect)a3
{
  return (_TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView *)sub_185904A04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18590692C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18590530C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_fillColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_clippingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_clippingMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_fillView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit28UIDirectionalLightEffectViewP33_FFDE3B7A64024E6DED98D26CC792816C8WaveView_fillTrailView);
}

@end