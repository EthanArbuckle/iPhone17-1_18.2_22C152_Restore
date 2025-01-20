@interface FCVanityURLConfigurationFetchedValueDescriptor
- (BOOL)isValue:(id)a3 equalToValue:(id)a4;
- (FCFetchedValueManager)configurationManager;
- (FCVanityURLConfigurationFetchedValueDescriptor)init;
- (FCVanityURLConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3;
- (id)_vanityURLConfiguration;
- (id)inputManagers;
- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCVanityURLConfigurationFetchedValueDescriptor

- (FCVanityURLConfigurationFetchedValueDescriptor)initWithConfigurationManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configurationManager");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCVanityURLConfigurationFetchedValueDescriptor initWithConfigurationManager:]";
    __int16 v13 = 2080;
    v14 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    __int16 v15 = 1024;
    int v16 = 29;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLConfigurationFetchedValueDescriptor;
  v6 = [(FCFetchedValueDescriptor *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationManager, a3);
  }

  return v7;
}

- (id)inputManagers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(FCVanityURLConfigurationFetchedValueDescriptor *)self configurationManager];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)fetchValueWithCachePolicy:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  v6 = (void (**)(id, void *, void *))a5;
  id v9 = [(FCVanityURLConfigurationFetchedValueDescriptor *)self _vanityURLConfiguration];
  if (v9)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:8 userInfo:0];
  }
  v8 = [(FCVanityURLConfigurationFetchedValueDescriptor *)self _vanityURLConfiguration];
  v6[2](v6, v8, v7);
}

- (id)_vanityURLConfiguration
{
  v2 = [(FCVanityURLConfigurationFetchedValueDescriptor *)self configurationManager];
  v3 = [v2 value];

  v4 = [v3 paidBundleConfig];
  id v5 = [v4 vanityURLMappingResourceID];
  if (v5) {
    v6 = -[FCManagedResourceConfiguration initWithResourceID:refreshRate:]([FCManagedResourceConfiguration alloc], "initWithResourceID:refreshRate:", v5, [v4 vanityURLMappingRefreshRate]);
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (FCFetchedValueManager)configurationManager
{
  return self->_configurationManager;
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left");
    *(_DWORD *)buf = 136315906;
    int v16 = "-[FCVanityURLConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v17 = 2080;
    v18 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    __int16 v19 = 1024;
    int v20 = 62;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "right");
    *(_DWORD *)buf = 136315906;
    int v16 = "-[FCVanityURLConfigurationFetchedValueDescriptor isValue:equalToValue:]";
    __int16 v17 = 2080;
    v18 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    __int16 v19 = 1024;
    int v20 = 63;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v7 = (void *)MEMORY[0x1E4FBA8A8];
  v8 = [v5 resourceID];
  id v9 = [v6 resourceID];
  if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
  {
    uint64_t v10 = [v5 refreshRate];
    BOOL v11 = v10 == [v6 refreshRate];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (FCVanityURLConfigurationFetchedValueDescriptor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCVanityURLConfigurationFetchedValueDescriptor init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCVanityURLConfigurationFetchedValueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCVanityURLConfigurationFetchedValueDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end