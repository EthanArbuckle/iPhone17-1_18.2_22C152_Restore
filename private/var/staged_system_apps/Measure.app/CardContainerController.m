@interface CardContainerController
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC7Measure23CardContainerController)init;
- (void)caDisplayLinkCallback;
- (void)dealloc;
- (void)handlePanGestureWithSender:(id)a3;
@end

@implementation CardContainerController

- (void)caDisplayLinkCallback
{
  v2 = self;
  sub_1001B7B98();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1001B8B74();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(CardContainerController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure23CardContainerController_containerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure23CardContainerController_containerTopConstraint));

  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC7Measure23CardContainerController__lockingState;
  uint64_t v4 = sub_100012894(&qword_1004D01E8);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7Measure23CardContainerController__animationLockingState, v4);
  swift_release();

  swift_unknownObjectUnownedDestroy();
}

- (void)handlePanGestureWithSender:(id)a3
{
  uint64_t v4 = (char *)a3;
  objc_super v5 = self;
  sub_1001B9DA0(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_1001BAF98(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1001BB138(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4) {
    return 1;
  }
  [v4 velocityInView:*(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure23CardContainerController_containerView)+ OBJC_IVAR____TtC7Measure17CardContainerView_draggableView)];
  return fabs(v6) < fabs(v5);
}

- (_TtC7Measure23CardContainerController)init
{
  result = (_TtC7Measure23CardContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end