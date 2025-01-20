@interface PalettePresentationAnimationController
- (_TtC12NowPlayingUI38PalettePresentationAnimationController)init;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
@end

@implementation PalettePresentationAnimationController

- (_TtC12NowPlayingUI38PalettePresentationAnimationController)init
{
  result = (_TtC12NowPlayingUI38PalettePresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  uint64_t v5 = *(void *)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC12NowPlayingUI38PalettePresentationAnimationController_ascentDescentAnimator];
  swift_unknownObjectRetain();
  v6 = self;
  if (!v5) {
    sub_67CBC(a3);
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for PalettePresentationAnimationController();
  id v7 = [(PalettePresentationAnimationController *)&v9 interruptibleAnimatorForTransition:a3];
  swift_unknownObjectRelease();

  return v7;
}

- (void)animationEnded:(BOOL)a3
{
  v4 = self;
  sub_69528(a3);
}

@end