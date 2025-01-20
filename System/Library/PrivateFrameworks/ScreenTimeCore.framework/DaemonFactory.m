@interface DaemonFactory
+ (id)makeDaemon;
- (_TtC15ScreenTimeAgent13DaemonFactory)init;
@end

@implementation DaemonFactory

+ (id)makeDaemon
{
  type metadata accessor for ConcreteDependencyFactory();
  swift_allocObject();
  sub_100210FC0();
  uint64_t v3 = v2;
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for Daemon());
  id v5 = sub_1002261A0(v3, v4);
  return v5;
}

- (_TtC15ScreenTimeAgent13DaemonFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DaemonFactory();
  return [(DaemonFactory *)&v3 init];
}

@end