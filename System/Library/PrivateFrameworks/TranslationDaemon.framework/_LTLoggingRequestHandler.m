@interface _LTLoggingRequestHandler
- (FTBlazarService)mtAppService;
- (id)combineFeedbackCategory:(int64_t)a3 andErrors:(id)a4;
- (void)startLoggingRequest:(id)a3;
- (void)startSafariFeedbackRequest:(id)a3;
- (void)startSafariLatencyLoggingRequest:(id)a3;
- (void)startSpeechLIDRequest:(id)a3;
- (void)startSpeechSensesLoggingRequest:(id)a3;
- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3;
- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3;
- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3;
- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3;
@end

@implementation _LTLoggingRequestHandler

- (FTBlazarService)mtAppService
{
  mtAppService = self->_mtAppService;
  if (!mtAppService)
  {
    v4 = +[_LTOnlineTranslationEngine blazarServiceWithBundleID:@"com.apple.Translate"];
    v5 = self->_mtAppService;
    self->_mtAppService = v4;

    mtAppService = self->_mtAppService;
  }
  return mtAppService;
}

- (void)startLoggingRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_LTLoggingRequestHandler *)self startSpeechLIDRequest:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_LTLoggingRequestHandler *)self startSpeechSensesLoggingRequest:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(_LTLoggingRequestHandler *)self startSafariLatencyLoggingRequest:v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(_LTLoggingRequestHandler *)self startSafariFeedbackRequest:v4];
        }
      }
    }
  }
}

- (void)startSpeechLIDRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v43 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Start Speech LID logging request", buf, 2u);
  }
  v6 = [(_LTLoggingRequestHandler *)self mtAppService];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __50___LTLoggingRequestHandler_startSpeechLIDRequest___block_invoke_2;
  v48[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v48[4] = a2;
  v42 = [v6 performSpeechTranslationWithDelegate:self requestBuilder:&__block_literal_global_17 completion:v48];

  v7 = objc_alloc_init(FTMutableTranslationLocalePair);
  v8 = [v43 targetLocale];
  v9 = [v8 localeIdentifier];
  [(FTMutableTranslationLocalePair *)v7 setTarget_locale:v9];

  v10 = [v43 localePair];
  v11 = [v43 targetLocale];
  v12 = [v10 oppositeToLocale:v11];
  v13 = [v12 localeIdentifier];
  v41 = v7;
  [(FTMutableTranslationLocalePair *)v7 setSource_locale:v13];

  v14 = objc_alloc_init(FTMutableLanguageDetected);
  v15 = [v43 lidResult];
  v16 = [v15 dominantLanguage];
  v17 = [v16 localeIdentifier];
  v40 = v14;
  [(FTMutableLanguageDetected *)v14 setDetected_locale:v17];

  v18 = [v43 lidResult];
  v19 = [v18 confidences];

  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v21 = [v43 localePair];
  v50[0] = v21;
  v22 = [v43 localePair];
  v23 = [v22 reversedPair];
  v50[1] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v44 + 1) + 8 * v28) sourceLocale];
        v30 = [v19 objectForKeyedSubscript:v29];
        if (v30)
        {
          v31 = objc_alloc_init(FTMutableLanguageDetectionPrediction);
          v32 = [v29 localeIdentifier];
          [(FTMutableLanguageDetectionPrediction *)v31 setLocale:v32];

          [v30 floatValue];
          -[FTMutableLanguageDetectionPrediction setConfidence:](v31, "setConfidence:");
          v33 = [v43 lidResult];
          -[FTMutableLanguageDetectionPrediction setIs_low_confidence:](v31, "setIs_low_confidence:", [v33 isConfident] ^ 1);

          [v20 addObject:v31];
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v26);
  }

  [(FTMutableLanguageDetected *)v40 setPredictions:v20];
  v34 = objc_alloc_init(FTMutableStartSpeechTranslationLoggingRequest);
  v35 = [v43 conversationID];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v34 setConversation_id:v35];

  v36 = [v43 requestID];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v34 setRequest_id:v36];

  v37 = [v43 selectedLocale];
  v38 = [v37 localeIdentifier];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v34 setUser_selected_locale:v38];

  [(FTMutableStartSpeechTranslationLoggingRequest *)v34 setDetected_locale:v40];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v34 setTranslation_locale_pair:v41];
  v39 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  [(FTMutableSpeechTranslationStreamingRequest *)v39 setContentAsFTStartSpeechTranslationLoggingRequest:v34];
  [v42 sendSpeechTranslationStreamingRequest:v39];
  [v42 closeStream];
}

