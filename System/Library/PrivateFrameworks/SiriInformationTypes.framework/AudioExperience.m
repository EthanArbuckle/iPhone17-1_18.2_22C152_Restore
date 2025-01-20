@interface AudioExperience
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch15AudioExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AudioExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch15AudioExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch15AudioExperience *)AudioExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AudioExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals;
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent;
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  outlined destroy of ClientExperienceSignals?((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock);
}

@end