@interface SearchUIBasicLayerAnimation
+ (id)blurFrom:(double)a3 to:(double)a4;
+ (id)horizontalScaleFrom:(double)a3 to:(double)a4;
+ (id)opacityFrom:(double)a3 to:(double)a4;
+ (id)scaleFrom:(double)a3 to:(double)a4;
+ (id)verticalScaleFrom:(double)a3 to:(double)a4;
- (_TtC8SearchUI27SearchUIBasicLayerAnimation)animationWith:(id)a3;
- (_TtC8SearchUI27SearchUIBasicLayerAnimation)init;
@end

@implementation SearchUIBasicLayerAnimation

+ (id)opacityFrom:(double)a3 to:(double)a4
{
  id v4 = _s8SearchUI0A21UIBasicLayerAnimationC7opacity4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(a3, a4);
  return v4;
}

+ (id)blurFrom:(double)a3 to:(double)a4
{
  id v4 = _s8SearchUI0A21UIBasicLayerAnimationC4blur4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(a3, a4);
  return v4;
}

+ (id)verticalScaleFrom:(double)a3 to:(double)a4
{
  id v4 = _s8SearchUI0A21UIBasicLayerAnimationC13verticalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(a3, a4);
  return v4;
}

+ (id)horizontalScaleFrom:(double)a3 to:(double)a4
{
  id v4 = _s8SearchUI0A21UIBasicLayerAnimationC15horizontalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(a3, a4);
  return v4;
}

+ (id)scaleFrom:(double)a3 to:(double)a4
{
  id v4 = _s8SearchUI0A21UIBasicLayerAnimationC5scale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(a3, a4);
  return v4;
}

- (_TtC8SearchUI27SearchUIBasicLayerAnimation)animationWith:(id)a3
{
  return (_TtC8SearchUI27SearchUIBasicLayerAnimation *)sub_1E46A0D54(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1E46A09D4);
}

- (_TtC8SearchUI27SearchUIBasicLayerAnimation)init
{
  result = (_TtC8SearchUI27SearchUIBasicLayerAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end