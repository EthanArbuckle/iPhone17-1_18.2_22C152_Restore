@interface PrototypeUpNextMultiShowEpisodeCell
- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithFrame:(CGRect)a3;
- (void)buttonPressed;
@end

@implementation PrototypeUpNextMultiShowEpisodeCell

- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell____lazy_storage___infoButton) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell_podcastUuid);
  void *v9 = 0;
  v9[1] = 0;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = -[MultiShowEpisodeCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  id v11 = [(PrototypeUpNextMultiShowEpisodeCell *)v10 contentView];
  id v12 = sub_1A655C();
  [v11 addSubview:v12];

  return v10;
}

- (_TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A72BC();
}

- (void)buttonPressed
{
  v2 = self;
  sub_1A6AE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews35PrototypeUpNextMultiShowEpisodeCell____lazy_storage___infoButton));

  swift_bridgeObjectRelease();
}

@end