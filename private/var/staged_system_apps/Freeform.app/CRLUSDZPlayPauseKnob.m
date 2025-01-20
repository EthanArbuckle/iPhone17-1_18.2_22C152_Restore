@interface CRLUSDZPlayPauseKnob
- (BOOL)isPlaying;
- (CRLImage)knobImage;
- (_TtC8Freeform20CRLUSDZPlayPauseKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (id)createKnobRenderable;
- (void)setIsPlaying:(BOOL)a3;
- (void)updateHitRegionPath;
@end

@implementation CRLUSDZPlayPauseKnob

- (BOOL)isPlaying
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_isPlaying) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_10066E87C();
  }
}

- (CRLImage)knobImage
{
  v2 = (void *)sub_10066EF48();

  return (CRLImage *)v2;
}

- (void)updateHitRegionPath
{
  v2 = self;
  sub_10066E58C();
}

- (id)createKnobRenderable
{
  v2 = self;
  id v3 = sub_10066E6A8();

  return v3;
}

- (_TtC8Freeform20CRLUSDZPlayPauseKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v7 = a7;
  result = (_TtC8Freeform20CRLUSDZPlayPauseKnob *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLUSDZPlayPauseKnob_imageRenderable);
}

@end