@interface ADAMSoundAnalysisWriter
- (ADAMSoundAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 soundDetectionSRWriter:(id)a7 speechEmotionSRWriter:(id)a8 completionHandler:(id)a9;
- (BOOL)_isMonitoringEmotion;
- (BOOL)_isMonitoringSoundDetection;
- (BOOL)_isMonitoringSpeechMetrics;
- (BOOL)isComplete;
- (BOOL)isMonitoring;
- (BOOL)verifyStateInit;
- (BOOL)verifyStateOn;
- (id).cxx_construct;
- (int)write:(id)a3 withMetadata:(const Metadata *)a4;
- (void)_initializeSoundAnalyzer;
- (void)_setProcessing:(BOOL)a3;
- (void)createAndLogOSTransaction;
- (void)destroyAndLogOSTransaction;
- (void)logResultCountAndFirstTimeStamp;
- (void)reinitializeSpeechEmotionRequest;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
- (void)sendCachedDetectionResultsToSensorKit;
@end

@implementation ADAMSoundAnalysisWriter

- (id).cxx_construct
{
  *((unsigned char *)self + 152) = 0;
  *((unsigned char *)self + 160) = 0;
  *((unsigned char *)self + 184) = 0;
  *((unsigned char *)self + 192) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 29) = (char *)self + 240;
  *((void *)self + 33) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = (char *)self + 264;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::destroy((void *)self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<ADAM::EndPointBitMask>::destroy((void *)self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_speechMetricsSRWriter, 0);
  objc_storeStrong((id *)&self->_soundDetectionSRWriter, 0);
  objc_storeStrong((id *)&self->_speechEmotionSRWriter, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_audioLevelRequest, 0);
  objc_destroyWeak((id *)&self->_speechEmotionRequest);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completeHandler, 0);

  objc_storeStrong((id *)&self->_SNAnalyzer, 0);
}

- (void)sendCachedDetectionResultsToSensorKit
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  begin_node = (ADAMSoundAnalysisWriter *)self->_detectionCachedTimestamps.__tree_.__begin_node_;
  p_pair1 = &self->_detectionCachedTimestamps.__tree_.__pair1_;
  if (begin_node != (ADAMSoundAnalysisWriter *)&self->_detectionCachedTimestamps.__tree_.__pair1_)
  {
    v4 = 0;
    p_detectionCachedResultMap = (uint64_t **)&self->_detectionCachedResultMap;
    while (1)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      v44 = begin_node;
      unint64_t frameCnt = begin_node->_frameCnt;
      p_unint64_t frameCnt = (uint64_t **)&begin_node->_frameCnt;
      long long v55 = 0u;
      long long v54 = 0u;
      obj = std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(p_detectionCachedResultMap, frameCnt, p_frameCnt)[5];
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v78 count:16];
      if (v7) {
        break;
      }
LABEL_38:

      v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v44;
      SNAnalyzer = v44->_SNAnalyzer;
      if (SNAnalyzer)
      {
        do
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)SNAnalyzer;
          SNAnalyzer = (SNAudioStreamAnalyzer *)SNAnalyzer->super.isa;
        }
        while (SNAnalyzer);
      }
      else
      {
        do
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v38[2].__value_.__left_;
          BOOL v41 = left->__value_.__left_ == v38;
          v38 = left;
        }
        while (!v41);
      }
      begin_node = (ADAMSoundAnalysisWriter *)left;
      if (left == p_pair1) {
        goto LABEL_46;
      }
    }
    LODWORD(v8) = 0;
    uint64_t v46 = *(void *)v55;
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v8 = (int)v8;
    uint64_t v47 = v7;
    while (1)
    {
      if (*(void *)v55 != v46) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
      v11 = *p_frameCnt;
      if ([(ADAMSoundAnalysisWriter *)self _isMonitoringSoundDetection])
      {
        uint64_t v12 = (uint64_t)v11 + v8;
        soundDetectionSRWriter = self->_soundDetectionSRWriter;
        id v53 = v4;
        [(ADAMSRSensorWriter *)soundDetectionSRWriter provideSample:v10 continuousTimestamp:(char *)v11 + v8 error:&v53];
        id v14 = v53;

        if (v14)
        {
          {
            ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
          }
          v15 = (id)ADAM::get_log(void)::adam_os_log;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            SRAbsoluteTime v16 = SRAbsoluteTimeFromContinuousTime(v12);
            *(_DWORD *)buf = 136317186;
            v61 = "ADAMSoundAnalysisWriter.mm";
            __int16 v62 = 1024;
            int v63 = 618;
            __int16 v64 = 1040;
            int v65 = 23;
            __int16 v66 = 2080;
            v67 = "ADAMSoundAnalysisWriter]";
            __int16 v68 = 2048;
            v69 = self;
            __int16 v70 = 2112;
            v71 = v10;
            __int16 v72 = 2048;
            uint64_t v73 = v12;
            __int16 v74 = 2048;
            SRAbsoluteTime v75 = v16;
            __int16 v76 = 2112;
            id v77 = v14;
            _os_log_impl(&dword_2227C1000, v15, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] failed to write SNDetectionResult result to SensorKit: %@, timestamp: continuous %llu, absolute %f, err: %@", buf, 0x54u);
          }

          v4 = v14;
        }
        else
        {
          v4 = 0;
        }
        uint64_t v7 = v47;
      }
      if (![(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics]) {
        goto LABEL_29;
      }
      v17 = [v10 identifier];
      v58 = v17;
      v18 = NSNumber;
      [v10 confidence];
      v19 = [v18 numberWithDouble:];
      v59 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

      v21 = (void *)[objc_alloc(MEMORY[0x263F179C8]) initWithClassificationDictionary:v20];
      if (v10)
      {
        [v10 timeRange];
      }
      else
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v50 = 0u;
      }
      v49[0] = v50;
      v49[1] = v51;
      v49[2] = v52;
      [v21 setTimeRange:v49];
      id v22 = objc_alloc(MEMORY[0x263F176D0]);
      sessionID = self->_sessionID;
      SRAbsoluteTime v24 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
      v25 = (void *)[v22 initWithSessionIdentifier:sessionID sessionFlags:0 timestamp:0 audioLevel:0 speechRecognition:v21 soundClassification:0 speechExpression:SRAbsoluteTimeToCFAbsoluteTime(v24)];
      speechMetricsSRWriter = self->_speechMetricsSRWriter;
      id v48 = v4;
      [(ADAMSRSensorWriter *)speechMetricsSRWriter provideSample:v25 error:&v48];
      id v27 = v48;

      if (v27)
      {
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v28 = (id)ADAM::get_log(void)::adam_os_log;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        v29 = *p_frameCnt;
        SRAbsoluteTime v30 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
        *(_DWORD *)buf = 136317186;
        v61 = "ADAMSoundAnalysisWriter.mm";
        __int16 v62 = 1024;
        int v63 = 635;
        __int16 v64 = 1040;
        int v65 = 23;
        __int16 v66 = 2080;
        v67 = "ADAMSoundAnalysisWriter]";
        __int16 v68 = 2048;
        v69 = self;
        __int16 v70 = 2112;
        v71 = v25;
        __int16 v72 = 2048;
        uint64_t v73 = (uint64_t)v29;
        __int16 v74 = 2048;
        SRAbsoluteTime v75 = v30;
        __int16 v76 = 2112;
        id v77 = v27;
        v31 = v28;
        os_log_type_t v32 = OS_LOG_TYPE_ERROR;
        v33 = "[%s:%-5d %.*s:%p] failed to write SRSpeechMetrics result to SensorKit: %@, timestamp: continuous %llu, abs"
              "olute %f, err: %@";
        uint32_t v34 = 84;
      }
      else
      {
        ++self->_detectionResultCounterPerMinute;
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v28 = (id)ADAM::get_log(void)::adam_os_log;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        v35 = *p_frameCnt;
        SRAbsoluteTime v36 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
        *(_DWORD *)buf = 136316930;
        v61 = "ADAMSoundAnalysisWriter.mm";
        __int16 v62 = 1024;
        int v63 = 640;
        __int16 v64 = 1040;
        int v65 = 23;
        __int16 v66 = 2080;
        v67 = "ADAMSoundAnalysisWriter]";
        __int16 v68 = 2048;
        v69 = self;
        __int16 v70 = 2112;
        v71 = v25;
        __int16 v72 = 2048;
        uint64_t v73 = (uint64_t)v35;
        __int16 v74 = 2048;
        SRAbsoluteTime v75 = v36;
        v31 = v28;
        os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
        v33 = "[%s:%-5d %.*s:%p] Write SRSpeechMetrics result: %@, timestamp: continuous %llu, absolute %f";
        uint32_t v34 = 74;
      }
      _os_log_impl(&dword_2227C1000, v31, v32, v33, buf, v34);
