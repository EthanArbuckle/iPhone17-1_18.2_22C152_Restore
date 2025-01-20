@interface _UIPinchDismissSubInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC5UIKit29_UIPinchDismissSubInteraction)init;
- (void)didMoveToView:(id)a3;
- (void)handlePinch:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIPinchDismissSubInteraction

- (_TtC5UIKit29_UIPinchDismissSubInteraction)init
{
  return (_TtC5UIKit29_UIPinchDismissSubInteraction *)sub_1858B7ED8();
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B8104(a3);
}

- (void)didMoveToView:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit29_UIPinchDismissSubInteraction_gesture);
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
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____TtC5UIKit29_UIPinchDismissSubInteraction_view, a2);
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
}

- (void)handlePinch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_185B2059C(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit29_UIPinchDismissSubInteraction_gesture);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_185B230AC();

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  if (!objc_msgSend(v7, sel__isGestureType_, 19)
    || (id v9 = objc_msgSend(v7, sel_view)) == 0)
  {

LABEL_6:
    BOOL v17 = 0;
    goto LABEL_7;
  }
  v10 = v9;
  self;
  v11 = (void *)swift_dynamicCastObjCClass();
  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = v11;
  objc_msgSend(v11, sel_zoomScale);
  double v14 = v13;
  objc_msgSend(v12, sel_minimumZoomScale);
  double v16 = v15;

  BOOL v17 = v14 <= v16;
LABEL_7:

  return v17;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_185B2321C(v6, v7);

  return v9 & 1;
}

@end