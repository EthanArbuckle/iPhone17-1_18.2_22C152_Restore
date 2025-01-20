@interface TaggedSSML
- (NSArray)ssmlSnippets;
- (NSString)originalSSML;
- (_TtC12TextToSpeech10TaggedSSML)init;
- (void)setOriginalSSML:(id)a3;
- (void)setSsmlSnippets:(id)a3;
@end

@implementation TaggedSSML

- (NSArray)ssmlSnippets
{
  swift_beginAccess();
  type metadata accessor for VoiceTaggedSSMLSnippet();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A68922D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setSsmlSnippets:(id)a3
{
  type metadata accessor for VoiceTaggedSSMLSnippet();
  uint64_t v4 = sub_1A68922E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12TextToSpeech10TaggedSSML_ssmlSnippets);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)originalSSML
{
  return (NSString *)sub_1A676E410();
}

- (void)setOriginalSSML:(id)a3
{
}

- (_TtC12TextToSpeech10TaggedSSML)init
{
  result = (_TtC12TextToSpeech10TaggedSSML *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end