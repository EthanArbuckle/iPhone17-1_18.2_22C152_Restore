@interface SmallGameCenterPlayerCollectionViewCell
- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell *)sub_1004A56C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004A677C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004A608C();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_displayName));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_separatorView);
}

@end