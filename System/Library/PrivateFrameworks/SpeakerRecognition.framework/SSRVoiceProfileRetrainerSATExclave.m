@interface SSRVoiceProfileRetrainerSATExclave
- (BOOL)implicitTrainingRequired;
- (BOOL)needsRetrainingWithAudioFiles:(id)a3;
- (BOOL)resetModelForRetraining;
- (NSData)speakerVector;
- (NSDictionary)comparativeModels;
- (NSString)configVersion;
- (NSString)description;
- (NSURL)configFilePath;
- (NSURL)modelFilePath;
- (NSURL)resourceFilePath;
- (NSURL)satModelFilePath;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionScorer)satScorer;
- (SSRVoiceProfile)voiceProfile;
- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3;
- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4 secureSpeakerRecognitionConfig:(id)a5;
- (SSRVoiceProfileRetrainingContext)ctx;
- (SecureAsset)asset;
- (SecureSpeakerRecognitionConfig)speakerRecognitionConfig;
- (float)bestTriggerScore;
- (id)_processAudioFile:(id)a3;
- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6;
- (id)purgeConfusionInformationWithPolicy:(id)a3;
- (unint64_t)currUttLengthInMs;
- (unint64_t)maximumSpeakerVectors;
- (unint64_t)processedAudioDurationMs;
- (unint64_t)retrainerType;
- (unint64_t)spIdType;
- (unint64_t)speakerVectorSize;
- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)purgeLastSpeakerEmbedding;
- (void)setAsset:(id)a3;
- (void)setBestTriggerScore:(float)a3;
- (void)setComparativeModels:(id)a3;
- (void)setConfigFilePath:(id)a3;
- (void)setConfigVersion:(id)a3;
- (void)setCtx:(id)a3;
- (void)setCurrUttLengthInMs:(unint64_t)a3;
- (void)setMaximumSpeakerVectors:(unint64_t)a3;
- (void)setProcessedAudioDurationMs:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setSatModelFilePath:(id)a3;
- (void)setSatScorer:(id)a3;
- (void)setSpIdType:(unint64_t)a3;
- (void)setSpeakerRecognitionConfig:(id)a3;
- (void)setSpeakerVector:(id)a3;
- (void)setSpeakerVectorSize:(unint64_t)a3;
- (void)setVoiceProfile:(id)a3;
@end

@implementation SSRVoiceProfileRetrainerSATExclave

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakerRecognitionConfig, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_satModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_satScorer, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_ctx, 0);
}

- (void)setSpeakerRecognitionConfig:(id)a3
{
}

- (SecureSpeakerRecognitionConfig)speakerRecognitionConfig
{
  return self->_speakerRecognitionConfig;
}

- (void)setBestTriggerScore:(float)a3
{
  self->_bestTriggerScore = a3;
}

- (float)bestTriggerScore
{
  return self->_bestTriggerScore;
}

- (void)setMaximumSpeakerVectors:(unint64_t)a3
{
  self->_maximumSpeakerVectors = a3;
}

