@interface SSRVoiceProfileRetrainerPSRExclave
- (BOOL)implicitTrainingRequired;
- (BOOL)needsRetrainingWithAudioFiles:(id)a3;
- (BOOL)resetModelForRetraining;
- (NSData)speakerVector;
- (NSDictionary)comparativeModels;
- (NSString)configVersion;
- (NSString)description;
- (NSURL)configFilePath;
- (NSURL)modelFilePath;
- (NSURL)psrModelFilePath;
- (NSURL)resourceFilePath;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionScorer)psrScorer;
- (SSRVoiceProfile)voiceProfile;
- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3;
- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4 secureSpeakerRecognitionConfig:(id)a5;
- (SSRVoiceProfileRetrainingContext)ctx;
- (SecureAsset)asset;
- (SecureSpeakerRecognitionConfig)speakerRecognitionConfig;
- (float)bestTriggerScore;
- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4;
- (id)_logSpeakerConfusion:(id)a3 forProfileArray:(id)a4 withPrependString:(id)a5;
- (id)_processAudioFile:(id)a3;
- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6;
- (id)purgeConfusionInformationWithPolicy:(id)a3;
- (unint64_t)currUttLengthInMs;
- (unint64_t)maximumSpeakerVectors;
- (unint64_t)processedAudioDurationMs;
- (unint64_t)retrainerType;
- (unint64_t)spIdType;
- (unint64_t)speakerVectorSize;
- (void)_logSpeakerConfusionWithExplicitScores:(id)a3 withImplicitScores:(id)a4 withPurgeUtterances:(unint64_t)a5 forProfile:(id)a6 forConfigVersion:(id)a7;
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
- (void)setPsrModelFilePath:(id)a3;
- (void)setPsrScorer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setSpIdType:(unint64_t)a3;
- (void)setSpeakerRecognitionConfig:(id)a3;
- (void)setSpeakerVector:(id)a3;
- (void)setSpeakerVectorSize:(unint64_t)a3;
- (void)setVoiceProfile:(id)a3;
@end

@implementation SSRVoiceProfileRetrainerPSRExclave

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakerRecognitionConfig, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_psrModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_psrScorer, 0);
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

- (void)setPsrModelFilePath:(id)a3
{
}

- (NSURL)psrModelFilePath
{
  return self->_psrModelFilePath;
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

- (void)setPsrScorer:(id)a3
{
}

- (SSRSpeakerRecognitionScorer)psrScorer
{
  return self->_psrScorer;
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
  v30[0] = @"spIdKnownUserPSRScores";
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
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F38100];
  v6 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_bestTriggerScore = -1.0;
  nd_reset();
  self->_unint64_t currUttLengthInMs = 0xFFFFFFFFLL;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1351;
  v42 = __Block_byref_object_dispose__1352;
  id v43 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3810000000;
  v55 = &unk_21C951DDD;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  long long v29 = __56__SSRVoiceProfileRetrainerPSRExclave__processAudioFile___block_invoke;
  v30 = &unk_2644299E0;
  double v7 = COERCE_DOUBLE(v4);
  double v31 = v7;
  v32 = self;
  uint64_t v33 = &v38;
  v34 = v37;
  v35 = buf;
  +[SSRUtils streamAudioFromFileUrl:*(void *)&v7 audioStreamBasicDescriptor:v36 samplesPerStreamChunk:640 audioDataAvailableHandler:&v27];
  id v8 = (void *)v39[5];
  if (v8)
  {
    id v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315650;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      __int16 v50 = 2114;
      double v51 = v7;
      __int16 v52 = 2114;
      v53 = v8;
      _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v48, 0x20u);
      id v8 = (void *)v39[5];
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
      *(_DWORD *)v48 = 136315394;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      __int16 v50 = 2050;
      double v51 = v15;
      _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v48, 0x16u);
    }
    uint64_t v17 = nd_getsupervector();
    if (v17)
    {
      v18 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)v17 length:4 * *(unsigned int *)(v17 + 8)];
      speakerVector = self->_speakerVector;
      self->_speakerVector = v18;

      NSUInteger v20 = [(NSData *)self->_speakerVector length];
      id v10 = 0;
      unint64_t currUttLengthInMs = self->_currUttLengthInMs;
      self->_speakerVectorSize = v20 >> 2;
      self->_processedAudioDurationMs = currUttLengthInMs;
    }
    else
    {
      v22 = [NSString stringWithFormat:@"speakerVector is nil! for processedAUdioDurationMs: %lu, _currUttLengthInMs: %lu", self->_processedAudioDurationMs, self->_currUttLengthInMs, v27, v28, v29, v30];
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45 = v22;
      unint64_t v24 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v25 = [v23 errorWithDomain:@"com.apple.speakerrecognition" code:743 userInfo:v24];

      id v10 = v25;
    }
  }
  else
  {
    double v11 = [NSString stringWithFormat:@"ERR: Too little audio %dms in %@ - Bailing out", self->_currUttLengthInMs, *(void *)&v7, v27, v28, v29, v30];
    uint64_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315394;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      __int16 v50 = 2114;
      double v51 = v11;
      _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", v48, 0x16u);
    }
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F08320];
    double v47 = v11;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v10 = [v13 errorWithDomain:@"com.apple.speakerrecognition" code:751 userInfo:v14];
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v38, 8);

  return v10;
}

