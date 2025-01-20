@interface PHAPrivateFederatedLearningRunner
+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 error:(id *)a5;
+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 expectedDirectory:(BOOL)a5 error:(id *)a6;
+ (id)_generateEncryptionKeyFromICloudAggServiceKey:(id)a3 error:(id *)a4;
+ (id)_mediaAnalysisImageProgressForPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)_prepareDatasetWithOptions:(id)a3 error:(id *)a4;
+ (id)datasetBuilderForOptions:(id)a3 error:(id *)a4;
+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (BOOL)_isValidInputDimensionForCoreMLModel:(id)a3 error:(id *)a4;
- (PHAPrivateFederatedLearningRecipeOptions)options;
- (PHAPrivateFederatedLearningRunner)initWithRecipeOptions:(id)a3;
- (id)_prepareTrainingDataForBiomeStream:(id)a3 error:(id *)a4;
- (id)runCoreMLModelWithError:(id *)a3;
- (id)runWithError:(id *)a3;
@end

@implementation PHAPrivateFederatedLearningRunner

- (void).cxx_destruct
{
}

- (PHAPrivateFederatedLearningRecipeOptions)options
{
  return self->_options;
}

- (id)runCoreMLModelWithError:(id *)a3
{
  v5 = [(PHAPrivateFederatedLearningRunner *)self options];
  v6 = [v5 attachmentURLs];
  id v56 = 0;
  v7 = +[PHAPrivateFederatedLearningRunner _firstAttachmentURLWithSuffixOfName:@".mil" attachments:v6 expectedDirectory:0 error:&v56];
  id v8 = v56;

  v9 = [v7 URLByDeletingLastPathComponent];
  if (v9)
  {
    id v55 = 0;
    BOOL v10 = [(PHAPrivateFederatedLearningRunner *)self _isValidInputDimensionForCoreMLModel:v9 error:&v55];
    id v11 = v55;
    id v12 = v11;
    if (v10)
    {
      v50 = a3;
      id v51 = v8;
      id v13 = objc_alloc_init(MEMORY[0x1E4F1E990]);
      [v13 setComputeUnits:0];
      id v54 = 0;
      v14 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v9 configuration:v13 error:&v54];
      id v15 = v54;
      if (v14)
      {
        id v49 = v13;
        id v16 = objc_alloc(MEMORY[0x1E4F1E9E8]);
        v48 = v14;
        v17 = [v14 program];
        v18 = [(PHAPrivateFederatedLearningRunner *)self options];
        [v18 learningRate];
        id v53 = 0;
        uint64_t v19 = objc_msgSend(v16, "initWithProgram:learningRate:error:", v17, &v53);
        id v20 = v53;

        v47 = (void *)v19;
        if (v19)
        {
          id v46 = v20;
          v21 = [(PHAPrivateFederatedLearningRunner *)self options];
          v22 = [v21 positivesDatasetName];
          id v52 = 0;
          v23 = [(PHAPrivateFederatedLearningRunner *)self _prepareTrainingDataForBiomeStream:v22 error:&v52];
          id v24 = v52;

          v25 = [v23 array];
          uint64_t v26 = [v25 count];

          id v45 = v24;
          if (v26)
          {
            v27 = (void *)MEMORY[0x1E4F1CAD0];
            v28 = [(PHAPrivateFederatedLearningRunner *)self options];
            v29 = [v28 evaluationMetricNames];
            uint64_t v30 = [v27 setWithArray:v29];

            v31 = v47;
            v44 = (void *)v30;
            v32 = [[PHAPrivateFederatedLearningCoreMLModelTrainer alloc] initWithTrainingData:v23 programTrainer:v47 evaluationMetricNames:v30];
            v33 = [(PHAPrivateFederatedLearningRunner *)self options];
            v34 = -[PHAPrivateFederatedLearningCoreMLModelTrainer trainForNumberOfEpochs:error:](v32, "trainForNumberOfEpochs:error:", [v33 numberOfEpochs], v50);
          }
          else
          {
            v42 = NSString;
            v44 = [(PHAPrivateFederatedLearningRunner *)self options];
            v32 = [v44 positivesDatasetName];
            v33 = [v42 stringWithFormat:@"Prepare dataset from Biome stream %@ failed", v32];
            +[PHAPrivateFederatedLearningRunner _generateError:v50 errorCode:17 message:v33 underlyingError:v24];
            v34 = 0;
            v31 = v47;
          }

          v37 = v48;
          v39 = v45;
          id v20 = v46;
          v41 = v44;
        }
        else
        {
          v38 = NSString;
          v39 = [(PHAPrivateFederatedLearningRunner *)self options];
          v23 = [v39 trainingTask];
          uint64_t v40 = [v38 stringWithFormat:@"Model trainer returned nil for data provider of training task %@ and model file url %@", v23, v9];
          +[PHAPrivateFederatedLearningRunner _generateError:v50 errorCode:7 message:v40 underlyingError:v20];
          v41 = (void *)v40;
          v34 = 0;
          v31 = 0;
          v37 = v48;
        }

        id v13 = v49;
      }
      else
      {
        v35 = NSString;
        id v20 = [v9 absoluteString];
        v36 = v35;
        v37 = 0;
        v31 = [v36 stringWithFormat:@"Error while constructing the model at URL %@", v20];
        +[PHAPrivateFederatedLearningRunner _generateError:v50 errorCode:15 message:v31 underlyingError:v15];
        v34 = 0;
      }

      id v8 = v51;
    }
    else
    {
      id v12 = v11;
      v34 = 0;
      *a3 = v12;
    }
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"Invalid modelURL"];
    +[PHAPrivateFederatedLearningRunner _generateError:a3 errorCode:14 message:v12 underlyingError:v8];
    v34 = 0;
  }

  return v34;
}

