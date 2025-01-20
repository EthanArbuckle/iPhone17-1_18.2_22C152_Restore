@interface PPLocalTemporalClusterStore
+ (id)defaultStore;
- (PPLocalTemporalClusterStore)init;
- (PPLocalTemporalClusterStore)initWithStorage:(id)a3;
- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
@end

@implementation PPLocalTemporalClusterStore

- (void).cxx_destruct
{
}

- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  return [(PPTemporalClusterStorage *)self->_storage rankedTemporalClusterForStartDate:a3 endDate:a4 error:a5];
}

- (PPLocalTemporalClusterStore)init
{
  v3 = +[PPTemporalClusterStorage defaultStorage];
  if (v3)
  {
    self = [(PPLocalTemporalClusterStore *)self initWithStorage:v3];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PPLocalTemporalClusterStore)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPLocalTemporalClusterStore;
  v6 = [(PPLocalTemporalClusterStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_21171);
  if (!defaultStore_instance_21172)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_21172;
    defaultStore_instance_21172 = v2;

    if (!defaultStore_instance_21172)
    {
      v4 = pp_temporal_clusters_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalTemporalClusterStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }
    }
  }
  id v5 = (id)defaultStore_instance_21172;
  pthread_mutex_unlock(&defaultStore_lock_21171);
  return v5;
}

@end