LABEL_28:

      v4 = v27;
      uint64_t v7 = v47;
LABEL_29:
      v8 += 5;
      if (v7 == ++v9)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v54 objects:v78 count:16];
        uint64_t v7 = v37;
        if (!v37) {
          goto LABEL_38;
        }
        goto LABEL_5;
      }
    }
  }
  v4 = 0;
LABEL_46:
  std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::destroy((void *)self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_);
  self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_detectionCachedResultMap.__tree_.__pair3_.__value_ = 0;
  self->_detectionCachedResultMap.__tree_.__begin_node_ = &self->_detectionCachedResultMap.__tree_.__pair1_;
  std::__tree<ADAM::EndPointBitMask>::destroy((void *)self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_);
  self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_ = 0;
  self->_detectionCachedTimestamps.__tree_.__pair3_.__value_ = 0;
  self->_detectionCachedTimestamps.__tree_.__begin_node_ = p_pair1;
}

- (void)logResultCountAndFirstTimeStamp
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v3 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int detectionResultCounterPerMinute = self->_detectionResultCounterPerMinute;
      int v13 = 136316418;
      id v14 = "ADAMSoundAnalysisWriter.mm";
      __int16 v15 = 1024;
      int v16 = 577;
      __int16 v17 = 1040;
      int v18 = 23;
      __int16 v19 = 2080;
      v20 = "ADAMSoundAnalysisWriter]";
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 1024;
      LODWORD(v24) = detectionResultCounterPerMinute;
      _os_log_impl(&dword_2227C1000, v3, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # detection results sent previous minute : %d", (uint8_t *)&v13, 0x32u);
    }
    self->_unsigned int detectionResultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v5 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_detectionFirstContinuousTimeStampPerMinute.__engaged_) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t val = self->_detectionFirstContinuousTimeStampPerMinute.var0.__val_;
      double detectionFirstAbsoluteTimestampPerMinute = self->_detectionFirstAbsoluteTimestampPerMinute;
      int v13 = 136316674;
      id v14 = "ADAMSoundAnalysisWriter.mm";
      __int16 v15 = 1024;
      int v16 = 580;
      __int16 v17 = 1040;
      int v18 = 23;
      __int16 v19 = 2080;
      v20 = "ADAMSoundAnalysisWriter]";
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = val;
      __int16 v25 = 2048;
      double v26 = detectionFirstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first detection timestamp of previous minute : continuous %llu, absolute %f", (uint8_t *)&v13, 0x40u);
    }

    if (self->_detectionFirstContinuousTimeStampPerMinute.__engaged_) {
      self->_detectionFirstContinuousTimeStampPerMinute.__engaged_ = 0;
    }
  }
  if (self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    uint64_t v8 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int emotionResultCounterPerMinute = self->_emotionResultCounterPerMinute;
      int v13 = 136316418;
      id v14 = "ADAMSoundAnalysisWriter.mm";
      __int16 v15 = 1024;
      int v16 = 586;
      __int16 v17 = 1040;
      int v18 = 23;
      __int16 v19 = 2080;
      v20 = "ADAMSoundAnalysisWriter]";
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 1024;
      LODWORD(v24) = emotionResultCounterPerMinute;
      _os_log_impl(&dword_2227C1000, v8, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # emotion results sent previous minute : %d", (uint8_t *)&v13, 0x32u);
    }
    self->_unsigned int emotionResultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v10 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_emotionFirstContinuousTimeStampPerMinute.__engaged_) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t v11 = self->_emotionFirstContinuousTimeStampPerMinute.var0.__val_;
      double emotionFirstAbsoluteTimestampPerMinute = self->_emotionFirstAbsoluteTimestampPerMinute;
      int v13 = 136316674;
      id v14 = "ADAMSoundAnalysisWriter.mm";
      __int16 v15 = 1024;
      int v16 = 589;
      __int16 v17 = 1040;
      int v18 = 23;
      __int16 v19 = 2080;
      v20 = "ADAMSoundAnalysisWriter]";
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = v11;
      __int16 v25 = 2048;
      double v26 = emotionFirstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_2227C1000, v10, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first emotion timestamps of previous minute : continuous %llu, absolute %f", (uint8_t *)&v13, 0x40u);
    }

    if (self->_emotionFirstContinuousTimeStampPerMinute.__engaged_) {
      self->_emotionFirstContinuousTimeStampPerMinute.__engaged_ = 0;
    }
  }
}

