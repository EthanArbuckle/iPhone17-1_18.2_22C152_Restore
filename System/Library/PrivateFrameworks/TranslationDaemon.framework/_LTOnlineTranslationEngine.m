@interface _LTOnlineTranslationEngine
+ (id)blazarServiceWithBundleID:(id)a3;
+ (void)initialize;
- (BOOL)_hasOngoingSpeechSession;
- (BOOL)translatesPair:(id)a3;
- (OS_dispatch_queue)serverQueue;
- (_LTOnlineTranslationEngine)initWithSelfLoggingManager:(id)a3;
- (_LTTextToSpeechCache)ttsCache;
- (id)_blazarService;
- (id)_serviceForTask:(int64_t)a3;
- (id)_siriService;
- (id)_systemService;
- (id)_tokenizeString:(id)a3 inLocale:(id)a4;
- (id)_webTaskService;
- (void)_createOrUpdateBatchTranslationRequestWithParagraph:(id)a3 index:(int64_t)a4 context:(id)a5 completion:(id)a6;
- (void)_hasOngoingSpeechSession;
- (void)_speechSessionCompletedWithError:(id)a3;
- (void)addSpeechAudioData:(id)a3;
- (void)cancelServerTimeout;
- (void)cancelSpeechTranslation:(BOOL)a3;
- (void)endAudio;
- (void)endpoint;
- (void)sendBatchTranslationRequestWithDelegate:(id)a3;
- (void)serverTimeoutFired;
- (void)setLanguagesRecognized:(id)a3 context:(id)a4;
- (void)setServerQueue:(id)a3;
- (void)setTtsCache:(id)a3;
- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)startServerTimeoutTimer;
- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4;
- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5;
- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6;
- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)updateServerTimeout;
@end

@implementation _LTOnlineTranslationEngine

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    completionGroup = (uint64_t)dispatch_group_create();
    MEMORY[0x270F9A758]();
  }
}

- (_LTOnlineTranslationEngine)initWithSelfLoggingManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTOnlineTranslationEngine;
  v6 = [(_LTOnlineTranslationEngine *)&v13 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.translation.online-queue", 0);
    translationQueue = v6->_translationQueue;
    v6->_translationQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.translation.server-timer", 0);
    timerQueue = v6->_timerQueue;
    v6->_timerQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_selfLoggingManager, a3);
    v11 = v6;
  }

  return v6;
}

+ (id)blazarServiceWithBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v3);
  objc_msgSend(v4, "set_allowsTLSFalseStart:", 1);
  [v4 setTLSMinimumSupportedProtocolVersion:771];
  [v4 setURLCache:0];
  id v5 = _LTPreferencesOspreyEndpointURL();
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    v10 = v5;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Creating service with URL: %{public}@, bundleID: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  dispatch_queue_t v7 = [(OspreyChannel *)[FTBlazarService alloc] initWithURL:v5 configuration:v4];
  [(OspreyChannel *)v7 setUseCompression:1];

  return v7;
}

- (id)_blazarService
{
  blazarService = self->_blazarService;
  if (!blazarService)
  {
    v4 = +[_LTOnlineTranslationEngine blazarServiceWithBundleID:@"com.apple.Translate"];
    id v5 = self->_blazarService;
    self->_blazarService = v4;

    blazarService = self->_blazarService;
  }
  return blazarService;
}

- (id)_siriService
{
  siriService = self->_siriService;
  if (!siriService)
  {
    v4 = +[_LTOnlineTranslationEngine blazarServiceWithBundleID:@"com.apple.siri"];
    id v5 = self->_siriService;
    self->_siriService = v4;

    siriService = self->_siriService;
  }
  return siriService;
}

- (id)_systemService
{
  systemService = self->_systemService;
  if (!systemService)
  {
    v4 = +[_LTOnlineTranslationEngine blazarServiceWithBundleID:@"com.apple.TranslationUIServices.TranslationUIService"];
    id v5 = self->_systemService;
    self->_systemService = v4;

    systemService = self->_systemService;
  }
  return systemService;
}

- (id)_webTaskService
{
  webTaskService = self->_webTaskService;
  if (!webTaskService)
  {
    v4 = +[_LTOnlineTranslationEngine blazarServiceWithBundleID:@"com.apple.mobilesafari"];
    id v5 = self->_webTaskService;
    self->_webTaskService = v4;

    webTaskService = self->_webTaskService;
  }
  return webTaskService;
}

