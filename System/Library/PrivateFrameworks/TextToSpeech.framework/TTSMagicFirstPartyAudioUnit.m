@interface TTSMagicFirstPartyAudioUnit
- (_TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (id)defaultSettingsForVoice:(id)a3;
@end

@implementation TTSMagicFirstPartyAudioUnit

- (_TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  return (_TtC12TextToSpeech27TTSMagicFirstPartyAudioUnit *)TTSMagicFirstPartyAudioUnit.init(componentDescription:options:)(*(void *)&a3->componentType, *(void *)&a3->componentManufacturer, a3->componentFlagsMask, *(uint64_t *)&a4);
}

- (id)defaultSettingsForVoice:(id)a3
{
  v3 = self;
  sub_1A674FBC4();

  sub_1A67501D4(0, (unint64_t *)&qword_1E96C15A8);
  v4 = (void *)sub_1A6891E90();
  swift_bridgeObjectRelease();

  return v4;
}

- (void).cxx_destruct
{
}

@end