@interface MAAsset(SUCoreBorderMAAsset)
+ (id)SUCoreBorder_loadSync:()SUCoreBorderMAAsset allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:;
+ (id)_SUCoreBorder_MAAssetResultAtBegin:()SUCoreBorderMAAsset withDescriptor:type:error:;
+ (id)_SUCoreBorder_MAAssetResultAtEnd:()SUCoreBorderMAAsset withDescriptor:type:withResult:error:;
+ (id)_SUCoreBorder_MAAttributesAtBegin:()SUCoreBorderMAAsset;
+ (id)_SUCoreBorder_MAAttributesAtEnd:()SUCoreBorderMAAsset withBaseAttributes:;
+ (id)_getSimulatedAssetForDescriptor:()SUCoreBorderMAAsset type:;
+ (uint64_t)_SUCoreBorder_MAAssetState:()SUCoreBorderMAAsset;
+ (uint64_t)_SUCoreBorder_MABoolResultAtBegin:()SUCoreBorderMAAsset;
+ (uint64_t)_SUCoreBorder_MABoolResultAtEnd:()SUCoreBorderMAAsset withResult:;
+ (void)SUCoreBorder_cancelCatalogDownload:()SUCoreBorderMAAsset completionWithCancelResult:;
+ (void)SUCoreBorder_startCatalogDownload:()SUCoreBorderMAAsset options:completionWithError:;
+ (void)_SUCoreBorder_MACancelDownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MACancelDownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:;
+ (void)_SUCoreBorder_MADownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MADownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:;
+ (void)_SUCoreBorder_MAOperationResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MAOperationResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:;
+ (void)_SUCoreBorder_MAPurgeResultAtBegin:()SUCoreBorderMAAsset withCompletion:;
+ (void)_SUCoreBorder_MAPurgeResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:;
- (id)SUCoreBorder_attributes;
- (uint64_t)SUCoreBorder_refreshState;
- (uint64_t)SUCoreBorder_state;
- (void)SUCoreBorder_cancelDownload:()SUCoreBorderMAAsset;
- (void)SUCoreBorder_configDownload:()SUCoreBorderMAAsset completion:;
- (void)SUCoreBorder_purgeWithError:()SUCoreBorderMAAsset;
- (void)SUCoreBorder_startDownload:()SUCoreBorderMAAsset completionWithError:;
- (void)_prepAndSendDownloadFinishedSplunkEvent:()SUCoreBorderMAAsset withError:withSessionId:;
- (void)_prepAndSendDownloadStartedSplunkEvent:()SUCoreBorderMAAsset;
- (void)_setCommonSplunkFields:()SUCoreBorderMAAsset withSessionId:;
@end

@implementation MAAsset(SUCoreBorderMAAsset)

+ (void)SUCoreBorder_startCatalogDownload:()SUCoreBorderMAAsset options:completionWithError:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F77E20] sharedSimulator];
  v11 = [v10 begin:@"ma" atFunction:@"startCatalogDownload"];

  v12 = (void *)MEMORY[0x263F55938];
  if (v11)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v11, v9);
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startCatalogDownload_options_completionWithError___block_invoke;
    v13[3] = &unk_2640DC3D8;
    id v14 = v9;
    [v12 startCatalogDownload:v7 options:v8 completionWithError:v13];
  }
}

+ (void)SUCoreBorder_cancelCatalogDownload:()SUCoreBorderMAAsset completionWithCancelResult:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F77E20] sharedSimulator];
  id v8 = [v7 begin:@"ma" atFunction:@"cancelCatalogDownload"];

  id v9 = (void *)MEMORY[0x263F55938];
  if (v8)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v8, v6);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelCatalogDownload_completionWithCancelResult___block_invoke;
    v10[3] = &unk_2640DC400;
    id v11 = v6;
    [v9 cancelCatalogDownload:v5 then:v10];
  }
}

- (void)SUCoreBorder_startDownload:()SUCoreBorderMAAsset completionWithError:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77E20] sharedSimulator];
  id v9 = [v8 begin:@"ma" atFunction:@"startDownload"];

  if (v9)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MADownloadResultAtBegin:withCompletion:", v9, v7);
  }
  else
  {
    v10 = [v6 sessionId];
    [a1 _prepAndSendDownloadStartedSplunkEvent:v10];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startDownload_completionWithError___block_invoke;
    v11[3] = &unk_2640DC428;
    v11[4] = a1;
    id v12 = v6;
    id v13 = v7;
    [a1 startDownload:v12 completionWithError:v11];
  }
}

