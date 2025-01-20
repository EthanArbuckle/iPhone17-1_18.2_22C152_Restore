@interface NearbySessionsAdvertiser
+ (id)createWithDelegate:(id)a3;
- (_TtC12mediaremoted24NearbySessionsAdvertiser)init;
@end

@implementation NearbySessionsAdvertiser

+ (id)createWithDelegate:(id)a3
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for NearbySessionsAdvertiserImplementation());
  uint64_t v4 = swift_unknownObjectRetain_n();
  id v5 = sub_100276A74(v4);
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC12mediaremoted24NearbySessionsAdvertiser)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbySessionsAdvertiser();
  return [(NearbySessionsAdvertiser *)&v3 init];
}

@end