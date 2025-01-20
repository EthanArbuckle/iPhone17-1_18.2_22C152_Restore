@interface VTVoiceProfileRetrainer
- (BOOL)_updatePruningCookie:(id)a3;
- (BOOL)pruneVoiceProfileIfNecessary;
- (NSString)configPath;
- (NSString)languageCode;
- (NSString)resourcePath;
- (OS_dispatch_semaphore)satRetrainingTdSrSemaphore;
- (VTAnalyzerNDAPI)analyzer;
- (VTTextDependentSpeakerRecognizer)satRetrainingTdSr;
- (VTVoiceProfileRetrainer)initWithAnalyzer:(id)a3 languageCode:(id)a4 modelType:(unint64_t)a5 configPath:(id)a6 resourcePath:(id)a7;
- (double)_computeSamplingMSEForUtts:(id)a3 withBeforeScores:(id)a4;
- (id)_analyzeEnrollmentUtts:(id)a3 thresholdTrigger:(double)a4 thresholdSAT:(double)a5 thresholdTDSR:(double)a6 isUpdatingModel:(BOOL)a7 extraUtts:(id *)a8 discardUtts:(id *)a9 psrTimeout:(BOOL *)a10;
- (id)_getLastPruningCookie;
- (unint64_t)_deleteUtterances:(id)a3;
- (unint64_t)modelType;
- (void)dealloc;
- (void)retrainSATModelWithCompletion:(id)a3;
- (void)setAnalyzer:(id)a3;
- (void)setConfigPath:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setModelType:(unint64_t)a3;
- (void)setResourcePath:(id)a3;
- (void)setSatRetrainingTdSr:(id)a3;
- (void)setSatRetrainingTdSrSemaphore:(id)a3;
- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4;
- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4;
@end

@implementation VTVoiceProfileRetrainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satRetrainingTdSrSemaphore, 0);
  objc_storeStrong((id *)&self->_satRetrainingTdSr, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_analyzer, 0);
}

- (void)setSatRetrainingTdSrSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)satRetrainingTdSrSemaphore
{
  return self->_satRetrainingTdSrSemaphore;
}

- (void)setSatRetrainingTdSr:(id)a3
{
}

- (VTTextDependentSpeakerRecognizer)satRetrainingTdSr
{
  return self->_satRetrainingTdSr;
}

