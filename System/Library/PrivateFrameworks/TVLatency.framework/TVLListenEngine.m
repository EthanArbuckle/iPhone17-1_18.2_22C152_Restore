@interface TVLListenEngine
+ (TVLListenEngine)engineWithCompletion:(id)a3;
+ (void)invalidate;
- (AVAudioEngine)audioEngine;
- (AVAudioFile)file;
- (AVAudioInputNode)microphone;
- (AVAudioPlayerNode)player;
- (AVAudioUnit)mixer;
- (BOOL)_setupAndStartAudioEngineGraphWithTimeout:(double)a3 error:(id *)a4;
- (BOOL)_setupAndStartAudioSessionWithError:(id *)a3;
- (BOOL)didMissDeadline;
- (BOOL)lastObservationWasConfident;
- (BOOL)startListeningWithReferenceTone:(id)a3 at:(unint64_t)a4 saveToFile:(id)a5 withCallback:(id)a6 completion:(id)a7;
- (NSDate)firstObservationDate;
- (NSMutableArray)confidentResults;
- (OS_dispatch_queue)analysisQueue;
- (OS_dispatch_source)timer;
- (SNAudioStreamAnalyzer)streamAnalyzer;
- (SNEstimateAudioOffsetRequest)estimateAudioOffsetRequest;
- (TVLListenEngine)init;
- (double)medianOfSortedArray:(id)a3;
- (double)timeToConverge;
- (id)callback;
- (id)completion;
- (int64_t)convergenceLossCount;
- (void)_handleIterruption:(id)a3;
- (void)_splitMicrophoneAndReferenceToneChannels;
- (void)completeAnalysis;
- (void)init;
- (void)invalidate;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)requestDidComplete:(id)a3;
- (void)setAnalysisQueue:(id)a3;
- (void)setAudioEngine:(id)a3;
- (void)setCallback:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConfidentResults:(id)a3;
- (void)setConvergenceLossCount:(int64_t)a3;
- (void)setDidMissDeadline:(BOOL)a3;
- (void)setEstimateAudioOffsetRequest:(id)a3;
- (void)setFile:(id)a3;
- (void)setFirstObservationDate:(id)a3;
- (void)setLastObservationWasConfident:(BOOL)a3;
- (void)setMicrophone:(id)a3;
- (void)setMixer:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setStreamAnalyzer:(id)a3;
- (void)setTimeToConverge:(double)a3;
- (void)setTimer:(id)a3;
@end

@implementation TVLListenEngine

+ (TVLListenEngine)engineWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EF93E0] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__TVLListenEngine_engineWithCompletion___block_invoke;
  v8[3] = &unk_26491ECF8;
  id v9 = v4;
  id v10 = a1;
  id v6 = v4;
  [v5 requestRecordPermission:v8];

  return result;
}

void __40__TVLListenEngine_engineWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    if (!_listenEngineInst)
    {
      id v4 = objc_alloc_init(TVLListenEngine);
      v5 = (void *)_listenEngineInst;
      _listenEngineInst = (uint64_t)v4;

      id v6 = [MEMORY[0x263EF93E0] sharedInstance];
      [v6 inputLatency];
      _inputLatency = v7;

      if (_TVLLogDefault_onceToken_6 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
      }
      v8 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        uint64_t v11 = _inputLatency;
        _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Input Latency: %f", (uint8_t *)&v10, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    objc_sync_exit(v3);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v9();
  }
}

- (TVLListenEngine)init
{
  v16.receiver = self;
  v16.super_class = (Class)TVLListenEngine;
  v2 = [(TVLListenEngine *)&v16 init];
  id v3 = v2;
  if (!v2) {
    goto LABEL_5;
  }
  id v15 = 0;
  BOOL v4 = [(TVLListenEngine *)v2 _setupAndStartAudioSessionWithError:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    id v14 = v5;
    BOOL v7 = [(TVLListenEngine *)v3 _setupAndStartAudioEngineGraphWithTimeout:&v14 error:2.0];
    id v8 = v14;

    if (v7)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.tvlatency.soundanalysis", 0);
      analysisQueue = v3->_analysisQueue;
      v3->_analysisQueue = (OS_dispatch_queue *)v9;

      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:v3 selector:sel__handleIterruption_ name:*MEMORY[0x263EF90A0] object:0];

LABEL_5:
      uint64_t v12 = v3;
      goto LABEL_12;
    }
    id v6 = v8;
  }
  if (_TVLLogDefault_onceToken_6 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
  }
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
    -[TVLListenEngine init]();
  }

  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

