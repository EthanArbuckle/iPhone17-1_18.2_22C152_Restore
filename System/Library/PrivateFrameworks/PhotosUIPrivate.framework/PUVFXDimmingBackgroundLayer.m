@interface PUVFXDimmingBackgroundLayer
- (BOOL)isDimmed;
- (BOOL)isThrottled;
- (CGImage)backgroundMask;
- (CGImage)foregroundMask;
- (CGImage)sourceImage;
- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)init;
- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)initWithLayer:(id)a3;
- (void)initialScan;
- (void)layoutSublayers;
- (void)resetMask;
- (void)scanFrom:(CGPoint)a3;
- (void)setBackgroundImage:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6;
- (void)setBackgroundMask:(CGImage *)a3;
- (void)setBlendImages:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6;
- (void)setForegroundImage:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6;
- (void)setForegroundMask:(CGImage *)a3;
- (void)setIsDimmed:(BOOL)a3;
- (void)setIsThrottled:(BOOL)a3;
- (void)setSourceImage:(CGImage *)a3;
@end

@implementation PUVFXDimmingBackgroundLayer

- (BOOL)isThrottled
{
  return sub_1AEB6AAA4() & 1;
}

- (void)setIsThrottled:(BOOL)a3
{
  v4 = self;
  sub_1AEB6AB08(a3);
}

- (BOOL)isDimmed
{
  return sub_1AEB6AD1C() & 1;
}

- (void)setIsDimmed:(BOOL)a3
{
  v4 = self;
  sub_1AEB6ADA4(a3);
}

- (CGImage)foregroundMask
{
  v2 = sub_1AEB6AF08();
  return (CGImage *)v2;
}

- (void)setForegroundMask:(CGImage *)a3
{
  v5 = a3;
  v6 = self;
  sub_1AEB6AFA0(a3);
}

- (CGImage)backgroundMask
{
  v2 = sub_1AEB6B224();
  return (CGImage *)v2;
}

- (void)setBackgroundMask:(CGImage *)a3
{
  v5 = a3;
  v6 = self;
  sub_1AEB6B2BC(a3);
}

- (CGImage)sourceImage
{
  v2 = sub_1AEB6B5E8();
  return (CGImage *)v2;
}

- (void)setSourceImage:(CGImage *)a3
{
  v5 = a3;
  v6 = self;
  sub_1AEB6B680(a3);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1AEB6B928();
}

- (void)resetMask
{
  v2 = self;
  sub_1AEB6BDA0();
}

- (void)setBlendImages:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6
{
  uint64_t v7 = *(void *)&a5;
  sub_1AEA0826C(0, &qword_1E9A9E850);
  unint64_t v10 = sub_1AEF96F70();
  id v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1AEB6BE70(v10, v11, v7, v12);

  swift_bridgeObjectRelease();
}

- (void)setForegroundImage:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1AEB6BF9C(v10, v11, v7, (uint64_t)v12);
}

- (void)setBackgroundImage:(id)a3 ctx:(id)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1AEB6C348(v10, v11, v7, (uint64_t)v12);
}

- (void)scanFrom:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_1AEB6CAD8(x, y);
}

- (void)initialScan
{
  v2 = self;
  sub_1AEB6CC48();
}

- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)init
{
  return (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer *)PUVFXDimmingBackgroundLayer.init()();
}

- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)initWithLayer:(id)a3
{
  return (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer *)sub_1AEB6E828((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))PUVFXDimmingBackgroundLayer.init(layer:));
}

- (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer)initWithCoder:(id)a3
{
  return (_TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer *)PUVFXDimmingBackgroundLayer.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer____lazy_storage___foregroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer____lazy_storage___backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_foregroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer____lazy_storage___dimmingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_backgroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer____lazy_storage___sourceImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_sourceImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_scannerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_currentBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27PUVFXDimmingBackgroundLayer_blendAnimation));
  swift_bridgeObjectRelease();
}

@end