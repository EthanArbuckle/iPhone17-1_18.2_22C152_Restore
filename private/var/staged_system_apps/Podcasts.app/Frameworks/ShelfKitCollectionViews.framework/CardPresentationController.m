@interface CardPresentationController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIButton)accessibilityDismissButton;
- (_TtC23ShelfKitCollectionViews26CardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)containerViewWillLayoutSubviews;
- (void)didTap:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation CardPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  double v3 = sub_302F1C();
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

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_3030BC((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_303268();
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_3033EC();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v4 = (char *)v5.receiver;
  [(CardPresentationController *)&v5 presentationTransitionDidEnd:v3];
  if (!v3)
  {
    [*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_cardRim] removeFromSuperview];
    [*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView] removeFromSuperview];
  }
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_303DF0();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  double v4 = (char *)v5.receiver;
  [(CardPresentationController *)&v5 dismissalTransitionDidEnd:v3];
  if (v3) {
    [*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView] removeFromSuperview];
  }
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  id v6 = [(CardPresentationController *)v5 presentedViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView);
  id v5 = a3;
  id v6 = self;
  [v5 locationInView:v4];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(CardPresentationController *)v6 presentedViewController];
  id v12 = [v11 view];

  if (v12)
  {
    [v12 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v24.origin.x = v15;
    v24.origin.y = v17;
    v24.size.width = v19;
    v24.size.height = v21;
    v23.x = v8;
    v23.y = v10;
    BOOL v22 = CGRectContainsPoint(v24, v23);

    return !v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIButton)accessibilityDismissButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dismissButton));
}

- (_TtC23ShelfKitCollectionViews26CardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL result = (_TtC23ShelfKitCollectionViews26CardPresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_sourceViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_shadowView));
  BOOL v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_cardRim);
}

@end