- (unint64_t)maximumSpeakerVectors
{
  return self->_maximumSpeakerVectors;
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

- (void)setSpeakerVectorSize:(unint64_t)a3
{
  self->_speakerVectorSize = a3;
}

- (unint64_t)speakerVectorSize
{
  return self->_speakerVectorSize;
}

- (void)setSpeakerVector:(id)a3
{
}

- (NSData)speakerVector
{
  return self->_speakerVector;
}

- (void)setCurrUttLengthInMs:(unint64_t)a3
{
  self->_currUttLengthInMs = a3;
}

- (unint64_t)currUttLengthInMs
{
  return self->_currUttLengthInMs;
}

- (void)setComparativeModels:(id)a3
{
}

- (NSDictionary)comparativeModels
{
  return self->_comparativeModels;
}

- (void)setSatModelFilePath:(id)a3
{
}

- (NSURL)satModelFilePath
{
  return self->_satModelFilePath;
}

- (void)setConfigVersion:(id)a3
{
}

- (NSString)configVersion
{
  return self->_configVersion;
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

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (unint64_t)spIdType
{
  return self->_spIdType;
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

- (void)setAsset:(id)a3
{
}

- (SecureAsset)asset
{
  return (SecureAsset *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCtx:(id)a3
{
}

- (SSRVoiceProfileRetrainingContext)ctx
{
  return (SSRVoiceProfileRetrainingContext *)objc_getProperty(self, a2, 24, 1);
}

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
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
        objc_msgSend(v16, "scoreSpeakerVector:withDimensions:withThresholdType:", v8, a4, 0, v24);
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

- (id)_processAudioFile:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F38100];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_bestTriggerScore = -1.0;
  nd_reset();
  self->_currUttLengthInMs = 0xFFFFFFFFLL;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5731;
  v45 = __Block_byref_object_dispose__5732;
  id v46 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3810000000;
  v58 = &unk_21C951DDD;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __56__SSRVoiceProfileRetrainerSATExclave__processAudioFile___block_invoke;
  uint64_t v33 = &unk_2644299E0;
  double v7 = COERCE_DOUBLE(v4);
  double v34 = v7;
  v35 = self;
  v36 = &v41;
  v37 = v40;
  v38 = buf;
  +[SSRUtils streamAudioFromFileUrl:*(void *)&v7 audioStreamBasicDescriptor:v39 samplesPerStreamChunk:640 audioDataAvailableHandler:&v30];
  id v8 = (void *)v42[5];
  if (v8)
  {
    id v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315650;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      __int16 v53 = 2114;
      double v54 = v7;
      __int16 v55 = 2114;
      unint64_t v56 = (unint64_t)v8;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v51, 0x20u);
      id v8 = (void *)v42[5];
    }
    id v10 = v8;
  }
  else if (self->_currUttLengthInMs > 0xC7)
  {
    float v15 = *(float *)(*(void *)&buf[8] + 48);
    self->_bestTriggerScore = v15;
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      __int16 v53 = 2050;
      double v54 = v15;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v51, 0x16u);
    }
    uint64_t v17 = nd_getsupervector();
    if (v17)
    {
      v18 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)v17 length:4 * *(unsigned int *)(v17 + 8)];
      speakerVector = self->_speakerVector;
      self->_speakerVector = v18;

      unint64_t v20 = [(NSData *)self->_speakerVector length] >> 2;
      self->_speakerVectorSize = v20;
      v21 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        long long v29 = self->_speakerVector;
        *(_DWORD *)v51 = 136315651;
        v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
        __int16 v53 = 2113;
        double v54 = *(double *)&v29;
        __int16 v55 = 2048;
        unint64_t v56 = v20;
        _os_log_debug_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEBUG, "%s SpeakerVector: %{private}@ [dimension=%ld]", v51, 0x20u);
      }
      id v10 = 0;
      self->_processedAudioDurationMs = self->_currUttLengthInMs;
    }
    else
    {
      double v22 = [NSString stringWithFormat:@"Failed to get valid supervector for %@ - Skipping...", *(void *)&v7];
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v47 = *MEMORY[0x263F08320];
      double v48 = v22;
      unint64_t v24 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v25 = [v23 errorWithDomain:@"com.apple.speakerrecognition" code:743 userInfo:v24];

      long long v26 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v51 = 136315394;
        v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
        __int16 v53 = 2114;
        double v54 = v22;
        _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@", v51, 0x16u);
      }
      long long v27 = [MEMORY[0x263F38028] sharedInstance];
      [v27 submitVoiceIdIssueReport:*MEMORY[0x263F38120]];

      id v10 = v25;
    }
  }
  else
  {
    double v11 = [NSString stringWithFormat:@"ERR: Too little audio %dms in %@ - Bailing out", self->_currUttLengthInMs, *(void *)&v7, v30, v31, v32, v33];
    uint64_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      __int16 v53 = 2114;
      double v54 = v11;
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", v51, 0x16u);
    }
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    double v50 = v11;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v10 = [v13 errorWithDomain:@"com.apple.speakerrecognition" code:751 userInfo:v14];
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);

  return v10;
}

