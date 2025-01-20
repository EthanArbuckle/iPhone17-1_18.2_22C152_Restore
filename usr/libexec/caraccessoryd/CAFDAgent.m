@interface CAFDAgent
- (NSString)domain;
- (_TtC13caraccessoryd9CAFDAgent)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation CAFDAgent

- (_TtC13caraccessoryd9CAFDAgent)init
{
  result = (_TtC13caraccessoryd9CAFDAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of CAFDAgent.Configuration((uint64_t)self + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration);

  swift_bridgeObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  specialized CAFDAgent.listener(_:didReceive:withContext:)(v8);

  swift_unknownObjectRelease();
}

- (NSString)domain
{
  type metadata accessor for CAFDAgent.Configuration(0);
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end