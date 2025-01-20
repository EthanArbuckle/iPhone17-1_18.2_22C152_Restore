@interface PHAPrivateFederatedLearningRecipeOptions
+ (id)validateRecipeOptions:(id)a3 error:(id *)a4;
+ (int64_t)datasetPolicyForPolicyName:(id)a3;
+ (int64_t)labelPolicyForLabelPolicyName:(id)a3;
+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (BOOL)shouldValidateModel;
- (NSArray)attachmentURLs;
- (NSArray)augmenters;
- (NSArray)evaluationMetricNames;
- (NSArray)layersToTrain;
- (NSDictionary)filtersByDatasetName;
- (NSNumber)negativesDatasetType;
- (NSNumber)positivesDatasetType;
- (NSString)biomeInputName;
- (NSString)biomeLabelName;
- (NSString)datasetPolicyString;
- (NSString)datasetSource;
- (NSString)fingerprintVersionName;
- (NSString)labelName;
- (NSString)labelPolicyString;
- (NSString)learningFramework;
- (NSString)lossName;
- (NSString)modelInputName;
- (NSString)modelOutputName;
- (NSString)negativesDatasetName;
- (NSString)negativesSubsetName;
- (NSString)optimizerName;
- (NSString)positivesDatasetName;
- (NSString)positivesSubsetName;
- (NSString)trainingTask;
- (PGFeatureTransformersForFeatureExtractors)transformersForFeatureExtractors;
- (PGManager)graphManager;
- (PHAPrivateFederatedLearningRecipeOptions)init;
- (PHPhotoLibrary)photoLibrary;
- (double)learningRate;
- (double)minProcessedRate;
- (int64_t)datasetPolicy;
- (int64_t)fingerprintVersion;
- (int64_t)labelPolicy;
- (unint64_t)batchSize;
- (unint64_t)featureSize;
- (unint64_t)labelSize;
- (unint64_t)numberOfClasses;
- (unint64_t)numberOfEpochs;
- (unint64_t)oversamplingRate;
- (unint64_t)totalNumberOfSamples;
- (void)setAttachmentURLs:(id)a3;
- (void)setAugmenters:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBiomeInputName:(id)a3;
- (void)setBiomeLabelName:(id)a3;
- (void)setDatasetPolicy:(int64_t)a3;
- (void)setDatasetPolicyString:(id)a3;
- (void)setDatasetSource:(id)a3;
- (void)setEvaluationMetricNames:(id)a3;
- (void)setFeatureSize:(unint64_t)a3;
- (void)setFiltersByDatasetName:(id)a3;
- (void)setFingerprintVersion:(int64_t)a3;
- (void)setFingerprintVersionName:(id)a3;
- (void)setGraphManager:(id)a3;
- (void)setLabelName:(id)a3;
- (void)setLabelPolicy:(int64_t)a3;
- (void)setLabelPolicyString:(id)a3;
- (void)setLabelSize:(unint64_t)a3;
- (void)setLayersToTrain:(id)a3;
- (void)setLearningFramework:(id)a3;
- (void)setLearningRate:(double)a3;
- (void)setLossName:(id)a3;
- (void)setMinProcessedRate:(double)a3;
- (void)setModelInputName:(id)a3;
- (void)setModelOutputName:(id)a3;
- (void)setNegativesDatasetName:(id)a3;
- (void)setNegativesDatasetType:(id)a3;
- (void)setNegativesSubsetName:(id)a3;
- (void)setNumberOfClasses:(unint64_t)a3;
- (void)setNumberOfEpochs:(unint64_t)a3;
- (void)setOptimizerName:(id)a3;
- (void)setOversamplingRate:(unint64_t)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPositivesDatasetName:(id)a3;
- (void)setPositivesDatasetType:(id)a3;
- (void)setPositivesSubsetName:(id)a3;
- (void)setShouldValidateModel:(BOOL)a3;
- (void)setTotalNumberOfSamples:(unint64_t)a3;
- (void)setTrainingTask:(id)a3;
- (void)setTransformersForFeatureExtractors:(id)a3;
@end

