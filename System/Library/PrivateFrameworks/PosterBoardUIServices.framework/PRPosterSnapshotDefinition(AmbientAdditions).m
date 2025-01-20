@interface PRPosterSnapshotDefinition(AmbientAdditions)
+ (_PRAmbientPosterSnapshotDefinition)ambientPosterSnapshotDefinitionWithIdentifier:()AmbientAdditions ambientPresentationSettings:;
+ (id)ambientPosterSnapshotDefinitions;
+ (id)defaultAmbientPosterSnapshotDefinition;
+ (id)redmodeAmbientPosterSnapshotDefinition;
@end

@implementation PRPosterSnapshotDefinition(AmbientAdditions)

+ (id)defaultAmbientPosterSnapshotDefinition
{
  if (defaultAmbientPosterSnapshotDefinition_onceToken != -1) {
    dispatch_once(&defaultAmbientPosterSnapshotDefinition_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)defaultAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;

  return v0;
}

+ (id)redmodeAmbientPosterSnapshotDefinition
{
  if (redmodeAmbientPosterSnapshotDefinition_onceToken != -1) {
    dispatch_once(&redmodeAmbientPosterSnapshotDefinition_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)redmodeAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition;

  return v0;
}

+ (_PRAmbientPosterSnapshotDefinition)ambientPosterSnapshotDefinitionWithIdentifier:()AmbientAdditions ambientPresentationSettings:
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_PRAmbientPosterSnapshotDefinition alloc] initWithUniqueIdentifier:v6 ambientPresentationSettings:v5 renderingContent:1 renderingMode:1 previewContent:1];

  return v7;
}

+ (id)ambientPosterSnapshotDefinitions
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [a1 defaultAmbientPosterSnapshotDefinition];
  v6[0] = v2;
  v3 = [a1 redmodeAmbientPosterSnapshotDefinition];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

@end