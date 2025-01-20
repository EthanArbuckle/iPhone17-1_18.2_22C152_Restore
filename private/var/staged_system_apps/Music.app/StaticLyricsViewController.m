@interface StaticLyricsViewController
- (_TtC5Music26StaticLyricsViewController)initWithCoder:(id)a3;
- (_TtC5Music26StaticLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation StaticLyricsViewController

- (_TtC5Music26StaticLyricsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002DDF3C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002D8400();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticLyricsViewController();
  v4 = v5.receiver;
  [(StaticLyricsViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC5Music26StaticLyricsViewController_isVisible] = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticLyricsViewController();
  v4 = v5.receiver;
  [(StaticLyricsViewController *)&v5 viewDidDisappear:v3];
  sub_1002DB990();
  v4[OBJC_IVAR____TtC5Music26StaticLyricsViewController_isVisible] = 0;
}

- (_TtC5Music26StaticLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music26StaticLyricsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController_song;
  uint64_t v4 = type metadata accessor for Song();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_modelPlayEvent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26StaticLyricsViewController_lyricsLoader));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController_lyricsVisibilityStart, &qword_1010A9820);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music26StaticLyricsViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_10109B9A0);
}

@end