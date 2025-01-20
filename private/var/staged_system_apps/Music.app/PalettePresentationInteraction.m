@interface PalettePresentationInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC5Music30PalettePresentationInteraction)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)panGestureRecognized:(id)a3;
- (void)setView:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PalettePresentationInteraction

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000AC08(a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000E44C(a3);
}

- (_TtC5Music30PalettePresentationInteraction)init
{
  return (_TtC5Music30PalettePresentationInteraction *)sub_100044E04();
}

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view) = (Class)a3;
  id v3 = a3;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 state] == (id)3
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController))
  {
    sub_1007AFD78(0, 0);
  }
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 state] == (id)1
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController))
  {
    sub_1007AFD78(0, 0);
  }
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction____lazy_storage___presentationSetupSignpost, &qword_1010BA540);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction____lazy_storage___presentationSignpost, &qword_1010BA540);
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_delegate);
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_transitioningDelegate);
  swift_unknownObjectWeakDestroy();

  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_viewProvider, (uint64_t *)&unk_1010AB7B0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_panGestureRecognizer));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_panGestureRecognizer);
  sub_100057778(0, &qword_10109BAD8);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = v7;
  LOBYTE(a3) = static NSObject.== infix(_:_:)();

  return (a3 & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1007B0710();

  return self & 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = sub_1007B0D4C(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1007B0908(v4);

  return v6;
}

@end