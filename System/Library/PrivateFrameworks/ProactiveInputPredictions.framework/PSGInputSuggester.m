@interface PSGInputSuggester
+ (id)sharedInstance;
- (PSGInputSuggester)initWithClient:(id)a3;
- (void)_reportSpeedMetricWithData:(id)a3;
- (void)hibernate;
- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4;
- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 predictedValues:(id)a5;
- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 request:(id)a5 responseItems:(id)a6;
- (void)logTimeoutForRequest:(id)a3;
- (void)warmUp;
- (void)warmUpForLocaleIdentifier:(id)a3;
@end

@implementation PSGInputSuggester

- (void)hibernate
{
  id v2 = +[PSGWordBoundaryFSTGrammar sharedInstance];
  [v2 clearLMCache];
}

intptr_t __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke_8(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = psg_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_20A02A000, v2, OS_LOG_TYPE_INFO, "PSGInputSuggester serving endpoint warmed up %@", (uint8_t *)&v5, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = psg_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A02A000, v2, OS_LOG_TYPE_INFO, "PSGInputSuggester triggering endpoint warmed up", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)warmUpForLocaleIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = psg_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A02A000, v5, OS_LOG_TYPE_INFO, "PSGInputSuggester triggering endpoint warming up", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  client = self->_client;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke;
  v21[3] = &unk_263FCFC70;
  v8 = v6;
  v22 = v8;
  [(PSGInputSuggesterClient *)client warmUpWithCompletion:v21];
  v9 = [MEMORY[0x263F5D4D0] sharedInstance];
  v10 = psg_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_20A02A000, v10, OS_LOG_TYPE_INFO, "PSGInputSuggester serving endpoint warming up %@", buf, 0xCu);
  }

  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__PSGInputSuggester_warmUpForLocaleIdentifier___block_invoke_8;
  v18[3] = &unk_263FCF898;
  id v12 = v9;
  id v19 = v12;
  v13 = v11;
  v20 = v13;
  [v12 warmUpWithCompletion:v18];
  v14 = +[PSGWordBoundaryFSTGrammar sharedInstance];
  [v14 warmUpForLocaleIdentifier:v4];

  if ([MEMORY[0x263F61E38] waitForSemaphore:v8 timeoutSeconds:0.5] == 1)
  {
    v15 = psg_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v15, OS_LOG_TYPE_ERROR, "PSGInputSuggester triggering endpoint warmUp timeout", buf, 2u);
    }
  }
  if ([MEMORY[0x263F61E38] waitForSemaphore:v13 timeoutSeconds:0.5] == 1)
  {
    v16 = psg_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20A02A000, v16, OS_LOG_TYPE_ERROR, "PSGInputSuggester serving endpoint warmUp timeout", buf, 2u);
    }
  }
  v17 = psg_default_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A02A000, v17, OS_LOG_TYPE_INFO, "PSGInputSuggester warmUp DONE", buf, 2u);
  }
}

