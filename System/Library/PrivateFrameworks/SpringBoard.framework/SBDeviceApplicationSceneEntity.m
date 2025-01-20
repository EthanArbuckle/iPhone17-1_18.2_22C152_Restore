@interface SBDeviceApplicationSceneEntity
+ (SBDeviceApplicationSceneEntity)entityWithApplication:(id)a3 scenePersistenceIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
+ (SBDeviceApplicationSceneEntity)entityWithApplicationForMainDisplay:(id)a3 withScenePersistenceIdentifier:(id)a4;
+ (id)defaultEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5;
+ (id)defaultEntityWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3;
+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4;
+ (id)newEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5;
+ (id)newEntityWithApplicationForMainDisplay:(id)a3;
- (BOOL)_supportsLayoutRole:(int64_t)a3;
- (BOOL)isDeviceApplicationSceneEntity;
- (BOOL)supportsPresentationAtAnySize;
- (BOOL)supportsSplitView;
- (BOOL)wantsExclusiveForeground;
- (Class)viewControllerClass;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6;
- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneHandleProvider:(id)a6 displayIdentity:(id)a7;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 uniqueIdentifier:(id)a4;
- (SBDeviceApplicationSceneEntity)initWithApplicationForMainSecureDisplay:(id)a3;
- (SBDeviceApplicationSceneEntity)initWithApplicationSceneHandle:(id)a3;
@end

@implementation SBDeviceApplicationSceneEntity

- (BOOL)supportsSplitView
{
  v3 = [(SBApplicationSceneEntity *)self sceneHandle];
  v4 = [v3 _windowScene];
  v5 = [v4 switcherController];

  v6 = [(SBApplicationSceneEntity *)self application];
  uint64_t v7 = [v5 windowManagementStyle];
  v8 = [v5 displayIdentity];
  LOBYTE(v7) = [v6 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v7 displayIdentity:v8];

  return v7;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneEntity;
  if ([(SBApplicationSceneEntity *)&v8 _supportsLayoutRole:sel__supportsLayoutRole_]
    || [(SBDeviceApplicationSceneEntity *)self supportsPresentationAtAnySize])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v5 = [(SBDeviceApplicationSceneEntity *)self supportsSplitView];
    if (v5) {
      LOBYTE(v5) = a3 == 2 || a3 == 1;
    }
  }
  return v5;
}

- (BOOL)supportsPresentationAtAnySize
{
  v2 = [(SBApplicationSceneEntity *)self application];
  char v3 = [v2 isMedusaCapable];

  return v3;
}

- (BOOL)isDeviceApplicationSceneEntity
{
  return 1;
}

- (BOOL)wantsExclusiveForeground
{
  v2 = [(SBApplicationSceneEntity *)self application];
  char v3 = [v2 info];
  char v4 = [v3 wantsExclusiveForeground];

  return v4;
}

- (Class)viewControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultEntityWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithApplication:v13 targetContentIdentifier:v12 sceneHandleProvider:v11 displayIdentity:v10];

  return v14;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  return [(SBDeviceApplicationSceneEntity *)self initWithApplication:a3 uniqueIdentifier:0 targetContentIdentifier:a4 sceneHandleProvider:a5 displayIdentity:a6];
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[SBApplicationSceneHandleRequest defaultSceneSpecificationForDisplayIdentity:v10];
  v14 = [v13 uiSceneSessionRole];
  v15 = [v11 sceneIdentityForApplication:v12 createPrimaryIfRequired:v7 sceneSessionRole:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4F629B0]);
  [v16 setIdentity:v15];
  v17 = FBSSceneClientIdentity;
  v18 = [v12 info];
  v19 = [v18 processIdentity];
  v20 = [v17 identityForProcessIdentity:v19];
  [v16 setClientIdentity:v20];

  [v16 setSpecification:v13];
  v21 = [[SBApplicationSceneHandleRequest alloc] initWithApplication:v12 sceneDefinition:v16 displayIdentity:v10];

  v22 = [v11 fetchOrCreateApplicationSceneHandleForRequest:v21];

  v23 = [(SBDeviceApplicationSceneEntity *)self initWithApplicationSceneHandle:v22];
  return v23;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneHandleProvider:(id)a6 displayIdentity:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (!v16)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneEntity.m", 98, @"Invalid parameter not satisfying: %@", @"sceneHandleProvider" object file lineNumber description];
    }
    v18 = [v13 info];
    if ([v18 supportsMultiwindow]) {
      v19 = v14;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    v21 = [v16 sceneIdentityForApplication:v13 uniqueIdentifier:v20 targetContentIdentifier:v15];
    v22 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v13 sceneIdentity:v21 displayIdentity:v17];

    v23 = [v16 fetchOrCreateApplicationSceneHandleForRequest:v22];
    self = [(SBDeviceApplicationSceneEntity *)self initWithApplicationSceneHandle:v23];

    id v14 = v20;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationSceneHandle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      [v8 handleFailureInMethod:a2, self, @"SBDeviceApplicationSceneEntity.m", 111, @"Scene handle expected type SBDeviceApplicationSceneHandle, but it was %@.", v10 object file lineNumber description];
    }
    self = (SBDeviceApplicationSceneEntity *)[(SBApplicationSceneEntity *)self _initWithSceneHandle:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 info];
  char v15 = [v14 supportsMultiwindow];

  if ((v15 & 1) == 0)
  {

    id v11 = 0;
  }
  id v16 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v10 uniqueIdentifier:v11 targetContentIdentifier:0 sceneHandleProvider:v12 displayIdentity:v13];

  return v16;
}

