@interface PUOneUpActivitySharingActionPerformer
- (BOOL)performActionWithActivityType:(id)a3 assetsByAssetCollection:(id)a4;
- (PUOneUpActivitySharingActionPerformer)init;
- (PUOneUpActivitySharingActionPerformer)initWithActionsController:(id)a3;
@end

@implementation PUOneUpActivitySharingActionPerformer

- (PUOneUpActivitySharingActionPerformer)initWithActionsController:(id)a3
{
  return (PUOneUpActivitySharingActionPerformer *)OneUpActivitySharingActionPerformer.init(actionsController:)((uint64_t)a3);
}

- (BOOL)performActionWithActivityType:(id)a3 assetsByAssetCollection:(id)a4
{
  uint64_t v5 = sub_1AEF96DE0();
  v7 = v6;
  sub_1AEB0BDD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9CFA0);
  sub_1AEB0BE10();
  uint64_t v8 = sub_1AEF96CA0();
  v9 = self;
  v10._countAndFlagsBits = v5;
  v10._object = v7;
  LOBYTE(v5) = OneUpActivitySharingActionPerformer.performAction(forActivityType:assetsByAssetCollection:)(v10, (Swift::OpaquePointer)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (PUOneUpActivitySharingActionPerformer)init
{
}

- (void).cxx_destruct
{
}

@end