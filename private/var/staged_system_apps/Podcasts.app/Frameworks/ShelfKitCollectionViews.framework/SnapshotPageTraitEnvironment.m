@interface SnapshotPageTraitEnvironment
- (UITraitCollection)traitCollection;
- (_TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment)init;
@end

@implementation SnapshotPageTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_traitCollection));
}

- (_TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment)init
{
  result = (_TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_traitCollection));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28SnapshotPageTraitEnvironment_gridSpec;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

@end