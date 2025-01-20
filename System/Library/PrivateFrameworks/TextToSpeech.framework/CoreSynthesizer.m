@interface CoreSynthesizer
- (AVAudioSession)_audioSession;
- (AVAudioSession)_auxiliarySession;
- (AVAudioSession)audioSession;
- (AVAudioSession)auxiliarySession;
- (BOOL)_audioSessionAutomaticallyDeactivatesAfterSpeaking;
- (BOOL)_auxSessionParticipatesInNowPlayingAppPolicy;
- (BOOL)audioSessionAutomaticallyDeactivatesAfterSpeaking;
- (BOOL)auxSessionParticipatesInNowPlayingAppPolicy;
- (BOOL)continueSpeaking;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)mixToTelephonyUplink;
- (BOOL)useAuxiliarySession;
- (NSArray)_effects;
- (NSArray)_offlineChain;
- (NSArray)channels;
- (NSArray)effects;
- (NSArray)offlineChain;
- (NSString)_auxSessionCategory;
- (NSString)auxSessionCategory;
- (TTSWrappedAudioQueue)_audioQueue;
- (TTSWrappedAudioQueue)audioQueue;
- (_TtC12TextToSpeech13VoiceResolver)_voiceResolver;
- (_TtC12TextToSpeech13VoiceResolver)voiceResolver;
- (_TtC12TextToSpeech15CoreSynthesizer)init;
- (unint64_t)_auxSessionCategoryOptions;
- (unint64_t)auxSessionCategoryOptions;
- (unsigned)audioQueueFlags;
- (void)pauseSpeakingAt:(int64_t)a3 completionHandler:(id)a4;
- (void)setAudioQueue:(id)a3;
- (void)setAudioQueueFlags:(unsigned int)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3;
- (void)setAuxSessionCategory:(id)a3;
- (void)setAuxSessionCategoryOptions:(unint64_t)a3;
- (void)setAuxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3;
- (void)setAuxiliarySession:(id)a3;
- (void)setChannels:(id)a3;
- (void)setEffects:(id)a3;
- (void)setMixToTelephonyUplink:(BOOL)a3;
- (void)setOfflineChain:(id)a3;
- (void)setUseAuxiliarySession:(BOOL)a3;
- (void)setVoiceResolver:(id)a3;
- (void)set_audioQueue:(id)a3;
- (void)set_audioSession:(id)a3;
- (void)set_audioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3;
- (void)set_auxSessionCategory:(id)a3;
- (void)set_auxSessionCategoryOptions:(unint64_t)a3;
- (void)set_auxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3;
- (void)set_auxiliarySession:(id)a3;
- (void)set_effects:(id)a3;
- (void)set_offlineChain:(id)a3;
- (void)set_voiceResolver:(id)a3;
- (void)speak:(AVSpeechUtterance *)a3 synth:(AVSpeechSynthesizer *)a4 completionHandler:(id)a5;
- (void)speakWithRequest:(id)a3 synthesizer:(id)a4 completionHandler:(id)a5;
- (void)stopSpeakingAt:(int64_t)a3 completionHandler:(id)a4;
- (void)stopWithCompletionHandler:(id)a3;
- (void)voiceWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)voiceWithLocale:(NSLocale *)a3 completionHandler:(id)a4;
- (void)write:(AVSpeechUtterance *)a3 toBufferCallback:(id)a4 toMarkerCallback:synth:completionHandler:;
- (void)write:(_TtC12TextToSpeech15CoreSynthesizer *)self toBufferCallback:(SEL)a2 synth:(AVSpeechUtterance *)a3 completionHandler:(id)a4;
@end

@implementation CoreSynthesizer

- (_TtC12TextToSpeech13VoiceResolver)_voiceResolver
{
  swift_beginAccess();
  v2 = (void *)swift_retain();

  return (_TtC12TextToSpeech13VoiceResolver *)v2;
}

- (void)set_voiceResolver:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__voiceResolver);
  swift_beginAccess();
  id *v4 = a3;
  swift_retain();
  swift_release();
}

- (_TtC12TextToSpeech13VoiceResolver)voiceResolver
{
  uint64_t KeyPath = swift_getKeyPath();
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  v6 = (void **)((char *)&v5->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__voiceResolver);
  swift_beginAccess();
  v7 = *v6;
  swift_retain();

  return (_TtC12TextToSpeech13VoiceResolver *)v7;
}

