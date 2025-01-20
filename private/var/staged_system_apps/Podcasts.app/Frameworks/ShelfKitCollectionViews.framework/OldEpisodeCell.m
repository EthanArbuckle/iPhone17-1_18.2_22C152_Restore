@interface OldEpisodeCell
- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation OldEpisodeCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_2AEE80((uint64_t)v4);

  return v6;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2AF260();
}

- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episode) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_axis) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episodeView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[OldEpisodeCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews14OldEpisodeCell *)sub_2AF62C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episodeView);
}

@end