- (void)SUCoreBorder_purgeWithError:()SUCoreBorderMAAsset
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77E20] sharedSimulator];
  id v6 = [v5 begin:@"ma" atFunction:@"purgeWithError"];

  if (v6)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAPurgeResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_purgeWithError___block_invoke;
    v7[3] = &unk_2640DC3D8;
    id v8 = v4;
    [a1 purgeWithError:v7];
  }
}

- (void)SUCoreBorder_cancelDownload:()SUCoreBorderMAAsset
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F77E20] sharedSimulator];
  id v6 = [v5 begin:@"ma" atFunction:@"cancelDownload"];

  if (v6)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MACancelDownloadResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelDownload___block_invoke;
    v7[3] = &unk_2640DC400;
    id v8 = v4;
    [a1 cancelDownload:v7];
  }
}

- (void)SUCoreBorder_configDownload:()SUCoreBorderMAAsset completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77E20] sharedSimulator];
  id v9 = [v8 begin:@"ma" atFunction:@"configDownload"];

  if (v9)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAOperationResultAtBegin:withCompletion:", v9, v7);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_configDownload_completion___block_invoke;
    v10[3] = &unk_2640DC400;
    id v11 = v7;
    [a1 configDownload:v6 completion:v10];
  }
}

- (uint64_t)SUCoreBorder_refreshState
{
  v2 = [MEMORY[0x263F77E20] sharedSimulator];
  v3 = [v2 begin:@"ma" atFunction:@"refreshState"];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MABoolResultAtBegin:", v3);
  }
  else
  {
    uint64_t v4 = [a1 refreshState];
    id v5 = [MEMORY[0x263F77E20] sharedSimulator];
    id v6 = [v5 end:@"ma" atFunction:@"refreshState"];

    if (v6) {
      uint64_t v4 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MABoolResultAtEnd:withResult:", v6, v4);
    }
  }
  return v4;
}

- (uint64_t)SUCoreBorder_state
{
  v2 = [MEMORY[0x263F77E20] sharedSimulator];
  v3 = [v2 begin:@"ma" atFunction:@"state"];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAssetState:", v3);
  }
  else
  {
    uint64_t v4 = [a1 state];
    id v5 = [MEMORY[0x263F77E20] sharedSimulator];
    id v6 = [v5 end:@"ma" atFunction:@"state"];

    if (v6) {
      uint64_t v4 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAssetState:", v6);
    }
  }
  return v4;
}

- (id)SUCoreBorder_attributes
{
  v2 = [MEMORY[0x263F77E20] sharedSimulator];
  v3 = [v2 begin:@"ma" atFunction:@"attributes"];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAttributesAtBegin:", v3);
  }
  else
  {
    uint64_t v4 = [a1 attributes];
    id v5 = [MEMORY[0x263F77E20] sharedSimulator];
    id v6 = [v5 end:@"ma" atFunction:@"attributes"];

    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAttributesAtEnd:withBaseAttributes:", v6, v4);

      uint64_t v4 = (void *)v7;
    }
  }

  return v4;
}

+ (id)SUCoreBorder_loadSync:()SUCoreBorderMAAsset allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = [MEMORY[0x263F77E20] sharedSimulator];
  v18 = [v17 begin:@"ma" atFunction:@"loadSync"];

  if (v18)
  {
    v19 = objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAssetResultAtBegin:withDescriptor:type:error:", v18, v16, a8, a6);
  }
  else
  {
    id v27 = v14;
    id v28 = v13;
    id v20 = v13;
    uint64_t v21 = a6;
    v22 = [MEMORY[0x263F55938] loadSync:v20 allowingDifferences:v14 withPurpose:v15 error:a6];
    v23 = [MEMORY[0x263F77E20] sharedSimulator];
    v24 = [v23 end:@"ma" atFunction:@"loadSync"];

    if (v24)
    {
      objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAAssetResultAtEnd:withDescriptor:type:withResult:error:", v24, v16, a8, v22, v21);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = v22;
    }
    v19 = v25;

    id v14 = v27;
    id v13 = v28;
  }

  return v19;
}

