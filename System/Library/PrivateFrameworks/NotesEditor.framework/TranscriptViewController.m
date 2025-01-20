@interface TranscriptViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC11NotesEditor24TranscriptViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditor24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)consumedBottomAreaForResizer:(id)a3;
- (double)topInsetForResizer:(id)a3;
- (id)keyboardResizerScrollView;
- (void)audioDidStopWithNotification:(id)a3;
- (void)audioPlaybackTimeDidChangeWithNotification:(id)a3;
- (void)dealloc;
- (void)inactivityTimerFired;
- (void)loadView;
- (void)longPress:(void *)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)tap:(id)a3;
- (void)userDidInteract;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TranscriptViewController

- (_TtC11NotesEditor24TranscriptViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20C139854();
}

- (void)loadView
{
  v2 = self;
  sub_20C131A6C();
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TranscriptViewController();
  [(TranscriptViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController____lazy_storage___scrollViewResizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_selectionFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_selectActiveSegmentGR));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_longPressRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_audioController));
  sub_20C1396E8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_representableAdapter), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_representableAdapter));
  swift_release();
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_lastScrolledDate, (uint64_t *)&unk_2676BE0E0);
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_activeSegment, &qword_2676BFD30);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TranscriptViewController();
  id v4 = v8.receiver;
  [(TranscriptViewController *)&v8 viewWillAppear:v3];
  sub_20C1322A0();
  id v5 = objc_msgSend(v4, sel_view, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    type metadata accessor for TranscriptView();
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_setScrollsToTop_, 1);

    id v7 = sub_20C13112C();
    objc_msgSend(v7, sel_startAutoResizing);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_20C132040(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscriptViewController();
  id v4 = v6.receiver;
  [(TranscriptViewController *)&v6 viewWillDisappear:v3];
  id v5 = sub_20C13112C();
  objc_msgSend(v5, sel_stopAutoResizing, v6.receiver, v6.super_class);

  sub_20C137FF4();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676BE0E0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_currentlyDragging) = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_currentlyScrolling) = 1;
  id v8 = a3;
  v9 = self;
  sub_20C15F6F0();
  uint64_t v10 = sub_20C15F700();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_20C139D5C((uint64_t)v7, v11);
  swift_endAccess();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676BE0E0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)self + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_previousContentOffset;
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_currentlyDragging) = 0;
  id v11 = a3;
  uint64_t v12 = self;
  sub_20C15F6F0();
  uint64_t v13 = sub_20C15F700();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  uint64_t v14 = (uint64_t)v12 + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_20C139D5C((uint64_t)v9, v14);
  swift_endAccess();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676BE0E0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_currentlyScrolling) = 0;
  id v8 = a3;
  v9 = self;
  sub_20C15F6F0();
  uint64_t v10 = sub_20C15F700();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_lastScrolledDate;
  swift_beginAccess();
  sub_20C139D5C((uint64_t)v7, v11);
  swift_endAccess();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v10 = self;
  objc_msgSend(v4, sel_contentOffset);
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(v4, sel_contentSize);
  sub_20C132934((char *)v4, v6, v8, v9);
}

- (void)audioPlaybackTimeDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  double v8 = self;
  sub_20C1354D0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)audioDidStopWithNotification:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  double v8 = self;
  sub_20C135884();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)tap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C13720C(v4);
}

- (void)longPress:(void *)a3
{
  uint64_t v4 = OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer;
  uint64_t v5 = *(void **)&a1[OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer];
  id v6 = a3;
  double v7 = a1;
  objc_msgSend(v5, sel_invalidate);
  id v8 = objc_msgSend(self, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_inactivityTimerFired, 0, 0, 5.0);
  id v9 = *(id *)&a1[v4];
  *(void *)&a1[v4] = v8;
}

- (void)userDidInteract
{
  uint64_t v3 = OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer;
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor24TranscriptViewController_interactionTimer);
  uint64_t v5 = self;
  objc_msgSend(v4, sel_invalidate);
  id v6 = (objc_class *)objc_msgSend(self, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v5, sel_inactivityTimerFired, 0, 0, 5.0);
  id v7 = *(Class *)((char *)&self->super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.isa + v3) = v6;
}

- (void)inactivityTimerFired
{
  v2 = self;
  sub_20C137658();
}

- (_TtC11NotesEditor24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor24TranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (double)topInsetForResizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(TranscriptViewController *)v5 inputAccessoryView];

  if (!v6)
  {

    return 0.0;
  }
  id v7 = [(TranscriptViewController *)v5 view];
  if (v7)
  {
    id v9 = v7;
    type metadata accessor for TranscriptView();
    objc_msgSend((id)swift_dynamicCastClassUnconditional(), sel_textContainerInset);
    double v11 = v10;

    return v11;
  }
  __break(1u);
  return result;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C139AA4();
  double v7 = v6;

  return v7;
}

- (id)keyboardResizerScrollView
{
  v2 = self;
  id result = [(TranscriptViewController *)v2 view];
  if (result)
  {

    type metadata accessor for TranscriptView();
    id v4 = (void *)swift_dynamicCastClassUnconditional();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end