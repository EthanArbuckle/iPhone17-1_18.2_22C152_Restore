@interface SSRVoiceProfileRetrainerSAT
- (BOOL)implicitTrainingRequired;
- (BOOL)needsRetrainingWithAudioFiles:(id)a3;
- (BOOL)resetModelForRetraining;
- (NSData)superVector;
- (NSDictionary)comparativeModels;
- (NSString)description;
- (NSURL)configFilePath;
- (NSURL)modelFilePath;
- (NSURL)resourceFilePath;
- (NSURL)satModelFilePath;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionScorer)satScorer;
- (SSRVoiceProfile)voiceProfile;
- (SSRVoiceProfileRetrainerSAT)initWithVoiceRetrainingContext:(id)a3;
- (id)_processAudioFile:(id)a3 withSATProcessor:(id)a4;
- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6;
- (id)purgeConfusionInformationWithPolicy:(id)a3;
- (unint64_t)processedAudioDurationMs;
- (unint64_t)retrainerType;
- (unint64_t)spIdType;
- (unint64_t)superVectorSize;
- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5;
- (void)purgeLastSpeakerEmbedding;
- (void)setComparativeModels:(id)a3;
- (void)setConfigFilePath:(id)a3;
- (void)setProcessedAudioDurationMs:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setSatModelFilePath:(id)a3;
- (void)setSatScorer:(id)a3;
- (void)setSpIdType:(unint64_t)a3;
- (void)setSuperVector:(id)a3;
- (void)setSuperVectorSize:(unint64_t)a3;
- (void)setVoiceProfile:(id)a3;
@end

