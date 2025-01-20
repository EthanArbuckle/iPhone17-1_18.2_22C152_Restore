@interface _UIEdgePanDismissSubInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC5UIKit31_UIEdgePanDismissSubInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)handlePan:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIEdgePanDismissSubInteraction

- (_TtC5UIKit31_UIEdgePanDismissSubInteraction)init
{
  return (_TtC5UIKit31_UIEdgePanDismissSubInteraction *)sub_1858B7784();
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B79E8(a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B7B40(a3);
}

- (UIView)view
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____TtC5UIKit31_UIEdgePanDismissSubInteraction_view, a2);
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185A87260(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit31_UIEdgePanDismissSubInteraction_gesture);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_185A879FC();

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_185A87688(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_185A87AC0(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_185A87C84();

  return self & 1;
}

@end