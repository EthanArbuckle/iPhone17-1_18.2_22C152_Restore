@interface QueryDescriptionBannerViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithFrame:(CGRect)a3;
@end

@implementation QueryDescriptionBannerViewCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E357D910(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI30QueryDescriptionBannerViewCell *)sub_1E357F524();
}

- (_TtC8VideosUI30QueryDescriptionBannerViewCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI30QueryDescriptionBannerViewCell *)sub_1E357F5DC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_customPreviewTarget));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_textBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_textView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI30QueryDescriptionBannerViewCell_additionalInfoView);
}

@end