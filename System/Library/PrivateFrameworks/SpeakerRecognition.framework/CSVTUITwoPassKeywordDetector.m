@interface CSVTUITwoPassKeywordDetector
- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3;
- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3 supportMph:(BOOL)a4;
- (id)analyze:(id)a3;
- (id)triggeredUtterance:(id)a3;
- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4;
- (void)internalReset;
- (void)reset;
@end

@implementation CSVTUITwoPassKeywordDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPassResult, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_phraseDetector, 0);

  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4 = -a3;
  if (a3 > a4) {
    unsigned int v4 = ~a3;
  }
  return v4 + a4;
}

- (id)triggeredUtterance:(id)a3
{
  unsigned int v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F38220]];
  unsigned int v5 = [v4 unsignedIntValue];

  unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
  if (extraSamplesAtStart <= v5) {
    uint64_t v7 = v5 - extraSamplesAtStart;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = (void *)[(CSAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]- [(CSVTUITwoPassKeywordDetector *)self _sampleLengthFrom:v7 To:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]] to:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]];
  v9 = objc_msgSend(v8, "dataForChannel:", objc_msgSend(MEMORY[0x263F38018], "channelForProcessedInput"));

  return v9;
}

- (id)analyze:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 length];
  unint64_t v6 = v5 / [MEMORY[0x263F38018] inputRecordingBytesPerFrame];
  id v7 = objc_alloc(MEMORY[0x263F37FB8]);
  uint64_t v8 = [MEMORY[0x263F38018] inputRecordingSampleByteDepth];
  uint64_t v9 = [(CSAudioCircularBuffer *)self->_audioBuffer sampleCount];
  LOBYTE(v71) = [MEMORY[0x263F38018] inputRecordingIsFloat];
  v10 = (void *)[v7 initWithData:v4 numChannels:1 numSamples:v6 sampleByteDepth:v8 startSampleCount:v9 hostTime:0 remoteVAD:0 isFloat:v71];
  audioBuffer = self->_audioBuffer;
  id v12 = v4;
  uint64_t v13 = [v12 bytes];

  [(CSAudioCircularBuffer *)audioBuffer addSamples:v13 numSamples:v6];
  if (v10)
  {
    v14 = [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer getBestAnalyzedResultsFromAudioChunk:v10];
    v15 = v14;
    if (!self->_isFirstPassTriggered)
    {
      if (v14)
      {
        [v14 bestScore];
        float v17 = v16;
        if (v16 >= self->_keywordThreshold)
        {
          p_firstPassResult = (id *)&self->_firstPassResult;
          objc_storeStrong((id *)&self->_firstPassResult, v15);
          self->_isFirstPassTriggered = 1;
          v19 = (void *)*MEMORY[0x263F37FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
          {
            id v20 = *p_firstPassResult;
            v21 = v19;
            uint64_t v22 = [v20 bestStart];
            uint64_t v23 = [*p_firstPassResult bestEnd];
            uint64_t v24 = [*p_firstPassResult samplesAtFire];
            *(_DWORD *)buf = 136316162;
            v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
            __int16 v75 = 2048;
            double v76 = v17;
            __int16 v77 = 2048;
            unint64_t v78 = v22;
            __int16 v79 = 2048;
            uint64_t v80 = v23;
            __int16 v81 = 2048;
            uint64_t v82 = v24;
            _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s FirstPass triggered, score %f start %lu end %lu fire %lu", buf, 0x34u);
          }
        }
      }
    }
    if (self->_firstPassResult)
    {
      v27 = [MEMORY[0x263EFF9A0] dictionary];
      unint64_t v28 = [(CSKeywordAnalyzerNDAPIResult *)self->_firstPassResult bestStart];
      uint64_t v29 = [(CSKeywordAnalyzerNDAPIResult *)self->_firstPassResult samplesAtFire];
      unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
      unint64_t v31 = self->_analyzerTrailingSamples + v29;
      if ([(CSAudioCircularBuffer *)self->_audioBuffer sampleCount] >= v31)
      {
        if (v28 >= extraSamplesAtStart) {
          unint64_t v36 = v28 - extraSamplesAtStart;
        }
        else {
          unint64_t v36 = 0;
        }
        v37 = (void *)[(CSAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:v36 to:v31];
        id v38 = (id)[(CSPhraseDetector *)self->_phraseDetector getAnalyzedResultFromAudioChunk:v37];
        uint64_t v39 = [v37 numSamples];
        unint64_t v40 = v31 - v36;
        v41 = *MEMORY[0x263F37FA8];
        if (v39 != v40 && os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
        {
          v69 = v41;
          uint64_t v70 = [v37 numSamples];
          *(_DWORD *)buf = 136315650;
          v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          __int16 v75 = 2048;
          double v76 = *(double *)&v70;
          __int16 v77 = 2048;
          unint64_t v78 = v40;
          _os_log_error_impl(&dword_21C8A5000, v69, OS_LOG_TYPE_ERROR, "%s numSamplesinAudioChunk %lu not matching requiredNumSamples %lu !", buf, 0x20u);

          v41 = *MEMORY[0x263F37FA8];
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v41;
          uint64_t v43 = [v37 numSamples];
          *(_DWORD *)buf = 136315394;
          v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          __int16 v75 = 2048;
          double v76 = *(double *)&v43;
          _os_log_impl(&dword_21C8A5000, v42, OS_LOG_TYPE_DEFAULT, "%s Second pass set to analyze %lu samples, stop feeding", buf, 0x16u);
        }
        v44 = [(CSPhraseDetector *)self->_phraseDetector getAnalyzedResultFromFlushedAudio];
        v45 = [v44 ndapiResult];
        v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "bestStart"));
        [v27 setObject:v46 forKey:*MEMORY[0x263F38220]];

        v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "bestEnd"));
        [v27 setObject:v47 forKey:*MEMORY[0x263F38200]];

        v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "samplesFed"));
        [v27 setObject:v48 forKey:*MEMORY[0x263F381F0]];

        v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "samplesAtFire"));
        [v27 setObject:v49 forKey:*MEMORY[0x263F38210]];

        v50 = NSNumber;
        [v44 combinedScore];
        v51 = objc_msgSend(v50, "numberWithFloat:");
        [v27 setObject:v51 forKey:*MEMORY[0x263F38218]];

        v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v44, "phId"));
        [v27 setObject:v52 forKey:*MEMORY[0x263F381B0]];

        v72 = -[CSPhraseDetector phraseDetectorInfoFromPhId:](self->_phraseDetector, "phraseDetectorInfoFromPhId:", [v44 phId]);
        v53 = [v72 phraseConfig];
        v54 = [v53 name];

        if (v54)
        {
          v55 = [v53 name];
          [v27 setObject:v55 forKey:*MEMORY[0x263F381A8]];
        }
        if ([v44 isRunningQuasar])
        {
          v56 = NSNumber;
          [v44 recognizerScore];
          v57 = objc_msgSend(v56, "numberWithFloat:");
          [v27 setObject:v57 forKey:*MEMORY[0x263F381D8]];

          v58 = NSNumber;
          [v53 recognizerScoreOffset];
          v59 = objc_msgSend(v58, "numberWithFloat:");
          [v27 setObject:v59 forKey:*MEMORY[0x263F381E0]];

          v60 = NSNumber;
          [v53 recognizerScoreScaleFactor];
          v61 = objc_msgSend(v60, "numberWithFloat:");
          [v27 setObject:v61 forKey:*MEMORY[0x263F381D0]];
        }
        BOOL v62 = [v44 decision] == 1;
        if (!self->_supportsMph)
        {
          if ([v44 phId])
          {
            v68 = *MEMORY[0x263F37FA8];
            BOOL v62 = 0;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
              _os_log_impl(&dword_21C8A5000, v68, OS_LOG_TYPE_DEFAULT, "%s Report as rejection since the detected phId is not the default", buf, 0xCu);
              BOOL v62 = 0;
            }
          }
        }
        v63 = [NSNumber numberWithBool:v62];
        [v27 setObject:v63 forKey:*MEMORY[0x263F381C8]];

        v64 = (void *)*MEMORY[0x263F37FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
        {
          v65 = v64;
          v66 = [v44 description];
          *(_DWORD *)buf = 136315394;
          v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          __int16 v75 = 2112;
          double v76 = *(double *)&v66;
          _os_log_impl(&dword_21C8A5000, v65, OS_LOG_TYPE_DEFAULT, "%s Phrase detector result: %@", buf, 0x16u);
        }
        [(CSVTUITwoPassKeywordDetector *)self internalReset];
        id v26 = v27;
      }
      else
      {
        v32 = (void *)*MEMORY[0x263F37FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
        {
          v33 = self->_audioBuffer;
          v34 = v32;
          uint64_t v35 = [(CSAudioCircularBuffer *)v33 sampleCount];
          *(_DWORD *)buf = 136315650;
          v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
          __int16 v75 = 2048;
          double v76 = *(double *)&v35;
          __int16 v77 = 2048;
          unint64_t v78 = v31;
          _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s Waiting for the entire audio... samplesInBuffer %lu triggerSampleFedCount %lu", buf, 0x20u);
        }
        id v26 = 0;
      }
    }
    else
    {
      id v26 = 0;
    }
  }
  else
  {
    v25 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v74 = "-[CSVTUITwoPassKeywordDetector analyze:]";
      _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s Unable to create audio chunk, not feeding to analyzer", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (void)internalReset
{
  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzer reset];
  [(CSPhraseDetector *)self->_phraseDetector reset];
  self->_isFirstPassTriggered = 0;
  firstPassResult = self->_firstPassResult;
  self->_firstPassResult = 0;
}

