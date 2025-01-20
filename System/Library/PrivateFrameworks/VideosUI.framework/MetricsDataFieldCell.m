@interface MetricsDataFieldCell
- (_TtC8VideosUI20MetricsDataFieldCell)initWithCoder:(id)a3;
- (_TtC8VideosUI20MetricsDataFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MetricsDataFieldCell

- (_TtC8VideosUI20MetricsDataFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4) {
    sub_1E387C928();
  }
  return (_TtC8VideosUI20MetricsDataFieldCell *)sub_1E3672204(a3);
}

- (_TtC8VideosUI20MetricsDataFieldCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3672314();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldValueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___viewMargin);
}

@end