void __56__SSRVoiceProfileRetrainerSATExclave__processAudioFile___block_invoke(void *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v8)
  {
    id v9 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 136315394;
      unint64_t v24 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
  else if (a3)
  {
    float v11 = (float)*(unint64_t *)(*(void *)(a1[7] + 8) + 24);
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    *(void *)(a1[5] + 104) = (unint64_t)(float)((float)(v11 / v12) * 1000.0);
    uint64_t v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[4];
      uint64_t v15 = *(void *)(a1[5] + 104);
      *(_DWORD *)buf = 136315650;
      unint64_t v24 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]_block_invoke";
      __int16 v25 = 2050;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", buf, 0x20u);
    }
  }
  else
  {
    v16 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v17 = [v16 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    *(void *)(*(void *)(a1[7] + 8) + 24) += v17 / v22;
    id v18 = v16;
    [v18 bytes];
    nd_wavedata();
    uint64_t v19 = nd_getresults();
    if (v19)
    {
      uint64_t v20 = *(void *)(a1[8] + 8);
      long long v21 = *(_OWORD *)v19;
      *(void *)(v20 + 48) = *(void *)(v19 + 16);
      *(_OWORD *)(v20 + 32) = v21;
    }
  }
}

- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5
{
  v96[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void *))a4;
  id v10 = a5;
  float v11 = (void *)MEMORY[0x21D4B2500]();
  id v61 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v66 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v8 && [v8 count])
  {
    v57 = v11;
    id v58 = v10;
    id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v67 addObject:self->_satScorer];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v59 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v94 count:16];
    uint64_t v13 = v66;
    if (!v12) {
      goto LABEL_34;
    }
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v71;
    uint64_t v69 = *MEMORY[0x263F08320];
    v65 = v9;
    uint64_t v60 = *(void *)v71;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v71 != v15) {
          objc_enumerationMutation(obj);
        }
        unint64_t v17 = *(void **)(*((void *)&v70 + 1) + 8 * v16);
        id v18 = [v17 pathExtension];
        char v19 = [v18 isEqualToString:@"wav"];

        if (v19)
        {
          uint64_t v20 = [(SSRVoiceProfileRetrainerSATExclave *)self _processAudioFile:v17];
          if (v20)
          {
            long long v21 = (void *)v20;
            unsigned int v22 = [v17 path];
            [v13 setObject:v21 forKey:v22];
            goto LABEL_16;
          }
          unsigned int v22 = [(SSRVoiceProfileRetrainerSATExclave *)self _processSpeakerVector:self->_speakerVector withSize:self->_speakerVectorSize withScorers:v67 processedAudioDurationMs:self->_processedAudioDurationMs];
          if (!v22)
          {
            v38 = NSString;
            v39 = [v17 lastPathComponent];
            v40 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
            uint64_t v28 = [v38 stringWithFormat:@"Failed to get scorecard for utterance %@ on profile %@", v39, v40];

            uint64_t v41 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
              __int16 v78 = 2114;
              v79 = v28;
              _os_log_error_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
            }
            v42 = (void *)MEMORY[0x263F087E8];
            v90 = @"reason";
            v91 = v28;
            uint64_t v43 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
            long long v21 = [v42 errorWithDomain:@"com.apple.speakerrecognition" code:755 userInfo:v43];

            v44 = [v17 path];
            uint64_t v13 = v66;
            [v66 setObject:v21 forKey:v44];

            id v9 = v65;
            goto LABEL_15;
          }
          if (!v9 || (v9[2](v9, v17, v22), (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            uint64_t v28 = [(NSURL *)self->_satModelFilePath URLByDeletingLastPathComponent];
            uint64_t v30 = (void *)*MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              log = v30;
              uint64_t v62 = [v17 lastPathComponent];
              uint64_t v31 = [(NSURL *)self->_satModelFilePath lastPathComponent];
              v32 = [v28 lastPathComponent];
              uint64_t v33 = [v28 URLByDeletingLastPathComponent];
              [v33 lastPathComponent];
              double v34 = v63 = v28;
              unint64_t v35 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
              *(_DWORD *)buf = 136316674;
              v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
              __int16 v78 = 2114;
              v79 = v62;
              __int16 v80 = 2114;
              v81 = v31;
              __int16 v82 = 2114;
              v83 = v32;
              __int16 v84 = 2114;
              v85 = v34;
              __int16 v86 = 2050;
              unint64_t v87 = v35;
              __int16 v88 = 2114;
              v89 = v22;
              _os_log_impl(&dword_21C8A5000, log, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %{public}lu vector with scoreCard %{public}@", buf, 0x48u);

              uint64_t v15 = v60;
              uint64_t v28 = v63;

              id v9 = v65;
            }
            unint64_t v36 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
            [(SSRSpeakerRecognitionScorer *)self->_satScorer updateSAT];
            if ([(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount] - v36 == 1)
            {
              v37 = [v17 path];
              [v61 setObject:v22 forKey:v37];
              long long v21 = 0;
            }
            else
            {
              v37 = [NSString stringWithFormat:@"ERR: Reached max (%lu) of training utterances, Skipped SAT model update", -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount")];
              v45 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
                __int16 v78 = 2114;
                v79 = v37;
                _os_log_error_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
              }
              id v46 = (void *)MEMORY[0x263F087E8];
              uint64_t v74 = v69;
              v75 = v37;
              uint64_t v47 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
              long long v21 = [v46 errorWithDomain:@"com.apple.speakerrecognition" code:739 userInfo:v47];

              double v48 = [v17 path];
              [v66 setObject:v21 forKey:v48];

              id v9 = v65;
            }

            uint64_t v13 = v66;
            goto LABEL_15;
          }
          long long v21 = (void *)v29;
        }
        else
        {
          v23 = NSString;
          unint64_t v24 = [v17 path];
          unsigned int v22 = [v23 stringWithFormat:@"Invalid file format %@ ", v24];

          __int16 v25 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
            __int16 v78 = 2114;
            v79 = v22;
            _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
          }
          uint64_t v26 = (void *)MEMORY[0x263F087E8];
          uint64_t v92 = v69;
          v93 = v22;
          __int16 v27 = [NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          long long v21 = [v26 errorWithDomain:@"com.apple.speakerrecognition" code:729 userInfo:v27];
        }
        uint64_t v28 = [v17 path];
        [v13 setObject:v21 forKey:v28];
LABEL_15:

LABEL_16:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v49 = [obj countByEnumeratingWithState:&v70 objects:v94 count:16];
      uint64_t v14 = v49;
      if (!v49)
      {
LABEL_34:

        voiceProfile = self->_voiceProfile;
        v51 = [(NSURL *)self->_satModelFilePath absoluteString];
        [(SSRVoiceProfile *)voiceProfile updateVoiceProfilePathExclave:v51];

        id v10 = v58;
        if (v58) {
          (*((void (**)(id, void, id, id))v58 + 2))(v58, 0, v61, v66);
        }
        id v8 = v59;
        float v11 = v57;
        v52 = v67;
        goto LABEL_39;
      }
    }
  }
  uint64_t v53 = [NSString stringWithFormat:@"File Array is nil"];
  v52 = (void *)v53;
  if (v10)
  {
    double v54 = (void *)MEMORY[0x263F087E8];
    uint64_t v95 = *MEMORY[0x263F08320];
    v96[0] = v53;
    __int16 v55 = [NSDictionary dictionaryWithObjects:v96 forKeys:&v95 count:1];
    unint64_t v56 = [v54 errorWithDomain:@"com.apple.speakerrecognition" code:701 userInfo:v55];
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v56, 0, 0);
  }
