@interface _UIKeyboardSubstitutePhonePresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)handlePan:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIKeyboardSubstitutePhonePresentationController

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_185A7BC1C();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v3 = self;
  sub_185A7ED18();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_185A7BFC4();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v3 = self;
  sub_185A7EE00();
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2 = sub_185A7D1B8(self, (uint64_t)a2, sub_185A7C24C);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
}

- (void)handlePan:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    double v5 = self;
  }
  sub_185A7CA54();

  sub_1853BFC80((uint64_t)v6);
}

- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *)sub_185A7EEC0((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController_grabberView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController_grabberPanGestureRecognizer);
}

@end