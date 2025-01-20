@interface APOdmlRecipe
- (APOdmlRecipe)coreMLRecipe;
- (APOdmlRecipe)initWithDictionary:(id)a3;
- (APOdmlRecipe)initWithMLRTask:(id)a3;
- (NSArray)augmentedDESRecords;
- (NSArray)inputNames;
- (NSArray)outputNames;
- (NSArray)trainLayers;
- (NSArray)weightNames;
- (NSDictionary)desSettings;
- (NSDictionary)featureValueConfig;
- (NSDictionary)modelOutputConfig;
- (NSDictionary)privacyParams;
- (NSNumber)augmentedDESRecordsLimit;
- (NSNumber)augmentedDESRecordsRatio;
- (NSNumber)augmentedDESRecordsTruePercentage;
- (NSNumber)batchSize;
- (NSNumber)isCounterfactual;
- (NSNumber)l2NormBound;
- (NSNumber)learningRate;
- (NSNumber)localIterationsCount;
- (NSNumber)maxNorm;
- (NSNumber)minTrainingSamples;
- (NSNumber)normBinCount;
- (NSNumber)shouldShuffle;
- (NSNumber)weightBySamples;
- (NSString)augmentedDESRecordsTargetKey;
- (NSString)functionInitName;
- (NSString)iCloudServiceKey;
- (NSString)isTrainingName;
- (NSString)labelName;
- (NSString)learningRateName;
- (NSString)lossName;
- (NSString)modelFileName;
- (NSString)modelType;
- (id)rangeBoundaryForFeature:(id)a3 upperBound:(BOOL)a4;
- (id)rangeBoundaryForOutput:(BOOL)a3;
- (id)sentinelValuesForFeature:(id)a3;
- (id)sentinelValuesForOutput;
@end

@implementation APOdmlRecipe

