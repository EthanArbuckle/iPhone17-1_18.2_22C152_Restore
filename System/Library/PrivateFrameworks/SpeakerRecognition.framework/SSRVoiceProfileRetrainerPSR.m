@interface SSRVoiceProfileRetrainerPSR
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
- (SSRVoiceProfileRetrainerPSR)initWithVoiceRetrainingContext:(id)a3;
- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4;
- (id)_logSpeakerConfusion:(id)a3 forProfileArray:(id)a4 withPrependString:(id)a5;
- (id)_processAudioFile:(id)a3 withPSRProcessor:(id)a4;
- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6;
- (id)purgeConfusionInformationWithPolicy:(id)a3;
- (unint64_t)currUttLengthInMs;
- (unint64_t)processedAudioDurationMs;
- (unint64_t)retrainerType;
- (unint64_t)spIdType;
- (unint64_t)speakerVectorSize;
- (void)_emitVoiceProfileOnboardedSelfLogWithExplicitScores:(id)a3 withProfilePitch:(float)a4;
- (void)_logSpeakerConfusionWithExplicitScores:(id)a3 withImplicitScores:(id)a4 withPurgeUtterances:(unint64_t)a5 forProfile:(id)a6 forConfigVersion:(id)a7;
- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)purgeLastSpeakerEmbedding;
- (void)setComparativeModels:(id)a3;
- (void)setConfigFilePath:(id)a3;
- (void)setConfigVersion:(id)a3;
- (void)setCurrUttLengthInMs:(unint64_t)a3;
- (void)setProcessedAudioDurationMs:(unint64_t)a3;
- (void)setPsrModelFilePath:(id)a3;
- (void)setPsrScorer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setSpIdType:(unint64_t)a3;
- (void)setSpeakerVector:(id)a3;
- (void)setSpeakerVectorSize:(unint64_t)a3;
- (void)setVoiceProfile:(id)a3;
@end

@implementation SSRVoiceProfileRetrainerPSR

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_psrModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);

  objc_storeStrong((id *)&self->_psrScorer, 0);
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

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a5;
  v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v24;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v14 scoreSpeakerVector:v8 withDimensions:a4 withThresholdType:0];
        v15 = objc_msgSend(NSNumber, "numberWithFloat:");
        v16 = [v14 profileID];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v11);
  }

  v30[0] = v9;
  v29[0] = @"spIdKnownUserPSRScores";
  v29[1] = @"spIdAudioProcessedDuration";
  v17 = [NSNumber numberWithUnsignedInteger:a6];
  v30[1] = v17;
  v29[2] = @"bestVoiceTriggerScore";
  *(float *)&double v18 = self->_bestTriggerScore;
  v19 = [NSNumber numberWithFloat:v18];
  v30[2] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

  return v20;
}

- (id)_processAudioFile:(id)a3 withPSRProcessor:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F38100];
  v9 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_psrScore = -1.0;
  [v7 resetForNewRequest];
  self->_unint64_t currUttLengthInMs = 0xFFFFFFFFLL;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__3223;
  v52 = __Block_byref_object_dispose__3224;
  id v53 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __66__SSRVoiceProfileRetrainerPSR__processAudioFile_withPSRProcessor___block_invoke;
  uint64_t v32 = &unk_264429308;
  id v10 = v6;
  id v33 = v10;
  v34 = self;
  v36 = buf;
  v37 = v39;
  id v11 = v7;
  id v35 = v11;
  +[SSRUtils streamAudioFromFileUrl:v10 audioStreamBasicDescriptor:v38 samplesPerStreamChunk:640 audioDataAvailableHandler:&v29];
  uint64_t v12 = *(void **)(*(void *)&buf[8] + 40);
  if (v12)
  {
    v13 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315650;
      v45 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
      __int16 v46 = 2114;
      id v47 = v10;
      __int16 v48 = 2114;
      v49 = v12;
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v44, 0x20u);
      uint64_t v12 = *(void **)(*(void *)&buf[8] + 40);
    }
    id v14 = v12;
  }
  else if (self->_currUttLengthInMs > 0xC7)
  {
    v19 = [v11 getLatestSuperVector];
    speakerVector = self->_speakerVector;
    self->_speakerVector = v19;

    NSUInteger v21 = [(NSData *)self->_speakerVector length];
    unint64_t currUttLengthInMs = self->_currUttLengthInMs;
    v23 = self->_speakerVector;
    self->_speakerVectorSize = v21 >> 2;
    self->_processedAudioDurationMs = currUttLengthInMs;
    if (v23)
    {
      id v14 = 0;
    }
    else
    {
      id v24 = [NSString stringWithFormat:@"speakerVector is nil! for processedAUdioDurationMs: %lu, _currUttLengthInMs: %lu", currUttLengthInMs, currUttLengthInMs, v29, v30, v31, v32, v33, v34];
      long long v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08320];
      v41 = v24;
      long long v26 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      long long v27 = [v25 errorWithDomain:@"com.apple.speakerrecognition" code:743 userInfo:v26];

      id v14 = v27;
    }
  }
  else
  {
    v15 = [NSString stringWithFormat:@"ERR: Too little audio %dms in %@ - Bailing out", self->_currUttLengthInMs, v10, v29, v30, v31, v32, v33, v34];
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315394;
      v45 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
      __int16 v46 = 2114;
      id v47 = v15;
      _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", v44, 0x16u);
    }
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43 = v15;
    double v18 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v14 = [v17 errorWithDomain:@"com.apple.speakerrecognition" code:751 userInfo:v18];
  }
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

