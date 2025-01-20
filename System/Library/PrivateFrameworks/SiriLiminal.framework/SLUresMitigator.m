@interface SLUresMitigator
+ (id)getTranscriptionForSpeechPackage:(id)a3;
- (CSFModelComputeBackend)uresModel;
- (NSDictionary)inputOpsMap;
- (NSDictionary)outputMap;
- (NSMutableDictionary)thresholdMap;
- (NSString)version;
- (SLUresMitigator)initWithConfig:(id)a3 bnnsIrPath:(id)a4 error:(id *)a5;
- (SLUresMitigator)initWithConfig:(id)a3 error:(id *)a4;
- (id)_processInputFeats:(id)a3;
- (void)_createInputOriginThresholdMap:(id)a3;
- (void)dealloc;
- (void)processInputFeats:(id)a3 completion:(id)a4;
- (void)setInputOpsMap:(id)a3;
- (void)setOutputMap:(id)a3;
- (void)setThresholdMap:(id)a3;
- (void)setUresModel:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SLUresMitigator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_thresholdMap, 0);
  objc_storeStrong((id *)&self->_outputMap, 0);
  objc_storeStrong((id *)&self->_inputOpsMap, 0);
  objc_storeStrong((id *)&self->_uresModel, 0);
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setThresholdMap:(id)a3
{
}

- (NSMutableDictionary)thresholdMap
{
  return self->_thresholdMap;
}

- (void)setOutputMap:(id)a3
{
}

- (NSDictionary)outputMap
{
  return self->_outputMap;
}

- (void)setInputOpsMap:(id)a3
{
}

- (NSDictionary)inputOpsMap
{
  return self->_inputOpsMap;
}

- (void)setUresModel:(id)a3
{
}

- (CSFModelComputeBackend)uresModel
{
  return self->_uresModel;
}

