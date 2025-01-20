@interface CustomRoutesTask
+ (int64_t)creationPreference;
- (CustomRoutesTask)init;
- (NSString)activeTileGroupHash;
- (void)_handleAvailabilityChange;
- (void)dealloc;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
- (void)setActiveTileGroupHash:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation CustomRoutesTask

- (void)setActiveTileGroupHash:(id)a3
{
  id v5 = a3;
  activeTileGroupHash = self->_activeTileGroupHash;
  p_activeTileGroupHash = (id *)&self->_activeTileGroupHash;
  id v8 = activeTileGroupHash;
  unint64_t v9 = (unint64_t)v5;
  if (v9 | (unint64_t)v8)
  {
    unsigned __int8 v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      v11 = sub_100D18B58();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138543362;
        unint64_t v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "activeTileGroupHash changed to %{public}@", (uint8_t *)&v14, 0xCu);
      }

      id v12 = *p_activeTileGroupHash;
      objc_storeStrong(p_activeTileGroupHash, a3);
      GEOConfigSetString();
      if (v12)
      {
        v13 = +[MURouteSnapshotManager sharedInstance];
        [v13 purgeSnapshotsWithCompletionBlock:0];
      }
    }
  }
}

- (CustomRoutesTask)init
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12.receiver = self;
  v12.super_class = (Class)CustomRoutesTask;
  v3 = [(CustomRoutesTask *)&v12 init];
  if (v3)
  {
    v4 = +[GEOResourceManifestManager modernManager];
    [v4 addTileGroupObserver:v3 queue:&_dispatch_main_q];

    id v5 = [v4 activeTileGroup];
    v6 = [v5 hashForPurpose:0];
    id v7 = [v6 copy];

    uint64_t v8 = GEOConfigGetString();
    activeTileGroupHash = v3->_activeTileGroupHash;
    v3->_activeTileGroupHash = (NSString *)v8;

    LODWORD(v6) = GEOConfigGetBOOL();
    int BOOL = GEOConfigGetBOOL();
    _GEOConfigAddDelegateListenerForKey();

    if (v6 != BOOL) {
      [(CustomRoutesTask *)v3 _handleAvailabilityChange];
    }
    if (v7) {
      [(CustomRoutesTask *)v3 setActiveTileGroupHash:v7];
    }
  }
  return v3;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)CustomRoutesTask;
  [(CustomRoutesTask *)&v3 dealloc];
}

- (void)_handleAvailabilityChange
{
  int BOOL = GEOConfigGetBOOL();
  objc_super v3 = sub_100D18B58();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = BOOL;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Availability changed to %d", (uint8_t *)v5, 8u);
  }

  GEOConfigSetBOOL();
  v4 = +[MURouteSnapshotManager sharedInstance];
  [v4 purgeSnapshotsWithCompletionBlock:0];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_RouteCreationAvailable && a3.var1 == off_1015F1498) {
    [(CustomRoutesTask *)self _handleAvailabilityChange];
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v6 = [a3 activeTileGroup];
  v4 = [v6 hashForPurpose:0];
  id v5 = [v4 copy];
  [(CustomRoutesTask *)self setActiveTileGroupHash:v5];
}

- (NSString)activeTileGroupHash
{
  return self->_activeTileGroupHash;
}

- (void).cxx_destruct
{
}

@end