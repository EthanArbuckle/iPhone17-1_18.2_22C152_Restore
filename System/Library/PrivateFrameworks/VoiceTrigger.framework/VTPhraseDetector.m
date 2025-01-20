@interface VTPhraseDetector
- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5;
- (BOOL)isSecondChance;
- (NSMutableArray)phraseDetectorInfos;
- (NSMutableArray)phraseResult;
- (VTKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI;
- (VTPhraseDetector)init;
- (VTSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar;
- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7;
- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5;
- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5;
- (id)getAnalyzedResultFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4;
- (id)getAnalyzedResultFromFlushedAudio;
- (id)getAnalyzedResultFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4;
- (id)phraseDetectorInfoFromPhId:(unint64_t)a3;
- (unint64_t)nearMissCandidateDetectedSamples;
- (unint64_t)nearMissDelayTimeout;
- (void)dealloc;
- (void)reset;
- (void)setConfig:(id)a3;
- (void)setIsSecondChance:(BOOL)a3;
- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3;
- (void)setNearMissDelayTimeout:(unint64_t)a3;
- (void)setPhraseDetectorInfos:(id)a3;
- (void)setPhraseResult:(id)a3;
- (void)setRunAsSecondChance:(BOOL)a3;
- (void)setSyncKeywordAnalyzerNDAPI:(id)a3;
- (void)setSyncKeywordAnalyzerQuasar:(id)a3;
@end

@implementation VTPhraseDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);

  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, 0);
}