- (void)setResourcePath:(id)a3
{
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setConfigPath:(id)a3
{
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setModelType:(unint64_t)a3
{
  self->_modelType = a3;
}

- (unint64_t)modelType
{
  return self->_modelType;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setAnalyzer:(id)a3
{
}

- (VTAnalyzerNDAPI)analyzer
{
  return self->_analyzer;
}

- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  id v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    satRetrainingTdSr = self->_satRetrainingTdSr;
    int v14 = 138543874;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = satRetrainingTdSr;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "tdSR: %{public}@, _tdSrForSatRetraining:%{public}@, ERROR: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  if (self->_satRetrainingTdSr == v6)
  {
    [(VTTextDependentSpeakerRecognizer *)v6 deleteExistingSATModel];
    v11 = self->_satRetrainingTdSr;
    self->_satRetrainingTdSr = 0;

    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "VTTextDependentSpeakerRecognizer failed with Error during RETRAINING", (uint8_t *)&v14, 2u);
    }
    v13 = +[VTAggregator sharedAggregator];
    [v13 logTdPsrFailedDuringSATRetraining];
  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "ERR: VTTextDependentSpeakerRecognizer failed for unmanaged TD-SR instance!!!", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2050;
    double v12 = a4;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "textDependentSpeakerRecognizer:hasSatScore: %{public}@: %{public}f, signalling now", (uint8_t *)&v9, 0x16u);
  }
  if (self->_satRetrainingTdSr == v6)
  {
    self->_retrainTDSRScore = a4;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_satRetrainingTdSrSemaphore);
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "ERR: textDependentSpeakerRecognizer called for unmanaged TD-SR instance: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)_analyzeEnrollmentUtts:(id)a3 thresholdTrigger:(double)a4 thresholdSAT:(double)a5 thresholdTDSR:(double)a6 isUpdatingModel:(BOOL)a7 extraUtts:(id *)a8 discardUtts:(id *)a9 psrTimeout:(BOOL *)a10
{
  BOOL v85 = a7;
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t inPropertyData = 0x40CF400000000000;
  long long v109 = xmmword_21852DDF0;
  long long v110 = xmmword_21852DE00;
  id v89 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v88 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v91 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v104 objects:v123 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    unint64_t v18 = 0x263EFF000;
    uint64_t v19 = *(void *)v105;
    *(void *)&long long v16 = 134349824;
    long long v84 = v16;
    id v95 = v14;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v105 != v19) {
          objc_enumerationMutation(v14);
        }
        double v21 = *(double *)(*((void *)&v104 + 1) + 8 * i);
        if (v21 != 0.0)
        {
          ExtAudioFileRef outExtAudioFile = 0;
          AudioFileID inAudioFile = 0;
          if (AudioFileOpenURL((CFURLRef)[*(id *)(v18 + 2608) URLWithString:*(void *)&v21], kAudioFileReadPermission, 0, &inAudioFile))
          {
            goto LABEL_14;
          }
          if (ExtAudioFileWrapAudioFileID(inAudioFile, 0, &outExtAudioFile))
          {
            AudioFileClose(inAudioFile);
LABEL_14:
            AudioFileID inAudioFile = 0;
LABEL_15:
            v22 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              double v112 = v21;
              _os_log_impl(&dword_21844F000, v22, OS_LOG_TYPE_DEFAULT, "Audio file at %{public}@ cannot be open, skipping...", buf, 0xCu);
            }
            continue;
          }
          if (!inAudioFile) {
            goto LABEL_15;
          }
          uint64_t v101 = 0;
          memset(outPropertyData, 0, sizeof(outPropertyData));
          UInt32 ioPropertyDataSize = 40;
          ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
          ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, &inPropertyData);
          id v96 = [MEMORY[0x263EFF990] dataWithLength:2048];
          v23 = (void *)[v96 mutableBytes];
          *(void *)&ioData.mNumberBuffers = 1;
          *(void *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001;
          ioData.mBuffers[0].mData = v23;
          satRetrainingTdSr = self->_satRetrainingTdSr;
          if (satRetrainingTdSr)
          {
            [(VTTextDependentSpeakerRecognizer *)satRetrainingTdSr resetForNewRequest];
            v25 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
            satRetrainingTdSrSemaphore = self->_satRetrainingTdSrSemaphore;
            self->_satRetrainingTdSrSemaphore = v25;
          }
          v27 = 0;
          for (int j = 0; ; j += ioData.mBuffers[0].mDataByteSize)
          {
            UInt32 ioNumberFrames = 1024;
            OSStatus v30 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
            if (v30) {
              break;
            }
            if (!ioNumberFrames)
            {
              [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr endAudio];
              if (self->_satRetrainingTdSr)
              {
                uint64_t v39 = [MEMORY[0x263EFF910] date];
                dispatch_time_t v40 = dispatch_time(0, 1000000000);
                *(double *)&intptr_t v41 = COERCE_DOUBLE(dispatch_semaphore_wait((dispatch_semaphore_t)self->_satRetrainingTdSrSemaphore, v40));
                v93 = [MEMORY[0x263EFF910] date];
                v94 = (void *)v39;
                [v93 timeIntervalSinceDate:v39];
                double v43 = v42 * 1000.0;
                v44 = (void *)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_satRetrainingTdSr;
                  v46 = v44;
                  [(VTTextDependentSpeakerRecognizer *)v45 lastRequestSatScore];
                  *(_DWORD *)buf = 134349568;
                  double v112 = *(double *)&v41;
                  __int16 v113 = 2050;
                  double v114 = v43;
                  __int16 v115 = 2050;
                  double v116 = v47;
                  _os_log_impl(&dword_21844F000, v46, OS_LOG_TYPE_DEFAULT, "TDSR:: Retraining: Done Waiting with timedOut=%{public}ld, tdPsrSATRetrainingWaitTimeMs: %{public}fms, _lastTdSpeakerRecognizerSATScore=%{public}f", buf, 0x20u);
                }
                v48 = +[VTAggregator sharedAggregator];
                v49 = v48;
                intptr_t v92 = v41;
                if (*(double *)&v41 == 0.0)
                {
                  [v48 logTdPsrSATRetrainingWaitTimeMs:v43];
                }
                else
                {
                  [v48 logTdPsrSATRetrainingTimedOut];

                  if (a10) {
                    *a10 = 1;
                  }
                }

                if (v27)
                {
LABEL_41:
                  v53 = -[VTAnalyzerNDAPI getSuperVectorWithEndPoint:](self->_analyzer, "getSuperVectorWithEndPoint:", v27->var2, v84);
                  if (v53 && v53->var0 && v53->var1)
                  {
                    v54 = -[VTAnalyzerNDAPI analyzeSAT:size:](self->_analyzer, "analyzeSAT:size:");
                    if (v54)
                    {
                      p_float var0 = &v54->var0;
                      float var0 = v54->var0;
                      v57 = self->_satRetrainingTdSr;
                      if (v57) {
                        [(VTTextDependentSpeakerRecognizer *)v57 getCombinationWeight];
                      }
                      else {
                        double v58 = 0.0;
                      }
                      double v62 = var0;
                      double retrainTDSRScore = self->_retrainTDSRScore;
                      double v64 = v58 * retrainTDSRScore + (1.0 - v58) * var0;
                      if (v27->var4 < a4)
                      {
LABEL_60:
                        v65 = [NSNumber numberWithDouble:v64];
                        [v91 setObject:v65 forKey:*(void *)&v21];

                        if (v92)
                        {
                          [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
                          v66 = self->_satRetrainingTdSr;
                          self->_satRetrainingTdSr = 0;
                        }
                        v67 = self->_satRetrainingTdSr;
                        v68 = VTLogContextFacilityVoiceTrigger;
                        BOOL v69 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR);
                        if (v67)
                        {
                          if (v69)
                          {
                            double var4 = v27->var4;
                            double retrainThresholdTDSR = self->_retrainThresholdTDSR;
                            double v71 = self->_retrainTDSRScore;
                            *(_DWORD *)buf = 134350336;
                            double v112 = var4;
                            __int16 v113 = 2050;
                            double v114 = a4;
                            __int16 v115 = 2050;
                            double v116 = v71;
                            __int16 v117 = 2050;
                            double v118 = retrainThresholdTDSR;
                            __int16 v119 = 2050;
                            double v120 = v64;
                            __int16 v121 = 2050;
                            double v122 = a5;
                            _os_log_error_impl(&dword_21844F000, v68, OS_LOG_TYPE_ERROR, "ERR: Utterance failed in retraining - triggerCondition:%{public}.3f(%{public}.3f) tdsr:%{public}.3f(%{public}.3f) combined:%{public}.3f(%{public}.3f)", buf, 0x3Eu);
                          }
                        }
                        else if (v69)
                        {
                          double v73 = v27->var4;
                          *(_DWORD *)buf = v84;
                          double v112 = v73;
                          __int16 v113 = 2050;
                          double v114 = a4;
                          __int16 v115 = 2050;
                          double v116 = v62;
                          __int16 v117 = 2050;
                          double v118 = a5;
                          _os_log_error_impl(&dword_21844F000, v68, OS_LOG_TYPE_ERROR, "ERR: Utterance failed in retraining - triggerCondition:%{public}.3f(%{public}.3f) sat:%{public}.3f(%{public}.3f)", buf, 0x2Au);
                        }
                      }
                      else
                      {
                        if (self->_satRetrainingTdSr)
                        {
                          if (v92 || retrainTDSRScore < self->_retrainThresholdTDSR && v64 < a5) {
                            goto LABEL_60;
                          }
                        }
                        else if (*p_var0 < a5)
                        {
                          goto LABEL_60;
                        }
                        v74 = [NSNumber numberWithDouble:v64];
                        [v89 setObject:v74 forKey:*(void *)&v21];

                        v75 = VTLogContextFacilityVoiceTrigger;
                        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                        {
                          double v76 = *p_var0;
                          double v77 = self->_retrainTDSRScore;
                          *(_DWORD *)buf = 138543874;
                          double v112 = v21;
                          __int16 v113 = 2050;
                          double v114 = v76;
                          __int16 v115 = 2050;
                          double v116 = v77;
                          _os_log_impl(&dword_21844F000, v75, OS_LOG_TYPE_DEFAULT, "Analyze of %{public}@ is successful with SAT score of %{public}.3f, uttSATScore=%{public}.3f", buf, 0x20u);
                        }
                        if (v85)
                        {
                          int v78 = [(VTAnalyzerNDAPI *)self->_analyzer getSATVectorCount];
                          [(VTAnalyzerNDAPI *)self->_analyzer updateSAT];
                          v79 = self->_satRetrainingTdSr;
                          if (v92)
                          {
                            [(VTTextDependentSpeakerRecognizer *)v79 deleteExistingSATModel];
                            v80 = self->_satRetrainingTdSr;
                            self->_satRetrainingTdSr = 0;
                          }
                          else
                          {
                            [(VTTextDependentSpeakerRecognizer *)v79 updateSAT];
                          }
                          if ([(VTAnalyzerNDAPI *)self->_analyzer getSATVectorCount] - v78 != 1)
                          {
                            v81 = VTLogContextFacilityVoiceTrigger;
                            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_error_impl(&dword_21844F000, v81, OS_LOG_TYPE_ERROR, "ERR: Reached maximum number of training utterances, skipping updating model", buf, 2u);
                            }
                            v82 = [NSNumber numberWithDouble:v64];
                            [v88 setObject:v82 forKey:*(void *)&v21];

                            [v89 removeObjectForKey:*(void *)&v21];
                          }
                        }
                      }
                    }
                    else
                    {
                      [v91 setObject:&unk_26C9A8B80 forKey:*(void *)&v21];
                      v61 = VTLogContextFacilityVoiceTrigger;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        double v112 = v21;
                        _os_log_error_impl(&dword_21844F000, v61, OS_LOG_TYPE_ERROR, "ERR: Analyze of %{public}@ failed with SAT score as nil!!!", buf, 0xCu);
                      }
                    }
LABEL_50:
                    [(VTAnalyzerNDAPI *)self->_analyzer reset];
                    uint64_t v60 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      double v112 = v21;
                      __int16 v113 = 1026;
                      LODWORD(v114) = j;
                      v36 = v60;
                      v37 = "Processed file %{public}@... analyzed %{public}d bytes";
                      uint32_t v38 = 18;
                      goto LABEL_5;
                    }
                    goto LABEL_6;
                  }
                  [v91 setObject:&unk_26C9A8B80 forKey:*(void *)&v21];
                  uint64_t v59 = VTLogContextFacilityVoiceTrigger;
                  if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_50;
                  }
                  *(_WORD *)buf = 0;
                  v51 = v59;
                  v52 = "Failed to get supervector during retraining, skipping...";