@implementation SSRVoiceProfileRetrainerSAT

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_superVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_satModelFilePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);

  objc_storeStrong((id *)&self->_satScorer, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setProcessedAudioDurationMs:(unint64_t)a3
{
  self->_processedAudioDurationMs = a3;
}

- (unint64_t)processedAudioDurationMs
{
  return self->_processedAudioDurationMs;
}

- (void)setSuperVectorSize:(unint64_t)a3
{
  self->_superVectorSize = a3;
}

- (unint64_t)superVectorSize
{
  return self->_superVectorSize;
}

- (void)setSuperVector:(id)a3
{
}

- (NSData)superVector
{
  return self->_superVector;
}

- (void)setComparativeModels:(id)a3
{
}

- (NSDictionary)comparativeModels
{
  return self->_comparativeModels;
}

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setSatModelFilePath:(id)a3
{
}

- (NSURL)satModelFilePath
{
  return self->_satModelFilePath;
}

- (void)setResourceFilePath:(id)a3
{
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (void)setConfigFilePath:(id)a3
{
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (void)setVoiceProfile:(id)a3
{
}

- (SSRVoiceProfile)voiceProfile
{
  return self->_voiceProfile;
}

- (void)setSatScorer:(id)a3
{
}

- (SSRSpeakerRecognitionScorer)satScorer
{
  return self->_satScorer;
}

- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
{
  unint64_t v24 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "analyzeSuperVector:withDimensions:withThresholdType:", v8, a4, 0, v24);
        v17 = objc_msgSend(NSNumber, "numberWithFloat:");
        v18 = [v16 profileID];
        [v10 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v13);
  }

  v31[0] = v10;
  v30[0] = @"spIdKnownUserSATScores";
  v30[1] = @"spIdAudioProcessedDuration";
  v19 = [NSNumber numberWithUnsignedInteger:v24];
  v31[1] = v19;
  v30[2] = @"bestVoiceTriggerScore";
  *(float *)&double v20 = self->_bestTriggerScore;
  v21 = [NSNumber numberWithFloat:v20];
  v31[2] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

  return v22;
}

- (id)_processAudioFile:(id)a3 withSATProcessor:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F38100];
  id v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v74 = __Block_byref_object_copy__1208;
  v75 = __Block_byref_object_dispose__1209;
  id v76 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  self->_bestTriggerScore = -1.0;
  uint64_t v60 = 0xFFFFFFFFLL;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1208;
  v55 = __Block_byref_object_dispose__1209;
  id v56 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  v40 = __66__SSRVoiceProfileRetrainerSAT__processAudioFile_withSATProcessor___block_invoke;
  v41 = &unk_264428E88;
  id v42 = 0;
  double v10 = COERCE_DOUBLE(v6);
  double v43 = v10;
  v45 = &v51;
  v46 = &v57;
  v47 = v50;
  id v11 = v7;
  id v44 = v11;
  v48 = buf;
  +[SSRUtils streamAudioFromFileUrl:*(void *)&v10 audioStreamBasicDescriptor:v49 samplesPerStreamChunk:640 audioDataAvailableHandler:&v38];
  uint64_t v12 = (void *)v52[5];
  if (v12)
  {
    uint64_t v13 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v67 = 136315650;
      v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
      __int16 v69 = 2114;
      double v70 = v10;
      __int16 v71 = 2114;
      v72 = v12;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v67, 0x20u);
      uint64_t v12 = (void *)v52[5];
    }
    id v14 = v12;
  }
  else if ((unint64_t)v58[3] > 0xC7)
  {
    v19 = *(void **)(*(void *)&buf[8] + 40);
    if (v19)
    {
      [v19 bestScore];
      float v21 = v20;
      self->_bestTriggerScore = v20;
      v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
        __int16 v69 = 2050;
        double v70 = v21;
        _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v67, 0x16u);
      }
      v23 = objc_msgSend(v11, "getSuperVectorWithEndPoint:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "bestEnd"));
      unint64_t v24 = v23;
      if (v23 && [v23 length])
      {
        v25 = 0;
      }
      else
      {
        double v26 = [NSString stringWithFormat:@"Failed to get valid supervector for %@ - Skipping...", *(void *)&v10];
        long long v27 = *v8;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v67 = 136315394;
          v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
          __int16 v69 = 2114;
          double v70 = v26;
          _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
        }
        long long v28 = [MEMORY[0x263F38028] sharedInstance];
        [v28 submitVoiceIdIssueReport:*MEMORY[0x263F38120]];

        long long v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v61 = *MEMORY[0x263F08320];
        double v62 = v26;
        v30 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v25 = [v29 errorWithDomain:@"com.apple.speakerrecognition" code:743 userInfo:v30];
      }
      v31 = (NSData *)[v24 copy];
      superVector = self->_superVector;
      self->_superVector = v31;

      self->_superVectorSize = [v24 length] >> 2;
      self->_processedAudioDurationMs = v58[3];
      id v14 = v25;
    }
    else
    {
      double v33 = [NSString stringWithFormat:@"%@ does not seem to contain trigger phrase - no triggerData", *(void *)&v10];
      v34 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
        __int16 v69 = 2114;
        double v70 = v33;
        _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
      }
      v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v63 = *MEMORY[0x263F08320];
      double v64 = v33;
      v36 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v14 = [v35 errorWithDomain:@"com.apple.speakerrecognition" code:742 userInfo:v36];
    }
  }
  else
  {
    double v15 = [NSString stringWithFormat:@"ERR: Too little audio %dms in %@ - Bailing out", v58[3], *(void *)&v10, v38, v39, v40, v41, v42, *(void *)&v43];
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
      __int16 v69 = 2114;
      double v70 = v15;
      _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
    }
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v65 = *MEMORY[0x263F08320];
    double v66 = v15;
    v18 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v14 = [v17 errorWithDomain:@"com.apple.speakerrecognition" code:751 userInfo:v18];
  }
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __66__SSRVoiceProfileRetrainerSAT__processAudioFile_withSATProcessor___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (*(void *)(a1 + 32))
  {
    id v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      float v21 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  }
  else if (a3)
  {
    float v11 = (float)*(unint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)(v11 / v12) * 1000.0);
    uint64_t v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      float v21 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]_block_invoke";
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %lu, calling endAudio: %@", buf, 0x20u);
    }
  }
  else
  {
    v16 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v17 = [v16 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v17 / v19;
    v18 = objc_msgSend(*(id *)(a1 + 48), "analyzeWavData:numSamples:", v16);
    if (v18) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v18);
    }
  }
}

- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5
{
  v109[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void *))a4;
  id v10 = a5;
  id v68 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v8 || ![v8 count])
  {
    uint64_t v16 = [NSString stringWithFormat:@"File Array is nil"];
    uint64_t v14 = (void *)v16;
    if (v10)
    {
      unint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v108 = *MEMORY[0x263F08320];
      v109[0] = v16;
      uint64_t v77 = [NSDictionary dictionaryWithObjects:v109 forKeys:&v108 count:1];
      v18 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 701);
      (*((void (**)(id, void *, void, void))v10 + 2))(v10, v18, 0, 0);
      goto LABEL_47;
    }
    goto LABEL_49;
  }
  comparativeModels = self->_comparativeModels;
  if (comparativeModels)
  {
    uint64_t v13 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:comparativeModels withConfigFile:self->_configFilePath withResourceFile:self->_resourceFilePath withOffsetsType:0 forRetraining:1];
    uint64_t v14 = v13;
    if (!v13 || ![v13 count])
    {
      unsigned int v19 = NSString;
      float v20 = self->_comparativeModels;
      float v21 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      uint64_t v77 = [v19 stringWithFormat:@"Cannot create comparative scorers from %@ on profile %@", v20, v21];

      __int16 v22 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
        __int16 v89 = 2114;
        v90 = v77;
        _os_log_error_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        if (!v10) {
          goto LABEL_48;
        }
      }
      else if (!v10)
      {
        goto LABEL_48;
      }
      uint64_t v23 = (void *)MEMORY[0x263F087E8];
      v106 = @"reason";
      v107 = v77;
      v18 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
      __int16 v24 = [v23 errorWithDomain:@"com.apple.speakerrecognition" code:755 userInfo:v18];
      (*((void (**)(id, void *, void, void))v10 + 2))(v10, v24, 0, 0);

      goto LABEL_47;
    }
    id v66 = v10;
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v65 = v14;
    [v15 addObjectsFromArray:v14];
  }
  else
  {
    id v66 = v10;
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v65 = 0;
  }
  id v76 = v15;
  [v15 addObject:self->_satScorer];
  uint64_t v25 = [SSRTriggerPhraseDetectorNDAPI alloc];
  uint64_t v26 = [(NSURL *)self->_configFilePath path];
  long long v27 = [(NSURL *)self->_resourceFilePath path];
  uint64_t v77 = [(SSRTriggerPhraseDetectorNDAPI *)v25 initWithConfigPath:v26 resourcePath:v27 phId:0];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v67 = v8;
  id obj = v8;
  uint64_t v28 = [obj countByEnumeratingWithState:&v81 objects:v105 count:16];
  if (!v28) {
    goto LABEL_44;
  }
  uint64_t v29 = v28;
  uint64_t v79 = *MEMORY[0x263F08320];
  uint64_t v80 = *(void *)v82;
  v74 = v9;
  v75 = v11;
  do
  {
    uint64_t v30 = 0;
    uint64_t v69 = v29;
    do
    {
      if (*(void *)v82 != v80) {
        objc_enumerationMutation(obj);
      }
      v31 = *(void **)(*((void *)&v81 + 1) + 8 * v30);
      v32 = (void *)MEMORY[0x21D4B2500]();
      double v33 = [v31 pathExtension];
      char v34 = [v33 isEqualToString:@"wav"];

      if (v34)
      {
        [(SSRTriggerPhraseDetectorNDAPI *)v77 reset];
        uint64_t v35 = [(SSRVoiceProfileRetrainerSAT *)self _processAudioFile:v31 withSATProcessor:v77];
        if (v35)
        {
          v36 = (void *)v35;
          v37 = [v31 path];
          [v11 setObject:v36 forKey:v37];
          goto LABEL_26;
        }
        v37 = [(SSRVoiceProfileRetrainerSAT *)self _processSuperVector:self->_superVector withSize:self->_superVectorSize withScorers:v76 processedAudioDurationMs:self->_processedAudioDurationMs];
        if (!v37)
        {
          uint64_t v53 = NSString;
          v54 = [v31 lastPathComponent];
          v55 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
          double v43 = [v53 stringWithFormat:@"Failed to get scorecard for utterance %@ on profile %@", v54, v55];

          id v56 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
            __int16 v89 = 2114;
            v90 = v43;
            _os_log_error_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
          }
          uint64_t v57 = (void *)MEMORY[0x263F087E8];
          v101 = @"reason";
          v102 = v43;
          v58 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
          v36 = [v57 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v58];

          uint64_t v59 = [v31 path];
          id v11 = v75;
          [v75 setObject:v36 forKey:v59];

          id v9 = v74;
          goto LABEL_25;
        }
        if (!v9 || (v9[2](v9, v31, v37), (uint64_t v44 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          double v43 = [(NSURL *)self->_satModelFilePath URLByDeletingLastPathComponent];
          v45 = (void *)*MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            log = v45;
            double v70 = [v31 lastPathComponent];
            [(NSURL *)self->_satModelFilePath lastPathComponent];
            v47 = v46 = v43;
            __int16 v71 = [(SSRTriggerPhraseDetectorNDAPI *)v46 lastPathComponent];
            v72 = [(SSRTriggerPhraseDetectorNDAPI *)v46 URLByDeletingLastPathComponent];
            uint64_t v48 = [v72 lastPathComponent];
            unint64_t v49 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
            *(_DWORD *)buf = 136316674;
            v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
            __int16 v89 = 2114;
            v90 = v70;
            __int16 v91 = 2114;
            v92 = v47;
            __int16 v93 = 2114;
            v94 = v71;
            __int16 v95 = 2114;
            uint64_t v96 = v48;
            v50 = (void *)v48;
            __int16 v97 = 2048;
            unint64_t v98 = v49;
            __int16 v99 = 2114;
            v100 = v37;
            _os_log_impl(&dword_21C8A5000, log, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %lu vector with scoreCard %{public}@", buf, 0x48u);

            id v9 = v74;
            double v43 = v46;
            uint64_t v29 = v69;
          }
          unint64_t v51 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
          [(SSRSpeakerRecognitionScorer *)self->_satScorer updateSAT];
          if ([(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount] - v51 == 1)
          {
            v52 = [v31 path];
            [v68 setObject:v37 forKey:v52];
            v36 = 0;
          }
          else
          {
            v52 = [NSString stringWithFormat:@"ERR: Reached max (%lu) of training utterances, Skipped SAT model update", -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount")];
            uint64_t v60 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
              __int16 v89 = 2114;
              v90 = v52;
              _os_log_error_impl(&dword_21C8A5000, v60, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }
            uint64_t v61 = (void *)MEMORY[0x263F087E8];
            uint64_t v85 = v79;
            v86 = v52;
            double v62 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
            v36 = [v61 errorWithDomain:@"com.apple.speakerrecognition" code:739 userInfo:v62];

            uint64_t v63 = [v31 path];
            [v75 setObject:v36 forKey:v63];

            id v9 = v74;
          }

          id v11 = v75;
          goto LABEL_25;
        }
        v36 = (void *)v44;
      }
      else
      {
        uint64_t v38 = NSString;
        uint64_t v39 = [v31 path];
        v37 = [v38 stringWithFormat:@"Invalid file format %@ ", v39];

        v40 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
          __int16 v89 = 2114;
          v90 = v37;
          _os_log_error_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        v41 = (void *)MEMORY[0x263F087E8];
        uint64_t v103 = v79;
        v104 = v37;
        id v42 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        v36 = [v41 errorWithDomain:@"com.apple.speakerrecognition" code:729 userInfo:v42];
      }
      double v43 = [v31 path];
      [v11 setObject:v36 forKey:v43];
LABEL_25:

LABEL_26:
      ++v30;
    }
    while (v29 != v30);
    uint64_t v64 = [obj countByEnumeratingWithState:&v81 objects:v105 count:16];
    uint64_t v29 = v64;
  }
  while (v64);
LABEL_44:

  id v10 = v66;
  if (v66) {
    (*((void (**)(id, void, id, id))v66 + 2))(v66, 0, v68, v11);
  }
  id v8 = v67;
  uint64_t v14 = v65;
  v18 = v76;
LABEL_47:

LABEL_48:
LABEL_49:
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  return 0;
}

- (void)purgeLastSpeakerEmbedding
{
  *(void *)&v15[13] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  v4 = (void *)*MEMORY[0x263F38100];
  if (v3)
  {
    uint64_t v5 = (v3 - 1);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      voiceProfile = self->_voiceProfile;
      id v7 = v4;
      id v8 = [(SSRVoiceProfile *)voiceProfile profileID];
      int v12 = 136315650;
      uint64_t v13 = "-[SSRVoiceProfileRetrainerSAT purgeLastSpeakerEmbedding]";
      __int16 v14 = 1026;
      *(_DWORD *)id v15 = v5;
      v15[2] = 2114;
      *(void *)&v15[3] = v8;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v12, 0x1Cu);
    }
    [(SSRSpeakerRecognitionScorer *)self->_satScorer deleteVectorAtIndex:v5];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    id v9 = self->_voiceProfile;
    id v10 = v4;
    id v11 = [(SSRVoiceProfile *)v9 profileID];
    int v12 = 136315394;
    uint64_t v13 = "-[SSRVoiceProfileRetrainerSAT purgeLastSpeakerEmbedding]";
    __int16 v14 = 2114;
    *(void *)id v15 = v11;
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (BOOL)implicitTrainingRequired
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
    int v7 = 136315650;
    id v8 = "-[SSRVoiceProfileRetrainerSAT implicitTrainingRequired]";
    __int16 v9 = 2050;
    unint64_t v10 = v3;
    __int16 v11 = 2050;
    unint64_t v12 = maximumSpeakerVectors;
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s satVectorCount %{public}ld maxCount %{public}ld", (uint8_t *)&v7, 0x20u);
  }
  return v3 < self->_maximumSpeakerVectors;
}