- (void)setVoiceResolver:(id)a3
{
  uint64_t KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = a3;
  v6 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  swift_retain();
  v7 = self;
  v6(KeyPath, sub_1A679B11C, v8, MEMORY[0x1E4FBC848] + 8);

  swift_release();
  swift_release();
}

- (TTSWrappedAudioQueue)_audioQueue
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
  swift_beginAccess();
  return (TTSWrappedAudioQueue *)*v2;
}

- (void)set_audioQueue:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
  swift_beginAccess();
  v5 = *v4;
  id *v4 = a3;
  id v6 = a3;
}

- (TTSWrappedAudioQueue)audioQueue
{
  return (TTSWrappedAudioQueue *)sub_1A6792664(self, (uint64_t)a2, (uint64_t)&unk_1A689F4E0, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioQueue);
}

- (void)setAudioQueue:(id)a3
{
}

- (NSArray)_offlineChain
{
  swift_beginAccess();
  sub_1A67501D4(0, &qword_1E96C1EF0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)set_offlineChain:(id)a3
{
  sub_1A67501D4(0, &qword_1E96C1EF0);
  uint64_t v4 = sub_1A68922E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__offlineChain);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)offlineChain
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  sub_1A67501D4(0, &qword_1E96C1EF0);
  id v6 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void)setOfflineChain:(id)a3
{
  sub_1A67501D4(0, &qword_1E96C1EF0);
  uint64_t v4 = sub_1A68922E0();
  uint64_t KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = v4;
  id v6 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  v7 = self;
  v6(KeyPath, sub_1A679B0EC, v8, MEMORY[0x1E4FBC848] + 8);

  swift_release();
  swift_bridgeObjectRelease();
}

- (NSArray)_effects
{
  swift_beginAccess();
  sub_1A6891BB0();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)set_effects:(id)a3
{
  sub_1A6891BB0();
  uint64_t v4 = sub_1A68922E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__effects);
  swift_beginAccess();
  uint64_t *v5 = v4;
  id v6 = self;
  swift_bridgeObjectRelease();
  sub_1A6786CE8();
}

- (NSArray)effects
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  v5 = self;
  v4(KeyPath);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();

  sub_1A6891BB0();
  id v6 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void)setEffects:(id)a3
{
  sub_1A6891BB0();
  uint64_t v4 = sub_1A68922E0();
  uint64_t KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = v4;
  id v6 = *(void (**)(uint64_t, uint64_t (*)(), void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                        + 0x5F0);
  v7 = self;
  v6(KeyPath, sub_1A679B0D4, v8, MEMORY[0x1E4FBC848] + 8);

  swift_release();
  swift_bridgeObjectRelease();
}

- (AVAudioSession)_audioSession
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
  swift_beginAccess();
  return (AVAudioSession *)*v2;
}

- (void)set_audioSession:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
  swift_beginAccess();
  id v6 = *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v5 = a3;
  id v7 = a3;
  v8 = self;

  v9 = (void *)MEMORY[0x1E4FBC8C8];
  v10 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v8->super.isa) + 0x1B0))();
  v11 = (void *)(*(uint64_t (**)(void))((*v9 & (uint64_t)v8->super.isa) + 0x370))();
  objc_msgSend(v10, sel_setAudioSession_, v11);
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)sub_1A6792664(self, (uint64_t)a2, (uint64_t)&unk_1A689F648, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSession);
}

- (void)setAudioSession:(id)a3
{
}

- (NSArray)channels
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1B0);
  v3 = self;
  uint64_t v4 = (void *)v2();
  id v5 = objc_msgSend(v4, sel_channels);

  sub_1A67501D4(0, &qword_1E96C21B0);
  sub_1A68922E0();

  id v6 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void)setChannels:(id)a3
{
  sub_1A67501D4(0, &qword_1E96C21B0);
  sub_1A68922E0();
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1B0);
  id v5 = self;
  id v6 = (void *)v4();
  id v7 = (id)sub_1A68922D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setChannels_, v7);
}

- (unsigned)audioQueueFlags
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1B0);
  v3 = self;
  uint64_t v4 = (void *)v2();
  unsigned int v5 = objc_msgSend(v4, sel_audioQueueFlags);

  return v5;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1B0);
  unsigned int v5 = self;
  id v6 = (id)v4();
  objc_msgSend(v6, sel_setAudioQueueFlags_, v3);
}

- (_TtC12TextToSpeech15CoreSynthesizer)init
{
  return (_TtC12TextToSpeech15CoreSynthesizer *)CoreSynthesizer.init()();
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
  v13[4] = &unk_1E96C2380;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C2388;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C2390, (uint64_t)v14);
  swift_release();
}