- (void)reset
{
  [(CSVTUITwoPassKeywordDetector *)self internalReset];
  audioBuffer = self->_audioBuffer;

  [(CSAudioCircularBuffer *)audioBuffer reset];
}

- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3
{
  return [(CSVTUITwoPassKeywordDetector *)self initWithAsset:a3 supportMph:0];
}

- (CSVTUITwoPassKeywordDetector)initWithAsset:(id)a3 supportMph:(BOOL)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CSVTUITwoPassKeywordDetector;
  id v7 = [(CSVTUITwoPassKeywordDetector *)&v36 init];
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = [v6 resourcePath];
      uint64_t v9 = [v8 stringByAppendingPathComponent:@"config_1st.txt"];
      uint64_t v10 = [objc_alloc(MEMORY[0x263F38080]) initWithConfigPath:v9 resourcePath:v8];
      keywordAnalyzer = v7->_keywordAnalyzer;
      v7->_keywordAnalyzer = (CSKeywordAnalyzerNDAPI *)v10;

      id v12 = *MEMORY[0x263F37FA8];
      uint64_t v13 = *MEMORY[0x263F37FA8];
      if (v7->_keywordAnalyzer)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
          __int16 v39 = 2112;
          unint64_t v40 = v9;
          _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Initialized with config path: %@", buf, 0x16u);
        }
        v14 = [MEMORY[0x263F380F0] decodeConfigFrom:v6];
        [v14 threshold];
        v7->_keywordThreshold = v15;
        float v16 = [MEMORY[0x263F380F8] decodeConfigFrom:v6 forFirstPassSource:10];
        float v17 = (CSPhraseDetector *)objc_alloc_init(MEMORY[0x263F380A8]);
        phraseDetector = v7->_phraseDetector;
        v7->_phraseDetector = v17;

        [(CSPhraseDetector *)v7->_phraseDetector setConfig:v16];
        [v16 preTriggerAudioTime];
        float v20 = v19;
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        v7->_unint64_t extraSamplesAtStart = (unint64_t)(float)(v20 * v21);
        [v16 trailingAudioTime];
        float v23 = v22;
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        v7->_analyzerTrailingSamples = (unint64_t)(float)(v23 * v24);
        id v25 = objc_alloc(MEMORY[0x263F37FC0]);
        [MEMORY[0x263F38018] inputRecordingDurationInSecs];
        int v27 = v26;
        [MEMORY[0x263F38018] inputRecordingSampleRate];
        LODWORD(v29) = v28;
        LODWORD(v30) = v27;
        uint64_t v31 = [v25 initWithNumChannels:1 recordingDuration:v30 samplingRate:v29];
        audioBuffer = v7->_audioBuffer;
        v7->_audioBuffer = (CSAudioCircularBuffer *)v31;

        v7->_supportsMph = a4;
        [(CSVTUITwoPassKeywordDetector *)v7 reset];

        goto LABEL_7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since we cannot initialize NDAPI", buf, 0xCu);
      }
    }
    else
    {
      v34 = *MEMORY[0x263F37FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v38 = "-[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]";
        _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since there is no asset available", buf, 0xCu);
      }
    }
    v33 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v33 = v7;
LABEL_14:

  return v33;
}

@end