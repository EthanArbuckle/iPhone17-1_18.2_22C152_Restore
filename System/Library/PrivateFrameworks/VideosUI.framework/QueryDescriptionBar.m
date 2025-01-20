@interface QueryDescriptionBar
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI19QueryDescriptionBar)init;
- (_TtC8VideosUI19QueryDescriptionBar)initWithCoder:(id)a3;
- (_TtC8VideosUI19QueryDescriptionBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)singlePressWithGesture:(id)a3;
@end

@implementation QueryDescriptionBar

- (void)singlePressWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3581610();
}

- (_TtC8VideosUI19QueryDescriptionBar)init
{
  return (_TtC8VideosUI19QueryDescriptionBar *)sub_1E358171C();
}

- (_TtC8VideosUI19QueryDescriptionBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35817E8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E35822CC(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3582890();
}

- (_TtC8VideosUI19QueryDescriptionBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar____lazy_storage___singlePressGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_queryDescriptionBannerText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_queryDescriptionBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_queryDescriptionBackgroundContentView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI19QueryDescriptionBar_additionalInformationView);
}

@end