+ (id)defaultEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  return (id)[a1 entityWithApplication:a3 scenePersistenceIdentifier:0 sceneHandleProvider:a4 displayIdentity:a5];
}

+ (SBDeviceApplicationSceneEntity)entityWithApplication:(id)a3 scenePersistenceIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    id v13 = a4;
    uint64_t v14 = objc_opt_class();
    id v15 = v11;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    id v17 = v16;

    v18 = [v17 existingSceneHandleForPersistenceIdentifier:v13];

    a4 = [v18 sceneIdentifier];
  }
  v19 = (void *)[objc_alloc((Class)a1) initWithApplication:v10 uniqueIdentifier:a4 sceneHandleProvider:v11 displayIdentity:v12];

  return (SBDeviceApplicationSceneEntity *)v19;
}

+ (id)newEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[v9 newSceneIdentityForApplication:v10];
  id v12 = objc_alloc((Class)a1);
  id v13 = [v11 identifier];
  uint64_t v14 = (void *)[v12 initWithApplication:v10 uniqueIdentifier:v13 targetContentIdentifier:0 sceneHandleProvider:v9 displayIdentity:v8];

  return v14;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  return [(SBDeviceApplicationSceneEntity *)self initWithApplication:a3 uniqueIdentifier:0 sceneHandleProvider:a4 displayIdentity:a5];
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v12 uiSceneSessionRole];
  id v15 = [v11 sceneIdentityForApplication:v13 createPrimaryIfRequired:1 sceneSessionRole:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4F629B0]);
  [v16 setIdentity:v15];
  id v17 = FBSSceneClientIdentity;
  v18 = [v13 info];
  v19 = [v18 processIdentity];
  id v20 = [v17 identityForProcessIdentity:v19];
  [v16 setClientIdentity:v20];

  [v16 setSpecification:v12];
  v21 = [[SBApplicationSceneHandleRequest alloc] initWithApplication:v13 sceneDefinition:v16 displayIdentity:v10];

  v22 = [v11 fetchOrCreateApplicationSceneHandleForRequest:v21];

  v23 = [(SBDeviceApplicationSceneEntity *)self initWithApplicationSceneHandle:v22];
  return v23;
}

+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3
{
  id v4 = a3;
  id v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v6 = [v5 displayIdentity];
  BOOL v7 = [a1 defaultEntityWithApplication:v4 sceneHandleProvider:v5 displayIdentity:v6];

  return v7;
}

+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v8 displayIdentity];
  id v10 = [a1 defaultEntityWithApplication:v7 targetContentIdentifier:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return v10;
}

+ (SBDeviceApplicationSceneEntity)entityWithApplicationForMainDisplay:(id)a3 withScenePersistenceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v8 displayIdentity];
  id v10 = [a1 entityWithApplication:v7 scenePersistenceIdentifier:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return (SBDeviceApplicationSceneEntity *)v10;
}

+ (id)newEntityWithApplicationForMainDisplay:(id)a3
{
  id v4 = a3;
  id v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v6 = [v5 displayIdentity];
  id v7 = (void *)[a1 newEntityWithApplication:v4 sceneHandleProvider:v5 displayIdentity:v6];

  return v7;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3
{
  id v4 = a3;
  id v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v6 = [v5 displayIdentity];
  id v7 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v4 sceneHandleProvider:v5 displayIdentity:v6];

  return v7;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v8 = [v7 displayIdentity];
  id v9 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v6 generatingNewPrimarySceneIfRequired:v4 sceneHandleProvider:v7 displayIdentity:v8];

  return v9;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v8 displayIdentity];
  id v10 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v7 generatingNewSceneIfRequiredWithSpecification:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v8 displayIdentity];
  id v10 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v7 targetContentIdentifier:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v9 = [v8 displayIdentity];
  id v10 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v7 uniqueIdentifier:v6 sceneHandleProvider:v8 displayIdentity:v9];

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainSecureDisplay:(id)a3
{
  id v4 = a3;
  id v5 = +[SBSceneManagerCoordinator secureMainDisplaySceneManager];
  id v6 = [v5 displayIdentity];
  id v7 = [(SBDeviceApplicationSceneEntity *)self initWithApplication:v4 uniqueIdentifier:0 targetContentIdentifier:0 sceneHandleProvider:v5 displayIdentity:v6];

  return v7;
}

@end