@interface ChartOrCategoryBrickCollectionViewCell
- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *)sub_10028AF38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028EE88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10028B70C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10028AC08();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_debugPreferredArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_debugActualArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_10098C090);
}

@end