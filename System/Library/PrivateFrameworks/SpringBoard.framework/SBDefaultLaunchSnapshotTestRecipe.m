@interface SBDefaultLaunchSnapshotTestRecipe
- (id)title;
- (void)handleVolumeIncrease;
@end

@implementation SBDefaultLaunchSnapshotTestRecipe

- (id)title
{
  return @"Regenerate Default Launch Images";
}

- (void)handleVolumeIncrease
{
  if (!self->_alertItem)
  {
    v3 = [SBGenerateLaunchSnapshotsAlertItem alloc];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__SBDefaultLaunchSnapshotTestRecipe_handleVolumeIncrease__block_invoke;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = self;
    v4 = [(SBGenerateLaunchSnapshotsAlertItem *)v3 initWithHandler:v6];
    alertItem = self->_alertItem;
    self->_alertItem = v4;

    [MEMORY[0x1E4FA7938] activateAlertItem:self->_alertItem];
  }
}

void __57__SBDefaultLaunchSnapshotTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void).cxx_destruct
{
}

@end