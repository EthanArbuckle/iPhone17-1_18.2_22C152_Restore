@interface ContentLoaderPlaceholderView
- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithCoder:(id)a3;
- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation ContentLoaderPlaceholderView

- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5BD00();
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_watchdogTimer);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ContentLoaderPlaceholderView();
  [(ContentLoaderPlaceholderView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_scrollView));
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_url, (uint64_t *)&unk_400C70);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView_watchdogTimer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView____lazy_storage___activityIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8BookEPUB28ContentLoaderPlaceholderView____lazy_storage___reloadView);
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5AA48((uint64_t)a3);
}

- (_TtC8BookEPUB28ContentLoaderPlaceholderView)initWithFrame:(CGRect)a3
{
}

@end