- (BOOL)verifyStateOn
{
  BOOL v3 = [(ADAMSRSensorWriter *)self->_speechEmotionSRWriter isValidSRSensorWriterPresent];
  if (v3)
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_soundDetectionSRWriter isValidSRSensorWriterPresent];
    if (v3) {
      LOBYTE(v3) = self->_SNAnalyzer != 0;
    }
  }
  return v3;
}

- (BOOL)verifyStateInit
{
  BOOL v3 = [(ADAMSRSensorWriter *)self->_speechEmotionSRWriter isValidSRSensorWriterPresent];
  if (v3)
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_soundDetectionSRWriter isValidSRSensorWriterPresent];
    if (v3) {
      LOBYTE(v3) = self->_SNAnalyzer == 0;
    }
  }
  return v3;
}

- (void)requestDidComplete:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "ADAMSoundAnalysisWriter.mm";
    __int16 v10 = 1024;
    int v11 = 553;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SN Request: %@ did complete", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  [(NSMutableArray *)self->_requests removeObject:v4];
  if (![(NSMutableArray *)self->_requests count])
  {
    completeHandler = (void (**)(id, void))self->_completeHandler;
    if (completeHandler) {
      completeHandler[2](completeHandler, 0);
    }
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    uint64_t v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315906;
    __int16 v10 = "ADAMSoundAnalysisWriter.mm";
    __int16 v11 = 1024;
    int v12 = 546;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_2227C1000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SN Request: %@ failed with error: %@", (uint8_t *)&v9, 0x26u);
  }

LABEL_10:
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(ADAMSoundAnalysisWriter *)self _isMonitoringEmotion]
      && ![(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics])
    {
      goto LABEL_85;
    }
    id v6 = v5;
    unint64_t speechEmotionTimestamp = self->_speechEmotionTimestamp;
    *(void *)buf = 0;
    uint64_t cont = 0;
    mach_get_times();
    uint64_t v8 = speechEmotionTimestamp;
    if (!self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
    {
      self->_double emotionFirstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(*(void *)buf
                                                                                     + speechEmotionTimestamp - cont);
      self->_emotionFirstContinuousTimeStampPerMinute.var0.__val_ = speechEmotionTimestamp;
      self->_emotionFirstContinuousTimeStampPerMinute.__engaged_ = 1;
    }
    if (![(ADAMSoundAnalysisWriter *)self _isMonitoringEmotion])
    {
      id v10 = 0;
      goto LABEL_62;
    }
    speechEmotionSRWriter = self->_speechEmotionSRWriter;
    id v112 = 0;
    [(ADAMSRSensorWriter *)speechEmotionSRWriter provideSample:v6 continuousTimestamp:speechEmotionTimestamp error:&v112];
    id v10 = v112;
    if (!v10) {
      goto LABEL_62;
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11) {
        goto LABEL_62;
      }
    }
    else
    {
      id v11 = (id)MEMORY[0x263EF8438];
      id v48 = MEMORY[0x263EF8438];
    }
    v49 = v11;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      SRAbsoluteTime v50 = SRAbsoluteTimeFromContinuousTime(v8);
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 426;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v6;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v8;
      *(_WORD *)&buf[38] = 2048;
      *(SRAbsoluteTime *)&buf[40] = v50;
      *(_WORD *)&buf[48] = 2112;
      *(void *)&buf[50] = v10;
      _os_log_impl(&dword_2227C1000, v49, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to write SNSpeechEmotionResult result to SensorKit: %@, continuous timestamp: continuous %llu, absolute %f, err: %@", buf, 0x3Au);
    }

LABEL_62:
    id v51 = objc_alloc(MEMORY[0x263F176C8]);
    long long v52 = [NSString stringWithFormat:@"1"];
    if (v6) {
      [v6 timeRange];
    }
    else {
      memset(v111, 0, sizeof(v111));
    }
    [v6 confidence];
    double v54 = v53;
    [v6 mood];
    double v56 = v55;
    [v6 valence];
    double v58 = v57;
    [v6 arousal];
    double v60 = v59;
    [v6 dominance];
    __int16 v62 = (void *)[v51 initWithVersion:v52 timeRange:v111 confidence:v54 mood:v56 valence:v58 activation:v60 dominance:v61];

    id v63 = objc_alloc(MEMORY[0x263F176D0]);
    sessionID = self->_sessionID;
    SRAbsoluteTime v65 = SRAbsoluteTimeFromContinuousTime(v8);
    __int16 v66 = (void *)[v63 initWithSessionIdentifier:sessionID sessionFlags:0 timestamp:0 audioLevel:0 speechRecognition:0 soundClassification:v62 speechExpression:SRAbsoluteTimeToCFAbsoluteTime(v65)];
    if (![(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics]) {
      goto LABEL_81;
    }

    speechMetricsSRWriter = self->_speechMetricsSRWriter;
    id v110 = 0;
    [(ADAMSRSensorWriter *)speechMetricsSRWriter provideSample:v66 error:&v110];
    id v70 = v110;
    if (v70)
    {
      id v10 = v70;
      if (ADAM::ADAMLogScope(void)::once != -1) {
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
      }
      if (ADAM::ADAMLogScope(void)::scope)
      {
        id v71 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v71) {
          goto LABEL_81;
        }
      }
      else
      {
        id v71 = (id)MEMORY[0x263EF8438];
        id v74 = MEMORY[0x263EF8438];
      }
      __int16 v72 = v71;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        SRAbsoluteTime v75 = SRAbsoluteTimeFromContinuousTime(v8);
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 443;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v66;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(SRAbsoluteTime *)&buf[40] = v75;
        *(_WORD *)&buf[48] = 2112;
        *(void *)&buf[50] = v10;
        _os_log_impl(&dword_2227C1000, v72, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to write SRSpeechMetrics result to SensorKit: %@, continuous timestamp: continuous %llu, absolute %f, err: %@", buf, 0x3Au);
      }
    }
    else
    {
      ++self->_emotionResultCounterPerMinute;
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      __int16 v72 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        SRAbsoluteTime v73 = SRAbsoluteTimeFromContinuousTime(v8);
        *(_DWORD *)buf = 136316930;
        *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 449;
        *(_WORD *)&buf[18] = 1040;
        *(_DWORD *)&buf[20] = 23;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = "ADAMSoundAnalysisWriter]";
        *(_WORD *)&buf[34] = 2048;
        *(void *)&buf[36] = self;
        *(_WORD *)&buf[44] = 2112;
        *(void *)&buf[46] = v66;
        *(_WORD *)&buf[54] = 2048;
        *(void *)&buf[56] = v8;
        __int16 v115 = 2048;
        SRAbsoluteTime v116 = v73;
        _os_log_impl(&dword_2227C1000, v72, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Write SpeechExpression result: %@, timestamp: continuous %llu, absolute %f", buf, 0x4Au);
      }
      id v10 = 0;
    }