- (void)voiceWithLocale:(NSLocale *)a3 completionHandler:(id)a4
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
  v13[4] = &unk_1E96C2360;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C2368;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C2370, (uint64_t)v14);
  swift_release();
}

- (void)stopWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1E96C2340;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96C2348;
  v12[5] = v11;
  v13 = self;
  sub_1A67774F4((uint64_t)v7, (uint64_t)&unk_1E96C2350, (uint64_t)v12);
  swift_release();
}

- (BOOL)mixToTelephonyUplink
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x378);
  uint64_t v3 = self;
  LODWORD(v2) = v2();

  return (v2 >> 8) & 1;
}

- (void)setMixToTelephonyUplink:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x378);
  uint64_t v8 = self;
  int v6 = v5();
  if (v3) {
    int v7 = 256;
  }
  else {
    int v7 = 0;
  }
  (*(void (**)(void))((*v4 & (uint64_t)v8->super.isa) + 0x380))(v6 & 0xFFFFFEFF | v7);
}

- (NSString)_auxSessionCategory
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
  swift_beginAccess();
  return (NSString *)*v2;
}

- (void)set_auxSessionCategory:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
  swift_beginAccess();
  int v6 = *v5;
  _TtC12TextToSpeech15CoreSynthesizer *v5 = a3;
  id v7 = a3;
  uint64_t v8 = self;

  sub_1A679247C();
}

- (NSString)auxSessionCategory
{
  return (NSString *)sub_1A6792664(self, (uint64_t)a2, (uint64_t)&unk_1A689F718, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategory);
}

- (void)setAuxSessionCategory:(id)a3
{
}

- (unint64_t)_auxSessionCategoryOptions
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  return *v2;
}

- (void)set_auxSessionCategoryOptions:(unint64_t)a3
{
  uint64_t v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  unint64_t *v5 = a3;
  int v6 = self;
  sub_1A6792C2C();
}

- (unint64_t)auxSessionCategoryOptions
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  uint64_t v5 = self;
  v4(KeyPath);
  swift_release();
  int v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionCategoryOptions);
  swift_beginAccess();
  unint64_t v7 = *v6;

  return v7;
}

- (void)setAuxSessionCategoryOptions:(unint64_t)a3
{
  uint64_t KeyPath = swift_getKeyPath();
  v8[2] = self;
  v8[3] = a3;
  int v6 = *(void (**)(uint64_t, void (*)(), void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                     + 0x5F0);
  unint64_t v7 = self;
  v6(KeyPath, sub_1A6797938, v8, MEMORY[0x1E4FBC848] + 8);

  swift_release();
}

- (BOOL)_auxSessionParticipatesInNowPlayingAppPolicy
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy;
  swift_beginAccess();
  return *v2;
}

- (void)set_auxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3
{
  uint64_t v5 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy;
  swift_beginAccess();
  BOOL *v5 = a3;
  int v6 = self;
  sub_1A67932F4();
}

- (BOOL)auxSessionParticipatesInNowPlayingAppPolicy
{
  return sub_1A6793868(self, (uint64_t)a2, (uint64_t)&unk_1A689F7C0, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxSessionParticipatesInNowPlayingAppPolicy);
}

- (void)setAuxSessionParticipatesInNowPlayingAppPolicy:(BOOL)a3
{
}

- (BOOL)_audioSessionAutomaticallyDeactivatesAfterSpeaking
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking;
  swift_beginAccess();
  return *v2;
}

- (void)set_audioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)audioSessionAutomaticallyDeactivatesAfterSpeaking
{
  return sub_1A6793868(self, (uint64_t)a2, (uint64_t)&unk_1A689F828, &OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__audioSessionAutomaticallyDeactivatesAfterSpeaking);
}

- (void)setAudioSessionAutomaticallyDeactivatesAfterSpeaking:(BOOL)a3
{
}

- (AVAudioSession)_auxiliarySession
{
  return (AVAudioSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession));
}

- (void)set_auxiliarySession:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession) = (Class)a3;
  id v5 = a3;
  int v6 = self;

  unint64_t v7 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v8 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v6->super.isa) + 0x1B0))();
  id v9 = (id)(*(uint64_t (**)(void))((*v7 & (uint64_t)v6->super.isa) + 0x370))();
  objc_msgSend(v8, sel_setAudioSession_, v9);
}