+ (void)invalidate
{
  id obj = a1;
  objc_sync_enter(obj);
  [(id)_listenEngineInst invalidate];
  v2 = (void *)_listenEngineInst;
  _listenEngineInst = 0;

  objc_sync_exit(obj);
}

- (void)invalidate
{
  id v3 = [(TVLListenEngine *)self mixer];
  [v3 removeTapOnBus:0];

  BOOL v4 = [(TVLListenEngine *)self audioEngine];
  [v4 stop];

  [(TVLListenEngine *)self setPlayer:0];
  [(TVLListenEngine *)self setMixer:0];
  [(TVLListenEngine *)self setMicrophone:0];
  [(TVLListenEngine *)self setAudioEngine:0];
  id v5 = [MEMORY[0x263EF93E0] sharedInstance];
  [v5 setActive:0 error:0];
}

- (void)_handleIterruption:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263EF90C8]];
  uint64_t v6 = [v5 integerValue];

  if (!v6)
  {
    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    BOOL v7 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22C7FF000, v7, OS_LOG_TYPE_DEFAULT, "Interruption Ended, Reactivating AVAudioSession...", v8, 2u);
    }
    [(TVLListenEngine *)self _setupAndStartAudioSessionWithError:0];
  }
}

- (BOOL)_setupAndStartAudioSessionWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v4 = [MEMORY[0x263EF93E0] sharedInstance];
  int v5 = [v4 setCategory:*MEMORY[0x263EF9050] mode:*MEMORY[0x263EF9128] options:2 error:a3];

  if (v5
    && ([MEMORY[0x263EF93E0] sharedInstance],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 setPreferredIOBufferDuration:a3 error:0.005],
        v6,
        v7))
  {
    id v8 = [MEMORY[0x263EF93E0] sharedInstance];
    int v9 = [v8 setActive:1 error:a3];
  }
  else
  {
    int v9 = 0;
  }
  int v10 = [MEMORY[0x263EF93E0] sharedInstance];
  [v10 setAllowAllBuiltInDataSources:1];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  uint64_t v11 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v12 = [v11 availableInputs];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke;
  v24[3] = &unk_26491ED20;
  v24[4] = &v25;
  [v12 enumerateObjectsUsingBlock:v24];

  v13 = (void *)v26[5];
  if (v13)
  {
    if (v9)
    {
      id v14 = [MEMORY[0x263EF93E0] sharedInstance];
      int v9 = [v14 setPreferredInput:v26[5] error:a3];

      v13 = (void *)v26[5];
    }
    id v15 = [v13 dataSources];
    objc_super v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_6];
    v17 = [v16 lastObject];

    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    v18 = (id)_TVLLogDefault_log_6;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v17 description];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_22C7FF000, v18, OS_LOG_TYPE_DEFAULT, "Selected Built-In Mic: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    if (v17)
    {
      if (v9) {
        LOBYTE(v9) = [(id)v26[5] setPreferredDataSource:v17 error:a3];
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__0;
      v34 = __Block_byref_object_dispose__0;
      id v35 = 0;
      v20 = [v17 supportedPolarPatterns];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_8;
      v23[3] = &unk_26491ED68;
      v23[4] = &buf;
      [v20 enumerateObjectsUsingBlock:v23];

      uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
      if (v21) {
        [v17 setPreferredPolarPattern:v21 error:a3];
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  _Block_object_dispose(&v25, 8);

  return v9;
}

void __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v7 = [v9 portType];
  int v8 = [v7 isEqualToString:*MEMORY[0x263EF91E0]];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 orientation];
  uint64_t v6 = [v4 orientation];

  unint64_t v7 = PriorityOfAVAudioSessionOrientation(v5);
  unint64_t v8 = PriorityOfAVAudioSessionOrientation(v6);
  if (v7 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 > v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

void __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqualToString:*MEMORY[0x263EF91A0]])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)_setupAndStartAudioEngineGraphWithTimeout:(double)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  unint64_t v8 = (void *)MEMORY[0x263EF9438];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __67__TVLListenEngine__setupAndStartAudioEngineGraphWithTimeout_error___block_invoke;
  v46[3] = &unk_26491ED90;
  v46[4] = self;
  v48 = &v49;
  uint64_t v9 = v7;
  v47 = v9;
  *(_OWORD *)long long buf = *(_OWORD *)"xmuaxmcmlppa";
  int v56 = 0;
  [v8 instantiateWithComponentDescription:buf options:0 completionHandler:v46];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_wait(v9, v10);
  *a4 = (id) v50[5];
  uint64_t v11 = [(TVLListenEngine *)self mixer];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EF9360]);
    [(TVLListenEngine *)self setAudioEngine:v12];

    v13 = [(TVLListenEngine *)self audioEngine];
    id v14 = [v13 inputNode];
    [(TVLListenEngine *)self setMicrophone:v14];

    id v15 = [(TVLListenEngine *)self microphone];
    objc_super v16 = [v15 inputFormatForBus:0];
    [v16 sampleRate];
    if (v17 <= 0.0)
    {
    }
    else
    {
      v18 = [(TVLListenEngine *)self microphone];
      v19 = [v18 inputFormatForBus:0];
      BOOL v20 = [v19 channelCount] == 0;

      if (!v20)
      {
        id v21 = objc_alloc_init(MEMORY[0x263EF93C8]);
        [(TVLListenEngine *)self setPlayer:v21];

        v22 = [(TVLListenEngine *)self audioEngine];
        v23 = [(TVLListenEngine *)self player];
        [v22 attachNode:v23];

        v24 = [(TVLListenEngine *)self audioEngine];
        uint64_t v25 = [(TVLListenEngine *)self mixer];
        [v24 attachNode:v25];

        id v26 = objc_alloc(MEMORY[0x263EF9388]);
        uint64_t v27 = [MEMORY[0x263EF93E0] sharedInstance];
        [v27 sampleRate];
        v28 = objc_msgSend(v26, "initStandardFormatWithSampleRate:channels:", 2);

        v29 = [(TVLListenEngine *)self audioEngine];
        id v30 = [(TVLListenEngine *)self microphone];
        v31 = [(TVLListenEngine *)self mixer];
        [v29 connect:v30 to:v31 fromBus:0 toBus:1 format:v28];

        uint64_t v32 = [(TVLListenEngine *)self audioEngine];
        v33 = [(TVLListenEngine *)self player];
        v34 = [(TVLListenEngine *)self mixer];
        [v32 connect:v33 to:v34 fromBus:0 toBus:0 format:v28];

        id v35 = [(TVLListenEngine *)self audioEngine];
        uint64_t v36 = [(TVLListenEngine *)self mixer];
        v37 = [(TVLListenEngine *)self audioEngine];
        v38 = [v37 mainMixerNode];
        [v35 connect:v36 to:v38 format:v28];

        v39 = [(TVLListenEngine *)self audioEngine];
        v40 = [v39 mainMixerNode];
        [v40 setOutputVolume:0.0];

        [(TVLListenEngine *)self _splitMicrophoneAndReferenceToneChannels];
        v41 = [(TVLListenEngine *)self audioEngine];
        char v42 = [v41 startAndReturnError:a4];

LABEL_12:
        goto LABEL_13;
      }
    }
    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    v28 = (id)_TVLLogDefault_log_6;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v43 = [(TVLListenEngine *)self microphone];
      v44 = [v43 inputFormatForBus:0];
      [(TVLListenEngine *)v44 _setupAndStartAudioEngineGraphWithTimeout:v28 error:v43];
    }
    char v42 = 0;
    goto LABEL_12;
  }
  char v42 = 0;
