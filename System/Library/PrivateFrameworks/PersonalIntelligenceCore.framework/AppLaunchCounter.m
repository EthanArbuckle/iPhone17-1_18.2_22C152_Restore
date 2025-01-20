@interface AppLaunchCounter
- (id)enrichMessage:(id)a3 messageName:(id)a4;
@end

@implementation AppLaunchCounter

- (id)enrichMessage:(id)a3 messageName:(id)a4
{
  uint64_t v4 = sub_1CABFC928();
  sub_1CABFC988();
  swift_retain();
  sub_1CABEB568(v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_1CABFC918();
  swift_bridgeObjectRelease();
  return v5;
}

@end