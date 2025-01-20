@interface SSRSpeakerAnalyzerSAT
- (NSArray)satScorers;
- (NSDictionary)scoreCard;
- (NSDictionary)voiceProfilesExpModelFilePaths;
- (NSDictionary)voiceProfilesModelFilePaths;
- (NSURL)configFilePath;
- (NSURL)resourceFilePath;
- (OS_dispatch_queue)desRecordQueue;
- (OS_dispatch_queue)queue;
- (SSRSpeakerAnalyzerSAT)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4;
- (SSRSpeakerAnalyzerSATDelegate)delegate;
- (SSRSpeakerRecognitionContext)context;
- (id)_getAnalyzedResult;
- (id)_getSuperVectorWithEndPoint:(unint64_t)a3;
- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5 isFinal:(BOOL)a6;
- (id)_updateScoreCardForFinalResult:(BOOL)a3;
- (id)getVoiceRecognizerResults;
- (id)resetForNewRequest;
- (void)dealloc;
- (void)endAudio;
- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4;
- (void)setConfigFilePath:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesRecordQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResourceFilePath:(id)a3;
- (void)setSatScorers:(id)a3;
- (void)setScoreCard:(id)a3;
- (void)setVoiceProfilesExpModelFilePaths:(id)a3;
- (void)setVoiceProfilesModelFilePaths:(id)a3;
@end

@implementation SSRSpeakerAnalyzerSAT

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desRecordQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scoreCard, 0);
  objc_storeStrong((id *)&self->_satScorers, 0);
  objc_storeStrong((id *)&self->_voiceProfilesExpModelFilePaths, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDesRecordQueue:(id)a3
{
}

- (OS_dispatch_queue)desRecordQueue
{
  return self->_desRecordQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setScoreCard:(id)a3
{
}

- (NSDictionary)scoreCard
{
  return self->_scoreCard;
}

- (void)setSatScorers:(id)a3
{
}

- (NSArray)satScorers
{
  return self->_satScorers;
}

- (void)setVoiceProfilesExpModelFilePaths:(id)a3
{
}

- (NSDictionary)voiceProfilesExpModelFilePaths
{
  return self->_voiceProfilesExpModelFilePaths;
}

- (void)setVoiceProfilesModelFilePaths:(id)a3
{
}

- (NSDictionary)voiceProfilesModelFilePaths
{
  return self->_voiceProfilesModelFilePaths;
}

- (void)setContext:(id)a3
{
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
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

- (void)setDelegate:(id)a3
{
}

- (SSRSpeakerAnalyzerSATDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRSpeakerAnalyzerSATDelegate *)WeakRetained;
}

- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5 isFinal:(BOOL)a6
{
  BOOL v38 = a6;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v41 = a3;
  v40 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  v36 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  v39 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  BOOL v8 = [(SSRSpeakerRecognitionContext *)self->_context recognitionStyle] == 1
    && !self->_triggerPhraseDetectedOnTap;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obj = self->_satScorers;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v13 analyzeSuperVector:v41 withDimensions:a4 withThresholdType:v8];
        v14 = objc_msgSend(NSNumber, "numberWithFloat:");
        v15 = [v13 profileID];
        [v40 setObject:v14 forKeyedSubscript:v15];

        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "getSATVectorCount"));
        v17 = [v13 profileID];
        [v39 setObject:v16 forKeyedSubscript:v17];

        if (v38)
        {
          voiceProfilesExpModelFilePaths = self->_voiceProfilesExpModelFilePaths;
          if (voiceProfilesExpModelFilePaths)
          {
            v19 = [v13 profileID];
            v20 = [(NSDictionary *)voiceProfilesExpModelFilePaths objectForKeyedSubscript:v19];

            if (v20)
            {
              v21 = self->_voiceProfilesExpModelFilePaths;
              v22 = [v13 profileID];
              v23 = [(NSDictionary *)v21 objectForKeyedSubscript:v22];
              [v13 resetScorerWithModelFilePath:v23];

              [v13 analyzeSuperVector:v41 withDimensions:a4 withThresholdType:v8];
              v24 = objc_msgSend(NSNumber, "numberWithFloat:");
              v25 = [v13 profileID];
              [v36 setObject:v24 forKeyedSubscript:v25];
            }
          }
        }
        voiceProfilesModelFilePaths = self->_voiceProfilesModelFilePaths;
        v27 = [v13 profileID];
        v28 = [(NSDictionary *)voiceProfilesModelFilePaths objectForKeyedSubscript:v27];
        [v13 resetScorerWithModelFilePath:v28];
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v10);
  }

  v48[0] = @"configPath";
  v29 = [(NSURL *)self->_configFilePath path];
  v48[1] = @"numSpeakerVectors";
  v49[0] = v29;
  v49[1] = v39;
  v30 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

  v46[0] = @"spIdKnownUserSATScores";
  v46[1] = @"spIdKnownUserSATExpScores";
  v47[0] = v40;
  v47[1] = v36;
  v46[2] = @"spIdUnknownUserScore";
  v31 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  v47[2] = v31;
  v46[3] = @"spIdAudioProcessedDuration";
  v32 = [NSNumber numberWithUnsignedInteger:a5];
  v46[4] = @"satContext";
  v47[3] = v32;
  v47[4] = v30;
  v33 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];

  return v33;
}

