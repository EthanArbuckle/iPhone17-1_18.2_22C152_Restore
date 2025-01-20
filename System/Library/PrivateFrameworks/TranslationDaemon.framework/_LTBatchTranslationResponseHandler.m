@interface _LTBatchTranslationResponseHandler
- (BOOL)completionHandlerCalled;
- (BOOL)hasFinalServerResponse;
- (BOOL)supportsGenderDisambiguation;
- (FTMutableBatchTranslationRequest)request;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (NSLocale)toLocale;
- (NSString)clientHeader;
- (NSString)clientIdentifier;
- (NSString)requestID;
- (NSString)sessionID;
- (NSURL)sourceURL;
- (NSUUID)logIdentifier;
- (_LTBatchedParagraphsHolder)batchedParagraphs;
- (_LTTranslationParagraph)paragraph;
- (int64_t)taskHint;
- (unint64_t)bufferSize;
- (void)callCompletionHandlersWithError:(id)a3;
- (void)setBatchedParagraphs:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setClientHeader:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCompletionHandlerCalled:(BOOL)a3;
- (void)setHasFinalServerResponse:(BOOL)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setParagraph:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceLocale:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setSupportsGenderDisambiguation:(BOOL)a3;
- (void)setTargetLocale:(id)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setToLocale:(id)a3;
- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3;
- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3;
@end

@implementation _LTBatchTranslationResponseHandler

- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(FTMutableBatchTranslationRequest *)self->_request request_id];
    int v50 = 138543362;
    v51 = v6;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "streamDidReceiveBatchTranslationStreamingResponse request_id %{public}@", (uint8_t *)&v50, 0xCu);
  }
  if (objc_msgSend(v4, "content_type") == 1)
  {
    v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [(FTMutableBatchTranslationRequest *)self->_request request_id];
      int v50 = 138543362;
      v51 = v8;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "found BatchTranslationResponse request_id %{public}@", (uint8_t *)&v50, 0xCu);
    }
    v9 = [v4 contentAsFTBatchTranslationResponse];
    v10 = v9;
    if (v9)
    {
      batchedParagraphs = self->_batchedParagraphs;
      v12 = objc_msgSend(v9, "paragraph_id");
      v13 = [(_LTBatchedParagraphsHolder *)batchedParagraphs paragraphWithId:v12];

      if (objc_msgSend(v10, "return_code") == 200)
      {
        v14 = [v13 requestParagraph];
        v15 = [v13 paragraph];
        v16 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [(FTMutableBatchTranslationRequest *)self->_request request_id];
          v18 = [v10 span];
          uint64_t v19 = [v18 count];
          int v50 = 138543618;
          v51 = v17;
          __int16 v52 = 2048;
          unint64_t v53 = v19;
          _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Succeeded request %{public}@ (%zu alignments)", (uint8_t *)&v50, 0x16u);
        }
        v20 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "translated_text");
          objc_claimAutoreleasedReturnValue();
          [v14 text];
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:]();
        }

        id v21 = objc_alloc(MEMORY[0x263F1C190]);
        v22 = [v14 text];
        v23 = (void *)[v21 initWithOspreyBatchResponse:v10 sourceText:v22];

        [v23 setRoute:2];
        v24 = [v14 paragraph_id];
        [v23 setIdentifier:v24];

        [v23 setLocale:self->_targetLocale];
        v25 = [v14 text];
        [v23 setSourceString:v25];

        v26 = [v15 spans];
        v27 = [v10 span];
        [v23 updateAlignmentWithSourceSpan:v26 targetSpan:v27];

        v28 = 0;
      }
      else
      {
        v38 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "return_code");
          objc_msgSend(v10, "return_string");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.5();
        }

        unsigned int v39 = objc_msgSend(v10, "return_code");
        v40 = objc_msgSend(v10, "return_string");
        v28 = _LTErrorFromRemoteFailure(v39, v40);

        v14 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          [(FTMutableBatchTranslationRequest *)self->_request request_id];
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
        }
        v23 = 0;
      }

      v41 = [v13 completion];
      BOOL v42 = v41 == 0;

      if (v42)
      {
        v43 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "paragraph_id");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:]();
        }
      }
      else
      {
        v43 = [v13 completion];
        ((void (*)(NSObject *, void *, void *))v43[2].isa)(v43, v23, v28);
      }

      v44 = self->_batchedParagraphs;
      v45 = objc_msgSend(v10, "paragraph_id");
      [(_LTBatchedParagraphsHolder *)v44 removeParagraphWithId:v45];
    }
    else
    {
      v37 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:]();
      }
    }
  }
  else if (objc_msgSend(v4, "content_type") == 2)
  {
    [(_LTBatchTranslationResponseHandler *)self setHasFinalServerResponse:1];
    v29 = [v4 contentAsFTFinalBlazarResponse];
    v30 = v29;
    if (v29)
    {
      if (objc_msgSend(v29, "return_code") != 200)
      {
        v31 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v30, "return_code");
          objc_msgSend(v30, "return_str");
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.5();
        }

        unsigned int v32 = objc_msgSend(v30, "return_code");
        v33 = objc_msgSend(v30, "return_str");
        v34 = _LTErrorFromRemoteFailure(v32, v33);

        v35 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          [(FTMutableBatchTranslationRequest *)self->_request request_id];
          objc_claimAutoreleasedReturnValue();
          -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
        }
      }
    }
    else
    {
      v46 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.6();
      }
    }
    v47 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = [(FTMutableBatchTranslationRequest *)self->_request request_id];
      unint64_t v49 = [(_LTBatchedParagraphsHolder *)self->_batchedParagraphs count];
      int v50 = 138543874;
      v51 = v48;
      __int16 v52 = 2048;
      unint64_t v53 = v49;
      __int16 v54 = 2112;
      uint64_t v55 = 0;
      _os_log_impl(&dword_2600DC000, v47, OS_LOG_TYPE_INFO, "found FTFinalBlazarResponse request_id %{public}@ outstanding paragraphs %zu error %@", (uint8_t *)&v50, 0x20u);
    }
    [(_LTBatchTranslationResponseHandler *)self callCompletionHandlersWithError:0];
  }
  else
  {
    v36 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.9();
    }
  }
}

- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3
{
  id v4 = a3;
  v5 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [(FTMutableBatchTranslationRequest *)self->_request request_id];
    objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.4();
  }

  [(_LTBatchTranslationResponseHandler *)self callCompletionHandlersWithError:v4];
}

- (void)callCompletionHandlersWithError:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v5 = [(FTMutableBatchTranslationRequest *)self->_request request_id];

    if (v5)
    {
      v14[0] = @"request_id";
      v6 = [(FTMutableBatchTranslationRequest *)self->_request request_id];
      v15[0] = v6;
      v14[1] = @"hasFinalServerResponse";
      v7 = [NSNumber numberWithBool:self->_hasFinalServerResponse];
      v15[1] = v7;
      v14[2] = @"completionHandlerCalled";
      v8 = [NSNumber numberWithBool:self->_completionHandlerCalled];
      v15[2] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

      v5 = (void *)v9;
    }
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = (void *)MEMORY[0x263F087E8];
    v12 = [v10 localizedStringForKey:@"MISSING_BATCH_RESPONSE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    uint64_t v13 = objc_msgSend(v11, "lt_errorWithCode:description:userInfo:", 13, v12, v5);

    id v4 = (id)v13;
  }
  [(_LTBatchedParagraphsHolder *)self->_batchedParagraphs completeAllAndCleanWithError:v4];
}

- (FTMutableBatchTranslationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSLocale)toLocale
{
  return self->_toLocale;
}

- (void)setToLocale:(id)a3
{
}

- (_LTTranslationParagraph)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
}

- (_LTBatchedParagraphsHolder)batchedParagraphs
{
  return self->_batchedParagraphs;
}

- (void)setBatchedParagraphs:(id)a3
{
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setSourceLocale:(id)a3
{
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)clientHeader
{
  return self->_clientHeader;
}

- (void)setClientHeader:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (BOOL)hasFinalServerResponse
{
  return self->_hasFinalServerResponse;
}

- (void)setHasFinalServerResponse:(BOOL)a3
{
  self->_hasFinalServerResponse = a3;
}

- (BOOL)completionHandlerCalled
{
  return self->_completionHandlerCalled;
}

- (void)setCompletionHandlerCalled:(BOOL)a3
{
  self->_completionHandlerCalled = a3;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
}

- (BOOL)supportsGenderDisambiguation
{
  return self->_supportsGenderDisambiguation;
}

- (void)setSupportsGenderDisambiguation:(BOOL)a3
{
  self->_supportsGenderDisambiguation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientHeader, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_batchedParagraphs, 0);
  objc_storeStrong((id *)&self->_paragraph, 0);
  objc_storeStrong((id *)&self->_toLocale, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "FIXME: NULL FTBatchTranslationResponse!", v2, v3, v4, v5, v6);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_2600DC000, v3, OS_LOG_TYPE_ERROR, "Missing paragraphBatchInfo for paragraph ID: %{public}@", v4, 0xCu);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.3()
{
  OUTLINED_FUNCTION_7_0();
  *(_DWORD *)uint64_t v2 = 138740227;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2117;
  *(void *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_2600DC000, v6, OS_LOG_TYPE_DEBUG, "Translation: %{sensitive}@ for %{sensitive}@", v5, 0x16u);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.4()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_4_4(&dword_2600DC000, "Translation error on %{public}@: %@", v4, v5);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.5()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0(v1, v2, v3, 1.5047e-36);
  _os_log_error_impl(&dword_2600DC000, v5, OS_LOG_TYPE_ERROR, "GRPC error %d: %@", v4, 0x12u);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "NULL FTFinalBlazarResponse!", v1, 2u);
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unrecognized message type from server recieved!", v2, v3, v4, v5, v6);
}

@end