- (void)setPhraseResult:(id)a3
{
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_nearMissCandidateDetectedSamples = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissDelayTimeout:(unint64_t)a3
{
  self->_nearMissDelayTimeout = a3;
}

- (unint64_t)nearMissDelayTimeout
{
  return self->_nearMissDelayTimeout;
}

- (void)setPhraseDetectorInfos:(id)a3
{
}

- (NSMutableArray)phraseDetectorInfos
{
  return self->_phraseDetectorInfos;
}

- (void)setSyncKeywordAnalyzerQuasar:(id)a3
{
}

- (VTSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar
{
  return self->_syncKeywordAnalyzerQuasar;
}

- (void)setSyncKeywordAnalyzerNDAPI:(id)a3
{
}

- (VTKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI
{
  return self->_syncKeywordAnalyzerNDAPI;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 decision];

  if (v9 == a3)
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v28 = a3;
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Reporting decision (%tu) from (%tu)", buf, 0x16u);
    }
    v11 = [v7 objectAtIndexedSubscript:a4];
    id v12 = v11;
LABEL_16:
    v17 = (void *)[v11 copy];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "decision", (void)v22) == a3)
          {
            v18 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              uint64_t v20 = [v11 phId];
              *(_DWORD *)buf = 134218240;
              unint64_t v28 = a3;
              __int16 v29 = 2048;
              unint64_t v30 = v20;
              _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "Reporting decision (%tu) from (%tu)", buf, 0x16u);
            }
            goto LABEL_16;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5
{
  BOOL v5 = a3 < a4;
  if (a3 < a5) {
    BOOL v5 = 0;
  }
  return !self->_isSecondChance && v5;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(NSMutableArray *)self->_phraseResult count] <= a3)
  {
    v19 = 0;
    goto LABEL_18;
  }
  BOOL v67 = v7;
  uint64_t v15 = [(NSMutableArray *)self->_phraseResult objectAtIndex:a3];
  v16 = [v12 phraseConfig];
  if (v15)
  {
    [v15 ndapiScore];
    float v18 = v17;
  }
  else
  {
    float v18 = -INFINITY;
  }
  uint64_t v20 = [v12 hasPendingNearMiss];
  [v12 effectiveKeywordThreshold];
  float v22 = v21;
  [v16 loggingThreshold];
  float v24 = v23;
  [v16 ndapiScaleFactor];
  float v26 = v25;
  [v16 recognizerScoreScaleFactor];
  float v28 = v27;
  if (v14)
  {
    [v14 triggerConfidence];
    double v30 = v29;
  }
  else
  {
    double v30 = -1000.0;
  }
  v69 = v15;
  [v13 bestScore];
  float v32 = v31;
  v33 = v13;
  unint64_t v34 = [v13 samplesFed];
  uint64_t v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
  if (0xCCCCCCCCCCCCCCCDLL * _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat <= 0x3333333333333333)
  {
    log = VTLogContextFacilityVoiceTrigger;
    double v36 = *(double *)&v34;
    BOOL v37 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO);
    unint64_t v34 = *(void *)&v36;
    if (v37)
    {
      *(_DWORD *)buf = 134219264;
      unint64_t v71 = a3;
      __int16 v72 = 2050;
      double v73 = v32;
      __int16 v74 = 2050;
      double v75 = v36;
      __int16 v76 = 2050;
      double v77 = v30;
      __int16 v78 = 2050;
      double v79 = v26;
      __int16 v80 = 2050;
      double v81 = v28;
      _os_log_impl(&dword_21844F000, log, OS_LOG_TYPE_INFO, "[(%lu)] : NDAPI second pass best score = %{public}f with analyzed samples:                   %{public}tu with quasar score = %{public}f, ndapi scale factor = %{public}f, quasar scale factor = %{public}f", buf, 0x3Eu);
      unint64_t v34 = *(void *)&v36;
      uint64_t v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
    }
  }
  uint64_t v38 = v35 + 1;
  _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat = v35 + 1;
  float v39 = v32;
  if (self->_syncKeywordAnalyzerQuasar) {
    float v39 = (float)(v26 * v32) + v30 * v28;
  }
  uint64_t v40 = v20;
  id v13 = v33;
  if (v18 >= v32 || v67)
  {
    if (v39 >= v22)
    {
      v55 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v55;
        *(double *)&uint64_t v57 = COERCE_DOUBLE([v33 samplesFed]);
        *(_DWORD *)buf = 134218752;
        unint64_t v71 = a3;
        __int16 v72 = 2050;
        double v73 = *(double *)&v57;
        __int16 v74 = 2050;
        double v75 = v39;
        __int16 v76 = 2050;
        double v77 = v22;
        _os_log_impl(&dword_21844F000, v56, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Trigger detected with %{public}tu analyzed samples in NDAPI,                   combined score = %{public}lf, effective threshold = %{public}f", buf, 0x2Au);
      }
      uint64_t v41 = 1;
      goto LABEL_17;
    }
    if (v39 < v24)
    {
      if (v67)
      {
        double v53 = *(double *)&v34;
        v54 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          unint64_t v71 = a3;
          __int16 v72 = 2050;
          double v73 = v53;
          __int16 v74 = 2050;
          double v75 = v39;
          _os_log_impl(&dword_21844F000, v54, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Notify second pass reject at: %{public}tu                   with best score up to: %{public}.3f", buf, 0x20u);
        }
        uint64_t v41 = 3;
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (!v67)
    {
      if (v20)
      {
        unint64_t nearMissDelayTimeout = self->_nearMissDelayTimeout;
        unint64_t nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
        if (nearMissDelayTimeout + nearMissCandidateDetectedSamples < v34) {
          goto LABEL_33;
        }
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v38, 1) <= 0x1999999999999999uLL)
        {
          unint64_t v68 = v34;
          v65 = VTLogContextFacilityVoiceTrigger;
          uint64_t v40 = 1;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v71 = a3;
            __int16 v72 = 2050;
            *(void *)&double v73 = v68 - nearMissCandidateDetectedSamples + nearMissDelayTimeout;
            _os_log_impl(&dword_21844F000, v65, OS_LOG_TYPE_INFO, "[(%tu)] : Waiting for logging near miss                               until timeout %{public}lu samples", buf, 0x16u);
            uint64_t v41 = 0;
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else
      {
        self->_unint64_t nearMissCandidateDetectedSamples = v34;
        v62 = VTLogContextFacilityVoiceTrigger;
        double v63 = *(double *)&v34;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v64 = self->_nearMissDelayTimeout;
          *(_DWORD *)buf = 134218496;
          unint64_t v71 = a3;
          __int16 v72 = 2050;
          double v73 = v63;
          __int16 v74 = 2050;
          double v75 = *(double *)&v64;
          _os_log_impl(&dword_21844F000, v62, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Detected near miss candidate at %{public}tu,                       let's wait %{public}tu samples to log", buf, 0x20u);
        }
      }
      uint64_t v41 = 0;
      uint64_t v40 = 1;
      goto LABEL_17;
    }
LABEL_33:
    double v60 = *(double *)&v34;
    v61 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v71 = a3;
      __int16 v72 = 2050;
      double v73 = v60;
      __int16 v74 = 2050;
      double v75 = v39;
      _os_log_impl(&dword_21844F000, v61, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Detected near miss at %{public}lu samples                       with best score up to: %{public}.3f", buf, 0x20u);
    }
    uint64_t v41 = 2;
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v41 = 0;
LABEL_17:
  [v12 setHasPendingNearMiss:v40];
  v42 = [v12 phraseConfig];
  [v42 secondChanceThreshold];
  LODWORD(v44) = v43;
  *(float *)&double v45 = v39;
  *(float *)&double v46 = v22;
  BOOL v47 = [(VTPhraseDetector *)self _isSecondChanceCandidateWithScore:v45 effectiveThreshold:v46 secondChanceThreshold:v44];

  v48 = [VTSinglePhraseResult alloc];
  *(float *)&double v49 = v30;
  *(float *)&double v50 = v39;
  *(float *)&double v51 = v32;
  v19 = [(VTSinglePhraseResult *)v48 initWithPhId:a3 keywordDetectorDecision:v41 combinedScore:v13 ndapiScore:self->_isSecondChance ndapiResult:v47 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v50 isSecondChanceCandidate:v51 isRunningQuasar:v49];

LABEL_18:

  return v19;
}

- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5
{
  BOOL v45 = a5;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v47 = v7;
  unint64_t v9 = [v7 count];
  if (v9 >= [(NSMutableArray *)self->_phraseDetectorInfos count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    double v46 = self;
    obuint64_t j = self->_phraseDetectorInfos;
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v57;
      *(void *)&long long v13 = 134217984;
      long long v43 = v13;
      id v17 = v8;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v8, "count", v43) <= (unint64_t)(v15 + i))
          {
            float v21 = 0;
          }
          else
          {
            float v21 = [v8 objectAtIndex:v15 + i];
          }
          float v22 = [v47 objectAtIndex:v15 + i];
          float v23 = [(VTPhraseDetector *)v46 _getResultWithPhId:v15 + i phraseDetectorInfo:v20 ndapiResult:v22 quasarResult:v21 forceMaximized:v45];

          if (v23 && [(NSMutableArray *)v46->_phraseResult count] > (unint64_t)(v15 + i))
          {
            [(NSMutableArray *)v46->_phraseResult setObject:v23 atIndexedSubscript:v15 + i];
          }
          else
          {
            v19 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              uint64_t v63 = v15 + i;
              _os_log_error_impl(&dword_21844F000, v19, OS_LOG_TYPE_ERROR, "Received invalid result with %tu", buf, 0xCu);
            }
          }

          id v8 = v17;
        }
        v15 += i;
        uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v14);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    float v24 = v46->_phraseResult;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      uint64_t v28 = *(void *)v53;
      float v29 = -INFINITY;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v24);
          }
          float v31 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          [v31 ndapiScore];
          if (v32 > v29)
          {
            [v31 ndapiScore];
            float v29 = v33;
            uint64_t v27 = [v31 phId];
          }
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }
      while (v26);
    }
    else
    {
      uint64_t v27 = 0;
    }

    v11 = [(VTPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:1 bestPhId:v27 phraseResult:v46->_phraseResult];
    if (!v11)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      unint64_t v34 = v46->_phraseResult;
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v49;
LABEL_33:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v49 != v37) {
            objc_enumerationMutation(v34);
          }
          float v39 = *(NSMutableArray **)(*((void *)&v48 + 1) + 8 * v38);
          if (![(NSMutableArray *)v39 decision]) {
            break;
          }
          if (v36 == ++v38)
          {
            uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
            if (v36) {
              goto LABEL_33;
            }
            goto LABEL_39;
          }
        }
      }
      else
      {
LABEL_39:

        v11 = [(VTPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:2 bestPhId:v27 phraseResult:v46->_phraseResult];
        if (v11) {
          goto LABEL_45;
        }
        v11 = [(VTPhraseDetector *)v46 _resultCopyWithKeywordDetectorDecision:3 bestPhId:v27 phraseResult:v46->_phraseResult];
        if (v11) {
          goto LABEL_45;
        }
        uint64_t v40 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_21844F000, v40, OS_LOG_TYPE_FAULT, "Phrase detector results fall-into unexpected use case", buf, 2u);
        }
        float v39 = [(NSMutableArray *)v46->_phraseResult objectAtIndexedSubscript:v27];
        unint64_t v34 = v39;
      }
      v11 = (void *)[(NSMutableArray *)v39 copy];
    }
  }
  else
  {
    v10 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v42 = v10;
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = [v7 count];
      _os_log_error_impl(&dword_21844F000, v42, OS_LOG_TYPE_ERROR, "Unable to process due to number of result mismatch, ndapiResults number = %d", buf, 8u);
    }
    v11 = 0;
  }
