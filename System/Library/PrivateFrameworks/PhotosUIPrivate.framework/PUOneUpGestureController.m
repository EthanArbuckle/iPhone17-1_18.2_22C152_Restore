@interface PUOneUpGestureController
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (PUOneUpGestureController)init;
- (PUOneUpGestureController)initWithView:(id)a3 actionsController:(id)a4;
- (PUOneUpGestureControllerDelegate)delegate;
- (UIEdgeInsets)interactionInsets;
- (UIView)view;
- (void)cancelGestures;
- (void)handleDoubleTapWithRecognizer:(id)a3;
- (void)handleTapWithRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionInsets:(UIEdgeInsets)a3;
@end

@implementation PUOneUpGestureController

- (PUOneUpGestureController)initWithView:(id)a3 actionsController:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (PUOneUpGestureController *)OneUpGestureController.init(view:actionsController:)(v5, (uint64_t)a4);
}

- (PUOneUpGestureControllerDelegate)delegate
{
  v2 = (void *)sub_1AEB20D60();
  return (PUOneUpGestureControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB20DF8();
}

- (UIEdgeInsets)interactionInsets
{
  double v2 = sub_1AEB20F28();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInteractionInsets:(UIEdgeInsets)a3
{
}

- (UIView)view
{
  id v2 = OneUpGestureController.view.getter();
  return (UIView *)v2;
}

- (void)cancelGestures
{
  id v2 = self;
  sub_1AEB210EC();
}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AEB21188(v4);
}

- (void)handleDoubleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AEB212D8(v4);
}

- (PUOneUpGestureController)init
{
}

- (void).cxx_destruct
{
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpGestureController_delegate);

  swift_unknownObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PUOneUpGestureController_doubleTapGestureRecognizer);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIGestureRecognizer *)a3;
  double v5 = self;
  LOBYTE(self) = OneUpGestureController.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = OneUpGestureController.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  id v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  Swift::Bool v9 = OneUpGestureController.gestureRecognizer(_:shouldBeRequiredToFailBy:)(v6, v7);

  return v9;
}

@end