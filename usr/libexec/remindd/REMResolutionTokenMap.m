@interface REMResolutionTokenMap
+ (id)newObjectFromJSONObject:(id)a3;
+ (id)objc_newObjectFromJSONString:(id)a3;
- (id)objc_toJSONString;
@end

@implementation REMResolutionTokenMap

+ (id)newObjectFromJSONObject:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = sub_100663C08(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (id)objc_toJSONString
{
  v2 = self;
  sub_100170048();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

+ (id)objc_newObjectFromJSONString:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  uint64_t v3 = (void *)sub_100663EF4();
  swift_bridgeObjectRelease();

  return v3;
}

@end