void __56__SSRVoiceProfileRetrainerPSRExclave__processAudioFile___block_invoke(void *a1, uint64_t a2, int a3, void *a4)
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
      unint64_t v24 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]_block_invoke";
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
      unint64_t v24 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]_block_invoke";
      __int16 v25 = 2050;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", buf, 0x20u);
    }
    nd_endwavedata();
    uint64_t v16 = nd_getresults();
    if (v16)
    {
      uint64_t v17 = *(void *)(a1[8] + 8);
      long long v18 = *(_OWORD *)v16;
      *(void *)(v17 + 48) = *(void *)(v16 + 16);
      *(_OWORD *)(v17 + 32) = v18;
    }
  }
  else
  {
    v19 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v20 = [v19 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    *(void *)(*(void *)(a1[7] + 8) + 24) += v20 / v22;
    id v21 = v19;
    [v21 bytes];
    nd_wavedata();
  }
}

- (id)_logSpeakerConfusion:(id)a3 forProfileArray:(id)a4 withPrependString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unsigned int v22 = __Block_byref_object_copy__1351;
  v23 = __Block_byref_object_dispose__1352;
  id v24 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v10 = (void *)MEMORY[0x21D4B2500]();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__SSRVoiceProfileRetrainerPSRExclave__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke;
  v15[3] = &unk_2644292E0;
  long long v18 = &v19;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  [v7 enumerateObjectsUsingBlock:v15];
  if ([(id)v20[5] length]) {
    [(id)v20[5] appendFormat:@"----------------------------------------------------------------------------------------------\n\n"];
  }

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __93__SSRVoiceProfileRetrainerPSRExclave__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  if (!a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"\n\n%@\n----------------------------------------------------------------------------------------------\n", *(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"              "];
    if ([*(id *)(a1 + 40) count])
    {
      unint64_t v5 = 0;
      do
      {
        v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
        [v6 appendFormat:@"%@  ", v7];

        ++v5;
      }
      while (v5 < [*(id *)(a1 + 40) count]);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"\n"];
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "appendFormat:", @"Utterance%02d   ", a3);
  if ([v13 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v8) {
        uint64_t v10 = @"%39.2f";
      }
      else {
        uint64_t v10 = @"%16.2f";
      }
      id v11 = [v13 objectAtIndexedSubscript:v8];
      [v11 floatValue];
      objc_msgSend(v9, "appendFormat:", v10, v12);

      ++v8;
    }
    while (v8 < [v13 count]);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"\n"];
}

- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
        float v12 = [v10 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v13 = v21;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * j)];
              [v11 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);
        }

        [v22 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  return v22;
}

