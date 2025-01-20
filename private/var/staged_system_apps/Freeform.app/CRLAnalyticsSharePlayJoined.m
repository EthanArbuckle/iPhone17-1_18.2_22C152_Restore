@interface CRLAnalyticsSharePlayJoined
+ (void)sendSharePlayJoinedAnalyticsWithTotalTimeDelta:(float)a1 shareLinkDelta:(float)a2 joinShareDelta:(float)a3 fetchBoardDelta:(float)a4 joinCollabDelta:(float)a5;
- (_TtC8Freeform27CRLAnalyticsSharePlayJoined)init;
@end

@implementation CRLAnalyticsSharePlayJoined

- (_TtC8Freeform27CRLAnalyticsSharePlayJoined)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsSharePlayJoined();
  return [(CRLAnalyticsSharePlayJoined *)&v3 init];
}

+ (void)sendSharePlayJoinedAnalyticsWithTotalTimeDelta:(float)a1 shareLinkDelta:(float)a2 joinShareDelta:(float)a3 fetchBoardDelta:(float)a4 joinCollabDelta:(float)a5
{
  sub_100A39814((uint64_t)_swiftEmptyArrayStorage);
  id v10 = objc_allocWithZone((Class)NSNumber);
  *(float *)&double v11 = a1;
  id v12 = [v10 initWithFloat:v11];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100973904((uint64_t)v12, 0x6D69546C61746F74, 0xEE0061746C654465, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone((Class)NSNumber);
  *(float *)&double v15 = a2;
  id v16 = [v14 initWithFloat:v15];
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  sub_100973904((uint64_t)v16, 0x6E694C6572616873, 0xEE0061746C65446BLL, v17);
  swift_bridgeObjectRelease();
  id v18 = objc_allocWithZone((Class)NSNumber);
  *(float *)&double v19 = a3;
  id v20 = [v18 initWithFloat:v19];
  char v21 = swift_isUniquelyReferenced_nonNull_native();
  sub_100973904((uint64_t)v20, 0x726168536E696F6ALL, 0xEE0061746C654465, v21);
  swift_bridgeObjectRelease();
  id v22 = objc_allocWithZone((Class)NSNumber);
  *(float *)&double v23 = a4;
  id v24 = [v22 initWithFloat:v23];
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_100973904((uint64_t)v24, 0x616F426863746566, 0xEF61746C65446472, v25);
  swift_bridgeObjectRelease();
  id v26 = objc_allocWithZone((Class)NSNumber);
  *(float *)&double v27 = a5;
  id v28 = [v26 initWithFloat:v27];
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  sub_100973904((uint64_t)v28, 0x6C6C6F436E696F6ALL, 0xEF61746C65446261, v29);
  swift_bridgeObjectRelease();
  v30 = self;
  NSString v31 = String._bridgeToObjectiveC()();
  sub_10057BCD8();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v30 sendEventInDomain:v31 lazily:1 eventPayload:isa];
}

@end