LABEL_81:
    __int16 v76 = (ADAM *)self->_speechEmotionTimestamp;
    if (v6)
    {
      [v6 timeRange];
      uint64_t v78 = *((void *)&v108 + 1);
      uint64_t v79 = (CMTimeRange *)v109;
    }
    else
    {
      uint64_t v79 = 0;
      uint64_t v78 = 0;
      double v77 = 0.0;
      long long v108 = 0u;
      long long v109 = 0u;
      v107[3] = 0u;
    }
    self->_unint64_t speechEmotionTimestamp = ADAM::absoluteTimeFromCMTimeRange(v76, v78, v79, v77, v67, v68);

    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      __int16 v21 = ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 538;
        *(_WORD *)&buf[18] = 1040;
        *(_DWORD *)&buf[20] = 23;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = "ADAMSoundAnalysisWriter]";
        *(_WORD *)&buf[34] = 2048;
        *(void *)&buf[36] = self;
        *(_WORD *)&buf[44] = 2112;
        *(void *)&buf[46] = v5;
        _os_log_impl(&dword_2227C1000, v21, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Unknown SN result: %@", buf, 0x36u);
      }
      goto LABEL_85;
    }
    if (![(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics]) {
      goto LABEL_85;
    }
    id v18 = v5;
    unint64_t audioLevelTimestamp = self->_audioLevelTimestamp;
    *(void *)buf = 0;
    uint64_t cont = 0;
    mach_get_times();
    id v20 = objc_alloc(MEMORY[0x263F17688]);
    if (v18) {
      [v18 timeRange];
    }
    else {
      memset(v107, 0, 48);
    }
    [v18 decibelLevel];
    v81 = (void *)[v20 initWithTimeRange:v107 loudness:v80];
    id v82 = objc_alloc(MEMORY[0x263F176D0]);
    uint64_t v83 = audioLevelTimestamp;
    v84 = self->_sessionID;
    SRAbsoluteTime v85 = SRAbsoluteTimeFromContinuousTime(v83);
    v86 = (void *)[v82 initWithSessionIdentifier:v84 sessionFlags:0 timestamp:v81 audioLevel:0 speechRecognition:0 soundClassification:0 speechExpression:SRAbsoluteTimeToCFAbsoluteTime(v85)];
    v87 = self->_speechMetricsSRWriter;
    id v106 = 0;
    [(ADAMSRSensorWriter *)v87 provideSample:v86 error:&v106];
    id v88 = v106;
    if (v88)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v90 = (id)ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      SRAbsoluteTime v91 = SRAbsoluteTimeFromContinuousTime(v83);
      *(_DWORD *)buf = 136317186;
      *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 524;
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 23;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = "ADAMSoundAnalysisWriter]";
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = self;
      *(_WORD *)&buf[44] = 2112;
      *(void *)&buf[46] = v86;
      *(_WORD *)&buf[54] = 2048;
      *(void *)&buf[56] = v83;
      __int16 v115 = 2048;
      SRAbsoluteTime v116 = v91;
      __int16 v117 = 2112;
      id v118 = v88;
      v92 = "[%s:%-5d %.*s:%p] failed to write SNLKFSResult result to SensorKit: %@, continuous timestamp: continuous %ll"
            "u, absolute %f, err: %@";
      v93 = v90;
      os_log_type_t v94 = OS_LOG_TYPE_ERROR;
      uint32_t v95 = 84;
    }
    else
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v90 = (id)ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_99;
      }
      SRAbsoluteTime v97 = SRAbsoluteTimeFromContinuousTime(v83);
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 529;
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 23;
      *(_WORD *)&buf[24] = 2080;
      *(void *)&buf[26] = "ADAMSoundAnalysisWriter]";
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = self;
      *(_WORD *)&buf[44] = 2112;
      *(void *)&buf[46] = v86;
      *(_WORD *)&buf[54] = 2048;
      *(void *)&buf[56] = v83;
      __int16 v115 = 2048;
      SRAbsoluteTime v116 = v97;
      v92 = "[%s:%-5d %.*s:%p] Write SNLKFSResult result: %@, timestamp: continuous %llu, absolute %f";
      v93 = v90;
      os_log_type_t v94 = OS_LOG_TYPE_DEBUG;
      uint32_t v95 = 74;
    }
    _os_log_impl(&dword_2227C1000, v93, v94, v92, buf, v95);
