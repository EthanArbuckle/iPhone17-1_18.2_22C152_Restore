@interface ArcadeShowcaseCollectionViewCell
- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeShowcaseCollectionViewCell

- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32ArcadeShowcaseCollectionViewCell *)sub_100189440(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10018BD34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100189E90();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_100982B40);
}

@end