@implementation PHAPrivateFederatedLearningRecipeOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeLabelName, 0);
  objc_storeStrong((id *)&self->_biomeInputName, 0);
  objc_storeStrong((id *)&self->_evaluationMetricNames, 0);
  objc_storeStrong((id *)&self->_learningFramework, 0);
  objc_storeStrong((id *)&self->_datasetSource, 0);
  objc_storeStrong((id *)&self->_filtersByDatasetName, 0);
  objc_storeStrong((id *)&self->_augmenters, 0);
  objc_storeStrong((id *)&self->_transformersForFeatureExtractors, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_negativesDatasetType, 0);
  objc_storeStrong((id *)&self->_negativesSubsetName, 0);
  objc_storeStrong((id *)&self->_negativesDatasetName, 0);
  objc_storeStrong((id *)&self->_positivesDatasetType, 0);
  objc_storeStrong((id *)&self->_positivesSubsetName, 0);
  objc_storeStrong((id *)&self->_positivesDatasetName, 0);
  objc_storeStrong((id *)&self->_labelPolicyString, 0);
  objc_storeStrong((id *)&self->_datasetPolicyString, 0);
  objc_storeStrong((id *)&self->_fingerprintVersionName, 0);
  objc_storeStrong((id *)&self->_trainingTask, 0);
  objc_storeStrong((id *)&self->_optimizerName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_modelOutputName, 0);
  objc_storeStrong((id *)&self->_modelInputName, 0);
  objc_storeStrong((id *)&self->_layersToTrain, 0);

  objc_storeStrong((id *)&self->_attachmentURLs, 0);
}

- (void)setBiomeLabelName:(id)a3
{
}

- (NSString)biomeLabelName
{
  return self->_biomeLabelName;
}

- (void)setBiomeInputName:(id)a3
{
}

- (NSString)biomeInputName
{
  return self->_biomeInputName;
}

- (void)setLabelSize:(unint64_t)a3
{
  self->_labelSize = a3;
}

- (unint64_t)labelSize
{
  return self->_labelSize;
}

- (void)setFeatureSize:(unint64_t)a3
{
  self->_featureSize = a3;
}

