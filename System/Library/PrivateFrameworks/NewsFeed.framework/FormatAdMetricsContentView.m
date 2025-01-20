@interface FormatAdMetricsContentView
- (_TtC8NewsFeed26FormatAdMetricsContentView)initWithCoder:(id)a3;
- (_TtC8NewsFeed26FormatAdMetricsContentView)initWithFrame:(CGRect)a3;
- (int64_t)privacyMarkerPosition;
@end

@implementation FormatAdMetricsContentView

- (int64_t)privacyMarkerPosition
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed26FormatAdMetricsContentView_privacyMarkerPosition);
}

- (_TtC8NewsFeed26FormatAdMetricsContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed26FormatAdMetricsContentView_privacyMarkerPosition) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[FormatAdMetricsContentView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed26FormatAdMetricsContentView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed26FormatAdMetricsContentView_privacyMarkerPosition) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(FormatAdMetricsContentView *)&v7 initWithCoder:a3];
}

@end