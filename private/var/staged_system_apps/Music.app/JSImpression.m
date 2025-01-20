@interface JSImpression
- (NSString)debugDescription;
@end

@implementation JSImpression

- (NSString)debugDescription
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  id v2 = v11.receiver;
  v3 = [(JSImpression *)&v11 debugDescription];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  uint64_t v12 = v4;
  uint64_t v13 = v6;
  v7._countAndFlagsBits = 10;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void).cxx_destruct
{
}

@end