void __66__SSRVoiceProfileRetrainerPSR__processAudioFile_withPSRProcessor___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    id v8 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v19 = 136315394;
      v20 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = v7;
    uint64_t v12 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    unint64_t v18 = [v12 length];
    [MEMORY[0x263F38038] lpcmInt16ASBD];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v18 / v24;
    [*(id *)(a1 + 48) addAudio:v12];
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  *(void *)(*(void *)(a1 + 40) + 96) = (unint64_t)(float)((float)((float)v13 / v14) * 1000.0);
  v15 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 96);
    int v19 = 136315650;
    v20 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]_block_invoke";
    __int16 v21 = 2050;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", (uint8_t *)&v19, 0x20u);
  }
  [*(id *)(a1 + 48) endAudio];
LABEL_11:
}

- (id)_logSpeakerConfusion:(id)a3 forProfileArray:(id)a4 withPrependString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3223;
  __int16 v23 = __Block_byref_object_dispose__3224;
  id v24 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v10 = (void *)MEMORY[0x21D4B2500]();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__SSRVoiceProfileRetrainerPSR__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke;
  v15[3] = &unk_2644292E0;
  unint64_t v18 = &v19;
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

void __86__SSRVoiceProfileRetrainerPSR__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  if (!a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"\n\n%@\n----------------------------------------------------------------------------------------------\n", *(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"              "];
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v6 = [*(id *)(a1 + 40) count];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = *(void **)(v7 + 40);
      if (i >= v6) {
        break;
      }
      id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:i];
      [v8 appendFormat:@"%@  ", v9];
    }
    [*(id *)(v7 + 40) appendFormat:@"\n"];
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "appendFormat:", @"Utterance%02d   ", a3);
  for (unint64_t j = 0; j < [v15 count]; ++j)
  {
    id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (j)
    {
      id v12 = [v15 objectAtIndexedSubscript:j];
      [v12 floatValue];
      objc_msgSend(v11, "appendFormat:", @"%39.2f", v13);
    }
    else
    {
      id v12 = [v15 objectAtIndexedSubscript:0];
      [v12 floatValue];
      objc_msgSend(v11, "appendFormat:", @"%16.2f", v14);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@"\n"];
}

- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v5);
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v11 = [v9 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v20;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v12);
              }
              id v16 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * j)];
              [v10 addObject:v16];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }

        [v19 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return v19;
}

- (void)_emitVoiceProfileOnboardedSelfLogWithExplicitScores:(id)a3 withProfilePitch:(float)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v25 = a3;
  if (([MEMORY[0x263F380D0] isDarwinOS] & 1) == 0)
  {
    long long v28 = [MEMORY[0x263EFF980] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v25;
    uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v29)
    {
      int v30 = 0;
      uint64_t v27 = *(void *)v38;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v37 + 1) + 8 * v32);
          id v31 = objc_alloc_init(MEMORY[0x263F6E368]);
          uint64_t v6 = [v5 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];
          uint64_t v7 = [MEMORY[0x263EFF980] array];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v9)
          {
            uint64_t v10 = 0;
            uint64_t v11 = *(void *)v34;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v34 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * v12);
                id v14 = objc_alloc_init(MEMORY[0x263F6E360]);
                id v15 = objc_msgSend(@"HomeMember", "stringByAppendingFormat:", @"%d", v10 + v12 + 1);
                [v14 setHomeMemberUserId:v15];

                id v16 = [v8 objectForKeyedSubscript:v13];
                [v16 floatValue];
                [v14 setSimilarityScore:(float)(v17 * 100.0)];

                [v7 addObject:v14];
                ++v12;
              }
              while (v9 != v12);
              uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
              uint64_t v10 = (v10 + v12);
            }
            while (v9);
          }

          [v31 setVoiceProfileConfusionScores:v7];
          ++v30;
          objc_msgSend(v31, "setEnrollmentUtteranceNumber:");
          [v28 addObject:v31];

          ++v32;
        }
        while (v32 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v29);
    }

    id v18 = objc_alloc_init(MEMORY[0x263F6E370]);
    [v18 setVoiceProfilePitchInHz:5 * (a4 / 5)];
    [v18 setConfusionScoresForEnrollmentUtterances:v28];
    id v19 = objc_alloc_init(MEMORY[0x263F6E330]);
    id v20 = objc_alloc_init(MEMORY[0x263F6E340]);
    id v21 = objc_alloc(MEMORY[0x263F6EED8]);
    id v22 = objc_alloc_init(MEMORY[0x263F08C38]);
    long long v23 = (void *)[v21 initWithNSUUID:v22];
    [v20 setMhId:v23];

    [v19 setEventMetadata:v20];
    [v19 setVoiceProfileOnboarded:v18];
    long long v24 = [MEMORY[0x263F6C810] sharedStream];
    [v24 emitMessage:v19];
  }
}