- (id)_getSuperVectorWithEndPoint:(unint64_t)a3
{
  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      novDetect = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)novDetect length:4 * novDetect[2]];
    }
  }

  return novDetect;
}

- (id)_getAnalyzedResult
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_novDetect)
  {
    v4 = (unsigned int *)nd_getresults();
    if (v4)
    {
      v5 = v4;
      v6 = [NSNumber numberWithUnsignedInt:*v4];
      [v3 setObject:v6 forKey:@"samples_fed"];

      v7 = [NSNumber numberWithUnsignedInt:v5[1]];
      [v3 setObject:v7 forKey:@"best_start"];

      BOOL v8 = [NSNumber numberWithUnsignedInt:v5[3]];
      [v3 setObject:v8 forKey:@"best_phrase"];

      uint64_t v9 = [NSNumber numberWithUnsignedInt:v5[2]];
      [v3 setObject:v9 forKey:@"best_end"];

      LODWORD(v10) = v5[4];
      uint64_t v11 = [NSNumber numberWithFloat:v10];
      [v3 setObject:v11 forKey:@"best_score"];

      v12 = [NSNumber numberWithBool:*((unsigned __int8 *)v5 + 20)];
      [v3 setObject:v12 forKey:@"early_warning"];

      v13 = [NSNumber numberWithBool:*((unsigned __int8 *)v5 + 21)];
      [v3 setObject:v13 forKey:@"is_rescoring"];
    }
  }

  return v3;
}

- (id)_updateScoreCardForFinalResult:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x263EF8340];
  v5 = [(SSRSpeakerAnalyzerSAT *)self _getAnalyzedResult];
  unint64_t numSamplesProcessed = self->_numSamplesProcessed;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  if (v5)
  {
    float v8 = v7;
    uint64_t v9 = [v5 objectForKeyedSubscript:@"best_end"];
    double v10 = -[SSRSpeakerAnalyzerSAT _getSuperVectorWithEndPoint:](self, "_getSuperVectorWithEndPoint:", [v9 integerValue]);

    if (v10 && [v10 length])
    {
      uint64_t v11 = -[SSRSpeakerAnalyzerSAT _processSuperVector:withSize:processedAudioDurationMs:isFinal:](self, "_processSuperVector:withSize:processedAudioDurationMs:isFinal:", v10, [v10 length] >> 2, (uint64_t)((double)numSamplesProcessed * 1000.0 / v8), v3);
      objc_storeStrong((id *)&self->_scoreCard, v11);
      v12 = 0;
    }
    else
    {
      v13 = NSString;
      v14 = [(SSRSpeakerRecognitionContext *)self->_context sessionId];
      v15 = [v13 stringWithFormat:@"ERR: %@ failed to get valid supervector", v14];

      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08320];
      v21[0] = v15;
      v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v12 = [v16 errorWithDomain:@"com.apple.speakerrecognition" code:743 userInfo:v17];

      v18 = [(SSRSpeakerRecognitionContext *)self->_context logAggregator];
      [v18 setSpeakerRecognitionSATProcessingStatus:743];

      uint64_t v11 = 0;
    }
  }
  else
  {
    v12 = 0;
    uint64_t v11 = 0;
  }

  return v12;
}

