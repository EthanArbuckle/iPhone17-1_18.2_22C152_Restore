@interface LocationCollectionViewCell
- (_TtC7Journal26LocationCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7Journal26LocationCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)preferredContentSizeCategoryTraitChanged;
- (void)prepareForReuse;
@end

@implementation LocationCollectionViewCell

- (_TtC7Journal26LocationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal26LocationCollectionViewCell *)sub_100271F34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal26LocationCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100275820();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocationCollectionViewCell();
  v2 = (char *)v3.receiver;
  [(LocationCollectionViewCell *)&v3 prepareForReuse];
  [*(id *)&v2[OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_locationIconView] setImage:0 v3.receiver, v3.super_class];
  [*(id *)&v2[OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_nameLabel] setText:0];
  [*(id *)&v2[OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_addressLabel] setText:0];
}

- (void)preferredContentSizeCategoryTraitChanged
{
  v2 = self;
  sub_100272A04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_centerLocation));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_searchResult, (uint64_t *)&unk_10080F290);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_addressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_locationIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26LocationCollectionViewCell_locationIconSizeConstraint));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end