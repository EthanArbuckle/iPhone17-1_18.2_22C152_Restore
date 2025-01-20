@interface MetricsSessionCell
- (_TtC8VideosUI18MetricsSessionCell)initWithCoder:(id)a3;
- (_TtC8VideosUI18MetricsSessionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MetricsSessionCell

- (_TtC8VideosUI18MetricsSessionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32603C0();
}

- (_TtC8VideosUI18MetricsSessionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4) {
    sub_1E387C928();
  }
  return (_TtC8VideosUI18MetricsSessionCell *)sub_1E3260450(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MetricsSessionCell____lazy_storage___sessionTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MetricsSessionCell____lazy_storage___startDateLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI18MetricsSessionCell____lazy_storage___numEventsLabel);
}

@end