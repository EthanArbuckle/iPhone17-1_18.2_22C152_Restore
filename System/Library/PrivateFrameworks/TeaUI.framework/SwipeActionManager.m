@interface SwipeActionManager
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC5TeaUI18SwipeActionManager)init;
- (void)handlePanGestureWithRecognizer:(id)a3;
- (void)handleTapGestureWithRecognizer:(id)a3;
@end

@implementation SwipeActionManager

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B60FEFD4(v4);

  return self & 1;
}

- (void)handlePanGestureWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B60FF8EC(v4);
}

- (void)handleTapGestureWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B6101154(v4);
}

- (_TtC5TeaUI18SwipeActionManager)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_sceneStateManager);
  swift_unknownObjectWeakDestroy();
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_dataSource);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_delegate);
  sub_1B6103E80((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_swipeState, qword_1EB63DDF8, type metadata accessor for SwipeActionState);
}

@end