@interface SBSingleSceneSnapshotRequestStrategy
- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5;
@end

@implementation SBSingleSceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 26, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBSceneSnapshotRequestStrategy.m", 27, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

LABEL_3:
  if ([v10 isUISubclass])
  {
    v12 = [[SBSceneSnapshotRequest alloc] initWithSize:0 orientation:0 userInterfaceStyle:0];
    v17[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

@end