@interface CRLPasteboardNativeDataProvider
- (NSArray)promisedDataTypes;
- (_TtC8Freeform31CRLPasteboardNativeDataProvider)init;
- (id)fulfillPromisesForPasteboardType:(id)a3;
@end

@implementation CRLPasteboardNativeDataProvider

- (NSArray)promisedDataTypes
{
  v2 = self;
  sub_100B9670C();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)fulfillPromisesForPasteboardType:(id)a3
{
  v4 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  uint64_t v8 = sub_100B96EB8(v4, v6);
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100514260(v8, v10);
  }

  return isa;
}

- (_TtC8Freeform31CRLPasteboardNativeDataProvider)init
{
  result = (_TtC8Freeform31CRLPasteboardNativeDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_pasteboardDataManaging);
  sub_100510084(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_metadataData), *(void *)&self->pasteboardDataManaging[OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_metadataData]);
  sub_100510084(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_objectsData), *(void *)&self->pasteboardDataManaging[OBJC_IVAR____TtC8Freeform31CRLPasteboardNativeDataProvider_objectsData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end