+ (void)_SUCoreBorder_MADownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      id v8 = [MEMORY[0x263F77E20] sharedSimulator];
      uint64_t v9 = 3;
      v10 = [v8 generateError:@"_SUCoreBorder_MADownloadResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Download" withCode:3];
    }
    else
    {
      id v8 = [MEMORY[0x263F77DA8] sharedDiag];
      id v11 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MADownloadResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0;
      uint64_t v9 = 35;
    }
  }
  id v12 = [MEMORY[0x263F77D78] sharedCore];
  id v13 = [v12 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MADownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC450;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MADownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0;
    id v13 = 0;
    id v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      id v12 = [MEMORY[0x263F77E20] sharedSimulator];
      a4 = 3;
      id v13 = [v12 generateError:@"_SUCoreBorder_MADownloadResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Download" withCode:3];
      id v14 = v9;
    }
    else
    {
      id v12 = [MEMORY[0x263F77DA8] sharedDiag];
      id v14 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MADownloadResultAtEnd" forReason:v14 withResult:8113 withError:0];
      id v13 = v9;
    }
  }
  v10[2](v10, a4, v13);
}

+ (void)_SUCoreBorder_MAPurgeResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    uint64_t v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      id v8 = [MEMORY[0x263F77E20] sharedSimulator];
      uint64_t v9 = 5;
      v10 = [v8 generateError:@"_SUCoreBorder_MAPurgeResultAtBegin" ofDomain:@"com.apple.MobileAssetError.Purge" withCode:5];
    }
    else
    {
      id v8 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v8 trackAnomaly:@"_SUCoreBorder_MAPurgeResultAtBegin" forReason:v11 withResult:8113 withError:0];

      v10 = 0;
      uint64_t v9 = 6;
    }
  }
  id v12 = [MEMORY[0x263F77D78] sharedCore];
  id v13 = [v12 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAPurgeResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC450;
  id v18 = v6;
  uint64_t v19 = v9;
  id v17 = v10;
  id v14 = v10;
  id v15 = v6;
  dispatch_async(v13, block);
}

+ (void)_SUCoreBorder_MAPurgeResultAtEnd:()SUCoreBorderMAAsset withResult:withError:withCompletion:
{
  id v15 = a3;
  id v9 = a5;
  v10 = a6;
  uint64_t v11 = [v15 simAction];
  if (v11 == 3)
  {
    a4 = 0;
    id v13 = 0;
    id v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      id v12 = [MEMORY[0x263F77E20] sharedSimulator];
      a4 = 5;
      id v13 = [v12 generateError:@"_SUCoreBorder_MAPurgeResultAtEnd" ofDomain:@"com.apple.MobileAssetError.Purge" withCode:5];
      id v14 = v9;
    }
    else
    {
      id v12 = [MEMORY[0x263F77DA8] sharedDiag];
      id v14 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v15];
      [v12 trackAnomaly:@"_SUCoreBorder_MAPurgeResultAtEnd" forReason:v14 withResult:8113 withError:0];
      id v13 = v9;
    }
  }
  v10[2](v10, a4, v13);
}

+ (void)_SUCoreBorder_MACancelDownloadResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 1)
  {
    uint64_t v8 = 4;
  }
  else if (v7 == 3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_MACancelDownloadResultAtBegin" forReason:v10 withResult:8113 withError:0];

    uint64_t v8 = 5;
  }
  uint64_t v11 = [MEMORY[0x263F77D78] sharedCore];
  id v12 = [v11 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MACancelDownloadResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC478;
  id v15 = v6;
  uint64_t v16 = v8;
  id v13 = v6;
  dispatch_async(v12, block);
}

+ (void)_SUCoreBorder_MACancelDownloadResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  id v11 = a3;
  uint64_t v7 = a5;
  uint64_t v8 = [v11 simAction];
  if (v8 == 1)
  {
    a4 = 4;
  }
  else if (v8 == 3)
  {
    a4 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v9 trackAnomaly:@"_SUCoreBorder_MACancelDownloadResultAtEnd" forReason:v10 withResult:8113 withError:0];
  }
  v7[2](v7, a4);
}