- (id)_processInputFeats:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 speechPackage];

  if (v5)
  {
    v6 = [v4 speechPackage];
    v7 = +[SLASRFeatureExtractor extractASRFaturesFrom:v6];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v4 inputOrigin];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    inputOpsMap = self->_inputOpsMap;
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __38__SLUresMitigator__processInputFeats___block_invoke;
    v76[3] = &unk_264500098;
    id v11 = v7;
    id v77 = v11;
    id v12 = v4;
    id v78 = v12;
    id v51 = v9;
    id v79 = v51;
    [(NSDictionary *)inputOpsMap enumerateKeysAndObjectsUsingBlock:v76];
    uresModel = self->_uresModel;
    id v75 = 0;
    v14 = [(CSFModelComputeBackend *)uresModel predictOutputWithInputs:v51 errOut:&v75];
    id v15 = v75;
    v50 = v15;
    if (!v14 || v15)
    {
      v43 = NSString;
      v44 = [v15 localizedDescription];
      v45 = [v43 stringWithFormat:@"Failed to get output with error %@", v44];

      v46 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 136315394;
        *(void *)&v88[4] = "-[SLUresMitigator _processInputFeats:]";
        *(_WORD *)&v88[12] = 2114;
        *(void *)&v88[14] = v45;
        _os_log_error_impl(&dword_21EFF4000, v46, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
      }

      v41 = 0;
    }
    else
    {
      *(void *)v88 = 0;
      *(void *)&v88[8] = v88;
      *(void *)&v88[16] = 0x2020000000;
      int v89 = 0;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 0;
      uint64_t v67 = 0;
      v68 = (float *)&v67;
      uint64_t v69 = 0x2020000000;
      int v70 = -1082130432;
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x2020000000;
      int v66 = -1082130432;
      uint64_t v59 = 0;
      v60 = (double *)&v59;
      uint64_t v61 = 0x2020000000;
      uint64_t v62 = 0;
      outputMap = self->_outputMap;
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __38__SLUresMitigator__processInputFeats___block_invoke_359;
      v52[3] = &unk_2645000C0;
      id v53 = v14;
      v54 = v88;
      v55 = &v59;
      v56 = &v71;
      v57 = &v67;
      v58 = &v63;
      [(NSDictionary *)outputMap enumerateKeysAndObjectsUsingBlock:v52];
      thresholdMap = self->_thresholdMap;
      v18 = [v12 inputOrigin];
      v49 = [(NSMutableDictionary *)thresholdMap objectForKeyedSubscript:v18];

      if (v49)
      {
        [v49 floatValue];
        float v20 = v19;
        v68[6] = v19;
        *((unsigned char *)v72 + 24) = *(float *)(*(void *)&v88[8] + 24) < v19;
        v21 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v85 = "-[SLUresMitigator _processInputFeats:]";
          __int16 v86 = 2048;
          double v87 = v20;
          _os_log_impl(&dword_21EFF4000, v21, OS_LOG_TYPE_DEFAULT, "%s Using software configured threshold: %.3f", buf, 0x16u);
        }
      }
      if (*((unsigned char *)v72 + 24)) {
        v22 = @"requestMitigated";
      }
      else {
        v22 = @"requestNotMitigated";
      }
      v48 = v22;
      v82[0] = @"score";
      LODWORD(v23) = *(_DWORD *)(*(void *)&v88[8] + 24);
      v24 = [NSNumber numberWithFloat:v23];
      v83[0] = v24;
      v83[1] = v48;
      v82[1] = @"decision";
      v82[2] = @"decisionValue";
      v25 = [NSNumber numberWithDouble:v60[3]];
      v83[2] = v25;
      v82[3] = @"threshold";
      *(float *)&double v26 = v68[6];
      v27 = [NSNumber numberWithFloat:v26];
      v83[3] = v27;
      v82[4] = @"speakerIDthreshold";
      LODWORD(v28) = *((_DWORD *)v64 + 6);
      v29 = [NSNumber numberWithFloat:v28];
      v82[5] = @"assetVersion";
      version = self->_version;
      v83[4] = v29;
      v83[5] = version;
      v31 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:6];

      v80[0] = @"numAsrRecords";
      v32 = NSNumber;
      v33 = [v11 latticePathMaxScores];
      v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
      v81[0] = v34;
      v80[1] = @"numTokensTopPath";
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "topLatticePathTokenCount"));
      v81[1] = v35;
      v80[2] = @"trailingSilenceDuration";
      v36 = NSNumber;
      [v11 trailingSilence];
      v37 = objc_msgSend(v36, "numberWithFloat:");
      v81[2] = v37;
      v38 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];

      v39 = [SLUresMitigatorResult alloc];
      LODWORD(v40) = *(_DWORD *)(*(void *)&v88[8] + 24);
      v41 = [(SLUresMitigatorResult *)v39 initWithScore:*((unsigned __int8 *)v72 + 24) decision:v31 decisionLevel:v38 detailedResults:v40 extractedFeats:v60[3]];

      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(v88, 8);
    }
  }
  else
  {
    v42 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v88 = 136315394;
      *(void *)&v88[4] = "-[SLUresMitigator _processInputFeats:]";
      *(_WORD *)&v88[12] = 2114;
      *(void *)&v88[14] = @"Missing input origin";
      _os_log_error_impl(&dword_21EFF4000, v42, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
    }
    v41 = 0;
  }

  return v41;
}