LABEL_99:

    v100 = (ADAM *)self->_audioLevelTimestamp;
    if (v18)
    {
      [v18 timeRange];
      uint64_t v102 = v104;
      v103 = (CMTimeRange *)v105;
    }
    else
    {
      v103 = 0;
      uint64_t v102 = 0;
      double v101 = 0.0;
    }
    self->_unint64_t audioLevelTimestamp = ADAM::absoluteTimeFromCMTimeRange(v100, v102, v103, v101, v98, v99);

    goto LABEL_85;
  }
  if (![(ADAMSoundAnalysisWriter *)self _isMonitoringSoundDetection]
    && ![(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics])
  {
    goto LABEL_85;
  }
  id v12 = v5;
  __int16 v13 = self;
  id v14 = v12;
  __int16 v15 = [v14 identifier];
  char v16 = [v15 isEqualToString:*MEMORY[0x263F17A70]];

  if (v16)
  {
    uint64_t v17 = 208;
  }
  else
  {
    id v22 = [v14 identifier];
    char v23 = [v22 isEqualToString:*MEMORY[0x263F17A78]];

    if (v23)
    {
      uint64_t v17 = 216;
    }
    else
    {
      unint64_t v24 = [v14 identifier];
      int v25 = [v24 isEqualToString:*MEMORY[0x263F17A88]];

      if (!v25)
      {
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v96 = ADAM::get_log(void)::adam_os_log;
        if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = "ADAMSoundAnalysisWriter.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 501;
          *(_WORD *)&buf[18] = 1040;
          *(_DWORD *)&buf[20] = 23;
          *(_WORD *)&buf[24] = 2080;
          *(void *)&buf[26] = "ADAMSoundAnalysisWriter]";
          *(_WORD *)&buf[34] = 2048;
          *(void *)&buf[36] = v13;
          *(_WORD *)&buf[44] = 2112;
          *(void *)&buf[46] = v14;
          _os_log_impl(&dword_2227C1000, v96, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Unknown SNDetection result: %@", buf, 0x36u);
        }

        goto LABEL_85;
      }
      uint64_t v17 = 224;
    }
  }
  uint64_t v26 = *(uint64_t *)((char *)&v13->super.isa + v17);
  *(void *)buf = 0;
  mach_get_times();
  uint64_t cont = v26;
  p_pair1 = (uint64_t **)&v13->_detectionCachedTimestamps.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_41;
  }
  v29 = &v13->_detectionCachedTimestamps.__tree_.__pair1_;
  do
  {
    uint64_t v30 = (uint64_t)left[4].__value_.__left_;
    BOOL v31 = v30 >= v26;
    if (v30 >= v26) {
      os_log_type_t v32 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)left;
    }
    else {
      os_log_type_t v32 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)&left[1];
    }
    if (v31) {
      v29 = left;
    }
    left = *v32;
  }
  while (*v32);
  if (v29 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)p_pair1
    || (void *)v26 < v29[4].__value_.__left_)
  {
LABEL_41:
    uint64_t v33 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    uint32_t v34 = std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&v13->_detectionCachedResultMap, v26, (uint64_t **)&cont);
    v35 = v34[5];
    v34[5] = (uint64_t *)v33;
  }
  [std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&v13->_detectionCachedResultMap, v26, (uint64_t **)&cont)[5] addObject:v14];
  v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_;
  v39 = &v13->_detectionCachedTimestamps.__tree_.__pair1_;
  if (v38)
  {
    while (1)
    {
      while (1)
      {
        v39 = v38;
        uint64_t v40 = (uint64_t)v38[4].__value_.__left_;
        if (v26 >= v40) {
          break;
        }
        v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v39->__value_.__left_;
        p_pair1 = (uint64_t **)v39;
        if (!v39->__value_.__left_) {
          goto LABEL_49;
        }
      }
      if (v40 >= v26) {
        break;
      }
      v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v39[1].__value_.__left_;
      if (!v38)
      {
        p_pair1 = (uint64_t **)&v39[1];
        goto LABEL_49;
      }
    }
  }
  else
  {
LABEL_49:
    BOOL v41 = (uint64_t *)operator new(0x28uLL);
    v41[4] = v26;
    *BOOL v41 = 0;
    v41[1] = 0;
    v41[2] = (uint64_t)v39;
    __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *p_pair1 = v41;
    v42 = *(void **)v13->_detectionCachedTimestamps.__tree_.__begin_node_;
    if (v42)
    {
      v13->_detectionCachedTimestamps.__tree_.__begin_node_ = v42;
      BOOL v41 = *p_pair1;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_, v41);
    ++v13->_detectionCachedTimestamps.__tree_.__pair3_.__value_;
  }
  v43 = *(Class *)((char *)&v13->super.isa + v17);
  if (v14)
  {
    [v14 timeRange];
    uint64_t v45 = *(void *)&buf[24];
    uint64_t v46 = (CMTimeRange *)*(unsigned int *)&buf[32];
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v45 = 0;
    double v44 = 0.0;
    memset(buf, 0, 48);
  }
  *(Class *)((char *)&v13->super.isa + v17) = (Class)ADAM::absoluteTimeFromCMTimeRange(v43, v45, v46, v44, v36, v37);
  if (!v13->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    uint64_t v47 = cont;
    v13->_double detectionFirstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(cont);
    v13->_detectionFirstContinuousTimeStampPerMinute.var0.__val_ = v47;
    v13->_detectionFirstContinuousTimeStampPerMinute.__engaged_ = 1;
  }

LABEL_85:
}

- (void)_setProcessing:(BOOL)a3
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  self->_processing = a3;

  os_unfair_lock_unlock(p_statusLock);
}

- (int)write:(id)a3 withMetadata:(const Metadata *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(ADAMSoundAnalysisWriter *)self _isMonitoringEmotion]
    || [(ADAMSoundAnalysisWriter *)self _isMonitoringSoundDetection]
    || [(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics])
  {
    if (!self->_transaction) {
      [(ADAMSoundAnalysisWriter *)self createAndLogOSTransaction];
    }
    [(ADAMSoundAnalysisWriter *)self _initializeSoundAnalyzer];
    if (ADAM::isXCTest(void)::once != -1) {
      dispatch_once(&ADAM::isXCTest(void)::once, &__block_literal_global_60);
    }
    if (!ADAM::isXCTest(void)::isXCTest)
    {
      BOOL v7 = a4->var2 != 0;
      UInt64 mHostTime = a4->var0.mHostTime;
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__ADAMSoundAnalysisWriter_write_withMetadata___block_invoke;
      block[3] = &unk_264628DC0;
      block[4] = self;
      UInt64 v15 = mHostTime;
      id v14 = v6;
      char v16 = a4;
      BOOL v17 = v7;
      dispatch_async(queue, block);
    }
  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v10 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v10) {
        goto LABEL_19;
      }
    }
    else
    {
      id v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "ADAMSoundAnalysisWriter.mm";
      __int16 v20 = 1024;
      int v21 = 385;
      _os_log_impl(&dword_2227C1000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d emotion and detection not being monitored...", buf, 0x12u);
    }
  }
