@interface MAAutoAsset(SUCoreBorderMAAutoAsset)
+ (void)SUCoreBorder_stageCancelOperation:()SUCoreBorderMAAutoAsset;
+ (void)SUCoreBorder_stageDetermineGroupsAvailableForUpdate:()SUCoreBorderMAAutoAsset completion:;
+ (void)SUCoreBorder_stageDownloadGroups:()SUCoreBorderMAAutoAsset awaitingAllGroups:withStagingTimeout:reportingProgress:completion:;
+ (void)SUCoreBorder_stagePurgeAll:()SUCoreBorderMAAutoAsset;
+ (void)_SUCoreBorder_stageCancelAtBegin:()SUCoreBorderMAAutoAsset withCompletion:;
+ (void)_SUCoreBorder_stageCancelAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:;
+ (void)_SUCoreBorder_stageDetermineResultAtBegin:()SUCoreBorderMAAutoAsset withCompletion:;
+ (void)_SUCoreBorder_stageDetermineResultAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:;
+ (void)_SUCoreBorder_stageDownloadAtBegin:()SUCoreBorderMAAutoAsset withCompletion:;
+ (void)_SUCoreBorder_stageDownloadAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:;
+ (void)_SUCoreBorder_stagePurgeAllAtBegin:()SUCoreBorderMAAutoAsset withCompletion:;
+ (void)_SUCoreBorder_stagePurgeAllAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:;
+ (void)_generateSimulatedResults:()SUCoreBorderMAAutoAsset bytes:;
@end

@implementation MAAutoAsset(SUCoreBorderMAAutoAsset)

+ (void)_generateSimulatedResults:()SUCoreBorderMAAutoAsset bytes:
{
  if (a3) {
    *a3 = MEMORY[0x263EFFA78];
  }
  if (a4) {
    *a4 = &unk_26C19D330;
  }
}

+ (void)_SUCoreBorder_stageDetermineResultAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 simAction];
  if (v8 == 3)
  {
    id v27 = 0;
    id v26 = 0;
    [a1 _generateSimulatedResults:&v27 bytes:&v26];
    id v10 = v27;
    id v11 = v26;
    v9 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      v9 = [v6 buildErrorWithDescription:@"Created by _SUCoreBorder_stageDetermineResultAtBegin"];
    }
    else
    {
      v12 = [MEMORY[0x263F77DA8] sharedDiag];
      v13 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v6];
      [v12 trackAnomaly:@"_SUCoreBorder_stageDetermineResultAtBegin" forReason:v13 withResult:8113 withError:0];

      v14 = [MEMORY[0x263F77E20] sharedSimulator];
      v9 = [v14 generateError:@"_SUCoreBorder_stageDetermineResultAtBegin" ofDomain:*MEMORY[0x263F78058] withCode:8113];
    }
    id v10 = 0;
    id v11 = 0;
  }
  v15 = [MEMORY[0x263F77D78] sharedCore];
  v16 = [v15 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC4A0;
  id v22 = v10;
  id v23 = v11;
  id v24 = v9;
  id v25 = v7;
  id v17 = v9;
  id v18 = v11;
  id v19 = v10;
  id v20 = v7;
  dispatch_async(v16, block);
}

+ (void)_SUCoreBorder_stageDetermineResultAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = [v11 simAction];
  if (v17 == 3)
  {
    id v35 = v16;
    id v36 = v15;
    [a1 _generateSimulatedResults:&v36 bytes:&v35];
    id v19 = v36;

    id v20 = v35;
    id v18 = 0;
  }
  else if (v17 == 1)
  {

    id v18 = [v11 buildErrorWithDescription:@"Created by _SUCoreBorder_stageDetermineResultAtEnd"];
    id v19 = 0;
    id v20 = 0;
  }
  else
  {
    v21 = [MEMORY[0x263F77DA8] sharedDiag];
    id v22 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v21 trackAnomaly:@"_SUCoreBorder_stageDetermineResultAtEnd" forReason:v22 withResult:8113 withError:0];

    id v23 = [MEMORY[0x263F77E20] sharedSimulator];
    id v18 = [v23 generateError:@"_SUCoreBorder_stageDetermineResultAtEnd" ofDomain:*MEMORY[0x263F78058] withCode:8113];

    id v19 = v15;
    id v20 = v16;
  }
  id v24 = [MEMORY[0x263F77D78] sharedCore];
  id v25 = [v24 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtEnd_assets_bytes_error_withCompletion___block_invoke;
  block[3] = &unk_2640DC4A0;
  id v31 = v19;
  id v32 = v20;
  id v33 = v18;
  id v34 = v14;
  id v26 = v14;
  id v27 = v19;
  id v28 = v20;
  id v29 = v18;
  dispatch_async(v25, block);
}