LABEL_39:
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  return 0;
}

- (void)purgeLastSpeakerEmbedding
{
  *(void *)&v15[13] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  id v4 = (void *)*MEMORY[0x263F38100];
  if (v3)
  {
    uint64_t v5 = (v3 - 1);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      voiceProfile = self->_voiceProfile;
      double v7 = v4;
      id v8 = [(SSRVoiceProfile *)voiceProfile profileID];
      int v12 = 136315650;
      uint64_t v13 = "-[SSRVoiceProfileRetrainerSATExclave purgeLastSpeakerEmbedding]";
      __int16 v14 = 1026;
      *(_DWORD *)uint64_t v15 = v5;
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
    float v11 = [(SSRVoiceProfile *)v9 profileID];
    int v12 = 136315394;
    uint64_t v13 = "-[SSRVoiceProfileRetrainerSATExclave purgeLastSpeakerEmbedding]";
    __int16 v14 = 2114;
    *(void *)uint64_t v15 = v11;
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (BOOL)implicitTrainingRequired
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
    int v7 = 136315650;
    id v8 = "-[SSRVoiceProfileRetrainerSATExclave implicitTrainingRequired]";
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
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(SSRSpeakerRecognitionScorer *)self->_satScorer satModelAvailable])
  {
    uint64_t v16 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v31 = 136315138;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    unint64_t v17 = "%s SATNeedsRetraining(YES): satModelAvailable is not available!!";
    id v18 = v16;
    uint32_t v19 = 12;
LABEL_10:
    _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v31, v19);
    goto LABEL_11;
  }
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [(NSURL *)self->_satModelFilePath path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

  if ((v7 & 1) == 0)
  {
    uint64_t v20 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    satModelFilePath = self->_satModelFilePath;
    int v31 = 136315394;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    __int16 v33 = 2114;
    unint64_t v34 = (unint64_t)satModelFilePath;
    unint64_t v17 = "%s SATNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    id v18 = v20;
    uint32_t v19 = 22;
    goto LABEL_10;
  }
  unint64_t v8 = [v4 count];
  unint64_t v9 = [(SSRSpeakerRecognitionScorer *)self->_satScorer getSATVectorCount];
  if (CSIsCommunalDevice()) {
    goto LABEL_4;
  }
  unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v8 <= maximumSpeakerVectors && v9 != v8)
  {
    unint64_t v24 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t spIdType = self->_spIdType;
      uint64_t v26 = v24;
      __int16 v27 = +[SSRUtils stringForCSSpIdType:spIdType];
      int v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
      __int16 v33 = 2050;
      unint64_t v34 = v8;
      __int16 v35 = 2050;
      unint64_t v36 = v9;
      __int16 v37 = 2050;
      unint64_t v38 = maximumSpeakerVectors;
      __int16 v39 = 2114;
      v40 = v27;
      uint64_t v28 = "%s SATNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_21:
      _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v31, 0x34u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v8 > maximumSpeakerVectors && v9 != maximumSpeakerVectors)
  {
    uint64_t v29 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v30 = self->_spIdType;
      uint64_t v26 = v29;
      __int16 v27 = +[SSRUtils stringForCSSpIdType:v30];
      int v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
      __int16 v33 = 2050;
      unint64_t v34 = v8;
      __int16 v35 = 2050;
      unint64_t v36 = v9;
      __int16 v37 = 2050;
      unint64_t v38 = maximumSpeakerVectors;
      __int16 v39 = 2114;
      v40 = v27;
      uint64_t v28 = "%s SATNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
      goto LABEL_21;
    }