LABEL_19:

  return 0;
}

uint64_t __46__ADAMSoundAnalysisWriter_write_withMetadata___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[97])
  {
    char v3 = v2[96];
    if (((-64 * v3) | ((-85 * v3) >> 2)) <= 0x15u)
    {
      [v2 reinitializeSpeechEmotionRequest];
      v2 = *(unsigned char **)(a1 + 32);
      char v3 = v2[96];
    }
    v2[96] = v3 + 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 96) %= 0xCu;
  }
  else
  {
    [v2 reinitializeSpeechEmotionRequest];
  }
  [*(id *)(a1 + 32) _setProcessing:1];
  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 208) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 216) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 224) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 280) = *(void *)(a1 + 48);
  [*(id *)(*(void *)(a1 + 32) + 8) analyzeAudioBuffer:*(void *)(a1 + 40) atAudioFramePosition:*(void *)(*(void *)(a1 + 32) + 32)];
  [*(id *)(a1 + 32) sendCachedDetectionResultsToSensorKit];
  [*(id *)(a1 + 32) logResultCountAndFirstTimeStamp];
  *(void *)(*(void *)(a1 + 32) + 32) += *(unsigned int *)(*(void *)(a1 + 56) + 64);
  [*(id *)(a1 + 32) _setProcessing:0];
  if (*(unsigned char *)(a1 + 64))
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v4)
      {
LABEL_16:
        *(unsigned char *)(*(void *)(a1 + 32) + 68) = 1;
        [*(id *)(*(void *)(a1 + 32) + 8) completeAnalysis];
        return [*(id *)(a1 + 32) destroyAndLogOSTransaction];
      }
    }
    else
    {
      id v4 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "ADAMSoundAnalysisWriter.mm";
      __int16 v9 = 1024;
      int v10 = 374;
      _os_log_impl(&dword_2227C1000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sending the last batch of audio data to SoundAnalysis", (uint8_t *)&v7, 0x12u);
    }

    goto LABEL_16;
  }
  return [*(id *)(a1 + 32) destroyAndLogOSTransaction];
}

- (void)reinitializeSpeechEmotionRequest
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_speechEmotionRequest = &self->_speechEmotionRequest;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speechEmotionRequest);

  if (WeakRetained)
  {
    SNAnalyzer = self->_SNAnalyzer;
    id v6 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
    [(SNAudioStreamAnalyzer *)SNAnalyzer removeRequest:v6];

    requests = self->_requests;
    id v8 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
    [(NSMutableArray *)requests removeObject:v8];

    objc_storeWeak((id *)p_speechEmotionRequest, 0);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F17A18]);
  [(NSMutableArray *)self->_requests addObject:v9];
  id v10 = objc_storeWeak((id *)p_speechEmotionRequest, v9);
  uint64_t v11 = self->_SNAnalyzer;
  id v12 = v10;
  id v21 = 0;
  [(SNAudioStreamAnalyzer *)v11 addRequest:v9 withObserver:self error:&v21];
  id v13 = v21;

  if (v13)
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v14 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v14) {
        goto LABEL_21;
      }
    }
    else
    {
      id v14 = (id)MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    BOOL v17 = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
      *(_DWORD *)buf = 136315650;
      char v23 = "ADAMSoundAnalysisWriter.mm";
      __int16 v24 = 1024;
      int v25 = 309;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to add SN request: %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15) {
        goto LABEL_21;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    BOOL v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
      *(_DWORD *)buf = 136315650;
      char v23 = "ADAMSoundAnalysisWriter.mm";
      __int16 v24 = 1024;
      int v25 = 313;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added SN request: %@", buf, 0x1Cu);
    }
  }

LABEL_21:
}

- (BOOL)isComplete
{
  v2 = self;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  LOBYTE(v2) = !v2->_processing;
  os_unfair_lock_unlock(p_statusLock);
  return (char)v2;
}

- (BOOL)isMonitoring
{
  if ([(ADAMSoundAnalysisWriter *)self _isMonitoringEmotion]
    || [(ADAMSoundAnalysisWriter *)self _isMonitoringSoundDetection])
  {
    return 1;
  }

  return [(ADAMSoundAnalysisWriter *)self _isMonitoringSpeechMetrics];
}

- (BOOL)_isMonitoringSoundDetection
{
  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if (ADAM::Parameters::GetParamValue<BOOL>(5u))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_soundDetectionSRWriter isValidSRSensorWriterPresent];
    if (v3)
    {
      BOOL v3 = [(ADAMSRSensorWriter *)self->_soundDetectionSRWriter isMonitoring];
      if (v3)
      {
        soundDetectionSRWriter = self->_soundDetectionSRWriter;
        LOBYTE(v3) = [(ADAMSRSensorWriter *)soundDetectionSRWriter isBundleIdentifierEligible];
      }
    }
  }
  return v3;
}

- (BOOL)_isMonitoringEmotion
{
  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if (ADAM::Parameters::GetParamValue<BOOL>(5u))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_speechEmotionSRWriter isValidSRSensorWriterPresent];
    if (v3)
    {
      BOOL v3 = [(ADAMSRSensorWriter *)self->_speechEmotionSRWriter isMonitoring];
      if (v3)
      {
        speechEmotionSRWriter = self->_speechEmotionSRWriter;
        LOBYTE(v3) = [(ADAMSRSensorWriter *)speechEmotionSRWriter isBundleIdentifierEligible];
      }
    }
  }
  return v3;
}

