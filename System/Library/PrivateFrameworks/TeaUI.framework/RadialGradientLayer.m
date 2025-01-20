@interface RadialGradientLayer
- (_TtC5TeaUI19RadialGradientLayer)init;
- (_TtC5TeaUI19RadialGradientLayer)initWithCoder:(id)a3;
- (_TtC5TeaUI19RadialGradientLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation RadialGradientLayer

- (_TtC5TeaUI19RadialGradientLayer)init
{
  return (_TtC5TeaUI19RadialGradientLayer *)RadialGradientLayer.init()();
}

- (_TtC5TeaUI19RadialGradientLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B61B3030();
  swift_unknownObjectRelease();
  return (_TtC5TeaUI19RadialGradientLayer *)RadialGradientLayer.init(layer:)(v4);
}

- (_TtC5TeaUI19RadialGradientLayer)initWithCoder:(id)a3
{
  return (_TtC5TeaUI19RadialGradientLayer *)RadialGradientLayer.init(coder:)(a3);
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  RadialGradientLayer.draw(in:)(v4);
}

- (void).cxx_destruct
{
}

@end