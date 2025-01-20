@interface PuzzleEmbedViewController
- (UIView)inputAccessoryView;
- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)keyboardWillChangeFrameWithNotification:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PuzzleEmbedViewController

- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0C8B1B8();
}

- (void)viewDidLoad
{
  v2 = self;
  PuzzleEmbedViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  PuzzleEmbedViewController.viewDidLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[PuzzleEmbedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_presentationManager], sel_setPresentationState_, 2, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();
}

- (UIView)inputAccessoryView
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController), sel_inputAccessoryView);
  return (UIView *)v2;
}

- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed25PuzzleEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_errorView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_onReuse));
  swift_bridgeObjectRelease();
  sub_1C0C8B578((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_puzzleData, qword_1EB896E10, (uint64_t (*)(uint64_t))type metadata accessor for PuzzleData);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_puzzleAccessArbiter);
  swift_unknownObjectRelease();
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_feedConfiguration));
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_onEmbedInteraction));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_textInputTraits));
  id v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_puzzleDifficultyDescriptionProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4 = sub_1C151559C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151556C();
  objc_super v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController);
  sub_1BFC39268(0, &qword_1EA1A5530);
  v9 = self;
  v10 = (void *)sub_1C151EBAC();
  v11 = (void *)sub_1C151EBAC();
  objc_msgSend(v8, sel_setShortcutsBarWithLeadingGroups_trailingGroups_, v10, v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end