void __38__SLUresMitigator__processInputFeats___block_invoke(id *a1, void *a2, void *a3)
{
  v68[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"numAsrRecords"])
  {
    v7 = NSNumber;
    v8 = [a1[4] latticePathMaxScores];
    v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v68[0] = v9;
    v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = (void **)v68;
LABEL_3:
    id v12 = [v10 arrayWithObjects:v11 count:1];

LABEL_4:
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"topPathScores"])
  {
    uint64_t v13 = [a1[4] topLatticePathScores];
  }
  else if ([v5 isEqualToString:@"latticeMaxScores"])
  {
    uint64_t v13 = [a1[4] latticePathMaxScores];
  }
  else if ([v5 isEqualToString:@"latticeMinScores"])
  {
    uint64_t v13 = [a1[4] latticePathMinScores];
  }
  else if ([v5 isEqualToString:@"latticeMeanScores"])
  {
    uint64_t v13 = [a1[4] latticePathMeanScores];
  }
  else
  {
    if (![v5 isEqualToString:@"latticeVarScores"])
    {
      if ([v5 isEqualToString:@"topPathNumTokens"])
      {
        v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[4], "topLatticePathTokenCount"));
        uint64_t v67 = v8;
        double v26 = (void *)MEMORY[0x263EFF8C0];
        v27 = &v67;
      }
      else
      {
        if ([v5 isEqualToString:@"acousticFTMScore"])
        {
          double v28 = NSNumber;
          v8 = [a1[5] acousticFTMScores];
          [v8 floatValue];
          v9 = objc_msgSend(v28, "numberWithFloat:");
          int v66 = v9;
          v10 = (void *)MEMORY[0x263EFF8C0];
          id v11 = &v66;
          goto LABEL_3;
        }
        if ([v5 isEqualToString:@"lrnnScores"])
        {
          v8 = [a1[5] lrnnScore];
          uint64_t v65 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v65;
        }
        else if ([v5 isEqualToString:@"lrnnThreshold"])
        {
          v8 = [a1[5] lrnnThreshold];
          v64 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v64;
        }
        else if ([v5 isEqualToString:@"snr"])
        {
          v29 = NSNumber;
          [a1[4] snr];
          v8 = objc_msgSend(v29, "numberWithFloat:");
          uint64_t v63 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v63;
        }
        else if ([v5 isEqualToString:@"trailingSilence"])
        {
          v30 = NSNumber;
          [a1[4] trailingSilence];
          v8 = objc_msgSend(v30, "numberWithFloat:");
          uint64_t v62 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v62;
        }
        else if ([v5 isEqualToString:@"inputOrigin"])
        {
          v8 = [a1[5] inputOrigin];
          uint64_t v61 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v61;
        }
        else if ([v5 isEqualToString:@"timeFromPrevQuery"])
        {
          v31 = NSNumber;
          [a1[5] timeSinceLastQuery];
          v8 = objc_msgSend(v31, "numberWithDouble:");
          v60 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v60;
        }
        else if ([v5 isEqualToString:@"speakerIdScore"])
        {
          v8 = [a1[5] speakerIDScore];
          uint64_t v59 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v59;
        }
        else if ([v5 isEqualToString:@"airpodsConnectedState"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "isAirpodsConnected"));
          v58 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v58;
        }
        else if ([v5 isEqualToString:@"boronActivityScore"])
        {
          v8 = [a1[5] boronScore];
          v57 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v57;
        }
        else if ([v5 isEqualToString:@"acousticSpeechActivityScore"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "didDetectSpeechActivity"));
          v56 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v56;
        }
        else if ([v5 isEqualToString:@"attSiriPrevOutputState"])
        {
          v8 = [a1[5] prevStageOutput];
          v55 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v55;
        }
        else if ([v5 isEqualToString:@"multiModalDecisionStage"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[5], "decisionStage"));
          v54 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v54;
        }
        else if ([v5 isEqualToString:@"eosLikelihood"])
        {
          v8 = [a1[5] eosLikelihood];
          id v53 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v53;
        }
        else if ([v5 isEqualToString:@"visualGazeScore"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "didDetectGazeAtOrb"));
          v52 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v52;
        }
        else if ([v5 isEqualToString:@"visualAttentionScore"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "didDetectAttention"));
          id v51 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v51;
        }
        else if ([v5 isEqualToString:@"visualSpeechActivityScore"])
        {
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "didDetectVisualActivity"));
          v50 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v50;
        }
        else if ([v5 isEqualToString:@"nldaScore"])
        {
          v8 = [a1[5] nldaScore];
          v49 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v49;
        }
        else if ([v5 isEqualToString:@"confidenceScoreASR"])
        {
          v8 = [a1[5] confidenceScore];
          v48 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v48;
        }
        else if ([v5 isEqualToString:@"checkerScore"])
        {
          v8 = [a1[5] checkerScore];
          v47 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v47;
        }
        else if ([v5 isEqualToString:@"phsScore"])
        {
          v8 = [a1[5] phsScore];
          v46 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v46;
        }
        else if ([v5 isEqualToString:@"embeddingScore"])
        {
          v8 = [a1[5] embeddingScore];
          v45 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v45;
        }
        else if ([v5 isEqualToString:@"externalLrnnScale"])
        {
          v8 = [a1[5] externalLrnnScale];
          v44 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v44;
        }
        else if ([v5 isEqualToString:@"externalLrnnOffset"])
        {
          v8 = [a1[5] externalLrnnOffset];
          v43 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v43;
        }
        else if ([v5 isEqualToString:@"conversationalNldaScore"])
        {
          v8 = [a1[5] conversationalNldaScore];
          v42 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v42;
        }
        else
        {
          if (![v5 isEqualToString:@"conversational"])
          {
            double v40 = &unk_26D0A24E0;
            uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
            goto LABEL_15;
          }
          v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "isConversational"));
          v41 = v8;
          double v26 = (void *)MEMORY[0x263EFF8C0];
          v27 = &v41;
        }
      }
      id v12 = [v26 arrayWithObjects:v27 count:1];
      goto LABEL_4;
    }
    uint64_t v13 = [a1[4] latticePathVarScores];
  }
