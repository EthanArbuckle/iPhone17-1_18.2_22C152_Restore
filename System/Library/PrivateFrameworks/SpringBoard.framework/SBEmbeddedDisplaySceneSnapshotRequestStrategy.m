@interface SBEmbeddedDisplaySceneSnapshotRequestStrategy
- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5;
@end

@implementation SBEmbeddedDisplaySceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_27:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 52, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 51, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

  if (!v10) {
    goto LABEL_27;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_28:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 53, @"Invalid parameter not satisfying: %@", @"snapshotRequestContext" object file lineNumber description];

LABEL_4:
  unint64_t v12 = [v11 sceneDisplayWindowManagementStyle];
  v13 = [v11 sceneDisplayLayoutStateTransitionContext];
  v14 = [v13 fromLayoutState];

  v15 = [v11 sceneDisplayLayoutStateTransitionContext];
  v16 = [v15 toLayoutState];

  if (v14)
  {
    v17 = [v9 application];
    char v18 = [v17 isMedusaCapable];

    if (v18)
    {
      v19 = objc_opt_new();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __112__SBEmbeddedDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke;
      v39[3] = &unk_1E6B0B4A0;
      id v20 = v19;
      id v40 = v20;
      uint64_t v21 = MEMORY[0x1D948C7A0](v39);
      v22 = (void (**)(void, void, void))v21;
      if (v12 >= 2)
      {
        if (v12 == 2)
        {
          v28 = (void (**)(void, uint64_t, uint64_t))(v21 + 16);
          (*(void (**)(uint64_t, void, void))(v21 + 16))(v21, 0, 0);
          (*v28)(v22, 1, 1);
          (*v28)(v22, 3, 4);
        }
      }
      else
      {
        v23 = [v9 sceneIdentifier];
        v24 = [v14 elementWithIdentifier:v23];
        uint64_t v25 = [v24 layoutRole];

        if (v25 == 3)
        {
          v22[2](v22, 5, 4);
        }
        else if (v25 == 4)
        {
          v22[2](v22, 6, 4);
        }
        else
        {
          v37 = [v14 appLayout];
          uint64_t v29 = [v16 appLayout];
          v30 = (void *)MEMORY[0x1E4F1CAD0];
          v31 = [v37 allItems];
          v32 = [v30 setWithArray:v31];
          v38 = (void *)v29;
          LOBYTE(v29) = [(id)v29 containsAnyItemFromSet:v32];

          if ((v29 & 1) != 0 || [v37 configuration] == 1)
          {
            v22[2](v22, 3, 4);
            v22[2](v22, 4, 0);
          }
          else
          {
            v22[2](v22, 4, 4);
            v22[2](v22, 3, 4);
          }
        }
      }
      v26 = (SBSceneSnapshotRequest *)v20;

      v27 = v26;
    }
    else
    {
      v26 = [[SBSceneSnapshotRequest alloc] initWithSize:0 orientation:0 userInterfaceStyle:1];
      v41[0] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    }
  }
  else
  {
    SBLogSceneSnapshots();
    v26 = (SBSceneSnapshotRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR)) {
      -[SBEmbeddedDisplaySceneSnapshotRequestStrategy snapshotRequestsForSceneHandle:settings:snapshotRequestContext:]((uint64_t)self, v9, &v26->super);
    }
    v27 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v27;
}

void __112__SBEmbeddedDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [[SBSceneSnapshotRequest alloc] initWithSize:a2 orientation:a3 userInterfaceStyle:1];
  [*(id *)(a1 + 32) addObject:v4];
}

- (void)snapshotRequestsForSceneHandle:(uint64_t)a1 settings:(void *)a2 snapshotRequestContext:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a2 sceneIdentifier];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] ERROR: Need fromLayoutState", (uint8_t *)&v6, 0x16u);
}

@end