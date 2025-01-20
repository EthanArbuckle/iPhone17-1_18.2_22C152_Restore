@interface ImageViewLayer
- (CGColor)shadowColor;
- (CGSize)shadowOffset;
- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)init;
- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithCoder:(id)a3;
- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithLayer:(id)a3;
- (const)shadowPath;
- (double)cornerRadius;
- (double)shadowRadius;
- (float)shadowOpacity;
- (unint64_t)maskedCorners;
- (void)setCornerRadius:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setShadowColor:(CGColor *)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(float)a3;
- (void)setShadowPath:(const CGPath *)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation ImageViewLayer

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithCoder:(id)a3
{
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B5F92258(a3);
}

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B61B3030();
  swift_unknownObjectRelease();
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B5F922E0(v4);
}

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)init
{
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B5F923C4();
}

- (double)cornerRadius
{
  v2 = self;
  sub_1B5F92B90();
  double v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  double v4 = self;
  sub_1B5F924C8(a3);
}

- (unint64_t)maskedCorners
{
  v2 = self;
  id v3 = sub_1B5F925C0();

  return (unint64_t)v3;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  double v4 = self;
  sub_1B5F9264C(a3);
}

- (const)shadowPath
{
  v2 = self;
  id v3 = sub_1B5F92A50();

  return (const CGPath *)v3;
}

- (void)setShadowPath:(const CGPath *)a3
{
  v5 = a3;
  v6 = self;
  sub_1B5F92B00(a3);
}

- (CGSize)shadowOffset
{
  v2 = self;
  sub_1B5F92808();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_1B5F928A0(width, height);
}

- (float)shadowOpacity
{
  v2 = self;
  sub_1B5F9292C();
  float v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(float)a3
{
  float v4 = self;
  sub_1B5F929BC(a3);
}

- (CGColor)shadowColor
{
  v2 = self;
  id v3 = sub_1B5F92A50();

  return (CGColor *)v3;
}

- (void)setShadowColor:(CGColor *)a3
{
  double v5 = a3;
  double v6 = self;
  sub_1B5F92B00(a3);
}

- (double)shadowRadius
{
  v2 = self;
  sub_1B5F92B90();
  double v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  double v4 = self;
  sub_1B5F92C20(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer_coordinateWithLayer));
}

@end