@interface SLUEStatisticsModule
- (MLModel)uesModel;
- (NSDictionary)inputSpecs;
- (NSDictionary)outputSpecs;
- (NSString)assetVersion;
- (NSString)outputNodeName;
- (SLUEStatisticsModule)initWithConfig:(id)a3 error:(id *)a4;
- (id)getEncodedValue:(id)a3;
- (id)processInputFeatures:(id)a3;
- (void)dealloc;
- (void)setAssetVersion:(id)a3;
- (void)setInputSpecs:(id)a3;
- (void)setOutputNodeName:(id)a3;
- (void)setOutputSpecs:(id)a3;
- (void)setUesModel:(id)a3;
@end

@implementation SLUEStatisticsModule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNodeName, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_uesModel, 0);
  objc_storeStrong((id *)&self->_outputSpecs, 0);

  objc_storeStrong((id *)&self->_inputSpecs, 0);
}

- (void)setOutputNodeName:(id)a3
{
}

- (NSString)outputNodeName
{
  return self->_outputNodeName;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setUesModel:(id)a3
{
}

- (MLModel)uesModel
{
  return self->_uesModel;
}

- (void)setOutputSpecs:(id)a3
{
}

- (NSDictionary)outputSpecs
{
  return self->_outputSpecs;
}

- (void)setInputSpecs:(id)a3
{
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (id)processInputFeatures:(id)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [v4 cohortType];
  v7 = [(SLUEStatisticsModule *)self getEncodedValue:v6];

  if (v7)
  {
    v8 = NSNumber;
    v95 = v7;
    [v7 floatValue];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v5 addObject:v9];

    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "requestCount"));
    [v5 addObject:v10];

    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "intendedCount"));
    [v5 addObject:v11];

    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "unintendedCount"));
    [v5 addObject:v12];

    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "buttonPressCount"));
    [v5 addObject:v13];

    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerCount"));
    [v5 addObject:v14];

    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerIntendedCount"));
    [v5 addObject:v15];

    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "voiceTriggerUnintendedCount"));
    [v5 addObject:v16];

    v17 = NSNumber;
    [v4 intendedRatio];
    v18 = objc_msgSend(v17, "numberWithFloat:");
    [v5 addObject:v18];

    v19 = NSNumber;
    [v4 voiceTriggerRequestRatio];
    v20 = objc_msgSend(v19, "numberWithFloat:");
    [v5 addObject:v20];

    v21 = NSNumber;
    [v4 voiceTriggerIntendedRatio];
    v22 = objc_msgSend(v21, "numberWithFloat:");
    [v5 addObject:v22];

    v23 = NSNumber;
    [v4 buttonPressRequestRatio];
    v24 = objc_msgSend(v23, "numberWithFloat:");
    [v5 addObject:v24];

    v25 = NSNumber;
    [v4 buttonPressIntendedRatio];
    v26 = objc_msgSend(v25, "numberWithFloat:");
    [v5 addObject:v26];

    v27 = NSNumber;
    id v97 = v4;
    [v4 sdsdRetryCount];
    v28 = objc_msgSend(v27, "numberWithFloat:");
    [v5 addObject:v28];

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v96 = v5;
    id v29 = v5;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v102 objects:v114 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v103 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = (void *)SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            v35 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            v36 = v34;
            [v35 floatValue];
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            __int16 v108 = 2048;
            double v109 = v37;
            _os_log_impl(&dword_21EFF4000, v36, OS_LOG_TYPE_INFO, "%s num from inputFeaturesArr is %f", buf, 0x16u);
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v102 objects:v114 count:16];
      }
      while (v31);
    }

    v38 = [(NSDictionary *)self->_inputSpecs objectForKeyedSubscript:@"input_1"];
    v39 = [v38 multiArrayConstraint];
    double v40 = [v39 shape];

    v41 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v107 = "-[SLUEStatisticsModule processInputFeatures:]";
      __int16 v108 = 2112;
      double v109 = v40;
      _os_log_impl(&dword_21EFF4000, v41, OS_LOG_TYPE_INFO, "%s Input shape: %@", buf, 0x16u);
    }
    uint64_t v42 = [v29 count];
    v43 = [*(id *)&v40 objectAtIndexedSubscript:1];
    int v44 = [v43 unsignedIntValue];

    if (v42 == v44)
    {
      double v94 = v40;
      v45 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithScalars:v29 shape:&unk_26D0A24F8 dataType:65568];
      if ([v45 count] >= 1)
      {
        uint64_t v46 = 0;
        do
        {
          id v47 = v45;
          uint64_t v48 = [v47 dataPointer];
          v49 = SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            double v50 = *(float *)(v48 + 4 * v46);
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            __int16 v108 = 2048;
            double v109 = v50;
            _os_log_impl(&dword_21EFF4000, v49, OS_LOG_TYPE_INFO, "%s num from processedInputFeatures %f", buf, 0x16u);
          }
          ++v46;
        }
        while ([v47 count] > v46);
      }
      if (v45)
      {
        v112 = @"input_1";
        v113 = v45;
        [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        id v101 = 0;
        *(double *)&uint64_t v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v51 = (void *)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v99 error:&v101];
        id v52 = v101;
        v53 = v52;
        id v4 = v97;
        if (!v51 || v52)
        {
          v77 = NSString;
          v78 = [v52 localizedDescription];
          double v57 = [v77 stringWithFormat:@"Failed to create feature with error %@", v78];

          v79 = SLLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v107 = "-[SLUEStatisticsModule processInputFeatures:]";
            __int16 v108 = 2114;
            double v109 = v57;
            _os_log_error_impl(&dword_21EFF4000, v79, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
          }
          v73 = 0;
          double v40 = v94;
          double v75 = *(double *)&v99;
        }
        else
        {
          uesModel = self->_uesModel;
          id v100 = 0;
          v93 = v51;
          double v55 = [(MLModel *)uesModel predictionFromFeatures:v51 error:&v100];
          id v56 = v100;
          v53 = v56;
          if (v55 == 0.0 || v56)
          {
            double v57 = v55;
            v80 = NSString;
            v81 = [v56 localizedDescription];
            *(double *)&uint64_t v92 = [v80 stringWithFormat:@"Failed to get output with error %@", v81];

            v82 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              __int16 v108 = 2114;
              v83 = (void *)v92;
              double v109 = *(double *)&v92;
              _os_log_error_impl(&dword_21EFF4000, v82, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
              v73 = 0;
              double v40 = v94;
              double v75 = *(double *)&v99;
            }
            else
            {
              v73 = 0;
              double v40 = v94;
              double v75 = *(double *)&v99;
              v83 = (void *)v92;
            }
          }
          else
          {
            double v57 = v55;
            v91 = [*(id *)&v55 featureValueForName:self->_outputNodeName];
            double v58 = [v91 multiArrayValue];
            v59 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              __int16 v108 = 2112;
              double v109 = v58;
              _os_log_impl(&dword_21EFF4000, v59, OS_LOG_TYPE_DEFAULT, "%s output: %@", buf, 0x16u);
            }
            v60 = [(NSDictionary *)self->_outputSpecs objectForKeyedSubscript:self->_outputNodeName];
            v61 = [v60 multiArrayConstraint];
            *(double *)&uint64_t v62 = [v61 shape];

            v63 = SLLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v107 = "-[SLUEStatisticsModule processInputFeatures:]";
              __int16 v108 = 2112;
              double v109 = *(double *)&v62;
              _os_log_impl(&dword_21EFF4000, v63, OS_LOG_TYPE_INFO, "%s Output shape: %@", buf, 0x16u);
            }
            v64 = [*(id *)&v58 shape];
            char v65 = [v64 isEqualToArray:v62];

            double v40 = v94;
            double v90 = v58;
            v98 = (void *)v62;
            if (v65)
            {
              v66 = [*(id *)&v58 convert1dMLMultiArrayToNSArray];
              v67 = [v66 firstObject];
              [v67 floatValue];
              float v69 = v68;

              v70 = SLLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v107 = "-[SLUEStatisticsModule processInputFeatures:]";
                __int16 v108 = 2048;
                double v109 = v69;
                _os_log_impl(&dword_21EFF4000, v70, OS_LOG_TYPE_INFO, "%s Score is %f", buf, 0x16u);
              }
              v71 = [SLUEStatisticsModuleResult alloc];
              *(float *)&double v72 = v69;
              v73 = [(SLUEStatisticsModuleResult *)v71 initWithScore:v72];
            }
            else
            {
              v84 = (void *)SLLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
              {
                v88 = v84;
                double v89 = [*(id *)&v58 shape];
                *(_DWORD *)buf = 136315650;
                v107 = "-[SLUEStatisticsModule processInputFeatures:]";
                __int16 v108 = 2112;
                double v109 = v89;
                __int16 v110 = 2112;
                uint64_t v111 = v62;
                _os_log_error_impl(&dword_21EFF4000, v88, OS_LOG_TYPE_ERROR, "%s Output shape %@ does not match expected shape %@", buf, 0x20u);
              }
              v73 = 0;
            }
            v83 = v91;
            v51 = v93;
            double v75 = *(double *)&v99;
          }
        }
      }
      else
      {
        double v75 = [NSString stringWithFormat:@"Failed to create Input features multiarray"];
        v76 = SLLogContextFacilityCoreSpeech;
        id v4 = v97;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v107 = "-[SLUEStatisticsModule processInputFeatures:]";
          __int16 v108 = 2114;
          double v109 = v75;
          _os_log_error_impl(&dword_21EFF4000, v76, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v53 = 0;
        v73 = 0;
        double v40 = v94;
      }
    }
    else
    {
      v74 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v86 = v74;
        *(double *)&uint64_t v87 = COERCE_DOUBLE([v29 count]);
        *(_DWORD *)buf = 136315394;
        v107 = "-[SLUEStatisticsModule processInputFeatures:]";
        __int16 v108 = 2048;
        double v109 = *(double *)&v87;
        _os_log_error_impl(&dword_21EFF4000, v86, OS_LOG_TYPE_ERROR, "%s inputFeaturesArr shape %lu does not match input shape", buf, 0x16u);
      }
      v53 = 0;
      v73 = 0;
    }
    v7 = v95;
    v5 = v96;
  }
  else
  {
    v73 = 0;
  }

  return v73;
}

