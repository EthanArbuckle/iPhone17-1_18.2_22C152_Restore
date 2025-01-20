@interface _UILatencyLightView
- (_TtC5UIKit19_UILatencyLightView)initWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)updateMasking;
@end

@implementation _UILatencyLightView

- (_TtC5UIKit19_UILatencyLightView)initWithCoder:(id)a3
{
  result = (_TtC5UIKit19_UILatencyLightView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185914624();
}

- (void)updateMasking
{
  v2 = self;
  sub_1859148F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit19_UILatencyLightView_emitterMaskView));
}

@end