@interface StaticLyricsContentViewController
- (_TtC5Music33StaticLyricsContentViewController)initWithCoder:(id)a3;
- (_TtC5Music33StaticLyricsContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation StaticLyricsContentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10071F398();
}

- (void)viewDidLayoutSubviews
{
}

- (void)viewLayoutMarginsDidChange
{
}

- (_TtC5Music33StaticLyricsContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Music33StaticLyricsContentViewController *)sub_100720924(v5, v7, a4);
}

- (_TtC5Music33StaticLyricsContentViewController)initWithCoder:(id)a3
{
  return (_TtC5Music33StaticLyricsContentViewController *)sub_100720B24(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_textColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController_lyricsFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___stackView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music33StaticLyricsContentViewController____lazy_storage___reportConcernButton);
}

@end