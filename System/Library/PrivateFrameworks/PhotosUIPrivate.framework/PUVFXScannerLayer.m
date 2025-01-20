@interface PUVFXScannerLayer
- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)init;
- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)initWithLayer:(id)a3;
- (void)animateFrom:(CGPoint)a3;
- (void)layoutSublayers;
@end

@implementation PUVFXScannerLayer

- (void)animateFrom:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  sub_1AEB6D960(x, y);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1AEB6E09C();
}

- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)init
{
  PUVFXScannerLayer.init()();
  return result;
}

- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)initWithLayer:(id)a3
{
  return (_TtC15PhotosUIPrivate17PUVFXScannerLayer *)sub_1AEB6E828((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))PUVFXScannerLayer.init(layer:));
}

- (_TtC15PhotosUIPrivate17PUVFXScannerLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  PUVFXScannerLayer.init(coder:)();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate17PUVFXScannerLayer____lazy_storage___pathLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate17PUVFXScannerLayer____lazy_storage___replicatorLayer));
  swift_bridgeObjectRelease();
}

@end