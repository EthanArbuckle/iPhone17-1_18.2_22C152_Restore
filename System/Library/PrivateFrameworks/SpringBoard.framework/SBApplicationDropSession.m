@interface SBApplicationDropSession
+ (BOOL)_dragItemRepresentsAcceptableFileDrag:(id)a3;
+ (BOOL)_itemProviderRequiresOpenInPlace:(id)a3;
+ (BOOL)canHandleUIDragDropSession:(id)a3;
+ (SBApplicationDropSession)dropSessionWithWindowUIDragSession:(id)a3;
+ (id)_applicationForHandlingDragItem:(id)a3 URL:(id)a4 error:(id *)a5;
+ (id)_applicationForIconLeafIdentifier:(id)a3;
+ (id)_applicationProxyForIdentifiers:(id)a3 forURL:(id)a4 passingTest:(id)a5 error:(id *)a6;
+ (void)_getFileDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7;
+ (void)_getLocalAppDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 completion:(id)a6;
+ (void)_getURLDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7;
+ (void)_getUserActivityDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7;
+ (void)_getUserNotificationDropSessionWithUIDragDropSession:(id)a3 systemSession:(id)a4 dragItem:(id)a5 completion:(id)a6;
+ (void)getDropSessionWithUIDropSession:(id)a3 sceneProvider:(id)a4 defaultToSourceApplication:(BOOL)a5 completion:(id)a6;
- (BOOL)_isApplicationBoundToVisibleIcon;
- (BOOL)isNotificationDrag;
- (BOOL)isWindowTearOff;
- (FBSSceneIdentity)sceneIdentity;
- (NSSet)launchActions;
- (NSString)targetContentIdentifier;
- (SBActivationSettings)activationSettings;
- (SBApplication)application;
- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 activity:(id)a6 activityData:(id)a7;
- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6;
- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 URL:(id)a7 requiresOpenInPlace:(BOOL)a8;
- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 localContext:(id)a7 activity:(id)a8 activityData:(id)a9;
- (SBSAppDragLocalContext)localContext;
- (UIDragDropSession)uiDragDropSession;
- (UIDraggingSystemSession)systemSession;
- (id)_activityContinuationActionFromActivity:(id)a3 activityData:(id)a4;
- (id)_initWithUIDragDropSession:(id)a3 application:(id)a4 targetContentIdentifier:(id)a5;
- (int64_t)dropZones;
- (void)calculateSceneIdentityWithSceneProvider:(id)a3 completion:(id)a4;
- (void)setSceneIdentity:(id)a3;
- (void)setTargetContentIdentifier:(id)a3;
@end

@implementation SBApplicationDropSession

+ (BOOL)canHandleUIDragDropSession:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13[0] = *MEMORY[0x1E4FA6E60];
  v13[1] = @"com.apple.springboard.private.windowdrag";
  v13[2] = *MEMORY[0x1E4FB38A8];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  char v6 = [v4 hasItemsConformingToTypeIdentifiers:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    v8 = SBFSafeProtocolCast();
    if (v8)
    {
      v9 = [MEMORY[0x1E4F429C0] sharedInstance];
      v10 = [v9 sessionForDropSession:v8];

      if (v10)
      {
        if (([v8 canLoadObjectsOfClass:objc_opt_class()] & 1) != 0
          || ([v8 canLoadObjectsOfClass:objc_opt_class()] & 1) != 0)
        {
          char v7 = 1;
        }
        else
        {
          v11 = SBApplicationDropSessionGetDragItem(v8);
          char v7 = [a1 _dragItemRepresentsAcceptableFileDrag:v11];
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

+ (SBApplicationDropSession)dropSessionWithWindowUIDragSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  char v7 = [v5 localContext];
  v8 = SBSafeCast(v6, v7);

  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"SBApplicationDropSession.m" lineNumber:145 description:@"A window drag session must have a local context."];
  }
  if ([v8 startLocation] != 8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"SBApplicationDropSession.m" lineNumber:146 description:@"A window drag session must have the start location SBSAppDragLocalContextStartLocationWindow."];
  }
  v9 = [v8 draggedSceneIdentifier];

  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"SBApplicationDropSession.m" lineNumber:147 description:@"A window drag session must have a draggedSceneIdentifier."];
  }
  v10 = +[SBApplicationController sharedInstance];
  v11 = [v8 applicationBundleIdentifier];
  v12 = [v10 applicationWithBundleIdentifier:v11];

  v13 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:v5 systemSession:0 application:v12 targetContentIdentifier:0 localContext:v8 activity:0 activityData:0];
  v14 = [v8 draggedSceneIdentifier];
  if (v14)
  {
    v15 = [MEMORY[0x1E4F62A60] identityForIdentifier:v14];
    [(SBApplicationDropSession *)v13 setSceneIdentity:v15];
  }
  return v13;
}

