@interface PHAPrivateFederatedLearningRecipeDecoder
+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6;
+ (id)decodeRecipeUserInfo:(id)a3 attachmentURLs:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 decodingError:(id *)a7;
+ (id)decodingErrorWithMessage:(id)a3;
+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6;
+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 defaultValue:(id)a6 error:(id *)a7;
+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6;
@end

@implementation PHAPrivateFederatedLearningRecipeDecoder

+ (id)decodingErrorWithMessage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"No error message";
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);

  v8 = (void *)[v7 initWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRecipeDecoder" code:10001 userInfo:v6];

  return v8;
}

+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (objc_opt_isKindOfClass())
  {
    a6 = (id *)v10;
  }
  else if (a6)
  {
    v12 = [NSString stringWithFormat:@"Object with name (%@) has class (%@), expected (%@)", v11, objc_opt_class(), a5];
    *a6 = [a1 decodingErrorWithMessage:v12];

    a6 = 0;
  }

  return a6;
}

+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [a5 objectForKeyedSubscript:v10];
  if (v11)
  {
    a6 = [a1 castObject:v11 withName:v10 toClass:a3 error:a6];
  }
  else if (a6)
  {
    v12 = [NSString stringWithFormat:@"No value for key: (%@)", v10];
    *a6 = [a1 decodingErrorWithMessage:v12];

    a6 = 0;
  }

  return a6;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [a5 objectForKeyedSubscript:v10];
  if (v11)
  {
    v12 = [a1 castObject:v11 withName:v10 toClass:a3 error:a6];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 defaultValue:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [a5 objectForKeyedSubscript:v12];
  id v15 = (id)v14;
  if (v13 && !v14)
  {
    id v15 = v13;
LABEL_5:
    v16 = [a1 castObject:v15 withName:v12 toClass:a3 error:a7];

    goto LABEL_7;
  }
  if (v14) {
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:

  return v16;
}

+ (id)decodeRecipeUserInfo:(id)a3 attachmentURLs:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 decodingError:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a4;
  v16 = objc_alloc_init(PHAPrivateFederatedLearningRecipeOptions);
  [(PHAPrivateFederatedLearningRecipeOptions *)v16 setAttachmentURLs:v15];

  objc_opt_class();
  v17 = [a1 objectOfClass:objc_opt_class() forKey:@"layersToTrain" inDictionary:v12 error:a7];
  [(PHAPrivateFederatedLearningRecipeOptions *)v16 setLayersToTrain:v17];

  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions numberOfEpochs](v16, "numberOfEpochs"));
  v20 = [a1 optionalObjectOfClass:v18 forKey:@"numberOfEpochs" inDictionary:v12 defaultValue:v19 error:a7];
  -[PHAPrivateFederatedLearningRecipeOptions setNumberOfEpochs:](v16, "setNumberOfEpochs:", [v20 unsignedIntegerValue]);

  uint64_t v21 = objc_opt_class();
  v22 = NSNumber;
  [(PHAPrivateFederatedLearningRecipeOptions *)v16 learningRate];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  v24 = [a1 optionalObjectOfClass:v21 forKey:@"learningRate" inDictionary:v12 defaultValue:v23 error:a7];
  [v24 doubleValue];
  -[PHAPrivateFederatedLearningRecipeOptions setLearningRate:](v16, "setLearningRate:");

  v25 = [a1 objectOfClass:objc_opt_class() forKey:@"modelInputName" inDictionary:v12 error:a7];
  [(PHAPrivateFederatedLearningRecipeOptions *)v16 setModelInputName:v25];

  v26 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 modelInputName];

  if (v26
    && ([a1 objectOfClass:objc_opt_class() forKey:@"modelOutputName" inDictionary:v12 error:a7], v27 = objc_claimAutoreleasedReturnValue(), -[PHAPrivateFederatedLearningRecipeOptions setModelOutputName:](v16, "setModelOutputName:", v27), v27, -[PHAPrivateFederatedLearningRecipeOptions modelOutputName](v16, "modelOutputName"), v28 = objc_claimAutoreleasedReturnValue(), v28, v28))
  {
    uint64_t v29 = objc_opt_class();
    v30 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 lossName];
    v31 = [a1 optionalObjectOfClass:v29 forKey:@"lossName" inDictionary:v12 defaultValue:v30 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setLossName:v31];

    uint64_t v32 = objc_opt_class();
    v33 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 optimizerName];
    v34 = [a1 optionalObjectOfClass:v32 forKey:@"optimizerName" inDictionary:v12 defaultValue:v33 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setOptimizerName:v34];

    uint64_t v35 = objc_opt_class();
    v36 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 trainingTask];
    v37 = [a1 optionalObjectOfClass:v35 forKey:@"trainingTask" inDictionary:v12 defaultValue:v36 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setTrainingTask:v37];

    uint64_t v38 = objc_opt_class();
    v39 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 fingerprintVersionName];
    v40 = [a1 optionalObjectOfClass:v38 forKey:@"fingerprintVersion" inDictionary:v12 defaultValue:v39 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setFingerprintVersionName:v40];

    uint64_t v41 = objc_opt_class();
    v42 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 datasetPolicyString];
    v43 = [a1 optionalObjectOfClass:v41 forKey:@"datasetPolicy" inDictionary:v12 defaultValue:v42 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setDatasetPolicyString:v43];

    uint64_t v44 = objc_opt_class();
    v45 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 labelPolicyString];
    v46 = [a1 optionalObjectOfClass:v44 forKey:@"labelPolicy" inDictionary:v12 defaultValue:v45 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setLabelPolicyString:v46];

    uint64_t v47 = objc_opt_class();
    v48 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 positivesDatasetName];
    v49 = [a1 optionalObjectOfClass:v47 forKey:@"positivesDatasetName" inDictionary:v12 defaultValue:v48 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setPositivesDatasetName:v49];

    uint64_t v50 = objc_opt_class();
    v51 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 positivesSubsetName];
    v52 = [a1 optionalObjectOfClass:v50 forKey:@"positivesSubsetName" inDictionary:v12 defaultValue:v51 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setPositivesSubsetName:v52];

    uint64_t v53 = objc_opt_class();
    v54 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 negativesDatasetName];
    v55 = [a1 optionalObjectOfClass:v53 forKey:@"negativesDatasetName" inDictionary:v12 defaultValue:v54 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setNegativesDatasetName:v55];

    uint64_t v56 = objc_opt_class();
    v57 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 negativesSubsetName];
    v58 = [a1 optionalObjectOfClass:v56 forKey:@"negativesSubsetName" inDictionary:v12 defaultValue:v57 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setNegativesSubsetName:v58];

    uint64_t v59 = objc_opt_class();
    v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions totalNumberOfSamples](v16, "totalNumberOfSamples"));
    v61 = [a1 optionalObjectOfClass:v59 forKey:@"totalNumberOfSamples" inDictionary:v12 defaultValue:v60 error:a7];
    -[PHAPrivateFederatedLearningRecipeOptions setTotalNumberOfSamples:](v16, "setTotalNumberOfSamples:", [v61 unsignedIntegerValue]);

    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions oversamplingRate](v16, "oversamplingRate"));
    v64 = [a1 optionalObjectOfClass:v62 forKey:@"oversamplingRate" inDictionary:v12 defaultValue:v63 error:a7];
    -[PHAPrivateFederatedLearningRecipeOptions setOversamplingRate:](v16, "setOversamplingRate:", [v64 unsignedIntegerValue]);

    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setPhotoLibrary:v13];
    id v117 = v14;
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setGraphManager:v14];
    v65 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"transformations" inDictionary:v12 error:a7];
    if (!v65) {
      goto LABEL_5;
    }
    v66 = objc_alloc_init(PHAPrivateFederatedLearningTransformersDecoder);
    v67 = [(PHAPrivateFederatedLearningTransformersDecoder *)v66 transformersForFeatureExtractorsFromDictionary:v65 error:a7];
    [(PHAPrivateFederatedLearningRecipeOptions *)v16 setTransformersForFeatureExtractors:v67];

    v68 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 transformersForFeatureExtractors];

    if (!v68)
    {
      v114 = 0;
      id v14 = v117;
    }
    else
    {
LABEL_5:
      id v116 = v13;
      v69 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"augmentations" inDictionary:v12 error:a7];
      if (!v69) {
        goto LABEL_7;
      }
      v70 = objc_alloc_init(PHAPrivateFederatedLearningAugmentersDecoder);
      v71 = [(PHAPrivateFederatedLearningAugmentersDecoder *)v70 augmentersFromArray:v69 error:a7];
      [(PHAPrivateFederatedLearningRecipeOptions *)v16 setAugmenters:v71];

      v72 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 augmenters];

      if (!v72)
      {
        v114 = 0;
        id v13 = v116;
        id v14 = v117;
      }
      else
      {
LABEL_7:
        v73 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"filters" inDictionary:v12 error:a7];
        if (!v73) {
          goto LABEL_9;
        }
        v74 = [PHAPrivateFederatedLearningFiltersDecoder alloc];
        v75 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 fingerprintVersionName];
        v76 = [(PHAPrivateFederatedLearningFiltersDecoder *)v74 initWithFingeprintVersionString:v75];

        v77 = [(PHAPrivateFederatedLearningFiltersDecoder *)v76 filtersByDatasetNameFromDictionary:v73 error:a7];
        [(PHAPrivateFederatedLearningRecipeOptions *)v16 setFiltersByDatasetName:v77];

        v78 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 filtersByDatasetName];

        if (!v78)
        {
          v114 = 0;
          id v13 = v116;
          id v14 = v117;
        }
        else
        {
LABEL_9:
          uint64_t v79 = objc_opt_class();
          v80 = objc_msgSend(NSNumber, "numberWithBool:", -[PHAPrivateFederatedLearningRecipeOptions shouldValidateModel](v16, "shouldValidateModel"));
          v81 = [a1 optionalObjectOfClass:v79 forKey:@"validateModel" inDictionary:v12 defaultValue:v80 error:a7];
          -[PHAPrivateFederatedLearningRecipeOptions setShouldValidateModel:](v16, "setShouldValidateModel:", [v81 BOOLValue]);

          uint64_t v82 = objc_opt_class();
          v83 = NSNumber;
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 minProcessedRate];
          v84 = objc_msgSend(v83, "numberWithDouble:");
          v85 = [a1 optionalObjectOfClass:v82 forKey:@"minProcessedRate" inDictionary:v12 defaultValue:v84 error:a7];
          [v85 doubleValue];
          -[PHAPrivateFederatedLearningRecipeOptions setMinProcessedRate:](v16, "setMinProcessedRate:");

          uint64_t v86 = objc_opt_class();
          v87 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 datasetSource];
          v88 = [a1 optionalObjectOfClass:v86 forKey:@"datasetSource" inDictionary:v12 defaultValue:v87 error:a7];
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 setDatasetSource:v88];

          uint64_t v89 = objc_opt_class();
          v90 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions numberOfClasses](v16, "numberOfClasses"));
          v91 = [a1 optionalObjectOfClass:v89 forKey:@"numberOfClasses" inDictionary:v12 defaultValue:v90 error:a7];
          -[PHAPrivateFederatedLearningRecipeOptions setNumberOfClasses:](v16, "setNumberOfClasses:", [v91 unsignedIntegerValue]);

          uint64_t v92 = objc_opt_class();
          v93 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 learningFramework];
          v94 = [a1 optionalObjectOfClass:v92 forKey:@"learningFramework" inDictionary:v12 defaultValue:v93 error:a7];
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 setLearningFramework:v94];

          uint64_t v95 = objc_opt_class();
          v96 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 evaluationMetricNames];
          v97 = [a1 optionalObjectOfClass:v95 forKey:@"evaluationMetricNames" inDictionary:v12 defaultValue:v96 error:a7];
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 setEvaluationMetricNames:v97];

          uint64_t v98 = objc_opt_class();
          v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions batchSize](v16, "batchSize"));
          v100 = [a1 optionalObjectOfClass:v98 forKey:@"batchSize" inDictionary:v12 defaultValue:v99 error:a7];
          -[PHAPrivateFederatedLearningRecipeOptions setBatchSize:](v16, "setBatchSize:", [v100 unsignedIntegerValue]);

          uint64_t v101 = objc_opt_class();
          v102 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions featureSize](v16, "featureSize"));
          v103 = [a1 optionalObjectOfClass:v101 forKey:@"featureSize" inDictionary:v12 defaultValue:v102 error:a7];
          -[PHAPrivateFederatedLearningRecipeOptions setFeatureSize:](v16, "setFeatureSize:", [v103 unsignedIntegerValue]);

          uint64_t v104 = objc_opt_class();
          v105 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHAPrivateFederatedLearningRecipeOptions labelSize](v16, "labelSize"));
          v106 = [a1 optionalObjectOfClass:v104 forKey:@"labelSize" inDictionary:v12 defaultValue:v105 error:a7];
          -[PHAPrivateFederatedLearningRecipeOptions setLabelSize:](v16, "setLabelSize:", [v106 unsignedIntegerValue]);

          uint64_t v107 = objc_opt_class();
          v108 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 biomeInputName];
          v109 = [a1 optionalObjectOfClass:v107 forKey:@"biomeInputName" inDictionary:v12 defaultValue:v108 error:a7];
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 setBiomeInputName:v109];

          uint64_t v110 = objc_opt_class();
          v111 = [(PHAPrivateFederatedLearningRecipeOptions *)v16 biomeLabelName];
          v112 = [a1 optionalObjectOfClass:v110 forKey:@"biomeLabelName" inDictionary:v12 defaultValue:v111 error:a7];
          [(PHAPrivateFederatedLearningRecipeOptions *)v16 setBiomeLabelName:v112];

          v113 = +[PHAPrivateFederatedLearningRecipeOptions validateRecipeOptions:v16 error:a7];
          if (v113) {
            v114 = [[PHAPrivateFederatedLearningRunner alloc] initWithRecipeOptions:v16];
          }
          else {
            v114 = 0;
          }
          id v13 = v116;
          id v14 = v117;
        }
      }
    }
  }
  else
  {
    v114 = 0;
  }

  return v114;
}

@end