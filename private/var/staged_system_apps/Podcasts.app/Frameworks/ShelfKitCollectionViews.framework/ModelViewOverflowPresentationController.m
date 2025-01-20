@interface ModelViewOverflowPresentationController
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (int64_t)adaptivePresentationStyle;
- (int64_t)presentationStyle;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)dismissTapDidChange:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)scrollPanDidChange:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ModelViewOverflowPresentationController

- (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_16C7F8(v5, a4);
  return result;
}

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v2 = self;
  sub_16CBEC();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  double v7 = self;
  sub_16CF08((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)containerViewWillLayoutSubviews
{
  id v6 = self;
  v2 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)[(ModelViewOverflowPresentationController *)v6 containerView];
  if (v2)
  {
    double v3 = v2;
    [(ModelViewOverflowPresentationController *)v2 bounds];
    [*(id *)((char *)&v6->super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView) setFrame:];
    id v4 = objc_retain(*(id *)((char *)&v6->super.super.isa
                           + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
    sub_16CBEC();
    [v4 setFrame:];

    double v5 = v3;
  }
  else
  {
    double v5 = v6;
  }
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_16D2E0();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  id v4 = self;
  sub_16D780(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_16D8D0();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3) {
    [*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView) removeFromSuperview];
  }
}

- (void)dismissTapDidChange:(id)a3
{
  id v4 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)a3;
  id v6 = self;
  if ([(ModelViewOverflowPresentationController *)v4 state] == (char *)&dword_0 + 3)
  {
    double v5 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)[(ModelViewOverflowPresentationController *)v6 presentedViewController];
    [(ModelViewOverflowPresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    id v4 = v6;
    id v6 = v5;
  }
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_16DD58(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_isScrollDismissActive) == 1)
  {
    if (a3)
    {
      id v4 = a3;
      double v5 = self;
      [v4 adjustedContentInset];
      [v4 contentOffset];
      [v4 setContentOffset:];
    }
    else
    {
      __break(1u);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_dismissTapGestureRecognizer));
  sub_E544((uint64_t)self+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_interactiveDismissal, &qword_478818);

  swift_unknownObjectWeakDestroy();
}

@end