+ (void)getDropSessionWithUIDropSession:(id)a3 sceneProvider:(id)a4 defaultToSourceApplication:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v94[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke;
  v89[3] = &unk_1E6B08CF8;
  id v13 = v12;
  id v91 = v13;
  id v14 = v11;
  id v90 = v14;
  v15 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v89);
  v16 = SBApplicationDropSessionGetDragItem(v10);
  if (!v16)
  {
    v17 = [v10 items];
    uint64_t v28 = [v17 count];
    v19 = SBApplicationDropSessionErrorCreate(1, @"Incorrect number of drag items: %ld [expected 1]", v29, v30, v31, v32, v33, v34, v28);
    ((void (**)(void, void, void *))v15)[2](v15, 0, v19);
    goto LABEL_31;
  }
  BOOL v83 = v7;
  v17 = SBFSafeProtocolCast();
  v18 = [MEMORY[0x1E4F429C0] sharedInstance];
  v19 = [v18 sessionForDropSession:v17];

  v94[0] = *MEMORY[0x1E4FA6E60];
  v94[1] = @"com.apple.springboard.private.windowdrag";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  int v21 = [v10 hasItemsConformingToTypeIdentifiers:v20];

  if (!v21)
  {
    if (!v19)
    {
      v50 = SBApplicationDropSessionErrorCreate(3, @"Dragging system monitor did not return a system session.", v22, v23, v24, v25, v26, v27, v78);
      ((void (**)(void, void, void *))v15)[2](v15, 0, v50);

      goto LABEL_31;
    }
    id v82 = a1;
    v35 = [v16 itemProvider];
    uint64_t v36 = objc_msgSend(v35, "sbui_preferredApplicationBundleIdentifier");

    v37 = [v16 itemProvider];
    uint64_t v38 = objc_msgSend(v37, "sbui_requiredApplicationBundleIdentifier");

    v39 = (void *)v38;
    if (v36 | v38)
    {
      if (v38) {
        uint64_t v40 = v38;
      }
      else {
        uint64_t v40 = v36;
      }
      uint64_t v41 = [v82 _applicationForIconLeafIdentifier:v40];
      if (v38)
      {
        unint64_t v48 = 0x1E4F1C000;
        if (!v41)
        {
          v49 = SBApplicationDropSessionErrorCreate(7, @"Missing required application for drag item: %@", v42, v43, v44, v45, v46, v47, (uint64_t)v39);
          ((void (**)(void, void, void *))v15)[2](v15, 0, v49);
LABEL_30:

          goto LABEL_31;
        }
LABEL_16:
        v79 = (void *)v41;
        v80 = v39;
        uint64_t v81 = v36;
        uint64_t v93 = *MEMORY[0x1E4FA7EA8];
        v51 = [*(id *)(v48 + 2424) arrayWithObjects:&v93 count:1];
        int v52 = [v10 hasItemsConformingToTypeIdentifiers:v51];

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E4F624B8];
          v54 = [v19 info];
          v55 = v54;
          if (v54) {
            [v54 auditToken];
          }
          else {
            memset(v88, 0, sizeof(v88));
          }
          char v56 = [v53 authenticateAuditToken:v88 forEntitlement:@"com.apple.springboard.applicationDrag" error:0];

          if ((v56 & 1) == 0)
          {
            v65 = SBApplicationDropSessionErrorCreate(8, @"Preventing application from initiating app icon drag without entitlement.", v57, v58, v59, v60, v61, v62, v78);
            ((void (**)(void, void, void *))v15)[2](v15, 0, v65);

            v49 = v79;
            v39 = v80;
            goto LABEL_29;
          }
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_4;
          v84[3] = &unk_1E6B08D20;
          v87 = v15;
          id v85 = v10;
          id v86 = v19;
          [v86 loadUserActivityForItem:v16 completion:v84];
        }
        uint64_t v92 = *MEMORY[0x1E4FB38A8];
        v63 = [*(id *)(v48 + 2424) arrayWithObjects:&v92 count:1];
        int v64 = [v10 hasItemsConformingToTypeIdentifiers:v63];

        if (v64)
        {
          [v82 _getUserNotificationDropSessionWithUIDragDropSession:v10 systemSession:v19 dragItem:v16 completion:v15];
LABEL_24:
          v39 = v80;
          uint64_t v36 = v81;
LABEL_25:
          v49 = v79;
          goto LABEL_30;
        }
        v39 = v80;
        if (![v10 canLoadObjectsOfClass:objc_opt_class()])
        {
          uint64_t v36 = v81;
          if ([v82 _dragItemRepresentsAcceptableFileDrag:v16])
          {
            v49 = v79;
            [v82 _getFileDropSessionWithUIDragDropSession:v10 dragItem:v16 systemSession:v19 targetApplication:v79 completion:v15];
            goto LABEL_30;
          }
          if ([v10 canLoadObjectsOfClass:objc_opt_class()])
          {
            v49 = v79;
            [v82 _getURLDropSessionWithUIDragDropSession:v10 dragItem:v16 systemSession:v19 targetApplication:v79 completion:v15];
            goto LABEL_30;
          }
          if (v83)
          {
            v72 = [v19 info];
            v73 = +[SBApplicationController sharedInstance];
            v74 = objc_msgSend(v73, "applicationWithPid:", objc_msgSend(v72, "processIdentifier"));

            v75 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:v10 systemSession:v19 application:v74 targetContentIdentifier:0];
            if (v75)
            {
              v76 = v75;
              ((void (**)(void, SBApplicationDropSession *, void))v15)[2](v15, v75, 0);

              goto LABEL_24;
            }

            v39 = v80;
            uint64_t v36 = v81;
          }
          v77 = SBApplicationDropSessionErrorCreate(6, @"Drag item did not contain any conforming type identifiers", v66, v67, v68, v69, v70, v71, v78);
          ((void (**)(void, void, void *))v15)[2](v15, 0, v77);

          goto LABEL_25;
        }
        v49 = v79;
        [v82 _getUserActivityDropSessionWithUIDragDropSession:v10 dragItem:v16 systemSession:v19 targetApplication:v79 completion:v15];
LABEL_29:
        uint64_t v36 = v81;
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v41 = 0;
    }
    unint64_t v48 = 0x1E4F1C000uLL;
    goto LABEL_16;
  }
  [a1 _getLocalAppDropSessionWithUIDragDropSession:v10 dragItem:v16 systemSession:v19 completion:v15];
