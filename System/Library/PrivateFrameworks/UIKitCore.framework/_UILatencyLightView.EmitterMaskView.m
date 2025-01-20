@interface _UILatencyLightView.EmitterMaskView
+ (Class)layerClass;
- (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView)initWithCoder:(id)a3;
- (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _UILatencyLightView.EmitterMaskView

+ (Class)layerClass
{
  sub_1853B985C(0, &qword_1E8FB2608);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView_emitterCell;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39BA8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1859157E0();
}

- (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView)initWithFrame:(CGRect)a3
{
  result = (_TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit19_UILatencyLightViewP33_EC16FCD6D726BF32B6086EE652C76F4615EmitterMaskView_emitterCell));
}

@end