- (void)_logSpeakerConfusionWithExplicitScores:(id)a3 withImplicitScores:(id)a4 withPurgeUtterances:(unint64_t)a5 forProfile:(id)a6 forConfigVersion:(id)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (__CFString *)a7;
  if (v12 && [v12 count])
  {
    uint64_t v16 = [v14 profileID];
    id v17 = [v12 objectAtIndexedSubscript:0];
    long long v18 = [v17 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];

    uint64_t v56 = v18;
    uint64_t v19 = [v18 allKeys];
    unint64_t v20 = (void *)[v19 mutableCopy];

    if ([v20 containsObject:v16])
    {
      [v20 removeObject:v16];
      v53 = v16;
      [v20 insertObject:v16 atIndex:0];
      uint64_t v21 = [(SSRVoiceProfileRetrainerPSRExclave *)self _composeSpeakerConfusionWithScores:v12 forProfiles:v20];
      uint64_t v22 = [(SSRVoiceProfileRetrainerPSRExclave *)self _composeSpeakerConfusionWithScores:v13 forProfiles:v20];
      v60[0] = @"locale";
      uint64_t v23 = [v14 locale];
      long long v24 = (void *)v23;
      long long v25 = @"unknown";
      if (v15) {
        long long v25 = v15;
      }
      v61[0] = v23;
      v61[1] = v25;
      v60[1] = @"asset";
      v60[2] = @"explicitUtteranceConfusion";
      v54 = (void *)v22;
      v55 = (void *)v21;
      v61[2] = v21;
      v61[3] = v22;
      v60[3] = @"implicitUtteranceConfusion";
      v60[4] = @"purgedUtteranceCount";
      long long v26 = [NSNumber numberWithUnsignedInteger:a5];
      v61[4] = v26;
      uint64_t v27 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:5];

      long long v28 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUt"
              "terances:forProfile:forConfigVersion:]";
        __int16 v64 = 2112;
        uint64_t v65 = v27;
        _os_log_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_DEFAULT, "%s Log %@", buf, 0x16u);
      }
      __int16 v52 = (void *)v27;
      long long v29 = [MEMORY[0x263F38068] sharedPreferences];
      int v30 = [v29 fileLoggingIsEnabled];

      uint64_t v16 = v53;
      if (v30)
      {
        double v31 = [NSString stringWithFormat:@"Explicit Utterance Confusion Matrix for User - %@ is", v53];
        v49 = [(SSRVoiceProfileRetrainerPSRExclave *)self _logSpeakerConfusion:v55 forProfileArray:v20 withPrependString:v31];

        v32 = [NSString stringWithFormat:@"Implicit Utterance Confusion Matrix for User - %@ is", v53];
        v48 = [(SSRVoiceProfileRetrainerPSRExclave *)self _logSpeakerConfusion:v54 forProfileArray:v20 withPrependString:v32];

        v58[0] = 0x26CD35000;
        v58[1] = @"implicitUtteranceConfusion";
        v59[0] = v12;
        v59[1] = v13;
        v58[2] = @"purgedUtteranceCount";
        uint64_t v33 = [NSNumber numberWithUnsignedInteger:a5];
        v59[2] = v33;
        uint64_t v34 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];

        id v57 = 0;
        double v47 = (void *)v34;
        double v51 = [MEMORY[0x263F08900] dataWithJSONObject:v34 options:3 error:&v57];
        id v50 = v57;
        if (v50)
        {
          v35 = (os_log_t *)MEMORY[0x263F38100];
          v36 = (void *)*MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            v37 = v36;
            uint64_t v38 = [v50 localizedDescription];
            *(_DWORD *)buf = 136315394;
            v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPur"
                  "geUtterances:forProfile:forConfigVersion:]";
            __int16 v64 = 2114;
            uint64_t v65 = (uint64_t)v38;
            _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get json object with error %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v41 = [NSString stringWithFormat:@"CS-VoiceId-UserConfusion-%@.json", v53];
          v42 = [MEMORY[0x263F38068] sharedPreferences];
          id v43 = [v42 voiceTriggerAudioLogDirectory];
          uint64_t v44 = [v43 stringByAppendingPathComponent:v41];

          id v45 = +[SSRUtils removeItemAtPath:v44];
          [v51 writeToFile:v44 atomically:0];

          v35 = (os_log_t *)MEMORY[0x263F38100];
        }
        uint64_t v46 = *v35;
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurge"
                "Utterances:forProfile:forConfigVersion:]";
          __int16 v64 = 2114;
          uint64_t v65 = (uint64_t)v49;
          _os_log_impl(&dword_21C8A5000, v46, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
          uint64_t v46 = *v35;
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurge"
                "Utterances:forProfile:forConfigVersion:]";
          __int16 v64 = 2114;
          uint64_t v65 = (uint64_t)v48;
          _os_log_impl(&dword_21C8A5000, v46, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v40 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUt"
              "terances:forProfile:forConfigVersion:]";
        __int16 v64 = 2114;
        uint64_t v65 = (uint64_t)v16;
        __int16 v66 = 2114;
        v67 = v20;
        _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s profile %{public}@ is not present in %{public}@ - Bailing out", buf, 0x20u);
      }
    }
  }
  else
  {
    v39 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtte"
            "rances:forProfile:forConfigVersion:]";
      _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s explicit scores are nil - Bailing out", buf, 0xCu);
    }
  }
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  v97[1] = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *))a3;
  comparativeModels = self->_comparativeModels;
  if (comparativeModels)
  {
    uint64_t v6 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:comparativeModels withConfigFile:self->_configFilePath withResourceFile:self->_resourceFilePath withOffsetsType:0 forRetraining:1];
    uint64_t v7 = v6;
    if (!v6 || ![v6 count])
    {
      id v9 = NSString;
      uint64_t v10 = self->_comparativeModels;
      id v11 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      id v8 = [v9 stringWithFormat:@"Cannot create comparative scorers from %@ on profile %@", v10, v11];

      id v12 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
        __int16 v88 = 2114;
        *(void *)v89 = v8;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      id v13 = (void *)MEMORY[0x263F087E8];
      v96 = @"reason";
      v97[0] = v8;
      id v14 = [NSDictionary dictionaryWithObjects:v97 forKeys:&v96 count:1];
      uint64_t v15 = [v13 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v14];
      goto LABEL_55;
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v8 addObjectsFromArray:v7];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = 0;
  }
  int64_t v16 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  id v17 = [(SSRVoiceProfile *)self->_voiceProfile getExplicitEnrollmentUtterancesForType:self->_spIdType];
  uint64_t v18 = [v17 count];

  if (v18 <= 2)
  {
    uint64_t v19 = NSString;
    unint64_t v20 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
    id v14 = [v19 stringWithFormat:@"ExpSatVectorCount is invalid (%lu) for profile %@ - Bailingout", v18, v20];

    uint64_t v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      __int16 v88 = 2114;
      *(void *)v89 = v14;
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    v94 = @"reason";
    id v95 = v14;
    uint64_t v23 = NSDictionary;
    long long v24 = &v95;
    long long v25 = &v94;
LABEL_17:
    long long v29 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
    uint64_t v15 = [v22 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v29];
    goto LABEL_54;
  }
  if (v16 < v18)
  {
    long long v26 = NSString;
    uint64_t v27 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
    id v14 = [v26 stringWithFormat:@"satVectorCount %lu is < %luE for profile %@ - Bailingout", v16, v18, v27];

    long long v28 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      __int16 v88 = 2114;
      *(void *)v89 = v14;
      _os_log_error_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    v92 = @"reason";
    id v93 = v14;
    uint64_t v23 = NSDictionary;
    long long v24 = &v93;
    long long v25 = &v92;
    goto LABEL_17;
  }
  id v77 = v8;
  v75 = v7;
  int v30 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    voiceProfile = self->_voiceProfile;
    v32 = v30;
    uint64_t v33 = [(SSRVoiceProfile *)voiceProfile profileID];
    *(_DWORD *)buf = 136315906;
    v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
    __int16 v88 = 2114;
    *(void *)v89 = v33;
    *(_WORD *)&v89[8] = 2050;
    *(void *)&v89[10] = v16;
    __int16 v90 = 2050;
    unint64_t v91 = v18;
    _os_log_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_DEFAULT, "%s Processing Voice Profile %{public}@ with vectorCount %{public}lu and expVectorCount %{public}lu", buf, 0x2Au);
  }
  id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
  v78 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v16 - v18];
  v79 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v18];
  do
  {
    int64_t v34 = v16 - 1;
    v35 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSpeakerVectorAtIndex:v16 - 1];
    v36 = (void *)*MEMORY[0x263F38100];
    if (v35)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_voiceProfile;
        uint64_t v38 = v36;
        v39 = [(SSRVoiceProfile *)v37 profileID];
        unint64_t v40 = [v35 length];
        *(_DWORD *)buf = 136315906;
        v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
        __int16 v88 = 2050;
        *(void *)v89 = v16 - 1;
        *(_WORD *)&v89[8] = 2114;
        *(void *)&v89[10] = v39;
        __int16 v90 = 2050;
        unint64_t v91 = v40 >> 2;
        _os_log_impl(&dword_21C8A5000, v38, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}lu vector from %{public}@ with size %{public}lu", buf, 0x2Au);
      }
      v41 = -[SSRVoiceProfileRetrainerPSRExclave _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", v35, (unint64_t)[v35 length] >> 2, v8, 0);
      v42 = v41;
      if (!v41)
      {
        v54 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          v55 = self->_voiceProfile;
          uint64_t v56 = v54;
          id v57 = [(SSRVoiceProfile *)v55 profileID];
          *(_DWORD *)buf = 136315650;
          v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
          __int16 v88 = 1026;
          *(_DWORD *)v89 = v16 - 1;
          id v8 = v77;
          *(_WORD *)&v89[4] = 2114;
          *(void *)&v89[6] = v57;
          _os_log_error_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_ERROR, "%s Failed to get scores for vectorIdx %{public}u of profile %{public}@", buf, 0x1Cu);
        }
        goto LABEL_42;
      }
      id v43 = (void *)[v41 mutableCopy];
      if (!v43)
      {
        uint64_t v58 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
          __int16 v88 = 2114;
          *(void *)v89 = v42;
          _os_log_error_impl(&dword_21C8A5000, v58, OS_LOG_TYPE_ERROR, "%s Failed to allocate mapped scores for %{public}@", buf, 0x16u);
        }
        goto LABEL_41;
      }
      if (v16 <= v18)
      {
        uint64_t v59 = v79;
      }
      else
      {
        if (v4)
        {
          char v44 = v4[2](v4, v42);
          [v78 addObject:v43];
          if ((v44 & 1) == 0)
          {
            id v45 = (void *)*MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              int v46 = v16 - 1;
              double v47 = self->_voiceProfile;
              v48 = v45;
              v49 = [(SSRVoiceProfile *)v47 profileID];
              *(_DWORD *)buf = 136315650;
              v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
              __int16 v88 = 1026;
              *(_DWORD *)v89 = v46;
              id v8 = v77;
              *(_WORD *)&v89[4] = 2114;
              *(void *)&v89[6] = v49;
              _os_log_impl(&dword_21C8A5000, v48, OS_LOG_TYPE_DEFAULT, "%s Adding vector %{public}u for deletion from profile %{public}@", buf, 0x1Cu);
            }
            id v50 = [NSNumber numberWithInteger:v34];
            [v76 addObject:v50];
          }
          goto LABEL_41;
        }
        uint64_t v59 = v78;
      }
      [v59 addObject:v43];
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      double v51 = self->_voiceProfile;
      __int16 v52 = v36;
      v53 = [(SSRVoiceProfile *)v51 profileID];
      *(_DWORD *)buf = 136315650;
      v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      __int16 v88 = 1024;
      *(_DWORD *)v89 = v16 - 1;
      id v8 = v77;
      *(_WORD *)&v89[4] = 2114;
      *(void *)&v89[6] = v53;
      _os_log_error_impl(&dword_21C8A5000, v52, OS_LOG_TYPE_ERROR, "%s Failed to %u vector from profile %{public}@", buf, 0x1Cu);
    }
