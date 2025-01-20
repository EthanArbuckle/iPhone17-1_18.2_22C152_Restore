@interface ICUserDefaults
- (ICCloudSchemaCatchUpSyncSchedulingStateStorage)cloudSchemaCatchUpSyncSchedulingStateStorage;
- (ICUserDefaults)init;
- (ICUserDefaults)initWithCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3;
- (id)userDefaults;
- (void)setCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3;
@end

@implementation ICUserDefaults

- (ICUserDefaults)initWithCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICUserDefaults;
  v5 = [(ICUserDefaults *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICUserDefaults *)v5 setCloudSchemaCatchUpSyncSchedulingStateStorage:v4];
  }

  return v6;
}

- (ICUserDefaults)init
{
  v3 = +[REMUserDefaults daemonUserDefaults];
  id v4 = [(ICUserDefaults *)self initWithCloudSchemaCatchUpSyncSchedulingStateStorage:v3];

  return v4;
}

- (id)userDefaults
{
  v2 = +[REMUserDefaults daemonUserDefaults];
  v3 = [v2 userDefaults];

  return v3;
}

- (ICCloudSchemaCatchUpSyncSchedulingStateStorage)cloudSchemaCatchUpSyncSchedulingStateStorage
{
  return self->_cloudSchemaCatchUpSyncSchedulingStateStorage;
}

- (void)setCloudSchemaCatchUpSyncSchedulingStateStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end