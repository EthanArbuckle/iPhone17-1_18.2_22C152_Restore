@interface MapsOfflineHelper
+ (MapsOfflineHelper)sharedHelper;
- (BOOL)offlineServiceEnabled;
- (BOOL)offlineServiceRunning;
- (id)init_internal;
- (void)_updateForcedOffline;
- (void)startServiceIfEnabled;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation MapsOfflineHelper

- (void)_updateForcedOffline
{
  int BOOL = GEOConfigGetBOOL();
  v3 = +[GEOOfflineService shared];
  id v4 = v3;
  if (BOOL) {
    [v3 setStateForcedOffline];
  }
  else {
    [v3 setStateAuto];
  }
}

- (id)init_internal
{
  v7.receiver = self;
  v7.super_class = (Class)MapsOfflineHelper;
  v2 = [(MapsOfflineHelper *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    completionIsolater = v2->_completionIsolater;
    v2->_completionIsolater = (geo_isolater *)v3;

    _GEOConfigAddDelegateListenerForKey();
    [(MapsOfflineHelper *)v2 _updateForcedOffline];
    v5 = v2;
  }

  return v2;
}

- (void)startServiceIfEnabled
{
  id v2 = +[GEOOfflineService shared];
  [v2 startServiceIfEnabled];
}

+ (MapsOfflineHelper)sharedHelper
{
  if (qword_10160EC58 != -1) {
    dispatch_once(&qword_10160EC58, &stru_1012E9478);
  }
  id v2 = (void *)qword_10160EC50;

  return (MapsOfflineHelper *)v2;
}

- (BOOL)offlineServiceEnabled
{
  return 1;
}

- (BOOL)offlineServiceRunning
{
  id v2 = +[GEOOfflineService shared];
  unsigned __int8 v3 = [v2 isUsingOffline];

  return v3;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_OfflineOnlyData && a3.var1 == off_1015F0B08) {
    [(MapsOfflineHelper *)self _updateForcedOffline];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);

  objc_storeStrong((id *)&self->_completionIsolater, 0);
}

@end