+ (void)_SUCoreBorder_MAOperationResultAtBegin:()SUCoreBorderMAAsset withCompletion:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 1)
  {
    uint64_t v8 = 2;
  }
  else if (v7 == 3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v9 trackAnomaly:@"_SUCoreBorder_MAOperationResultAtBegin" forReason:v10 withResult:8113 withError:0];

    uint64_t v8 = 4;
  }
  id v11 = [MEMORY[0x263F77D78] sharedCore];
  id v12 = [v11 completionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAOperationResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_2640DC478;
  id v15 = v6;
  uint64_t v16 = v8;
  id v13 = v6;
  dispatch_async(v12, block);
}

+ (void)_SUCoreBorder_MAOperationResultAtEnd:()SUCoreBorderMAAsset withResult:withCompletion:
{
  id v11 = a3;
  uint64_t v7 = a5;
  uint64_t v8 = [v11 simAction];
  if (v8 == 1)
  {
    a4 = 2;
  }
  else if (v8 == 3)
  {
    a4 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F77DA8] sharedDiag];
    v10 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v11];
    [v9 trackAnomaly:@"_SUCoreBorder_MAOperationResultAtEnd" forReason:v10 withResult:8113 withError:0];
  }
  v7[2](v7, a4);
}

+ (uint64_t)_SUCoreBorder_MABoolResultAtBegin:()SUCoreBorderMAAsset
{
  id v3 = a3;
  uint64_t v4 = [v3 simAction];
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (v4 != 3)
  {
    id v6 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v3];
    [v6 trackAnomaly:@"_SUCoreBorder_MABoolResultAtBegin" forReason:v7 withResult:8113 withError:0];

LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 1;
LABEL_6:

  return v5;
}

+ (uint64_t)_SUCoreBorder_MABoolResultAtEnd:()SUCoreBorderMAAsset withResult:
{
  id v5 = a3;
  uint64_t v6 = [v5 simAction];
  if (v6 == 1)
  {
    a4 = 0;
  }
  else if (v6 == 3)
  {
    a4 = 1;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v7 trackAnomaly:@"_SUCoreBorder_MABoolResultAtEnd" forReason:v8 withResult:8113 withError:0];
  }
  return a4;
}

+ (id)_SUCoreBorder_MAAssetResultAtBegin:()SUCoreBorderMAAsset withDescriptor:type:error:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 simAction];
  if (v12 == 3)
  {
    id v14 = [a1 _getSimulatedAssetForDescriptor:v11 type:a5];
    goto LABEL_7;
  }
  if (v12 != 1)
  {
    id v15 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v10];
    [v15 trackAnomaly:@"_SUCoreBorder_MAAssetResultAtBegin" forReason:v16 withResult:8113 withError:0];

    id v14 = 0;
LABEL_7:
    id v13 = 0;
    if (!a6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v13 = [v10 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MAAssetResultAtBegin"];
  id v14 = 0;
  if (a6) {
LABEL_8:
  }
    *a6 = v13;
LABEL_9:

  return v14;
}

+ (id)_SUCoreBorder_MAAssetResultAtEnd:()SUCoreBorderMAAsset withDescriptor:type:withResult:error:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a7) {
    id v15 = *a7;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = [v12 simAction];
  if (v17 == 3)
  {
    id v18 = [a1 _getSimulatedAssetForDescriptor:v13 type:a5];

    uint64_t v19 = v16;
    id v16 = 0;
  }
  else if (v17 == 1)
  {

    [v12 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MAAssetResultAtEnd"];
    id v18 = 0;
    uint64_t v19 = v16;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F77DA8] sharedDiag];
    id v20 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v12];
    [v19 trackAnomaly:@"_SUCoreBorder_MAAssetResultAtEnd" forReason:v20 withResult:8113 withError:0];

    id v18 = v14;
  }

  if (a7) {
    *a7 = v16;
  }

  return v18;
}

