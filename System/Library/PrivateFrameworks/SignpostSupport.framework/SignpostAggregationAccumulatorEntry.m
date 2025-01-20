@interface SignpostAggregationAccumulatorEntry
+ (void)_bumpErrorCount:(id)a3 countDict:(id)a4;
- (BOOL)includeRawIntervals;
- (NSMutableDictionary)mutableAggregationAdditionErrorCounts;
- (NSMutableDictionary)mutableAggregationCreationErrorCounts;
- (NSString)aggregationDescription;
- (NSString)aggregationSignature;
- (NSString)category;
- (NSString)name;
- (NSString)subsystem;
- (SignpostAggregation)accumulatedAggregation;
- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6 includeRawIntervals:(BOOL)a7;
- (void)_handleInterval:(id)a3;
@end

@implementation SignpostAggregationAccumulatorEntry

+ (void)_bumpErrorCount:(id)a3 countDict:(id)a4
{
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  id v11 = [v7 localizedDescription];
  v8 = [v6 objectForKeyedSubscript:v11];
  v9 = objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v8, "unsignedLongLongValue") + 1);
  v10 = [v7 localizedDescription];

  [v6 setObject:v9 forKeyedSubscript:v10];
}

- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6 includeRawIntervals:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SignpostAggregationAccumulatorEntry;
  v17 = [(SignpostAggregationAccumulatorEntry *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_subsystem, a3);
    objc_storeStrong((id *)&v18->_category, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_aggregationDescription, a6);
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableAggregationAdditionErrorCounts = v18->_mutableAggregationAdditionErrorCounts;
    v18->_mutableAggregationAdditionErrorCounts = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableAggregationCreationErrorCounts = v18->_mutableAggregationCreationErrorCounts;
    v18->_mutableAggregationCreationErrorCounts = (NSMutableDictionary *)v21;

    v18->_includeRawIntervals = a7;
  }

  return v18;
}

- (void)_handleInterval:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = 0;
  v5 = [[SignpostAggregation alloc] initWithInterval:v4 errorsOut:&v25];
  id v6 = v25;
  id v7 = v6;
  if (v5)
  {
    v8 = [(SignpostAggregationAccumulatorEntry *)self accumulatedAggregation];

    if (v8)
    {
      v9 = [(SignpostAggregationAccumulatorEntry *)self accumulatedAggregation];
      id v10 = [v9 addAggregation:v5];

      if (v10)
      {
        id v11 = objc_opt_class();
        v12 = [(SignpostAggregationAccumulatorEntry *)self mutableAggregationAdditionErrorCounts];
        [v11 _bumpErrorCount:v10 countDict:v12];
      }
      else
      {
        v12 = [(SignpostAggregationAccumulatorEntry *)self accumulatedAggregation];
        [v12 dropRawIntervals];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_accumulatedAggregation, v5);
      id v10 = [(SignpostAggregationAccumulatorEntry *)self accumulatedAggregation];
      [v10 dropRawIntervals];
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v20 = v7;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v18 = objc_opt_class();
          uint64_t v19 = [(SignpostAggregationAccumulatorEntry *)self mutableAggregationCreationErrorCounts];
          [v18 _bumpErrorCount:v17 countDict:v19];
        }
        uint64_t v14 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
      id v7 = v20;
    }
  }
}

- (NSString)aggregationSignature
{
  v3 = [(SignpostAggregationAccumulatorEntry *)self subsystem];
  id v4 = [(SignpostAggregationAccumulatorEntry *)self category];
  v5 = [(SignpostAggregationAccumulatorEntry *)self name];
  id v6 = [(SignpostAggregationAccumulatorEntry *)self aggregationDescription];
  id v7 = +[SignpostAggregation _signatureForSubsystem:v3 category:v4 name:v5 aggregationDescription:v6];

  return (NSString *)v7;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)aggregationDescription
{
  return self->_aggregationDescription;
}

- (BOOL)includeRawIntervals
{
  return self->_includeRawIntervals;
}

- (SignpostAggregation)accumulatedAggregation
{
  return self->_accumulatedAggregation;
}

- (NSMutableDictionary)mutableAggregationCreationErrorCounts
{
  return self->_mutableAggregationCreationErrorCounts;
}

- (NSMutableDictionary)mutableAggregationAdditionErrorCounts
{
  return self->_mutableAggregationAdditionErrorCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAggregationAdditionErrorCounts, 0);
  objc_storeStrong((id *)&self->_mutableAggregationCreationErrorCounts, 0);
  objc_storeStrong((id *)&self->_accumulatedAggregation, 0);
  objc_storeStrong((id *)&self->_aggregationDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end