@interface SHSheetRemoteSceneUpdateHostComponent
- (BOOL)didPerformInitialFenceUpdate;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)setDidPerformInitialFenceUpdate:(BOOL)a3;
@end

@implementation SHSheetRemoteSceneUpdateHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6 = a3;
  v7 = [a4 transitionContext];
  v8 = [v7 animationFence];

  if (v8
    && ![(SHSheetRemoteSceneUpdateHostComponent *)self didPerformInitialFenceUpdate])
  {
    [(SHSheetRemoteSceneUpdateHostComponent *)self setDidPerformInitialFenceUpdate:1];
    v9 = (void *)MEMORY[0x1E4F39CF8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke;
    v10[3] = &unk_1E5A21900;
    id v11 = v6;
    [v9 addCommitHandler:v10 forPhase:5];
  }
}

void __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke_2;
  block[3] = &unk_1E5A21900;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__SHSheetRemoteSceneUpdateHostComponent_scene_willUpdateSettings___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v1 = [v4 delegate];
  id v2 = [v1 session];
  v3 = [v2 activityViewController];
  [v3 _readyToInteract];
}

- (BOOL)didPerformInitialFenceUpdate
{
  return *(&self->super._invalid + 1);
}

- (void)setDidPerformInitialFenceUpdate:(BOOL)a3
{
  *(&self->super._invalid + 1) = a3;
}

@end