- (id)_serviceForTask:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v3 = [(_LTOnlineTranslationEngine *)self _webTaskService];
      break;
    case 4:
      id v3 = [(_LTOnlineTranslationEngine *)self _siriService];
      break;
    case 5:
      id v3 = [(_LTOnlineTranslationEngine *)self _systemService];
      break;
    default:
      id v3 = [(_LTOnlineTranslationEngine *)self _blazarService];
      break;
  }
  return v3;
}

- (BOOL)translatesPair:(id)a3
{
  return 0;
}

- (void)startServerTimeoutTimer
{
  objc_initWeak(&location, self);
  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53___LTOnlineTranslationEngine_startServerTimeoutTimer__block_invoke;
  v4[3] = &unk_2655477F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(timerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateServerTimeout
{
  objc_initWeak(&location, self);
  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke;
  v4[3] = &unk_2655477F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(timerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelServerTimeout
{
  id v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "cancelServerTimeout", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___LTOnlineTranslationEngine_cancelServerTimeout__block_invoke;
  block[3] = &unk_2655477F0;
  objc_copyWeak(&v6, buf);
  dispatch_async(timerQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)serverTimeoutFired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "batch timeout triggered", (uint8_t *)&v8, 2u);
  }
  if (self->batchTranslationResponseHandler)
  {
    v4 = [MEMORY[0x263EFF910] date];
    [v4 timeIntervalSinceDate:self->_startTime];
    uint64_t v6 = v5;

    dispatch_queue_t v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "serverTimeoutFired Sending batch request after %.2fs", (uint8_t *)&v8, 0xCu);
    }
    [(_LTOnlineTranslationEngine *)self sendBatchTranslationRequestWithDelegate:self->batchTranslationResponseHandler];
  }
}

- (id)_tokenizeString:(id)a3 inLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = objc_alloc_init(_LTTokenizer);
  int v8 = [(_LTTokenizer *)v7 tokenize:v5 forLocale:v6];

  return v8;
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  __int16 v11 = [(_LTOnlineTranslationEngine *)self ttsCache];
  id v12 = NSString;
  uint64_t v13 = [v9 localePair];
  v14 = [v13 targetLocale];
  v15 = [v14 localeIdentifier];
  v16 = [v12 stringWithFormat:@"%@-%@", v15, v8];

  v17 = [v11 audioDataForKey:v16];
  if (v17)
  {
    v18 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v18, OS_LOG_TYPE_INFO, "Found cached TTS data", buf, 2u);
    }
    v10[2](v10, v17, 0);
  }
  else
  {
    v19 = [v9 _ospreyTTSRequestWithText:v8];
    v20 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v25 = v19;
      v21 = [v19 language];
      v22 = [v19 gender];
      *(_DWORD *)buf = 138543618;
      v34 = v21;
      __int16 v35 = 2114;
      v36 = v22;
      _os_log_impl(&dword_2600DC000, v20, OS_LOG_TYPE_INFO, "Start TTS request: %{public}@ / %{public}@", buf, 0x16u);

      v19 = v25;
    }

    v23 = -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", [v9 taskHint]);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke;
    v31[3] = &unk_265547B68;
    id v24 = v19;
    id v32 = v24;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2;
    v26[3] = &unk_265547B90;
    v30 = v10;
    id v27 = v8;
    id v28 = v11;
    id v29 = v16;
    [v23 performTextToSpeechRouter:v24 requestBuilder:v31 completion:v26];
  }
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:(id)a3 index:(int64_t)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id, void))a6;
  uint64_t v13 = [v10 text];
  v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v15 = [v13 stringByTrimmingCharactersInSet:v14];

  if (![v15 length])
  {
    id v27 = objc_alloc_init(MEMORY[0x263F1C190]);
    [v27 setRoute:2];
    id v28 = [v10 identifier];
    [v27 setIdentifier:v28];

    [v27 setTranslations:MEMORY[0x263EFFA68]];
    v12[2](v12, v27, 0);

    goto LABEL_24;
  }
  v16 = [v11 localePair];
  v66 = [v16 sourceLocale];

  v17 = [v11 localePair];
  v65 = [v17 targetLocale];

  batchTranslationResponseHandler = self->batchTranslationResponseHandler;
  if (!batchTranslationResponseHandler) {
    goto LABEL_16;
  }
  unint64_t v64 = [(_LTBatchTranslationResponseHandler *)batchTranslationResponseHandler bufferSize];
  unint64_t v63 = _LTPreferencesBatchingMaxParagraphBufferSize();
  v19 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler batchedParagraphs];
  unint64_t v62 = [v19 count];
  unint64_t v61 = _LTPreferencesBatchingMaxParagraphs();

  v20 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler sourceLocale];
  if (![v20 isEqual:v66]) {
    goto LABEL_11;
  }
  v21 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler targetLocale];
  v60 = v12;
  if (([v21 isEqual:v65] & 1) == 0)
  {

LABEL_11:
    id v24 = v15;

    BOOL v25 = 1;
    goto LABEL_12;
  }
  int64_t v22 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler taskHint];
  uint64_t v23 = [v11 taskHint];
  id v24 = v15;
  BOOL v25 = v22 != v23;

  if (v64 >= v63 || v62 >= v61)
  {
    id v12 = v60;
  }
  else
  {
    BOOL v26 = v22 == v23;
    id v12 = v60;
    if (v26) {
      goto LABEL_15;
    }
  }
