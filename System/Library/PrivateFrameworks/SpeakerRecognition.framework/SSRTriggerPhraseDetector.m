@interface SSRTriggerPhraseDetector
+ (id)filterVTAudioFiles:(id)a3 withLocale:(id)a4 withAsset:(id)a5;
- (SSRTriggerPhraseDetector)initWithLocale:(id)a3 asset:(id)a4;
- (SSRTriggerPhraseDetectorNDAPI)detectorNDAPI;
- (SSRTriggerPhraseDetectorQuasar)detectorQuasar;
- (float)recognizerScoreScaleFactor;
- (void)computeTriggerConfidenceForAudio:(id)a3 withCompletion:(id)a4;
- (void)setDetectorNDAPI:(id)a3;
- (void)setDetectorQuasar:(id)a3;
- (void)setRecognizerScoreScaleFactor:(float)a3;
@end

@implementation SSRTriggerPhraseDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorQuasar, 0);

  objc_storeStrong((id *)&self->_detectorNDAPI, 0);
}

- (void)setRecognizerScoreScaleFactor:(float)a3
{
  self->_recognizerScoreScaleFactor = a3;
}

- (float)recognizerScoreScaleFactor
{
  return self->_recognizerScoreScaleFactor;
}

- (void)setDetectorQuasar:(id)a3
{
}

- (SSRTriggerPhraseDetectorQuasar)detectorQuasar
{
  return self->_detectorQuasar;
}

- (void)setDetectorNDAPI:(id)a3
{
}

- (SSRTriggerPhraseDetectorNDAPI)detectorNDAPI
{
  return self->_detectorNDAPI;
}

- (void)computeTriggerConfidenceForAudio:(id)a3 withCompletion:(id)a4
{
  v74[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, float))a4;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2536;
  v59 = __Block_byref_object_dispose__2537;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2536;
  v53 = __Block_byref_object_dispose__2537;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2536;
  v47 = __Block_byref_object_dispose__2537;
  id v48 = 0;
  [(SSRTriggerPhraseDetectorNDAPI *)self->_detectorNDAPI reset];
  [(SSRTriggerPhraseDetectorQuasar *)self->_detectorQuasar reset];
  v8 = (id *)MEMORY[0x263F38100];
  v9 = (id)*MEMORY[0x263F38100];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 lastPathComponent];
    *(_DWORD *)buf = 136315394;
    v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
    __int16 v63 = 2114;
    id v64 = v10;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@ for trigger word detection", buf, 0x16u);
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0xFFFFFFFFLL;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __76__SSRTriggerPhraseDetector_computeTriggerConfidenceForAudio_withCompletion___block_invoke;
  v32[3] = &unk_264429230;
  id v11 = v6;
  v35 = &v43;
  v36 = v42;
  v37 = v41;
  v38 = &v49;
  id v33 = v11;
  v34 = self;
  v39 = &v55;
  +[SSRUtils streamAudioFromFileUrl:v11 audioStreamBasicDescriptor:v40 samplesPerStreamChunk:640 audioDataAvailableHandler:v32];
  double v12 = v44[5];
  if (v12 == 0.0)
  {
    if (!self->_detectorNDAPI || v56[5])
    {
      if (!self->_detectorQuasar
        || (v14 = (void *)v50[5]) != 0
        && ([v14 objectForKeyedSubscript:@"best_score"],
            v15 = objc_claimAutoreleasedReturnValue(),
            BOOL v16 = v15 == 0,
            v15,
            !v16))
      {
        v17 = [(id)v50[5] objectForKeyedSubscript:@"best_score"];
        [v17 floatValue];
        float v19 = v18;

        [(id)v56[5] bestScore];
        float v21 = v20;
        float v22 = v20 + (float)(self->_recognizerScoreScaleFactor * v19);
        v23 = *v8;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [v11 lastPathComponent];
          *(_DWORD *)buf = 136316162;
          v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
          __int16 v63 = 2114;
          id v64 = v24;
          __int16 v65 = 2050;
          double v66 = v22;
          __int16 v67 = 2050;
          double v68 = v21;
          __int16 v69 = 2050;
          double v70 = v19;
          _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Best trigger score for %{public}@ is %{public}f (%{public}f, %{public}f)", buf, 0x34u);
        }
        if (v7) {
          v7[2](v7, 0, v22);
        }
        goto LABEL_24;
      }
      v25 = [NSString stringWithFormat:@"Quasar: missing best_score for %@", v11];
      v26 = *v8;
      if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
        __int16 v63 = 2114;
        id v64 = v25;
        _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        if (!v7) {
          goto LABEL_23;
        }
        goto LABEL_18;
      }
      if (v7)
      {
LABEL_18:
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v71 = *MEMORY[0x263F08320];
        v72 = v25;
        v28 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        v29 = [v27 errorWithDomain:@"com.apple.speakerrecognition" code:112 userInfo:v28];
        ((void (**)(id, void *, float))v7)[2](v7, v29, -1000.0);
LABEL_22:
      }
