@interface CarouselViewContainer
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI21CarouselViewContainer)initWithCoder:(id)a3;
- (_TtC8VideosUI21CarouselViewContainer)initWithFrame:(CGRect)a3;
- (void)pageChangeEventWithSender:(id)a3;
@end

@implementation CarouselViewContainer

- (_TtC8VideosUI21CarouselViewContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3570420();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E35704E8(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI21CarouselViewContainer)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_carouselView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_pageControl));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_headerView);
}

- (void)pageChangeEventWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3570E60(v4);
}

@end