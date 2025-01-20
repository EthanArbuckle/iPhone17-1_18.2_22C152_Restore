@interface VoicePreviewer
- (_TtC26TextToSpeechVoiceBankingUI14VoicePreviewer)init;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
@end

@implementation VoicePreviewer

- (_TtC26TextToSpeechVoiceBankingUI14VoicePreviewer)init
{
  return (_TtC26TextToSpeechVoiceBankingUI14VoicePreviewer *)sub_25F43AA1C();
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A1E30);
  MEMORY[0x270FA5388](v6 - 8, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25F53DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = a3;
  id v12 = a3;
  swift_retain_n();
  id v13 = v12;
  sub_25F43AEA4((uint64_t)v9, (uint64_t)&unk_26A7A1F18, (uint64_t)v11);
  swift_release();
  swift_release();
}

@end