LABEL_13:

  _Block_object_dispose(&v49, 8);
  return v42;
}

void __67__TVLListenEngine__setupAndStartAudioEngineGraphWithTimeout_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setMixer:a2];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_splitMicrophoneAndReferenceToneChannels
{
  id v3 = [(TVLListenEngine *)self mixer];
  id v4 = [v3 inputFormatForBus:0];
  int v5 = [v4 channelCount];

  switch(v5)
  {
    case 3:
      uint64_t v6 = [(TVLListenEngine *)self mixer];
      id v7 = (OpaqueAudioComponentInstance *)[v6 audioUnit];
      id v8 = &SURROUND_TO_STEREO_LEFT;
      UInt32 v9 = 24;
      break;
    case 2:
      uint64_t v6 = [(TVLListenEngine *)self mixer];
      id v7 = (OpaqueAudioComponentInstance *)[v6 audioUnit];
      id v8 = &STEREO_TO_STEREO_LEFT;
      UInt32 v9 = 16;
      break;
    case 1:
      uint64_t v6 = [(TVLListenEngine *)self mixer];
      id v7 = (OpaqueAudioComponentInstance *)[v6 audioUnit];
      id v8 = &MONO_TO_STEREO_LEFT;
      UInt32 v9 = 8;
      break;
    default:
      goto LABEL_8;
  }
  AudioUnitSetProperty(v7, 0xBBEu, 1u, 0, v8, v9);

LABEL_8:
  dispatch_time_t v10 = [(TVLListenEngine *)self mixer];
  uint64_t v11 = [v10 inputFormatForBus:1];
  int v12 = [v11 channelCount];

  switch(v12)
  {
    case 3:
      id v16 = [(TVLListenEngine *)self mixer];
      v13 = (OpaqueAudioComponentInstance *)[v16 audioUnit];
      id v14 = &SURROUND_TO_STEREO_RIGHT;
      UInt32 v15 = 24;
      break;
    case 2:
      id v16 = [(TVLListenEngine *)self mixer];
      v13 = (OpaqueAudioComponentInstance *)[v16 audioUnit];
      id v14 = &STEREO_TO_STEREO_RIGHT;
      UInt32 v15 = 16;
      break;
    case 1:
      id v16 = [(TVLListenEngine *)self mixer];
      v13 = (OpaqueAudioComponentInstance *)[v16 audioUnit];
      id v14 = &MONO_TO_STEREO_RIGHT;
      UInt32 v15 = 8;
      break;
    default:
      return;
  }
  AudioUnitSetProperty(v13, 0xBBEu, 1u, 1u, v14, v15);
}