LABEL_15:
  id v12 = (void *)v13;
LABEL_16:
  v14 = [v6 valueForKey:@"name"];
  id v15 = [v6 valueForKey:@"shape"];

  v16 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = [v12 firstObject];
    *(_DWORD *)buf = 136315650;
    v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
    __int16 v36 = 2114;
    id v37 = v14;
    __int16 v38 = 2114;
    v39 = v18;
    _os_log_impl(&dword_21EFF4000, v17, OS_LOG_TYPE_DEFAULT, "%s AttFeature: %{public}@ --> %{public}@", buf, 0x20u);
  }
  if (v12)
  {
    float v19 = [MEMORY[0x263F38070] propertyWithShape:v15 dataType:1];
    id v20 = objc_alloc(MEMORY[0x263F38040]);
    v33 = v12;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    id v32 = 0;
    v22 = (void *)[v20 initWithInputArray:v21 name:v14 properties:v19 errOut:&v32];
    id v23 = v32;

    if (!v22 || v23)
    {
      v25 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
        __int16 v36 = 2112;
        id v37 = v23;
        __int16 v38 = 2114;
        v39 = v14;
        _os_log_error_impl(&dword_21EFF4000, v25, OS_LOG_TYPE_ERROR, "%s Failed to convert array to MLMultiArray with error: %@, not using feature %{public}@ for inference", buf, 0x20u);
      }
    }
    else
    {
      [a1[6] setObject:v22 forKey:v14];
    }
  }
  else
  {
    v24 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
      __int16 v36 = 2114;
      id v37 = v14;
      _os_log_error_impl(&dword_21EFF4000, v24, OS_LOG_TYPE_ERROR, "%s Value for feature: %{public}@ isn't set, abort model run", buf, 0x16u);
    }
  }
}

void __38__SLUresMitigator__processInputFeats___block_invoke_359(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 valueForKey:@"name"];
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  v8 = [v7 convertDataToArray];

  uint64_t v9 = [MEMORY[0x263F38058] getRankOfTensor:v8];
  if (v9 > 0)
  {
    v10 = [v8 firstObject];
    id v11 = v10;
    if (v9 == 2)
    {
      uint64_t v12 = [v10 firstObject];

      id v11 = (void *)v12;
    }
    if ([v5 isEqualToString:@"mitigatorScore"])
    {
      [v11 floatValue];
      uint64_t v14 = *(void *)(a1 + 40);
    }
    else
    {
      if ([v5 isEqualToString:@"mitigatorDecision"])
      {
        [v11 doubleValue];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16;
        if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < 2.22044605e-16) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        goto LABEL_7;
      }
      if ([v5 isEqualToString:@"mitigatorThreshold"])
      {
        [v11 floatValue];
        uint64_t v14 = *(void *)(a1 + 64);
      }
      else
      {
        if (![v5 isEqualToString:@"speakerIDThreshold"]) {
          goto LABEL_7;
        }
        [v11 floatValue];
        uint64_t v14 = *(void *)(a1 + 72);
      }
    }
    *(_DWORD *)(*(void *)(v14 + 8) + 24) = v13;
LABEL_7:

    goto LABEL_10;
  }
  id v15 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    v18 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    _os_log_impl(&dword_21EFF4000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid output shape: %lu", (uint8_t *)&v17, 0x16u);
  }
LABEL_10:
}

- (void)_createInputOriginThresholdMap:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  thresholdMap = self->_thresholdMap;
  self->_thresholdMap = v5;

  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__SLUresMitigator__createInputOriginThresholdMap___block_invoke;
    v9[3] = &unk_264500070;
    v9[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    v7 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_thresholdMap;
      *(_DWORD *)buf = 136315394;
      id v11 = "-[SLUresMitigator _createInputOriginThresholdMap:]";
      __int16 v12 = 2114;
      int v13 = v8;
      _os_log_impl(&dword_21EFF4000, v7, OS_LOG_TYPE_DEFAULT, "%s Threshold map: %{public}@", buf, 0x16u);
    }
  }
}