LABEL_31:
}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v10 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v10)
  {
    if (!v9)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_3;
      v16[3] = &unk_1E6AF5E98;
      uint64_t v13 = *(void *)(a1 + 48);
      id v18 = *(id *)(a1 + 56);
      id v17 = *(id *)(a1 + 32);
      [v10 calculateSceneIdentityWithSceneProvider:v13 completion:v16];

      return;
    }
    uint64_t v11 = *(void *)(a1 + 56);
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v9)
  {
LABEL_5:
    id v12 = *(void (**)(uint64_t, void *))(v11 + 16);
    v12(v11, v10);
    return;
  }
  SBApplicationDropSessionErrorCreate(5, @"dropSession completed without a drop session or error. Assuming application was not found.", 0, a4, v11 + 16, a6, a7, a8, (uint64_t)v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v15);
}

uint64_t __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void __112__SBApplicationDropSession_getDropSessionWithUIDropSession_sceneProvider_defaultToSourceApplication_completion___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  id v28 = v3;
  if (v3)
  {
    id v10 = [v3 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FA7E88]];

    if (v11)
    {
      id v18 = +[SBApplicationController sharedInstance];
      v19 = [v18 applicationWithBundleIdentifier:v11];

      v20 = [SBApplicationDropSession alloc];
      uint64_t v21 = a1[4];
      uint64_t v22 = a1[5];
      uint64_t v23 = [v28 targetContentIdentifier];
      uint64_t v24 = [(SBApplicationDropSession *)v20 initWithUIDragDropSession:v21 systemSession:v22 application:v19 targetContentIdentifier:v23];

      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      uint64_t v26 = a1[6];
      v19 = SBApplicationDropSessionErrorCreate(5, @"Bundle identifier missing from user activity user info.", v12, v13, v14, v15, v16, v17, v27);
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v19);
    }
  }
  else
  {
    uint64_t v25 = a1[6];
    uint64_t v11 = SBApplicationDropSessionErrorCreate(4, @"System session did not provide a user activity", v4, v5, v6, v7, v8, v9, v27);
    (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v11);
  }
}

+ (void)_getLocalAppDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = objc_msgSend(a4, "sbh_appDragLocalContext");
  v20 = v13;
  if (v13)
  {
    uint64_t v21 = [v13 uniqueIdentifier];
    id v28 = [a1 _applicationForIconLeafIdentifier:v21];
    if (v28)
    {
      if ([v20 isSourceLocal]) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = v11;
      }
      id v30 = v29;
      uint64_t v31 = [v20 userActivity];
      if (v31)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __107__SBApplicationDropSession__getLocalAppDropSessionWithUIDragDropSession_dragItem_systemSession_completion___block_invoke;
        v34[3] = &unk_1E6B08D48;
        id v35 = v10;
        id v36 = v30;
        id v37 = v28;
        id v38 = v20;
        id v39 = v31;
        id v40 = v12;
        [v39 _createUserActivityDataWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v34];
      }
      else
      {
        uint64_t v32 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:v10 systemSession:v30 application:v28 targetContentIdentifier:0 localContext:v20 activity:0 activityData:0];
        (*((void (**)(id, SBApplicationDropSession *, void))v12 + 2))(v12, v32, 0);
      }
    }
    else
    {
      SBApplicationDropSessionErrorCreate(2, @"Drag item contains app drag local context, but missing icon identifier.", v22, v23, v24, v25, v26, v27, v33);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, id))v12 + 2))(v12, 0, v30);
    }
  }
  else
  {
    uint64_t v21 = SBApplicationDropSessionErrorCreate(2, @"Drag item contains app drag private type identifier, but missing SBAppDragLocalContext", v14, v15, v16, v17, v18, v19, v33);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v21);
  }
}

void __107__SBApplicationDropSession__getLocalAppDropSessionWithUIDragDropSession_dragItem_systemSession_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:a1[4] systemSession:a1[5] application:a1[6] targetContentIdentifier:0 localContext:a1[7] activity:a1[8] activityData:v3];

  (*(void (**)(void))(a1[9] + 16))();
}

+ (void)_getUserNotificationDropSessionWithUIDragDropSession:(id)a3 systemSession:(id)a4 dragItem:(id)a5 completion:(id)a6
{
  id v39 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, SBApplicationDropSession *, void))a6;
  id v12 = objc_msgSend(a5, "sbh_appDragLocalContext");
  uint64_t v19 = v12;
  if (v12)
  {
    v20 = [v12 uniqueIdentifier];
    uint64_t v27 = [a1 _applicationForIconLeafIdentifier:v20];
    if (v27)
    {
      id v28 = [v19 launchActions];
      id v38 = [v28 anyObject];

      uint64_t v29 = [v38 response];
      [v29 notification];
      v31 = id v30 = v10;
      uint64_t v32 = [v31 request];
      uint64_t v33 = [v32 content];
      uint64_t v34 = [v33 targetContentIdentifier];

      id v10 = v30;
      id v35 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:v39 systemSession:v30 application:v27 targetContentIdentifier:v34 localContext:v19 activity:0 activityData:0];
      v11[2](v11, v35, 0);

      id v36 = v38;
    }
    else
    {
      id v36 = SBApplicationDropSessionErrorCreate(2, @"Drag item contains app drag local context, but missing icon identifier.", v21, v22, v23, v24, v25, v26, v37);
      ((void (**)(id, SBApplicationDropSession *, void *))v11)[2](v11, 0, v36);
    }
  }
  else
  {
    v20 = SBApplicationDropSessionErrorCreate(2, @"Drag item contains app drag private type identifier, but missing SBAppDragLocalContext", v13, v14, v15, v16, v17, v18, v37);
    ((void (**)(id, SBApplicationDropSession *, void *))v11)[2](v11, 0, v20);
  }
}

