@interface _UISwipeDownDismissSubInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC5UIKit33_UISwipeDownDismissSubInteraction)init;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)handlePan:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UISwipeDownDismissSubInteraction

- (_TtC5UIKit33_UISwipeDownDismissSubInteraction)init
{
  sub_1858B71B0();
  return result;
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B7548(a3);
}

- (void)didMoveToView:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit33_UISwipeDownDismissSubInteraction_gesture);
  v7 = self;
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_view);

  if (!v6) {
    objc_msgSend(v5, sel_addGestureRecognizer_, v4);
  }
  swift_unknownObjectWeakAssign();
}

- (UIView)view
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____TtC5UIKit33_UISwipeDownDismissSubInteraction_view, a2);
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A04D18(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_185A05A30();

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_185A05AF4(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_185A05BD0(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A05CC0();
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A05598(v4);
}

@end