LABEL_45:

  return v11;
}

- (id)phraseDetectorInfoFromPhId:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_phraseDetectorInfos count] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_phraseDetectorInfos objectAtIndex:a3];
  }

  return v5;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  v3 = [(VTKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getAnalyzedResults];
  v4 = [(VTSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar getResultsFromFlushedAudio];
  BOOL v5 = [(VTPhraseDetector *)self _phraseDetectorResultFromNDAPIResults:v3 quasarResult:v4 forceMaximized:1];

  return v5;
}

- (id)getAnalyzedResultFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  if (a3)
  {
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    id v7 = a3;
    id v8 = [(VTKeywordAnalyzerNDAPI *)syncKeywordAnalyzerNDAPI getAnalyzedResultsFromInt16AudioBuffer:v7 numSamples:a4];
    unint64_t v9 = [(VTSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar getAnalyzedResultsFromInt16AudioBuffer:v7 numSamples:a4];

    v10 = [(VTPhraseDetector *)self _phraseDetectorResultFromNDAPIResults:v8 quasarResult:v9 forceMaximized:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getAnalyzedResultFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  if (a3)
  {
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    id v7 = a3;
    id v8 = [(VTKeywordAnalyzerNDAPI *)syncKeywordAnalyzerNDAPI getAnalyzedResultsFromFloatAudioBuffer:v7 numSamples:a4];
    unint64_t v9 = [(VTSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar getAnalyzedResultsFromFloatAudioBuffer:v7 numSamples:a4];

    v10 = [(VTPhraseDetector *)self _phraseDetectorResultFromNDAPIResults:v8 quasarResult:v9 forceMaximized:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setConfig:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 phraseConfigs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [(NSMutableArray *)self->_phraseDetectorInfos removeAllObjects];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v7 = [v4 phraseConfigs];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v81 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [[VTPhraseDetectorInfo alloc] initWithPhraseConfig:*(void *)(*((void *)&v80 + 1) + 8 * i)];
          if (v12) {
            [(NSMutableArray *)self->_phraseDetectorInfos addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v9);
    }

    long long v13 = [VTKeywordAnalyzerNDAPI alloc];
    uint64_t v14 = [v4 configPathNDAPI];
    uint64_t v15 = [v4 resourcePath];
    uint64_t v16 = [(VTKeywordAnalyzerNDAPI *)v13 initWithConfigPath:v14 resourcePath:v15];
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    self->_syncKeywordAnalyzerNDAPI = v16;

    unint64_t v71 = v4;
    if (self->_syncKeywordAnalyzerNDAPI
      && +[VTUtilities supportPremiumAssets]
      && [v4 useRecognizerCombination])
    {
      float v18 = [MEMORY[0x263EFF980] array];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v19 = self->_phraseDetectorInfos;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v76 objects:v89 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v77 != v22) {
              objc_enumerationMutation(v19);
            }
            float v24 = [*(id *)(*((void *)&v76 + 1) + 8 * j) phraseConfig];
            uint64_t v25 = [v24 recognizerToken];
            [v18 addObject:v25];
          }
          uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v76 objects:v89 count:16];
        }
        while (v21);
      }

      uint64_t v60 = +[VTUtilities horsemanDeviceType] == 3;
      v61 = +[VTPreferences sharedPreferences];
      int v62 = [v61 shouldOverwriteVoiceTriggerMLock];

      if (v62)
      {
        uint64_t v63 = +[VTPreferences sharedPreferences];
        uint64_t v60 = [v63 overwritingVoiceTriggerMLock];
      }
      unint64_t v64 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&uint64_t v65 = COERCE_DOUBLE(@"disabled");
        if (v60) {
          *(double *)&uint64_t v65 = COERCE_DOUBLE(@"enabled");
        }
        *(_DWORD *)buf = 138412290;
        double v85 = *(double *)&v65;
        _os_log_impl(&dword_21844F000, v64, OS_LOG_TYPE_DEFAULT, "VoiceTrigger memory lock %@", buf, 0xCu);
      }
      v66 = [VTSyncKeywordAnalyzerQuasar alloc];
      BOOL v67 = [v71 configPathRecognizer];
      unint64_t v68 = [(VTSyncKeywordAnalyzerQuasar *)v66 initWithConfigPath:v67 triggerTokensArray:v18 preventDuplicatedReset:+[VTUtilities VTIsHorseman] memoryLock:v60];
      syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = v68;
    }
    else
    {
      float v18 = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = 0;
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v26 = self->_phraseDetectorInfos;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v73;
      uint64_t v70 = 134349312;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v73 != v29) {
            objc_enumerationMutation(v26);
          }
          float v33 = *(void **)(*((void *)&v72 + 1) + 8 * k);
          unint64_t v34 = objc_msgSend(v33, "phraseConfig", v70);
          [v34 threshold];
          float v36 = v35;
          [v34 secondChanceThreshold];
          float v38 = v37;
          [v34 loggingThreshold];
          float v40 = v39;
          [v34 ndapiScaleFactor];
          int v48 = LODWORD(v41);
          if (self->_syncKeywordAnalyzerNDAPI)
          {
            if (self->_syncKeywordAnalyzerQuasar) {
              goto LABEL_31;
            }
          }
          else
          {
            long long v54 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21844F000, v54, OS_LOG_TYPE_DEFAULT, "Reset all thresholds to HUGE_VALF since NDAPI is nil", buf, 2u);
            }
            float v36 = INFINITY;
            float v38 = INFINITY;
            float v40 = INFINITY;
            if (self->_syncKeywordAnalyzerQuasar)
            {
LABEL_31:
              [v34 recognizerScoreOffset];
              float v50 = v49;
              float v36 = v36 + v49;
              float v38 = v38 + v49;
              [v34 recognizerScoreScaleFactor];
              int v52 = v51;
              [v34 keywordRejectLoggingThreshold];
              int v53 = LODWORD(v41);
              if (!self->_syncKeywordAnalyzerNDAPI) {
                goto LABEL_26;
              }
              goto LABEL_37;
            }
          }
          float v50 = 0.0;
          int v53 = 2139095040;
          int v52 = 0;
          if (!self->_syncKeywordAnalyzerNDAPI) {
            goto LABEL_26;
          }