+ (uint64_t)_SUCoreBorder_MAAssetState:()SUCoreBorderMAAsset
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 simAction] != 3)
  {
    uint64_t v7 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v3];
    [v7 trackAnomaly:@"_SUCoreBorder_MAAssetState" forReason:v8 withResult:8113 withError:0];

    uint64_t v6 = 0;
    goto LABEL_20;
  }
  uint64_t v4 = [v3 assetState];
  char v5 = [v4 isEqualToString:@"MAUnknown"];

  if ((v5 & 1) == 0)
  {
    id v9 = [v3 assetState];
    char v10 = [v9 isEqualToString:@"MANotPresent"];

    if (v10)
    {
      uint64_t v6 = 1;
      goto LABEL_17;
    }
    id v11 = [v3 assetState];
    char v12 = [v11 isEqualToString:@"MAInstalled"];

    if (v12)
    {
      uint64_t v6 = 2;
      goto LABEL_17;
    }
    id v13 = [v3 assetState];
    char v14 = [v13 isEqualToString:@"MAInstalledNotInCatalog"];

    if (v14)
    {
      uint64_t v6 = 3;
      goto LABEL_17;
    }
    id v15 = [v3 assetState];
    char v16 = [v15 isEqualToString:@"MADownloading"];

    if (v16)
    {
      uint64_t v6 = 4;
      goto LABEL_17;
    }
    uint64_t v17 = [v3 assetState];
    char v18 = [v17 isEqualToString:@"MARequiredByOs"];

    if (v18)
    {
      uint64_t v6 = 5;
      goto LABEL_17;
    }
    uint64_t v19 = [v3 assetState];
    char v20 = [v19 isEqualToString:@"MAInstalledWithOs"];

    if (v20)
    {
      uint64_t v6 = 6;
      goto LABEL_17;
    }
    id v25 = [MEMORY[0x263F77DA8] sharedDiag];
    v26 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event asset state, event: %@", v3];
    [v25 trackAnomaly:@"_SUCoreBorder_MAAssetState" forReason:v26 withResult:8113 withError:0];
  }
  uint64_t v6 = 0;
LABEL_17:
  uint64_t v21 = [MEMORY[0x263F77DE8] sharedLogger];
  v22 = [v21 oslog];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v3 assetState];
    *(_DWORD *)buf = 138412546;
    id v28 = v23;
    __int16 v29 = 2048;
    uint64_t v30 = v6;
    _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_STATE] using simulated state:%@ (enum:%ld)", buf, 0x16u);
  }
LABEL_20:

  return v6;
}

+ (id)_SUCoreBorder_MAAttributesAtBegin:()SUCoreBorderMAAsset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 simAction];
  if (v4 == 3)
  {
    id v7 = objc_alloc(NSDictionary);
    uint64_t v8 = [v3 assetAttributesPlist];
    id v9 = (void *)[v7 initWithContentsOfFile:v8];

    char v10 = [MEMORY[0x263F77DE8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] using simulated attributes:%@", buf, 0xCu);
    }
  }
  else
  {
    if (v4 == 1)
    {
      char v5 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating missing attributes", buf, 2u);
      }
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F77DA8] sharedDiag];
      char v12 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v3];
      [v6 trackAnomaly:@"_SUCoreBorder_MAAttributesAtBegin" forReason:v12 withResult:8113 withError:0];
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)_SUCoreBorder_MAAttributesAtEnd:()SUCoreBorderMAAsset withBaseAttributes:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 simAction];
  if (v7 == 3)
  {
    char v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
    id v11 = objc_alloc(NSDictionary);
    char v12 = [v5 assetAttributesPlist];
    id v13 = (void *)[v11 initWithContentsOfFile:v12];

    char v14 = [MEMORY[0x263F77DE8] sharedLogger];
    id v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating additional/replaced attributes:%@", buf, 0xCu);
    }

    [v10 addEntriesFromDictionary:v13];
  }
  else
  {
    if (v7 == 1)
    {
      uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
      id v9 = [v8 oslog];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[BORDER_MA_ATTRIBUTES] simulating missing attributes", buf, 2u);
      }
    }
    else
    {
      id v9 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
      [v9 trackAnomaly:@"_SUCoreBorder_MAAttributesAtEnd" forReason:v16 withResult:8113 withError:0];
    }
    char v10 = 0;
  }

  return v10;
}

