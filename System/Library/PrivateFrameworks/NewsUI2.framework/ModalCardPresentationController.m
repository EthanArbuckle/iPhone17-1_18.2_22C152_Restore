@interface ModalCardPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (_TtC7NewsUI231ModalCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissModal;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation ModalCardPresentationController

- (_TtC7NewsUI231ModalCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC7NewsUI231ModalCardPresentationController *)sub_1DEDCAB60(v5, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  double v3 = sub_1DEDCAD4C();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_1DEDCAF28();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1DEDCB4D8();
}

- (void)dismissModal
{
  v2 = self;
  id v3 = [(ModalCardPresentationController *)v2 presentingViewController];
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231ModalCardPresentationController_effectView));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7NewsUI231ModalCardPresentationController_observation);
}

@end