@interface CSDVoIPDOSCache
- (BOOL)shouldAllowCallFor:(id)a3;
- (CSDVoIPDOSCache)init;
@end

@implementation CSDVoIPDOSCache

- (CSDVoIPDOSCache)init
{
  return (CSDVoIPDOSCache *)sub_1003A44FC();
}

- (BOOL)shouldAllowCallFor:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1003A4590(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end