@interface CoreSynthesisVoiceShim
+ (_TtC12TextToSpeech22CoreSynthesisVoiceShim)shared;
+ (void)setShared:(id)a3;
- (_TtC12TextToSpeech22CoreSynthesisVoiceShim)init;
- (void)internalVoiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)internalVoicesIncludingSiri:(BOOL)a3 completionHandler:(id)a4;
- (void)publicVoicesWithCompletionHandler:(id)a3;
- (void)voiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)voiceWithLanguageCode:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation CoreSynthesisVoiceShim

+ (_TtC12TextToSpeech22CoreSynthesisVoiceShim)shared
{
  if (qword_1E96D0380 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC12TextToSpeech22CoreSynthesisVoiceShim *)(id)qword_1E96D0388;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1E96D0380;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1E96D0388;
  qword_1E96D0388 = (uint64_t)v4;
}

- (void)voiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C3028;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C3030;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C3038, (uint64_t)v14);
  swift_release();
}

- (void)voiceWithLanguageCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C3008;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C3010;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C3018, (uint64_t)v14);
  swift_release();
}

- (void)publicVoicesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96C2FE8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96C2FF0;
  v12[5] = v11;
  v13 = self;
  sub_1A67774F4((uint64_t)v7, (uint64_t)&unk_1E96C2FF8, (uint64_t)v12);
  swift_release();
}

- (void)internalVoicesIncludingSiri:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C2FC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C2FC8;
  v14[5] = v13;
  v15 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C2FD0, (uint64_t)v14);
  swift_release();
}

- (void)internalVoiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C2FA0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C2FA8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C2FB0, (uint64_t)v14);
  swift_release();
}

- (_TtC12TextToSpeech22CoreSynthesisVoiceShim)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12TextToSpeech22CoreSynthesisVoiceShim____lazy_storage___internalResolver) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12TextToSpeech22CoreSynthesisVoiceShim____lazy_storage___publicResolver) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreSynthesisVoiceShim();
  return [(CoreSynthesisVoiceShim *)&v3 init];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end