+ (id)_applicationForIconLeafIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SBApplicationController sharedInstanceIfExists];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];

  if (!v5)
  {
    uint64_t v6 = +[SBIconController sharedInstance];
    uint64_t v7 = [v6 model];
    uint64_t v8 = [v7 leafIconForIdentifier:v3];

    if ([v8 isBookmarkIcon])
    {
      uint64_t v9 = [v8 applicationToLaunch];
    }
    else
    {
      if (![v8 isApplicationIcon])
      {
        uint64_t v5 = 0;
        goto LABEL_8;
      }
      uint64_t v9 = [v8 application];
    }
    uint64_t v5 = (void *)v9;
LABEL_8:
  }
  return v5;
}

+ (BOOL)_dragItemRepresentsAcceptableFileDrag:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [a3 itemProvider];
    LOBYTE(v4) = 1;
    uint64_t v5 = [v3 registeredTypeIdentifiersWithFileOptions:1];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v7 = objc_msgSend(v3, "registeredTypeIdentifiers", 0);
      uint64_t v4 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4)
      {
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v7);
            }
            if ([v3 isDataAvailableImmediatelyForTypeIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)])
            {
              LOBYTE(v4) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v4 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (BOOL)_itemProviderRequiresOpenInPlace:(id)a3
{
  id v3 = [a3 registeredTypeIdentifiersWithFileOptions:1];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)_applicationProxyForIdentifiers:(id)a3 forURL:(id)a4 passingTest:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v28 = a4;
  id v10 = (uint64_t (**)(void, void *))a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    uint64_t v14 = *MEMORY[0x1E4F224A8];
    uint64_t v27 = v10;
    uint64_t v15 = v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1E4F22430];
        uint64_t v19 = [v15 lastPathComponent];
        v20 = [v18 documentProxyForName:v19 type:v17 MIMEType:0];

        uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
        id v30 = 0;
        uint64_t v22 = [v20 applicationsAvailableForOpeningWithHandlerRanks:v21 error:&v30];
        id v23 = v30;

        if (v23)
        {
          if (a6) {
            *a6 = v23;
          }
        }
        else
        {
          uint64_t v24 = [v22 objectForKeyedSubscript:v14];
          uint64_t v25 = [v24 firstObject];

          if (v27[2](v27, v25))
          {

            uint64_t v15 = v28;
            goto LABEL_15;
          }

          uint64_t v15 = v28;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    uint64_t v25 = 0;
LABEL_15:
    id v10 = v27;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v15 = v28;
  }

  return v25;
}

+ (id)_applicationForHandlingDragItem:(id)a3 URL:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [a3 itemProvider];
  id v10 = [v9 registeredTypeIdentifiersWithFileOptions:1];
  if ([v10 count])
  {
    uint64_t v11 = [a1 _applicationProxyForIdentifiers:v10 forURL:v8 passingTest:&__block_literal_global_148 error:a5];
  }
  else
  {
    [v9 registeredTypeIdentifiers];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v22 = v10;
      id v23 = v8;
      char v15 = 0;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v9, "isDataAvailableImmediatelyForTypeIdentifier:", v18, v22))
          {
            uint64_t v28 = v18;
            char v15 = 1;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
            v20 = id v19 = v12;
            uint64_t v11 = [a1 _applicationProxyForIdentifiers:v20 forURL:v23 passingTest:&__block_literal_global_150 error:a5];

            id v12 = v19;
            if (v11)
            {
              id v10 = v22;
              id v8 = v23;
              goto LABEL_16;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }

      if (v15)
      {
        uint64_t v11 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
      }
      else
      {
        uint64_t v11 = 0;
      }
      id v10 = v22;
      id v8 = v23;
    }
    else
    {
      uint64_t v11 = 0;
LABEL_16:
    }
  }

  return v11;
}

uint64_t __70__SBApplicationDropSession__applicationForHandlingDragItem_URL_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsOpenInPlace];
}

uint64_t __70__SBApplicationDropSession__applicationForHandlingDragItem_URL_error___block_invoke_2()
{
  return 1;
}

+ (void)_getFileDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v22[3] = &unk_1E6B08DB8;
  id v23 = v12;
  id v24 = v14;
  id v27 = v16;
  id v28 = a1;
  id v25 = v13;
  id v26 = v15;
  id v17 = v15;
  id v18 = v13;
  id v19 = v14;
  id v20 = v12;
  id v21 = v16;
  [v19 loadURLForItem:v18 completion:v22];
}

void __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v34[3] = &unk_1E6B08D90;
  id v39 = *(id *)(a1 + 64);
  id v4 = v3;
  id v35 = v4;
  id v36 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  id v37 = v5;
  uint64_t v40 = v6;
  id v38 = *(id *)(a1 + 48);
  id v13 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v34);
  if (v4)
  {
    id v14 = *(void **)(a1 + 56);
    if (v14)
    {
      id v15 = (void *)MEMORY[0x1E4F223B8];
      id v16 = [v14 bundleIdentifier];
      id v17 = [v15 applicationProxyForIdentifier:v16];

      LODWORD(v16) = [v17 supportsOpenInPlace];
      uint64_t v18 = [*(id *)(a1 + 56) bundleIdentifier];
      id v25 = (void *)v18;
      if (v16)
      {
        v13[2](v13, v18, 0);
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v32 = v18;
      uint64_t v30 = @"Provided application (%@) does not support opening file URL in place.";
      uint64_t v31 = 9;
    }
    else
    {
      id v26 = *(void **)(a1 + 72);
      uint64_t v27 = *(void *)(a1 + 48);
      id v33 = 0;
      id v25 = [v26 _applicationForHandlingDragItem:v27 URL:v4 error:&v33];
      id v28 = v33;
      id v17 = v28;
      if (v25)
      {
        uint64_t v29 = [v25 bundleIdentifier];
        ((void (**)(void, void *, void))v13)[2](v13, v29, 0);
LABEL_10:

        goto LABEL_13;
      }
      if (v28)
      {
        ((void (**)(void, void, id))v13)[2](v13, 0, v28);
        goto LABEL_13;
      }
      uint64_t v30 = @"LaunchServices could not find an application to open file URL in place.";
      uint64_t v31 = 5;
    }
    uint64_t v29 = SBApplicationDropSessionErrorCreate(v31, v30, v19, v20, v21, v22, v23, v24, v32);
    ((void (**)(void, void, void *))v13)[2](v13, 0, v29);
    goto LABEL_10;
  }
  id v17 = SBApplicationDropSessionErrorCreate(4, @"System session did not provide a URL", v7, v8, v9, v10, v11, v12, v32);
  ((void (**)(void, void, void *))v13)[2](v13, 0, v17);
LABEL_14:
}