LABEL_43:

    int64_t v16 = v34;
  }
  while ((unint64_t)(v34 + 1) > 1);
  v80 = v4;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v14 = v76;
  uint64_t v60 = [v14 countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v82 != v62) {
          objc_enumerationMutation(v14);
        }
        __int16 v64 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        uint64_t v65 = (void *)*MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          id v66 = v14;
          v67 = self->_voiceProfile;
          uint64_t v68 = v65;
          v69 = [(SSRVoiceProfile *)v67 profileID];
          *(_DWORD *)buf = 136315650;
          v87 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
          __int16 v88 = 2114;
          *(void *)v89 = v64;
          *(_WORD *)&v89[8] = 2114;
          *(void *)&v89[10] = v69;
          _os_log_impl(&dword_21C8A5000, v68, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}@ from profile %{public}@", buf, 0x20u);

          id v14 = v66;
        }
        -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", [v64 intValue]);
      }
      uint64_t v61 = [v14 countByEnumeratingWithState:&v81 objects:v85 count:16];
    }
    while (v61);
  }

  uint64_t v70 = [v14 count];
  v71 = self->_voiceProfile;
  configVersion = self->_configVersion;
  v73 = self;
  long long v29 = v78;
  [(SSRVoiceProfileRetrainerPSRExclave *)v73 _logSpeakerConfusionWithExplicitScores:v79 withImplicitScores:v78 withPurgeUtterances:v70 forProfile:v71 forConfigVersion:configVersion];

  uint64_t v15 = 0;
  id v4 = v80;
  uint64_t v7 = v75;
  id v8 = v77;
