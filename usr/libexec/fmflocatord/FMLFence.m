@interface FMLFence
+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3;
- (FenceScheduleProtocol)schedule;
- (NSString)description;
- (NSString)identifier;
- (_TtC11fmflocatord8FMLFence)init;
- (double)latitude;
- (double)longitude;
- (double)radius;
@end

@implementation FMLFence

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)latitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude);
}

- (double)longitude
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude);
}

- (double)radius
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11fmflocatord8FMLFence_radius);
}

- (FenceScheduleProtocol)schedule
{
  NSString v2 = (void *)swift_unknownObjectRetain();

  return (FenceScheduleProtocol *)v2;
}

+ (BOOL)isAllowedAtLocation:(CLLocationCoordinate2D)a3
{
  return static Fence.isAllowed(at:)() & 1;
}

- (NSString)description
{
  NSString v2 = self;
  sub_100032E9C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC11fmflocatord8FMLFence)init
{
  result = (_TtC11fmflocatord8FMLFence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end