- (unint64_t)featureSize
{
  return self->_featureSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setEvaluationMetricNames:(id)a3
{
}

- (NSArray)evaluationMetricNames
{
  return self->_evaluationMetricNames;
}

- (void)setLearningFramework:(id)a3
{
}

- (NSString)learningFramework
{
  return self->_learningFramework;
}

- (void)setNumberOfClasses:(unint64_t)a3
{
  self->_numberOfClasses = a3;
}

- (unint64_t)numberOfClasses
{
  return self->_numberOfClasses;
}

- (void)setDatasetSource:(id)a3
{
}

- (NSString)datasetSource
{
  return self->_datasetSource;
}

- (void)setFiltersByDatasetName:(id)a3
{
}

- (NSDictionary)filtersByDatasetName
{
  return self->_filtersByDatasetName;
}

- (void)setAugmenters:(id)a3
{
}

- (NSArray)augmenters
{
  return self->_augmenters;
}

- (void)setTransformersForFeatureExtractors:(id)a3
{
}

- (PGFeatureTransformersForFeatureExtractors)transformersForFeatureExtractors
{
  return self->_transformersForFeatureExtractors;
}

- (void)setMinProcessedRate:(double)a3
{
  self->_minProcessedRate = a3;
}

- (double)minProcessedRate
{
  return self->_minProcessedRate;
}

- (void)setShouldValidateModel:(BOOL)a3
{
  self->_shouldValidateModel = a3;
}

- (BOOL)shouldValidateModel
{
  return self->_shouldValidateModel;
}

- (void)setGraphManager:(id)a3
{
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setOversamplingRate:(unint64_t)a3
{
  self->_oversamplingRate = a3;
}

- (unint64_t)oversamplingRate
{
  return self->_oversamplingRate;
}

- (void)setTotalNumberOfSamples:(unint64_t)a3
{
  self->_totalNumberOfSamples = a3;
}

- (unint64_t)totalNumberOfSamples
{
  return self->_totalNumberOfSamples;
}

- (void)setNegativesDatasetType:(id)a3
{
}

- (NSNumber)negativesDatasetType
{
  return self->_negativesDatasetType;
}

- (void)setNegativesSubsetName:(id)a3
{
}

- (NSString)negativesSubsetName
{
  return self->_negativesSubsetName;
}

- (void)setNegativesDatasetName:(id)a3
{
}

- (NSString)negativesDatasetName
{
  return self->_negativesDatasetName;
}

- (void)setPositivesDatasetType:(id)a3
{
}

- (NSNumber)positivesDatasetType
{
  return self->_positivesDatasetType;
}

- (void)setPositivesSubsetName:(id)a3
{
}

- (NSString)positivesSubsetName
{
  return self->_positivesSubsetName;
}

- (void)setPositivesDatasetName:(id)a3
{
}

- (NSString)positivesDatasetName
{
  return self->_positivesDatasetName;
}

- (void)setLabelPolicy:(int64_t)a3
{
  self->_labelPolicy = a3;
}

- (int64_t)labelPolicy
{
  return self->_labelPolicy;
}

- (void)setLabelPolicyString:(id)a3
{
}

- (NSString)labelPolicyString
{
  return self->_labelPolicyString;
}

- (void)setDatasetPolicy:(int64_t)a3
{
  self->_datasetPolicy = a3;
}

- (int64_t)datasetPolicy
{
  return self->_datasetPolicy;
}

- (void)setDatasetPolicyString:(id)a3
{
}

- (NSString)datasetPolicyString
{
  return self->_datasetPolicyString;
}

- (void)setFingerprintVersion:(int64_t)a3
{
  self->_fingerprintVersion = a3;
}

- (int64_t)fingerprintVersion
{
  return self->_fingerprintVersion;
}

- (void)setFingerprintVersionName:(id)a3
{
}

- (NSString)fingerprintVersionName
{
  return self->_fingerprintVersionName;
}

- (void)setTrainingTask:(id)a3
{
}

- (NSString)trainingTask
{
  return self->_trainingTask;
}

- (void)setOptimizerName:(id)a3
{
}

- (NSString)optimizerName
{
  return self->_optimizerName;
}

- (void)setLossName:(id)a3
{
}

- (NSString)lossName
{
  return self->_lossName;
}

- (void)setLabelName:(id)a3
{
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setModelOutputName:(id)a3
{
}

- (NSString)modelOutputName
{
  return self->_modelOutputName;
}

- (void)setModelInputName:(id)a3
{
}

- (NSString)modelInputName
{
  return self->_modelInputName;
}

- (void)setLearningRate:(double)a3
{
  self->_learningRate = a3;
}

- (double)learningRate
{
  return self->_learningRate;
}

- (void)setLayersToTrain:(id)a3
{
}

- (NSArray)layersToTrain
{
  return self->_layersToTrain;
}

- (void)setNumberOfEpochs:(unint64_t)a3
{
  self->_numberOfEpochs = a3;
}

- (unint64_t)numberOfEpochs
{
  return self->_numberOfEpochs;
}

- (void)setAttachmentURLs:(id)a3
{
}

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (PHAPrivateFederatedLearningRecipeOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHAPrivateFederatedLearningRecipeOptions;
  v2 = [(PHAPrivateFederatedLearningRecipeOptions *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v2 setAttachmentURLs:MEMORY[0x1E4F1CBF0]];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setNumberOfEpochs:PHAPrivateFederatedLearningRecipeOptionsDefaultNumberOfEpochs];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLayersToTrain:v5];

    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLearningRate:(double)(unint64_t)PHAPrivateFederatedLearningRecipeOptionsDefaultNumberOfEpochs];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setModelInputName:PHAPrivateFederatedLearningRecipeOptionsDefaultModelInputName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setModelOutputName:PHAPrivateFederatedLearningRecipeOptionsDefaultModelOutputName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLabelName:PHAPrivateFederatedLearningDefaultModelLabelName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLossName:PHAPrivateFederatedLearningRecipeOptionsDefaultLossName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setOptimizerName:PHAPrivateFederatedLearningRecipeOptionsDefaultOptimizerName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setTrainingTask:PHAPrivateFederatedLearningRecipeOptionsDefaultTrainingTask];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setFingerprintVersionName:PHAPrivateFederatedLearningRecipeOptionsDefaultFingerprintVersionName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setDatasetPolicyString:@"balanced"];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLabelPolicyString:@"indexed"];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setPositivesDatasetName:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setPositivesSubsetName:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setPositivesDatasetType:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setNegativesDatasetName:PHAPrivateFederatedLearningRecipeOptionsLearningDefaultNegativesDatasetName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setNegativesSubsetName:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setNegativesDatasetType:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setTotalNumberOfSamples:PHAPrivateFederatedLearningRecipeOptionsDefaultTotalNumberOfSamples];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setOversamplingRate:PHAPrivateFederatedLearningRecipeOptionsDefaultOversamplingRate];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setPhotoLibrary:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setGraphManager:0];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setShouldValidateModel:1];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setMinProcessedRate:*(double *)&PHAPrivateFederatedLearningRecipeOptionsDefaultMinProcessRate];
    id v6 = objc_alloc_init(MEMORY[0x1E4F8D620]);
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setTransformersForFeatureExtractors:v6];

    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setAugmenters:v4];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setFiltersByDatasetName:MEMORY[0x1E4F1CC08]];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setDatasetSource:PHAPrivateFederatedLearningRecipeOptionsDefaultDatasetSource];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setNumberOfClasses:2];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLearningFramework:PHAPrivateFederatedLearningRecipeOptionsLearningDefaultFramework];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setEvaluationMetricNames:v4];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setBatchSize:PHAPrivateFederatedLearningDefaultBatchSize];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setFeatureSize:PHAPrivateFederatedLearningDefaultFeatureSize];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setLabelSize:PHAPrivateFederatedLearningDefaultLabelSize];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setBiomeInputName:PHAPrivateFederatedLearningDefaultBiomeInputName];
    [(PHAPrivateFederatedLearningRecipeOptions *)v3 setBiomeLabelName:PHAPrivateFederatedLearningDefaultBiomeLabelName];
  }
  return v3;
}