- (BOOL)startListeningWithReferenceTone:(id)a3 at:(unint64_t)a4 saveToFile:(id)a5 withCallback:(id)a6 completion:(id)a7
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v60 = a3;
  id v59 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(TVLListenEngine *)self audioEngine];
  id v68 = 0;
  char v15 = [v14 startAndReturnError:&v68];
  id v16 = v68;

  if (v15)
  {
    double v17 = [MEMORY[0x263EF93E0] sharedInstance];
    [v17 IOBufferDuration];
    double v19 = v18;

    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    BOOL v20 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v70 = v19;
      _os_log_impl(&dword_22C7FF000, v20, OS_LOG_TYPE_DEFAULT, "IOBufferDuration: %f", buf, 0xCu);
    }
    id v21 = [MEMORY[0x263EF93E0] sharedInstance];
    [v21 inputSafetyOffset];
    double v23 = v22;

    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    v24 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v70 = v23;
      _os_log_impl(&dword_22C7FF000, v24, OS_LOG_TYPE_DEFAULT, "Input Safety Offset: %f", buf, 0xCu);
    }
    uint64_t v25 = [MEMORY[0x263EF93E0] sharedInstance];
    [v25 outputSafetyOffset];
    double v27 = v26;

    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    v28 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v70 = v27;
      _os_log_impl(&dword_22C7FF000, v28, OS_LOG_TYPE_DEFAULT, "Output Safety Offset: %f", buf, 0xCu);
    }
    double v29 = v23 + v19 * 2.0;
    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    double v30 = v29 + v27;
    v31 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v70 = v30;
      _os_log_impl(&dword_22C7FF000, v31, OS_LOG_TYPE_DEFAULT, "Adjusted Offset: %f", buf, 0xCu);
    }
    dispatch_time_t v58 = dispatch_time(a4, (uint64_t)(v30 * 1000000000.0));
    [(TVLListenEngine *)self setCallback:v12];
    [(TVLListenEngine *)self setCompletion:v13];
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(TVLListenEngine *)self setConfidentResults:v32];

    [(TVLListenEngine *)self setConvergenceLossCount:0];
    [(TVLListenEngine *)self setFirstObservationDate:0];
    [(TVLListenEngine *)self setTimeToConverge:INFINITY];
    [(TVLListenEngine *)self setLastObservationWasConfident:0];
    id v33 = objc_alloc(MEMORY[0x263F179B8]);
    v34 = [(TVLListenEngine *)self mixer];
    id v35 = [v34 outputFormatForBus:0];
    uint64_t v36 = (void *)[v33 initWithFormat:v35];
    [(TVLListenEngine *)self setStreamAnalyzer:v36];

    id v37 = objc_alloc_init(MEMORY[0x263F17A10]);
    [(TVLListenEngine *)self setEstimateAudioOffsetRequest:v37];

    v38 = [(TVLListenEngine *)self streamAnalyzer];
    v39 = [(TVLListenEngine *)self estimateAudioOffsetRequest];
    id v67 = v16;
    [v38 addRequest:v39 withObserver:self error:&v67];
    id v40 = v67;

    if (v40)
    {
      if (_TVLLogDefault_onceToken_6 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
      }
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
        -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:]();
      }
      BOOL v41 = 0;
      id v16 = v40;
    }
    else
    {
      if (v59)
      {
        id v42 = objc_alloc(MEMORY[0x263EF9380]);
        v43 = [(TVLListenEngine *)self mixer];
        v44 = [v43 outputFormatForBus:0];
        v45 = [v44 settings];
        id v66 = 0;
        v46 = (void *)[v42 initForWriting:v59 settings:v45 error:&v66];
        id v16 = v66;
        [(TVLListenEngine *)self setFile:v46];

        if (v16)
        {
          if (_TVLLogDefault_onceToken_6 != -1) {
            dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
          }
          if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
            -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:]();
          }
        }
      }
      else
      {
        id v16 = 0;
      }
      v47 = [(TVLListenEngine *)self mixer];
      [v47 removeTapOnBus:0];

      objc_initWeak(&location, self);
      v48 = [(TVLListenEngine *)self mixer];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke;
      v63[3] = &unk_26491EDE0;
      objc_copyWeak(&v64, &location);
      [v48 installTapOnBus:0 bufferSize:64 format:0 block:v63];

      self->_didMissDeadline = 0;
      dispatch_time_t v49 = dispatch_time(0, 0);
      if (_TVLLogDefault_onceToken_6 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
      }
      v50 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        double v70 = *(double *)&v49;
        _os_log_impl(&dword_22C7FF000, v50, OS_LOG_TYPE_DEFAULT, "NOW: %llu", buf, 0xCu);
      }
      if (_TVLLogDefault_onceToken_6 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
      }
      uint64_t v51 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        double v70 = *(double *)&v58;
        _os_log_impl(&dword_22C7FF000, v51, OS_LOG_TYPE_DEFAULT, "SCHEDULED TIME: %llu", buf, 0xCu);
      }
      if (v49 >= v58)
      {
        if (_TVLLogDefault_onceToken_6 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
        }
        v52 = _TVLLogDefault_log_6;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
          -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:](v52);
        }
        self->_didMissDeadline = 1;
      }
      v53 = [(TVLListenEngine *)self player];
      id v54 = [MEMORY[0x263EF9430] timeWithHostTime:v58];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_22;
      v61[3] = &unk_26491EE08;
      objc_copyWeak(&v62, &location);
      [v53 scheduleFile:v60 atTime:v54 completionCallbackType:2 completionHandler:v61];

      v55 = [(TVLListenEngine *)self player];
      objc_msgSend(v55, "prepareWithFrameCount:", objc_msgSend(v60, "length"));

      int v56 = [(TVLListenEngine *)self player];
      [v56 play];

      objc_destroyWeak(&v62);
      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
      BOOL v41 = 1;
    }
  }
  else
  {
    if (_TVLLogDefault_onceToken_6 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
    }
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
      -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:].cold.4();
    }
    (*((void (**)(id, void, void, double))v13 + 2))(v13, 0, 0, 0.0);
    BOOL v41 = 0;
  }

  return v41;
}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    UInt32 v9 = [WeakRetained analysisQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_2;
    block[3] = &unk_26491EDB8;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) file];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) file];
    [v3 writeFromBuffer:*(void *)(a1 + 40) error:0];
  }
  id v4 = [*(id *)(a1 + 32) streamAnalyzer];
  objc_msgSend(v4, "analyzeAudioBuffer:atAudioFramePosition:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "sampleTime"));
}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [WeakRetained mixer];
    [v2 removeTapOnBus:0];

    id v3 = [v8 player];
    [v3 pause];

    id v4 = [v8 audioEngine];
    [v4 pause];

    id v5 = [v8 streamAnalyzer];
    id v6 = [v8 estimateAudioOffsetRequest];
    [v5 removeRequest:v6];

    [v8 setEstimateAudioOffsetRequest:0];
    id v7 = [v8 streamAnalyzer];
    [v7 completeAnalysis];

    [v8 completeAnalysis];
    [v8 setConfidentResults:0];
    id WeakRetained = v8;
  }
}

