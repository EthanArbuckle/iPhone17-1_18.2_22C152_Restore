@interface LyricsTextViewController
- (_TtC12NowPlayingUI24LyricsTextViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI24LyricsTextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_viewToAddFocusLayer;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation LyricsTextViewController

- (_TtC12NowPlayingUI24LyricsTextViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_FAEE0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_FA598();
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LyricsTextViewController();
  v2 = (char *)v4.receiver;
  [(LyricsTextViewController *)&v4 viewDidLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textView];
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (_TtC12NowPlayingUI24LyricsTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI24LyricsTextViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_metrics);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_textView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24LyricsTextViewController_attributedLyricsText);
}

@end