LABEL_12:
  id v29 = [MEMORY[0x263EFF910] date];
  [v29 timeIntervalSinceDate:self->_startTime];
  uint64_t v31 = v30;

  id v32 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    BOOL v70 = v64 >= v63;
    __int16 v71 = 1024;
    BOOL v72 = v62 >= v61;
    __int16 v73 = 1024;
    BOOL v74 = v25;
    __int16 v75 = 2048;
    uint64_t v76 = v31;
    _os_log_debug_impl(&dword_2600DC000, v32, OS_LOG_TYPE_DEBUG, "Sending batch request: bufferSizeExceeded: %{BOOL}i; maxParagraphsExceeded: %{BOOL}i; taskChanged: %{BOOL}i; after %.2fs",
      buf,
      0x1Eu);
  }
  [(_LTOnlineTranslationEngine *)self sendBatchTranslationRequestWithDelegate:self->batchTranslationResponseHandler];
LABEL_15:
  v15 = v24;
  if (!self->batchTranslationResponseHandler)
  {
LABEL_16:
    v33 = objc_alloc_init(_LTBatchTranslationResponseHandler);
    v34 = self->batchTranslationResponseHandler;
    self->batchTranslationResponseHandler = v33;

    __int16 v35 = NSString;
    v36 = [v11 sessionID];
    uint64_t v37 = [v35 stringWithFormat:@"%@/%08zd", v36, a4];

    v38 = objc_alloc_init(_LTBatchedParagraphsHolder);
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setBatchedParagraphs:v38];

    v39 = _LTPreferencesRequestIDOverride(v37);
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setRequestID:v39];

    v40 = [v11 sessionID];
    v41 = _LTPreferencesSessionIDOverride(v40);
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setSessionID:v41];

    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setSourceLocale:v66];
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setTargetLocale:v65];
    -[_LTBatchTranslationResponseHandler setTaskHint:](self->batchTranslationResponseHandler, "setTaskHint:", [v11 taskHint]);
    v42 = [v11 clientIdentifier];
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setClientIdentifier:v42];

    v43 = [v11 sourceURL];
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setSourceURL:v43];

    v44 = [v11 sequoiaClientHeaderValue];
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setClientHeader:v44];

    v45 = [v11 logIdentifier];
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler setLogIdentifier:v45];

    -[_LTBatchTranslationResponseHandler setSupportsGenderDisambiguation:](self->batchTranslationResponseHandler, "setSupportsGenderDisambiguation:", [v11 supportsGenderDisambiguation]);
    [v11 setSourceURL:0];
    [(_LTOnlineTranslationEngine *)self startServerTimeoutTimer];
  }
  v46 = objc_alloc_init(FTMutableBatchTranslationRequest_Paragraph);
  v47 = [v10 identifier];
  [(FTMutableBatchTranslationRequest_Paragraph *)v46 setParagraph_id:v47];

  v48 = [v10 text];
  [(FTMutableBatchTranslationRequest_Paragraph *)v46 setText:v48];

  v49 = objc_alloc_init(_FTParagraphBatchInfo);
  [(_FTParagraphBatchInfo *)v49 setParagraph:v10];
  [(_FTParagraphBatchInfo *)v49 setRequestParagraph:v46];
  [(_FTParagraphBatchInfo *)v49 setCompletion:v12];
  v50 = [v10 spans];
  BOOL v51 = [v50 count] == 0;

  if (!v51)
  {
    v52 = [v10 spans];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __107___LTOnlineTranslationEngine__createOrUpdateBatchTranslationRequestWithParagraph_index_context_completion___block_invoke;
    v67[3] = &unk_265547BB8;
    id v68 = v10;
    v53 = [v52 _ltCompactMap:v67];
    [(FTMutableBatchTranslationRequest_Paragraph *)v46 setSpan:v53];
  }
  v54 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    [(FTMutableBatchTranslationRequest_Paragraph *)v46 text];
    objc_claimAutoreleasedReturnValue();
    [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler requestID];
    objc_claimAutoreleasedReturnValue();
    -[_LTOnlineTranslationEngine _createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:]();
  }

  v55 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    [(FTMutableBatchTranslationRequest_Paragraph *)v46 span];
    objc_claimAutoreleasedReturnValue();
    -[_LTOnlineTranslationEngine _createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:]();
  }

  v56 = self->batchTranslationResponseHandler;
  v57 = [(FTMutableBatchTranslationRequest_Paragraph *)v46 text];
  -[_LTBatchTranslationResponseHandler setBufferSize:](v56, "setBufferSize:", -[_LTBatchTranslationResponseHandler bufferSize](v56, "bufferSize") + [v57 length]);

  v58 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler batchedParagraphs];
  v59 = [(FTMutableBatchTranslationRequest_Paragraph *)v46 paragraph_id];
  [v58 insertParagraph:v49 withId:v59];

