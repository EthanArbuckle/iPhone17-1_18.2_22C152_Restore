@interface SAAudioAppPredictorOptions
- (BOOL)trimDisambiguationForRelevance;
- (SAAudioAppPredictorOptions)init;
- (void)setTrimDisambiguationForRelevance:(BOOL)a3;
@end

@implementation SAAudioAppPredictorOptions

- (BOOL)trimDisambiguationForRelevance
{
  v2 = (BOOL *)self + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance;
  swift_beginAccess();
  return *v2;
}

- (void)setTrimDisambiguationForRelevance:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (SAAudioAppPredictorOptions)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorOptions_trimDisambiguationForRelevance) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriAudioAppPredictorOptions();
  return [(SAAudioAppPredictorOptions *)&v3 init];
}

@end