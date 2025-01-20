@interface RoomBannerCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation RoomBannerCollectionViewCell

- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI28RoomBannerCollectionViewCell *)sub_1E36E86A8();
}

- (_TtC8VideosUI28RoomBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E36E8784();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E36E8848(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_bannerImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_descriptionView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI28RoomBannerCollectionViewCell_separatorView);
}

@end