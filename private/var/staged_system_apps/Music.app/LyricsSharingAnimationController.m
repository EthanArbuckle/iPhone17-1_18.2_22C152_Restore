@interface LyricsSharingAnimationController
- (_TtC5Music32LyricsSharingAnimationController)init;
- (id)interruptibleAnimatorForTransition:(id)a3;
@end

@implementation LyricsSharingAnimationController

- (id)interruptibleAnimatorForTransition:(id)a3
{
  unsigned __int8 v5 = self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music32LyricsSharingAnimationController_didPrepareAnimations];
  swift_unknownObjectRetain();
  v6 = self;
  if ((v5 & 1) == 0) {
    sub_1003BB39C(a3);
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for LyricsSharingAnimationController();
  id v7 = [(LyricsSharingAnimationController *)&v9 interruptibleAnimatorForTransition:a3];
  swift_unknownObjectRelease();

  return v7;
}

- (_TtC5Music32LyricsSharingAnimationController)init
{
  result = (_TtC5Music32LyricsSharingAnimationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->_UISheetAnimationController_opaque[OBJC_IVAR____TtC5Music32LyricsSharingAnimationController_sourceViewController];
}

@end