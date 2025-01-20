@interface JSMenuItem
- (NSString)description;
@end

@implementation JSMenuItem

- (NSString)description
{
  v2 = self;
  JSMenuItem.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end