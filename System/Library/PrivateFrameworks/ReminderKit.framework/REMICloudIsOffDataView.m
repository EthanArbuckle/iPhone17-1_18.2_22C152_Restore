@interface REMICloudIsOffDataView
- (REMICloudIsOffDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchICloudIsOffCloudConfigurationPropertiesWithError:(id *)a3;
@end

@implementation REMICloudIsOffDataView

- (REMICloudIsOffDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMICloudIsOffDataView;
  v6 = [(REMICloudIsOffDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchICloudIsOffCloudConfigurationPropertiesWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMICloudIsOffDataViewInvocation_fetchICCloudConfigurationProperties);
  v6 = [(REMICloudIsOffDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  [v9 timeIntervalSinceLastPrompt];
  if (v10 == 0.0)
  {
    if (a3 && !*a3)
    {
      +[REMError internalErrorWithDebugDescription:@"REMICloudIsOff: The ICCloudConfigurationProperty timeIntervalSinceLastPrompt is 0 and has not been set"];
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v11 = [_REMICloudIsOffCloudConfigurationStorage alloc];
    [v9 timeIntervalSinceLastPrompt];
    v12 = -[_REMICloudIsOffCloudConfigurationStorage initWithTimeIntervalSinceLastPrompt:](v11, "initWithTimeIntervalSinceLastPrompt:");
  }

  return v12;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end