- (APOdmlRecipe)initWithDictionary:(id)a3
{
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)APOdmlRecipe;
  v6 = [(APOdmlRecipe *)&v108 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"ModelType");
    modelType = v6->_modelType;
    v6->_modelType = (NSString *)v7;

    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"ModelFileName");
    modelFileName = v6->_modelFileName;
    v6->_modelFileName = (NSString *)v10;

    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"LossName");
    lossName = v6->_lossName;
    v6->_lossName = (NSString *)v13;

    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v4, v15, @"LabelName");
    labelName = v6->_labelName;
    v6->_labelName = (NSString *)v16;

    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"LearningRateName");
    learningRateName = v6->_learningRateName;
    v6->_learningRateName = (NSString *)v19;

    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v4, v21, @"InitName");
    functionInitName = v6->_functionInitName;
    v6->_functionInitName = (NSString *)v22;

    uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v4, v24, @"IsTrainingName");
    isTrainingName = v6->_isTrainingName;
    v6->_isTrainingName = (NSString *)v25;

    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v4, v27, @"IsCounterfactual");
    isCounterfactual = v6->_isCounterfactual;
    v6->_isCounterfactual = (NSNumber *)v28;

    uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"CentralDifferentialPrivacyParameters");
    privacyParams = v6->_privacyParams;
    v6->_privacyParams = (NSDictionary *)v31;

    uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v4, v33, @"L2NormBound");
    l2NormBound = v6->_l2NormBound;
    v6->_l2NormBound = (NSNumber *)v34;

    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v4, v36, @"LearningRate");
    learningRate = v6->_learningRate;
    v6->_learningRate = (NSNumber *)v37;

    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v4, v39, @"NumLocalIterations");
    localIterationsCount = v6->_localIterationsCount;
    v6->_localIterationsCount = (NSNumber *)v40;

    uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v4, v42, @"TrainLayers");
    trainLayers = v6->_trainLayers;
    v6->_trainLayers = (NSArray *)v43;

    uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v4, v45, @"WeightBySamples");
    weightBySamples = v6->_weightBySamples;
    v6->_weightBySamples = (NSNumber *)v46;

    uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v4, v48, @"shouldShuffle");
    shouldShuffle = v6->_shouldShuffle;
    v6->_shouldShuffle = (NSNumber *)v49;

    uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v4, v51, @"des_settings");
    desSettings = v6->_desSettings;
    v6->_desSettings = (NSDictionary *)v52;

    uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v4, v54, @"iCloudAggServiceKey");
    iCloudServiceKey = v6->_iCloudServiceKey;
    v6->_iCloudServiceKey = (NSString *)v55;

    uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v4, v57, @"maxNorm");
    maxNorm = v6->_maxNorm;
    v6->_maxNorm = (NSNumber *)v58;

    uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v4, v60, @"minTrainingSamples");
    minTrainingSamples = v6->_minTrainingSamples;
    v6->_minTrainingSamples = (NSNumber *)v61;

    uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v4, v63, @"normBinCount");
    normBinCount = v6->_normBinCount;
    v6->_normBinCount = (NSNumber *)v64;

    uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v4, v66, @"WeightNames");
    weightNames = v6->_weightNames;
    v6->_weightNames = (NSArray *)v67;

    uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v4, v69, @"batchSize");
    batchSize = v6->_batchSize;
    v6->_batchSize = (NSNumber *)v70;

    uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v4, v72, @"featureValueConfig");
    featureValueConfig = v6->_featureValueConfig;
    v6->_featureValueConfig = (NSDictionary *)v73;

    uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v4, v75, @"modelOutputConfig");
    modelOutputConfig = v6->_modelOutputConfig;
    v6->_modelOutputConfig = (NSDictionary *)v76;

    uint64_t v79 = objc_msgSend_objectForKeyedSubscript_(v4, v78, @"augmentedDESRecords");
    augmentedDESRecords = v6->_augmentedDESRecords;
    v6->_augmentedDESRecords = (NSArray *)v79;

    uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v4, v81, @"augmentedDESRecordsLimit");
    augmentedDESRecordsLimit = v6->_augmentedDESRecordsLimit;
    v6->_augmentedDESRecordsLimit = (NSNumber *)v82;

    uint64_t v85 = objc_msgSend_objectForKeyedSubscript_(v4, v84, @"augmentedDESRecordsRatio");
    augmentedDESRecordsRatio = v6->_augmentedDESRecordsRatio;
    v6->_augmentedDESRecordsRatio = (NSNumber *)v85;

    uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v4, v87, @"augmentedDESRecordsTruePercentage");
    augmentedDESRecordsTruePercentage = v6->_augmentedDESRecordsTruePercentage;
    v6->_augmentedDESRecordsTruePercentage = (NSNumber *)v88;

    uint64_t v91 = objc_msgSend_objectForKeyedSubscript_(v4, v90, @"augmentedDESRecordsTargetKey");
    augmentedDESRecordsTargetKey = v6->_augmentedDESRecordsTargetKey;
    v6->_augmentedDESRecordsTargetKey = (NSString *)v91;

    uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v4, v93, @"InputNames");
    inputNames = v6->_inputNames;
    v6->_inputNames = (NSArray *)v94;

    uint64_t v97 = objc_msgSend_objectForKeyedSubscript_(v4, v96, @"OutputNames");
    outputNames = v6->_outputNames;
    v6->_outputNames = (NSArray *)v97;

    v100 = objc_msgSend_objectForKeyedSubscript_(v4, v99, @"MILModel");

    if (v100)
    {
      v101 = [APOdmlRecipe alloc];
      v103 = objc_msgSend_objectForKeyedSubscript_(v4, v102, @"MILModel");
      uint64_t v105 = objc_msgSend_initWithDictionary_(v101, v104, (uint64_t)v103);
      coreMLRecipe = v6->_coreMLRecipe;
      v6->_coreMLRecipe = (APOdmlRecipe *)v105;
    }
  }

  return v6;
}