- (id)getVoiceRecognizerResults
{
  uint64_t v6 = 0;
  float v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8421;
  double v10 = __Block_byref_object_dispose__8422;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke;
  v5[3] = &unk_26442A648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke_2;
  v2[3] = &unk_26442A648;
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 104), v2);
}

void __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke_2(uint64_t a1)
{
  v18[3] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"spIdKnownUserSATScores"];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"spIdKnownUserSATScores"];
    v4 = [v3 allValues];
    v5 = [v4 firstObject];
    [v5 floatValue];
    int v7 = v6;
  }
  else
  {
    int v7 = -998637568;
  }

  v17[0] = @"assetConfigVersion";
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) configVersion];
  v18[0] = v8;
  v17[1] = @"satScore";
  LODWORD(v9) = v7;
  double v10 = [NSNumber numberWithFloat:v9];
  v18[1] = v10;
  v17[2] = @"modelType";
  id v11 = +[SSRUtils stringForSpeakerRecognizerType:2];
  v18[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  v13 = [*(id *)(a1 + 32) _getAnalyzedResult];
  v14 = *(void **)(a1 + 32);
  v15 = [v13 objectForKeyedSubscript:@"best_end"];
  v16 = objc_msgSend(v14, "_getSuperVectorWithEndPoint:", objc_msgSend(v15, "integerValue"));

  +[SSRDESRecordWriter createDESRecordWithSuperVector:v16 withMetaInfo:v12];
}

- (id)resetForNewRequest
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = nd_reset();
  self->_unint64_t numSamplesProcessed = 0;
  self->_triggerPhraseDetectedOnTap = 0;
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = [(SSRSpeakerRecognitionContext *)self->_context logAggregator];
    [v5 setSpeakerRecognitionSATProcessingStatus:753];

    int v6 = objc_msgSend(NSString, "stringWithFormat:", @"Failed with errorcode : %d", v4);
    int v7 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[SSRSpeakerAnalyzerSAT resetForNewRequest]";
      __int16 v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    v12 = @"reason";
    v13 = v6;
    double v9 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    double v10 = [v8 errorWithDomain:@"com.apple.speakerrecognition" code:753 userInfo:v9];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SSRSpeakerAnalyzerSAT_endAudio__block_invoke;
  block[3] = &unk_26442A618;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__SSRSpeakerAnalyzerSAT_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _updateScoreCardForFinalResult:1];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "-[SSRSpeakerAnalyzerSAT endAudio]_block_invoke";
      __int16 v9 = 2114;
      double v10 = v2;
      _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to get score card with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      [v6 voiceRecognitionSATAnalyzerFinishedProcessing:*(void *)(a1 + 32) withVoiceRecognitionInfo:*(void *)(*(void *)(a1 + 32) + 88)];
    }
  }
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SSRSpeakerAnalyzerSAT_processAudioData_numSamples___block_invoke;
  block[3] = &unk_26442A5F0;
  id v10 = v6;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __53__SSRSpeakerAnalyzerSAT_processAudioData_numSamples___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 bytes] && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    [*(id *)(a1 + 32) bytes];
    nd_wavedata();
    *(void *)(*(void *)(a1 + 40) + 16) += *(void *)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 40) _updateScoreCardForFinalResult:0];
    if (!v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
      char v5 = objc_opt_respondsToSelector();

      uint64_t v3 = 0;
      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
        [v6 voiceRecognitionSATAnalyzer:*(void *)(a1 + 40) hasVoiceRecognitionInfo:*(void *)(*(void *)(a1 + 40) + 88)];

        uint64_t v3 = 0;
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SSRSpeakerAnalyzerSAT dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s %@: dealloc", buf, 0x16u);
  }
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerAnalyzerSAT;
  [(SSRSpeakerAnalyzerSAT *)&v4 dealloc];
}

