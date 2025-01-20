@interface TIFeatureUsageDescriptor
+ (id)featureUsageDescriptorWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11;
- (NSString)configString;
- (NSString)discoveryCounter;
- (TIFeatureUsageDescriptor)initWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11;
- (int64_t)discoveryThreshold;
@end

@implementation TIFeatureUsageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configString, 0);

  objc_storeStrong((id *)&self->_discoveryCounter, 0);
}

- (NSString)configString
{
  return self->_configString;
}

- (int64_t)discoveryThreshold
{
  return self->_discoveryThreshold;
}

- (NSString)discoveryCounter
{
  return self->_discoveryCounter;
}

- (TIFeatureUsageDescriptor)initWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11
{
  id v15 = a3;
  id obj = a4;
  id v49 = a4;
  id v46 = a6;
  id v48 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (!v20)
  {
    v22 = (void *)MEMORY[0x1E4F1C978];
    id v43 = v15;
    LODWORD(v21) = 1008981770;
    uint64_t v23 = [NSNumber numberWithFloat:v21];
    LODWORD(v24) = 1045220557;
    [NSNumber numberWithFloat:v24];
    v25 = id v42 = v18;
    LODWORD(v26) = 1053609165;
    v27 = [NSNumber numberWithFloat:v26];
    LODWORD(v28) = 1058642330;
    v29 = [NSNumber numberWithFloat:v28];
    LODWORD(v30) = 1061997773;
    v31 = [NSNumber numberWithFloat:v30];
    LODWORD(v32) = 1065185444;
    v33 = [NSNumber numberWithFloat:v32];
    v34 = v22;
    id v35 = v17;
    id v36 = v16;
    v37 = (void *)v23;
    objc_msgSend(v34, "arrayWithObjects:", v23, v25, v27, v29, v31, v33, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    id v15 = v43;
    id v18 = v42;

    id v16 = v36;
    id v17 = v35;
  }
  v38 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4FAEFB0], *MEMORY[0x1E4FAEFA8], *MEMORY[0x1E4FAEF88], *MEMORY[0x1E4FAEF90], *MEMORY[0x1E4FAEF80], *MEMORY[0x1E4FAEFA0], *MEMORY[0x1E4FAEF98], 0);
  v50.receiver = self;
  v50.super_class = (Class)TIFeatureUsageDescriptor;
  v39 = [(TINumericValueDescriptor *)&v50 initWithMetricName:v15 calculationExpression:v16 calculationPrecondition:v17 calculationDefaultValue:v18 calculationDependencies:v19 bucketThresholds:v20 bucketValues:v38];
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_discoveryCounter, obj);
    v40->_discoveryThreshold = a5;
    objc_storeStrong((id *)&v40->_configString, v46);
  }

  return v40;
}

+ (id)featureUsageDescriptorWithMetricName:(id)a3 discoveryCounter:(id)a4 discoveryThreshold:(int64_t)a5 configString:(id)a6 calculationExpression:(id)a7 calculationPrecondition:(id)a8 calculationDefaultValue:(id)a9 calculationDependencies:(id)a10 bucketThresholds:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  v25 = [[TIFeatureUsageDescriptor alloc] initWithMetricName:v24 discoveryCounter:v23 discoveryThreshold:a5 configString:v22 calculationExpression:v21 calculationPrecondition:v20 calculationDefaultValue:v19 calculationDependencies:v18 bucketThresholds:v17];

  return v25;
}

@end