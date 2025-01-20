@interface SBExternalDisplaySceneSnapshotRequestStrategy
- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5;
@end

@implementation SBExternalDisplaySceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 144, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 145, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __112__SBExternalDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke;
  v19[3] = &unk_1E6B0B4A0;
  id v13 = v12;
  id v20 = v13;
  v14 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v19);
  v14[2](v14, 0, 0);
  v14[2](v14, 2, 1);
  v14[2](v14, 3, 0);
  id v15 = v13;

  return v15;
}

void __112__SBExternalDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [[SBSceneSnapshotRequest alloc] initWithSize:a2 orientation:a3 userInterfaceStyle:1];
  [*(id *)(a1 + 32) addObject:v4];
}

@end