- (void)completeAnalysis
{
  v24[4] = *MEMORY[0x263EF8340];
  id v3 = [(TVLListenEngine *)self confidentResults];
  if (![v3 count])
  {

    goto LABEL_5;
  }
  BOOL didMissDeadline = self->_didMissDeadline;

  if (didMissDeadline)
  {
LABEL_5:
    uint64_t v21 = 0;
    BOOL v20 = 0;
    double v8 = 0.0;
    goto LABEL_6;
  }
  id v5 = [(TVLListenEngine *)self confidentResults];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  [(TVLListenEngine *)self medianOfSortedArray:v6];
  double v8 = v7;
  UInt32 v9 = [v6 firstObject];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [v6 lastObject];
  [v12 doubleValue];
  double v14 = v13;

  v23[0] = @"LATENCY_LOW";
  char v15 = [NSNumber numberWithDouble:v11];
  v24[0] = v15;
  v23[1] = @"LATENCY_HIGH";
  id v16 = [NSNumber numberWithDouble:v14];
  v24[1] = v16;
  v23[2] = @"CONVERGENCE_TIME";
  double v17 = NSNumber;
  [(TVLListenEngine *)self timeToConverge];
  double v18 = objc_msgSend(v17, "numberWithDouble:");
  v24[2] = v18;
  v23[3] = @"CONVERGENCE_LOSS_COUNT";
  double v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVLListenEngine convergenceLossCount](self, "convergenceLossCount"));
  v24[3] = v19;
  BOOL v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  uint64_t v21 = 1;
