@interface ContextActionPresentationController
- (BOOL)shouldRemovePresentersView;
- (_TtC12NowPlayingUI35ContextActionPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
@end

@implementation ContextActionPresentationController

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_F1DD0();
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_F216C();
}

- (_TtC12NowPlayingUI35ContextActionPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC12NowPlayingUI35ContextActionPresentationController *)sub_F2470((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI35ContextActionPresentationController_backgroundView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI35ContextActionPresentationController_dismissalAnimations);

  sub_FB70(v3);
}

@end