- (void)_logSpeakerConfusionWithExplicitScores:(id)a3 withImplicitScores:(id)a4 withPurgeUtterances:(unint64_t)a5 forProfile:(id)a6 forConfigVersion:(id)a7
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (__CFString *)a7;
  if (v12 && [v12 count])
  {
    id v16 = [v14 profileID];
    float v17 = [v12 objectAtIndexedSubscript:0];
    id v18 = [v17 objectForKeyedSubscript:@"spIdKnownUserPSRScores"];

    v51 = v18;
    id v19 = [v18 allKeys];
    id v20 = (void *)[v19 mutableCopy];

    if ([v20 containsObject:v16])
    {
      [v20 removeObject:v16];
      [v20 insertObject:v16 atIndex:0];
      v50 = [(SSRVoiceProfileRetrainerPSR *)self _composeSpeakerConfusionWithScores:v12 forProfiles:v20];
      v49 = [(SSRVoiceProfileRetrainerPSR *)self _composeSpeakerConfusionWithScores:v13 forProfiles:v20];
      v55[0] = @"locale";
      uint64_t v21 = [v14 locale];
      id v22 = (void *)v21;
      long long v23 = @"unknown";
      if (v15) {
        long long v23 = v15;
      }
      v56[0] = v21;
      v56[1] = v23;
      v55[1] = @"asset";
      v55[2] = @"explicitUtteranceConfusion";
      v56[2] = v50;
      v56[3] = v49;
      v55[3] = @"implicitUtteranceConfusion";
      v55[4] = @"purgedUtteranceCount";
      long long v24 = [NSNumber numberWithUnsignedInteger:a5];
      v56[4] = v24;
      __int16 v48 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];

      id v25 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v25 logEventWithType:6113 context:v48 contextNoCopy:0];

      long long v26 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterance"
              "s:forProfile:forConfigVersion:]";
        __int16 v59 = 2112;
        v60 = v48;
        _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Log %@", buf, 0x16u);
      }
      uint64_t v27 = [MEMORY[0x263F38068] sharedPreferences];
      int v28 = [v27 fileLoggingIsEnabled];

      if (v28)
      {
        uint64_t v29 = [NSString stringWithFormat:@"Explicit Utterance Confusion Matrix for User - %@ is", v16];
        __int16 v46 = [(SSRVoiceProfileRetrainerPSR *)self _logSpeakerConfusion:v50 forProfileArray:v20 withPrependString:v29];

        int v30 = [NSString stringWithFormat:@"Implicit Utterance Confusion Matrix for User - %@ is", v16];
        v45 = [(SSRVoiceProfileRetrainerPSR *)self _logSpeakerConfusion:v49 forProfileArray:v20 withPrependString:v30];

        v53[0] = 0x26CD35000;
        v53[1] = @"implicitUtteranceConfusion";
        v54[0] = v12;
        v54[1] = v13;
        v53[2] = @"purgedUtteranceCount";
        id v31 = [NSNumber numberWithUnsignedInteger:a5];
        v54[2] = v31;
        id v47 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

        id v52 = 0;
        uint64_t v43 = [MEMORY[0x263F08900] dataWithJSONObject:v47 options:3 error:&v52];
        id v42 = v52;
        if (v42)
        {
          log = (id)*MEMORY[0x263F38100];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = [v42 localizedDescription];
            *(_DWORD *)buf = 136315394;
            v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtter"
                  "ances:forProfile:forConfigVersion:]";
            __int16 v59 = 2114;
            v60 = v32;
            _os_log_error_impl(&dword_21C8A5000, log, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get json object with error %{public}@", buf, 0x16u);
          }
        }
        else
        {
          log = [NSString stringWithFormat:@"CS-VoiceId-UserConfusion-%@.json", v16];
          long long v35 = [MEMORY[0x263F38068] sharedPreferences];
          long long v36 = [v35 voiceTriggerAudioLogDirectory];
          long long v37 = [v36 stringByAppendingPathComponent:log];

          id v38 = +[SSRUtils removeItemAtPath:v37];
          [v43 writeToFile:v37 atomically:0];
        }
        long long v39 = (NSObject **)MEMORY[0x263F38100];
        long long v40 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtteran"
                "ces:forProfile:forConfigVersion:]";
          __int16 v59 = 2114;
          v60 = v46;
          _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
          long long v40 = *v39;
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtteran"
                "ces:forProfile:forConfigVersion:]";
          __int16 v59 = 2114;
          v60 = v45;
          _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      v41 = [v14 profilePitch];
      [v41 floatValue];
      -[SSRVoiceProfileRetrainerPSR _emitVoiceProfileOnboardedSelfLogWithExplicitScores:withProfilePitch:](self, "_emitVoiceProfileOnboardedSelfLogWithExplicitScores:withProfilePitch:", v12);
    }
    else
    {
      long long v34 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterance"
              "s:forProfile:forConfigVersion:]";
        __int16 v59 = 2114;
        v60 = v16;
        __int16 v61 = 2114;
        v62 = v20;
        _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s profile %{public}@ is not present in %{public}@ - Bailing out", buf, 0x20u);
      }
    }
  }
  else
  {
    long long v33 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:"
            "forProfile:forConfigVersion:]";
      _os_log_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_DEFAULT, "%s explicit scores are nil - Bailing out", buf, 0xCu);
    }
  }
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  v73[1] = *MEMORY[0x263EF8340];
  id v53 = (uint64_t (**)(void))a3;
  comparativeModels = self->_comparativeModels;
  if (!comparativeModels)
  {
    uint64_t v54 = 0;
    goto LABEL_8;
  }
  uint64_t v54 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:comparativeModels withConfigFile:self->_configFilePath withResourceFile:self->_resourceFilePath withOffsetsType:0 forRetraining:1];
  if (v54 && [v54 count])
  {
LABEL_8:
    id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v54) {
      objc_msgSend(v55, "addObjectsFromArray:");
    }
    int64_t v12 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
    id v13 = [(SSRVoiceProfile *)self->_voiceProfile getExplicitEnrollmentUtterancesForType:self->_spIdType];
    uint64_t v14 = [v13 count];

    if (v14 > 2)
    {
      if (v12 >= v14)
      {
        long long v26 = (id)*MEMORY[0x263F38100];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
          *(_DWORD *)buf = 136315906;
          uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
          __int16 v64 = 2114;
          *(void *)v65 = v27;
          *(_WORD *)&v65[8] = 2050;
          *(void *)&v65[10] = v12;
          __int16 v66 = 2050;
          unint64_t v67 = v14;
          _os_log_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Processing Voice Profile %{public}@ with vectorCount %{public}lu and expVectorCount %{public}lu", buf, 0x2Au);
        }
        id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v52 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v12 - v14];
        v51 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v14];
        do
        {
          int64_t v28 = v12 - 1;
          uint64_t v29 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSpeakerVectorAtIndex:v12 - 1];
          int v30 = (id)*MEMORY[0x263F38100];
          id v31 = v30;
          if (v29)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
              unint64_t v33 = [v29 length];
              *(_DWORD *)buf = 136315906;
              uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
              __int16 v64 = 2050;
              *(void *)v65 = v12 - 1;
              *(_WORD *)&v65[8] = 2114;
              *(void *)&v65[10] = v32;
              __int16 v66 = 2050;
              unint64_t v67 = v33 >> 2;
              _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}lu vector from %{public}@ with size %{public}lu", buf, 0x2Au);
            }
            long long v34 = -[SSRVoiceProfileRetrainerPSR _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", v29, (unint64_t)[v29 length] >> 2, v55, 0);
            id v31 = v34;
            if (v34)
            {
              long long v35 = [v34 mutableCopy];
              if (v35)
              {
                if (v12 <= v14)
                {
                  [v51 addObject:v35];
                }
                else
                {
                  if (v53) {
                    char v36 = v53[2]();
                  }
                  else {
                    char v36 = 1;
                  }
                  [v52 addObject:v35];
                  if ((v36 & 1) == 0)
                  {
                    long long v40 = (id)*MEMORY[0x263F38100];
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      v41 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
                      *(_DWORD *)buf = 136315650;
                      uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                      __int16 v64 = 1026;
                      *(_DWORD *)v65 = v12 - 1;
                      *(_WORD *)&v65[4] = 2114;
                      *(void *)&v65[6] = v41;
                      _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Adding vector %{public}u for deletion from profile %{public}@", buf, 0x1Cu);
                    }
                    id v42 = [NSNumber numberWithInteger:v12 - 1];
                    [v50 addObject:v42];
                  }
                }
              }
              else
              {
                long long v39 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                  __int16 v64 = 2114;
                  *(void *)v65 = v31;
                  _os_log_error_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_ERROR, "%s Failed to allocate mapped scores for %{public}@", buf, 0x16u);
                }
                long long v35 = 0;
              }
            }
            else
            {
              long long v35 = (id)*MEMORY[0x263F38100];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                id v38 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
                *(_DWORD *)buf = 136315650;
                uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                __int16 v64 = 1026;
                *(_DWORD *)v65 = v12 - 1;
                *(_WORD *)&v65[4] = 2114;
                *(void *)&v65[6] = v38;
                _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s Failed to get scores for vectorIdx %{public}u of profile %{public}@", buf, 0x1Cu);
              }
            }
          }
          else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v37 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
            *(_DWORD *)buf = 136315650;
            uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
            __int16 v64 = 1024;
            *(_DWORD *)v65 = v12 - 1;
            *(_WORD *)&v65[4] = 2114;
            *(void *)&v65[6] = v37;
            _os_log_error_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_ERROR, "%s Failed to %u vector from profile %{public}@", buf, 0x1Cu);
          }
          int64_t v12 = v28;
        }
        while ((unint64_t)(v28 + 1) > 1);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        obuint64_t j = v50;
        uint64_t v43 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v58 != v44) {
                objc_enumerationMutation(obj);
              }
              __int16 v46 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              id v47 = (id)*MEMORY[0x263F38100];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v48 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
                *(_DWORD *)buf = 136315650;
                uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                __int16 v64 = 2114;
                *(void *)v65 = v46;
                *(_WORD *)&v65[8] = 2114;
                *(void *)&v65[10] = v48;
                _os_log_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}@ from profile %{public}@", buf, 0x20u);
              }
              -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", [v46 intValue]);
            }
            uint64_t v43 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
          }
          while (v43);
        }

        -[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:](self, "_logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:", v51, v52, [obj count], self->_voiceProfile, self->_configVersion);
        uint64_t v11 = 0;
        goto LABEL_55;
      }
      uint64_t v21 = NSString;
      id v22 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      uint64_t v23 = [v21 stringWithFormat:@"satVectorCount %lu is < %luE for profile %@ - Bailingout", v12, v14, v22];

      long long v24 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
        __int16 v64 = 2114;
        *(void *)v65 = v23;
        _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      id v25 = (void *)MEMORY[0x263F087E8];
      v68 = @"reason";
      uint64_t v69 = v23;
      obuint64_t j = (id)v23;
      id v52 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      uint64_t v20 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 754);
    }
    else
    {
      id v15 = NSString;
      id v16 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      uint64_t v17 = [v15 stringWithFormat:@"ExpSatVectorCount is invalid (%lu) for profile %@ - Bailingout", v14, v16];

      id v18 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
        __int16 v64 = 2114;
        *(void *)v65 = v17;
        _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      id v19 = (void *)MEMORY[0x263F087E8];
      v70 = @"reason";
      uint64_t v71 = v17;
      obuint64_t j = (id)v17;
      id v52 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v20 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 754);
    }
    uint64_t v11 = (void *)v20;
