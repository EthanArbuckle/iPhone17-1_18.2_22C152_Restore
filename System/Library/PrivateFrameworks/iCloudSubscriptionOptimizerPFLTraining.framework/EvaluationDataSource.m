@interface EvaluationDataSource
+ (id)defaultRecipeParams;
+ (void)initialize;
- (BOOL)allNegativeSamples;
- (BOOL)doDummyDataFilter;
- (BOOL)useNewTrainingAPI;
- (EvaluationDataSource)initWithRecipe:(id)a3 infos:(id)a4 datas:(id)a5 error:(id *)a6;
- (NSArray)layersToTrain;
- (NSArray)recordDatas;
- (NSArray)recordInfos;
- (NSArray)records;
- (NSDictionary)recipe;
- (NSString)freezeComponents;
- (NSString)gradNormType;
- (NSString)modelFeatures;
- (NSString)modelInputSchemaInputName;
- (NSString)modelInputSchemaLabelName;
- (NSString)modelOutputName;
- (NSString)objectiveFunction;
- (float)gradNormFactor;
- (float)l2NormBound;
- (float)learningRate;
- (float)learningRateDecay;
- (float)negativeSamplingRate;
- (id)dataForRecord:(unint64_t)a3;
- (id)extractFeatureDataForRecord:(unint64_t)a3;
- (id)extractFullFeatureListForRecord:(unint64_t)a3;
- (id)getRecordInfo:(unint64_t)a3;
- (id)vectorForClassification:(int64_t)a3;
- (int)batchSize;
- (int)labelKeyName;
- (int)minBatchSize;
- (int)minDaemonVersion;
- (int)minsUntil;
- (int)numLocalIterations;
- (int64_t)classificationForRecord:(unint64_t)a3;
- (unint64_t)recordCount;
- (void)filterInMatchedLabelData:(id)a3;
- (void)filteringOperation;
- (void)filteroutDummyData;
- (void)performDownSampling;
- (void)selectDaemonVersion:(int)a3;
- (void)setRecipe:(id)a3;
- (void)setRecordDatas:(id)a3;
- (void)setRecordInfos:(id)a3;
- (void)setRecords:(id)a3;
- (void)validateRecordInfo:(id)a3;
@end

@implementation EvaluationDataSource

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin", "EvaluationDataSource");
    MEMORY[0x270F9A758]();
  }
}

+ (id)defaultRecipeParams
{
  v5[21] = *MEMORY[0x263EF8340];
  v4[0] = @"NumLocalIterations";
  v4[1] = @"LearningRate";
  v5[0] = &unk_26F09F908;
  v5[1] = &unk_26F09F980;
  v4[2] = @"LearningRateDecay";
  v4[3] = @"TrainLayers";
  v5[2] = &unk_26F09F990;
  v5[3] = MEMORY[0x263EFFA68];
  v4[4] = @"GradientNormFactor";
  v4[5] = @"BatchSize";
  v5[4] = &unk_26F09F9A0;
  v5[5] = &unk_26F09F908;
  v4[6] = @"L2NormBound";
  v4[7] = @"GradientNormType";
  v5[6] = &unk_26F09F9B0;
  v5[7] = @"NoGradNorm";
  v4[8] = @"ObjectiveFunction";
  v4[9] = @"FrozenComponentIds";
  v5[8] = @"xent";
  v5[9] = &stru_26F09E3B8;
  v4[10] = @"ModelFeatures";
  v4[11] = @"MinsUntil";
  v5[10] = &stru_26F09E3B8;
  v5[11] = &unk_26F09F920;
  v4[12] = @"MinDaemonVersion";
  v4[13] = @"DoDummyDataFilter";
  v5[12] = &unk_26F09F938;
  v5[13] = &unk_26F09F938;
  v4[14] = @"ModelOutputName";
  v4[15] = @"MinBatchSize";
  v5[14] = @"propensity";
  v5[15] = &unk_26F09F908;
  v4[16] = @"NegativeSamplingRate";
  v4[17] = @"LabelKeyName";
  v5[16] = &unk_26F09F990;
  v5[17] = &unk_26F09F908;
  v4[18] = @"ModelInputSchemaInputName";
  v4[19] = @"ModelInputSchemaLabelName";
  v5[18] = @"input_1";
  v5[19] = @"label_input_0";
  v4[20] = @"UseNewTrainingAPI";
  v5[20] = &unk_26F09F938;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:21];

  return v2;
}