LABEL_37:
          if (!self->_syncKeywordAnalyzerQuasar)
          {
            if ([v71 useRecognizerCombination])
            {
              [(VTKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getThreshold];
              float v36 = v55;
              [(VTKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getLoggingThreshold];
              float v40 = v56;
              [(VTKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI getRejectLoggingThreshold];
              int v53 = v57;
              long long v58 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v70;
                double v85 = v36;
                __int16 v86 = 2050;
                double v87 = v40;
                _os_log_impl(&dword_21844F000, v58, OS_LOG_TYPE_DEFAULT, "Using threshold from NDAPI since we are not able to use Quasar, threshold = %{public}f, logging threshold = %{public}f", buf, 0x16u);
              }
            }
          }
LABEL_26:
          *(float *)&double v41 = v36;
          *(float *)&double v42 = v38;
          *(float *)&double v43 = v40;
          LODWORD(v44) = v48;
          *(float *)&double v45 = v50;
          LODWORD(v46) = v52;
          LODWORD(v47) = v53;
          float v31 = (void *)[v34 copyWithThreshold:v41 secondChanceThreshold:v42 loggingThreshold:v43 ndapiScaleFactor:v44 recognizerScoreOffset:v45 recognizerScoreScaleFactor:v46 keywordRejectLoggingThreshold:v47];
          [v33 setPhraseConfig:v31];
          *(float *)&double v32 = v36;
          [v33 setEffectiveKeywordThreshold:v32];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v28);
    }

    [(VTPhraseDetector *)self reset];
    id v4 = v71;
  }
  else
  {
    long long v59 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v59, OS_LOG_TYPE_ERROR, "Invalid assets config!", buf, 2u);
    }
  }
}