LABEL_24:
}

- (void)sendBatchTranslationRequestWithDelegate:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v62 = v4;
  [(_LTOnlineTranslationEngine *)self cancelServerTimeout];
  unint64_t v63 = objc_alloc_init(FTMutableBatchTranslationRequest);
  id v5 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler requestID];
  [(FTMutableBatchTranslationRequest *)v63 setRequest_id:v5];

  [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler taskHint];
  id v6 = _LTTranslationModelTaskString();
  [(FTMutableBatchTranslationRequest *)v63 setTask:v6];

  dispatch_queue_t v7 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler clientIdentifier];
  [(FTMutableBatchTranslationRequest *)v63 setApp_id:v7];

  id v8 = [(_LTBatchTranslationResponseHandler *)self->batchTranslationResponseHandler sessionID];
  [(FTMutableBatchTranslationRequest *)v63 setSession_id:v8];

  id v9 = [v4 sourceURL];

  if (v9)
  {
    id v10 = [v4 sourceURL];
    id v11 = [v10 absoluteString];
    [(FTMutableBatchTranslationRequest *)v63 setUrl:v11];
  }
  id v12 = [v4 batchedParagraphs];
  uint64_t v13 = [v12 paragraphs];
  [(FTMutableBatchTranslationRequest *)v63 setParagraphs:v13];

  v14 = [v4 paragraph];
  -[FTMutableBatchTranslationRequest setIs_partial:](v63, "setIs_partial:", [v14 isFinal] ^ 1);

  v15 = [v4 sourceLocale];
  v16 = [v15 _ltLocaleIdentifier];
  [(FTMutableBatchTranslationRequest *)v63 setSource_language:v16];

  v17 = [v4 targetLocale];
  v18 = [v17 _ltLocaleIdentifier];
  [(FTMutableBatchTranslationRequest *)v63 setTarget_language:v18];

  v19 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v20 = [v19 siriDataSharingOptInStatus];
  if ((unint64_t)(v20 - 1) > 2) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = qword_26027B710[v20 - 1];
  }

  [(FTMutableBatchTranslationRequest *)v63 setOpt_in_status:LTDOspreyDataSharingStatus(v21)];
  v58 = objc_alloc_init(FTMutableTranslationOptions);
  -[FTMutableTranslationOptions setEnable_disambiguation_alternatives:](v58, "setEnable_disambiguation_alternatives:", [v4 supportsGenderDisambiguation]);
  [(FTMutableTranslationOptions *)v58 setDisable_payload_logging:LTDDisablePayloadLogging(v21)];
  [(FTMutableBatchTranslationRequest *)v63 setOptions:v58];
  int64_t v22 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    [(_LTOnlineTranslationEngine *)[(FTMutableTranslationOptions *)v58 enable_disambiguation_alternatives] sendBatchTranslationRequestWithDelegate:v22];
  }

  uint64_t v23 = _LTOSLogTranslationEngine();
  os_signpost_id_t v24 = os_signpost_id_generate(v23);
  BOOL v25 = v23;
  BOOL v26 = v25;
  os_signpost_id_t spid = v24;
  log = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    id v27 = [v62 requestID];
    *(_DWORD *)buf = 138543362;
    uint64_t v80 = (uint64_t)v27;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, log, OS_SIGNPOST_INTERVAL_BEGIN, v24, "TranslateParagraph", "Online: Translating paragraph: %{public}@", buf, 0xCu);

    BOOL v26 = log;
  }

  v60 = _LTPreferencesOspreyEndpointURL();
  id v28 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = [v62 requestID];
    uint64_t v30 = [(FTMutableBatchTranslationRequest *)v63 task];
    uint64_t v31 = [v62 sessionID];
    *(_DWORD *)buf = 138544130;
    uint64_t v80 = (uint64_t)v29;
    __int16 v81 = 2114;
    v82 = v30;
    __int16 v83 = 2114;
    v84 = v31;
    __int16 v85 = 2114;
    v86 = v60;
    _os_log_impl(&dword_2600DC000, v28, OS_LOG_TYPE_INFO, "Sending batch for requestID: %{public}@, task: %{public}@, sessionID: %{public}@, URL: %{public}@", buf, 0x2Au);
  }
  unint64_t v61 = objc_alloc_init(FTMutableBatchTranslationStreamingRequest);
  [(FTMutableBatchTranslationStreamingRequest *)v61 setContentAsFTBatchTranslationRequest:v63];
  [(FTMutableBatchTranslationStreamingRequest *)v61 setContent_type:1];
  [v62 setRequest:v63];
  id v32 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v54 = [v62 batchedParagraphs];
    uint64_t v55 = [v54 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v80 = v55;
    _os_log_debug_impl(&dword_2600DC000, v32, OS_LOG_TYPE_DEBUG, "Translating with online engine: %zu batched paragraph(s)", buf, 0xCu);
  }
  selfLoggingManager = self->_selfLoggingManager;
  v34 = [v62 logIdentifier];
  __int16 v35 = [v62 requestID];
  v56 = -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:](selfLoggingManager, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v34, v35, 1, 1, [v62 bufferSize]);

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v36 = [(FTMutableBatchTranslationRequest *)v63 paragraphs];
  uint64_t v37 = 0;
  uint64_t v38 = [v36 countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v75 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v42 = objc_alloc(MEMORY[0x263F086A0]);
        v43 = [v41 text];
        v44 = (void *)[v42 initWithString:v43];

        v45 = objc_msgSend(v44, "lt_sentences");
        uint64_t v46 = [v45 count];

        v37 += v46;
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v38);
  }

  v47 = -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", [v62 taskHint]);
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke;
  v71[3] = &unk_265547BE0;
  BOOL v72 = v63;
  id v73 = v62;
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_2;
  v64[3] = &unk_265547C30;
  v64[4] = self;
  v48 = log;
  v65 = v48;
  os_signpost_id_t v69 = spid;
  v49 = v72;
  v66 = v49;
  id v50 = v56;
  id v67 = v50;
  uint64_t v70 = v37;
  id v51 = v73;
  id v68 = v51;
  v52 = [v47 performBatchTranslationWithDelegate:v51 requestBuilder:v71 completion:v64];

  if (v52)
  {
    [v52 sendBatchTranslationStreamingRequest:v61];
    [v52 closeStream];
  }
  batchTranslationResponseHandler = self->batchTranslationResponseHandler;
  self->batchTranslationResponseHandler = 0;
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Start translating sentence with online engine", (uint8_t *)buf, 2u);
  }
  id v12 = +[_LTAnalyticsEvent timedEventWithName:@"OnlineTextTranslation"];
  uint64_t v13 = [v9 localePair];
  v14 = [v13 sourceLocale];
  [v12 setSourceLocale:v14];

  v15 = [v9 localePair];
  v16 = [v15 targetLocale];
  [v12 setTargetLocale:v16];

  [v12 addFieldsFromDictionary:&unk_270C337C8];
  v17 = [MEMORY[0x263F08C38] UUID];
  v18 = [v17 UUIDString];

  v19 = (void *)[objc_alloc(MEMORY[0x263F1C188]) initWithIdentifier:v18 text:v8 spans:0 isFinal:1];
  uint64_t v20 = _LTOSLogTranslationEngine();
  uint64_t v21 = (char *)os_signpost_id_generate(v20);
  int64_t v22 = v20;
  uint64_t v23 = v22;
  if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v21, "TranslateSentence", "Online: Translating sentence", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke;
  block[3] = &unk_265547C80;
  objc_copyWeak(v36, buf);
  id v31 = v19;
  id v32 = v9;
  v33 = v23;
  id v34 = v12;
  v36[1] = v21;
  id v35 = v10;
  id v25 = v10;
  id v26 = v12;
  id v27 = v23;
  id v28 = v9;
  id v29 = v19;
  dispatch_async(translationQueue, block);

  objc_destroyWeak(v36);
  objc_destroyWeak(buf);
}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v36[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    v14 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = [v10 count];
      _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Start translating %zu paragraphs with online engine", buf, 0xCu);
    }

    v15 = +[_LTAnalyticsEvent timedEventWithName:@"OnlineTextTranslation"];
    v16 = [v11 localePair];
    v17 = [v16 sourceLocale];
    [v15 setSourceLocale:v17];

    v18 = [v11 localePair];
    v19 = [v18 targetLocale];
    [v15 setTargetLocale:v19];

    objc_initWeak((id *)buf, self);
    translationQueue = self->_translationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke;
    block[3] = &unk_265547D20;
    objc_copyWeak(&v32, (id *)buf);
    id v28 = v10;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    dispatch_async(translationQueue, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_LTOnlineTranslationEngine translate:withContext:paragraphResult:completion:]();
    }
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int64_t v22 = (void *)MEMORY[0x263F087E8];
    v35[0] = *MEMORY[0x263F08320];
    uint64_t v23 = [v15 localizedStringForKey:@"GENERIC_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v36[0] = v23;
    v35[1] = *MEMORY[0x263F08338];
    os_signpost_id_t v24 = [v15 localizedStringForKey:@"INPUT_EMPTY_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v36[1] = v24;
    id v25 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    id v26 = [v22 errorWithDomain:*MEMORY[0x263F1C1D0] code:3 userInfo:v25];

    (*((void (**)(id, void *))v13 + 2))(v13, v26);
  }
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(_LTOnlineTranslationEngine *)self _hasOngoingSpeechSession])
  {
LABEL_6:
    id v13 = [MEMORY[0x263F285A0] sharedPreferences];
    unint64_t v14 = [v13 siriDataSharingOptInStatus] - 1;
    if (v14 > 2) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = qword_26027B710[v14];
    }
    [v8 setDataSharingOptInStatus:v15];

    v16 = [_LTOspreySpeechTranslationSession alloc];
    v17 = -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", [v8 taskHint]);
    v18 = [(_LTOspreySpeechTranslationSession *)v16 initWithService:v17 context:v8 text:v9 delegate:v10 selfLoggingManager:self->_selfLoggingManager];

    selfLoggingManager = self->_selfLoggingManager;
    uint64_t v20 = [v8 logIdentifier];
    uint64_t v21 = [v8 uniqueID];
    int64_t v22 = -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:](selfLoggingManager, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v20, v21, 2, 1, [v9 length]);

    objc_initWeak((id *)buf, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
    v34[3] = &unk_265547D70;
    objc_copyWeak(&v36, (id *)buf);
    id v35 = v22;
    id v23 = v22;
    [(_LTOspreySpeechTranslationSession *)v18 setCompletionBlock:v34];
    speechSession = self->_speechSession;
    self->_speechSession = v18;
    id v25 = v18;

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  if ([v8 overrideOngoingSessionIfNeeded])
  {
    id v11 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = self->_speechSession;
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = v12;
      _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Context allows overriding ongoing speech session %p; cancelling existing session and creating a new one for TTS",
        buf,
        0xCu);
    }
    [(_LTOspreySpeechTranslationSession *)self->_speechSession cancel];
    goto LABEL_6;
  }
  id v26 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[_LTOnlineTranslationEngine startTextToSpeechTranslationWithContext:text:delegate:]((uint64_t)self, v26, v27, v28, v29, v30, v31, v32);
  }
  if (objc_opt_respondsToSelector())
  {
    v33 = objc_msgSend(MEMORY[0x263F087E8], "lt_speechTranslationOngoing");
    [v10 translationDidFinishWithError:v33];
  }