void __50__SLUresMitigator__createInputOriginThresholdMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"threshold"];
  v8 = [v6 objectForKeyedSubscript:@"modelIndex"];

  if (v8 && v7)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v7 forKey:v8];
  }
  else
  {
    uint64_t v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[SLUresMitigator _createInputOriginThresholdMap:]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_error_impl(&dword_21EFF4000, v9, OS_LOG_TYPE_ERROR, "%s Invalid config for %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)processInputFeats:(id)a3 completion:(id)a4
{
  v7 = (void (**)(id, void *))a4;
  id v6 = [(SLUresMitigator *)self _processInputFeats:a3];
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[SLUresMitigator dealloc]";
    _os_log_impl(&dword_21EFF4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SLUresMitigator;
  [(SLUresMitigator *)&v4 dealloc];
}

- (SLUresMitigator)initWithConfig:(id)a3 bnnsIrPath:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)SLUresMitigator;
  int v10 = [(SLUresMitigator *)&v42 init];
  if (!v10) {
    goto LABEL_19;
  }
  if (SLLogInitIfNeeded_once != -1) {
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  }
  id v41 = 0;
  id v11 = [[SLUresMitigatorConfigDecoder alloc] initWithConfigFile:v8 errOut:&v41];
  id v12 = v41;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[SLUresMitigator initWithConfig:bnnsIrPath:error:]";
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v13;
      _os_log_error_impl(&dword_21EFF4000, v14, OS_LOG_TYPE_ERROR, "%s SLUresMitigator config init with error: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  uint64_t v16 = [(SLUresMitigatorConfigDecoder *)v11 getModelFile];
  if (v9)
  {
    id v17 = v9;

    uint64_t v16 = v17;
  }
  v18 = [(SLUresMitigatorConfigDecoder *)v11 getBnnsIrWeightFile];
  id v40 = 0;
  uint64_t v19 = [MEMORY[0x263F38050] provideComputeBackendWithModelFile:v16 separateWeight:v18 error:&v40];
  id v20 = v40;
  uresModel = v10->_uresModel;
  v10->_uresModel = (CSFModelComputeBackend *)v19;

  if (v10->_uresModel)
  {
    v22 = 0;
    if (!v20)
    {
LABEL_18:
      uint64_t v30 = [(SLUresMitigatorConfigDecoder *)v11 getVersion];
      version = v10->_version;
      v10->_version = (NSString *)v30;

      uint64_t v32 = [(SLUresMitigatorConfigDecoder *)v11 getInputOpsMap];
      inputOpsMap = v10->_inputOpsMap;
      v10->_inputOpsMap = (NSDictionary *)v32;

      uint64_t v34 = [(SLUresMitigatorConfigDecoder *)v11 getOutputMap];
      outputMap = v10->_outputMap;
      v10->_outputMap = (NSDictionary *)v34;

      __int16 v36 = [(SLUresMitigatorConfigDecoder *)v11 getSupportedInputOrigins];
      [(SLUresMitigator *)v10 _createInputOriginThresholdMap:v36];

LABEL_19:
      id v15 = v10;
      goto LABEL_20;
    }
  }
  __int16 v38 = v18;
  id v23 = NSString;
  v24 = [v20 localizedDescription];
  uint64_t v25 = [v23 stringWithFormat:@"Unable to create model with error %@", v24];

  double v26 = (void *)MEMORY[0x263F087E8];
  v43 = @"reason";
  uint64_t v44 = v25;
  v39 = (void *)v25;
  v27 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v22 = [v26 errorWithDomain:@"com.apple.sl" code:106 userInfo:v27];

  double v28 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[SLUresMitigator initWithConfig:bnnsIrPath:error:]";
    __int16 v47 = 2114;
    uint64_t v48 = v25;
    _os_log_error_impl(&dword_21EFF4000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  v18 = v38;
  if (!a5)
  {

    goto LABEL_18;
  }
  id v29 = v22;
  *a5 = v29;

LABEL_8:
  id v15 = 0;
LABEL_20:

  return v15;
}

- (SLUresMitigator)initWithConfig:(id)a3 error:(id *)a4
{
  return [(SLUresMitigator *)self initWithConfig:a3 bnnsIrPath:0 error:a4];
}

+ (id)getTranscriptionForSpeechPackage:(id)a3
{
  return +[SLASRFeatureExtractor getBestSpeechRecognitionTextFromPackage:a3];
}

@end