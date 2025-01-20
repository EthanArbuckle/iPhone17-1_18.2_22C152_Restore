@interface SummarizationClient
- (void)didEncounterTextAssistantStreamingError:(id)a3 forRequestIdentifier:(id)a4;
- (void)didFinishTextAssistantStreamingForRequestIdentifier:(id)a3;
- (void)didProduceTextAssistantPartialSummary:(id)a3 forRequestIdentifier:(id)a4;
@end

@implementation SummarizationClient

- (void)didProduceTextAssistantPartialSummary:(id)a3 forRequestIdentifier:(id)a4
{
  sub_25B9ECFD0();
  id v5 = a3;
  swift_retain();
  SummarizationClient.didProduceTextAssistantPartialSummary(_:forRequestIdentifier:)();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)didEncounterTextAssistantStreamingError:(id)a3 forRequestIdentifier:(id)a4
{
  sub_25B9ECFD0();
  id v5 = a3;
  swift_retain();
  SummarizationClient.didEncounterTextAssistantStreamingError(_:forRequestIdentifier:)();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)didFinishTextAssistantStreamingForRequestIdentifier:(id)a3
{
  uint64_t v3 = sub_25B9ECFD0();
  id v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  SummarizationClient.didFinishTextAssistantStreaming(forRequestIdentifier:)(v6);
  swift_release();
  swift_bridgeObjectRelease();
}

@end