- (SSRSpeakerAnalyzerSAT)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)SSRSpeakerAnalyzerSAT;
  uint64_t v9 = [(SSRSpeakerAnalyzerSAT *)&v49 init];
  if (!v9) {
    goto LABEL_21;
  }
  id v10 = [v7 modelsContext];
  uint64_t v11 = +[SSRUtils stringForSpeakerRecognizerType:2];
  unint64_t v12 = [v10 objectForKeyedSubscript:v11];

  v13 = [v7 expModelsContext];
  v14 = +[SSRUtils stringForSpeakerRecognizerType:2];
  v15 = [v13 objectForKeyedSubscript:v14];

  if (!v12)
  {
    long long v45 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_DEFAULT, "%s ERR: modelContext is nil! - Bailing out", buf, 0xCu);
    }
    goto LABEL_16;
  }
  objc_storeWeak((id *)&v9->_delegate, v8);
  uint64_t v16 = [v12 configFilePath];
  configFilePath = v9->_configFilePath;
  v9->_configFilePath = (NSURL *)v16;

  uint64_t v18 = [v7 resourceFilePath];
  resourceFilePath = v9->_resourceFilePath;
  v9->_resourceFilePath = (NSURL *)v18;

  uint64_t v20 = [v12 voiceProfilesModelFilePaths];
  voiceProfilesModelFilePaths = v9->_voiceProfilesModelFilePaths;
  v9->_voiceProfilesModelFilePaths = (NSDictionary *)v20;

  uint64_t v22 = [v15 voiceProfilesModelFilePaths];
  voiceProfilesExpModelFilePaths = v9->_voiceProfilesExpModelFilePaths;
  v9->_voiceProfilesExpModelFilePaths = (NSDictionary *)v22;

  objc_storeStrong((id *)&v9->_context, a3);
  uint64_t v24 = [MEMORY[0x263F380D0] getSerialQueueWithQOS:33 name:@"com.apple.ssr.satq" fixedPriority:*MEMORY[0x263F38110]];
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v24;

  dispatch_queue_t v26 = dispatch_queue_create("com.apple.ssr.satq.desrecordq", 0);
  desRecordQueue = v9->_desRecordQueue;
  v9->_desRecordQueue = (OS_dispatch_queue *)v26;

  v28 = v9->_voiceProfilesModelFilePaths;
  v29 = v9->_configFilePath;
  v30 = [v7 resourceFilePath];
  uint64_t v31 = +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:v28 withConfigFile:v29 withResourceFile:v30 withOffsetsType:0 forRetraining:0];
  satScorers = v9->_satScorers;
  v9->_satScorers = (NSArray *)v31;

  v33 = v9->_satScorers;
  if (!v33 || ![(NSArray *)v33 count])
  {
    long long v44 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v44, OS_LOG_TYPE_DEFAULT, "%s ERR: Cannot create Voice Scorers", buf, 0xCu);
    }
    id v41 = [v7 logAggregator];
    long long v42 = v41;
    uint64_t v43 = 106;
    goto LABEL_13;
  }
  v9->_unint64_t numSamplesProcessed = 0;
  uint64_t v34 = nd_create();
  v9->_novDetect = (void *)v34;
  if (!v34)
  {
    v47 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v47, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to create NovDetect", buf, 0xCu);
    }
    id v41 = [v7 logAggregator];
    long long v42 = v41;
    uint64_t v43 = 105;
    goto LABEL_13;
  }
  id v35 = [(NSURL *)v9->_configFilePath path];
  [v35 UTF8String];
  id v36 = [(NSURL *)v9->_resourceFilePath path];
  [v36 UTF8String];
  int v37 = nd_initialize();

  if (!v37)
  {

LABEL_21:
    v46 = v9;
    goto LABEL_22;
  }
  BOOL v38 = (void *)*MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    uint64_t v40 = nd_error();
    *(_DWORD *)buf = 136315650;
    uint64_t v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
    __int16 v52 = 1026;
    int v53 = v37;
    __int16 v54 = 2082;
    uint64_t v55 = v40;
    _os_log_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize _novDetect: err=[%{public}d]:%{public}s", buf, 0x1Cu);
  }
  id v41 = [v7 logAggregator];
  long long v42 = v41;
  uint64_t v43 = 104;
LABEL_13:
  [v41 setSpeakerRecognitionSATProcessingStatus:v43];

LABEL_16:
  v46 = 0;
LABEL_22:

  return v46;
}

@end