- (EvaluationDataSource)initWithRecipe:(id)a3 infos:(id)a4 datas:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)EvaluationDataSource;
  v12 = [(EvaluationDataSource *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    recordInfos = v12->_recordInfos;
    v12->_recordInfos = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    recordDatas = v12->_recordDatas;
    v12->_recordDatas = (NSArray *)v15;

    v17 = +[EvaluationDataSource defaultRecipeParams];
    v18 = (void *)[v17 mutableCopy];

    [v18 addEntriesFromDictionary:v9];
    uint64_t v19 = [v18 copy];
    recipe = v12->_recipe;
    v12->_recipe = (NSDictionary *)v19;

    v21 = v12;
  }

  return v12;
}

- (int)numLocalIterations
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"NumLocalIterations"];
  int v4 = [v3 intValue];

  return v4;
}

- (float)learningRate
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LearningRate"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)learningRateDecay
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LearningRateDecay"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (NSArray)layersToTrain
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"TrainLayers"];

  return (NSArray *)v3;
}

- (float)gradNormFactor
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"GradientNormFactor"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)batchSize
{
  v3 = [(EvaluationDataSource *)self recipe];
  float v4 = [v3 objectForKeyedSubscript:@"BatchSize"];
  int v5 = [v4 intValue];

  int result = [(EvaluationDataSource *)self recordCount];
  if (v5 < result) {
    return v5;
  }
  return result;
}

- (float)l2NormBound
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"L2NormBound"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (NSString)gradNormType
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"GradientNormType"];

  return (NSString *)v3;
}

- (NSString)objectiveFunction
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ObjectiveFunction"];

  return (NSString *)v3;
}

- (NSString)freezeComponents
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"FrozenComponentIds"];

  return (NSString *)v3;
}

- (NSString)modelFeatures
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ModelFeatures"];

  return (NSString *)v3;
}

- (int)minsUntil
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"MinsUntil"];
  int v4 = [v3 intValue];

  return v4;
}

- (int)minDaemonVersion
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"MinDaemonVersion"];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)doDummyDataFilter
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"DoDummyDataFilter"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)modelOutputName
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ModelOutputName"];

  return (NSString *)v3;
}

- (NSString)modelInputSchemaInputName
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ModelInputSchemaInputName"];

  return (NSString *)v3;
}

- (NSString)modelInputSchemaLabelName
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ModelInputSchemaLabelName"];

  return (NSString *)v3;
}

- (int)minBatchSize
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"MinBatchSize"];
  int v4 = [v3 intValue];

  return v4;
}

- (float)negativeSamplingRate
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"NegativeSamplingRate"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)labelKeyName
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LabelKeyName"];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)useNewTrainingAPI
{
  v2 = [(EvaluationDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"UseNewTrainingAPI"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)recordCount
{
  return [(NSArray *)self->_recordInfos count];
}

- (id)dataForRecord:(unint64_t)a3
{
  return [(NSArray *)self->_recordDatas objectAtIndexedSubscript:a3];
}

- (void)filteroutDummyData
{
  id v16 = [MEMORY[0x263EFF980] array];
  v3 = [MEMORY[0x263EFF980] array];
  if ([(NSArray *)self->_recordInfos count])
  {
    unint64_t v4 = 0;
    do
    {
      float v5 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v4];
      v6 = [v5 objectForKey:@"isDummyData"];

      if (v6)
      {
        v7 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v4];
        v8 = [v7 objectForKey:@"isDummyData"];
        char v9 = [v8 BOOLValue];

        if ((v9 & 1) == 0)
        {
          id v10 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v4];
          [v16 addObject:v10];

          id v11 = [(NSArray *)self->_recordDatas objectAtIndexedSubscript:v4];
          [v3 addObject:v11];
        }
      }
      ++v4;
    }
    while ([(NSArray *)self->_recordInfos count] > v4);
  }
  v12 = (NSArray *)[v16 copy];
  recordInfos = self->_recordInfos;
  self->_recordInfos = v12;

  v14 = (NSArray *)[v3 copy];
  recordDatas = self->_recordDatas;
  self->_recordDatas = v14;
}

- (void)selectDaemonVersion:(int)a3
{
  id v18 = [MEMORY[0x263EFF980] array];
  float v5 = [MEMORY[0x263EFF980] array];
  if ([(NSArray *)self->_recordInfos count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v6];
      v8 = [v7 objectForKey:@"daemonVersion"];

      if (v8)
      {
        char v9 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v6];
        id v10 = [v9 objectForKey:@"daemonVersion"];
        int v11 = [v10 intValue];

        if (v11 >= a3)
        {
          v12 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v6];
          [v18 addObject:v12];

          uint64_t v13 = [(NSArray *)self->_recordDatas objectAtIndexedSubscript:v6];
          [v5 addObject:v13];
        }
      }
      ++v6;
    }
    while ([(NSArray *)self->_recordInfos count] > v6);
  }
  v14 = (NSArray *)[v18 copy];
  recordInfos = self->_recordInfos;
  self->_recordInfos = v14;

  id v16 = (NSArray *)[v5 copy];
  recordDatas = self->_recordDatas;
  self->_recordDatas = v16;
}