LABEL_55:

    uint64_t v10 = obj;
    goto LABEL_56;
  }
  id v5 = NSString;
  uint64_t v6 = self->_comparativeModels;
  uint64_t v7 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  id v55 = [v5 stringWithFormat:@"Cannot create comparative scorers from %@ on profile %@", v6, v7];

  id v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
    __int16 v64 = 2114;
    *(void *)v65 = v55;
    _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  v72 = @"reason";
  v73[0] = v55;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v73 forKeys:&v72 count:1];
  uint64_t v11 = [v9 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v10];
LABEL_56:

  return v11;
}

- (void)purgeLastSpeakerEmbedding
{
  *(void *)&v12[13] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  v4 = (id)*MEMORY[0x263F38100];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      uint64_t v7 = (v3 - 1);
      int v9 = 136315650;
      uint64_t v10 = "-[SSRVoiceProfileRetrainerPSR purgeLastSpeakerEmbedding]";
      __int16 v11 = 1026;
      *(_DWORD *)int64_t v12 = v7;
      v12[2] = 2114;
      *(void *)&v12[3] = v6;
      _os_log_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v9, 0x1Cu);
    }
    else
    {
      uint64_t v7 = (v3 - 1);
    }

    [(SSRSpeakerRecognitionScorer *)self->_psrScorer deleteVectorAtIndex:v7];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      int v9 = 136315394;
      uint64_t v10 = "-[SSRVoiceProfileRetrainerPSR purgeLastSpeakerEmbedding]";
      __int16 v11 = 2114;
      *(void *)int64_t v12 = v8;
      _os_log_error_impl(&dword_21C8A5000, v5, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5
{
  v94[1] = *MEMORY[0x263EF8340];
  id v55 = a3;
  long long v60 = (void (**)(id, void *, void *))a4;
  id v54 = a5;
  context = (void *)MEMORY[0x21D4B2500]();
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v64 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v55 && [v55 count])
  {
    id v8 = objc_alloc(MEMORY[0x263F3B3C8]);
    int v9 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer psrConfigFilePath];
    uint64_t v10 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer psrConfigRoot];
    [MEMORY[0x263F38018] inputRecordingSampleRate];
    __int16 v61 = (void *)[v8 initWithConfigFile:v9 configRoot:v10 sampleRate:(unint64_t)v11 delegate:self queue:self->_queue];

    comparativeModels = self->_comparativeModels;
    if (comparativeModels)
    {
      id v53 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:comparativeModels withConfigFile:self->_configFilePath withResourceFile:self->_resourceFilePath withOffsetsType:0 forRetraining:1];
      if (!v53 || ![v53 count])
      {
        id v13 = NSString;
        uint64_t v14 = self->_comparativeModels;
        id v15 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
        id v59 = [v13 stringWithFormat:@"Cannot create comparative scorers from %@ on profile %@", v14, v15, context];

        id v16 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          __int16 v74 = 2114;
          id v75 = v59;
          _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        if (v54)
        {
          uint64_t v17 = (void *)MEMORY[0x263F087E8];
          v91 = @"reason";
          v92[0] = v59;
          id v18 = [NSDictionary dictionaryWithObjects:v92 forKeys:&v91 count:1];
          id v19 = [v17 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v18];
          (*((void (**)(id, void *, void, void))v54 + 2))(v54, v19, 0, 0);
        }
        goto LABEL_46;
      }
    }
    else
    {
      id v53 = 0;
    }
    id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v53) {
      [v59 addObjectsFromArray:v53];
    }
    [v59 addObject:self->_psrScorer];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    obuint64_t j = v55;
    uint64_t v21 = [obj countByEnumeratingWithState:&v66 objects:v90 count:16];
    if (!v21)
    {
LABEL_44:

      if (v54) {
        (*((void (**)(void))v54 + 2))();
      }
      goto LABEL_46;
    }
    uint64_t v65 = *(void *)v67;
    uint64_t v63 = *MEMORY[0x263F08320];