- (id)runWithError:(id *)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v5 = [(PHAPrivateFederatedLearningRunner *)self options];
  v6 = [v5 photoLibrary];
  id v96 = 0;
  v7 = +[PHAPrivateFederatedLearningRunner _mediaAnalysisImageProgressForPhotoLibrary:v6 error:&v96];
  id v8 = v96;

  if (!v7)
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_10414);
    }
    uint64_t v19 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v98 = v8;
      _os_log_error_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_ERROR, "Media analysis progress query returned an error: %@.", buf, 0xCu);
    }
LABEL_8:
    id v20 = [(PHAPrivateFederatedLearningRunner *)self options];
    v21 = [v20 attachmentURLs];
    id v15 = +[PHAPrivateFederatedLearningRunner _firstAttachmentURLWithSuffixOfName:@".mlmodel" attachments:v21 error:a3];

    if (!v15)
    {
      v18 = 0;
      goto LABEL_31;
    }
    id v95 = 0;
    v22 = [MEMORY[0x1E4F1E968] compileModelAtURL:v15 error:&v95];
    id v17 = v95;
    if (!v22)
    {
      v61 = NSString;
      id v24 = [0 absoluteString];
      v62 = [v61 stringWithFormat:@"Error while compiling the model at URL %@", v24];
      +[PHAPrivateFederatedLearningRunner _generateError:a3 errorCode:8 message:v62 underlyingError:v17];
      v18 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v23 = [@"model.espresso" stringByAppendingPathExtension:@"net"];
    id v24 = [v22 URLByAppendingPathComponent:v23];

    uint64_t v92 = [v22 URLByAppendingPathComponent:@"model.espresso.shape"];
    v25 = [(PHAPrivateFederatedLearningRunner *)self options];
    int v26 = [v25 shouldValidateModel];

    if (v26)
    {
      v71 = v7;
      v79 = v22;
      id v81 = v17;
      id v83 = v8;
      v85 = a3;
      v87 = v24;
      v77 = [[PHAPrivateFederatedLearningModelValidator alloc] initWithEspressoModelURL:v24 espressoModelShapeURL:v92];
      v75 = [(PHAPrivateFederatedLearningRunner *)self options];
      v27 = [v75 fingerprintVersionName];
      v73 = [(PHAPrivateFederatedLearningRunner *)self options];
      v28 = [v73 modelInputName];
      v69 = [(PHAPrivateFederatedLearningRunner *)self options];
      v29 = [v69 modelOutputName];
      v67 = [(PHAPrivateFederatedLearningRunner *)self options];
      uint64_t v30 = [v67 labelPolicyString];
      v31 = [(PHAPrivateFederatedLearningRunner *)self options];
      v32 = [v31 lossName];
      v33 = [(PHAPrivateFederatedLearningRunner *)self options];
      v34 = [v33 layersToTrain];
      id v94 = 0;
      BOOL v65 = [(PHAPrivateFederatedLearningModelValidator *)v77 isValidWithFingerprintVersionName:v27 modelInputName:v28 modelOutputName:v29 labelName:@"label" labelPolicyName:v30 lossName:v32 layersToTrain:v34 error:&v94];
      id v90 = v94;

      if (!v65)
      {
        v36 = v90;
        +[PHAPrivateFederatedLearningRunner _generateError:v85 errorCode:9 message:@"Error validating model" underlyingError:v90];

        v18 = 0;
        id v17 = v81;
        id v8 = v83;
        v22 = v79;
        id v24 = v87;
        v62 = (void *)v92;
        v7 = v71;
        goto LABEL_28;
      }

      id v17 = v81;
      id v8 = v83;
      a3 = v85;
      id v24 = v87;
      v22 = v79;
      v7 = v71;
    }
    v35 = [(PHAPrivateFederatedLearningRunner *)self options];
    v36 = +[PHAPrivateFederatedLearningRunner _prepareDatasetWithOptions:v35 error:a3];

    if (v36)
    {
      if ([v36 numberOfDataPoints])
      {
        v80 = v22;
        id v82 = v17;
        id v84 = v8;
        v86 = a3;
        v88 = [PHAPrivateFederatedLearningModelTrainer alloc];
        v91 = v36;
        v37 = NSNumber;
        v76 = [(PHAPrivateFederatedLearningRunner *)self options];
        [v76 learningRate];
        v70 = objc_msgSend(v37, "numberWithDouble:");
        v74 = [(PHAPrivateFederatedLearningRunner *)self options];
        v68 = [v74 modelInputName];
        v72 = [(PHAPrivateFederatedLearningRunner *)self options];
        v38 = [v72 modelOutputName];
        v39 = [(PHAPrivateFederatedLearningRunner *)self options];
        uint64_t v40 = [v39 lossName];
        v41 = [(PHAPrivateFederatedLearningRunner *)self options];
        v42 = [v41 optimizerName];
        id v93 = 0;
        v43 = v88;
        v89 = v24;
        uint64_t v44 = [(PHAPrivateFederatedLearningModelTrainer *)v43 initWithTrainingData:v91 espressoFileURL:v24 learningRate:v70 modelInputName:v68 modelOutputName:v38 lossName:v40 optimizerName:v42 error:&v93];
        id v66 = v93;

        id v45 = (void *)v44;
        v78 = (void *)v44;
        if (v44)
        {
          id v46 = [(PHAPrivateFederatedLearningRunner *)self options];
          uint64_t v47 = [v46 numberOfEpochs];
          v48 = [(PHAPrivateFederatedLearningRunner *)self options];
          id v49 = [v48 layersToTrain];
          v50 = [v45 trainForNumberOfEpochs:v47 layersToTrain:v49 verbose:0 error:v86];

          if (!v50
            || ([v50 parameterDeltas],
                id v51 = objc_claimAutoreleasedReturnValue(),
                v51,
                !v51))
          {
            v18 = 0;
            id v17 = v82;
            id v8 = v84;
            v22 = v80;
            v62 = (void *)v92;
            v60 = v66;
LABEL_27:

            id v24 = v89;
            v36 = v91;
            goto LABEL_28;
          }
          id v52 = objc_alloc_init(PHAPrivateFederatedLearningPackager);
          id v53 = [v50 parameterDeltas];
          id v54 = [(PHAPrivateFederatedLearningPackager *)v52 dataPackageFromTrainingResults:v53 error:v86];

          id v55 = [PHAPrivateFederatedLearningRunnerResponse alloc];
          id v56 = [(PHAPrivateFederatedLearningRunner *)self options];
          v57 = [v56 layersToTrain];
          v58 = [v50 trainingLossesPerEpoch];
          v59 = [v50 trainingAccuraciesPerEpoch];
          v18 = [(PHAPrivateFederatedLearningRunnerResponse *)v55 initWithDataPackage:v54 layersToTrain:v57 trainingLossesPerEpoch:v58 trainingAccuraciesPerEpoch:v59];

          v60 = v66;
        }
        else
        {
          v63 = NSString;
          v50 = [(PHAPrivateFederatedLearningRunner *)self options];
          id v52 = [v50 trainingTask];
          id v54 = [v63 stringWithFormat:@"Model trainer returned nil for data provider of training task %@ and model file url %@", v52, v89];
          v60 = v66;
          +[PHAPrivateFederatedLearningRunner _generateError:v86 errorCode:7 message:v54 underlyingError:v66];
          v18 = 0;
        }

        id v17 = v82;
        id v8 = v84;
        v22 = v80;
        v62 = (void *)v92;
        goto LABEL_27;
      }
      +[PHAPrivateFederatedLearningRunner _generateError:a3 errorCode:10 message:@"Dataset size is 0." underlyingError:0];
    }
    v18 = 0;
    v62 = (void *)v92;
LABEL_28:

    goto LABEL_29;
  }
  [v7 floatValue];
  double v10 = v9;
  id v11 = [(PHAPrivateFederatedLearningRunner *)self options];
  [v11 minProcessedRate];
  double v13 = v12;

  if (v13 <= v10) {
    goto LABEL_8;
  }
  v14 = NSString;
  id v15 = [(PHAPrivateFederatedLearningRunner *)self options];
  [v15 minProcessedRate];
  id v17 = [v14 stringWithFormat:@"Photo Library does not have enough processed assets (%@ < %f).", v7, v16];
  +[PHAPrivateFederatedLearningRunner _generateError:a3 errorCode:11 message:v17 underlyingError:0];
  v18 = 0;
