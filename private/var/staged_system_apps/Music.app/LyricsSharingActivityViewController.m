@interface LyricsSharingActivityViewController
- (UIViewControllerTransitioningDelegate)transitioningDelegate;
- (_TtC5Music35LyricsSharingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_prepareActivity:(id)a3;
- (void)setTransitioningDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation LyricsSharingActivityViewController

- (UIViewControllerTransitioningDelegate)transitioningDelegate
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController();
  v2 = [(LyricsSharingActivityViewController *)&v4 transitioningDelegate];

  return v2;
}

- (void)setTransitioningDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController();
  objc_super v4 = (char *)v7.receiver;
  swift_unknownObjectRetain();
  [(LyricsSharingActivityViewController *)&v7 setTransitioningDelegate:a3];
  v5 = *(id *)&v4[OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_selectionViewController];
  id v6 = [v4 transitioningDelegate];
  if (v6) {
    swift_unknownObjectRelease();
  }
  v5[OBJC_IVAR____TtC5Music29LyricsSelectionViewController_needsCustomTransition] = v6 != 0;

  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController();
  id v2 = v3.receiver;
  [(LyricsSharingActivityViewController *)&v3 viewDidLoad];
  [v2 setCustomViewControllerVerticalInset:0.0];
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4 = self;
  sub_1001843D4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100185154(a3);
}

- (void)_prepareActivity:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  sub_10018524C(v5);
}

- (_TtC5Music35LyricsSharingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  result = (_TtC5Music35LyricsSharingActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_song;
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_headerMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_selectionViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_lyricsLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_windowBackgroundView));
  sub_1000E0890((uint64_t)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_presentationSource);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_lyricsVisibilityStart, &qword_1010A9820);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end