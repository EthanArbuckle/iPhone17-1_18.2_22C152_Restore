@interface SBSystemApertureContinuityWindowSceneDelegate
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation SBSystemApertureContinuityWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v40 = v8;
    __int16 v41 = 2114;
    v42 = v11;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ connected", buf, 0x16u);
  }
  v12 = [v8 _FBSScene];
  v13 = [v12 continuitySessionSceneParticipant];

  v14 = [v13 continuitySession];
  v15 = [v14 mainWindowScene];
  if (!v15)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 43, @"We don't have an main window scene for the session: %@", v14 object file lineNumber description];
  }
  v16 = [v15 systemApertureController];
  if (!v16)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 45, @"Couldn't find the system aperture controller for the continuity display's main scene <%p>", v15);
  }
  SEL v37 = a2;
  v17 = [v9 role];
  int v18 = [v17 isEqualToString:@"SBWindowSceneSessionRoleSystemApertureContinuity"];
  int v19 = [v17 isEqualToString:@"SBWindowSceneSessionRoleSystemApertureContinuityCurtain"];
  if (v18)
  {
    id v38 = v9;
    uint64_t v20 = objc_opt_class();
    id v21 = v8;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    v27 = v22;

    if (!v27)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:v37, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 52, @"systemApertureRole's scene is the wrong type %@", objc_opt_class() object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, v22);
    windowScene = self->_windowScene;
    self->_windowScene = v27;
    v26 = v27;

    debugName = self->_debugName;
    self->_debugName = (NSString *)@"systemAperture";

    [(UIWindowScene *)v26 setAssociatedWindowScene:v15];
    [v14 noteSystemApertureSceneConnected:v26];
    [v16 highLevelContinuitySystemApertureWindowSceneDidConnect:v26];
    [v14 noteSystemApertureUIIsReady:v26];
LABEL_26:
    id v9 = v38;
    goto LABEL_27;
  }
  if (v19)
  {
    id v38 = v9;
    uint64_t v23 = objc_opt_class();
    id v24 = v8;
    if (v23)
    {
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    v30 = v25;

    if (!v30)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:v37, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 63, @"systemApertureCurtainRole's scene is the wrong type %@", objc_opt_class() object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, v25);
    v31 = self->_windowScene;
    self->_windowScene = v30;
    v26 = v30;

    v32 = self->_debugName;
    self->_debugName = (NSString *)@"systemApertureCurtain";

    [(UIWindowScene *)v26 setAssociatedWindowScene:v15];
    [v14 noteSystemApertureCurtainSceneConnected:v26];
    [v16 superHighLevelContinuityCurtainWindowSceneDidConnect:v26];
    [v14 noteSystemApertureCurtainUIIsReady:v26];
    goto LABEL_26;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [(UIWindowScene *)v26 handleFailureInMethod:v37, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 73, @"unexpected role for SBSystemApertureContinuityWindowSceneDelegate: %@", v17 object file lineNumber description];
LABEL_27:
}

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SBLogContinuityDisplay();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 _sceneIdentifier];
    *(_DWORD *)buf = 134218242;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ disconnected", buf, 0x16u);
  }
  uint64_t v8 = objc_opt_class();
  id v9 = (SBSystemApertureContinuityCurtainWindowScene *)v5;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = [(SBAccessoryWindowScene *)v11 associatedWindowScene];
  if (!v12)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 82, @"We don't have an associated window scene for <%p>:%@", v9, self->_debugName object file lineNumber description];
  }
  v13 = [v12 systemApertureController];
  if (!v13)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSystemApertureContinuityWindowSceneDelegate.m", 85, @"Couldn't find the system aperture controller for the continuity display's main scene <%p> for scene <%p>:%@", v12, v9, self->_debugName object file lineNumber description];
  }
  if ((SBSystemApertureContinuityCurtainWindowScene *)self->_systemApertureContinuityWindowScene == v9)
  {
    [v13 highLevelContinuitySystemApertureWindowSceneDidDisconnect:v9];
    systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
    self->_systemApertureContinuityWindowScene = 0;
  }
  else if (self->_systemApertureContinuityCurtainWindowScene == v9)
  {
    [v13 superHighLevelContinuityCurtainWindowSceneDidDisconnect:v9];
    systemApertureContinuityWindowScene = self->_systemApertureContinuityCurtainWindowScene;
    self->_systemApertureContinuityCurtainWindowScene = 0;
  }
  else
  {
    systemApertureContinuityWindowScene = [MEMORY[0x1E4F28B00] currentHandler];
    [systemApertureContinuityWindowScene handleFailureInMethod:a2 object:self file:@"SBSystemApertureContinuityWindowSceneDelegate.m" lineNumber:94 description:@"What kind of system aperture scene is this??"];
  }

  windowScene = self->_windowScene;
  self->_windowScene = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, 0);
}

@end