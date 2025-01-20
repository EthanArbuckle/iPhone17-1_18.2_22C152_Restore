@interface CHReachableDestination
- (CHReachableDestination)init;
- (NSArray)additionalServiceIdentifiers;
- (NSString)destination;
- (NSString)preferredServiceIdentifier;
@end

@implementation CHReachableDestination

- (NSString)destination
{
  return (NSString *)sub_10060DD9C();
}

- (NSString)preferredServiceIdentifier
{
  return (NSString *)sub_10060DD9C();
}

- (NSArray)additionalServiceIdentifiers
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (CHReachableDestination)init
{
  result = (CHReachableDestination *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end