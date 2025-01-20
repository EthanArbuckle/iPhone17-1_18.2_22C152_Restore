@interface ShowEpisodeCountHeaderCell
- (UILabel)accessibilityEpisodesCount;
- (UILabel)accessibilityTitle;
- (_TtC23ShelfKitCollectionViews18CachingArtworkView)accessibilityInternalArtworkView;
- (_TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell)initWithFrame:(CGRect)a3;
- (void)artworkTapped;
@end

@implementation ShowEpisodeCountHeaderCell

- (void)artworkTapped
{
  v2 = self;
  sub_2A49A0();
}

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)accessibilityInternalArtworkView
{
  return (_TtC23ShelfKitCollectionViews18CachingArtworkView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_internalArtworkView);
}

- (UILabel)accessibilityTitle
{
  result = *(UILabel **)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_title);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (UILabel)accessibilityEpisodesCount
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_episodesCount));
}

- (_TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_internalArtworkView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_title) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_episodesCount) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_model;
  uint64_t v10 = sub_382520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell____lazy_storage___artworkTapGesture) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_objectGraph) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[ShowEpisodeCountHeaderCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell *)sub_2A4D5C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_internalArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_episodesCount));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell_model, &qword_47ECC8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowEpisodeCountHeaderCell____lazy_storage___artworkTapGesture));

  swift_release();
}

@end