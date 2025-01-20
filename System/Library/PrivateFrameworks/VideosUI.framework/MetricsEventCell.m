@interface MetricsEventCell
- (_TtC8VideosUI16MetricsEventCell)initWithCoder:(id)a3;
- (_TtC8VideosUI16MetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MetricsEventCell

- (_TtC8VideosUI16MetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4) {
    sub_1E387C928();
  }
  return (_TtC8VideosUI16MetricsEventCell *)sub_1E31CC9CC(a3);
}

- (_TtC8VideosUI16MetricsEventCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31CD22C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16MetricsEventCell____lazy_storage___pageTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16MetricsEventCell____lazy_storage___totalTimeView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI16MetricsEventCell____lazy_storage___appearTimeView);
}

@end