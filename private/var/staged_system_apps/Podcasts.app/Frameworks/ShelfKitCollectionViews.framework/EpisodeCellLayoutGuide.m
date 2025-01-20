@interface EpisodeCellLayoutGuide
- (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide)init;
- (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide)initWithCoder:(id)a3;
@end

@implementation EpisodeCellLayoutGuide

- (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide_internalTrailingConstraint) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide_extraTrailingPadding) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide *)sub_385890();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide)init
{
  result = (_TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide_contentView));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews22EpisodeCellLayoutGuide_internalTrailingConstraint);
}

@end