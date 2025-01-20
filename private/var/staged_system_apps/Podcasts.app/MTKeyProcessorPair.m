@interface MTKeyProcessorPair
- (MTKeyProcessorPair)init;
- (MTKeyProcessorPair)initWithKey:(id)a3 processor:(id)a4;
- (MZKeyValueStoreTransactionProcessing)processor;
- (NSString)key;
@end

@implementation MTKeyProcessorPair

- (NSString)key
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  NSString v2 = (void *)swift_unknownObjectRetain();

  return (MZKeyValueStoreTransactionProcessing *)v2;
}

- (MTKeyProcessorPair)initWithKey:(id)a3 processor:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___MTKeyProcessorPair_key);
  uint64_t *v8 = v7;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(MTKeyProcessorPair *)&v11 init];
}

- (MTKeyProcessorPair)init
{
  result = (MTKeyProcessorPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end