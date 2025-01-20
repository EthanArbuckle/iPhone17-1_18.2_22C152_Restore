@interface VoiceResolver
+ (_TtC12TextToSpeech13VoiceResolver)shared;
+ (void)setShared:(id)a3;
- (_TtC12TextToSpeech13VoiceResolver)init;
- (void)currentLocaleIdentifiersWithCompletionHandler:(id)a3;
- (void)currentLocalesWithCompletionHandler:(id)a3;
- (void)currentSystemLocaleIdentifierWithCompletionHandler:(id)a3;
- (void)currentSystemLocaleWithCompletionHandler:(id)a3;
- (void)fallbackForVoice:(TTSSpeechVoice *)a3 completionHandler:(id)a4;
- (void)voiceForIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)voiceForIdentifier:(id)a3 preferringLanguage:(id)a4 completionHandler:(id)a5;
- (void)voiceForLocale:(NSLocale *)a3 completionHandler:(id)a4;
- (void)voiceForLocaleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation VoiceResolver

+ (_TtC12TextToSpeech13VoiceResolver)shared
{
  if (qword_1E96C4040 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v2 = (void *)swift_retain();

  return (_TtC12TextToSpeech13VoiceResolver *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v4 = qword_1E96C4040;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_1E96C4058 = (uint64_t)a3;
  swift_release();
}

- (void)currentSystemLocaleWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96C2620;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96C2628;
  v12[5] = v11;
  swift_retain();
  sub_1A67774F4((uint64_t)v7, (uint64_t)&unk_1E96C2630, (uint64_t)v12);
  swift_release();
}

- (void)currentLocalesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96C2600;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96C2608;
  v12[5] = v11;
  swift_retain();
  sub_1A67774F4((uint64_t)v7, (uint64_t)&unk_1E96C2610, (uint64_t)v12);
  swift_release();
}

- (void)currentLocaleIdentifiersWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_1A679C8E8((uint64_t)sub_1A67B5540, v4);
  swift_release();

  swift_release();
}

- (void)currentSystemLocaleIdentifierWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96C25E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96C25E8;
  v12[5] = v11;
  swift_retain();
  sub_1A67774F4((uint64_t)v7, (uint64_t)&unk_1E96C25F0, (uint64_t)v12);
  swift_release();
}

- (_TtC12TextToSpeech13VoiceResolver)init
{
  return (_TtC12TextToSpeech13VoiceResolver *)VoiceResolver.init()();
}

- (void)voiceForIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C25C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C25C8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C25D0, (uint64_t)v14);
  swift_release();
}

- (void)voiceForLocale:(NSLocale *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C25A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C25A8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C25B0, (uint64_t)v14);
  swift_release();
}

- (void)voiceForLocaleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_1A6892000();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  swift_retain();
  sub_1A67A34DC(v5, v7, (uint64_t)sub_1A67B8464, v8);
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)voiceForIdentifier:(id)a3 preferringLanguage:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (a3)
  {
    uint64_t v8 = sub_1A6892000();
    a3 = v9;
    if (a4)
    {
LABEL_3:
      uint64_t v10 = sub_1A6892000();
      a4 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v7;
  swift_retain();
  sub_1A67A3B90(v8, (uint64_t)a3, v10, (uint64_t)a4, (uint64_t)sub_1A67B5280, v12);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fallbackForVoice:(TTSSpeechVoice *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C2580;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C2588;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C2590, (uint64_t)v14);
  swift_release();
}

@end