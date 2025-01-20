@interface SBSystemApertureWindowSceneDelegate
- (id)_associatedWindowSceneForScene:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation SBSystemApertureWindowSceneDelegate

- (id)_associatedWindowSceneForScene:(id)a3
{
  v3 = [a3 _FBSScene];
  v4 = [(id)SBApp windowSceneManager];
  v5 = [v3 settings];
  v6 = [v5 displayIdentity];
  v7 = [v4 windowSceneForDisplayIdentity:v6];

  return v7;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v25 = a3;
  v8 = [a4 role];
  int v9 = [v8 isEqualToString:@"SBWindowSceneSessionRoleSystemAperture"];
  int v10 = [v8 isEqualToString:@"SBWindowSceneSessionRoleSystemApertureCurtain"];
  int v11 = v10;
  if (v9 & 1) != 0 || (v10)
  {
    if (v9)
    {
LABEL_4:
      uint64_t v12 = objc_opt_class();
      id v13 = v25;
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v15 = v14;

      if (!v15) {
        goto LABEL_25;
      }
      if (self->_systemApertureWindowScene)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"SBSystemApertureWindowSceneDelegate.m" lineNumber:49 description:@"Only support one of these"];
      }
      objc_storeStrong((id *)&self->_systemApertureWindowScene, v14);
      v16 = [(SBSystemApertureWindowSceneDelegate *)self _associatedWindowSceneForScene:v15];
      [v15 setAssociatedWindowScene:v16];
      v17 = [v16 systemApertureController];
      [v17 createHighLevelSystemApertureWindowWithWindowScene:v15];
      goto LABEL_24;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBSystemApertureWindowSceneDelegate.m" lineNumber:45 description:@"unexpected role for SBSystemApertureWindowSceneDelegate"];

    if (v9) {
      goto LABEL_4;
    }
  }
  if (!v11) {
    goto LABEL_26;
  }
  uint64_t v19 = objc_opt_class();
  id v20 = v25;
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  id v15 = v21;

  if (v15)
  {
    p_superHighLevelCurtainWindowScene = &self->_superHighLevelCurtainWindowScene;
    if (self->_superHighLevelCurtainWindowScene)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"SBSystemApertureWindowSceneDelegate.m" lineNumber:59 description:@"Only support one of these"];

      p_superHighLevelCurtainWindowScene = &self->_superHighLevelCurtainWindowScene;
    }
    objc_storeStrong((id *)p_superHighLevelCurtainWindowScene, v21);
    v16 = [(SBSystemApertureWindowSceneDelegate *)self _associatedWindowSceneForScene:v15];
    [v15 setAssociatedWindowScene:v16];
    v17 = [v16 systemApertureController];
    [v17 createSuperHighLevelCurtainWithWindowScene:v15];
LABEL_24:
  }
LABEL_25:

LABEL_26:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superHighLevelCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureWindowScene, 0);
}

@end