LABEL_54:

LABEL_55:

  return v15;
}

- (void)purgeLastSpeakerEmbedding
{
  *(void *)&v15[13] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  id v4 = (void *)*MEMORY[0x263F38100];
  if (v3)
  {
    uint64_t v5 = (v3 - 1);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      voiceProfile = self->_voiceProfile;
      uint64_t v7 = v4;
      id v8 = [(SSRVoiceProfile *)voiceProfile profileID];
      int v12 = 136315650;
      id v13 = "-[SSRVoiceProfileRetrainerPSRExclave purgeLastSpeakerEmbedding]";
      __int16 v14 = 1026;
      *(_DWORD *)uint64_t v15 = v5;
      v15[2] = 2114;
      *(void *)&v15[3] = v8;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v12, 0x1Cu);
    }
    [(SSRSpeakerRecognitionScorer *)self->_psrScorer deleteVectorAtIndex:v5];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    id v9 = self->_voiceProfile;
    uint64_t v10 = v4;
    id v11 = [(SSRVoiceProfile *)v9 profileID];
    int v12 = 136315394;
    id v13 = "-[SSRVoiceProfileRetrainerPSRExclave purgeLastSpeakerEmbedding]";
    __int16 v14 = 2114;
    *(void *)uint64_t v15 = v11;
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5
{
  v96[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void *))a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x21D4B2500]();
  id v61 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v66 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v8 && [v8 count])
  {
    id v57 = v11;
    id v58 = v10;
    id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v67 addObject:self->_psrScorer];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v59 = v8;
    obuint64_t j = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v94 count:16];
    id v13 = v66;
    if (!v12) {
      goto LABEL_34;
    }
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v71;
    uint64_t v69 = *MEMORY[0x263F08320];
    uint64_t v65 = v9;
    uint64_t v60 = *(void *)v71;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v71 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v70 + 1) + 8 * v16);
        uint64_t v18 = [v17 pathExtension];
        char v19 = [v18 isEqualToString:@"wav"];

        if (v19)
        {
          uint64_t v20 = [(SSRVoiceProfileRetrainerPSRExclave *)self _processAudioFile:v17];
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            uint64_t v22 = [v17 path];
            [v13 setObject:v21 forKey:v22];
            goto LABEL_16;
          }
          uint64_t v22 = [(SSRVoiceProfileRetrainerPSRExclave *)self _processSpeakerVector:self->_speakerVector withSize:self->_speakerVectorSize withScorers:v67 processedAudioDurationMs:self->_processedAudioDurationMs];
          if (!v22)
          {
            uint64_t v38 = NSString;
            v39 = [v17 lastPathComponent];
            unint64_t v40 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
            long long v28 = [v38 stringWithFormat:@"Failed to get scorecard for utterance %@ on profile %@", v39, v40];

            v41 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
              __int16 v78 = 2114;
              v79 = v28;
              _os_log_error_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
            }
            v42 = (void *)MEMORY[0x263F087E8];
            __int16 v90 = @"reason";
            unint64_t v91 = v28;
            id v43 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
            uint64_t v21 = [v42 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v43];

            char v44 = [v17 path];
            id v13 = v66;
            [v66 setObject:v21 forKey:v44];

            id v9 = v65;
            goto LABEL_15;
          }
          if (!v9 || (v9[2](v9, v17, v22), (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            long long v28 = [(NSURL *)self->_psrModelFilePath URLByDeletingLastPathComponent];
            int v30 = (void *)*MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
            {
              log = v30;
              uint64_t v62 = [v17 lastPathComponent];
              double v31 = [(NSURL *)self->_psrModelFilePath lastPathComponent];
              v32 = [v28 lastPathComponent];
              uint64_t v33 = [v28 URLByDeletingLastPathComponent];
              [v33 lastPathComponent];
              int64_t v34 = v63 = v28;
              unint64_t v35 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
              *(_DWORD *)buf = 136316674;
              id v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
              __int16 v78 = 2114;
              v79 = v62;
              __int16 v80 = 2114;
              long long v81 = v31;
              __int16 v82 = 2114;
              long long v83 = v32;
              __int16 v84 = 2114;
              v85 = v34;
              __int16 v86 = 2050;
              unint64_t v87 = v35;
              __int16 v88 = 2114;
              v89 = v22;
              _os_log_impl(&dword_21C8A5000, log, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %{public}lu vector with scoreCard %{public}@", buf, 0x48u);

              uint64_t v15 = v60;
              long long v28 = v63;

              id v9 = v65;
            }
            unint64_t v36 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
            [(SSRSpeakerRecognitionScorer *)self->_psrScorer updateSAT];
            if ([(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount] - v36 == 1)
            {
              v37 = [v17 path];
              [v61 setObject:v22 forKey:v37];
              uint64_t v21 = 0;
            }
            else
            {
              v37 = [NSString stringWithFormat:@"ERR: Reached max (%lu) of training utterances, Skipped SAT model update", -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount")];
              id v45 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                id v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
                __int16 v78 = 2114;
                v79 = v37;
                _os_log_error_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
              }
              int v46 = (void *)MEMORY[0x263F087E8];
              uint64_t v74 = v69;
              v75 = v37;
              double v47 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
              uint64_t v21 = [v46 errorWithDomain:@"com.apple.speakerrecognition" code:739 userInfo:v47];

              v48 = [v17 path];
              [v66 setObject:v21 forKey:v48];

              id v9 = v65;
            }

            id v13 = v66;
            goto LABEL_15;
          }
          uint64_t v21 = (void *)v29;
        }
        else
        {
          uint64_t v23 = NSString;
          long long v24 = [v17 path];
          uint64_t v22 = [v23 stringWithFormat:@"Invalid file format %@ ", v24];

          long long v25 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            id v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
            __int16 v78 = 2114;
            v79 = v22;
            _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
          }
          long long v26 = (void *)MEMORY[0x263F087E8];
          uint64_t v92 = v69;
          id v93 = v22;
          uint64_t v27 = [NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
          uint64_t v21 = [v26 errorWithDomain:@"com.apple.speakerrecognition" code:729 userInfo:v27];
        }
        long long v28 = [v17 path];
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
        double v51 = [(NSURL *)self->_psrModelFilePath absoluteString];
        [(SSRVoiceProfile *)voiceProfile updateVoiceProfilePathExclave:v51];

        id v10 = v58;
        if (v58) {
          (*((void (**)(id, void, id, id))v58 + 2))(v58, 0, v61, v66);
        }
        id v8 = v59;
        id v11 = v57;
        __int16 v52 = v67;
        goto LABEL_39;
      }
    }
  }
  uint64_t v53 = [NSString stringWithFormat:@"File Array is nil"];
  __int16 v52 = (void *)v53;
  if (v10)
  {
    v54 = (void *)MEMORY[0x263F087E8];
    uint64_t v95 = *MEMORY[0x263F08320];
    v96[0] = v53;
    v55 = [NSDictionary dictionaryWithObjects:v96 forKeys:&v95 count:1];
    uint64_t v56 = [v54 errorWithDomain:@"com.apple.speakerrecognition" code:701 userInfo:v55];
    (*((void (**)(id, void *, void, void))v10 + 2))(v10, v56, 0, 0);
  }
