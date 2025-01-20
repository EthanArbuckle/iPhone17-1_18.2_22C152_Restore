@interface RCConfigurationFetchResult
- (NSArray)segmentSetIDs;
- (NSArray)treatmentIDs;
- (NSDictionary)configurationDataByRequestKey;
- (NSError)error;
- (NSString)taskIdentifier;
- (RCConfigurationFetchResult)initWithTaskIdentifier:(id)a3 configurationDataByRequestKey:(id)a4 treatmentIDs:(id)a5 segmentSetIDs:(id)a6 error:(id)a7;
- (void)setConfigurationDataByRequestKey:(id)a3;
- (void)setError:(id)a3;
- (void)setSegmentSetIDs:(id)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setTreatmentIDs:(id)a3;
@end

@implementation RCConfigurationFetchResult

- (RCConfigurationFetchResult)initWithTaskIdentifier:(id)a3 configurationDataByRequestKey:(id)a4 treatmentIDs:(id)a5 segmentSetIDs:(id)a6 error:(id)a7
{
  id v13 = a3;
  id v19 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RCConfigurationFetchResult;
  v17 = [(RCConfigurationFetchResult *)&v20 init];
  if (v17)
  {
    if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[RCConfigurationFetchResult initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:]();
    }
    objc_storeStrong((id *)&v17->_taskIdentifier, a3);
    objc_storeStrong((id *)&v17->_configurationDataByRequestKey, a4);
    objc_storeStrong((id *)&v17->_treatmentIDs, a5);
    objc_storeStrong((id *)&v17->_segmentSetIDs, a6);
    objc_storeStrong((id *)&v17->_error, a7);
  }

  return v17;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSDictionary)configurationDataByRequestKey
{
  return self->_configurationDataByRequestKey;
}

- (void)setConfigurationDataByRequestKey:(id)a3
{
}

- (NSArray)treatmentIDs
{
  return self->_treatmentIDs;
}

- (void)setTreatmentIDs:(id)a3
{
}

- (NSArray)segmentSetIDs
{
  return self->_segmentSetIDs;
}

- (void)setSegmentSetIDs:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_configurationDataByRequestKey, 0);

  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "taskIdentifier");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCConfigurationFetchResult initWithTaskIdentifier:configurationDataByRequestKey:treatmentIDs:segmentSetIDs:error:]";
  __int16 v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCConfigurationFetchResult.m";
  __int16 v5 = 1024;
  int v6 = 33;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end