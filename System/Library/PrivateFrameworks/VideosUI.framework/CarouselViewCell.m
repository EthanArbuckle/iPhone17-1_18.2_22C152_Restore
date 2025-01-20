@interface CarouselViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI16CarouselViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI16CarouselViewCell)initWithFrame:(CGRect)a3;
- (void)vui_prepareForReuse;
@end

@implementation CarouselViewCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E359A390(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E359A52C();
}

- (_TtC8VideosUI16CarouselViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI16CarouselViewCell *)sub_1E359A914();
}

- (_TtC8VideosUI16CarouselViewCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI16CarouselViewCell *)sub_1E359A9D8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_cellImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_shadow));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI16CarouselViewCell____lazy_storage___inlinePlaybackView);
}

@end