LABEL_49:
                  _os_log_impl(&dword_21844F000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
                  goto LABEL_50;
                }
              }
              else
              {
                intptr_t v92 = 0;
                if (v27) {
                  goto LABEL_41;
                }
              }
              objc_msgSend(v91, "setObject:forKey:", &unk_26C9A8B80, *(void *)&v21, v84);
              uint64_t v50 = VTLogContextFacilityVoiceTrigger;
              if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_50;
              }
              *(_WORD *)buf = 0;
              v51 = v50;
              v52 = "Utterance does not seem to contain trigger phrase - no triggerData";
              goto LABEL_49;
            }
            mData = ioData.mBuffers[0].mData;
            unint64_t v32 = (unint64_t)ioData.mBuffers[0].mDataByteSize >> 1;
            [(VTAnalyzerNDAPI *)self->_analyzer analyzeWavData:ioData.mBuffers[0].mData length:v32];
            v33 = self->_satRetrainingTdSr;
            if (v33) {
              [(VTTextDependentSpeakerRecognizer *)v33 processAudio:mData numSamples:v32];
            }
            v29 = -[VTAnalyzerNDAPI getAnalyzedResult:](self->_analyzer, "getAnalyzedResult:", 0, v84);
            if (v29) {
              v27 = v29;
            }
          }
          OSStatus v34 = v30;
          uint64_t v35 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            LODWORD(v112) = v34;
            v36 = v35;
            v37 = "Error reading audio file: %{public}d, skipping...";
            uint32_t v38 = 8;
LABEL_5:
            _os_log_impl(&dword_21844F000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
          }
LABEL_6:
          AudioFileClose(inAudioFile);

          id v14 = v95;
          unint64_t v18 = 0x263EFF000uLL;
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v104 objects:v123 count:16];
    }
    while (v17);
  }

  if (a8) {
    *a8 = v88;
  }
  if (a9) {
    *a9 = v91;
  }

  return v89;
}

