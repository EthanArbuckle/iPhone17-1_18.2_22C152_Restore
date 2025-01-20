@interface SideBarCollectionViewListCell
- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithCoder:(id)a3;
- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation SideBarCollectionViewListCell

- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI29SideBarCollectionViewListCell *)sub_1E349E4F8();
}

- (_TtC8VideosUI29SideBarCollectionViewListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E349E864();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E349ED70();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_imageLoader));
  sub_1E349FDD8((uint64_t)self + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_sidebarItem);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI29SideBarCollectionViewListCell_image));
  swift_release();
}

@end