@interface IndexingSpeedViewFactory
+ (id)createWithData:(id)a3 type:(int64_t)a4;
- (_TtC10MobileMail24IndexingSpeedViewFactory)init;
@end

@implementation IndexingSpeedViewFactory

+ (id)createWithData:(id)a3 type:(int64_t)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  sub_1002D22F4();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  v9 = (void *)sub_1002D2184(v7, a4);
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC10MobileMail24IndexingSpeedViewFactory)init
{
  return (_TtC10MobileMail24IndexingSpeedViewFactory *)sub_1002D3EC8();
}

@end