- (unint64_t)_deleteUtterances:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obint j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v31;
    *(void *)&long long v4 = 138543362;
    long long v26 = v4;
    unint64_t v8 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v10)
        {
          __int16 v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) stringByDeletingPathExtension];
          double v12 = [v11 stringByAppendingPathExtension:@"json"];

          id v13 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            uint64_t v35 = v10;
            _os_log_impl(&dword_21844F000, v13, OS_LOG_TYPE_DEFAULT, "Deleting %{public}@", buf, 0xCu);
          }
          unint64_t v14 = v8;
          uint64_t v15 = objc_msgSend(*(id *)(v8 + 2128), "defaultManager", v26);
          id v29 = 0;
          [v15 removeItemAtPath:v10 error:&v29];
          id v16 = v29;

          if (v16)
          {
            uint64_t v17 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v18 = v17;
              uint64_t v19 = [v16 localizedDescription];
              *(_DWORD *)buf = 138543618;
              uint64_t v35 = v10;
              __int16 v36 = 2114;
              v37 = v19;
              _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);
            }
          }
          unint64_t v8 = v14;
          uint64_t v20 = [*(id *)(v14 + 2128) defaultManager];
          id v28 = v16;
          [v20 removeItemAtPath:v12 error:&v28];
          id v21 = v28;

          if (v21)
          {
            v22 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v22;
              v24 = [v21 localizedDescription];
              *(_DWORD *)buf = 138543618;
              uint64_t v35 = v12;
              __int16 v36 = 2114;
              v37 = v24;
              _os_log_impl(&dword_21844F000, v23, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);
            }
          }
          ++v6;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (double)_computeSamplingMSEForUtts:(id)a3 withBeforeScores:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:v6 thresholdTrigger:0 thresholdSAT:0 thresholdTDSR:0 isUpdatingModel:0 extraUtts:-INFINITY discardUtts:-INFINITY psrTimeout:-INFINITY];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v38;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (v16)
        {
          uint64_t v17 = [v7 objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          [v17 doubleValue];
          double v19 = v18;
          uint64_t v20 = [v8 objectForKey:v16];
          [v20 doubleValue];
          double v22 = v19 - v21;

          v23 = (void *)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            v25 = [v7 objectForKey:v16];
            [v25 doubleValue];
            uint64_t v27 = v26;
            [v8 objectForKey:v16];
            unint64_t v36 = v12;
            uint64_t v28 = v11;
            uint64_t v29 = v13;
            long long v30 = v8;
            id v31 = v7;
            v33 = id v32 = v9;
            [v33 doubleValue];
            *(_DWORD *)buf = 138544130;
            uint64_t v42 = v16;
            __int16 v43 = 2050;
            uint64_t v44 = v27;
            __int16 v45 = 2050;
            uint64_t v46 = v34;
            __int16 v47 = 2050;
            double v48 = v22;
            _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Error for %{public}@: %{public}.3f - %{public}.3f = %{public}.3f", buf, 0x2Au);

            id v9 = v32;
            id v7 = v31;
            unint64_t v8 = v30;
            uint64_t v13 = v29;
            uint64_t v11 = v28;
            unint64_t v12 = v36;
          }
          double v14 = v14 + v22 * v22;
          ++v12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v11);

    if (v12) {
      double v14 = v14 / (double)v12;
    }
  }
  else
  {

    double v14 = 0.0;
  }

  return v14;
}

- (BOOL)_updatePruningCookie:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:self->_languageCode];
  char v33 = 0;
  if ([v5 fileExistsAtPath:v6 isDirectory:&v33])
  {
    if (v33)
    {
      id v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v6;
        unint64_t v8 = "ERR: %{public}@ is a directory - Bailing out";
LABEL_24:
        _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
        goto LABEL_6;
      }
      goto LABEL_6;
    }
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
    id v32 = 0;
    unint64_t v12 = [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:&v32];
    id v13 = v32;
    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
      uint64_t v15 = v13;
      uint64_t v16 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v35 = v6;
        __int16 v36 = 2112;
        id v37 = v15;
        _os_log_error_impl(&dword_21844F000, v16, OS_LOG_TYPE_ERROR, "ERR: Could not read existing %@ file: err: %@", buf, 0x16u);
      }

      goto LABEL_6;
    }

    uint64_t v17 = (void *)[v12 mutableCopy];
    [v17 setObject:v4 forKeyedSubscript:@"VoiceProfilePruningCookie"];
    double v18 = (void *)MEMORY[0x263F08900];
    double v19 = (void *)[v17 copy];
    id v31 = 0;
    uint64_t v20 = [v18 dataWithJSONObject:v19 options:1 error:&v31];
    id v21 = v31;

    if (!v20 || v21)
    {
      uint64_t v26 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v12;
      __int16 v36 = 2112;
      id v37 = v21;
      uint64_t v27 = "ERR: error updating updatedVoiceProfileJsonData from: %@, err: %@";
    }
    else
    {
      id v30 = 0;
      char v22 = [v5 removeItemAtPath:v6 error:&v30];
      id v23 = v30;
      id v21 = v23;
      if (v22)
      {
        id v29 = v23;
        int v24 = [v20 writeToFile:v6 options:0 error:&v29];
        id v25 = v29;

        if (v24 && !v25)
        {
          BOOL v9 = 1;
LABEL_32:

          goto LABEL_7;
        }
        uint64_t v28 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v35 = v6;
          __int16 v36 = 2112;
          id v37 = v25;
          _os_log_error_impl(&dword_21844F000, v28, OS_LOG_TYPE_ERROR, "ERR: Error writing voice profile version file at: %@, err:%@", buf, 0x16u);
        }
        id v21 = v25;
LABEL_31:

        BOOL v9 = 0;
        goto LABEL_32;
      }
      uint64_t v26 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v6;
      __int16 v36 = 2112;
      id v37 = v21;
      uint64_t v27 = "ERR: error removing voice profile version file at: %@, err: %@";
    }
    _os_log_error_impl(&dword_21844F000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
    goto LABEL_31;
  }
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = v6;
    unint64_t v8 = "ERR: %{public}@ doesn't exist - Bailing out";
    goto LABEL_24;
  }
