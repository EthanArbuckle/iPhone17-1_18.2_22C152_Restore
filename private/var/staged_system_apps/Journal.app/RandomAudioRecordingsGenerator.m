@interface RandomAudioRecordingsGenerator
- (_TtC7Journal30RandomAudioRecordingsGenerator)init;
@end

@implementation RandomAudioRecordingsGenerator

- (_TtC7Journal30RandomAudioRecordingsGenerator)init
{
  uint64_t v3 = OBJC_IVAR____TtC7Journal30RandomAudioRecordingsGenerator_synthesizer;
  id v4 = objc_allocWithZone((Class)AVSpeechSynthesizer);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RandomAudioRecordingsGenerator();
  return [(RandomAudioRecordingsGenerator *)&v7 init];
}

- (void).cxx_destruct
{
}

@end