LABEL_17:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v67 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void **)(*((void *)&v66 + 1) + 8 * v22);
      long long v24 = [v23 pathExtension];
      char v25 = [v24 isEqualToString:@"wav"];

      if ((v25 & 1) == 0)
      {
        int64_t v28 = NSString;
        uint64_t v29 = [v23 path];
        uint64_t v27 = [v28 stringWithFormat:@"Invalid file format %@ ", v29];

        int v30 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          __int16 v74 = 2114;
          id v75 = v27;
          _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        id v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v88 = v63;
        v89 = v27;
        uint64_t v32 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        long long v26 = [v31 errorWithDomain:@"com.apple.speakerrecognition" code:729 userInfo:v32];

        unint64_t v33 = [v23 path];
        [v64 setObject:v26 forKey:v33];
        goto LABEL_41;
      }
      long long v26 = [(SSRVoiceProfileRetrainerPSR *)self _processAudioFile:v23 withPSRProcessor:v61];
      if (!v26) {
        break;
      }
      uint64_t v27 = [v23 path];
      [v64 setObject:v26 forKey:v27];
LABEL_42:

      if (v21 == ++v22)
      {
        uint64_t v21 = [obj countByEnumeratingWithState:&v66 objects:v90 count:16];
        if (!v21) {
          goto LABEL_44;
        }
        goto LABEL_17;
      }
    }
    uint64_t v27 = [(SSRVoiceProfileRetrainerPSR *)self _processSpeakerVector:self->_speakerVector withSize:self->_speakerVectorSize withScorers:v59 processedAudioDurationMs:self->_processedAudioDurationMs];
    if (v27)
    {
      if (v60)
      {
        long long v26 = v60[2](v60, v23, v27);
        if (v26)
        {
          unint64_t v33 = [v23 path];
          [v64 setObject:v26 forKey:v33];
LABEL_41:

          goto LABEL_42;
        }
      }
      unint64_t v33 = [(NSURL *)self->_psrModelFilePath URLByDeletingLastPathComponent];
      long long v34 = (id)*MEMORY[0x263F38100];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        long long v57 = v34;
        long long v58 = [v23 lastPathComponent];
        long long v35 = [(NSURL *)self->_psrModelFilePath lastPathComponent];
        id v36 = [v33 lastPathComponent];
        long long v37 = [v33 URLByDeletingLastPathComponent];
        id v38 = [v37 lastPathComponent];
        unint64_t v39 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
        *(_DWORD *)buf = 136316674;
        v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
        __int16 v74 = 2114;
        id v75 = v58;
        __int16 v76 = 2114;
        v77 = v35;
        __int16 v78 = 2114;
        id v79 = v36;
        __int16 v80 = 2114;
        id v81 = v38;
        __int16 v82 = 2050;
        unint64_t v83 = v39;
        __int16 v84 = 2114;
        v85 = v27;
        _os_log_impl(&dword_21C8A5000, v57, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %{public}lu vector with scoreCard %{public}@", buf, 0x48u);

        long long v34 = v57;
      }

      unint64_t v40 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
      [(SSRSpeakerRecognitionScorer *)self->_psrScorer updateSAT];
      if ([(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount] - v40 == 1)
      {
        v41 = [v23 path];
        [v56 setObject:v27 forKey:v41];
        long long v26 = 0;
      }
      else
      {
        v41 = [NSString stringWithFormat:@"ERR: Reached max (%lu) of training utterances, Skipped SAT model update", -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount")];
        __int16 v48 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          __int16 v74 = 2114;
          id v75 = v41;
          _os_log_error_impl(&dword_21C8A5000, v48, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v49 = (void *)MEMORY[0x263F087E8];
        uint64_t v70 = v63;
        uint64_t v71 = v41;
        id v50 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        long long v26 = [v49 errorWithDomain:@"com.apple.speakerrecognition" code:739 userInfo:v50];

        v51 = [v23 path];
        [v64 setObject:v26 forKey:v51];
      }
    }
    else
    {
      id v42 = NSString;
      uint64_t v43 = [v23 lastPathComponent];
      uint64_t v44 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
      unint64_t v33 = [v42 stringWithFormat:@"Failed to get scorecard for utterance %@ on profile %@", v43, v44, context];

      v45 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
        __int16 v74 = 2114;
        id v75 = v33;
        _os_log_error_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      __int16 v46 = (void *)MEMORY[0x263F087E8];
      v86 = @"reason";
      v87 = v33;
      id v47 = [NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      long long v26 = [v46 errorWithDomain:@"com.apple.speakerrecognition" code:754 userInfo:v47];

      v41 = [v23 path];
      [v64 setObject:v26 forKey:v41];
    }

    goto LABEL_41;
  }
  __int16 v61 = [NSString stringWithFormat:@"File Array is nil"];
  if (v54)
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v93 = *MEMORY[0x263F08320];
    v94[0] = v61;
    id v53 = [NSDictionary dictionaryWithObjects:v94 forKeys:&v93 count:1];
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 701);
    id v59 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v54 + 2))();
