@interface TTSAURenderer
+ (void)formatForVoice:(AVSpeechSynthesisProviderVoice *)a3 completionHandler:(id)a4;
@end

@implementation TTSAURenderer

+ (void)formatForVoice:(AVSpeechSynthesisProviderVoice *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C1F30;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C1F38;
  v14[5] = v13;
  v15 = a3;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C1F40, (uint64_t)v14);
  swift_release();
}

@end