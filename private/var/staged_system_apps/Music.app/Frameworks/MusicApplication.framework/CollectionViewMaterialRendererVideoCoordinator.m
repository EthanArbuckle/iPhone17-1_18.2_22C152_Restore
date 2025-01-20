@interface CollectionViewMaterialRendererVideoCoordinator
- (_TtC16MusicApplication46CollectionViewMaterialRendererVideoCoordinator)init;
- (void)outputMediaDataWillChange:(id)a3;
@end

@implementation CollectionViewMaterialRendererVideoCoordinator

- (void)outputMediaDataWillChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_13098C(v4);
}

- (_TtC16MusicApplication46CollectionViewMaterialRendererVideoCoordinator)init
{
  result = (_TtC16MusicApplication46CollectionViewMaterialRendererVideoCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication46CollectionViewMaterialRendererVideoCoordinator_collectionView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MusicApplication46CollectionViewMaterialRendererVideoCoordinator_outputAccessQueue);
}

@end