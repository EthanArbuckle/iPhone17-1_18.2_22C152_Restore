@interface RDSAPISwiftSpeechAnalyzer
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)init;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)initWithDelegate:(id)a3 locale:(id)a4 highPriority:(BOOL)a5 farField:(BOOL)a6 supportEmojiRecognition:(BOOL)a7;
- (id)getJitProfileData;
- (id)getUserProfileData;
- (void)addAudioSamplesPCMWithAudio:(id)a3;
- (void)addAudioSamplesWithAudio:(id)a3;
- (void)attachAnalysisContextWithCompletionHandler:(id)a3;
- (void)attachTranscriberWithTask:(NSString *)a3 completionHandler:(id)a4;
- (void)cancelRecognition;
- (void)dealloc;
- (void)endAudio;
- (void)newUtteranceBegins;
- (void)setContextWithJitProfileData:(id)a3;
- (void)setContextWithUserProfileData:(id)a3;
- (void)setRecognitionReplacementsWithUseRecognitionReplacements:(BOOL)a3 completionHandler:(id)a4;
- (void)setTextWithLeftContextText:(id)a3;
- (void)startRecognitionFromFile;
- (void)startRecognitionWithTranscriberModuleWrapper:(id)a3;
- (void)useRecognitionReplacements;
@end

@implementation RDSAPISwiftSpeechAnalyzer

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)initWithDelegate:(id)a3 locale:(id)a4 highPriority:(BOOL)a5 farField:(BOOL)a6 supportEmojiRecognition:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  v13 = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer *)sub_100062A80((uint64_t)v11, (uint64_t)v12, v9, v8, v7);

  return v13;
}

- (void)dealloc
{
  v2 = self;
  v3 = sub_1000C3180();
  os_log_type_t v4 = sub_1000C36E0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SpeechAnalyzer deinit", v5, 2u);
    swift_slowDealloc();
  }

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for RDSAPISwiftSpeechAnalyzer(0);
  [(RDSAPISwiftSpeechAnalyzer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__logger;
  uint64_t v4 = sub_1000C31B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__delegate));
  v5 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__locale;
  uint64_t v6 = sub_1000C3070();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  sub_1000528CC((uint64_t)self+ OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__taskHint, &qword_1000FE4A8);
  BOOL v7 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__modelOptions;
  uint64_t v8 = sub_1000C3290();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000528CC((uint64_t)self+ OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__analysisOptions, &qword_1000FE4B0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__analysisContext));
  swift_release();
  BOOL v9 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStream;
  uint64_t v10 = sub_1000520F0(&qword_1000FE4B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  id v11 = (char *)self
      + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStreamBuilder;
  uint64_t v12 = sub_1000520F0(&qword_1000FE4C0);
  v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
  v13(v11, v12);
}

- (void)attachAnalysisContextWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000520F0(&qword_1000FE2F8);
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1000C3650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000FE7A8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000FE7B0;
  v12[5] = v11;
  v13 = self;
  sub_10005FD58((uint64_t)v7, (uint64_t)&unk_1000FE7B8, (uint64_t)v12);
  swift_release();
}

- (void)attachTranscriberWithTask:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000520F0(&qword_1000FE2F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000C3650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000FE788;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000FE790;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10005FD58((uint64_t)v9, (uint64_t)&unk_1000FE798, (uint64_t)v14);
  swift_release();
}

- (void)setRecognitionReplacementsWithUseRecognitionReplacements:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000520F0(&qword_1000FE2F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_1000C3650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000FE748;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000FE758;
  v14[5] = v13;
  v15 = self;
  sub_10005FD58((uint64_t)v9, (uint64_t)&unk_1000FE768, (uint64_t)v14);
  swift_release();
}

- (void)cancelRecognition
{
}

- (void)setTextWithLeftContextText:(id)a3
{
  uint64_t v5 = sub_1000520F0(&qword_1000FE2F8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000C3560();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1000C3650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = v8;
  v12[6] = v10;
  v13 = self;
  id v14 = a3;
  sub_100051548((uint64_t)v7, (uint64_t)&unk_1000FE738, (uint64_t)v12);

  swift_release();
}

- (id)getJitProfileData
{
  sub_1000581DC((char *)self, (uint64_t)a2, (uint64_t (*)(void))&dispatch thunk of AnalysisContext.jitProfileData.getter);
  return result;
}

- (void)setContextWithJitProfileData:(id)a3
{
}

- (id)getUserProfileData
{
  sub_1000581DC((char *)self, (uint64_t)a2, (uint64_t (*)(void))&dispatch thunk of AnalysisContext.profileData.getter);
  return result;
}

- (void)setContextWithUserProfileData:(id)a3
{
}

- (void)useRecognitionReplacements
{
  v2 = self;
  RDSAPISwiftSpeechAnalyzer.useRecognitionReplacements()();
}

- (void)newUtteranceBegins
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__newUtteranceBeginSampleNumber) = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__totalSamplesSent);
}

- (void)addAudioSamplesWithAudio:(id)a3
{
  uint64_t v4 = sub_1000C35D0();
  uint64_t v5 = self;
  RDSAPISwiftSpeechAnalyzer.addAudioSamples(audio:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)endAudio
{
}

- (void)addAudioSamplesPCMWithAudio:(id)a3
{
  uint64_t v5 = sub_1000C3360();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000520F0(&qword_1000FE4C0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000520F0(&qword_1000FE550);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, (char *)self+ OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__inputStreamBuilder, v6);
  id v14 = a3;
  uint64_t v15 = self;
  CMTimeMake(&v17, 0, 1);
  sub_1000C3350();
  sub_1000C3670();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)startRecognitionWithTranscriberModuleWrapper:(id)a3
{
  uint64_t v5 = sub_1000520F0(&qword_1000FE2F8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000C3650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = v10;
  *(Class *)((char *)&v11->super.isa
           + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer__recognitionTask) = (Class)sub_100051548((uint64_t)v7, (uint64_t)&unk_1000FE720, (uint64_t)v9);

  swift_release();
}

- (void)startRecognitionFromFile
{
  v2 = self;
  RDSAPISwiftSpeechAnalyzer.startRecognitionFromFile()();
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)init
{
  id result = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end