LABEL_30:

LABEL_31:

  return v18;
}

uint64_t __50__PHAPrivateFederatedLearningRunner_runWithError___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (PHAPrivateFederatedLearningRunner)initWithRecipeOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAPrivateFederatedLearningRunner;
  v6 = [(PHAPrivateFederatedLearningRunner *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

+ (id)_generateEncryptionKeyFromICloudAggServiceKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:1];
    if (v7) {
      goto LABEL_6;
    }
    id v8 = @"Corrupt Haruspex encryption key detected";
  }
  else
  {
    id v8 = @"Haruspex encryption key missing.";
  }
  [a1 _generateError:a4 errorCode:1 message:v8 underlyingError:0];
  v7 = 0;
LABEL_6:

  return v7;
}

+ (void)_generateError:(id *)a3 errorCode:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    double v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v13 = v9;
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v13) {
      [v12 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotoAnalysis.PHAPrivateFederatedLearningRunner" code:a4 userInfo:v12];

    id v9 = v13;
  }
}

- (BOOL)_isValidInputDimensionForCoreMLModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v29 = 0;
  v7 = [MEMORY[0x1E4F1E978] modelAssetWithURL:v6 error:&v29];
  id v8 = v29;
  id v9 = v8;
  if (v7)
  {
    uint64_t v25 = 0;
    int v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__10466;
    v23 = __Block_byref_object_dispose__10467;
    id v24 = 0;
    double v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__PHAPrivateFederatedLearningRunner_Testing___isValidInputDimensionForCoreMLModel_error___block_invoke;
    v14[3] = &unk_1E6919020;
    id v17 = &v25;
    v18 = &v19;
    id v11 = v10;
    id v15 = v11;
    uint64_t v16 = self;
    [v7 modelDescriptionWithCompletionHandler:v14];
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    *a4 = (id) v20[5];
    BOOL v12 = *((unsigned char *)v26 + 24) == 0;

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v12 = 0;
    *a4 = v8;
  }

  return v12;
}

