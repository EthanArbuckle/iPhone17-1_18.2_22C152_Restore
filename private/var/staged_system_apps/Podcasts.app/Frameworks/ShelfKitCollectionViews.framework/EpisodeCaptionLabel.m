@interface EpisodeCaptionLabel
- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithFrame:(CGRect)a3;
@end

@implementation EpisodeCaptionLabel

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  result = (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *)swift_beginAccess();
  if (off_474CD0)
  {
    sub_276FC((uint64_t)(off_474CD0 + 6), (uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_storeDataProvider);
    v9 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_caption);
    v10 = (objc_class *)type metadata accessor for EpisodeCaptionLabel();
    void *v9 = 0;
    v9[1] = 0;
    v11.receiver = self;
    v11.super_class = v10;
    return -[DynamicTypeLabel initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *)sub_188544(a3);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19EpisodeCaptionLabel_storeDataProvider);

  swift_bridgeObjectRelease();
}

@end