@interface PRPosterSnapshotDefinition
@end

@implementation PRPosterSnapshotDefinition

uint64_t __86__PRPosterSnapshotDefinition_AmbientAdditions__defaultAmbientPosterSnapshotDefinition__block_invoke()
{
  defaultAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition = [[_PRAmbientPosterSnapshotDefinition alloc] initWithUniqueIdentifier:@"SNAPSHOT_AMBIENT_DEFAULT" ambientPresented:1 ambientDisplayStyle:0 renderingContent:1 renderingMode:1 previewContent:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __86__PRPosterSnapshotDefinition_AmbientAdditions__redmodeAmbientPosterSnapshotDefinition__block_invoke()
{
  redmodeAmbientPosterSnapshotDefinition_defaultAmbientPosterSnapshotDefinition = [[_PRAmbientPosterSnapshotDefinition alloc] initWithUniqueIdentifier:@"SNAPSHOT_AMBIENT_REDMODE" ambientPresented:1 ambientDisplayStyle:1 renderingContent:1 renderingMode:1 previewContent:1];

  return MEMORY[0x270F9A758]();
}

@end