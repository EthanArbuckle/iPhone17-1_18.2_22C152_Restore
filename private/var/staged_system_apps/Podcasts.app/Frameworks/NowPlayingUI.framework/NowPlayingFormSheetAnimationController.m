@interface NowPlayingFormSheetAnimationController
- (_TtC12NowPlayingUI38NowPlayingFormSheetAnimationController)init;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
@end

@implementation NowPlayingFormSheetAnimationController

- (id)interruptibleAnimatorForTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_66D20(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)animationEnded:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_67B20(v3);
}

- (_TtC12NowPlayingUI38NowPlayingFormSheetAnimationController)init
{
  result = (_TtC12NowPlayingUI38NowPlayingFormSheetAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end