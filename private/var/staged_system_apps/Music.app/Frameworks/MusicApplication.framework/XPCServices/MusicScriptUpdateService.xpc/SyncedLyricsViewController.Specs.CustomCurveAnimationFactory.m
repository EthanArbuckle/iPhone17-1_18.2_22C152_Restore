@interface SyncedLyricsViewController.Specs.CustomCurveAnimationFactory
- (_TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory)init;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
@end

@implementation SyncedLyricsViewController.Specs.CustomCurveAnimationFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  float v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint1);
  float v3 = *(double *)&self->controlPoint1[OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint1];
  float v4 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint2);
  float v5 = *(double *)&self->controlPoint1[OBJC_IVAR____TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory_controlPoint2];
  id v6 = objc_allocWithZone((Class)CAMediaTimingFunction);
  *(float *)&double v7 = v2;
  *(float *)&double v8 = v3;
  *(float *)&double v9 = v4;
  *(float *)&double v10 = v5;
  id v11 = [v6 initWithControlPoints:v7 :v8 :v9 :v10];

  return v11;
}

- (_TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory)init
{
  result = (_TtCVC11MusicCoreUI26SyncedLyricsViewController5SpecsP33_24E29E585AB6D5A617C4CD1FBB85399D27CustomCurveAnimationFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end