- (BOOL)needsRetrainingWithAudioFiles:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [(SSRVoiceProfile *)self->_voiceProfile voiceProfileBasePath];
  char v33 = 0;
  if (([v5 fileExistsAtPath:v6 isDirectory:&v33] & 1) == 0 && !v33)
  {
    int v7 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
      __int16 v36 = 2114;
      unint64_t v37 = (unint64_t)v6;
      __int16 v38 = 1026;
      LODWORD(v39) = 0;
      _os_log_error_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Cannot find SAT Audio dir at %{public}@: isDir: %{public}d - Bailing out", buf, 0x1Cu);
    }
    goto LABEL_5;
  }
  if (![(SSRSpeakerRecognitionScorer *)self->_satScorer satModelAvailable])
  {
    v18 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
    unsigned int v19 = "%s SATNeedsRetraining(YES): satModelAvailable is not available!!";
    float v20 = v18;
    uint32_t v21 = 12;
LABEL_15:
    _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_16;
  }
  __int16 v9 = [(NSURL *)self->_satModelFilePath path];
  char v10 = [v5 fileExistsAtPath:v9 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    __int16 v22 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    satModelFilePath = self->_satModelFilePath;
    *(_DWORD *)buf = 136315394;
    uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
    __int16 v36 = 2114;
    unint64_t v37 = (unint64_t)satModelFilePath;
    unsigned int v19 = "%s SATNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    float v20 = v22;
    uint32_t v21 = 22;
    goto LABEL_15;
  }
  unint64_t v11 = [v4 count];
  unint64_t v12 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  if ((CSIsCommunalDevice() & 1) == 0)
  {
    unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
    if (v11 > maximumSpeakerVectors || v12 == v11)
    {
      if (v11 <= maximumSpeakerVectors || v12 == maximumSpeakerVectors) {
        goto LABEL_9;
      }
      v31 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t spIdType = self->_spIdType;
        uint64_t v28 = v31;
        uint64_t v29 = +[SSRUtils stringForCSSpIdType:spIdType];
        *(_DWORD *)buf = 136316162;
        uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
        __int16 v36 = 2050;
        unint64_t v37 = v11;
        __int16 v38 = 2050;
        unint64_t v39 = v12;
        __int16 v40 = 2050;
        unint64_t v41 = maximumSpeakerVectors;
        __int16 v42 = 2114;
        double v43 = v29;
        uint64_t v30 = "%s SATNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v26 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v27 = self->_spIdType;
        uint64_t v28 = v26;
        uint64_t v29 = +[SSRUtils stringForCSSpIdType:v27];
        *(_DWORD *)buf = 136316162;
        uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
        __int16 v36 = 2050;
        unint64_t v37 = v11;
        __int16 v38 = 2050;
        unint64_t v39 = v12;
        __int16 v40 = 2050;
        unint64_t v41 = maximumSpeakerVectors;
        __int16 v42 = 2114;
        double v43 = v29;
        uint64_t v30 = "%s SATNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_26:
        _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x34u);
      }
    }