- (void)reset
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }
  [(VTKeywordAnalyzerNDAPI *)self->_syncKeywordAnalyzerNDAPI reset];
  [(VTSyncKeywordAnalyzerQuasar *)self->_syncKeywordAnalyzerQuasar reset];
  [(NSMutableArray *)self->_phraseResult removeAllObjects];
  if ([(NSMutableArray *)self->_phraseDetectorInfos count])
  {
    unint64_t v4 = 0;
    do
    {
      BOOL v5 = [VTSinglePhraseResult alloc];
      LODWORD(v6) = -8388608;
      LODWORD(v7) = -998637568;
      LODWORD(v8) = -8388608;
      uint64_t v9 = [(VTSinglePhraseResult *)v5 initWithPhId:v4 keywordDetectorDecision:0 combinedScore:0 ndapiScore:0 ndapiResult:0 recognizerScore:self->_syncKeywordAnalyzerQuasar != 0 isSecondChance:v6 isSecondChanceCandidate:v8 isRunningQuasar:v7];
      [(NSMutableArray *)self->_phraseResult addObject:v9];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_phraseDetectorInfos count]);
  }
}

- (void)setRunAsSecondChance:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v21 = self;
  v3 = self->_phraseDetectorInfos;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    if (a3)
    {
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "phraseConfig", v21);
          v11 = v10;
          if (v10)
          {
            [v10 secondChanceThreshold];
            float v13 = v12;
            [v11 threshold];
            *(float *)&double v14 = v13;
            [v9 setEffectiveKeywordThreshold:v14];
            uint64_t v15 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134349056;
              double v28 = v13;
              _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "Using second chance threshold for voice trigger second pass: %{public}f", buf, 0xCu);
            }
          }
          else
          {
            double v8 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21844F000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch config", buf, 2u);
            }
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v5);
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v5; ++j)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          float v18 = objc_msgSend(v17, "phraseConfig", v21);
          v19 = v18;
          if (v18)
          {
            [v18 secondChanceThreshold];
            [v19 threshold];
            objc_msgSend(v17, "setEffectiveKeywordThreshold:");
          }
          else
          {
            uint64_t v20 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21844F000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch config", buf, 2u);
            }
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v5);
    }
  }

  v21->_isSecondChance = a3;
}

- (void)dealloc
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "VTPhraseDetector Deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VTPhraseDetector;
  [(VTPhraseDetector *)&v4 dealloc];
}

- (VTPhraseDetector)init
{
  v9.receiver = self;
  v9.super_class = (Class)VTPhraseDetector;
  v2 = [(VTPhraseDetector *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t nearMissDelayTimeout = 8000;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    phraseDetectorInfos = v3->_phraseDetectorInfos;
    v3->_phraseDetectorInfos = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    phraseResult = v3->_phraseResult;
    v3->_phraseResult = (NSMutableArray *)v6;
  }
  return v3;
}

@end