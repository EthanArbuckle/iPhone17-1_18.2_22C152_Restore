@interface _UISceneRenderingEnvironmentClientComponent
- (BOOL)isCapturingContentForAdditionalRenderingDestination;
- (NSString)systemDisplayIdentifier;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneWillInvalidate:(id)a3;
@end

@implementation _UISceneRenderingEnvironmentClientComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 settingsDiff];
  int v9 = [v8 containsProperty:sel_modern_isCapturingContentForAdditionalRenderingDestination];
  int v10 = [v8 containsProperty:sel_displayConfiguration];
  if (![v8 containsProperty:sel_foreground])
  {
    int v13 = [(_UISceneRenderingEnvironmentClientComponent *)self isCapturingContentForAdditionalRenderingDestination];
    if ((v9 | v10 & v13) != 1) {
      goto LABEL_21;
    }
LABEL_7:
    id v48 = v6;
    v25 = [v7 settings];
    v26 = [v25 displayConfiguration];
    v27 = [v26 identity];
    v18 = +[UIScreen _screenWithFBSDisplayIdentity:v27];

    if (v13 != [v18 isCaptured])
    {
      v28 = NSString;
      v29 = [(FBSSceneComponent *)self clientScene];
      v30 = [v29 identityToken];
      NSStringFromBOOL();
      id v31 = v7;
      v33 = v32 = self;
      v34 = [v28 stringWithFormat:@"update for %@, capturing:%@", v30, v33];
      -[UIScreen _evaluateCapturedStateForReason:](v18, v34);

      self = v32;
      id v7 = v31;
    }
    id v6 = v48;
    if (!v10) {
      goto LABEL_20;
    }
    v35 = self;
    v36 = [v7 previousSettings];
    v37 = [v36 displayConfiguration];
    v38 = [v37 identity];
    v39 = +[UIScreen _screenWithFBSDisplayIdentity:v38];

    id v40 = v18;
    id v41 = v39;
    v42 = v41;
    if (v40 == v41)
    {
      v44 = v40;
    }
    else
    {
      if (v40 && v41)
      {
        char v43 = [v40 isEqual:v41];

        if (v43) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      v45 = NSString;
      v44 = [(FBSSceneComponent *)v35 clientScene];
      id v40 = [v44 identityToken];
      v46 = NSStringFromBOOL();
      v47 = [v45 stringWithFormat:@"old display for %@, capturing:%@", v40, v46];
      -[UIScreen _evaluateCapturedStateForReason:](v42, v47);
    }
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v11 = [v6 settings];
  int v12 = [v11 isForeground];

  int v13 = [(_UISceneRenderingEnvironmentClientComponent *)self isCapturingContentForAdditionalRenderingDestination];
  if ((v9 | v10 & v13)) {
    goto LABEL_7;
  }
  if (v12)
  {
    v14 = self;
    v15 = [v7 settings];
    v16 = [v15 displayConfiguration];
    v17 = [v16 identity];
    v18 = +[UIScreen _screenWithFBSDisplayIdentity:v17];

    if (v13 != [v18 isCaptured])
    {
      v19 = NSString;
      v20 = [(FBSSceneComponent *)v14 clientScene];
      v21 = [v20 identityToken];
      v22 = [v19 stringWithFormat:@"moving to foreground: %@", v21];

      dispatch_time_t v23 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71___UISceneRenderingEnvironmentClientComponent_scene_didUpdateSettings___block_invoke;
      block[3] = &unk_1E52D9F98;
      id v50 = v18;
      id v51 = v22;
      id v24 = v22;
      dispatch_after(v23, MEMORY[0x1E4F14428], block);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  v3 = [(FBSSceneComponent *)self scene];
  v4 = [v3 settings];
  if (objc_msgSend(v4, "modern_isCapturingContentForAdditionalRenderingDestination")) {
    BOOL v5 = !*(&self->super._invalid + 1);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)systemDisplayIdentifier
{
  v2 = [(FBSSceneComponent *)self scene];
  v3 = [v2 settings];
  v4 = [v3 systemDisplayIdentifier];

  return (NSString *)v4;
}

- (void)sceneWillInvalidate:(id)a3
{
  if ([(_UISceneRenderingEnvironmentClientComponent *)self isCapturingContentForAdditionalRenderingDestination])
  {
    *(&self->super._invalid + 1) = 1;
    v4 = [(FBSSceneComponent *)self scene];
    BOOL v5 = [v4 settings];
    id v6 = [v5 displayConfiguration];
    id v7 = [v6 identity];
    id v12 = +[UIScreen _screenWithFBSDisplayIdentity:v7];

    v8 = NSString;
    int v9 = [(FBSSceneComponent *)self clientScene];
    int v10 = [v9 identityToken];
    v11 = [v8 stringWithFormat:@"scene invalidating: %@", v10];
    -[UIScreen _evaluateCapturedStateForReason:](v12, v11);
  }
}

@end