- (BOOL)_isMonitoringSpeechMetrics
{
  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if (ADAM::Parameters::GetParamValue<BOOL>(5u))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isValidSRSensorWriterPresent];
    if (v3)
    {
      BOOL v3 = [(ADAMSRSensorWriter *)self->_speechMetricsSRWriter isMonitoring];
      if (v3)
      {
        speechMetricsSRWriter = self->_speechMetricsSRWriter;
        LOBYTE(v3) = [(ADAMSRSensorWriter *)speechMetricsSRWriter isBundleIdentifierEligible];
      }
    }
  }
  return v3;
}

- (void)_initializeSoundAnalyzer
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_initLock = &self->_initLock;
  os_unfair_lock_lock(&self->_initLock);
  if (!self->_soundAnalyzerInitialized)
  {
    id v4 = (SNAudioStreamAnalyzer *)[objc_alloc(MEMORY[0x263F179B0]) initWithFormat:self->_format];
    SNAnalyzer = self->_SNAnalyzer;
    self->_SNAnalyzer = v4;

    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v6 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      id v6 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_SNAnalyzer;
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = "ADAMSoundAnalysisWriter.mm";
      __int16 v34 = 1024;
      int v35 = 182;
      __int16 v36 = 2112;
      *(void *)double v37 = v8;
      _os_log_impl(&dword_2227C1000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created SN AudioStreamAnalyzer %@", buf, 0x1Cu);
    }

LABEL_11:
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requests = self->_requests;
    self->_requests = v9;

    uint64_t v11 = objc_opt_new();
    [v11 setComputeUnits:0];
    id v12 = objc_alloc(MEMORY[0x263F179F8]);
    id v13 = (void *)[v12 initWithDetectorIdentifier:*MEMORY[0x263F17A58] error:0];
    [v13 setModelConfiguration:v11];
    [(NSMutableArray *)self->_requests addObject:v13];
    id v14 = objc_alloc(MEMORY[0x263F179F8]);
    id v15 = (void *)[v14 initWithDetectorIdentifier:*MEMORY[0x263F17A60] error:0];
    [v15 setModelConfiguration:v11];
    [(NSMutableArray *)self->_requests addObject:v15];
    id v16 = objc_alloc(MEMORY[0x263F179F8]);
    BOOL v17 = (void *)[v16 initWithDetectorIdentifier:*MEMORY[0x263F17A68] error:0];
    [v17 setModelConfiguration:v11];
    [(NSMutableArray *)self->_requests addObject:v17];
    id v18 = self->_requests;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __51__ADAMSoundAnalysisWriter__initializeSoundAnalyzer__block_invoke;
    v31[3] = &unk_264628D98;
    v31[4] = self;
    [(NSMutableArray *)v18 enumerateObjectsUsingBlock:v31];
    id v19 = (SNMeasureLKFSRequest *)objc_alloc_init(MEMORY[0x263F17A38]);
    audioLevelRequest = self->_audioLevelRequest;
    self->_audioLevelRequest = v19;

    [(NSMutableArray *)self->_requests addObject:self->_audioLevelRequest];
    id v21 = self->_SNAnalyzer;
    uint64_t v22 = self->_audioLevelRequest;
    id v30 = 0;
    [(SNAudioStreamAnalyzer *)v21 addRequest:v22 withObserver:self error:&v30];
    id v23 = v30;
    if (v23)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      uint64_t v25 = ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "ADAMSoundAnalysisWriter.mm";
      __int16 v34 = 1024;
      int v35 = 232;
      __int16 v36 = 1040;
      *(_DWORD *)double v37 = 23;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "ADAMSoundAnalysisWriter]";
      __int16 v38 = 2048;
      v39 = self;
      __int16 v26 = "[%s:%-5d %.*s:%p] failed to add SNMeasureAudioLevelRequest";
      id v27 = v25;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      uint64_t v29 = ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = "ADAMSoundAnalysisWriter.mm";
      __int16 v34 = 1024;
      int v35 = 236;
      __int16 v36 = 1040;
      *(_DWORD *)double v37 = 23;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = "ADAMSoundAnalysisWriter]";
      __int16 v38 = 2048;
      v39 = self;
      __int16 v26 = "[%s:%-5d %.*s:%p] added SNMeasureAudioLevelRequest";
      id v27 = v29;
      os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_2227C1000, v27, v28, v26, buf, 0x2Cu);
LABEL_19:

    self->_unint64_t frameCnt = 0;
    self->_unint64_t speechEmotionTimestamp = 0;
    self->_soundAnalyzerInitialized = 1;
  }
  os_unfair_lock_unlock(p_initLock);
}

void __51__ADAMSoundAnalysisWriter__initializeSoundAnalyzer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  id v13 = 0;
  [v5 addRequest:v3 withObserver:v4 error:&v13];
  id v6 = v13;
  if (!v6)
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v7 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315650;
    id v15 = "ADAMSoundAnalysisWriter.mm";
    __int16 v16 = 1024;
    int v17 = 217;
    __int16 v18 = 2112;
    id v19 = v3;
    id v9 = "%25s:%-5d added SN request: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v7) {
      goto LABEL_20;
    }
  }
  else
  {
    id v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "ADAMSoundAnalysisWriter.mm";
    __int16 v16 = 1024;
    int v17 = 213;
    __int16 v18 = 2112;
    id v19 = v3;
    id v9 = "%25s:%-5d failed to add SN request: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_2227C1000, v10, v11, v9, buf, 0x1Cu);
  }
LABEL_19:

LABEL_20:
}