- (void)filteringOperation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"MinDaemonVersion"];
  uint64_t v4 = [v3 intValue];

  if ((int)v4 >= 1)
  {
    float v5 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = v4;
      _os_log_impl(&dword_23C9A9000, v5, OS_LOG_TYPE_INFO, "About to select samples with daemon version >= %d only.", (uint8_t *)v13, 8u);
    }
    [(EvaluationDataSource *)self selectDaemonVersion:v4];
  }
  unint64_t v6 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"DoDummyDataFilter"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_23C9A9000, v8, OS_LOG_TYPE_INFO, "About to select samples with isDummyData == false", (uint8_t *)v13, 2u);
    }
    [(EvaluationDataSource *)self filteroutDummyData];
  }
  char v9 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"LabelKeyName"];
  int v10 = [v9 intValue];

  int v11 = @"buyLabel";
  if (v10 == 2) {
    int v11 = @"openLabelSubStream";
  }
  if (v10 == 1) {
    v12 = @"icloudNotificationActionLabel";
  }
  else {
    v12 = v11;
  }
  [(EvaluationDataSource *)self filterInMatchedLabelData:v12];
}

- (id)vectorForClassification:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  float v5 = v4;
  if (a3) {
    unint64_t v6 = &unk_26F09F980;
  }
  else {
    unint64_t v6 = &unk_26F09F9C0;
  }
  [v4 addObject:v6];
  if (a3 == 1) {
    int v7 = &unk_26F09F9C0;
  }
  else {
    int v7 = &unk_26F09F980;
  }
  [v5 addObject:v7];

  return v5;
}

- (int64_t)classificationForRecord:(unint64_t)a3
{
  uint64_t v4 = [(EvaluationDataSource *)self getRecordInfo:a3];
  [(EvaluationDataSource *)self validateRecordInfo:v4];
  float v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"LabelKeyName"];
  int v6 = [v5 intValue];

  if (v6 == 2)
  {
    int v7 = [v4 objectForKeyedSubscript:@"openLabelSubStream"];
    if ([v7 intValue] != 1) {
      goto LABEL_11;
    }
    v8 = @"minsUntilICloudOpenedSubStream";
  }
  else
  {
    if (v6 == 1)
    {
      int v7 = [v4 objectForKeyedSubscript:@"icloudNotificationActionLabel"];
      if ([v7 intValue] == 1)
      {
        v8 = @"minsUntilICloudNotificationOpened";
        goto LABEL_9;
      }
LABEL_11:

      goto LABEL_12;
    }
    int v7 = [v4 objectForKeyedSubscript:@"buyLabel"];
    if ([v7 intValue] != 1) {
      goto LABEL_11;
    }
    v8 = @"minsUntilICloudBuy";
  }
LABEL_9:
  char v9 = [v4 objectForKeyedSubscript:v8];
  int v10 = [v9 intValue];
  int v11 = [(EvaluationDataSource *)self minsUntil];

  if (v10 >= v11)
  {
LABEL_12:
    int64_t v12 = 0;
    goto LABEL_13;
  }
  int64_t v12 = 1;
LABEL_13:

  return v12;
}

- (id)getRecordInfo:(unint64_t)a3
{
  records = self->_records;
  if (records)
  {
    float v5 = [(NSArray *)records objectAtIndexedSubscript:a3];
    int v6 = [NSURL fileURLWithPath:@"/var/mobile/Library/DES/Records/com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"];
    int v7 = [v6 URLByAppendingPathComponent:v5];
    v8 = [v7 URLByAppendingPathExtension:@"json"];

    char v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
    uint64_t v12 = 0;
    int v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v12];
  }
  else
  {
    int v10 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:a3];
  }

  return v10;
}

- (void)validateRecordInfo:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"LabelKeyName"];
  int v6 = [v5 intValue];

  if (v6 == 2)
  {
    char v9 = [v4 objectForKey:@"openLabelSubStream"];

    if (!v9 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:].cold.6();
    }
    int v10 = [v4 objectForKey:@"minsUntilICloudOpenedSubStream"];

    if (!v10 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:].cold.5();
    }
  }
  else if (v6 == 1)
  {
    int v7 = [v4 objectForKey:@"icloudNotificationActionLabel"];

    if (!v7 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:].cold.4();
    }
    v8 = [v4 objectForKey:@"minsUntilICloudNotificationOpened"];

    if (!v8 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:]();
    }
  }
  else
  {
    int v11 = [v4 objectForKey:@"buyLabel"];

    if (!v11 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:]();
    }
    uint64_t v12 = [v4 objectForKey:@"minsUntilICloudBuy"];

    if (!v12 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[EvaluationDataSource validateRecordInfo:]();
    }
  }
}