LABEL_6:
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (id)_getLastPruningCookie
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:self->_languageCode];
  char v15 = 0;
  if ([v3 fileExistsAtPath:v4 isDirectory:&v15]) {
    BOOL v5 = v15 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    id v6 = 0;
    goto LABEL_14;
  }
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
  id v14 = 0;
  id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v14];
  id v8 = v14;
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {

LABEL_14:
    unint64_t v12 = [v6 objectForKeyedSubscript:@"VoiceProfilePruningCookie"];

    if (v12)
    {
      unint64_t v12 = [v6 objectForKeyedSubscript:@"VoiceProfilePruningCookie"];
    }
    goto LABEL_16;
  }
  uint64_t v10 = v8;
  uint64_t v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    double v19 = v10;
    _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "Could not read existing %@ file: err: %@", buf, 0x16u);
  }

  unint64_t v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)pruneVoiceProfileIfNecessary
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  v86 = [MEMORY[0x263EFF980] arrayWithCapacity:28];
  id v88 = +[VTUtilities getAssetHashFromConfigPath:self->_configPath];
  v87 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:self->_modelType forLanguageCode:self->_languageCode];
  uint64_t v3 = +[VTSpeakerIdUtilities getExplicitEnrollmentUtterancesForType:1 forLanguageCode:self->_languageCode];
  v100 = +[VTSpeakerIdUtilities getSortedImplicitEnrollmentUtterancesForType:1 forLanguageCode:self->_languageCode];
  os_log_t v89 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numRetentionUtterances];
  id v4 = [(VTVoiceProfileRetrainer *)self _getLastPruningCookie];
  BOOL v5 = [(VTAnalyzerNDAPI *)self->_analyzer getVoiceProfilePruningCookie];
  char v121 = 0;
  uint64_t v117 = 0;
  double v118 = &v117;
  uint64_t v119 = 0x2020000000;
  int v120 = 0;
  id v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v123 = (uint64_t)v5;
    __int16 v124 = 2114;
    unint64_t v125 = (unint64_t)v4;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Voice Profile pruning cookie from Asset %{public}@ lastCookie %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    if (v4)
    {
      int v7 = [v4 isEqualToString:v5];
      id v8 = VTLogContextFacilityVoiceTrigger;
      if (v7)
      {
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          BOOL v9 = "Already pruned voice profile - Bailing out";
LABEL_10:
          _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
    }
    else
    {
      id v8 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v123 = (uint64_t)v3;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Explicit utterances %{public}@", buf, 0xCu);
      id v8 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Implicit sorted utterances:", buf, 2u);
    }
    [v100 enumerateObjectsUsingBlock:&__block_literal_global_4468];
    if (v3)
    {
      if ((unint64_t)[v3 count] <= 3)
      {
        uint64_t v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21844F000, v10, OS_LOG_TYPE_ERROR, "ERR: Low explicit utterances - Bailing out", buf, 2u);
        }
        uint64_t v11 = +[VTAggregator sharedAggregator];
        [v11 logVoiceProfilePruningFailureWithReasonCode:2];

        if ([(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5]) {
          goto LABEL_55;
        }
        unint64_t v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
        goto LABEL_50;
      }
      if (v100 && [v100 count] > self->_numRetentionUtterances)
      {
        if (+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
        {
          BOOL v85 = +[VTSpeakerIdUtilities getSpeakerModelPathForType:1 withLanguageCode:self->_languageCode withConfigPath:self->_configPath createDirectory:1];
          [(VTAnalyzerNDAPI *)self->_analyzer initializeSAT:v85];
          char v15 = [[VTTextDependentSpeakerRecognizer alloc] initWithResourcePath:self->_resourcePath satDirectory:v87 assetHash:v88 shouldCreateModelDir:1 delegate:self];
          satRetrainingTdSr = self->_satRetrainingTdSr;
          self->_satRetrainingTdSr = v15;

          [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
          uint64_t v17 = [[VTTextDependentSpeakerRecognizer alloc] initWithResourcePath:self->_resourcePath satDirectory:v87 assetHash:v88 shouldCreateModelDir:1 delegate:self];
          __int16 v18 = self->_satRetrainingTdSr;
          self->_satRetrainingTdSr = v17;

          double v19 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = self->_satRetrainingTdSr;
            *(_DWORD *)buf = 138543362;
            uint64_t v123 = (uint64_t)v20;
            _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatRetraining: %{public}@", buf, 0xCu);
            double v19 = VTLogContextFacilityVoiceTrigger;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- 1st RUN on explicit---------------------------------------", buf, 2u);
          }
          id v21 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:v3 thresholdTrigger:1 thresholdSAT:0 thresholdTDSR:0 isUpdatingModel:&v121 extraUtts:-INFINITY discardUtts:-INFINITY psrTimeout:-INFINITY];
          id v22 = v21;
          if (v121)
          {
            id v23 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21844F000, v23, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
            }
            int v24 = +[VTAggregator sharedAggregator];
            [v24 logVoiceProfilePruningFailureWithReasonCode:5];

            if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
            {
              id v25 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_21844F000, v25, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
              }
            }
            [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
            if (![(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5])
            {
              uint64_t v26 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_21844F000, v26, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
              }
            }
            id v27 = 0;
            id v28 = 0;
          }
          else
          {
            *((_DWORD *)v118 + 6) = 0;
            v116[0] = MEMORY[0x263EF8330];
            v116[1] = 3221225472;
            v116[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_13;
            v116[3] = &unk_2643258C8;
            v116[4] = &v117;
            [v21 enumerateKeysAndObjectsUsingBlock:v116];

            uint64_t v38 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21844F000, v38, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- 2nd RUN on explicit---------------------------------------", buf, 2u);
            }
            double retrainThresholdTrigger = self->_retrainThresholdTrigger;
            double retrainExplicitUttThresholdSAT = self->_retrainExplicitUttThresholdSAT;
            double retrainExplicitUttThresholdTDSR = self->_retrainExplicitUttThresholdTDSR;
            id v115 = 0;
            uint64_t v42 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:v3 thresholdTrigger:0 thresholdSAT:0 thresholdTDSR:&v115 isUpdatingModel:&v121 extraUtts:retrainThresholdTrigger discardUtts:retrainExplicitUttThresholdSAT psrTimeout:retrainExplicitUttThresholdTDSR];
            id v28 = v115;
            *((_DWORD *)v118 + 6) = 0;
            v112[0] = MEMORY[0x263EF8330];
            v112[1] = 3221225472;
            v112[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_15;
            v112[3] = &unk_2643258F0;
            double v114 = &v117;
            id v22 = v42;
            id v113 = v22;
            [v22 enumerateKeysAndObjectsUsingBlock:v112];
            if (v121)
            {
              __int16 v43 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_21844F000, v43, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
              }
              uint64_t v44 = +[VTAggregator sharedAggregator];
              [v44 logVoiceProfilePruningFailureWithReasonCode:5];

              if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
              {
                __int16 v45 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_21844F000, v45, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                }
              }
              [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
              if (![(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5])
              {
                uint64_t v46 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_21844F000, v46, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                }
              }
            }
            else
            {
              if (!v28 || ![v28 count])
              {

                v51 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21844F000, v51, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit selection ---------------------------------------", buf, 2u);
                }
                double v52 = self->_retrainThresholdTrigger;
                double retrainThresholdSAT = self->_retrainThresholdSAT;
                double retrainThresholdTDSR = self->_retrainThresholdTDSR;
                id v107 = 0;
                id v108 = 0;
                v55 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:v100 thresholdTrigger:0 thresholdSAT:&v108 thresholdTDSR:&v107 isUpdatingModel:&v121 extraUtts:v52 discardUtts:retrainThresholdSAT psrTimeout:retrainThresholdTDSR];
                id v33 = v108;
                id v27 = v107;
                *((_DWORD *)v118 + 6) = 0;
                v104[0] = MEMORY[0x263EF8330];
                v104[1] = 3221225472;
                v104[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_21;
                v104[3] = &unk_2643258F0;
                long long v106 = &v117;
                id v35 = v55;
                id v105 = v35;
                [v35 enumerateKeysAndObjectsUsingBlock:v104];
                if (!v121)
                {
                  if ([v33 count])
                  {
                    [v33 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_24];
                    uint64_t v60 = [v33 allKeys];
                    [(VTVoiceProfileRetrainer *)self _deleteUtterances:v60];
                  }
                  uint64_t v34 = [v35 allKeys];

                  loga = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21844F000, loga, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit sampling ---------------------------------------", buf, 2u);
                  }
                  uint64_t v61 = [v34 count];
                  unint64_t numRetentionUtterances = self->_numRetentionUtterances;
                  unint64_t v77 = numRetentionUtterances;
                  unint64_t v72 = (v61 - 1 + numRetentionUtterances) / numRetentionUtterances;
                  if (!__CFADD__(v61 - 1, numRetentionUtterances))
                  {
                    unint64_t v73 = [v3 count];
                    os_log_t logb = 0;
                    unint64_t v71 = v77 + 5;
                    for (uint64_t i = -1; ; uint64_t i = v78 - 1)
                    {
                      uint64_t v78 = i;
                      if ([v34 count] <= (unint64_t)logb) {
                        break;
                      }
                      if ((unint64_t)logb % v72)
                      {
                        v74 = objc_msgSend(v34, "objectAtIndexedSubscript:");
                        [v86 addObject:v74];
                      }
                      else
                      {
                        ++v73;
                      }
                      int v64 = [v34 count];
                      if (v71 > v73 && v71 - v73 >= (int)v78 + v64) {
                        break;
                      }
                      os_log_t logb = (os_log_t)((char *)logb + 1);
                    }
                  }
                  logc = (id)VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled(logc, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v79 = [v34 count];
                    unint64_t v75 = self->_numRetentionUtterances;
                    uint64_t v65 = [v86 count];
                    *(_DWORD *)buf = 134349824;
                    uint64_t v123 = v79;
                    __int16 v124 = 2050;
                    unint64_t v125 = v72;
                    __int16 v126 = 2050;
                    unint64_t v127 = v75;
                    __int16 v128 = 2050;
                    uint64_t v129 = v65;
                    _os_log_impl(&dword_21844F000, logc, OS_LOG_TYPE_DEFAULT, "Utterance selection totalImplicit: %{public}lu selectionIndex: %{public}lu retentionCount: %{public}lu deleteCount: %{public}lu ", buf, 0x2Au);
                  }

                  if (v86 && [v86 count])
                  {
                    v80 = [MEMORY[0x263EFF9C0] setWithArray:v34];
                    double v76 = [MEMORY[0x263EFFA08] setWithArray:v86];
                    [v80 minusSet:v76];
                    os_log_t log = [v80 allObjects];
                  }
                  else
                  {
                    os_log_t log = v34;
                  }
                  v90 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21844F000, v90, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit adding ---------------------------------------", buf, 2u);
                  }
                  id v66 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:log thresholdTrigger:1 thresholdSAT:0 thresholdTDSR:0 isUpdatingModel:0 extraUtts:-INFINITY discardUtts:-INFINITY psrTimeout:-INFINITY];
                  [(VTVoiceProfileRetrainer *)self _computeSamplingMSEForUtts:v86 withBeforeScores:v35];
                  double v68 = v67;
                  os_log_t v91 = +[VTAggregator sharedAggregator];
                  [v91 logProfileUpdateScoreMSE:v68];

                  intptr_t v92 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21844F000, v92, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit deletion ---------------------------------------", buf, 2u);
                  }
                  if ([v27 count])
                  {
                    *((_DWORD *)v118 + 6) = 0;
                    v101[0] = MEMORY[0x263EF8330];
                    v101[1] = 3221225472;
                    v101[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_27;
                    v101[3] = &unk_2643258F0;
                    v103 = &v117;
                    v102 = v27;
                    os_log_t v93 = v102;
                    [v102 enumerateKeysAndObjectsUsingBlock:v101];
                    os_log_t v94 = [v93 allKeys];
                    [(VTVoiceProfileRetrainer *)self _deleteUtterances:v94];
                  }
                  os_log_t v95 = +[VTAggregator sharedAggregator];
                  -[NSObject logProfileUpdateNumDiscardedUttsPHS:](v95, "logProfileUpdateNumDiscardedUttsPHS:", [v27 count]);

                  if ([v86 count])
                  {
                    id v96 = (id)VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v69 = [v86 count];
                      *(_DWORD *)buf = 134218242;
                      uint64_t v123 = v69;
                      __int16 v124 = 2114;
                      unint64_t v125 = (unint64_t)v86;
                      _os_log_impl(&dword_21844F000, v96, OS_LOG_TYPE_DEFAULT, "Deleting implicit utterances(%lu) - %{public}@", buf, 0x16u);
                    }

                    [(VTVoiceProfileRetrainer *)self _deleteUtterances:v86];
                  }
                  os_log_t v97 = +[VTAggregator sharedAggregator];
                  -[NSObject logProfileUpdateNumPrunedUttsPHS:](v97, "logProfileUpdateNumPrunedUttsPHS:", [v86 count]);

                  os_log_t v98 = +[VTAggregator sharedAggregator];
                  [v98 logProfileUpdateNumRetainedUttsPHS:[log count]];

                  if (![(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5])
                  {
                    v99 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_21844F000, v99, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                    }
                  }
                  if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
                  {
                    v70 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_21844F000, v70, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                    }
                  }
                  [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
                  goto LABEL_82;
                }
                v56 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_21844F000, v56, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
                }
                v57 = +[VTAggregator sharedAggregator];
                [v57 logVoiceProfilePruningFailureWithReasonCode:6];

                if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
                {
                  double v58 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_21844F000, v58, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                  }
                }
                [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
                if (![(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5])
                {
                  uint64_t v59 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_21844F000, v59, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                  }
                }
                id v22 = v105;
LABEL_81:

                uint64_t v34 = 0;
                os_log_t log = v89;
LABEL_82:

                BOOL v36 = 1;
                os_log_t v89 = log;
                goto LABEL_56;
              }
              __int16 v47 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v123 = (uint64_t)v28;
                _os_log_error_impl(&dword_21844F000, v47, OS_LOG_TYPE_ERROR, "ERR: Detected explicit utterances with lower scores, bailing out - %{public}@", buf, 0xCu);
              }
              double v48 = +[VTAggregator sharedAggregator];
              [v48 logVoiceProfilePruningFailureWithReasonCode:4];

              *((_DWORD *)v118 + 6) = 0;
              v109[0] = MEMORY[0x263EF8330];
              v109[1] = 3221225472;
              v109[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_20;
              v109[3] = &unk_2643258F0;
              v111 = &v117;
              id v110 = v28;
              [v110 enumerateKeysAndObjectsUsingBlock:v109];
              if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:self->_languageCode])
              {
                v49 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_21844F000, v49, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                }
              }
              [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr deleteExistingSATModel];
              if (![(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5])
              {
                uint64_t v50 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_21844F000, v50, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                }
              }
            }
            id v27 = 0;
          }
          id v33 = 0;
          id v35 = 0;
          goto LABEL_81;
        }
        id v31 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21844F000, v31, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
        }
        id v32 = +[VTAggregator sharedAggregator];
        [v32 logVoiceProfilePruningFailureWithReasonCode:7];

        if ([(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5]) {
          goto LABEL_55;
        }
        unint64_t v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
      }
      else
      {
        id v29 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v29, OS_LOG_TYPE_DEFAULT, "Low implicit utterances - Bailing out", buf, 2u);
        }
        id v30 = +[VTAggregator sharedAggregator];
        [v30 logVoiceProfilePruningFailureWithReasonCode:3];

        if ([(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5]) {
          goto LABEL_55;
        }
        unint64_t v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        *(_WORD *)buf = 0;
      }
    }
    else
    {
      id v13 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21844F000, v13, OS_LOG_TYPE_ERROR, "ERR: No explicit utterances!!! - Bailing out", buf, 2u);
      }
      id v14 = +[VTAggregator sharedAggregator];
      [v14 logVoiceProfilePruningFailureWithReasonCode:1];

      if ([(VTVoiceProfileRetrainer *)self _updatePruningCookie:v5]) {
        goto LABEL_55;
      }
      unint64_t v12 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_WORD *)buf = 0;
    }