+ (void)SUCoreBorder_stageDetermineGroupsAvailableForUpdate:()SUCoreBorderMAAutoAsset completion:
{
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263F77E20];
  id v7 = a4;
  uint64_t v8 = [v6 sharedSimulator];
  v9 = [v8 begin:@"ma" atFunction:@"stageDetermineGroupsAvailableForUpdate"];

  if (v9) {
    objc_msgSend(a1, "_SUCoreBorder_stageDetermineResultAtBegin:withCompletion:", v9, v7);
  }
  else {
    [MEMORY[0x263F55960] stageDetermineGroupsAvailableForUpdate:v10 completion:v7];
  }
}

+ (void)_SUCoreBorder_stageDownloadAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 simAction];
  if (v8 == 3)
  {
    id v27 = 0;
    id v26 = 0;
    [a1 _generateSimulatedResults:&v27 bytes:&v26];
    id v10 = v27;
    id v11 = v26;
    v9 = 0;
  }
  else
  {
    if (v8 == 1)
    {
      v9 = [v6 buildErrorWithDescription:@"Created by _SUCoreBorder_stageDownloadAtBegin"];
    }
    else
    {
      id v12 = [MEMORY[0x263F77DA8] sharedDiag];
      id v13 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v6];
      [v12 trackAnomaly:@"_SUCoreBorder_stageDownloadAtBegin" forReason:v13 withResult:8113 withError:0];

      id v14 = [MEMORY[0x263F77E20] sharedSimulator];
      v9 = [v14 generateError:@"_SUCoreBorder_stageDownloadAtBegin" ofDomain:*MEMORY[0x263F78058] withCode:8113];
    }
    id v10 = 0;
    id v11 = 0;
  }
  id v15 = [MEMORY[0x263F77D78] sharedCore];
  id v16 = [v15 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC4A0;
  id v22 = v11;
  id v23 = v10;
  id v24 = v9;
  id v25 = v7;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v20 = v7;
  dispatch_async(v16, block);
}

+ (void)_SUCoreBorder_stageDownloadAtEnd:()SUCoreBorderMAAutoAsset assets:bytes:error:withCompletion:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = v12;
  id v16 = v13;
  uint64_t v17 = [v11 simAction];
  if (v17 == 3)
  {
    id v35 = v16;
    id v36 = v15;
    [a1 _generateSimulatedResults:&v36 bytes:&v35];
    id v19 = v36;

    id v20 = v35;
    id v18 = 0;
  }
  else if (v17 == 1)
  {

    id v18 = [v11 buildErrorWithDescription:@"Created by _SUCoreBorder_stageDownloadAtEnd"];
    id v19 = 0;
    id v20 = 0;
  }
  else
  {
    v21 = [MEMORY[0x263F77DA8] sharedDiag];
    id v22 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v21 trackAnomaly:@"_SUCoreBorder_stageDownloadAtEnd" forReason:v22 withResult:8113 withError:0];

    id v23 = [MEMORY[0x263F77E20] sharedSimulator];
    id v18 = [v23 generateError:@"_SUCoreBorder_stageDownloadAtEnd" ofDomain:*MEMORY[0x263F78058] withCode:8113];

    id v19 = v15;
    id v20 = v16;
  }
  id v24 = [MEMORY[0x263F77D78] sharedCore];
  id v25 = [v24 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtEnd_assets_bytes_error_withCompletion___block_invoke;
  block[3] = &unk_2640DC4A0;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  id v34 = v14;
  id v26 = v14;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  dispatch_async(v25, block);
}

+ (void)SUCoreBorder_stageDownloadGroups:()SUCoreBorderMAAutoAsset awaitingAllGroups:withStagingTimeout:reportingProgress:completion:
{
  id v17 = a3;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x263F77E20];
  id v14 = a7;
  id v15 = [v13 sharedSimulator];
  id v16 = [v15 begin:@"ma" atFunction:@"stageDownloadGroups"];

  if (v16) {
    objc_msgSend(a1, "_SUCoreBorder_stageDownloadAtBegin:withCompletion:", v16, v14);
  }
  else {
    [MEMORY[0x263F55960] stageDownloadGroups:v17 awaitingAllGroups:a4 withStagingTimeout:a5 reportingProgress:v12 completion:v14];
  }
}