LABEL_16:
    BOOL v8 = 1;
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v13 = (void *)*MEMORY[0x263F38100];
  BOOL v8 = 0;
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_17;
  }
  unint64_t v14 = self->_maximumSpeakerVectors;
  unint64_t v15 = self->_spIdType;
  uint64_t v16 = v13;
  unint64_t v17 = +[SSRUtils stringForCSSpIdType:v15];
  *(_DWORD *)buf = 136316162;
  uint64_t v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
  __int16 v36 = 2050;
  unint64_t v37 = v11;
  __int16 v38 = 2050;
  unint64_t v39 = v12;
  __int16 v40 = 2050;
  unint64_t v41 = v14;
  __int16 v42 = 2114;
  double v43 = v17;
  _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s SATNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", buf, 0x34u);

LABEL_5:
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = +[SSRUtils stringForSpeakerRecognizerType:2];
  uint64_t v5 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  id v6 = [v3 stringWithFormat:@"{%@:%@}", v4, v5];

  return (NSString *)v6;
}

- (unint64_t)retrainerType
{
  return 1;
}

- (NSURL)modelFilePath
{
  return self->_satModelFilePath;
}

- (BOOL)resetModelForRetraining
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    satModelFilePath = self->_satModelFilePath;
    int v8 = 136315394;
    __int16 v9 = "-[SSRVoiceProfileRetrainerSAT resetModelForRetraining]";
    __int16 v10 = 2114;
    unint64_t v11 = satModelFilePath;
    _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v4 = [(NSURL *)self->_satModelFilePath path];
  id v5 = +[SSRUtils removeItemAtPath:v4];

  return [(SSRSpeakerRecognitionScorer *)self->_satScorer resetScorerWithModelFilePath:self->_satModelFilePath];
}

