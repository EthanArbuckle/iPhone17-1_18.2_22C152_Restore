@interface ComponentViewOverflowPresentationController
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (CGRect)frameOfPresentedViewInContainerView;
- (UIView)presentedView;
- (_TtC8AppStore43ComponentViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
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
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ComponentViewOverflowPresentationController

- (_TtC8AppStore43ComponentViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1002A9B14(v5, a4);
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
  sub_1002A9FDC();
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
  sub_1002AA668((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_1002AA964(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)containerViewWillLayoutSubviews
{
  v2 = self;
  sub_1002AAB18();
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_1002AADEC();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  double v4 = self;
  sub_1002AB28C(a3);
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_1002AB3DC();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3) {
    [*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_overlayView) removeFromSuperview];
  }
}

- (void)dismissTapDidChange:(id)a3
{
  double v4 = (_TtC8AppStore43ComponentViewOverflowPresentationController *)a3;
  id v6 = self;
  if ([(ComponentViewOverflowPresentationController *)v4 state] == (id)3)
  {
    double v5 = (_TtC8AppStore43ComponentViewOverflowPresentationController *)[(ComponentViewOverflowPresentationController *)v6 presentedViewController];
    [(ComponentViewOverflowPresentationController *)v5 dismissViewControllerAnimated:1 completion:0];

    double v4 = v6;
    id v6 = v5;
  }
}

- (void)scrollPanDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1002AB788(v4);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa
       + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_isScrollDismissActive) == 1)
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
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_dismissTapGestureRecognizer));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_interactiveDismissal, (uint64_t *)&unk_10098C830);

  swift_unknownObjectWeakDestroy();
}

@end