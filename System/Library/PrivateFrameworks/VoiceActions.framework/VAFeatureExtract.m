@interface VAFeatureExtract
- (_TtC12VoiceActions16VAFeatureExtract)init;
@end

@implementation VAFeatureExtract

- (_TtC12VoiceActions16VAFeatureExtract)init
{
  v2 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract_windowAppliedFrame) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract_frameFeatureVec) = v2;
  v3 = (char *)self + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___nfft;
  *(void *)v3 = 0;
  v3[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___fftCalculator) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___fbankTFlattened) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceActions16VAFeatureExtract____lazy_storage___hammingWindow) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VAFeatureExtract();
  return [(VAFeatureExtract *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end