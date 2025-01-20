@interface TimedMetadataDebuggerViewController
- (_TtC8VideosUI35TimedMetadataDebuggerViewController)init;
- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)observeCurrentVendor;
- (void)stopObserving;
@end

@implementation TimedMetadataDebuggerViewController

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)init
{
  return (_TtC8VideosUI35TimedMetadataDebuggerViewController *)sub_1E330964C();
}

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3309BA4();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3309D00();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController_musicText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController_actorsText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___timeRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___musicLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___actorsLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI35TimedMetadataDebuggerViewController____lazy_storage___stackView);
}

- (_TtC8VideosUI35TimedMetadataDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E330C0C0();
}

- (void)observeCurrentVendor
{
  v2 = self;
  sub_1E330C118();
}

- (void)stopObserving
{
  v2 = self;
  sub_1E330C164();
}

@end