LABEL_23:

      goto LABEL_24;
    }
    v25 = [NSString stringWithFormat:@"NDAPI: missing best_score for %@", v11];
    v30 = *v8;
    if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
      __int16 v63 = 2114;
      id v64 = v25;
      _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      if (!v7) {
        goto LABEL_23;
      }
    }
    else if (!v7)
    {
      goto LABEL_23;
    }
    v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v73 = *MEMORY[0x263F08320];
    v74[0] = v25;
    v28 = [NSDictionary dictionaryWithObjects:v74 forKeys:&v73 count:1];
    v29 = [v31 errorWithDomain:@"com.apple.speakerrecognition" code:112 userInfo:v28];
    ((void (**)(id, void *, float))v7)[2](v7, v29, -1000.0);
    goto LABEL_22;
  }
  v13 = *v8;
  if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v62 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]";
    __int16 v63 = 2114;
    id v64 = v11;
    __int16 v65 = 2114;
    double v66 = v12;
    _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", buf, 0x20u);
    if (!v7) {
      goto LABEL_24;
    }
    goto LABEL_6;
  }
  if (v7) {
LABEL_6:
  }
    v7[2](v7, *((void *)v44 + 5), -1000.0);
LABEL_24:

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
}

void __76__SSRTriggerPhraseDetector_computeTriggerConfidenceForAudio_withCompletion___block_invoke(void *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v8)
  {
    v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = a1[4];
      *(_DWORD *)buf = 136315394;
      v27 = "-[SSRTriggerPhraseDetector computeTriggerConfidenceForAudio:withCompletion:]_block_invoke";
      __int16 v28 = 2112;
      uint64_t v29 = v24;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
  else if (a3)
  {
    float v10 = (float)*(unint64_t *)(*(void *)(a1[8] + 8) + 24);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    *(void *)(*(void *)(a1[7] + 8) + 24) = (unint64_t)(float)((float)(v10 / v11) * 1000.0);
    uint64_t v12 = [*(id *)(a1[5] + 24) endAudio];
    uint64_t v13 = *(void *)(a1[9] + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    v15 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v16 = [v15 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    unint64_t v17 = v16 / v25;
    *(void *)(*(void *)(a1[8] + 8) + 24) += v17;
    uint64_t v18 = [*(id *)(a1[5] + 16) analyzeWavData:v15 numSamples:v17];
    uint64_t v19 = *(void *)(a1[10] + 8);
    float v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = [*(id *)(a1[5] + 24) analyzeWavData:v15 numSamples:v17];
    uint64_t v22 = *(void *)(a1[9] + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
}

- (SSRTriggerPhraseDetector)initWithLocale:(id)a3 asset:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SSRTriggerPhraseDetector;
  id v8 = [(SSRTriggerPhraseDetector *)&v27 init];
  if (!v8) {
    goto LABEL_9;
  }
  v9 = [MEMORY[0x263F380F8] decodeConfigFrom:v7 forFirstPassSource:0];
  float v10 = [v7 resourcePath];
  float v11 = [SSRTriggerPhraseDetectorNDAPI alloc];
  uint64_t v12 = [v7 keywordDetectorNDAPIConfigFilePath];
  uint64_t v13 = [(SSRTriggerPhraseDetectorNDAPI *)v11 initWithConfigPath:v12 resourcePath:v10 phId:0];
  detectorNDAPI = v8->_detectorNDAPI;
  v8->_detectorNDAPI = (SSRTriggerPhraseDetectorNDAPI *)v13;

  if ([MEMORY[0x263F380D0] supportPremiumModel])
  {
    if ([v9 useRecognizerCombination])
    {
      v15 = [SSRTriggerPhraseDetectorQuasar alloc];
      unint64_t v16 = [v7 keywordDetectorQuasarConfigFilePath];
      uint64_t v17 = [(SSRTriggerPhraseDetectorQuasar *)v15 initWithLocale:v6 configPath:v16 resourcePath:v10];
      detectorQuasar = v8->_detectorQuasar;
      v8->_detectorQuasar = (SSRTriggerPhraseDetectorQuasar *)v17;

      uint64_t v19 = [v9 phraseConfigs];
      float v20 = [v19 firstObject];
      [v20 recognizerScoreScaleFactor];
      v8->_double recognizerScoreScaleFactor = v21;

      uint64_t v22 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
      {
        double recognizerScoreScaleFactor = v8->_recognizerScoreScaleFactor;
        *(_DWORD *)buf = 136315394;
        uint64_t v29 = "-[SSRTriggerPhraseDetector initWithLocale:asset:]";
        __int16 v30 = 2048;
        double v31 = recognizerScoreScaleFactor;
        _os_log_debug_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEBUG, "%s Using recognizer scale factor: %f for phrase detector", buf, 0x16u);
      }
    }
  }
  if (v8->_detectorQuasar || v8->_detectorNDAPI)
  {

LABEL_9:
    v23 = v8;
    goto LABEL_10;
  }
  unsigned int v25 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v29 = "-[SSRTriggerPhraseDetector initWithLocale:asset:]";
    _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create trigger phrase detectors", buf, 0xCu);
  }

  v23 = 0;
LABEL_10:

  return v23;
}

+ (id)filterVTAudioFiles:(id)a3 withLocale:(id)a4 withAsset:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v27 = a5;
  v26 = [[SSRTriggerPhraseDetector alloc] initWithLocale:v8 asset:v27];
  v23 = v7;
  uint64_t v24 = v8;
  if (v26)
  {
    __int16 v28 = objc_msgSend(v7, "mutableCopy", v7, v8);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
          *(void *)v44 = 0;
          *(void *)&v44[8] = v44;
          *(void *)&v44[16] = 0x3032000000;
          uint64_t v45 = __Block_byref_object_copy__2536;
          v46 = __Block_byref_object_dispose__2537;
          id v47 = 0;
          uint64_t v30 = 0;
          double v31 = (float *)&v30;
          uint64_t v32 = 0x2020000000;
          int v33 = -8388608;
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __68__SSRTriggerPhraseDetector_filterVTAudioFiles_withLocale_withAsset___block_invoke;
          v29[3] = &unk_264429908;
          v29[4] = v44;
          v29[5] = &v30;
          [(SSRTriggerPhraseDetector *)v26 computeTriggerConfidenceForAudio:v12 withCompletion:v29];
          if (*(void *)(*(void *)&v44[8] + 40))
          {
            uint64_t v13 = (id)*MEMORY[0x263F38100];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              double v18 = [v12 lastPathComponent];
              double v19 = *(double *)(*(void *)&v44[8] + 40);
              *(_DWORD *)buf = 136315650;
              v39 = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
              __int16 v40 = 2114;
              double v41 = v18;
              __int16 v42 = 2114;
              double v43 = v19;
              _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed in trigger processing %{public}@ with %{public}@", buf, 0x20u);
            }
            [v28 removeObject:v12];
          }
          [v27 satVTImplicitThreshold];
          float v15 = v14;
          float v16 = v31[6];
          if (v16 < v14)
          {
            uint64_t v17 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v39 = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
              __int16 v40 = 2050;
              double v41 = v16;
              __int16 v42 = 2048;
              double v43 = v15;
              _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Trigger Score %{public}f not satisfied implicit VT threshold %f", buf, 0x20u);
            }
            [v28 removeObject:v12];
          }
          _Block_object_dispose(&v30, 8);
          _Block_object_dispose(v44, 8);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v9);
    }

    if ([v28 count]) {
      id v20 = (id)[v28 copy];
    }
    else {
      id v20 = 0;
    }
  }
  else
  {
    float v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315650;
      *(void *)&v44[4] = "+[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:]";
      *(_WORD *)&v44[12] = 2114;
      *(void *)&v44[14] = v8;
      *(_WORD *)&v44[22] = 2114;
      uint64_t v45 = (uint64_t (*)(uint64_t, uint64_t))v27;
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create TriggerPhraseDetector in %{public}@ with %{public}@", v44, 0x20u);
    }
    id v20 = v7;
  }

  return v20;
}

void __68__SSRTriggerPhraseDetector_filterVTAudioFiles_withLocale_withAsset___block_invoke(uint64_t a1, void *a2, float a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

@end