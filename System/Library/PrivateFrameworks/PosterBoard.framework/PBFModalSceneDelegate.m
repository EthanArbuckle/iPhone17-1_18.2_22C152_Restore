@interface PBFModalSceneDelegate
- (PBFModalSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation PBFModalSceneDelegate

- (PBFModalSceneDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBFModalSceneDelegate;
  v2 = [(PBFModalSceneDelegate *)&v6 init];
  if (v2)
  {
    +[PBFModalRootViewController prewarmTopButtonLayout];
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sceneToWindowMap = v2->_sceneToWindowMap;
    v2->_sceneToWindowMap = (NSMapTable *)v3;
  }
  return v2;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  id v23 = v9;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v23;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    v15 = [PBFModalRootViewController alloc];
    v16 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
    v17 = [v16 dataStore];
    v18 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
    v19 = [(PBFModalRootViewController *)v15 initWithScene:v14 dataStore:v17 behaviorAssertionProvider:v18];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v14];
    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [v20 setBackgroundColor:v21];

    [v20 setRootViewController:v19];
    [v20 makeKeyAndVisible];
    [(NSMapTable *)self->_sceneToWindowMap setObject:v20 forKey:v14];
  }
  else
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowScene != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalSceneDelegate scene:willConnectToSession:options:](a2, (uint64_t)self, (uint64_t)v22);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v7 = a3;
  v4 = -[NSMapTable objectForKey:](self->_sceneToWindowMap, "objectForKey:");
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 rootViewController];
    [v6 invalidate];
    [v5 setRootViewController:0];
    [v5 setHidden:1];
    [(NSMapTable *)self->_sceneToWindowMap removeObjectForKey:v7];
  }
}

- (void).cxx_destruct
{
}

- (void)scene:(const char *)a1 willConnectToSession:(uint64_t)a2 options:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PBFModalSceneDelegate.m";
  __int16 v16 = 1024;
  int v17 = 34;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end