- (APOdmlRecipe)initWithMLRTask:(id)a3
{
  id v4 = objc_msgSend_parameters(a3, a2, (uint64_t)a3);
  v95.receiver = self;
  v95.super_class = (Class)APOdmlRecipe;
  v6 = [(APOdmlRecipe *)&v95 init];
  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"ModelType");
    modelType = v6->_modelType;
    v6->_modelType = (NSString *)v8;

    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"ModelFileName");
    modelFileName = v6->_modelFileName;
    v6->_modelFileName = (NSString *)v11;

    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v4, v13, @"LossName");
    lossName = v6->_lossName;
    v6->_lossName = (NSString *)v14;

    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"LabelName");
    labelName = v6->_labelName;
    v6->_labelName = (NSString *)v17;

    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"LearningRateName");
    learningRateName = v6->_learningRateName;
    v6->_learningRateName = (NSString *)v20;

    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"InitName");
    functionInitName = v6->_functionInitName;
    v6->_functionInitName = (NSString *)v23;

    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"IsTrainingName");
    isTrainingName = v6->_isTrainingName;
    v6->_isTrainingName = (NSString *)v26;

    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"IsCounterfactual");
    isCounterfactual = v6->_isCounterfactual;
    v6->_isCounterfactual = (NSNumber *)v29;

    uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v4, v31, @"CentralDifferentialPrivacyParameters");
    privacyParams = v6->_privacyParams;
    v6->_privacyParams = (NSDictionary *)v32;

    uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v4, v34, @"L2NormBound");
    l2NormBound = v6->_l2NormBound;
    v6->_l2NormBound = (NSNumber *)v35;

    uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v4, v37, @"LearningRate");
    learningRate = v6->_learningRate;
    v6->_learningRate = (NSNumber *)v38;

    uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(v4, v40, @"NumLocalIterations");
    localIterationsCount = v6->_localIterationsCount;
    v6->_localIterationsCount = (NSNumber *)v41;

    uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v4, v43, @"TrainLayers");
    trainLayers = v6->_trainLayers;
    v6->_trainLayers = (NSArray *)v44;

    uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v4, v46, @"WeightBySamples");
    weightBySamples = v6->_weightBySamples;
    v6->_weightBySamples = (NSNumber *)v47;

    uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v4, v49, @"shouldShuffle");
    shouldShuffle = v6->_shouldShuffle;
    v6->_shouldShuffle = (NSNumber *)v50;

    uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v4, v52, @"des_settings");
    desSettings = v6->_desSettings;
    v6->_desSettings = (NSDictionary *)v53;

    uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v4, v55, @"iCloudAggServiceKey");
    iCloudServiceKey = v6->_iCloudServiceKey;
    v6->_iCloudServiceKey = (NSString *)v56;

    uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v4, v58, @"maxNorm");
    maxNorm = v6->_maxNorm;
    v6->_maxNorm = (NSNumber *)v59;

    uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v4, v61, @"minTrainingSamples");
    minTrainingSamples = v6->_minTrainingSamples;
    v6->_minTrainingSamples = (NSNumber *)v62;

    uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v4, v64, @"normBinCount");
    normBinCount = v6->_normBinCount;
    v6->_normBinCount = (NSNumber *)v65;

    uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v4, v67, @"WeightNames");
    weightNames = v6->_weightNames;
    v6->_weightNames = (NSArray *)v68;

    uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v4, v70, @"batchSize");
    batchSize = v6->_batchSize;
    v6->_batchSize = (NSNumber *)v71;

    uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v4, v73, @"featureValueConfig");
    featureValueConfig = v6->_featureValueConfig;
    v6->_featureValueConfig = (NSDictionary *)v74;

    uint64_t v77 = objc_msgSend_objectForKeyedSubscript_(v4, v76, @"modelOutputConfig");
    modelOutputConfig = v6->_modelOutputConfig;
    v6->_modelOutputConfig = (NSDictionary *)v77;

    uint64_t v80 = objc_msgSend_objectForKeyedSubscript_(v4, v79, @"augmentedDESRecords");
    augmentedDESRecords = v6->_augmentedDESRecords;
    v6->_augmentedDESRecords = (NSArray *)v80;

    uint64_t v83 = objc_msgSend_objectForKeyedSubscript_(v4, v82, @"augmentedDESRecordsLimit");
    augmentedDESRecordsLimit = v6->_augmentedDESRecordsLimit;
    v6->_augmentedDESRecordsLimit = (NSNumber *)v83;

    uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v4, v85, @"augmentedDESRecordsRatio");
    augmentedDESRecordsRatio = v6->_augmentedDESRecordsRatio;
    v6->_augmentedDESRecordsRatio = (NSNumber *)v86;

    uint64_t v89 = objc_msgSend_objectForKeyedSubscript_(v4, v88, @"augmentedDESRecordsTruePercentage");
    augmentedDESRecordsTruePercentage = v6->_augmentedDESRecordsTruePercentage;
    v6->_augmentedDESRecordsTruePercentage = (NSNumber *)v89;

    uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(v4, v91, @"augmentedDESRecordsTargetKey");
    augmentedDESRecordsTargetKey = v6->_augmentedDESRecordsTargetKey;
    v6->_augmentedDESRecordsTargetKey = (NSString *)v92;
  }
  return v6;
}

- (id)sentinelValuesForFeature:(id)a3
{
  id v4 = a3;
  BOOL v7 = objc_msgSend_featureValueConfig(self, v5, v6);
  v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)v4);

  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, @"sentinelValueSet");

  return v11;
}

