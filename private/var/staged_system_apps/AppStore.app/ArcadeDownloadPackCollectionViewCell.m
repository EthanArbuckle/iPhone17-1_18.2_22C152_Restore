@interface ArcadeDownloadPackCollectionViewCell
- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell *)sub_10055DF20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10055E840();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ArcadeDownloadPackCollectionViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_cardView];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:v4];
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end