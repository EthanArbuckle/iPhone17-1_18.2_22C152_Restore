@interface LargeGameCenterPlayerCollectionViewCell
- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell *)sub_10061B778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10061C4C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10061BF3C();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_alias));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_displayName);
}

@end