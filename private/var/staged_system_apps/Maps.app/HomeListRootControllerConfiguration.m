@interface HomeListRootControllerConfiguration
- (HomeActionDelegate)homeActionDelegate;
- (HomeUpdateDelegate)homeUpdateDelegate;
- (UICollectionView)collectionView;
- (_TtC4Maps35HomeListRootControllerConfiguration)init;
- (_TtC4Maps35HomeListRootControllerConfiguration)initWithCollectionView:(id)a3;
- (void)setHomeActionDelegate:(id)a3;
- (void)setHomeUpdateDelegate:(id)a3;
@end

@implementation HomeListRootControllerConfiguration

- (_TtC4Maps35HomeListRootControllerConfiguration)initWithCollectionView:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomeListRootControllerConfiguration();
  id v5 = a3;
  return [(HomeListRootControllerConfiguration *)&v7 init];
}

- (void)setHomeUpdateDelegate:(id)a3
{
}

- (void)setHomeActionDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView));
}

- (HomeActionDelegate)homeActionDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (HomeActionDelegate *)Strong;
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (HomeUpdateDelegate *)Strong;
}

- (_TtC4Maps35HomeListRootControllerConfiguration)init
{
  result = (_TtC4Maps35HomeListRootControllerConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_collectionView));
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeActionDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC4Maps35HomeListRootControllerConfiguration_homeUpdateDelegate;

  sub_100123CE4((uint64_t)v3);
}

@end