- (void)warmUp
{
  id v4 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v3 = [v4 localeIdentifier];
  [(PSGInputSuggester *)self warmUpForLocaleIdentifier:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImpression, 0);
  objc_storeStrong((id *)&self->_lastPrediction, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_lastPredictionQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)logTimeoutForRequest:(id)a3
{
  id v4 = (PSGInputSuggestionsRequest *)a3;
  if (v4 || (id v4 = self->_lastRequest) != 0)
  {
    [(PSGInputSuggesterClient *)self->_client logErrorForRequest:v4 trigger:0 errorType:0];
  }
  else
  {
    psg_default_log_handle();
    id v4 = (PSGInputSuggestionsRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v5 = 0;
      _os_log_error_impl(&dword_20A02A000, &v4->super, OS_LOG_TYPE_ERROR, "Logging called before any request has been made!", v5, 2u);
    }
  }
}

- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 predictedValues:(id)a5
{
  unsigned int v6 = a3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v28 = a4;
  id v27 = a5;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__8;
  v51 = __Block_byref_object_dispose__9;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8;
  v45 = __Block_byref_object_dispose__9;
  id v46 = 0;
  if (v6 == 2)
  {
    v8 = psg_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v28;
      _os_log_debug_impl(&dword_20A02A000, v8, OS_LOG_TYPE_DEBUG, "[Speed] %@", buf, 0xCu);
    }

    [(PSGInputSuggester *)self _reportSpeedMetricWithData:v28];
    goto LABEL_36;
  }
  unsigned int v25 = v6;
  if (v6 == 1)
  {
    uint64_t v9 = [(_PASTuple2 *)self->_lastImpression first];
    v10 = (void *)v48[5];
    v48[5] = v9;

    uint64_t v11 = [(_PASTuple2 *)self->_lastImpression second];
    id v12 = (void *)v42[5];
    v42[5] = v11;
  }
  else
  {
    if (v6)
    {
      log = psg_default_log_handle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v56) = v6;
        _os_log_fault_impl(&dword_20A02A000, log, OS_LOG_TYPE_FAULT, "Unknown event type: %d", buf, 8u);
      }
      goto LABEL_35;
    }
    lastPredictionQueue = self->_lastPredictionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__PSGInputSuggester_logMetricForEventType_externalMetadata_predictedValues___block_invoke;
    block[3] = &unk_263FCF8C0;
    block[4] = self;
    block[5] = &v47;
    block[6] = &v41;
    dispatch_sync(lastPredictionQueue, block);
  }
  if (!v48[5])
  {
    log = psg_default_log_handle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
LABEL_35:

      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v23 = "No known request has been recorded!";
LABEL_41:
    _os_log_error_impl(&dword_20A02A000, log, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_35;
  }
  if (![(id)v42[5] count])
  {
    log = psg_default_log_handle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v23 = "No known response items to log.";
    goto LABEL_41;
  }
  if ([v27 count])
  {
    log = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v27;
    uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v54 count:16];
    if (v13)
    {
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v16 = (id)v42[5];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v53 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v33;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(v16);
                }
                v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                v21 = [v20 predictedValue];
                int v22 = [v15 isEqualToString:v21];

                if (v22)
                {
                  [log addObject:v20];
                  goto LABEL_27;
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v53 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_27:
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v54 count:16];
      }
      while (v13);
    }

    [(PSGInputSuggester *)self logMetricForEventType:v25 externalMetadata:v28 request:v48[5] responseItems:log];
    goto LABEL_35;
  }
  v24 = psg_default_log_handle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A02A000, v24, OS_LOG_TYPE_DEFAULT, "No predictedValues given. Logging last recorded as a fallback.", buf, 2u);
  }

  [(PSGInputSuggester *)self logMetricForEventType:v25 externalMetadata:v28 request:v48[5] responseItems:v42[5]];
LABEL_36:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

void __76__PSGInputSuggester_logMetricForEventType_externalMetadata_predictedValues___block_invoke(void *a1)
{
  id v8 = *(id *)(a1[4] + 32);
  uint64_t v2 = [v8 first];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [v8 second];
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_reportSpeedMetricWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"keyboardLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    if ([v6 length])
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"keyboardRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      if ([v8 length])
      {
        uint64_t v9 = [[NSString alloc] initWithFormat:@"%@_%@", v6, v8];
        v10 = [v4 objectForKeyedSubscript:@"totalMessageDuration"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (unsigned int v11 = [v10 intValue], v11 == -1))
        {
          id v12 = psg_default_log_handle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v4;
            _os_log_fault_impl(&dword_20A02A000, v12, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageDuration missing | data: %@", buf, 0xCu);
          }
        }
        else
        {
          unsigned int v18 = v11;
          id v12 = [v4 objectForKeyedSubscript:@"totalMessageLength"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (unsigned int v13 = [v12 intValue], v13 == -1))
          {
            v14 = psg_default_log_handle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v20 = v4;
              _os_log_fault_impl(&dword_20A02A000, v14, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageLength missing | data: %@", buf, 0xCu);
            }
          }
          else
          {
            unsigned int v17 = v13;
            v14 = [v4 objectForKeyedSubscript:@"totalWordsEntered"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v15 = [v14 intValue], v15 == -1))
            {
              id v16 = psg_default_log_handle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v20 = v4;
                _os_log_fault_impl(&dword_20A02A000, v16, OS_LOG_TYPE_FAULT, "[SpeedMetric] messageWords missing | data: %@", buf, 0xCu);
              }
            }
            else
            {
              [(PSGInputSuggesterClient *)self->_client logSpeedMetricForLocaleIdentifier:v9 messageDurationMilliseconds:v18 messageLength:v17 messageWords:v15];
            }
          }
        }
      }
      else
      {
        uint64_t v9 = psg_default_log_handle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v4;
          _os_log_fault_impl(&dword_20A02A000, v9, OS_LOG_TYPE_FAULT, "[SpeedMetric] keyboardRegion missing | data: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v8 = psg_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_fault_impl(&dword_20A02A000, v8, OS_LOG_TYPE_FAULT, "[SpeedMetric] keyboardLanguage missing | data: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v6 = psg_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20A02A000, v6, OS_LOG_TYPE_FAULT, "[SpeedMetric] Empty data", buf, 2u);
    }
  }
}