- (ADAMSoundAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 soundDetectionSRWriter:(id)a7 speechEmotionSRWriter:(id)a8 completionHandler:(id)a9
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v44 = a5;
  id v45 = a6;
  id v46 = a7;
  id v47 = a8;
  id v16 = a9;
  v48.receiver = self;
  v48.super_class = (Class)ADAMSoundAnalysisWriter;
  int v17 = [(ADAMSoundAnalysisWriter *)&v48 init];
  p_isa = (id *)&v17->super.isa;
  id v19 = v17;
  if (!v17)
  {
LABEL_12:
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v34 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v34)
      {
LABEL_21:
        BOOL v41 = v19;
        goto LABEL_22;
      }
    }
    else
    {
      id v34 = (id)MEMORY[0x263EF8438];
      id v35 = MEMORY[0x263EF8438];
    }
    __int16 v36 = v34;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      double v37 = [[NSNumber numberWithBool:-[ADAMSoundAnalysisWriter _isMonitoringEmotion](v19, "_isMonitoringEmotion")];
      __int16 v38 = [NSNumber numberWithBool:-[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](v19, "_isMonitoringSoundDetection")];
      v39 = [NSNumber numberWithBool:-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](v19, "_isMonitoringSpeechMetrics")];
      uint64_t v40 = [(NSMutableArray *)v19->_requests count];
      *(_DWORD *)buf = 136316674;
      SRAbsoluteTime v50 = "ADAMSoundAnalysisWriter.mm";
      __int16 v51 = 1024;
      int v52 = 169;
      __int16 v53 = 2112;
      *(void *)double v54 = v19;
      *(_WORD *)&v54[8] = 2112;
      *(void *)&v54[10] = v37;
      *(_WORD *)&v54[18] = 2112;
      *(void *)&v54[20] = v38;
      *(_WORD *)&v54[28] = 2112;
      double v55 = v39;
      __int16 v56 = 2048;
      uint64_t v57 = v40;
      _os_log_impl(&dword_2227C1000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created ADAM SN Writer: %@ monitoring emotion? %@, monitoring detecion? %@, monitoring speech metrics? %@, num requests: %lu", buf, 0x44u);
    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v17->_format, a5);
  uint64_t v20 = [NSString stringWithFormat:@"%d", v13];
  sessionID = v19->_sessionID;
  v19->_sessionID = (NSString *)v20;

  {
    ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
  }
  uint64_t v22 = ADAM::get_log(void)::adam_os_log;
  if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    SRAbsoluteTime v50 = "ADAMSoundAnalysisWriter.mm";
    __int16 v51 = 1024;
    int v52 = 112;
    __int16 v53 = 1040;
    *(_DWORD *)double v54 = 23;
    *(_WORD *)&v54[4] = 2080;
    *(void *)&v54[6] = "ADAMSoundAnalysisWriter]";
    *(_WORD *)&v54[14] = 2048;
    *(void *)&v54[16] = v19;
    *(_WORD *)&v54[24] = 1024;
    *(_DWORD *)&v54[26] = v13;
    _os_log_impl(&dword_2227C1000, v22, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] Created with session ID: %d", buf, 0x32u);
  }
  uint64_t v23 = MEMORY[0x223C9DD30](v16);
  id completeHandler = v19->_completeHandler;
  v19->_id completeHandler = (id)v23;

  v19->_processing = 0;
  v19->_soundAnalyzerInitialized = 0;
  *(void *)&v19->_statusLock._os_unfair_lock_opaque = 0;
  v19->_isLastBatch = 0;
  objc_storeWeak(p_isa + 10, 0);
  audioLevelRequest = v19->_audioLevelRequest;
  v19->_audioLevelRequest = 0;

  v19->_siriAudioBufferCount = 0;
  v19->_unsigned int detectionResultCounterPerMinute = 0;
  v19->_unsigned int emotionResultCounterPerMinute = 0;
  v19->_double detectionFirstAbsoluteTimestampPerMinute = 0.0;
  v19->_double emotionFirstAbsoluteTimestampPerMinute = 0.0;
  v19->_unint64_t audioLevelTimestamp = 0;
  objc_storeStrong(p_isa + 17, a6);
  v19->_laughterTimeTracker = 0;
  v19->_shoutingTimeTracker = 0;
  v19->_speechTimeTracker = 0;
  if ([(ADAMSoundAnalysisWriter *)v19 isMonitoring]) {
    [(ADAMSoundAnalysisWriter *)v19 createAndLogOSTransaction];
  }
  __int16 v26 = [NSString stringWithUTF8String:"SiriUplink"];
  int v27 = [v15 hasPrefix:v26];

  if (v27)
  {
    v19->_streamType = 0;
    objc_storeStrong(p_isa + 15, a8);
    objc_storeStrong(p_isa + 16, a7);
    dispatch_queue_t v28 = dispatch_queue_create("SiriUplink", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v28;
    char v30 = 1;
LABEL_11:

    v19->_inSiriUseCase = v30;
    goto LABEL_12;
  }
  BOOL v31 = [NSString stringWithUTF8String:"TelephonyUplink"];
  int v32 = [v15 hasPrefix:v31];

  if (v32)
  {
    v19->_streamType = 1;
    objc_storeStrong(p_isa + 15, a8);
    objc_storeStrong(p_isa + 16, a7);
    dispatch_queue_t v33 = dispatch_queue_create("TelephonyUplink", 0);
    char v30 = 0;
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v33;
    goto LABEL_11;
  }
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    BOOL v41 = (ADAMSoundAnalysisWriter *)*(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v41) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v41 = (ADAMSoundAnalysisWriter *)MEMORY[0x263EF8438];
    id v43 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(&v41->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    SRAbsoluteTime v50 = "ADAMSoundAnalysisWriter.mm";
    __int16 v51 = 1024;
    int v52 = 162;
    __int16 v53 = 2112;
    *(void *)double v54 = v15;
    _os_log_impl(&dword_2227C1000, &v41->super, OS_LOG_TYPE_ERROR, "%25s:%-5d unknown audio buffer stream type: %@", buf, 0x1Cu);
  }

  BOOL v41 = 0;
LABEL_22:

  return v41;
}

- (void)destroyAndLogOSTransaction
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  transaction = self->_transaction;
  self->_transaction = 0;

  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v3 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v3) {
      return;
    }
  }
  else
  {
    id v3 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "ADAMSoundAnalysisWriter.mm";
    __int16 v7 = 1024;
    int v8 = 97;
    _os_log_impl(&dword_2227C1000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed os_transaction for sound analysis", (uint8_t *)&v5, 0x12u);
  }
}

- (void)createAndLogOSTransaction
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    int v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5) {
      return;
    }
  }
  else
  {
    int v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "ADAMSoundAnalysisWriter.mm";
    __int16 v9 = 1024;
    int v10 = 91;
    _os_log_impl(&dword_2227C1000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created os_transaction for sound analysis", (uint8_t *)&v7, 0x12u);
  }
}

@end