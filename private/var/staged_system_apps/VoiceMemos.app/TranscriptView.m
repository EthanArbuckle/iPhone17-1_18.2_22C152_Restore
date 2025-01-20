@interface TranscriptView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC10VoiceMemos14TranscriptView)initWithCoder:(id)a3;
- (_TtC10VoiceMemos14TranscriptView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)didReceivePan:(id)a3;
- (void)didReceiveTap:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchButtonTapped;
- (void)selectAll:(id)a3;
- (void)textView:(id)a3 willDismissEditMenuWithAnimator:(id)a4;
- (void)textView:(id)a3 willPresentEditMenuWithAnimator:(id)a4;
@end

@implementation TranscriptView

- (_TtC10VoiceMemos14TranscriptView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100142248();
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TranscriptView();
  v2 = (char *)v4.receiver;
  [(TranscriptView *)&v4 didMoveToSuperview];
  id v3 = [v2 superview];

  if (!v3) {
    [*(id *)&v2[OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textView] setSelectedRange:0, 0];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranscriptView();
  id v2 = v3.receiver;
  [(TranscriptView *)&v3 layoutSubviews];
  sub_10014034C();
}

- (void)didReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001409F4(v4);
}

- (void)didReceivePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100140BF8(v4);
}

- (void)searchButtonTapped
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textView);
  v6 = self;
  objc_super v3 = (_TtC10VoiceMemos14TranscriptView *)[v2 findInteraction];
  if (v3)
  {
    id v4 = v3;
    [(TranscriptView *)v3 presentFindNavigatorShowingReplace:0];

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textView);
  id v5 = a3;
  v7 = self;
  if (([v4 isScrollAnimating] & 1) == 0)
  {
    v6 = (char *)v7 + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_animatedContentOffsetTarget;
    *(void *)v6 = 0;
    *((void *)v6 + 1) = 0;
    v6[16] = 1;
    sub_10000E138();
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v10 = self;
  id v5 = [v4 panGestureRecognizer];
  [v5 velocityInView:v4];
  double v7 = v6;
  double v9 = v8;

  sub_10001510C((Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller), *(void *)&v10->controller[OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller + 16]);
  sub_10014E110(v7, v9);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  double v6 = self;
  sub_100142470();
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_animatedContentOffsetTarget;
  *(void *)id v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  id v5 = a3;
  double v6 = self;
  sub_10000E138();
}

- (void)textView:(id)a3 willPresentEditMenuWithAnimator:(id)a4
{
}

- (void)textView:(id)a3 willDismissEditMenuWithAnimator:(id)a4
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_100141430(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_100141574(v6);

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = self;
  }
  unsigned __int8 v8 = sub_1001416CC((uint64_t)a3, (uint64_t)v10);

  sub_1000285F8((uint64_t)v10, &qword_100265A10);
  return v8 & 1;
}

- (void)selectAll:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1001419A4((uint64_t)v6);

  sub_1000285F8((uint64_t)v6, &qword_100265A10);
}

- (_TtC10VoiceMemos14TranscriptView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_10002343C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_viewModel);
  sub_10002F48C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_controller);

  sub_100142888((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_layoutHelper);
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textUpdateHelper);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textBottomAnchorToLayoutMarginsBottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textBottomAnchorToSearchTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textViewTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos14TranscriptView_textViewPanGestureRecognizer));

  swift_bridgeObjectRelease();
}

@end