@interface CRLUSDZRotationKnob
- (CRLImage)knobImage;
- (_TtC8Freeform19CRLUSDZRotationKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (id)createKnobRenderable;
- (void)updateHitRegionPath;
@end

@implementation CRLUSDZRotationKnob

- (CRLImage)knobImage
{
  v2 = (void *)sub_100E38A44();

  return (CRLImage *)v2;
}

- (id)createKnobRenderable
{
  v2 = self;
  id v3 = sub_100E3832C();

  return v3;
}

- (void)updateHitRegionPath
{
  v2 = self;
  sub_10066E58C();
}

- (_TtC8Freeform19CRLUSDZRotationKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v7 = a7;
  result = (_TtC8Freeform19CRLUSDZRotationKnob *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLUSDZRotationKnob_imageRenderable);
}

@end