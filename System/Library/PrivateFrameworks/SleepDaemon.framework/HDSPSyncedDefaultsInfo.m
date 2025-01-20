@interface HDSPSyncedDefaultsInfo
- (HDSPSyncedDefaultsInfo)initWithDataVersionKey:(id)a3 currentDataVersion:(unint64_t)a4 cloudDataVersionKey:(id)a5 currentCloudDataVersion:(unint64_t)a6 cloudSyncEnabledKey:(id)a7 localDataVersionKey:(id)a8 currentLocalDataVersion:(unint64_t)a9;
- (NSString)cloudDataVersionKey;
- (NSString)cloudSyncEnabledKey;
- (NSString)dataVersionKey;
- (NSString)localDataVersionKey;
- (unint64_t)currentCloudDataVersion;
- (unint64_t)currentDataVersion;
- (unint64_t)currentLocalDataVersion;
@end

@implementation HDSPSyncedDefaultsInfo

- (HDSPSyncedDefaultsInfo)initWithDataVersionKey:(id)a3 currentDataVersion:(unint64_t)a4 cloudDataVersionKey:(id)a5 currentCloudDataVersion:(unint64_t)a6 cloudSyncEnabledKey:(id)a7 localDataVersionKey:(id)a8 currentLocalDataVersion:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HDSPSyncedDefaultsInfo;
  v19 = [(HDSPSyncedDefaultsInfo *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dataVersionKey, a3);
    v20->_currentDataVersion = a4;
    objc_storeStrong((id *)&v20->_cloudDataVersionKey, a5);
    v20->_currentCloudDataVersion = a6;
    objc_storeStrong((id *)&v20->_cloudSyncEnabledKey, a7);
    objc_storeStrong((id *)&v20->_localDataVersionKey, a8);
    v20->_currentLocalDataVersion = a9;
    v21 = v20;
  }

  return v20;
}

- (NSString)dataVersionKey
{
  return self->_dataVersionKey;
}

- (unint64_t)currentDataVersion
{
  return self->_currentDataVersion;
}

- (NSString)cloudDataVersionKey
{
  return self->_cloudDataVersionKey;
}

- (unint64_t)currentCloudDataVersion
{
  return self->_currentCloudDataVersion;
}

- (NSString)cloudSyncEnabledKey
{
  return self->_cloudSyncEnabledKey;
}

- (NSString)localDataVersionKey
{
  return self->_localDataVersionKey;
}

- (unint64_t)currentLocalDataVersion
{
  return self->_currentLocalDataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDataVersionKey, 0);
  objc_storeStrong((id *)&self->_cloudSyncEnabledKey, 0);
  objc_storeStrong((id *)&self->_cloudDataVersionKey, 0);

  objc_storeStrong((id *)&self->_dataVersionKey, 0);
}

@end