LABEL_46:
  }
}

- (BOOL)implicitTrainingRequired
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
    int v7 = 136315650;
    id v8 = "-[SSRVoiceProfileRetrainerPSR implicitTrainingRequired]";
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
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [(SSRVoiceProfile *)self->_voiceProfile voiceProfileBasePath];
  char v32 = 0;
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v32];
  if (v32) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }
  if ((v8 & 1) == 0)
  {
    id v18 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      __int16 v35 = 2114;
      unint64_t v36 = (unint64_t)v6;
      __int16 v37 = 1026;
      LODWORD(v38) = 0;
      _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s ERR: Cannot find SAT Audio dir at %{public}@: isDir: %{public}d - Bailing out", buf, 0x1Cu);
    }
    goto LABEL_14;
  }
  if (![(SSRSpeakerRecognitionScorer *)self->_psrScorer satModelAvailable])
  {
    uint64_t v20 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315138;
    long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    uint64_t v21 = "%s PSRNeedsRetraining(YES): satModelAvailable is not available!";
    uint64_t v22 = v20;
    uint32_t v23 = 12;
LABEL_19:
    _os_log_impl(&dword_21C8A5000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_20;
  }
  __int16 v9 = [(NSURL *)self->_psrModelFilePath path];
  char v10 = [v5 fileExistsAtPath:v9 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    long long v24 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    psrModelFilePath = self->_psrModelFilePath;
    *(_DWORD *)buf = 136315394;
    long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    __int16 v35 = 2114;
    unint64_t v36 = (unint64_t)psrModelFilePath;
    uint64_t v21 = "%s PSRNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    uint64_t v22 = v24;
    uint32_t v23 = 22;
    goto LABEL_19;
  }
  unint64_t v11 = [v4 count];
  unint64_t v12 = [(SSRSpeakerRecognitionScorer *)self->_psrScorer getSATVectorCount];
  unint64_t v13 = v12;
  unint64_t maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v11 <= maximumSpeakerVectors && v12 != v11)
  {
    id v15 = (id)*MEMORY[0x263F38100];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = self->_maximumSpeakerVectors;
      uint64_t v17 = +[SSRUtils stringForCSSpIdType:self->_spIdType];
      *(_DWORD *)buf = 136316162;
      long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      __int16 v35 = 2050;
      unint64_t v36 = v11;
      __int16 v37 = 2050;
      unint64_t v38 = v13;
      __int16 v39 = 2050;
      unint64_t v40 = v16;
      __int16 v41 = 2114;
      id v42 = v17;
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)", buf, 0x34u);
    }
