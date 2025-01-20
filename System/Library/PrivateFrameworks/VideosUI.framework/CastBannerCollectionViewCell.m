@interface CastBannerCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation CastBannerCollectionViewCell

- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI28CastBannerCollectionViewCell *)sub_1E37C1D7C();
}

- (_TtC8VideosUI28CastBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37C1E58();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E37C1F2C(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E37C29B4();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_attributionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_descriptionView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI28CastBannerCollectionViewCell_monogramView);
}

@end