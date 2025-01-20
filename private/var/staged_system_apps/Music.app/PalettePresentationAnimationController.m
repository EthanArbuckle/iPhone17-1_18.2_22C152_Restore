@interface PalettePresentationAnimationController
- (_TtC5Music38PalettePresentationAnimationController)init;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
@end

@implementation PalettePresentationAnimationController

- (_TtC5Music38PalettePresentationAnimationController)init
{
  result = (_TtC5Music38PalettePresentationAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music38PalettePresentationAnimationController_easingAnimator];
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music38PalettePresentationAnimationController_isPrepared];
  swift_unknownObjectRetain();
  v6 = self;
  if ((v5 & 1) == 0) {
    sub_1004B24E4(a3);
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
  sub_1004B3F00(a3);
}

@end