LABEL_50:
    _os_log_error_impl(&dword_21844F000, v12, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
    goto LABEL_55;
  }
  id v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    BOOL v9 = "Pruning cookie unavailable from asset - Bailing out";
    goto LABEL_10;
  }
LABEL_55:
  id v27 = 0;
  id v28 = 0;
  id v33 = 0;
  uint64_t v34 = 0;
  id v35 = 0;
  BOOL v36 = 0;
LABEL_56:
  _Block_object_dispose(&v117, 8);

  return v36;
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v8 = v6;
    id v9 = a3;
    uint64_t v10 = [a2 lastPathComponent];
    [v9 floatValue];
    float v12 = v11;

    v13[0] = 67240706;
    v13[1] = v7;
    __int16 v14 = 2114;
    char v15 = v10;
    __int16 v16 = 2050;
    double v17 = v12;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Created Model with explicit utterance(%{public}d): %{public}@ --> %{public}.3f", (uint8_t *)v13, 0x1Cu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [NSString stringWithFormat:@"%@%d", @"profileUpdateExplicitUttScore", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  id v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v10 = v8;
    float v11 = [v5 lastPathComponent];
    [v6 floatValue];
    *(_DWORD *)buf = 67240706;
    int v17 = v9;
    __int16 v18 = 2114;
    double v19 = v11;
    __int16 v20 = 2050;
    double v21 = v12;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Explicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);
  }
  id v13 = +[VTAggregator sharedAggregator];
  __int16 v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v14 floatValue];
  [v13 logProfileUpdateUtt:v7 withScore:v15];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [NSString stringWithFormat:@"%@%d", @"profileUpdateFailedExplicitUttScore", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  id v8 = +[VTAggregator sharedAggregator];
  int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v9 floatValue];
  [v8 logProfileUpdateUtt:v7 withScore:v10];

  float v11 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v13 = v11;
    __int16 v14 = [v5 lastPathComponent];
    [v6 floatValue];
    *(_DWORD *)buf = 67240706;
    int v17 = v12;
    __int16 v18 = 2114;
    double v19 = v14;
    __int16 v20 = 2050;
    double v21 = v15;
    _os_log_error_impl(&dword_21844F000, v13, OS_LOG_TYPE_ERROR, "Low Score Explicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [NSString stringWithFormat:@"%@%d", @"profileUpdateImplicitUttScore", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  id v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    float v10 = v8;
    float v11 = [v5 lastPathComponent];
    [v6 floatValue];
    *(_DWORD *)buf = 67240706;
    int v17 = v9;
    __int16 v18 = 2114;
    double v19 = v11;
    __int16 v20 = 2050;
    double v21 = v12;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Implicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);
  }
  id v13 = +[VTAggregator sharedAggregator];
  __int16 v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v14 floatValue];
  [v13 logProfileUpdateUtt:v7 withScore:v15];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    id v8 = a3;
    int v9 = [v5 lastPathComponent];
    [v8 floatValue];
    float v11 = v10;

    *(_DWORD *)buf = 138543618;
    int v17 = v9;
    __int16 v18 = 2050;
    double v19 = v11;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Discarding low score implicit utterance %{public}@ --> %{public}.3f", buf, 0x16u);
  }
  float v12 = [NSString stringWithFormat:@"%@%d", @"profileUpdateFailedExplicitUttScore", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  id v13 = +[VTAggregator sharedAggregator];
  __int16 v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v14 floatValue];
  [v13 logProfileUpdateUtt:v12 withScore:v15];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = a3;
    id v8 = [a2 lastPathComponent];
    [v7 floatValue];
    float v10 = v9;

    int v11 = 138543618;
    float v12 = v8;
    __int16 v13 = 2050;
    double v14 = v10;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Discarding extra implicit utterance %{public}@ with score %{public}.3f", (uint8_t *)&v11, 0x16u);
  }
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 stringByDeletingPathExtension];
  id v4 = [v3 stringByAppendingPathExtension:@"json"];

  id v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v2 lastPathComponent];
    id v8 = [NSURL URLWithString:v4];
    float v9 = +[VTUtteranceMetadataManager recordedTimeStampOfFile:v8];
    int v10 = 138543618;
    int v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ recorded on %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)retrainSATModelWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  id v5 = +[VTUtilities getAssetHashFromConfigPath:self->_configPath];
  id v6 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:self->_modelType forLanguageCode:self->_languageCode];
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Retraining SAT speaker models with previous enrollment data", (uint8_t *)&v29, 2u);
  }
  id v8 = +[VTSpeakerIdUtilities getSpeakerModelPathForType:self->_modelType withLanguageCode:self->_languageCode withConfigPath:self->_configPath createDirectory:1];
  [(VTAnalyzerNDAPI *)self->_analyzer initializeSAT:v8];
  float v9 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    analyzer = self->_analyzer;
    int v11 = v9;
    int v12 = [(VTAnalyzerNDAPI *)analyzer getSATVectorCount];
    int v29 = 67240192;
    LODWORD(v30) = v12;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "re-initializeSAT after removing old invalidSATModel: %{public}d", (uint8_t *)&v29, 8u);
  }
  __int16 v13 = [[VTTextDependentSpeakerRecognizer alloc] initWithResourcePath:self->_resourcePath satDirectory:v6 assetHash:v5 shouldCreateModelDir:1 delegate:self];
  satRetrainingTdSr = self->_satRetrainingTdSr;
  self->_satRetrainingTdSr = v13;

  uint64_t v15 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = self->_satRetrainingTdSr;
    int v29 = 138543362;
    id v30 = v16;
    _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatRetraining: %{public}@", (uint8_t *)&v29, 0xCu);
  }
  int v17 = +[VTSpeakerIdUtilities getSortedEnrollmentUtterancesForType:self->_modelType forLanguageCode:self->_languageCode];
  __int16 v18 = [(VTVoiceProfileRetrainer *)self _analyzeEnrollmentUtts:v17 thresholdTrigger:1 thresholdSAT:0 thresholdTDSR:0 isUpdatingModel:0 extraUtts:-INFINITY discardUtts:-INFINITY psrTimeout:-INFINITY];
  double v19 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543362;
    id v30 = v18;
    _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Retraining results - %{public}@ utterances were successfully enrolled", (uint8_t *)&v29, 0xCu);
    double v19 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = self->_satRetrainingTdSr;
    double v21 = v19;
    BOOL v22 = [(VTTextDependentSpeakerRecognizer *)v20 tdPsrCanProcessRequest];
    int v29 = 138543618;
    id v30 = v20;
    __int16 v31 = 1026;
    BOOL v32 = v22;
    _os_log_impl(&dword_21844F000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr: %{public}@, _satRetrainingTdSr.tdPsrCanProcessRequest: %{public}d", (uint8_t *)&v29, 0x12u);
  }
  id v23 = self->_satRetrainingTdSr;
  if (v23)
  {
    BOOL v24 = [(VTTextDependentSpeakerRecognizer *)v23 tdPsrCanProcessRequest];
    id v25 = VTLogContextFacilityVoiceTrigger;
    if (v24)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = self->_satRetrainingTdSr;
        int v29 = 138543362;
        id v30 = v26;
        _os_log_impl(&dword_21844F000, v25, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr Success. _satRetrainingTdSr: %{public}@", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v27 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    id v25 = VTLogContextFacilityVoiceTrigger;
  }
  BOOL v28 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  uint64_t v27 = 0;
  if (v28)
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_21844F000, v25, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr FAILED.", (uint8_t *)&v29, 2u);
    uint64_t v27 = 0;
  }
