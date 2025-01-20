@interface MTMultiKeySyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)requiresNextGetTransaction;
- (MTMultiKeySyncProcessor)init;
- (MTMultiKeySyncProcessor)initWithKeysAndProcessors:(id)a3;
- (NSArray)cleanKeys;
- (NSArray)dirtyKeys;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)processorForKey:(id)a3;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MTMultiKeySyncProcessor

- (MTMultiKeySyncProcessor)initWithKeysAndProcessors:(id)a3
{
  type metadata accessor for KeyProcessorPair();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (MTMultiKeySyncProcessor *)MultiKeySyncProcessor.init(keysAndProcessors:)(v3);
}

- (NSArray)dirtyKeys
{
  return (NSArray *)sub_1002258C8(self, (uint64_t)a2, MultiKeySyncProcessor.dirtyKeys.getter);
}

- (NSArray)cleanKeys
{
  return (NSArray *)sub_1002258C8(self, (uint64_t)a2, MultiKeySyncProcessor.cleanKeys.getter);
}

- (id)processorForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)MultiKeySyncProcessor.processor(for:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (MTMultiKeySyncProcessor)init
{
  result = (MTMultiKeySyncProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)operationTypeForSET
{
  return 17;
}

- (BOOL)hasLocalChanges
{
  v2 = self;
  Swift::Bool v3 = MultiKeySyncProcessor.hasLocalChanges()();

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  v2 = self;
  Swift::Bool v3 = MultiKeySyncProcessor.requiresNextGetTransaction()();

  return v3;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = (MZKeyValueStoreTransaction *)a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  object = MultiKeySyncProcessor.version(forGetTransaction:key:)(v9, v11).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }

  return v13;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  v12 = self;
  uint64_t v13 = MultiKeySyncProcessor.data(forSetTransaction:key:version:)((uint64_t)v11, v8, v10, (uint64_t)a5);
  unint64_t v15 = v14;

  swift_bridgeObjectRelease();
  if (v15 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10021A3FC(v13, v15);
  }

  return isa;
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227ED8;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  MultiKeySyncProcessor.success(forGetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227ED8;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  MultiKeySyncProcessor.success(forSetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = _Block_copy(a7);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  if (a4)
  {
    id v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  if (a6)
  {
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = v23;

    if (v11)
    {
LABEL_6:
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v11;
      v26 = sub_100227E88;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 0;
    v24 = 0;
    if (v11) {
      goto LABEL_6;
    }
  }
  v26 = 0;
  uint64_t v25 = 0;
LABEL_9:
  MultiKeySyncProcessor.conflict(forSetTransaction:with:forKey:version:finishedBlock:)((uint64_t)a3, (uint64_t)a4, v18, v19, v21, v22, v24, v26, v25);
  sub_1000536BC((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10021A3FC((uint64_t)a4, v18);
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  type metadata accessor for SyncKeysRepository();
  id v6 = a3;
  v7 = self;
  id v8 = (id)static SyncKeysRepository.shared.getter();
  swift_bridgeObjectRetain();
  SyncKeysRepository.podcastsDomainVersion.setter();

  swift_bridgeObjectRelease();
}

@end