void __121__SBApplicationDropSession__getFileDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v11 = a3;
  if (!v24 || v11)
  {
    uint64_t v22 = *(void *)(a1 + 64);
    if (v11)
    {
      (*(void (**)(void, void, id))(v22 + 16))(*(void *)(a1 + 64), 0, v11);
    }
    else
    {
      uint64_t v23 = SBApplicationDropSessionErrorCreate(5, @"LaunchServices did not find app for URL: %@", v5, v6, v7, v8, v9, v10, *(void *)(a1 + 32));
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
    }
  }
  else
  {
    uint64_t v12 = +[SBApplicationController sharedInstance];
    id v13 = [v12 applicationWithBundleIdentifier:v24];

    id v14 = [SBApplicationDropSession alloc];
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v17 = [*(id *)(a1 + 32) absoluteString];
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(a1 + 72);
    uint64_t v20 = [*(id *)(a1 + 56) itemProvider];
    uint64_t v21 = -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:](v14, "initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:", v16, v15, v13, v17, v18, [v19 _itemProviderRequiresOpenInPlace:v20]);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

+ (void)_getURLDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v19[3] = &unk_1E6B08E30;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v14;
  [v16 loadURLForItem:a4 completion:v19];
}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v24[3] = &unk_1E6B08DE0;
  id v28 = *(id *)(a1 + 56);
  id v4 = v3;
  id v25 = v4;
  id v26 = *(id *)(a1 + 32);
  id v27 = *(id *)(a1 + 40);
  id v11 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v24);
  if (v4)
  {
    id v12 = (void *)[v4 copy];
    id v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v14 = [v13 URLOverrideForURL:v12];

    if (([v14 isEqual:v12] & 1) == 0)
    {
      id v15 = SBLogMedusaDropDestination();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v12 absoluteString];
        id v17 = [v14 absoluteString];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v16;
        __int16 v31 = 2114;
        uint64_t v32 = v17;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "SBAppDrop: LaunchServices rewrote URL: %{public}@ -> %{public}@", buf, 0x16u);
      }
    }
    id v18 = *(void **)(a1 + 48);
    if (v18)
    {
      uint64_t v19 = [v18 bundleIdentifier];
      ((void (**)(void, void *, void))v11)[2](v11, v19, 0);
    }
    else
    {
      id v20 = (void *)MEMORY[0x1E4F22398];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = (uint64_t)__120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_168;
      v21[3] = (uint64_t)&unk_1E6B08E08;
      id v23 = v11;
      id v22 = v14;
      [v20 getAppLinkWithURL:v22 completionHandler:v21];

      uint64_t v19 = v23;
    }
  }
  else
  {
    id v12 = SBApplicationDropSessionErrorCreate(4, @"System session did not provide a URL", v5, v6, v7, v8, v9, v10, v21[0]);
    ((void (**)(void, void, void *))v11)[2](v11, 0, v12);
    id v14 = 0;
  }
}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(uint64_t *a1, void *a2, void *a3)
{
  id v21 = a2;
  id v11 = a3;
  if (!v21 || v11)
  {
    uint64_t v19 = a1[7];
    if (v11)
    {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(a1[7], 0, v11);
    }
    else
    {
      id v20 = SBApplicationDropSessionErrorCreate(5, @"LaunchServices did not find app for URL: %@", v5, v6, v7, v8, v9, v10, a1[4]);
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
    }
  }
  else
  {
    id v12 = +[SBApplicationController sharedInstance];
    id v13 = [v12 applicationWithBundleIdentifier:v21];

    id v14 = [SBApplicationDropSession alloc];
    uint64_t v16 = a1[5];
    uint64_t v15 = a1[6];
    id v17 = [(id)a1[4] absoluteString];
    id v18 = [(SBApplicationDropSession *)v14 initWithUIDragDropSession:v16 systemSession:v15 application:v13 targetContentIdentifier:v17 URL:a1[4] requiresOpenInPlace:0];

    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [a2 targetApplicationProxy];
    uint64_t v8 = [v7 bundleIdentifier];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v8, 0);
  }
  else
  {
    uint64_t v9 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_168_cold_1(a1, (uint64_t)v5, v9);
    }

    uint64_t v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v11 = [v10 applicationsAvailableForOpeningURL:*(void *)(a1 + 32)];
    id v12 = [v11 firstObject];

    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [v12 bundleIdentifier];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
  }
}

