@interface _UIIntelligenceNoisyLightView
+ (Class)layerClass;
- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithCoder:(id)a3;
- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithFrame:(CGRect)a3;
- (void)_layerCornerCurveDidChange:(id)a3;
- (void)_layerCornerRadiusDidChange:(double)a3;
- (void)_layerMaskedCornersDidChange:(unint64_t)a3;
- (void)layoutSubviews;
@end

@implementation _UIIntelligenceNoisyLightView

+ (Class)layerClass
{
  sub_185A79370();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UIView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  swift_getKeyPath();
  sub_185A78C74();

  swift_release();
}

- (void)_layerCornerRadiusDidChange:(double)a3
{
  swift_getKeyPath();
  v4 = self;
  sub_185A78D2C();

  swift_release();
}

- (void)_layerCornerCurveDidChange:(id)a3
{
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  sub_185A78DC8(v5);

  swift_release();
}

- (void)_layerMaskedCornersDidChange:(unint64_t)a3
{
  swift_getKeyPath();
  v4 = self;
  sub_185A78E5C();

  swift_release();
}

- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit29_UIIntelligenceNoisyLightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit29_UIIntelligenceNoisyLightView_noiseView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit29_UIIntelligenceNoisyLightView_lightView);
}

@end