- (AVAudioSession)auxiliarySession
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  id v5 = self;
  v4(KeyPath);
  swift_release();
  int v6 = (AVAudioSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v5->super.isa
                                                                 + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__auxiliarySession));

  return v6;
}

- (void)setAuxiliarySession:(id)a3
{
  uint64_t KeyPath = swift_getKeyPath();
  v9[2] = self;
  v9[3] = a3;
  int v6 = *(void (**)(uint64_t, void (*)(), void *, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                     + 0x5F0);
  id v7 = a3;
  uint64_t v8 = self;
  v6(KeyPath, sub_1A679B08C, v9, MEMORY[0x1E4FBC848] + 8);

  swift_release();
}

- (BOOL)useAuxiliarySession
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x5E8);
  id v5 = self;
  v4(KeyPath);
  swift_release();
  LOBYTE(self) = *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer___usingAuxiliarySession);

  return (char)self;
}

- (void)setUseAuxiliarySession:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1A6794618(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(void **)&self->_offlineChain[OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__effectManager];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1A67978FC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer__nextWordBlock));

  uint64_t v4 = (char *)self + OBJC_IVAR____TtC12TextToSpeech15CoreSynthesizer___observationRegistrar;
  uint64_t v5 = sub_1A6891AA0();
  int v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  v6(v4, v5);
}

- (BOOL)isSpeaking
{
  v2 = self;
  char v3 = CoreSynthesizer.isSpeaking.getter();

  return v3 & 1;
}

- (BOOL)isPaused
{
  v2 = self;
  char v3 = CoreSynthesizer.isPaused.getter();

  return v3 & 1;
}

- (void)speak:(AVSpeechUtterance *)a3 synth:(AVSpeechSynthesizer *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E96C31A0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E96C31A8;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1A67774F4((uint64_t)v11, (uint64_t)&unk_1E96C31B0, (uint64_t)v16);
  swift_release();
}

- (void)write:(_TtC12TextToSpeech15CoreSynthesizer *)self toBufferCallback:(SEL)a2 synth:(AVSpeechUtterance *)a3 completionHandler:(id)a4
{
  int v6 = v5;
  id v7 = v4;
  uint64_t v11 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a4);
  v15 = _Block_copy(v6);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = v14;
  v16[4] = v7;
  v16[5] = v15;
  v16[6] = self;
  uint64_t v17 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E96C3180;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E96C3188;
  v19[5] = v18;
  uint64_t v20 = a3;
  id v21 = v7;
  v22 = self;
  sub_1A67774F4((uint64_t)v13, (uint64_t)&unk_1E96C3190, (uint64_t)v19);
  swift_release();
}

- (void)write:(AVSpeechUtterance *)a3 toBufferCallback:(id)a4 toMarkerCallback:synth:completionHandler:
{
  id v7 = v6;
  uint64_t v8 = v5;
  uint64_t v9 = v4;
  uint64_t v13 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a4);
  uint64_t v17 = _Block_copy(v9);
  v18 = _Block_copy(v7);
  v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = v16;
  v19[4] = v17;
  v19[5] = v8;
  v19[6] = v18;
  v19[7] = self;
  uint64_t v20 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  id v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1E96C3158;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1E96C3160;
  v22[5] = v21;
  uint64_t v23 = a3;
  id v24 = v8;
  v25 = self;
  sub_1A67774F4((uint64_t)v15, (uint64_t)&unk_1E96C3168, (uint64_t)v22);
  swift_release();
}

- (void)stopSpeakingAt:(int64_t)a3 completionHandler:(id)a4
{
  int v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = self;
  sub_1A680EA84(a3, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)pauseSpeakingAt:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96C3108;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96C3118;
  v14[5] = v13;
  v15 = self;
  sub_1A67774F4((uint64_t)v9, (uint64_t)&unk_1E96C3128, (uint64_t)v14);
  swift_release();
}

- (BOOL)continueSpeaking
{
  uint64_t v3 = sub_1A6741AD0((uint64_t *)&unk_1EB67A2C0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = self;
  unsigned __int8 v7 = [(CoreSynthesizer *)v6 isPaused];
  uint64_t v8 = sub_1A68924A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v6;
  uint64_t v10 = v6;
  sub_1A6787038((uint64_t)v5, (uint64_t)&unk_1E96C30F8, (uint64_t)v9);

  swift_release();
  return v7;
}

- (void)speakWithRequest:(id)a3 synthesizer:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  CoreSynthesizer.speak(request:synthesizer:completionHandler:)(v10, (uint64_t)v11, (uint64_t)sub_1A6818594, v9);

  swift_release();
}

@end