- (void)startSpeechSensesLoggingRequest:(id)a3
{
  id v5 = a3;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Start speech senses logging request", buf, 2u);
  }
  v7 = [(_LTLoggingRequestHandler *)self mtAppService];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60___LTLoggingRequestHandler_startSpeechSensesLoggingRequest___block_invoke_2;
  v19[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v19[4] = a2;
  v8 = [v7 performSpeechTranslationWithDelegate:self requestBuilder:&__block_literal_global_14 completion:v19];

  v9 = objc_alloc_init(FTMutableStartSpeechTranslationLoggingRequest);
  v10 = [v5 conversationID];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v9 setConversation_id:v10];

  v11 = [v5 requestID];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v9 setRequest_id:v11];

  v12 = [v5 senses];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v9 setSenses:v12];

  v13 = [v5 userInteractedSenses];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v5 userInteractedSenses];
    [v15 lastObject];
  }
  else
  {
    v15 = [v5 senses];
    [v15 objectAtIndexedSubscript:0];
  v16 = };
  [(FTMutableStartSpeechTranslationLoggingRequest *)v9 setUser_selected_sense:v16];

  v17 = [v5 userInteractedSenses];
  [(FTMutableStartSpeechTranslationLoggingRequest *)v9 setUser_interacted_senses:v17];

  v18 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  [(FTMutableSpeechTranslationStreamingRequest *)v18 setContentAsFTStartSpeechTranslationLoggingRequest:v9];
  [v8 sendSpeechTranslationStreamingRequest:v18];
  [v8 closeStream];
}

- (void)startSafariLatencyLoggingRequest:(id)a3
{
  id v3 = a3;
  id v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Start Safari latency logging request", buf, 2u);
  }
  v6 = v3;
  id v5 = v3;
  AnalyticsSendEventLazy();
}

- (void)startSafariFeedbackRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Start Safari feedback request", buf, 2u);
  }
  v7 = [(_LTLoggingRequestHandler *)self mtAppService];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55___LTLoggingRequestHandler_startSafariFeedbackRequest___block_invoke_2;
  v31[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v31[4] = a2;
  v8 = [v7 performBatchTranslationWithDelegate:self requestBuilder:&__block_literal_global_18 completion:v31];

  v9 = objc_alloc_init(FTMutableBatchTranslationFeedbackRequest);
  v10 = [v5 sourceContentAsJSON];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setSource_content:v10];

  v11 = [v5 targetContentAsJSON];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setTranslated_content:v11];

  v12 = [v5 webpageURL];
  v13 = [v12 absoluteString];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setUrl:v13];

  uint64_t v14 = [v5 category];
  v15 = [v5 errorsAsJSON];
  v16 = [(_LTLoggingRequestHandler *)self combineFeedbackCategory:v14 andErrors:v15];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setErrors:v16];

  v17 = [v5 sessionID];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setSession_id:v17];

  v18 = [v5 localePair];
  v19 = [v18 sourceLocale];
  id v20 = [v19 localeIdentifier];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setSource_language:v20];

  v21 = [v5 localePair];
  v22 = [v21 targetLocale];
  v23 = [v22 localeIdentifier];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setTarget_language:v23];

  v24 = [v5 safariVersion];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setSafari_version:v24];

  uint64_t v25 = [v5 clientBundleID];

  [(FTMutableBatchTranslationFeedbackRequest *)v9 setApp_id:v25];
  uint64_t v26 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v27 = [v26 operatingSystemVersionString];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setOs_version:v27];

  size_t v30 = 4096;
  sysctlbyname("hw.machine", buf, &v30, 0, 0);
  uint64_t v28 = [NSString stringWithUTF8String:buf];
  [(FTMutableBatchTranslationFeedbackRequest *)v9 setDevice_type:v28];

  v29 = objc_alloc_init(FTMutableBatchTranslationStreamingRequest);
  [(FTMutableBatchTranslationStreamingRequest *)v29 setContentAsFTBatchTranslationFeedbackRequest:v9];
  [v8 sendBatchTranslationStreamingRequest:v29];
  [v8 closeStream];
}