LABEL_11:
    BOOL v11 = 1;
    goto LABEL_12;
  }
LABEL_4:
  unint64_t v10 = (void *)*MEMORY[0x263F38100];
  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = self->_maximumSpeakerVectors;
    unint64_t v13 = self->_spIdType;
    __int16 v14 = v10;
    uint64_t v15 = +[SSRUtils stringForCSSpIdType:v13];
    int v31 = 136316162;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    __int16 v33 = 2050;
    unint64_t v34 = v8;
    __int16 v35 = 2050;
    unint64_t v36 = v9;
    __int16 v37 = 2050;
    unint64_t v38 = v12;
    __int16 v39 = 2114;
    v40 = v15;
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s SATNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", (uint8_t *)&v31, 0x34u);

    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = +[SSRUtils stringForSpeakerRecognizerType:2];
  uint64_t v5 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  v6 = [v3 stringWithFormat:@"{%@:%@:%@:%@}", v4, v5, self->_satModelFilePath, self->_asset];

  return (NSString *)v6;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_novDetector)
  {
    nd_close();
    self->_novDetector = 0;
  }
  unint64_t v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRVoiceProfileRetrainerSATExclave dealloc]";
    __int16 v7 = 2114;
    unint64_t v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerSATExclave;
  [(SSRVoiceProfileRetrainerSATExclave *)&v4 dealloc];
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
    uint64_t v9 = "-[SSRVoiceProfileRetrainerSATExclave resetModelForRetraining]";
    __int16 v10 = 2114;
    BOOL v11 = satModelFilePath;
    _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_super v4 = [(NSURL *)self->_satModelFilePath path];
  id v5 = +[SSRUtils removeItemAtPath:v4];

  return [(SSRSpeakerRecognitionScorer *)self->_satScorer resetScorerWithModelFilePath:self->_satModelFilePath];
}

- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3
{
  return [(SSRVoiceProfileRetrainerSATExclave *)self initWithVoiceRetrainingContext:0 secureAsset:0 secureSpeakerRecognitionConfig:0];
}

- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4 secureSpeakerRecognitionConfig:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = 0;
  if (v9 && v10)
  {
    v65.receiver = self;
    v65.super_class = (Class)SSRVoiceProfileRetrainerSATExclave;
    self = [(SSRVoiceProfileRetrainerSATExclave *)&v65 init];
    if (!self) {
      goto LABEL_39;
    }
    SSRLogInitIfNeeded();
    objc_storeStrong((id *)&self->_asset, a4);
    objc_storeStrong((id *)&self->_ctx, a3);
    unint64_t v13 = [v9 modelsContext];
    __int16 v14 = +[SSRUtils stringForSpeakerRecognizerType:2];
    id v61 = [v13 objectForKeyedSubscript:v14];

    if (v61)
    {
      if (self->_asset)
      {
        p_speakerRecognitionConfig = &self->_speakerRecognitionConfig;
        objc_storeStrong((id *)&self->_speakerRecognitionConfig, a5);
        uint64_t v15 = [(SecureSpeakerRecognitionConfig *)self->_speakerRecognitionConfig satMemoryIndex];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          uint64_t v41 = *MEMORY[0x263F37FA0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpe"
                               "akerRecognitionConfig:]";
          v42 = "%s Secure Speaker detector memory index is nil - Skipping";
        }
        else
        {
          unint64_t v17 = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig satConfigString];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            uint64_t v41 = *MEMORY[0x263F37FA0];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_32;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureS"
                                 "peakerRecognitionConfig:]";
            v42 = "%s Secure Speaker detector config is nil - Skipping";
          }
          else
          {
            if ([v9 forceRetrain])
            {
              uint32_t v19 = (void *)*MEMORY[0x263F37FA0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = v19;
                long long v21 = [v61 secureProfileModelFilePath];
                *(_DWORD *)buf = 136315394;
                *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:sec"
                                     "ureSpeakerRecognitionConfig:]";
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v21;
                _os_log_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);
              }
              unsigned int v22 = [v61 secureProfileModelFilePath];
              v23 = [v22 path];
              id v24 = +[SSRUtils removeItemAtPath:v23];
            }
            __int16 v25 = [SSRSpeakerRecognitionScorer alloc];
            uint64_t v26 = [v9 voiceProfile];
            __int16 v27 = [v26 profileID];
            uint64_t v28 = [v61 secureProfileModelFilePath];
            uint64_t v29 = [(SecureSpeakerRecognitionConfig *)self->_speakerRecognitionConfig satConfigString];
            unint64_t v30 = [(SecureSpeakerRecognitionConfig *)self->_speakerRecognitionConfig satMemoryIndex];
            LOBYTE(v59) = 1;
            int v31 = [(SSRSpeakerRecognitionScorer *)v25 initWithProfileID:v27 withModelFile:v28 withConfigFile:0 withResourceFile:0 configData:v29 memoryIndex:v30 withOffsetsType:0 forRetraining:v59];
            satScorer = self->_satScorer;
            self->_satScorer = v31;

            if (self->_satScorer)
            {
              __int16 v33 = (void *)nd_create();
              self->_novDetector = v33;
              if (v33)
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000;
                char v71 = 1;
                unint64_t v34 = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig satMemoryIndex];
                __int16 v35 = [v34 memoryIndexes];
                v62[0] = MEMORY[0x263EF8330];
                v62[1] = 3221225472;
                v62[2] = __112__SSRVoiceProfileRetrainerSATExclave_initWithVoiceRetrainingContext_secureAsset_secureSpeakerRecognitionConfig___block_invoke;
                v62[3] = &unk_2644299B8;
                v64 = buf;
                unint64_t v36 = self;
                v63 = v36;
                [v35 enumerateKeysAndObjectsUsingBlock:v62];

                if (!*(unsigned char *)(*(void *)&buf[8] + 24))
                {
                  uint64_t v43 = *MEMORY[0x263F38100];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)id v66 = 136315138;
                    id v67 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerR"
                          "ecognitionConfig:]";
                    _os_log_error_impl(&dword_21C8A5000, v43, OS_LOG_TYPE_ERROR, "%s ERR: Cannot create SAT nd detector", v66, 0xCu);
                  }
                  goto LABEL_35;
                }
                id v37 = [(SecureSpeakerRecognitionConfig *)self->_speakerRecognitionConfig satConfigString];
                [v37 cStringUsingEncoding:4];
                int v38 = nd_initialize();

                __int16 v39 = *MEMORY[0x263F38100];
                if (v38)
                {
                  v40 = v39;
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v58 = nd_error();
                    *(_DWORD *)id v66 = 136315394;
                    id v67 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerR"
                          "ecognitionConfig:]";
                    __int16 v68 = 2080;
                    uint64_t v69 = v58;
                    _os_log_error_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_ERROR, "%s Failed to initialize nov detector with error %s", v66, 0x16u);
                  }

