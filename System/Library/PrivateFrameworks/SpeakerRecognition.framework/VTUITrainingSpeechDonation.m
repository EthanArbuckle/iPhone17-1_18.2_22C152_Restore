@interface VTUITrainingSpeechDonation
- (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation)init;
- (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation)initWithDonorBundleID:(id)a3 recordingDate:(id)a4 locale:(id)a5 transcription:(id)a6;
- (id)donateWithAudioBuffer:(id)a3;
- (id)donateWithAudioBuffer:(id)a3 speechId:(id)a4;
@end

@implementation VTUITrainingSpeechDonation

- (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation)initWithDonorBundleID:(id)a3 recordingDate:(id)a4 locale:(id)a5 transcription:(id)a6
{
  sub_21C92C2F8();
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C92C288();
  MEMORY[0x270FA5388]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21C92C398();
  uint64_t v12 = v11;
  sub_21C92C278();
  sub_21C92C2E8();
  uint64_t v13 = sub_21C92C398();
  return (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation *)VTUITrainingSpeechDonation.init(donorBundleID:recordingDate:locale:transcription:)(v10, v12, (uint64_t)v9, (uint64_t)v7, v13, v14);
}

- (id)donateWithAudioBuffer:(id)a3
{
  uint64_t v4 = sub_21C92C2D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C8AAAC8();
  uint64_t v8 = sub_21C92C3A8();
  v9 = self;
  VTUITrainingSpeechDonation.donate(audioBuffer:)(v8, v7);

  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_21C92C2A8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10;
}

- (id)donateWithAudioBuffer:(id)a3 speechId:(id)a4
{
  uint64_t v5 = sub_21C92C2D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C8AAAC8();
  v9 = (char *)sub_21C92C3A8();
  uint64_t v10 = sub_21C92C398();
  uint64_t v12 = v11;
  uint64_t v13 = self;
  VTUITrainingSpeechDonation.donate(audioBuffer:speechId:)(v9, v10, v12, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_21C92C2A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v14;
}

- (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation)init
{
  result = (_TtC18SpeakerRecognition26VTUITrainingSpeechDonation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_recordingDate;
  uint64_t v4 = sub_21C92C288();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_locale;
  uint64_t v6 = sub_21C92C2F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_audioFormat));
  swift_bridgeObjectRelease();
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_defaultUUID;
  uint64_t v8 = sub_21C92C2D8();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end