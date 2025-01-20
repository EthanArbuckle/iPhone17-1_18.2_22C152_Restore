@interface UIApplicationSceneClientAgent
- (UIApplicationSceneClientAgent)init;
- (void)dealloc;
- (void)scene:(id)a3 didInitializeWithEvent:(id)a4 completion:(id)a5;
- (void)scene:(id)a3 handleEvent:(id)a4 withCompletion:(id)a5;
- (void)scene:(id)a3 willInvalidateWithEvent:(id)a4 completion:(id)a5;
@end

@implementation UIApplicationSceneClientAgent

- (void)scene:(id)a3 didInitializeWithEvent:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)UIApp _workspace];
  v12 = [v8 identifier];
  v13 = [v11 sceneWithIdentifier:v12];

  v14 = [v11 delegate];

  if (v14)
  {
    v15 = [v11 delegate];
    v16 = [v9 transitionContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__UIApplicationSceneClientAgent_scene_didInitializeWithEvent_completion___block_invoke;
    v18[3] = &unk_1E52EFE80;
    id v19 = v10;
    [v15 workspace:v11 didCreateScene:v13 withTransitionContext:v16 completion:v18];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIApplicationSceneClientAgent;
    [(FBSBasicSceneClientAgent *)&v17 scene:v8 didInitializeWithEvent:v9 completion:v10];
  }
}

- (void)scene:(id)a3 handleEvent:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)UIApp _workspace];
  v12 = [v8 identifier];
  v13 = [v11 sceneWithIdentifier:v12];

  v14 = [v13 delegate];
  if (!v14) {
    goto LABEL_9;
  }
  v15 = [v9 settingsDiff];
  if (v15)
  {

LABEL_5:
    objc_super v17 = [v9 settingsDiff];
    v18 = [v9 transitionContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__UIApplicationSceneClientAgent_scene_handleEvent_withCompletion___block_invoke;
    v23[3] = &unk_1E52EFED0;
    id v24 = v10;
    [v14 scene:v13 didUpdateWithDiff:v17 transitionContext:v18 completion:v23];

    goto LABEL_10;
  }
  v16 = [v9 transitionContext];

  if (v16) {
    goto LABEL_5;
  }
  id v19 = [v9 actions];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
LABEL_9:
    v22.receiver = self;
    v22.super_class = (Class)UIApplicationSceneClientAgent;
    [(FBSBasicSceneClientAgent *)&v22 scene:v8 handleEvent:v9 withCompletion:v10];
    goto LABEL_10;
  }
  v21 = [v9 actions];
  [v14 scene:v13 didReceiveActions:v21];

  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_10:
}

void __66__UIApplicationSceneClientAgent_scene_handleEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 message];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

uint64_t __73__UIApplicationSceneClientAgent_scene_didInitializeWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (UIApplicationSceneClientAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationSceneClientAgent;
  return [(UIApplicationSceneClientAgent *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UIApplicationSceneClientAgent;
  [(UIApplicationSceneClientAgent *)&v2 dealloc];
}

- (void)scene:(id)a3 willInvalidateWithEvent:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(id)UIApp _workspace];
  v12 = [v8 identifier];
  v13 = [v11 sceneWithIdentifier:v12];

  v14 = [v11 delegate];

  if (v14)
  {
    v15 = [v11 delegate];
    v16 = [v9 transitionContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__UIApplicationSceneClientAgent_scene_willInvalidateWithEvent_completion___block_invoke;
    v18[3] = &unk_1E52EFEA8;
    id v19 = v10;
    [v15 workspace:v11 willDestroyScene:v13 withTransitionContext:v16 completion:v18];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIApplicationSceneClientAgent;
    [(FBSBasicSceneClientAgent *)&v17 scene:v8 willInvalidateWithEvent:v9 completion:v10];
  }
}

uint64_t __74__UIApplicationSceneClientAgent_scene_willInvalidateWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end