@interface MPModelMovie
- (NSString)shortDescription;
@end

@implementation MPModelMovie

- (NSString)shortDescription
{
  v2 = self;
  id v3 = [(MPModelMovie *)v2 title];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xEE006569766F4D20;
    uint64_t v5 = 0x64656C7469746E55;
  }
  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 34;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v10;
}

@end