- (SSRVoiceProfileRetrainerSAT)initWithVoiceRetrainingContext:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SSRVoiceProfileRetrainerSAT;
  id v5 = [(SSRVoiceProfileRetrainerSAT *)&v39 init];
  if (!v5) {
    goto LABEL_9;
  }
  id v6 = [v4 modelsContext];
  int v7 = +[SSRUtils stringForSpeakerRecognizerType:2];
  int v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    char v34 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      char v33 = 0;
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
    uint64_t v35 = "%s SATModel Retraining context is nil! - Skipping";
LABEL_16:
    _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
    goto LABEL_13;
  }
  if ([v4 forceRetrain])
  {
    __int16 v9 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      unint64_t v37 = v9;
      __int16 v38 = [v8 voiceProfileModelFilePath];
      *(_DWORD *)buf = 136315394;
      unint64_t v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
      __int16 v42 = 2114;
      double v43 = v38;
      _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", buf, 0x16u);
    }
    __int16 v10 = [v8 voiceProfileModelFilePath];
    unint64_t v11 = [v10 path];
    id v12 = +[SSRUtils removeItemAtPath:v11];
  }
  uint64_t v13 = [SSRSpeakerRecognitionScorer alloc];
  unint64_t v14 = [v4 voiceProfile];
  unint64_t v15 = [v14 profileID];
  uint64_t v16 = [v8 voiceProfileModelFilePath];
  unint64_t v17 = [v8 configFilePath];
  v18 = [v4 resourceFilePath];
  uint64_t v19 = [(SSRSpeakerRecognitionScorer *)v13 initWithProfileID:v15 withModelFile:v16 withConfigFile:v17 withResourceFile:v18 withOffsetsType:0 forRetraining:1];
  satScorer = v5->_satScorer;
  v5->_satScorer = (SSRSpeakerRecognitionScorer *)v19;

  if (!v5->_satScorer)
  {
    char v34 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
    uint64_t v35 = "%s ERR: Cannot create SAT Scorer";
    goto LABEL_16;
  }
  dispatch_queue_t v21 = dispatch_queue_create("com.apple.corespeech.speakerretrain.satq", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v21;

  uint64_t v23 = [v8 configFilePath];
  configFilePath = v5->_configFilePath;
  v5->_configFilePath = (NSURL *)v23;

  uint64_t v25 = [v4 resourceFilePath];
  resourceFilePath = v5->_resourceFilePath;
  v5->_resourceFilePath = (NSURL *)v25;

  uint64_t v27 = [v8 voiceProfileModelFilePath];
  satModelFilePath = v5->_satModelFilePath;
  v5->_satModelFilePath = (NSURL *)v27;

  uint64_t v29 = [v4 voiceProfile];
  voiceProfile = v5->_voiceProfile;
  v5->_voiceProfile = (SSRVoiceProfile *)v29;

  uint64_t v31 = [v8 compareModelFilePaths];
  comparativeModels = v5->_comparativeModels;
  v5->_comparativeModels = (NSDictionary *)v31;

  v5->_unint64_t maximumSpeakerVectors = [v4 maxAllowedSpeakerVectors];
  v5->_unint64_t spIdType = [v4 spIdType];

LABEL_9:
  char v33 = v5;
LABEL_14:

  return v33;
}

@end