- (id)getEncodedValue:(id)a3
{
  id v3 = a3;
  id v4 = [[SLUEStatisticsCohortTypeEncoding alloc] initWithDefaults];
  v5 = [(SLUEStatisticsCohortTypeEncoding *)v4 rawValueEncoded];
  if (v5)
  {
    v6 = [(SLUEStatisticsCohortTypeEncoding *)v4 rawValueEncoded];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [(SLUEStatisticsCohortTypeEncoding *)v4 rawValueEncoded];
      v5 = [v8 objectForKeyedSubscript:v3];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SLUEStatisticsModule dealloc]";
    _os_log_impl(&dword_21EFF4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SLUEStatisticsModule;
  [(SLUEStatisticsModule *)&v4 dealloc];
}

- (SLUEStatisticsModule)initWithConfig:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SLUEStatisticsModule;
  uint64_t v7 = [(SLUEStatisticsModule *)&v48 init];
  if (!v7) {
    goto LABEL_30;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  v8 = [MEMORY[0x263F38060] decodeJsonFromFile:v6];
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Missing config for User Engagement Stats model %@", 0];
    v14 = (void *)MEMORY[0x263F087E8];
    double v57 = @"reason";
    v58[0] = v13;
    v15 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    id v16 = [v14 errorWithDomain:@"com.apple.sl" code:118 userInfo:v15];

    v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
      __int16 v55 = 2112;
      id v56 = v13;
      _os_log_error_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (v16) {
        goto LABEL_21;
      }
    }
    else if (v16)
    {
LABEL_21:
      if (a4)
      {
        id v16 = v16;
        *a4 = v16;
      }

      goto LABEL_24;
    }
  }
  v9 = [v8 objectForKeyedSubscript:@"outputNodeName"];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"outputNodeName"];
    p_outputNodeName = &v7->_outputNodeName;
    outputNodeName = v7->_outputNodeName;
    v7->_outputNodeName = (NSString *)v10;
  }
  else
  {
    p_outputNodeName = &v7->_outputNodeName;
    outputNodeName = v7->_outputNodeName;
    v7->_outputNodeName = 0;
  }

  if (!*p_outputNodeName)
  {
    v13 = [NSString stringWithFormat:@"Missing output name for EUS %@", v8];
    v34 = (void *)MEMORY[0x263F087E8];
    v51 = @"reason";
    id v52 = v13;
    v35 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v16 = [v34 errorWithDomain:@"com.apple.sl" code:118 userInfo:v35];

    v36 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
      __int16 v55 = 2112;
      id v56 = v13;
      _os_log_error_impl(&dword_21EFF4000, v36, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (v16) {
        goto LABEL_21;
      }
    }
    else if (v16)
    {
      goto LABEL_21;
    }
  }
  v18 = [v6 stringByDeletingLastPathComponent];
  v19 = [v8 objectForKeyedSubscript:@"modelFile"];
  v20 = [v18 stringByAppendingPathComponent:v19];

  v21 = [NSURL fileURLWithPath:v20];
  id v22 = objc_alloc_init(MEMORY[0x263F00D98]);
  [v22 setComputeUnits:0];
  id v47 = 0;
  uint64_t v23 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v21 configuration:v22 error:&v47];
  id v24 = v47;
  uesModel = v7->_uesModel;
  v7->_uesModel = (MLModel *)v23;

  v26 = v7->_uesModel;
  if (v26 && !v24) {
    goto LABEL_29;
  }
  v45 = a4;
  uint64_t v46 = v18;
  v27 = NSString;
  v28 = [v24 localizedDescription];
  id v29 = [v27 stringWithFormat:@"Unable to create model with error %@", v28];

  uint64_t v30 = (void *)MEMORY[0x263F087E8];
  v49 = @"reason";
  double v50 = v29;
  uint64_t v31 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  uint64_t v32 = [v30 errorWithDomain:@"com.apple.sl" code:118 userInfo:v31];

  v33 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SLUEStatisticsModule initWithConfig:error:]";
    __int16 v55 = 2114;
    id v56 = v29;
    _os_log_error_impl(&dword_21EFF4000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    if (v32) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if (!v32)
  {
LABEL_28:

    v26 = v7->_uesModel;
    v18 = v46;
LABEL_29:
    v38 = [(MLModel *)v26 modelDescription];
    uint64_t v39 = [v38 inputDescriptionsByName];
    inputSpecs = v7->_inputSpecs;
    v7->_inputSpecs = (NSDictionary *)v39;

    v41 = [(MLModel *)v7->_uesModel modelDescription];
    uint64_t v42 = [v41 outputDescriptionsByName];
    outputSpecs = v7->_outputSpecs;
    v7->_outputSpecs = (NSDictionary *)v42;

LABEL_30:
    float v37 = v7;
    goto LABEL_31;
  }
LABEL_16:
  if (v45) {
    id *v45 = v32;
  }

LABEL_24:
  float v37 = 0;
LABEL_31:

  return v37;
}

@end