LABEL_35:
                  _Block_object_dispose(buf, 8);
                  goto LABEL_32;
                }
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)id v66 = 136315138;
                  id v67 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerRec"
                        "ognitionConfig:]";
                  _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_INFO, "%s Successfully created nov detector", v66, 0xCu);
                }

                _Block_object_dispose(buf, 8);
                dispatch_queue_t v44 = dispatch_queue_create("com.apple.corespeech.speakerretrain.secure.satq", 0);
                queue = v36->_queue;
                v36->_queue = (OS_dispatch_queue *)v44;

                uint64_t v46 = [v61 configFilePath];
                configFilePath = v36->_configFilePath;
                v36->_configFilePath = (NSURL *)v46;

                uint64_t v48 = [v9 resourceFilePath];
                resourceFilePath = v36->_resourceFilePath;
                v36->_resourceFilePath = (NSURL *)v48;

                uint64_t v50 = [v61 secureProfileModelFilePath];
                satModelFilePath = v36->_satModelFilePath;
                v36->_satModelFilePath = (NSURL *)v50;

                uint64_t v52 = [v9 voiceProfile];
                voiceProfile = v36->_voiceProfile;
                v36->_voiceProfile = (SSRVoiceProfile *)v52;

                comparativeModels = v36->_comparativeModels;
                v36->_comparativeModels = 0;

                v36->_unint64_t maximumSpeakerVectors = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig maxEnrollmentUtterances];
                uint64_t v55 = [v9 configVersion];
                configVersion = v36->_configVersion;
                v36->_configVersion = (NSString *)v55;

                v36->_unint64_t spIdType = [v9 spIdType];
LABEL_39:
                self = self;
                uint64_t v12 = self;
                goto LABEL_40;
              }
              uint64_t v41 = *MEMORY[0x263F37FA0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:sec"
                                     "ureSpeakerRecognitionConfig:]";
                v42 = "%s Secure Speaker detector failed to create nov detector.";
                goto LABEL_31;
              }
LABEL_32:

              uint64_t v12 = 0;
              goto LABEL_40;
            }
            uint64_t v41 = *MEMORY[0x263F37FA0];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_32;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureS"
                                 "peakerRecognitionConfig:]";
            v42 = "%s ERR: Cannot create SAT Scorer";
          }
        }
      }
      else
      {
        uint64_t v41 = *MEMORY[0x263F37FA0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeak"
                             "erRecognitionConfig:]";
        v42 = "%s SATModel Retraining asset is nil! - Skipping";
      }
    }
    else
    {
      uint64_t v41 = *MEMORY[0x263F37FA0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeaker"
                           "RecognitionConfig:]";
      v42 = "%s SATModel Retraining context is nil! - Skipping";
    }
LABEL_31:
    _os_log_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
    goto LABEL_32;
  }
LABEL_40:

  return v12;
}

void __112__SSRVoiceProfileRetrainerSATExclave_initWithVoiceRetrainingContext_secureAsset_secureSpeakerRecognitionConfig___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v9 = v7;
    [v9 cStringUsingEncoding:4];
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    if (nd_addresource())
    {
      id v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
      {
        int v12 = 136315395;
        unint64_t v13 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerRecognitionCo"
              "nfig:]_block_invoke";
        __int16 v14 = 2113;
        id v15 = v9;
        _os_log_debug_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEBUG, "%s Failed to add resource %{private}@", (uint8_t *)&v12, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

@end