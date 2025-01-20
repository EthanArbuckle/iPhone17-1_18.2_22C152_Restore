@interface PRSWallpaperObserverConfiguration
+ (id)configurationWithHandler:(id)a3;
- (BOOL)isValid;
- (PRSPosterRoleActivePosterObserver)activePosterRoleObserver;
- (PRSPosterRoleCollectionObserver)postersCollectionRoleObserver;
- (PRSWallpaperLocationStateObserver)locationStateObserver;
- (PRSWallpaperObserverConfiguration)init;
- (PRSWallpaperSnapshotObserver)snapshotObserver;
- (unint64_t)locations;
- (void)setActivePosterRoleObserver:(id)a3;
- (void)setLocationStateObserver:(id)a3;
- (void)setLocations:(unint64_t)a3;
- (void)setPostersCollectionRoleObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSnapshotObserver:(id)a3;
@end

@implementation PRSWallpaperObserverConfiguration

- (PRSWallpaperObserverConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRSWallpaperObserverConfiguration;
  v2 = [(PRSWallpaperObserverConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(17, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)configurationWithHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PRSWallpaperObserverConfiguration);
  v5 = objc_alloc_init(PRSWallpaperLocationStateObserver);
  [(PRSWallpaperLocationStateObserver *)v5 setHandler:v3];

  [(PRSWallpaperObserverConfiguration *)v4 setLocationStateObserver:v5];
  return v4;
}

- (void)setQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (v4)
  {
    self->_queue = v4;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserverConfiguration setQueue:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)isValid
{
  return self->_queue != 0;
}

- (void)setLocations:(unint64_t)a3
{
  v5 = [(PRSWallpaperObserverConfiguration *)self locationStateObserver];

  if (!v5)
  {
    objc_super v6 = objc_opt_new();
    [(PRSWallpaperObserverConfiguration *)self setLocationStateObserver:v6];
  }
  id v7 = [(PRSWallpaperObserverConfiguration *)self locationStateObserver];
  [v7 setLocations:a3];
}

- (unint64_t)locations
{
  v2 = [(PRSWallpaperObserverConfiguration *)self locationStateObserver];
  unint64_t v3 = [v2 locations];

  return v3;
}

- (PRSWallpaperLocationStateObserver)locationStateObserver
{
  return self->_locationStateObserver;
}

- (void)setLocationStateObserver:(id)a3
{
}

- (PRSWallpaperSnapshotObserver)snapshotObserver
{
  return self->_snapshotObserver;
}

- (void)setSnapshotObserver:(id)a3
{
}

- (PRSPosterRoleActivePosterObserver)activePosterRoleObserver
{
  return self->_activePosterRoleObserver;
}

- (void)setActivePosterRoleObserver:(id)a3
{
}

- (PRSPosterRoleCollectionObserver)postersCollectionRoleObserver
{
  return self->_postersCollectionRoleObserver;
}

- (void)setPostersCollectionRoleObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postersCollectionRoleObserver, 0);
  objc_storeStrong((id *)&self->_activePosterRoleObserver, 0);
  objc_storeStrong((id *)&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_locationStateObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setQueue:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end