+ (void)_getUserActivityDropSessionWithUIDragDropSession:(id)a3 dragItem:(id)a4 systemSession:(id)a5 targetApplication:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke;
  v19[3] = &unk_1E6B08EA8;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v14;
  [v16 loadUserActivityForItem:a4 completion:v19];
}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2;
  v32[3] = &unk_1E6B08DE0;
  id v36 = *(id *)(a1 + 56);
  id v4 = v3;
  id v33 = v4;
  id v34 = *(id *)(a1 + 32);
  id v35 = *(id *)(a1 + 40);
  id v11 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v32);
  if (v4)
  {
    id v12 = *(void **)(a1 + 48);
    if (v12)
    {
      id v13 = [v12 bundleIdentifier];
      ((void (**)(void, void *, void))v11)[2](v11, v13, 0);
    }
    else
    {
      id v13 = [v4 _determineMatchingApplicationBundleIdentifierWithOptions:0];
      if (v13)
      {
        id v15 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v13 placeholder:0];
        if (v15) {
          goto LABEL_10;
        }
      }
      id v16 = [*(id *)(a1 + 40) info];
      id v17 = v16;
      if (v16) {
        [v16 auditToken];
      }

      id v18 = (void *)MEMORY[0x1E4F223B8];
      uint64_t v19 = BSBundleIDForAuditToken();
      id v20 = [v18 applicationProxyForIdentifier:v19 placeholder:0];

      [v20 teamID];
      [v4 activityType];
      id v21 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
      id v22 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v15 = [v22 applicationForUserActivityType:v21];

      if (v15)
      {
LABEL_10:
        id v23 = [v15 bundleIdentifier];
        ((void (**)(void, void *, void))v11)[2](v11, v23, 0);
      }
      else
      {
        uint64_t v24 = *(void *)(a1 + 56);
        id v15 = [v4 activityType];
        id v23 = SBApplicationDropSessionErrorCreate(5, @"LaunchServices did not find an application for user activity type: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v15);
        (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v23);
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = SBApplicationDropSessionErrorCreate(4, @"System session did not provide a user activity", v5, v6, v7, v8, v9, v10, v31);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v13);
  }
}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = +[SBApplicationController sharedInstance];
    uint64_t v9 = [v8 applicationWithBundleIdentifier:v5];

    id v19 = a1[4];
    id v22 = a1[7];
    id v20 = a1[5];
    id v21 = a1[6];
    id v10 = v9;
    BSDispatchMain();

LABEL_7:
    goto LABEL_8;
  }
  id v11 = (void (**)(id, void, void *))a1[7];
  if (!v6)
  {
    id v10 = [a1[4] activityType];
    id v18 = SBApplicationDropSessionErrorCreate(5, @"LaunchServices did not find an application for user activity type: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    v11[2](v11, 0, v18);

    goto LABEL_7;
  }
  v11[2](a1[7], 0, v6);
LABEL_8:
}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_3(id *a1)
{
  id v2 = a1[4];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_4;
  v3[3] = &unk_1E6B08E58;
  id v8 = a1[8];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v7 = a1[4];
  [v2 _createUserActivityDataWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v3];
}

void __129__SBApplicationDropSession__getUserActivityDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_4(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    id v5 = [[SBApplicationDropSession alloc] initWithUIDragDropSession:a1[4] systemSession:a1[5] application:a1[6] activity:a1[7] activityData:v6];
    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (BOOL)_isApplicationBoundToVisibleIcon
{
  id v3 = +[SBIconController sharedInstance];
  id v4 = [v3 model];

  if ([(SBApplication *)self->_application isWebApplication])
  {
    id v5 = [(SBApplicationDropSession *)self localContext];
    id v6 = [v5 draggedSceneIdentifier];

    id v7 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v6];
    id v8 = [v4 leafIconForIdentifier:v7];
  }
  else
  {
    id v6 = [(SBApplication *)self->_application bundleIdentifier];
    id v8 = [v4 applicationIconForBundleIdentifier:v6];
  }

  return v8 != 0;
}

- (id)_initWithUIDragDropSession:(id)a3 application:(id)a4 targetContentIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBApplicationDropSession;
  uint64_t v12 = [(SBApplicationDropSession *)&v18 init];
  uint64_t v13 = v12;
  if (v12
    && (objc_storeStrong((id *)&v12->_uiDragDropSession, a3),
        objc_storeStrong((id *)&v13->_application, a4),
        uint64_t v14 = [v11 copy],
        targetContentIdentifier = v13->_targetContentIdentifier,
        v13->_targetContentIdentifier = (NSString *)v14,
        targetContentIdentifier,
        !v10))
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v13;
  }

  return v16;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6
{
  id v11 = a4;
  uint64_t v12 = [(SBApplicationDropSession *)self _initWithUIDragDropSession:a3 application:a5 targetContentIdentifier:a6];
  uint64_t v13 = v12;
  if (v12
    && (objc_storeStrong(v12 + 7, a4),
        [MEMORY[0x1E4F1CAD0] set],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = v13[9],
        v13[9] = (id)v14,
        v15,
        ([v13 _isApplicationBoundToVisibleIcon] & 1) == 0))
  {
    uint64_t v17 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:]((uint64_t)v13);
    }

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = v13;
  }

  return v16;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 localContext:(id)a7 activity:(id)a8 activityData:(id)a9
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v46 = a8;
  id v45 = a9;
  objc_super v18 = [(SBApplicationDropSession *)self _initWithUIDragDropSession:v15 application:a5 targetContentIdentifier:a6];
  uint64_t v19 = (uint64_t)v18;
  if (!v18) {
    goto LABEL_23;
  }
  objc_storeStrong(v18 + 7, a4);
  objc_storeStrong((id *)(v19 + 64), a7);
  v52[0] = *MEMORY[0x1E4FB38A8];
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  int v21 = [v15 hasItemsConformingToTypeIdentifiers:v20];

  if (v21) {
    *(unsigned char *)(v19 + 16) = 1;
  }
  id v22 = [v17 launchActions];
  id v23 = (void *)[v22 mutableCopy];
  uint64_t v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [MEMORY[0x1E4F1CA80] set];
  }
  uint64_t v26 = v25;

  uint64_t v27 = [v17 launchURL];

  if (v27)
  {
    id v44 = v16;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v48;
LABEL_10:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v30) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:

      id v33 = objc_alloc(MEMORY[0x1E4F42C20]);
      uint64_t v34 = [v17 launchURL];
      id v35 = (void *)[v33 initWithURL:v34];
      [v28 addObject:v35];

      id v28 = (id)v34;
    }

    id v16 = v44;
  }
  id v37 = v45;
  id v36 = v46;
  if (v46 && v45)
  {
    id v38 = [(id)v19 _activityContinuationActionFromActivity:v46 activityData:v45];
    [v26 addObject:v38];
  }
  uint64_t v39 = [v26 copy];
  uint64_t v40 = *(void **)(v19 + 72);
  *(void *)(v19 + 72) = v39;

  if ([(id)v19 _isApplicationBoundToVisibleIcon])
  {

LABEL_23:
    uint64_t v41 = (SBApplicationDropSession *)(id)v19;
    id v37 = v45;
    id v36 = v46;
    goto LABEL_27;
  }
  uint64_t v42 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
    -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:](v19);
  }

  uint64_t v41 = 0;