LABEL_11:

LABEL_20:
    BOOL v19 = 1;
    goto LABEL_21;
  }
  id v15 = (id)*MEMORY[0x263F38100];
  BOOL v27 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v11 > maximumSpeakerVectors && v13 != maximumSpeakerVectors)
  {
    if (v27)
    {
      unint64_t v28 = self->_maximumSpeakerVectors;
      uint64_t v29 = +[SSRUtils stringForCSSpIdType:self->_spIdType];
      *(_DWORD *)buf = 136316162;
      long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      __int16 v35 = 2050;
      unint64_t v36 = v11;
      __int16 v37 = 2050;
      unint64_t v38 = v13;
      __int16 v39 = 2050;
      unint64_t v40 = v28;
      __int16 v41 = 2114;
      id v42 = v29;
      _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)", buf, 0x34u);
    }
    goto LABEL_11;
  }
  if (v27)
  {
    unint64_t v30 = self->_maximumSpeakerVectors;
    id v31 = +[SSRUtils stringForCSSpIdType:self->_spIdType];
    *(_DWORD *)buf = 136316162;
    long long v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    __int16 v35 = 2050;
    unint64_t v36 = v11;
    __int16 v37 = 2050;
    unint64_t v38 = v13;
    __int16 v39 = 2050;
    unint64_t v40 = v30;
    __int16 v41 = 2114;
    id v42 = v31;
    _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", buf, 0x34u);
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_21:

  return v19;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = +[SSRUtils stringForSpeakerRecognizerType:1];
  id v5 = [(SSRVoiceProfile *)self->_voiceProfile profileID];
  uint64_t v6 = [v3 stringWithFormat:@"{%@:%@}", v4, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "-[SSRVoiceProfileRetrainerPSR dealloc]";
    __int16 v7 = 2114;
    char v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerPSR;
  [(SSRVoiceProfileRetrainerPSR *)&v4 dealloc];
}

- (BOOL)resetModelForRetraining
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    psrModelFilePath = self->_psrModelFilePath;
    int v8 = 136315394;
    uint64_t v9 = "-[SSRVoiceProfileRetrainerPSR resetModelForRetraining]";
    __int16 v10 = 2114;
    unint64_t v11 = psrModelFilePath;
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

- (SSRVoiceProfileRetrainerPSR)initWithVoiceRetrainingContext:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SSRVoiceProfileRetrainerPSR;
  id v5 = [(SSRVoiceProfileRetrainerPSR *)&v40 init];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = [v4 modelsContext];
  __int16 v7 = +[SSRUtils stringForSpeakerRecognizerType:1];
  int v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    __int16 v37 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      unint64_t v38 = "%s PSRModel Retraining context is nil! - Skipping";
LABEL_14:
      _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
    }
