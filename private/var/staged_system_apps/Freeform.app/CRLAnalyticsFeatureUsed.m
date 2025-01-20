@interface CRLAnalyticsFeatureUsed
+ (id)featurePayloadFor:(int64_t)a3;
+ (void)logFeatureUsedWithName:(int64_t)a3;
- (_TtC8Freeform23CRLAnalyticsFeatureUsed)init;
@end

@implementation CRLAnalyticsFeatureUsed

+ (id)featurePayloadFor:(int64_t)a3
{
  _s8Freeform23CRLAnalyticsFeatureUsedC14featurePayload3forSDySSSo8NSObjectCGAA0bC4NameO_tFZ_0(a3);
  sub_10057BCD8();
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

+ (void)logFeatureUsedWithName:(int64_t)a3
{
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  _s8Freeform23CRLAnalyticsFeatureUsedC14featurePayload3forSDySSSo8NSObjectCGAA0bC4NameO_tFZ_0(a3);
  sub_10057BCD8();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 sendEventInDomain:v5 lazily:1 eventPayload:isa];
}

- (_TtC8Freeform23CRLAnalyticsFeatureUsed)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsFeatureUsed();
  return [(CRLAnalyticsFeatureUsed *)&v3 init];
}

@end