LABEL_27:

  return v41;
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 targetContentIdentifier:(id)a6 URL:(id)a7 requiresOpenInPlace:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  objc_super v18 = [(SBApplicationDropSession *)self _initWithUIDragDropSession:a3 application:v16 targetContentIdentifier:a6];
  uint64_t v19 = (uint64_t)v18;
  if (!v18) {
    goto LABEL_21;
  }
  objc_storeStrong(v18 + 7, a4);
  id v20 = (void *)MEMORY[0x1E4F1CAD0];
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F42C20]) initWithURL:v17];
  uint64_t v22 = [v20 setWithObject:v21];
  id v23 = *(void **)(v19 + 72);
  *(void *)(v19 + 72) = v22;

  if ([v17 isFileURL])
  {
    if (v8)
    {
      dispatch_group_t v24 = dispatch_group_create();
      id v25 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = v24;

      dispatch_group_enter(*(dispatch_group_t *)(v19 + 8));
      [v17 startAccessingSecurityScopedResource];
      [v16 bundleIdentifier];
      id v59 = (id)v19;
      id v60 = v17;
      FPExtendBookmarkForDocumentURL();

      uint64_t v26 = v59;
    }
    else
    {
      uint64_t v26 = [v17 lastPathComponent];
      uint64_t v27 = [v16 info];
      id v28 = [v27 dataContainerURL];
      uint64_t v29 = [v28 URLByAppendingPathComponent:@"tmp" isDirectory:1];

      if (v29 && v26)
      {
        id v58 = v26;
        uint64_t v30 = NSString;
        id v56 = v17;
        id v31 = v29;
        uint64_t v57 = [v30 stringWithFormat:@"%@.XXXXXX", @"drag&Drop"];
        uint64_t v32 = objc_msgSend(v31, "URLByAppendingPathComponent:isDirectory:");
        uint64_t v55 = (uint64_t)v31;

        id v33 = [v32 path];
        [v33 getFileSystemRepresentation:v63 maxLength:1024];

        if (mkdtemp(v63))
        {
          uint64_t v34 = [NSString stringWithUTF8String:v63];
          uint64_t v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v34 isDirectory:1];

          uint64_t v32 = (void *)v35;
        }
        id v36 = [v32 URLByAppendingPathComponent:v58];

        id v37 = v56;
        id v38 = (const char *)[v37 fileSystemRepresentation];

        id v39 = v36;
        int v40 = copyfile(v38, (const char *)[v39 fileSystemRepresentation], 0, 0x100800Fu);
        id v41 = 0;
        if (!v40) {
          id v41 = v39;
        }

        if (v41)
        {
          uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F42C20]) initWithURL:v41];
          uint64_t v44 = [v42 setWithObject:v43];
          id v45 = *(void **)(v19 + 72);
          *(void *)(v19 + 72) = v44;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:](v55);
        }
      }
      id v46 = [v16 bundleIdentifier];
      int v47 = [v46 isEqualToString:@"com.apple.DocumentsApp"];

      if (v47)
      {
        long long v48 = objc_alloc_init(SBActivationSettings);
        long long v49 = *(void **)(v19 + 24);
        *(void *)(v19 + 24) = v48;

        long long v50 = *(void **)(v19 + 24);
        uint64_t v61 = *MEMORY[0x1E4F44130];
        uint64_t v62 = MEMORY[0x1E4F1CC38];
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        [v50 setObject:v51 forActivationSetting:16];
      }
    }
  }
  if (([(id)v19 _isApplicationBoundToVisibleIcon] & 1) == 0)
  {
    v53 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:](v19);
    }

    int v52 = 0;
  }
  else
  {
LABEL_21:
    int v52 = (SBApplicationDropSession *)(id)v19;
  }

  return v52;
}

void __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = objc_alloc_init(SBActivationSettings);
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = *MEMORY[0x1E4F22340];
    v13[0] = *MEMORY[0x1E4F22378];
    v13[1] = v10;
    v14[0] = MEMORY[0x1E4F1CC38];
    v14[1] = v5;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v9 setObject:v11 forActivationSetting:16];
  }
  if (a3)
  {
    uint64_t v12 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke_cold_1(a1, v12);
    }
  }
  [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
}