+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v13 = v9;
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v13) {
      [v12 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRecipeOptions" code:a4 userInfo:v12];

    id v9 = v13;
  }
}

+ (id)validateRecipeOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F8D638];
  objc_super v8 = [v6 fingerprintVersionName];
  objc_msgSend(v6, "setFingerprintVersion:", objc_msgSend(v7, "fingerprintVersionForName:", v8));

  if (![v6 fingerprintVersion])
  {
    v16 = NSString;
    v17 = [v6 fingerprintVersionName];
    v18 = [v16 stringWithFormat:@"Unknown fingerprint version name(%@)", v17];
    id v19 = a1;
    v20 = a4;
    uint64_t v21 = 1;
LABEL_12:
    [v19 _generateError:v20 errorCode:v21 message:v18 underlyingError:0];

LABEL_13:
    id v24 = 0;
    goto LABEL_14;
  }
  id v9 = [v6 datasetPolicyString];
  objc_msgSend(v6, "setDatasetPolicy:", +[PHAPrivateFederatedLearningRecipeOptions datasetPolicyForPolicyName:](PHAPrivateFederatedLearningRecipeOptions, "datasetPolicyForPolicyName:", v9));

  if ([v6 datasetPolicy] == -1)
  {
    v22 = NSString;
    v17 = [v6 datasetPolicyString];
    v18 = [v22 stringWithFormat:@"Unknown dataset policy(%@)", v17];
    id v19 = a1;
    v20 = a4;
    uint64_t v21 = 2;
    goto LABEL_12;
  }
  v10 = [v6 labelPolicyString];
  objc_msgSend(v6, "setLabelPolicy:", +[PHAPrivateFederatedLearningRecipeOptions labelPolicyForLabelPolicyName:](PHAPrivateFederatedLearningRecipeOptions, "labelPolicyForLabelPolicyName:", v10));

  if ([v6 labelPolicy] == -1)
  {
    v23 = NSString;
    v17 = [v6 labelPolicyString];
    v18 = [v23 stringWithFormat:@"Unknown label policy(%@)", v17];
    id v19 = a1;
    v20 = a4;
    uint64_t v21 = 3;
    goto LABEL_12;
  }
  id v11 = [v6 positivesDatasetName];

  if (!v11)
  {
    v28 = @"Positives dataset name is nil";
    id v29 = a1;
    v30 = a4;
    uint64_t v31 = 4;
LABEL_26:
    [v29 _generateError:v30 errorCode:v31 message:v28 underlyingError:0];
    goto LABEL_13;
  }
  if (([v6 totalNumberOfSamples] & 1) != 0
    && (![v6 datasetPolicy] || objc_msgSend(v6, "datasetPolicy") == 1))
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Value for totalNumberOfSamples (%lu) can't be odd when generator policy is 'balanced'", objc_msgSend(v6, "totalNumberOfSamples"));
    id v13 = a1;
    v14 = a4;
    uint64_t v15 = 5;
LABEL_23:
    [v13 _generateError:v14 errorCode:v15 message:v12 underlyingError:0];

    goto LABEL_13;
  }
  if (![v6 oversamplingRate])
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Value for oversamplingRate (%lu) can't be <= 0", objc_msgSend(v6, "oversamplingRate"));
    id v13 = a1;
    v14 = a4;
    uint64_t v15 = 6;
    goto LABEL_23;
  }
  v26 = [v6 photoLibrary];

  if (!v26)
  {
    v28 = @"Photo library is nil";
    id v29 = a1;
    v30 = a4;
    uint64_t v31 = 7;
    goto LABEL_26;
  }
  v27 = [v6 graphManager];

  if (!v27)
  {
    v28 = @"Graph manager is nil";
    id v29 = a1;
    v30 = a4;
    uint64_t v31 = 8;
    goto LABEL_26;
  }
  id v24 = v6;
LABEL_14:

  return v24;
}

+ (int64_t)labelPolicyForLabelPolicyName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"indexed"])
    {
      int64_t v5 = 0;
    }
    else if ([v4 isEqualToString:@"one-hot"])
    {
      int64_t v5 = 1;
    }
    else
    {
      int64_t v5 = -1;
    }
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

+ (int64_t)datasetPolicyForPolicyName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"balanced"])
    {
      int64_t v5 = 0;
    }
    else if ([v4 isEqualToString:@"balanced-strict"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"unbalanced"])
    {
      int64_t v5 = 2;
    }
    else
    {
      int64_t v5 = -1;
    }
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

@end