LABEL_6:
  double v22 = [(TVLListenEngine *)self completion];
  ((void (**)(void, uint64_t, void *, double))v22)[2](v22, v21, v20, v8);
}

- (double)medianOfSortedArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = v4;
    if (v4 == 1)
    {
      id v6 = [v3 firstObject];
LABEL_8:
      char v15 = v6;
      [v6 doubleValue];
      double v7 = v16;

      goto LABEL_9;
    }
    unint64_t v8 = (unint64_t)(v4 - 1) >> 1;
    if (v4)
    {
      id v6 = [v3 objectAtIndex:v8];
      goto LABEL_8;
    }
    UInt32 v9 = [v3 objectAtIndex:(unint64_t)(double)v8];
    [v9 doubleValue];
    double v11 = v10;

    id v12 = [v3 objectAtIndex:v5 >> 1];
    [v12 doubleValue];
    double v14 = v13;

    double v7 = (v11 + v14) * 0.5;
  }
  else
  {
    double v7 = 0.0;
  }
LABEL_9:

  return v7;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v20 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(TVLListenEngine *)self firstObservationDate];

    if (!v5)
    {
      id v6 = [MEMORY[0x263EFF910] date];
      [(TVLListenEngine *)self setFirstObservationDate:v6];
    }
    id v7 = v20;
    [v7 offset];
    double v9 = v8 / 1000.0 - *(double *)&_inputLatency;
    double v10 = [(TVLListenEngine *)self callback];
    [v7 confidence];
    float v12 = v11;
    v10[2](v10, v9, v12);

    [v7 confidence];
    double v14 = v13;
    if (v13 == 1.0)
    {
      char v15 = [(TVLListenEngine *)self confidentResults];
      double v16 = [NSNumber numberWithDouble:v9];
      [v15 addObject:v16];

      [(TVLListenEngine *)self timeToConverge];
      if (v17 >= INFINITY)
      {
        double v18 = [MEMORY[0x263EFF910] date];
        double v19 = [(TVLListenEngine *)self firstObservationDate];
        [v18 timeIntervalSinceDate:v19];
        -[TVLListenEngine setTimeToConverge:](self, "setTimeToConverge:");
      }
    }
    else
    {
      if (![(TVLListenEngine *)self lastObservationWasConfident])
      {
LABEL_10:

        goto LABEL_11;
      }
      [(TVLListenEngine *)self setConvergenceLossCount:[(TVLListenEngine *)self convergenceLossCount] + 1];
    }
    [(TVLListenEngine *)self setLastObservationWasConfident:v14 == 1.0];
    goto LABEL_10;
  }