- (SBApplicationDropSession)initWithUIDragDropSession:(id)a3 systemSession:(id)a4 application:(id)a5 activity:(id)a6 activityData:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  id v17 = [v14 targetContentIdentifier];
  objc_super v18 = [(SBApplicationDropSession *)self _initWithUIDragDropSession:v12 application:v16 targetContentIdentifier:v17];

  if (!v18) {
    goto LABEL_5;
  }
  objc_storeStrong(v18 + 7, a4);
  v28[0] = *MEMORY[0x1E4F437F0];
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  int v20 = [v12 hasItemsConformingToTypeIdentifiers:v19];

  if (v20) {
    *((unsigned char *)v18 + 17) = 1;
  }
  int v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = [v18 _activityContinuationActionFromActivity:v14 activityData:v15];
  uint64_t v23 = [v21 setWithObject:v22];
  id v24 = v18[9];
  v18[9] = (id)v23;

  if (([v18 _isApplicationBoundToVisibleIcon] & 1) == 0)
  {
    uint64_t v26 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SBApplicationDropSession initWithUIDragDropSession:systemSession:application:targetContentIdentifier:]((uint64_t)v18);
    }

    id v25 = 0;
  }
  else
  {
LABEL_5:
    id v25 = v18;
  }

  return v25;
}

- (id)_activityContinuationActionFromActivity:(id)a3 activityData:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v5 dictionaryWithCapacity:4];
  [v8 setObject:v6 forKeyedSubscript:&unk_1F334ABE0];

  id v9 = [v7 activityType];
  [v8 setObject:v9 forKeyedSubscript:&unk_1F334ABF8];

  uint64_t v10 = [v7 activityType];

  [v8 setObject:v10 forKeyedSubscript:&unk_1F334AC10];
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setObject:v11 forKeyedSubscript:&unk_1F334AC28];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F42700]) initWithSettings:v8];
  return v12;
}

- (SBActivationSettings)activationSettings
{
  activationSettingsGroup = self->_activationSettingsGroup;
  if (activationSettingsGroup)
  {
    dispatch_time_t v4 = BSDispatchTimeWithInterval();
    dispatch_group_wait(activationSettingsGroup, v4);
  }
  activationSettings = self->_activationSettings;
  return activationSettings;
}

- (void)calculateSceneIdentityWithSceneProvider:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v9 = [(SBApplicationDropSession *)self application];
  if (!v9)
  {
    int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBApplicationDropSession.m" lineNumber:741 description:@"Completed with Drop Session not bound to application."];
  }
  uint64_t v10 = [(SBApplicationDropSession *)self localContext];
  id v11 = [v10 draggedSceneIdentifier];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F62A60] identityForIdentifier:v11];
    sceneIdentity = self->_sceneIdentity;
    self->_sceneIdentity = v12;
  }
  else
  {
    id v14 = [v9 info];
    int v15 = [v14 supportsMultiwindow];

    if (v15)
    {
      id v16 = [(SBApplicationDropSession *)self uiDragDropSession];
      v23[0] = *MEMORY[0x1E4FA6E60];
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      int v18 = [v16 hasItemsConformingToTypeIdentifiers:v17];

      uint64_t v19 = [v7 preferredSceneIdentityForApplication:v9 targetContentIdentifier:self->_targetContentIdentifier preferNewScene:v18 ^ 1u];
    }
    else
    {
      uint64_t v19 = [v7 mostRecentSceneIdentityExcludingLiveScenesForApplication:v9];
    }
    int v20 = (FBSSceneIdentity *)v19;
    if (!v19)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"SBApplicationDropSession.m" lineNumber:757 description:@"Unable to calculate a scene identity for Drop Session."];
    }
    sceneIdentity = self->_sceneIdentity;
    self->_sceneIdentity = v20;
  }

  v8[2](v8, 0);
}

- (int64_t)dropZones
{
  id v3 = [(SBApplicationDropSession *)self systemSession];
  if (v3 && ![(SBApplicationDropSession *)self isNotificationDrag])
  {
    id v5 = [(SBApplicationDropSession *)self localContext];
    int64_t v4 = [v5 startLocation] != 5;
  }
  else
  {

    int64_t v4 = 0;
  }
  if ([(SBApplicationDropSession *)self isWindowTearOff]) {
    return 2;
  }
  else {
    return v4;
  }
}

- (SBApplication)application
{
  return self->_application;
}

- (FBSSceneIdentity)sceneIdentity
{
  return self->_sceneIdentity;
}

- (void)setSceneIdentity:(id)a3
{
}

- (UIDragDropSession)uiDragDropSession
{
  return self->_uiDragDropSession;
}

- (UIDraggingSystemSession)systemSession
{
  return self->_systemSession;
}

- (BOOL)isNotificationDrag
{
  return self->_notificationDrag;
}

- (BOOL)isWindowTearOff
{
  return self->_windowTearOff;
}

- (SBSAppDragLocalContext)localContext
{
  return self->_localContext;
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_localContext, 0);
  objc_storeStrong((id *)&self->_systemSession, 0);
  objc_storeStrong((id *)&self->_uiDragDropSession, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_activationSettingsGroup, 0);
}

void __120__SBApplicationDropSession__getURLDropSessionWithUIDragDropSession_dragItem_systemSession_targetApplication_completion___block_invoke_168_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBAppDrop: LSAppLink did not find appLink for URL: %{public}@ %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithUIDragDropSession:(uint64_t)a1 systemSession:application:targetContentIdentifier:.cold.1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_1_29(a1) bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "SBAppDrop: Bound to an application without an icon: %{public}@", v4, v5, v6, v7, v8);
}

- (void)initWithUIDragDropSession:(uint64_t)a1 systemSession:application:targetContentIdentifier:URL:requiresOpenInPlace:.cold.2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithInt:*__error()];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "FAILED to clone file to directory %@ errno %@", (uint8_t *)&v3, 0x16u);
}

void __128__SBApplicationDropSession_initWithUIDragDropSession_systemSession_application_targetContentIdentifier_URL_requiresOpenInPlace___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to extend bookmark for document URL %@", (uint8_t *)&v3, 0xCu);
}

@end