LABEL_15:

    unint64_t v36 = 0;
    goto LABEL_16;
  }
  if ([v4 forceRetrain])
  {
    uint64_t v9 = (id)*MEMORY[0x263F37FA0];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [v8 voiceProfileModelFilePath];
      *(_DWORD *)buf = 136315394;
      id v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      __int16 v43 = 2114;
      uint64_t v44 = v10;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);
    }
    unint64_t v11 = [v8 voiceProfileModelFilePath];
    uint64_t v12 = [v11 path];
    id v13 = +[SSRUtils removeItemAtPath:v12];
  }
  uint64_t v14 = [SSRSpeakerRecognitionScorer alloc];
  id v15 = [v4 voiceProfile];
  unint64_t v16 = [v15 profileID];
  uint64_t v17 = [v8 voiceProfileModelFilePath];
  id v18 = [v8 configFilePath];
  BOOL v19 = [v4 resourceFilePath];
  uint64_t v20 = [(SSRSpeakerRecognitionScorer *)v14 initWithProfileID:v16 withModelFile:v17 withConfigFile:v18 withResourceFile:v19 withOffsetsType:0 forRetraining:1];
  psrScorer = v5->_psrScorer;
  v5->_psrScorer = (SSRSpeakerRecognitionScorer *)v20;

  if (!v5->_psrScorer)
  {
    __int16 v37 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      unint64_t v38 = "%s ERR: Cannot create PSR Scorer";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  dispatch_queue_t v22 = dispatch_queue_create("com.apple.corespeech.speakerretrain.psrq", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v22;

  uint64_t v24 = [v8 configFilePath];
  configFilePath = v5->_configFilePath;
  v5->_configFilePath = (NSURL *)v24;

  uint64_t v26 = [v4 resourceFilePath];
  resourceFilePath = v5->_resourceFilePath;
  v5->_resourceFilePath = (NSURL *)v26;

  uint64_t v28 = [v8 voiceProfileModelFilePath];
  psrModelFilePath = v5->_psrModelFilePath;
  v5->_psrModelFilePath = (NSURL *)v28;

  uint64_t v30 = [v4 voiceProfile];
  voiceProfile = v5->_voiceProfile;
  v5->_voiceProfile = (SSRVoiceProfile *)v30;

  uint64_t v32 = [v8 compareModelFilePaths];
  comparativeModels = v5->_comparativeModels;
  v5->_comparativeModels = (NSDictionary *)v32;

  v5->_unint64_t maximumSpeakerVectors = [v4 maxAllowedSpeakerVectors];
  uint64_t v34 = [v4 configVersion];
  configVersion = v5->_configVersion;
  v5->_configVersion = (NSString *)v34;

  v5->_spIdType = [v4 spIdType];
LABEL_9:
  unint64_t v36 = v5;
LABEL_16:

  return v36;
}

@end