- (void)logMetricForEventType:(unsigned __int8)a3 externalMetadata:(id)a4 request:(id)a5 responseItems:(id)a6
{
  int v8 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = v12;
  if (v8 == 2)
  {
    lastImpression = psg_default_log_handle();
    if (os_log_type_enabled(lastImpression, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v28) = 0;
      uint64_t v15 = "Use -[PSGInputSuggester logMetricForEventType:externalMetadata:predictedValues:] instead for logging Speed Metric";
      id v16 = lastImpression;
      uint32_t v17 = 2;
LABEL_4:
      _os_log_fault_impl(&dword_20A02A000, v16, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v28, v17);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (![v12 count])
  {
    id v20 = psg_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v28 = 67109120;
      LODWORD(v29) = v8;
      _os_log_error_impl(&dword_20A02A000, v20, OS_LOG_TYPE_ERROR, "No response item specified for logging event type %d", (uint8_t *)&v28, 8u);
    }

    lastImpression = self->_lastImpression;
    self->_lastImpression = 0;
    goto LABEL_25;
  }
  if (v8 == 1)
  {
    uint64_t v21 = self->_lastImpression;
    self->_lastImpression = 0;

    int v22 = [v10 objectForKey:@"pos"];
    lastImpression = v22;
    if (v22)
    {
      unint64_t v23 = [v22 unsignedIntegerValue];
      if (v23 && v23 <= [v13 count]) {
        goto LABEL_22;
      }
      v24 = psg_default_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v28 = 134217984;
        v29 = (__CFString *)v23;
        unsigned int v25 = "position param (%tu) out of range";
LABEL_27:
        _os_log_error_impl(&dword_20A02A000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      v24 = psg_default_log_handle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v28 = 138412290;
        v29 = @"pos";
        unsigned int v25 = "position param %@ not specified for engagement logging";
        goto LABEL_27;
      }
    }

    unint64_t v23 = 10000;
LABEL_22:
    v26 = psg_default_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = [v13 count];
      int v28 = 134218240;
      v29 = (__CFString *)v23;
      __int16 v30 = 2048;
      uint64_t v31 = v27;
      _os_log_debug_impl(&dword_20A02A000, v26, OS_LOG_TYPE_DEBUG, "Logging engagement at position %tu of %tu item(s)", (uint8_t *)&v28, 0x16u);
    }

    [(PSGInputSuggesterClient *)self->_client logEngagement:v13 request:v11 position:v23];
    goto LABEL_25;
  }
  if (v8)
  {
    lastImpression = psg_default_log_handle();
    if (!os_log_type_enabled(lastImpression, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    int v28 = 67109120;
    LODWORD(v29) = v8;
    uint64_t v15 = "Unknown event type: %d";
    id v16 = lastImpression;
    uint32_t v17 = 8;
    goto LABEL_4;
  }
  [(PSGInputSuggesterClient *)self->_client logImpression:v13 request:v11];
  unsigned int v18 = [MEMORY[0x263F61EA8] tupleWithFirst:v11 second:v13];
  id v19 = self->_lastImpression;
  self->_lastImpression = v18;

  lastImpression = psg_default_log_handle();
  if (os_log_type_enabled(lastImpression, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134217984;
    v29 = (__CFString *)[v13 count];
    _os_log_debug_impl(&dword_20A02A000, lastImpression, OS_LOG_TYPE_DEBUG, "Logging impression for %tu item(s)", (uint8_t *)&v28, 0xCu);
  }
LABEL_25:
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_lastRequest, a3);
  client = self->_client;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke;
  v12[3] = &unk_263FCF870;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(PSGInputSuggesterClient *)client inputSuggestionsWithRequest:v11 completion:v12];
}

void __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke_2;
  block[3] = &unk_263FCFC48;
  block[4] = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v8 = v5;
  id v9 = a3;
  dispatch_async(v7, block);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__PSGInputSuggester_inputSuggestionsWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F61EA8];
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) responseItems];
  uint64_t v4 = [v2 tupleWithFirst:v3 second:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

- (PSGInputSuggester)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSGInputSuggester;
  uint64_t v6 = [(PSGInputSuggester *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGInputSuggester.lastPrediction" qosClass:9];
    lastPredictionQueue = v7->_lastPredictionQueue;
    v7->_lastPredictionQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__PSGInputSuggester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __35__PSGInputSuggester_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2105116B0]();
  id v3 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v4 = +[PSGInputSuggesterClient sharedInstance];
  uint64_t v5 = [v3 initWithClient:v4];
  uint64_t v6 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v5;
}

@end