+ (void)_SUCoreBorder_stageCancelAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v8 = 0;
  }
  else if (v7 == 1)
  {
    uint64_t v8 = [v5 buildErrorWithDescription:@"Created by _SUCoreBorder_stageCancelAtBegin"];
  }
  else
  {
    v9 = [MEMORY[0x263F77DA8] sharedDiag];
    id v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_stageCancelAtBegin" forReason:v10 withResult:8113 withError:0];

    id v11 = [MEMORY[0x263F77E20] sharedSimulator];
    uint64_t v8 = [v11 generateError:@"_SUCoreBorder_stageCancelAtBegin" ofDomain:*MEMORY[0x263F78058] withCode:8113];
  }
  id v12 = [MEMORY[0x263F77D78] sharedCore];
  id v13 = [v12 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC4C8;
  id v17 = v8;
  id v18 = v6;
  id v14 = v8;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_stageCancelAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = [v6 simAction];
  if (v8 == 3)
  {
    v9 = 0;
  }
  else if (v8 == 1)
  {
    v9 = [v6 buildErrorWithDescription:@"Created by _SUCoreBorder_stageCancelAtEnd"];
  }
  else
  {
    id v10 = [MEMORY[0x263F77DA8] sharedDiag];
    id v11 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v6];
    [v10 trackAnomaly:@"_SUCoreBorder_stageCancelAtEnd" forReason:v11 withResult:8113 withError:0];

    id v12 = [MEMORY[0x263F77E20] sharedSimulator];
    v9 = [v12 generateError:@"_SUCoreBorder_stageCancelAtEnd" ofDomain:*MEMORY[0x263F78058] withCode:8113];
  }
  id v13 = [MEMORY[0x263F77D78] sharedCore];
  id v14 = [v13 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtEnd_operationError_withCompletion___block_invoke;
  block[3] = &unk_2640DC4C8;
  id v18 = v9;
  id v19 = v7;
  id v15 = v7;
  id v16 = v9;
  dispatch_async(v14, block);
}

+ (void)SUCoreBorder_stageCancelOperation:()SUCoreBorderMAAutoAsset
{
  v4 = (void *)MEMORY[0x263F77E20];
  id v5 = a3;
  id v6 = [v4 sharedSimulator];
  id v7 = [v6 begin:@"ma" atFunction:@"stageCancelOperation"];

  if (v7) {
    objc_msgSend(a1, "_SUCoreBorder_stageCancelAtBegin:withCompletion:", v7, v5);
  }
  else {
    [MEMORY[0x263F55960] stageCancelOperation:v5];
  }
}

+ (void)_SUCoreBorder_stagePurgeAllAtBegin:()SUCoreBorderMAAutoAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v8 = 0;
  }
  else if (v7 == 1)
  {
    uint64_t v8 = [v5 buildErrorWithDescription:@"Created by _SUCoreBorder_stagePurgeAllAtBegin"];
  }
  else
  {
    v9 = [MEMORY[0x263F77DA8] sharedDiag];
    id v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_stagePurgeAllAtBegin" forReason:v10 withResult:8113 withError:0];

    id v11 = [MEMORY[0x263F77E20] sharedSimulator];
    uint64_t v8 = [v11 generateError:@"_SUCoreBorder_stagePurgeAllAtBegin" ofDomain:*MEMORY[0x263F78058] withCode:8113];
  }
  id v12 = [MEMORY[0x263F77D78] sharedCore];
  id v13 = [v12 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC4C8;
  id v17 = v8;
  id v18 = v6;
  id v14 = v8;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_stagePurgeAllAtEnd:()SUCoreBorderMAAutoAsset operationError:withCompletion:
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = [v6 simAction];
  if (v8 == 3)
  {
    v9 = 0;
  }
  else if (v8 == 1)
  {
    v9 = [v6 buildErrorWithDescription:@"Created by _SUCoreBorder_stagePurgeAllAtEnd"];
  }
  else
  {
    id v10 = [MEMORY[0x263F77DA8] sharedDiag];
    id v11 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v6];
    [v10 trackAnomaly:@"_SUCoreBorder_stagePurgeAllAtEnd" forReason:v11 withResult:8113 withError:0];

    id v12 = [MEMORY[0x263F77E20] sharedSimulator];
    v9 = [v12 generateError:@"_SUCoreBorder_stagePurgeAllAtEnd" ofDomain:*MEMORY[0x263F78058] withCode:8113];
  }
  id v13 = [MEMORY[0x263F77D78] sharedCore];
  id v14 = [v13 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtEnd_operationError_withCompletion___block_invoke;
  block[3] = &unk_2640DC4C8;
  id v18 = v9;
  id v19 = v7;
  id v15 = v7;
  id v16 = v9;
  dispatch_async(v14, block);
}

+ (void)SUCoreBorder_stagePurgeAll:()SUCoreBorderMAAutoAsset
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77E20] sharedSimulator];
  id v6 = [v5 begin:@"ma" atFunction:@"stagePurgeAll"];

  if (v6)
  {
    objc_msgSend(a1, "_SUCoreBorder_stageCancelAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F55960];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__MAAutoAsset_SUCoreBorderMAAutoAsset__SUCoreBorder_stagePurgeAll___block_invoke;
    v8[3] = &unk_2640DC4F0;
    id v9 = v4;
    id v10 = a1;
    [v7 stagePurgeAll:v8];
  }
}

@end