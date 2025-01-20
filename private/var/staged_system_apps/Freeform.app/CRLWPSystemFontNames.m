@interface CRLWPSystemFontNames
+ (NSArray)allSystemFontNames;
+ (NSString)baseName;
+ (NSString)black;
+ (NSString)bold;
+ (NSString)heavy;
+ (NSString)light;
+ (NSString)medium;
+ (NSString)regular;
+ (NSString)semibold;
+ (NSString)thin;
+ (NSString)ultraLight;
+ (double)weightForName:(id)a3;
+ (id)nameForWeight:(double)a3;
- (_TtC8Freeform20CRLWPSystemFontNames)init;
@end

@implementation CRLWPSystemFontNames

+ (NSString)baseName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)ultraLight
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)thin
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)light
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)regular
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)medium
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)semibold
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)bold
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)heavy
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)black
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSArray)allSystemFontNames
{
  if (qword_10166F8F8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

+ (id)nameForWeight:(double)a3
{
  sub_100B14DAC(a3);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

+ (double)weightForName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  double v5 = sub_100B14E5C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC8Freeform20CRLWPSystemFontNames)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLWPSystemFontNames();
  return [(CRLWPSystemFontNames *)&v3 init];
}

@end