@interface PalettePresentationInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC12NowPlayingUI30PalettePresentationInteraction)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)panGestureRecognized:(id)a3;
- (void)setView:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_105018(a3);
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 state] == (char *)&dword_0 + 3
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController))
  {
    sub_10562C(0, 0);
  }
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 state] == (char *)&dword_0 + 1
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController))
  {
    sub_10562C(0, 0);
  }
}

- (_TtC12NowPlayingUI30PalettePresentationInteraction)init
{
  result = (_TtC12NowPlayingUI30PalettePresentationInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A608((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_presentedViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_accessoryViewFrameObserver));
  sub_1A608((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_transitioningDelegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_panGestureRecognizer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController);
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_105A28(a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_105B84(a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_panGestureRecognizer);
  sub_E67C(0, (unint64_t *)&unk_1A3B80);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = v7;
  LOBYTE(a3) = sub_12A0C0();

  return (a3 & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_105D9C();

  return self & 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = sub_106644(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_10616C(v4);

  return v6;
}

@end