- (void)filterInMatchedLabelData:(id)a3
{
  id v15 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  float v5 = [MEMORY[0x263EFF980] array];
  if ([(NSArray *)self->_recordInfos count])
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v6];
      v8 = [v7 objectForKey:v15];

      if (v8)
      {
        char v9 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:v6];
        [v4 addObject:v9];

        int v10 = [(NSArray *)self->_recordDatas objectAtIndexedSubscript:v6];
        [v5 addObject:v10];
      }
      ++v6;
    }
    while ([(NSArray *)self->_recordInfos count] > v6);
  }
  int v11 = (NSArray *)[v4 copy];
  recordInfos = self->_recordInfos;
  self->_recordInfos = v11;

  uint64_t v13 = (NSArray *)[v5 copy];
  recordDatas = self->_recordDatas;
  self->_recordDatas = v13;
}

- (BOOL)allNegativeSamples
{
  if (![(EvaluationDataSource *)self recordCount]) {
    return 1;
  }
  unint64_t v3 = 0;
  do
  {
    int64_t v4 = [(EvaluationDataSource *)self classificationForRecord:v3];
    BOOL v5 = v4 != 1;
    if (v4 == 1) {
      break;
    }
    ++v3;
  }
  while ([(EvaluationDataSource *)self recordCount] > v3);
  return v5;
}

- (void)performDownSampling
{
  if ([(EvaluationDataSource *)self allNegativeSamples])
  {
    [(EvaluationDataSource *)self negativeSamplingRate];
    if (v3 < 1.0)
    {
      float v4 = (float)arc4random() * 2.3283e-10;
      [(EvaluationDataSource *)self negativeSamplingRate];
      if (v4 > v5)
      {
        unint64_t v6 = [MEMORY[0x263EFF980] array];
        recordInfos = self->_recordInfos;
        self->_recordInfos = v6;

        self->_recordDatas = [MEMORY[0x263EFF980] array];
        MEMORY[0x270F9A758]();
      }
    }
  }
}

- (id)extractFullFeatureListForRecord:(unint64_t)a3
{
  records = self->_records;
  if (records)
  {
    float v5 = [(NSArray *)records objectAtIndexedSubscript:a3];
    unint64_t v6 = [NSURL fileURLWithPath:@"/var/mobile/Library/DES/Records/com.apple.iCloudSubscriptionOptimizerCore.PFLPlugin"];
    int v7 = [v6 URLByAppendingPathComponent:v5];
    v8 = [v7 URLByAppendingPathExtension:@"json"];

    char v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
    uint64_t v15 = 0;
    int v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v15];
  }
  else
  {
    int v10 = [(NSArray *)self->_recordInfos objectAtIndexedSubscript:a3];
  }
  int v11 = [v10 objectForKey:@"features"];

  if (!v11 && os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
    -[EvaluationDataSource extractFullFeatureListForRecord:]();
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"features"];
  uint64_t v13 = [v12 componentsSeparatedByString:@","];

  return v13;
}

- (id)extractFeatureDataForRecord:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v26 = -[EvaluationDataSource dataForRecord:](self, "dataForRecord:");
  float v5 = [(EvaluationDataSource *)self modelFeatures];
  v29 = [(EvaluationDataSource *)self extractFullFeatureListForRecord:a3];
  v25 = v5;
  unint64_t v6 = [v5 componentsSeparatedByString:@","];
  int v7 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = v29;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v36 != v14) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * j) isEqualToString:v9])
              {
                id v16 = [NSNumber numberWithInteger:v13 + j];
                [v7 addObject:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
            v13 += j;
          }
          while (v12);
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v30);
  }

  v17 = [MEMORY[0x263EFF990] dataWithCapacity:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_super v23 = objc_msgSend(v26, "subdataWithRange:", 4 * objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "unsignedIntValue"), 4);
        [v17 appendData:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v20);
  }

  return v17;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (NSArray)recordInfos
{
  return self->_recordInfos;
}

- (void)setRecordInfos:(id)a3
{
}

- (NSArray)recordDatas
{
  return self->_recordDatas;
}

- (void)setRecordDatas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDatas, 0);
  objc_storeStrong((id *)&self->_recordInfos, 0);
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

- (void)validateRecordInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find minsUntilICloudBuy from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)validateRecordInfo:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find buyLabel from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)validateRecordInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find minsUntilICloudNotificationOpened from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)validateRecordInfo:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find icloudNotificationActionLabel from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)validateRecordInfo:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find minsUntilIcloudOpenedSubStream from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)validateRecordInfo:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find openLabelSubStream from recordInfo.", v2, v3, v4, v5, v6);
}

- (void)extractFullFeatureListForRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C9A9000, v0, v1, "Failed to find features from recordInfo.", v2, v3, v4, v5, v6);
}

@end