- (id)rangeBoundaryForFeature:(id)a3 upperBound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9 = objc_msgSend_featureValueConfig(self, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v6);

  uint64_t v13 = kAPOdmlConfigMax;
  if (!v4) {
    uint64_t v13 = kAPOdmlConfigMin;
  }
  uint64_t v14 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)*v13);

  return v14;
}

- (id)sentinelValuesForOutput
{
  v3 = objc_msgSend_modelOutputConfig(self, a2, v2);
  v5 = objc_msgSend_objectForKey_(v3, v4, @"sentinelValueSet");

  return v5;
}

- (id)rangeBoundaryForOutput:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_msgSend_modelOutputConfig(self, a2, a3);
  id v6 = v4;
  BOOL v7 = kAPOdmlConfigMax;
  if (!v3) {
    BOOL v7 = kAPOdmlConfigMin;
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)*v7);

  return v8;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSString)modelFileName
{
  return self->_modelFileName;
}

- (NSString)lossName
{
  return self->_lossName;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)learningRateName
{
  return self->_learningRateName;
}

- (NSString)functionInitName
{
  return self->_functionInitName;
}

- (NSString)isTrainingName
{
  return self->_isTrainingName;
}

- (NSNumber)isCounterfactual
{
  return self->_isCounterfactual;
}

- (NSString)iCloudServiceKey
{
  return self->_iCloudServiceKey;
}

- (NSNumber)l2NormBound
{
  return self->_l2NormBound;
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (NSNumber)localIterationsCount
{
  return self->_localIterationsCount;
}

- (NSNumber)weightBySamples
{
  return self->_weightBySamples;
}

- (NSNumber)shouldShuffle
{
  return self->_shouldShuffle;
}

- (NSNumber)minTrainingSamples
{
  return self->_minTrainingSamples;
}

- (NSNumber)maxNorm
{
  return self->_maxNorm;
}

- (NSNumber)normBinCount
{
  return self->_normBinCount;
}

- (NSDictionary)desSettings
{
  return self->_desSettings;
}

- (NSDictionary)privacyParams
{
  return self->_privacyParams;
}

- (NSArray)trainLayers
{
  return self->_trainLayers;
}

- (NSArray)weightNames
{
  return self->_weightNames;
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (NSDictionary)featureValueConfig
{
  return self->_featureValueConfig;
}

- (NSDictionary)modelOutputConfig
{
  return self->_modelOutputConfig;
}

- (NSArray)augmentedDESRecords
{
  return self->_augmentedDESRecords;
}

- (NSNumber)augmentedDESRecordsLimit
{
  return self->_augmentedDESRecordsLimit;
}

- (NSString)augmentedDESRecordsTargetKey
{
  return self->_augmentedDESRecordsTargetKey;
}

- (NSNumber)augmentedDESRecordsTruePercentage
{
  return self->_augmentedDESRecordsTruePercentage;
}

- (NSNumber)augmentedDESRecordsRatio
{
  return self->_augmentedDESRecordsRatio;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (APOdmlRecipe)coreMLRecipe
{
  return self->_coreMLRecipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreMLRecipe, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsRatio, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsTruePercentage, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsTargetKey, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsLimit, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecords, 0);
  objc_storeStrong((id *)&self->_modelOutputConfig, 0);
  objc_storeStrong((id *)&self->_featureValueConfig, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_weightNames, 0);
  objc_storeStrong((id *)&self->_trainLayers, 0);
  objc_storeStrong((id *)&self->_privacyParams, 0);
  objc_storeStrong((id *)&self->_desSettings, 0);
  objc_storeStrong((id *)&self->_normBinCount, 0);
  objc_storeStrong((id *)&self->_maxNorm, 0);
  objc_storeStrong((id *)&self->_minTrainingSamples, 0);
  objc_storeStrong((id *)&self->_shouldShuffle, 0);
  objc_storeStrong((id *)&self->_weightBySamples, 0);
  objc_storeStrong((id *)&self->_localIterationsCount, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_l2NormBound, 0);
  objc_storeStrong((id *)&self->_iCloudServiceKey, 0);
  objc_storeStrong((id *)&self->_isCounterfactual, 0);
  objc_storeStrong((id *)&self->_isTrainingName, 0);
  objc_storeStrong((id *)&self->_functionInitName, 0);
  objc_storeStrong((id *)&self->_learningRateName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_modelFileName, 0);

  objc_storeStrong((id *)&self->_modelType, 0);
}

@end