+ (id)_getSimulatedAssetForDescriptor:()SUCoreBorderMAAsset type:
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 2)
  {
    id v9 = [v5 documentationAssetType];
    char v10 = [v6 productBuildVersion];
    id v11 = [v6 productVersion];
    id v13 = [v6 documentationID];
    char v14 = [v6 documentationAssetPurpose];
    char v12 = _getNewDocumentationMAAssetAttributesDictionary(v9, v10, v11, v13, v14);
  }
  else
  {
    if (a4 != 1)
    {
      char v12 = [MEMORY[0x263F77DA8] sharedDiag];
      [v12 trackAnomaly:@"_getSimulatedAssetForDescriptor" forReason:@"unsupported SUCoreBorderMobileAssetType" withResult:8113 withError:0];
      id v15 = 0;
LABEL_11:

      goto LABEL_13;
    }
    uint64_t v7 = [v5 softwareUpdateAssetType];
    int isUpdateBrainAssetType = _isUpdateBrainAssetType(v7);

    id v9 = [v6 softwareUpdateAssetType];
    char v10 = [v6 productBuildVersion];
    if (isUpdateBrainAssetType)
    {
      id v11 = [v6 softwareUpdateAssetPurpose];
      char v12 = _getNewUpdateBrainMAAssetAttributesDictionary(v9, v10, v11);
      goto LABEL_9;
    }
    id v11 = [v6 productVersion];
    id v13 = [v6 releaseType];
    char v14 = [v6 prerequisiteBuild];
    uint64_t v16 = [v6 prerequisiteOSVersion];
    uint64_t v17 = [v6 softwareUpdateAssetPurpose];
    char v12 = _getNewSoftwareUpdateMAAssetAttributesDictionary(v9, v10, v11, v13, v14, v16, v17);
  }
LABEL_9:

  if (v12)
  {
    id v15 = (void *)[objc_alloc(MEMORY[0x263F55938]) initWithAttributes:v12];
    goto LABEL_11;
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (void)_setCommonSplunkFields:()SUCoreBorderMAAsset withSessionId:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 attributes];
  id v17 = [v8 objectForKey:@"_DownloadSize"];

  id v9 = (void *)*MEMORY[0x263F78138];
  if (v17) {
    id v10 = v17;
  }
  else {
    id v10 = (id)*MEMORY[0x263F78138];
  }
  [v7 setSafeObject:v10 forKey:*MEMORY[0x263F78088]];
  id v11 = [a1 attributes];
  char v12 = [v11 objectForKey:@"AssetType"];

  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = v9;
  }
  [v7 setSafeObject:v13 forKey:*MEMORY[0x263F78060]];
  char v14 = [a1 attributes];
  id v15 = [v14 objectForKey:@"Build"];

  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v9;
  }
  [v7 setSafeObject:v16 forKey:*MEMORY[0x263F78110]];
  [v7 setSafeObject:v6 forKey:*MEMORY[0x263F78130]];
}

- (void)_prepAndSendDownloadStartedSplunkEvent:()SUCoreBorderMAAsset
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setSafeObject:*MEMORY[0x263F780E8] forKey:*MEMORY[0x263F780B0]];
  [a1 _setCommonSplunkFields:v6 withSessionId:v4];

  id v5 = [MEMORY[0x263F77DC0] sharedReporter];
  [v5 sendEvent:v6];
}

- (void)_prepAndSendDownloadFinishedSplunkEvent:()SUCoreBorderMAAsset withError:withSessionId:
{
  id v13 = a4;
  id v8 = a5;
  id v9 = objc_opt_new();
  [v9 setSafeObject:*MEMORY[0x263F780E0] forKey:*MEMORY[0x263F780B0]];
  id v10 = [NSNumber numberWithInt:a3];
  [v9 setSafeObject:v10 forKey:*MEMORY[0x263F78080]];

  if (a3)
  {
    id v11 = [v13 checkedNameForCode];
    [v9 setSafeObject:v11 forKey:*MEMORY[0x263F78078]];
  }
  [a1 _setCommonSplunkFields:v9 withSessionId:v8];
  char v12 = [MEMORY[0x263F77DC0] sharedReporter];
  [v12 sendEvent:v9];
}

@end