LABEL_39:
}

- (BOOL)implicitTrainingRequired
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
    int v7 = 136315650;
    id v8 = "-[SSRVoiceProfileRetrainerPSRExclave implicitTrainingRequired]";
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
  if (![(SSRSpeakerRecognitionScorer *)self->_psrScorer satModelAvailable])
  {
    id v17 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v31 = 136315138;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    uint64_t v18 = "%s PSRNeedsRetraining(YES): satModelAvailable is not available!";
    char v19 = v17;
    uint32_t v20 = 12;
LABEL_11:
    _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v31, v20);
    goto LABEL_12;
  }
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [(NSURL *)self->_psrModelFilePath path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

  if ((v7 & 1) == 0)
  {
    uint64_t v21 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    psrModelFilePath = self->_psrModelFilePath;
    int v31 = 136315394;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    __int16 v33 = 2114;
    unint64_t v34 = (unint64_t)psrModelFilePath;
    uint64_t v18 = "%s PSRNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    char v19 = v21;
    uint32_t v20 = 22;
    goto LABEL_11;
  }
  unint64_t v8 = [v4 count];
  unint64_t v9 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  unint64_t v10 = v9;
  unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v8 <= maximumSpeakerVectors && v9 != v8)
  {
    unint64_t v12 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t spIdType = self->_spIdType;
      uint64_t v14 = v12;
      uint64_t v15 = +[SSRUtils stringForCSSpIdType:spIdType];
      int v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
      __int16 v33 = 2050;
      unint64_t v34 = v8;
      __int16 v35 = 2050;
      unint64_t v36 = v10;
      __int16 v37 = 2050;
      unint64_t v38 = maximumSpeakerVectors;
      __int16 v39 = 2114;
      unint64_t v40 = v15;
      uint64_t v16 = "%s PSRNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_18:
      _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v31, 0x34u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  long long v25 = (void *)*MEMORY[0x263F38100];
  BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
  if (v8 > maximumSpeakerVectors && v10 != maximumSpeakerVectors)
  {
    if (v26)
    {
      unint64_t v27 = self->_spIdType;
      uint64_t v14 = v25;
      uint64_t v15 = +[SSRUtils stringForCSSpIdType:v27];
      int v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
      __int16 v33 = 2050;
      unint64_t v34 = v8;
      __int16 v35 = 2050;
      unint64_t v36 = v10;
      __int16 v37 = 2050;
      unint64_t v38 = maximumSpeakerVectors;
      __int16 v39 = 2114;
      unint64_t v40 = v15;
      uint64_t v16 = "%s PSRNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
      goto LABEL_18;
    }
LABEL_12:
    BOOL v23 = 1;
    goto LABEL_13;
  }
  if (v26)
  {
    unint64_t v28 = self->_spIdType;
    uint64_t v29 = v25;
    int v30 = +[SSRUtils stringForCSSpIdType:v28];
    int v31 = 136316162;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    __int16 v33 = 2050;
    unint64_t v34 = v8;
    __int16 v35 = 2050;
    unint64_t v36 = v10;
    __int16 v37 = 2050;
    unint64_t v38 = maximumSpeakerVectors;
    __int16 v39 = 2114;
    unint64_t v40 = v30;
    _os_log_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", (uint8_t *)&v31, 0x34u);
  }
  BOOL v23 = 0;
LABEL_13:

  return v23;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = +[SSRUtils stringForSpeakerRecognizerType:1];
  uint64_t v5 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  uint64_t v6 = [v3 stringWithFormat:@"{%@:%@:%@:%@}", v4, v5, self->_psrModelFilePath, self->_asset];

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
    uint64_t v6 = "-[SSRVoiceProfileRetrainerPSRExclave dealloc]";
    __int16 v7 = 2114;
    unint64_t v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerPSRExclave;
  [(SSRVoiceProfileRetrainerPSRExclave *)&v4 dealloc];
}

