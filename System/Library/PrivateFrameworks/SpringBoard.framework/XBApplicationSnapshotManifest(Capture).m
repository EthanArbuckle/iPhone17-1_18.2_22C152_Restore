@interface XBApplicationSnapshotManifest(Capture)
- (id)createSnapshotForSceneSnapshot:()Capture withName:;
@end

@implementation XBApplicationSnapshotManifest(Capture)

- (id)createSnapshotForSceneSnapshot:()Capture withName:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 context];
  v9 = [v8 sceneID];
  if (v9)
  {
    v10 = [a1 createSnapshotWithGroupID:v9];
    v11 = [MEMORY[0x1E4FA58A8] normalizeSnapshotName:v7];
    [v10 setName:v11];

    if ([v8 orientation] == 1)
    {
      [v10 setInterfaceOrientation:1];
    }
    else
    {
      v12 = [v8 settings];
      objc_msgSend(v10, "setInterfaceOrientation:", objc_msgSend(v12, "interfaceOrientation"));
    }
    [v8 frame];
    objc_msgSend(v10, "setReferenceSize:", v13, v14);
    v15 = [v8 settings];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    v20 = [v8 settings];
    v21 = [v20 displayConfiguration];
    [v21 bounds];
    BOOL v24 = v19 == v23 && v17 == v22;
    [v10 setFullScreen:v24];

    [v10 setContentType:0];
    v25 = [v8 expirationDate];
    [v10 setExpirationDate:v25];

    [v10 setUserInterfaceStyle:XBGetUIUserInterfaceStyleForSceneSnapshot(v6)];
    v26 = XBGetCustomSafeAreaInsetsForSceneSnapshot(v6);
    [v10 setCustomSafeAreaInsets:v26];
    v27 = [v8 clientSettings];
    if ([v27 isUISubclass])
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4FA58F0]);
      objc_msgSend(v28, "setHidden:", objc_msgSend(v27, "statusBarHidden"));
      objc_msgSend(v28, "setStyle:", objc_msgSend(v27, "statusBarStyle"));
      [v10 setStatusBarSettings:v28];
      objc_msgSend(v10, "setBackgroundStyle:", objc_msgSend(v27, "backgroundStyle"));
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end