@interface TRIExperimentDependentSystemCovariates
- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 experimentEndDate:(id)a6;
- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 systemConfiguration:(id)a6;
- (id)dictionary;
- (id)objectForKey:(id)a3;
- (id)tri_contextValueWithName:(id)a3;
@end

@implementation TRIExperimentDependentSystemCovariates

- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 experimentEndDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRIExperimentDependentSystemCovariates;
  v14 = [(TRIExperimentDependentSystemCovariates *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB0258]) initWithPaths:v10];
    sysConfig = v14->_sysConfig;
    v14->_sysConfig = (TRISystemConfiguration *)v15;

    objc_storeStrong((id *)&v14->_clientExperiment, a5);
    objc_storeStrong((id *)&v14->_baseSystemCovariates, a4);
    objc_storeStrong((id *)&v14->_experimentEndDate, a6);
  }

  return v14;
}

- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 systemConfiguration:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TRIExperimentDependentSystemCovariates;
  id v13 = [(TRIExperimentDependentSystemCovariates *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sysConfig, a6);
    objc_storeStrong((id *)&v14->_clientExperiment, a5);
    objc_storeStrong((id *)&v14->_baseSystemCovariates, a4);
    uint64_t v15 = [(TRIClientExperiment *)v14->_clientExperiment endDate];
    uint64_t v16 = [v15 date];
    experimentEndDate = v14->_experimentEndDate;
    v14->_experimentEndDate = (NSDate *)v16;
  }
  return v14;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4 = a3;
  v5 = [(TRIExperimentDependentSystemCovariates *)self dictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    v9 = [NSString stringWithFormat:@"The system covariates do not contain the key %@", v4];
    id v10 = [v8 exceptionWithName:@"KeyNotFoundException" reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  v3 = [(TRISystemCovariateProviding *)self->_baseSystemCovariates dictionary];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(TRISystemConfiguration *)self->_sysConfig siriDeviceAggregationIdRotationDate];
  if (v5) {
    BOOL v6 = [(NSDate *)self->_experimentEndDate compare:v5] == NSOrderedAscending;
  }
  else {
    BOOL v6 = 0;
  }
  v7 = [NSNumber numberWithBool:v6];
  [v4 setObject:v7 forKeyedSubscript:@"SiriAggregationIdRotationIsOutsideExperiment"];

  v8 = (void *)[v4 copy];
  return v8;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(TRIExperimentDependentSystemCovariates *)self dictionary];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentEndDate, 0);
  objc_storeStrong((id *)&self->_baseSystemCovariates, 0);
  objc_storeStrong((id *)&self->_clientExperiment, 0);
  objc_storeStrong((id *)&self->_sysConfig, 0);
}

@end