void __89__PHAPrivateFederatedLearningRunner_Testing___isValidInputDimensionForCoreMLModel_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    v7 = [a2 inputDescriptionsByName];
    id v8 = [*(id *)(a1 + 40) options];
    id v9 = [v8 modelInputName];
    double v10 = [v7 objectForKeyedSubscript:v9];

    id v11 = [v10 multiArrayConstraint];
    BOOL v12 = [v11 shape];
    id v13 = [v12 objectAtIndexedSubscript:1];
    uint64_t v14 = [v13 unsignedLongValue];

    id v15 = [*(id *)(a1 + 40) options];
    uint64_t v16 = [v15 featureSize];

    if (v14 != v16)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v17 + 40);
      v18 = NSString;
      uint64_t v19 = [*(id *)(a1 + 40) options];
      id v20 = [v18 stringWithFormat:@"Wrong Input Dimension for CoreML Model. Expected model input size: %ld, got: %ld", v14, objc_msgSend(v19, "featureSize")];
      +[PHAPrivateFederatedLearningRunner _generateError:&obj errorCode:16 message:v20 underlyingError:0];
      objc_storeStrong((id *)(v17 + 40), obj);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (id)_prepareTrainingDataForBiomeStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PHAPrivateFederatedLearningRunner *)self options];
  id v8 = +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:v7 error:a4];

  if (v8)
  {
    id v9 = [v8 trainingDataBatchWithBiomeStream:v6 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_mediaAnalysisImageProgressForPhotoLibrary:(id)a3 error:(id *)a4
{
  [a3 ratioOfAssetsWithMediaAnalysisImageProcessed];
  v4 = NSNumber;

  return (id)objc_msgSend(v4, "numberWithDouble:");
}

+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 expectedDirectory:(BOOL)a5 error:(id *)a6
{
  int v6 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = [v16 lastPathComponent];
        int v18 = [v17 hasSuffix:v8];

        if (v18)
        {
          unsigned __int8 v27 = 0;
          uint64_t v19 = [v16 path];
          int v20 = [v10 fileExistsAtPath:v19 isDirectory:&v27];

          if (v20 && v27 == v6)
          {
            id v23 = v16;
            v22 = v11;
            goto LABEL_15;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v22 = [NSString stringWithFormat:@"missing %@ resource for PFL", v8];
  [a1 _generateError:a6 errorCode:2 message:v22 underlyingError:0];
  id v23 = 0;
LABEL_15:

  return v23;
}

+ (id)_firstAttachmentURLWithSuffixOfName:(id)a3 attachments:(id)a4 error:(id *)a5
{
  return (id)[a1 _firstAttachmentURLWithSuffixOfName:a3 attachments:a4 expectedDirectory:0 error:a5];
}

+ (id)datasetBuilderForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 trainingTask];
  int v8 = [v7 isEqualToString:@"AssetFingerprintTrainingTask"];

  if (v8)
  {
    id v9 = +[PHAPrivateFederatedLearningRecipeOptions validateRecipeOptions:v6 error:a4];
    if (v9)
    {
      double v10 = [[PHADatasetBuilder alloc] initWithDatasetOptions:v6];
      goto LABEL_6;
    }
  }
  else
  {
    id v11 = NSString;
    id v9 = [v6 trainingTask];
    uint64_t v12 = [v11 stringWithFormat:@"Training task %@ is not supported", v9];
    [a1 _generateError:a4 errorCode:4 message:v12 underlyingError:0];
  }
  double v10 = 0;
LABEL_6:

  return v10;
}

+ (id)_prepareDatasetWithOptions:(id)a3 error:(id *)a4
{
  id v5 = +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:error:](PHAPrivateFederatedLearningRunner, "datasetBuilderForOptions:error:", a3);
  id v6 = [v5 datasetWithError:a4];

  return v6;
}

@end