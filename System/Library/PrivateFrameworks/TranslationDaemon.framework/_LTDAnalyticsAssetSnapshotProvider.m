@interface _LTDAnalyticsAssetSnapshotProvider
- (void)collectAssetSnapshotWithCompletion:(id)a3;
@end

@implementation _LTDAnalyticsAssetSnapshotProvider

- (void)collectAssetSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__2;
  v22[4] = __Block_byref_object_dispose__2;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2;
  v20[4] = __Block_byref_object_dispose__2;
  id v21 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke;
  v16[3] = &unk_265546138;
  v18 = v22;
  v19 = v24;
  v5 = v4;
  v17 = v5;
  +[_LTDAssetService catalogAssetsWithCompletion:v16];
  dispatch_group_enter(v5);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3;
  v13[3] = &unk_265546160;
  v15 = v20;
  v6 = v5;
  v14 = v6;
  +[_LTDAssetService installedAssetsWithCompletion:v13];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_4;
  block[3] = &unk_265546188;
  v11 = v22;
  v12 = v20;
  id v9 = v3;
  v10 = v24;
  id v7 = v3;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

@end