@interface SecurityApplicator
+ (id)supportedConfigurationTypes;
- (_TtC18SecuritySubscriber18SecurityApplicator)init;
- (_TtC18SecuritySubscriber18SecurityApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation SecurityApplicator

- (_TtC18SecuritySubscriber18SecurityApplicator)init
{
  id v3 = [objc_allocWithZone((Class)type metadata accessor for SecurityAdapter()) init];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SecurityApplicator();
  v4 = [(SecurityApplicator *)&v6 initWithAdapter:v3 inPlaceUpdates:1];

  return v4;
}

+ (id)supportedConfigurationTypes
{
  sub_10000BDD0();
  v2.super.isa = sub_100010828().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (_TtC18SecuritySubscriber18SecurityApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  swift_unknownObjectRetain();
  result = (_TtC18SecuritySubscriber18SecurityApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end