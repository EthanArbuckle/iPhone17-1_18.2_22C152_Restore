@interface TSBridgedNewsActivityNavigator
- (TSBridgedNewsActivityNavigator)init;
- (void)navigateWithActivityData:(id)a3;
- (void)navigateWithoutAnimationWithActivityData:(id)a3;
@end

@implementation TSBridgedNewsActivityNavigator

- (void)navigateWithActivityData:(id)a3
{
  id v4 = a3;
  v5 = self;
  BridgedNewsActivityNavigator.navigate(with:)();
}

- (void)navigateWithoutAnimationWithActivityData:(id)a3
{
  id v4 = a3;
  v5 = self;
  BridgedNewsActivityNavigator.navigateWithoutAnimation(with:)();
}

- (TSBridgedNewsActivityNavigator)init
{
  result = (TSBridgedNewsActivityNavigator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end