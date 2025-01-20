@interface AVDismissalBehavior
- (_TtC9SeymourUI19AVDismissalBehavior)init;
- (void)seymourBehaviorContext:(id)a3 didRecieveDoneButtonTapWithDismissalBlock:(id)a4;
- (void)willMoveToContext:(id)a3;
@end

@implementation AVDismissalBehavior

- (void)willMoveToContext:(id)a3
{
  self;
  id v3 = (id)swift_dynamicCastObjCClass();
  if (v3) {
    swift_unknownObjectRetain();
  }
  swift_unknownObjectWeakAssign();
}

- (void)seymourBehaviorContext:(id)a3 didRecieveDoneButtonTapWithDismissalBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_23A092DD0((uint64_t)sub_23A092DC0, v7);

  swift_release();
}

- (_TtC9SeymourUI19AVDismissalBehavior)init
{
  swift_unknownObjectWeakInit();
  *(AVSeymourBehaviorContext **)((char *)&self->super._behaviorContext
                               + OBJC_IVAR____TtC9SeymourUI19AVDismissalBehavior_delegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AVDismissalBehavior();
  return [(AVDismissalBehavior *)&v4 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI19AVDismissalBehavior_delegate;

  sub_239C1AE10((uint64_t)v3);
}

@end