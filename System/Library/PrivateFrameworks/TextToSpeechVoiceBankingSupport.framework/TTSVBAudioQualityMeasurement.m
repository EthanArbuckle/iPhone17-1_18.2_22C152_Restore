@interface TTSVBAudioQualityMeasurement
- (NSString)description;
- (_TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement)init;
- (float)snr;
- (float)snrEnd;
- (float)snrEndUnnormalized;
- (float)snrThreshold;
- (float)snrUnnormalized;
- (float)spl;
- (float)splEnd;
- (float)splEndUnnormalized;
- (float)splThreshold;
- (float)splUnnormalized;
- (void)setSnr:(float)a3;
- (void)setSnrEnd:(float)a3;
- (void)setSnrEndUnnormalized:(float)a3;
- (void)setSnrThreshold:(float)a3;
- (void)setSnrUnnormalized:(float)a3;
- (void)setSpl:(float)a3;
- (void)setSplEnd:(float)a3;
- (void)setSplEndUnnormalized:(float)a3;
- (void)setSplThreshold:(float)a3;
- (void)setSplUnnormalized:(float)a3;
@end

@implementation TTSVBAudioQualityMeasurement

- (float)spl
{
  v2 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_spl);
  swift_beginAccess();
  return *v2;
}

- (void)setSpl:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_spl);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)splEnd
{
  v2 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splEnd);
  swift_beginAccess();
  return *v2;
}

- (void)setSplEnd:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splEnd);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)splUnnormalized
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splUnnormalized);
  swift_beginAccess();
  return *v2;
}

- (void)setSplUnnormalized:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splUnnormalized);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)splEndUnnormalized
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splEndUnnormalized);
  swift_beginAccess();
  return *v2;
}

- (void)setSplEndUnnormalized:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splEndUnnormalized);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)splThreshold
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setSplThreshold:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_splThreshold);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)snr
{
  v2 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snr);
  swift_beginAccess();
  return *v2;
}

- (void)setSnr:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snr);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)snrEnd
{
  v2 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrEnd);
  swift_beginAccess();
  return *v2;
}

- (void)setSnrEnd:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrEnd);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)snrUnnormalized
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrUnnormalized);
  swift_beginAccess();
  return *v2;
}

- (void)setSnrUnnormalized:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrUnnormalized);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)snrEndUnnormalized
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrEndUnnormalized);
  swift_beginAccess();
  return *v2;
}

- (void)setSnrEndUnnormalized:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrEndUnnormalized);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)snrThreshold
{
  v2 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setSnrThreshold:(float)a3
{
  v4 = (float *)((char *)self
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement_snrThreshold);
  swift_beginAccess();
  float *v4 = a3;
}

- (_TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement *)TTSVBAudioQualityMeasurement.init()();
}

- (NSString)description
{
  v2 = self;
  sub_25F34256C();

  v3 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end