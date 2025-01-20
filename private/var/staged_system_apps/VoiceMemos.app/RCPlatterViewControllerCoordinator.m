@interface RCPlatterViewControllerCoordinator
- (RCPlatterViewControllerCoordinator)init;
- (void)activeLayoutModeDidChangeForPlatterViewController:previousActiveLayoutMode:;
- (void)backlightLuminanceDidChangeForPlatterViewController:(id)a3;
- (void)stopCapturingForPlatterViewController:(id)a3;
@end

@implementation RCPlatterViewControllerCoordinator

- (void)activeLayoutModeDidChangeForPlatterViewController:previousActiveLayoutMode:
{
  id v0 = [self sharedAppDelegate];
  if (v0)
  {
    v1 = v0;
    id v2 = [v0 defaultSceneDelegate];
    if (v2)
    {
      v3 = v2;
      id v4 = [v1 connectedLockScreenSceneDelegate];
      if (v4)
      {
        v5 = v4;
        id v6 = [v1 dynamicIslandSceneDelegate];
        if (v6)
        {
          v7 = v6;
          unsigned int v8 = [v3 isInForeground];
          unsigned int v9 = v8 | [v5 isInForeground];
          id v10 = [v7 platterViewController];
          id v11 = [v10 activeLayoutMode];

          uint64_t v12 = (v11 != (id)4) & ~v9;
          id v13 = [self sharedStyleProvider];
          [v13 displayRefreshRate:v12];
          int v15 = v14;
          int v17 = v16;
          int v19 = v18;

          id v33 = [self sharedManager];
          LODWORD(v20) = v15;
          LODWORD(v21) = v17;
          LODWORD(v22) = v19;
          [v33 setPreferredFrameRateRange:v20, v21, v22];

          goto LABEL_11;
        }

        v1 = v3;
      }
      else
      {
        v5 = v3;
      }

      v1 = v5;
    }
  }
  id v23 = [self sharedStyleProvider];
  [v23 displayRefreshRate:0];
  int v25 = v24;
  int v27 = v26;
  int v29 = v28;

  id v33 = [self sharedManager];
  LODWORD(v30) = v25;
  LODWORD(v31) = v27;
  LODWORD(v32) = v29;
  [v33 setPreferredFrameRateRange:v30, v31, v32];
LABEL_11:
}

- (void)stopCapturingForPlatterViewController:(id)a3
{
  v5 = self;
  id v6 = (RCPlatterViewControllerCoordinator *)a3;
  id v11 = self;
  id v7 = [v5 sharedAppDelegate];
  if (v7)
  {
    unsigned int v8 = v7;
    id v9 = [v7 defaultSceneDelegate];

    if (v9)
    {
      id v10 = (RCPlatterViewControllerCoordinator *)[v9 mainViewController];

      [(RCPlatterViewControllerCoordinator *)v10 endRecording];
      id v6 = v11;
      id v11 = v10;
    }
  }
}

- (void)backlightLuminanceDidChangeForPlatterViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10016470C();
}

- (RCPlatterViewControllerCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlatterViewControllerCoordinator();
  return [(RCPlatterViewControllerCoordinator *)&v3 init];
}

@end