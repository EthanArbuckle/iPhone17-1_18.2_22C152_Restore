@interface TranscriptDetailPresentationInteraction
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)view;
- (_TtC11NotesEditor39TranscriptDetailPresentationInteraction)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)pan:(id)a3;
- (void)setView:(id)a3;
- (void)tap:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation TranscriptDetailPresentationInteraction

- (UIView)view
{
  return (UIView *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_view);
}

- (void)setView:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_view);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C083F18();
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_20C0783A0(a3);
}

- (void)tap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3) {
    sub_20C078644();
  }
}

- (void)pan:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)1) {
    sub_20C078644();
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_20C083FBC();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_20C0840B8();

  return v6;
}

- (_TtC11NotesEditor39TranscriptDetailPresentationInteraction)init
{
  result = (_TtC11NotesEditor39TranscriptDetailPresentationInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_view));
  sub_20BFCEB78((uint64_t)self + OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_tapGestureRecognizer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11NotesEditor39TranscriptDetailPresentationInteraction_panGestureRecognizer);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char ShouldBeginySbSo09UIGestureH0CF_0 = _s11NotesEditor39TranscriptDetailPresentationInteractionC28gestureRecognizerShouldBeginySbSo09UIGestureH0CF_0(v4);

  return ShouldBeginySbSo09UIGestureH0CF_0 & 1;
}

@end