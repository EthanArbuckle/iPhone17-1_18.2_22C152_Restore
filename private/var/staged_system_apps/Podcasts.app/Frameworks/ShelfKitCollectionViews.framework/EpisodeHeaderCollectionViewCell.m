@interface EpisodeHeaderCollectionViewCell
- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation EpisodeHeaderCollectionViewCell

- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell *)sub_30F54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_33978();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_471508);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for EpisodeHeaderCollectionViewCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(EpisodeHeaderCollectionViewCell *)&v11 prepareForReuse];
  *(Class *)((char *)&v7->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkSubscription) = 0;
  swift_release();
  uint64_t v8 = sub_37C230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_subscribedArtwork;
  swift_beginAccess();
  sub_29150((uint64_t)v5, v9, &qword_471508);
  swift_endAccess();
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_imageProvider, &qword_471D78);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkWidthConstraint));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkView));
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_subscribedArtwork, &qword_471508);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell____lazy_storage___titleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderSubtitle));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderEntitlementDisplay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_showButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell____lazy_storage___playButton));

  swift_release();
}

@end