- (BOOL)resetModelForRetraining
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    psrModelFilePath = self->_psrModelFilePath;
    int v8 = 136315394;
    uint64_t v9 = "-[SSRVoiceProfileRetrainerPSRExclave resetModelForRetraining]";
    __int16 v10 = 2114;
    __int16 v11 = psrModelFilePath;
    _os_log_error_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_super v4 = [(NSURL *)self->_psrModelFilePath path];
  id v5 = +[SSRUtils removeItemAtPath:v4];

  return [(SSRSpeakerRecognitionScorer *)self->_psrScorer resetScorerWithModelFilePath:self->_psrModelFilePath];
}

- (unint64_t)retrainerType
{
  return 2;
}

- (NSURL)modelFilePath
{
  return self->_psrModelFilePath;
}

- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3
{
  return [(SSRVoiceProfileRetrainerPSRExclave *)self initWithVoiceRetrainingContext:0 secureAsset:0 secureSpeakerRecognitionConfig:0];
}

- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4 secureSpeakerRecognitionConfig:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = 0;
  if (v9 && v10)
  {
    v60.receiver = self;
    v60.super_class = (Class)SSRVoiceProfileRetrainerPSRExclave;
    self = [(SSRVoiceProfileRetrainerPSRExclave *)&v60 init];
    if (self)
    {
      SSRLogInitIfNeeded();
      objc_storeStrong((id *)&self->_asset, a4);
      objc_storeStrong((id *)&self->_ctx, a3);
      uint64_t v13 = [v9 modelsContext];
      uint64_t v14 = +[SSRUtils stringForSpeakerRecognizerType:1];
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];

      if (v15)
      {
        if (self->_asset)
        {
          p_speakerRecognitionConfig = &self->_speakerRecognitionConfig;
          objc_storeStrong((id *)&self->_speakerRecognitionConfig, a5);
          if (self->_speakerRecognitionConfig)
          {
            id v17 = (void *)nd_create();
            self->_novDetector = v17;
            if (v17)
            {
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              char v66 = 1;
              uint64_t v18 = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig psrMemoryIndex];
              char v19 = [v18 memoryIndexes];
              v57[0] = MEMORY[0x263EF8330];
              v57[1] = 3221225472;
              v57[2] = __112__SSRVoiceProfileRetrainerPSRExclave_initWithVoiceRetrainingContext_secureAsset_secureSpeakerRecognitionConfig___block_invoke;
              v57[3] = &unk_2644299B8;
              id v59 = buf;
              uint64_t v56 = self;
              id v58 = v56;
              [v19 enumerateKeysAndObjectsUsingBlock:v57];

              if (!*(unsigned char *)(*(void *)&buf[8] + 24))
              {
LABEL_13:

                _Block_object_dispose(buf, 8);
LABEL_23:

                uint64_t v12 = 0;
                goto LABEL_33;
              }
              id v20 = [(SecureSpeakerRecognitionConfig *)self->_speakerRecognitionConfig psrConfigString];
              [v20 cStringUsingEncoding:4];
              int v21 = nd_initialize();

              uint64_t v22 = *MEMORY[0x263F38100];
              if (v21)
              {
                BOOL v23 = v22;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v52 = nd_error();
                  *(_DWORD *)id v61 = 136315394;
                  uint64_t v62 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerRec"
                        "ognitionConfig:]";
                  __int16 v63 = 2080;
                  uint64_t v64 = v52;
                  _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s Failed to initialize nov detector with error %s", v61, 0x16u);
                }

                goto LABEL_13;
              }
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)id v61 = 136315138;
                uint64_t v62 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerRecognitionConfig:]";
                _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_INFO, "%s Successfully created nov detector", v61, 0xCu);
              }

              _Block_object_dispose(buf, 8);
              if ([v9 forceRetrain])
              {
                BOOL v26 = (void *)*MEMORY[0x263F37FA0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v27 = v26;
                  unint64_t v28 = [v15 secureProfileModelFilePath];
                  *(_DWORD *)buf = 136315394;
                  *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:s"
                                       "ecureSpeakerRecognitionConfig:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v28;
                  _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);
                }
                uint64_t v29 = [v15 secureProfileModelFilePath];
                int v30 = [v29 path];
                id v31 = +[SSRUtils removeItemAtPath:v30];
              }
              v32 = [SSRSpeakerRecognitionScorer alloc];
              v55 = [v9 voiceProfile];
              v54 = [v55 profileID];
              __int16 v33 = [v15 secureProfileModelFilePath];
              unint64_t v34 = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig psrConfigString];
              __int16 v35 = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig psrMemoryIndex];
              LOBYTE(v53) = 1;
              uint64_t v36 = [(SSRSpeakerRecognitionScorer *)v32 initWithProfileID:v54 withModelFile:v33 withConfigFile:0 withResourceFile:0 configData:v34 memoryIndex:v35 withOffsetsType:0 forRetraining:v53];
              psrScorer = v56->_psrScorer;
              v56->_psrScorer = (SSRSpeakerRecognitionScorer *)v36;

              if (v56->_psrScorer)
              {
                dispatch_queue_t v38 = dispatch_queue_create("com.apple.corespeech.speakerretrain.secure.psrq", 0);
                queue = v56->_queue;
                v56->_queue = (OS_dispatch_queue *)v38;

                uint64_t v40 = [v15 configFilePath];
                configFilePath = v56->_configFilePath;
                v56->_configFilePath = (NSURL *)v40;

                uint64_t v42 = [v9 resourceFilePath];
                resourceFilePath = v56->_resourceFilePath;
                v56->_resourceFilePath = (NSURL *)v42;

                uint64_t v44 = [v15 secureProfileModelFilePath];
                psrModelFilePath = v56->_psrModelFilePath;
                v56->_psrModelFilePath = (NSURL *)v44;

                uint64_t v46 = [v9 voiceProfile];
                voiceProfile = v56->_voiceProfile;
                v56->_voiceProfile = (SSRVoiceProfile *)v46;

                comparativeModels = v56->_comparativeModels;
                v56->_comparativeModels = 0;

                v56->_unint64_t maximumSpeakerVectors = [(SecureSpeakerRecognitionConfig *)*p_speakerRecognitionConfig maxEnrollmentUtterances];
                uint64_t v49 = [v9 configVersion];
                configVersion = v56->_configVersion;
                v56->_configVersion = (NSString *)v49;

                v56->_unint64_t spIdType = [v9 spIdType];
                goto LABEL_32;
              }
              long long v24 = *MEMORY[0x263F37FA0];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_23;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secur"
                                   "eSpeakerRecognitionConfig:]";
              long long v25 = "%s ERR: Cannot create PSR Scorer";
            }
            else
            {
              long long v24 = *MEMORY[0x263F37FA0];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_23;
              }
              *(_DWORD *)buf = 136315138;
              *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secur"
                                   "eSpeakerRecognitionConfig:]";
              long long v25 = "%s Secure Speaker detector failed to create nov detector.";
            }
          }
          else
          {
            long long v24 = *MEMORY[0x263F37FA0];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureS"
                                 "peakerRecognitionConfig:]";
            long long v25 = "%s Secure Speaker detector config is nil";
          }
        }
        else
        {
          long long v24 = *MEMORY[0x263F37FA0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureSpe"
                               "akerRecognitionConfig:]";
          long long v25 = "%s PSRModel Retraining asset is nil! - Skipping";
        }
      }
      else
      {
        long long v24 = *MEMORY[0x263F37FA0];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureSpeak"
                             "erRecognitionConfig:]";
        long long v25 = "%s PSRModel Retraining context is nil! - Skipping";
      }
      _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
      goto LABEL_23;
    }
LABEL_32:
    self = self;
    uint64_t v12 = self;
  }
LABEL_33:

  return v12;
}

void __112__SSRVoiceProfileRetrainerPSRExclave_initWithVoiceRetrainingContext_secureAsset_secureSpeakerRecognitionConfig___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
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
        uint64_t v13 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:secureSpeakerRecognitionCo"
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