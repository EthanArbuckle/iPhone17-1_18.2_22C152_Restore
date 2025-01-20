@interface RDSwiftSpeechDonation
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)init;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)initWithDonorBundleID:(id)a3 donorReferenceID:(id)a4 recordingDate:(id)a5 locale:(id)a6 taskHint:(id)a7 transcription:(id)a8;
- (void)donateWithAudioBuffers:(id)a3 logAudioFile:(BOOL)a4;
@end

@implementation RDSwiftSpeechDonation

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)initWithDonorBundleID:(id)a3 donorReferenceID:(id)a4 recordingDate:(id)a5 locale:(id)a6 taskHint:(id)a7 transcription:(id)a8
{
  v26[1] = self;
  uint64_t v8 = sub_1000C3070();
  __chkstk_darwin(v8 - 8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000C3020();
  __chkstk_darwin(v11 - 8);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000C3560();
  uint64_t v16 = v15;
  uint64_t v17 = sub_1000C3560();
  uint64_t v19 = v18;
  sub_1000C3010();
  sub_1000C3050();
  uint64_t v20 = sub_1000C3560();
  uint64_t v22 = v21;
  uint64_t v23 = sub_1000C3560();
  return (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation *)RDSwiftSpeechDonation.init(donorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:)(v14, v16, v17, v19, (uint64_t)v13, (uint64_t)v10, v20, v22, v23, v24);
}

- (void)donateWithAudioBuffers:(id)a3 logAudioFile:(BOOL)a4
{
  sub_1000525C8();
  uint64_t v6 = sub_1000C35D0();
  v7 = self;
  RDSwiftSpeechDonation.donate(audioBuffers:logAudioFile:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)init
{
  result = (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_recordingDate;
  uint64_t v4 = sub_1000C3020();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_locale;
  uint64_t v6 = sub_1000C3070();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_audioFormat));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_file));
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation_logger;
  uint64_t v8 = sub_1000C31B0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
}

@end