LABEL_19:
  if (v4) {
    v4[2](v4, 1, v27);
  }
}

- (void)dealloc
{
  [(VTTextDependentSpeakerRecognizer *)self->_satRetrainingTdSr endAudio];
  satRetrainingTdSr = self->_satRetrainingTdSr;
  self->_satRetrainingTdSr = 0;

  v4.receiver = self;
  v4.super_class = (Class)VTVoiceProfileRetrainer;
  [(VTVoiceProfileRetrainer *)&v4 dealloc];
}

- (VTVoiceProfileRetrainer)initWithAnalyzer:(id)a3 languageCode:(id)a4 modelType:(unint64_t)a5 configPath:(id)a6 resourcePath:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)VTVoiceProfileRetrainer;
  int v17 = [(VTVoiceProfileRetrainer *)&v27 init];
  __int16 v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analyzer, a3);
    objc_storeStrong((id *)&v18->_languageCode, a4);
    v18->_modelType = a5;
    objc_storeStrong((id *)&v18->_configPath, a6);
    objc_storeStrong((id *)&v18->_resourcePath, a7);
    [v13 getRetrainThresholdTrigger];
    v18->_double retrainThresholdTrigger = v19;
    [v13 getRetrainExplicitUttThresholdSAT];
    v18->_double retrainExplicitUttThresholdSAT = v20;
    [v13 getRetrainExplicitUttThresholdTDSR];
    v18->_double retrainExplicitUttThresholdTDSR = v21;
    [v13 getRetrainThresholdSAT];
    v18->_double retrainThresholdSAT = v22;
    [v13 getRetrainThresholdTDSR];
    v18->_double retrainThresholdTDSR = v23;
    v18->_unint64_t numRetentionUtterances = (int)[v13 getVoiceProfilePruningNumRetentionUtterances];
    BOOL v24 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      languageCode = v18->_languageCode;
      *(_DWORD *)buf = 134218242;
      unint64_t v29 = a5;
      __int16 v30 = 2112;
      __int16 v31 = languageCode;
      _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Retrainer intialized for %lu on %@", buf, 0x16u);
    }
  }

  return v18;
}

@end