LABEL_10:
}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
}

- (void)addSpeechAudioData:(id)a3
{
}

- (void)endpoint
{
}

- (void)endAudio
{
}

- (BOOL)_hasOngoingSpeechSession
{
  p_speechSession = &self->_speechSession;
  speechSession = self->_speechSession;
  if (speechSession)
  {
    BOOL v4 = [(_LTOspreySpeechTranslationSession *)speechSession isCancelled];
    if (v4)
    {
      id v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(_LTOnlineTranslationEngine *)(uint64_t)p_speechSession _hasOngoingSpeechSession];
      }
    }
    LOBYTE(speechSession) = !v4;
  }
  return (char)speechSession;
}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(_LTOnlineTranslationEngine *)self _hasOngoingSpeechSession])
  {
LABEL_6:
    uint64_t v10 = [MEMORY[0x263F285A0] sharedPreferences];
    unint64_t v11 = [v10 siriDataSharingOptInStatus] - 1;
    if (v11 > 2) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_26027B710[v11];
    }
    [v6 setDataSharingOptInStatus:v12];

    id v13 = -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", [v6 taskHint]);
    unint64_t v14 = [[_LTOspreySpeechTranslationSession alloc] initWithService:v13 context:v6 delegate:v7 selfLoggingManager:self->_selfLoggingManager];
    uint64_t v15 = [(_LTOnlineTranslationEngine *)self ttsCache];
    [(_LTOspreySpeechTranslationSession *)v14 setTtsCache:v15];

    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke;
    v24[3] = &unk_265547D98;
    objc_copyWeak(&v25, (id *)buf);
    [(_LTOspreySpeechTranslationSession *)v14 setCompletionBlock:v24];
    speechSession = self->_speechSession;
    self->_speechSession = v14;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  if ([v6 overrideOngoingSessionIfNeeded])
  {
    uint64_t v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = self->_speechSession;
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v9;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Context allows overriding ongoing speech session %p; cancelling existing session and creating a new one",
        buf,
        0xCu);
    }
    [(_LTOspreySpeechTranslationSession *)self->_speechSession cancel];
    goto LABEL_6;
  }
  v17 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[_LTOnlineTranslationEngine startSpeechTranslationWithContext:delegate:]((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = objc_msgSend(MEMORY[0x263F087E8], "lt_speechTranslationOngoing");
    [v7 translationDidFinishWithError:v13];
LABEL_10:
  }
}

