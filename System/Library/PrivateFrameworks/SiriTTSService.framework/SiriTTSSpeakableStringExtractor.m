@interface SiriTTSSpeakableStringExtractor
- (SiriTTSSpeakableStringExtractor)init;
@end

@implementation SiriTTSSpeakableStringExtractor

- (SiriTTSSpeakableStringExtractor)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSpeakableStringExtractor_data);
  unint64_t v4 = *(void *)&self->language[OBJC_IVAR___SiriTTSSpeakableStringExtractor_data];
  sub_19CDB73CC(v3, v4);
}

@end