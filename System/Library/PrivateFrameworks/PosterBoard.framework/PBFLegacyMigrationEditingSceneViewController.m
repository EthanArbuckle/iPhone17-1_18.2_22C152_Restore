@interface PBFLegacyMigrationEditingSceneViewController
- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7;
- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 exnihiloPathAssertion:(id)a5 replacing:(id)a6;
@end

@implementation PBFLegacyMigrationEditingSceneViewController

- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 exnihiloPathAssertion:(id)a5 replacing:(id)a6
{
  type metadata accessor for ExnihiloPathAssertion();
  v11 = (objc_class *)swift_allocObject();
  *((void *)v11 + 2) = a5;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_exnihiloPathAssertion) = v11;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_posterPairToReplace) = (Class)a6;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for LegacyMigrationEditingSceneViewController();
  swift_unknownObjectRetain();
  id v12 = a6;
  return [(PREditingSceneViewController *)&v14 initWithProvider:a3 contents:a4 configurableOptions:0 configuredProperties:0 additionalInfo:0];
}

- (PBFLegacyMigrationEditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  result = (PBFLegacyMigrationEditingSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___PBFLegacyMigrationEditingSceneViewController_posterPairToReplace);
}

@end