@interface MockEmittableSiriAnalyticsMessageStream
- (_TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream)init;
- (void)barrierWithCompletion:(id)a3;
- (void)emitMessage:(id)a3;
- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4;
- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6;
@end

@implementation MockEmittableSiriAnalyticsMessageStream

- (void)emitMessage:(id)a3
{
  id v4 = a3;
  v5 = self;
  MockEmittableSiriAnalyticsMessageStream.emitMessage(_:)(v4);
}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4
{
  id v5 = a3;
  v6 = self;
  specialized MockEmittableSiriAnalyticsMessageStream.emitMessage(_:timestamp:)(v5);
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6
{
  v7 = _Block_copy(a6);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  _Block_release(v7);
  outlined destroy of UUID?((uint64_t)v10);
}

- (void)barrierWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (_TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream)init
{
  return (_TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream *)MockEmittableSiriAnalyticsMessageStream.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch39MockEmittableSiriAnalyticsMessageStream_queue));

  swift_bridgeObjectRelease();
}

@end