- (void)_speechSessionCompletedWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  if (v4)
  {
    id v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_LTOnlineTranslationEngine _speechSessionCompletedWithError:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    uint64_t v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Completed current speech session successfully", v14, 2u);
    }
  }
  speechSession = self->_speechSession;
  self->_speechSession = 0;
}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  objc_initWeak(&location, self);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke;
  block[3] = &unk_2655477A0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(serverQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_serverTimer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->batchTranslationResponseHandler, 0);
  objc_storeStrong((id *)&self->_speechSession, 0);
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_webTaskService, 0);
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_siriService, 0);
  objc_storeStrong((id *)&self->_blazarService, 0);
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  *(_DWORD *)uint64_t v1 = 138739971;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Spans: %{sensitive}@", v4, 0xCu);
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  *(_DWORD *)uint64_t v2 = 138740227;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2114;
  *(void *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_2600DC000, v6, OS_LOG_TYPE_DEBUG, "Translating: %{sensitive}@ request_id %{public}@", v5, 0x16u);
}

- (void)sendBatchTranslationRequestWithDelegate:(os_log_t)log .cold.1(char a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1 & 1;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Disambiguation: Creating online batch request, setting option for enable_disambiguation_alternatives: %{BOOL}i", buf, 8u);
}

- (void)translate:withContext:paragraphResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to translate paragraphs because there's nothing to translate", v2, v3, v4, v5, v6);
}

- (void)startTextToSpeechTranslationWithContext:(uint64_t)a3 text:(uint64_t)a4 delegate:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_hasOngoingSpeechSession
{
    "as-if there wasn't a previous session",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)startSpeechTranslationWithContext:(uint64_t)a3 delegate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_speechSessionCompletedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end