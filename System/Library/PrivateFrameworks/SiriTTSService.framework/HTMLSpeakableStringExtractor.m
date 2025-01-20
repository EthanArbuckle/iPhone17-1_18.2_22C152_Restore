@interface HTMLSpeakableStringExtractor
- (_TtC14SiriTTSService28HTMLSpeakableStringExtractor)init;
- (void)parser:(id)a3 didEndElement:(id)a4;
- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation HTMLSpeakableStringExtractor

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  uint64_t v7 = sub_19CED5260();
  uint64_t v9 = v8;
  sub_19CED5180();
  id v10 = a3;
  v11 = self;
  sub_19CDE7864((uint64_t)v11, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  sub_19CED5260();
  id v6 = a3;
  uint64_t v7 = self;
  sub_19CDE7990();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  sub_19CED5260();
  id v6 = a3;
  uint64_t v7 = self;
  sub_19CDE7AB8();

  swift_bridgeObjectRelease();
}

- (_TtC14SiriTTSService28HTMLSpeakableStringExtractor)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end