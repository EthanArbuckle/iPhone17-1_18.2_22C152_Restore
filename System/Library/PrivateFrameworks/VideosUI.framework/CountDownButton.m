@interface CountDownButton
- (_TtC8VideosUI15CountDownButton)initWithCoder:(id)a3;
- (_TtC8VideosUI15CountDownButton)initWithFrame:(CGRect)a3;
- (_TtC8VideosUI15CountDownButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (void)configureWithLayoutProperties;
@end

@implementation CountDownButton

- (_TtC8VideosUI15CountDownButton)initWithCoder:(id)a3
{
  return 0;
}

- (void)configureWithLayoutProperties
{
  v2 = self;
  sub_1E333F9A4();
}

- (_TtC8VideosUI15CountDownButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
}

- (_TtC8VideosUI15CountDownButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15CountDownButton_image));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15CountDownButton____lazy_storage___countDownIndicator);
}

@end