LABEL_11:

  MEMORY[0x270F9A758]();
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_TVLLogDefault_onceToken_6 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
  }
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR)) {
    -[TVLListenEngine request:didFailWithError:]();
  }
  double v8 = [(TVLListenEngine *)self completion];
  v8[2](v8, 0, 0, 0.0);

  [(TVLListenEngine *)self invalidate];
}

- (void)requestDidComplete:(id)a3
{
  id v3 = a3;
  if (_TVLLogDefault_onceToken_6 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_214);
  }
  uint64_t v4 = _TVLLogDefault_log_6;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_22C7FF000, v4, OS_LOG_TYPE_DEFAULT, "SoundAnalysis Did Complete!", v5, 2u);
  }
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
}

- (AVAudioInputNode)microphone
{
  return self->_microphone;
}

- (void)setMicrophone:(id)a3
{
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioUnit)mixer
{
  return self->_mixer;
}

- (void)setMixer:(id)a3
{
}

- (SNEstimateAudioOffsetRequest)estimateAudioOffsetRequest
{
  return self->_estimateAudioOffsetRequest;
}

- (void)setEstimateAudioOffsetRequest:(id)a3
{
}

- (SNAudioStreamAnalyzer)streamAnalyzer
{
  return self->_streamAnalyzer;
}

- (void)setStreamAnalyzer:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (AVAudioFile)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (NSMutableArray)confidentResults
{
  return self->_confidentResults;
}

- (void)setConfidentResults:(id)a3
{
}

- (int64_t)convergenceLossCount
{
  return self->_convergenceLossCount;
}

- (void)setConvergenceLossCount:(int64_t)a3
{
  self->_convergenceLossCount = a3;
}

- (NSDate)firstObservationDate
{
  return self->_firstObservationDate;
}

- (void)setFirstObservationDate:(id)a3
{
}

- (double)timeToConverge
{
  return self->_timeToConverge;
}

- (void)setTimeToConverge:(double)a3
{
  self->_timeToConverge = a3;
}

- (BOOL)lastObservationWasConfident
{
  return self->_lastObservationWasConfident;
}

- (void)setLastObservationWasConfident:(BOOL)a3
{
  self->_lastObservationWasConfident = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
}

- (BOOL)didMissDeadline
{
  return self->_didMissDeadline;
}

- (void)setDidMissDeadline:(BOOL)a3
{
  self->_BOOL didMissDeadline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_firstObservationDate, 0);
  objc_storeStrong((id *)&self->_confidentResults, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
  objc_storeStrong((id *)&self->_estimateAudioOffsetRequest, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_microphone, 0);

  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22C7FF000, v0, v1, "Unable to create Listen Engine: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupAndStartAudioEngineGraphWithTimeout:(os_log_t)log error:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22C7FF000, log, OS_LOG_TYPE_ERROR, "Microphone has an invalid input format! %{public}@", buf, 0xCu);
}

- (void)startListeningWithReferenceTone:(os_log_t)log at:saveToFile:withCallback:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22C7FF000, log, OS_LOG_TYPE_ERROR, "DEADLINE MISS: Calibration will be incorrect.", v1, 2u);
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22C7FF000, v0, v1, "Creating AVAudioFile reported an error %@", v2, v3, v4, v5, v6);
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22C7FF000, v0, v1, "An error occurred while setting up the stream analyzer %{public}@", v2, v3, v4, v5, v6);
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22C7FF000, v0, v1, "Audio Engine did not start err=%{public}@", v2, v3, v4, v5, v6);
}

- (void)request:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22C7FF000, v0, v1, "SoundAnalysis Failed. Error=%{public}@", v2, v3, v4, v5, v6);
}

@end