- (id)combineFeedbackCategory:(int64_t)a3 andErrors:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = [v4 dataUsingEncoding:4];
  id v18 = 0;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v18];
  id v7 = v18;
  if (v7)
  {
    id v8 = v7;
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTLoggingRequestHandler combineFeedbackCategory:andErrors:]();
    }
    id v10 = v4;
  }
  else
  {
    v11 = _LTFeedbackCategoryString();
    v19[0] = @"category";
    v19[1] = @"errors";
    v20[0] = v11;
    v20[1] = v6;
    v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v17 = 0;
    v13 = [MEMORY[0x263F08900] dataWithJSONObject:v12 options:0 error:&v17];
    id v8 = v17;
    if (v8)
    {
      uint64_t v14 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_LTLoggingRequestHandler combineFeedbackCategory:andErrors:]();
      }
      id v15 = v4;
    }
    else
    {
      id v15 = (id)[[NSString alloc] initWithData:v13 encoding:4];
    }
    id v10 = v15;
  }
  return v10;
}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend(v3, "content_type") == 6)
  {
    id v4 = [v3 contentAsFTFinalBlazarResponse];
    id v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      int v7 = objc_msgSend(v4, "return_code");
      id v8 = objc_msgSend(v4, "return_str");
      v10[0] = 67109378;
      v10[1] = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Received speech logging request response: [%d] %@", (uint8_t *)v10, 0x12u);
    }
  }
  else
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTLoggingRequestHandler streamDidReceiveSpeechTranslationStreamingResponse:]();
    }
  }
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_LTLoggingRequestHandler streamFailVerifySpeechTranslationStreamingResponse:]();
  }
  v6 = NSStringFromSelector(a2);
  _LTSendErrorEvent(v4, v6);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend(v3, "content_type") == 2)
  {
    id v4 = [v3 contentAsFTFinalBlazarResponse];
    id v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      int v7 = objc_msgSend(v4, "return_code");
      id v8 = objc_msgSend(v4, "return_str");
      v10[0] = 67109378;
      v10[1] = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Received safari feedback request response: [%d] %@", (uint8_t *)v10, 0x12u);
    }
  }
  else
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTLoggingRequestHandler streamDidReceiveBatchTranslationStreamingResponse:]();
    }
  }
}

- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_LTLoggingRequestHandler streamFailVerifyBatchTranslationStreamingResponse:]();
  }
  v6 = NSStringFromSelector(a2);
  _LTSendErrorEvent(v4, v6);
}

- (void).cxx_destruct
{
}

- (void)combineFeedbackCategory:andErrors:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to serialize dictionary with combined errors and category for Safari feedback into JSON: %@", v2, v3, v4, v5, v6);
}

- (void)combineFeedbackCategory:andErrors:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to de-serialize Safari error string JSON into array: %@", v2, v3, v4, v5, v6);
}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Speech logging request received unexpected response: %@", v2, v3, v4, v5, v6);
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Speech logging request received error: %@", v2, v3, v4, v5, v6);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Safari feedback request received unexpected response: %@", v2, v3, v4, v5, v6);
}

- (void)streamFailVerifyBatchTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Safari feedback request received error: %@", v2, v3, v4, v5, v6);
}

@end