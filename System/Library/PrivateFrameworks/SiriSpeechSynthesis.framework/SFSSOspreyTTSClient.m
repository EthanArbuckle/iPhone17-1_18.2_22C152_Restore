@interface SFSSOspreyTTSClient
+ (id)sharedInstance;
- (BOOL)useBlazar;
- (NSString)carryClusterId;
- (NSString)deviceId;
- (SFSSOspreyTTSClient)init;
- (SFSSOspreyTTSClient)initWithURL:(id)a3;
- (SFSSOspreyTTSClient)initWithURL:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5;
- (void)performCustomBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5;
- (void)prewarm;
- (void)setCarryClusterId:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setUseBlazar:(BOOL)a3;
- (void)streamBlazarTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8;
- (void)streamNativeTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8;
- (void)streamTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8;
@end

@implementation SFSSOspreyTTSClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_carryClusterId, 0);
}

- (void)setUseBlazar:(BOOL)a3
{
  self->_useBlazar = a3;
}

- (BOOL)useBlazar
{
  return self->_useBlazar;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setCarryClusterId:(id)a3
{
}

- (NSString)carryClusterId
{
  return self->_carryClusterId;
}

- (void)streamBlazarTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v44 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v40 = a8;
  v41 = v15;
  v42 = v16;
  v43 = v17;
  v18 = objc_alloc_init(QSSMutableTextToSpeechRouterStreamingStreamingRequest);
  [(QSSMutableTextToSpeechRouterStreamingStreamingRequest *)v18 setContent_type:1];
  [(QSSMutableTextToSpeechRouterStreamingStreamingRequest *)v18 setContentAsQSSStartTextToSpeechStreamingRequest:v14];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy_;
  v51[4] = __Block_byref_object_dispose_;
  id v52 = (id)MEMORY[0x230F4BDC0](v40);
  v19 = SFSSGetLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v39 = objc_msgSend(v14, "speech_id");
    v38 = objc_msgSend(v14, "session_id");
    v37 = objc_msgSend(v14, "stream_id");
    v20 = [v14 language];
    v21 = [v14 gender];
    v22 = objc_msgSend(v14, "voice_name");
    v23 = objc_msgSend(v14, "meta_info");
    v24 = objc_msgSend(v23, "app_id");
    v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "preferred_voice_type"));
    *(_DWORD *)buf = 138414082;
    v54 = v39;
    __int16 v55 = 2112;
    v56 = v38;
    __int16 v57 = 2112;
    v58 = v37;
    __int16 v59 = 2112;
    v60 = v20;
    __int16 v61 = 2112;
    v62 = v21;
    __int16 v63 = 2112;
    v64 = v22;
    __int16 v65 = 2112;
    v66 = v24;
    __int16 v67 = 2112;
    v68 = v25;
    _os_log_impl(&dword_22B575000, v19, OS_LOG_TYPE_INFO, "Sent Osprey Blazar streaming request with speech_id '%@', session_id '%@', stream_id '%@', locale '%@', gender '%@', voice '%@', app_id '%@', voice_type '%@'", buf, 0x52u);
  }
  v26 = (void *)[objc_alloc(MEMORY[0x263F5B948]) initWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming"];
  v27 = [(QSSTextToSpeechRouterStreamingStreamingRequest *)v18 flatbuffData];
  [v26 setData:v27];

  v28 = (void *)[v44 mutableCopy];
  v29 = [(SFSSOspreyTTSClient *)self carryClusterId];
  BOOL v30 = [v29 length] == 0;

  if (!v30)
  {
    v31 = [(SFSSOspreyTTSClient *)self carryClusterId];
    [v28 setObject:v31 forKeyedSubscript:@"supercarry-cluster-override"];
  }
  v32 = (void *)[v28 copy];
  [v26 setHeaders:v32];

  v33 = objc_msgSend(v14, "session_id");
  [v26 setClientTraceId:v33];

  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v46[3] = &unk_26489E860;
  v50 = v51;
  id v34 = v41;
  id v47 = v34;
  id v35 = v42;
  id v48 = v35;
  id v36 = v43;
  id v49 = v36;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_47;
  v45[3] = &unk_26489E888;
  v45[4] = v51;
  [(SFSSOspreyTTSClient *)self performCustomBidirectionalStreamingRequest:v26 handler:v46 completion:v45];

  _Block_object_dispose(v51, 8);
}

void __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke(void *a1, void *a2)
{
  v58[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [[QSSTextToSpeechRouterStreamingStreamingResponse alloc] initWithFlatbuffData:v3];
  switch([(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 content_type])
  {
    case 0:
      v5 = SFSSGetLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[SFSSOspreyTTSClient streamBlazarTTS:headers:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
        _os_log_fault_impl(&dword_22B575000, v5, OS_LOG_TYPE_FAULT, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
      }
      goto LABEL_28;
    case 1:
      v6 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
      int v7 = objc_msgSend(v6, "error_code");

      if (v7 == 200)
      {
        v8 = SFSSGetLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          objc_msgSend(v9, "stream_id");
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v10;
          _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);
        }
        uint64_t v11 = a1[4];
        v5 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v5);
      }
      else
      {
        uint64_t v21 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v21)
        {
          v22 = (void *)MEMORY[0x263F087E8];
          uint64_t v57 = *MEMORY[0x263F08320];
          v23 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          v24 = objc_msgSend(v23, "error_str");
          v58[0] = v24;
          v25 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
          v26 = [v22 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v25];
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v26);

          uint64_t v27 = *(void *)(a1[7] + 8);
          v28 = *(void **)(v27 + 40);
          *(void *)(v27 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v29 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v29, "error_code");
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);
        }
      }
      goto LABEL_28;
    case 2:
      v12 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
      int v13 = objc_msgSend(v12, "error_code");

      if (v13 == 200)
      {
        id v14 = SFSSGetLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v48 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v48, "current_pkt_number");
          _os_log_debug_impl(&dword_22B575000, v14, OS_LOG_TYPE_DEBUG, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);
        }
        uint64_t v15 = a1[5];
        v5 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v15 + 16))(v15, v5);
      }
      else
      {
        uint64_t v30 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v30)
        {
          v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v53 = *MEMORY[0x263F08320];
          v32 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          v33 = objc_msgSend(v32, "error_str");
          v54 = v33;
          id v34 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v35 = [v31 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v34];
          (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v35);

          uint64_t v36 = *(void *)(a1[7] + 8);
          v37 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v38 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          int v39 = objc_msgSend(v38, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v39;
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error: Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);
        }
      }
      goto LABEL_28;
    case 3:
      id v16 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
      int v17 = objc_msgSend(v16, "error_code");

      if (v17 == 200)
      {
        v18 = SFSSGetLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v19, "total_pkt_number");
          _os_log_impl(&dword_22B575000, v18, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);
        }
        uint64_t v20 = a1[6];
        v5 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v5);
      }
      else
      {
        uint64_t v40 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v40)
        {
          v41 = (void *)MEMORY[0x263F087E8];
          v42 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          v43 = objc_msgSend(v42, "error_str");
          id v52 = v43;
          id v44 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v45 = [v41 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v44];
          (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v45);

          uint64_t v46 = *(void *)(a1[7] + 8);
          id v47 = *(void **)(v46 + 40);
          *(void *)(v46 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          id v49 = [(QSSTextToSpeechRouterStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          int v50 = objc_msgSend(v49, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v50;
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);
        }
      }
LABEL_28:

      break;
    default:
      break;
  }
}

void __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x263F087E8];
    v6 = [v3 userInfo];
    uint64_t v7 = [v5 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v6];

    v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_error_impl(&dword_22B575000, v8, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = (void *)v7;
  }
  else
  {
    v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

- (void)streamNativeTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v44 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v40 = a8;
  v41 = v15;
  v42 = v16;
  v43 = v17;
  v18 = objc_alloc_init(QSSMutableTextToSpeechStreamingStreamingRequest);
  [(QSSMutableTextToSpeechStreamingStreamingRequest *)v18 setContent_type:1];
  [(QSSMutableTextToSpeechStreamingStreamingRequest *)v18 setContentAsQSSStartTextToSpeechStreamingRequest:v14];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy_;
  v51[4] = __Block_byref_object_dispose_;
  id v52 = (id)MEMORY[0x230F4BDC0](v40);
  v19 = SFSSGetLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v39 = objc_msgSend(v14, "speech_id");
    v38 = objc_msgSend(v14, "session_id");
    v37 = objc_msgSend(v14, "stream_id");
    uint64_t v20 = [v14 language];
    uint64_t v21 = [v14 gender];
    v22 = objc_msgSend(v14, "voice_name");
    v23 = objc_msgSend(v14, "meta_info");
    v24 = objc_msgSend(v23, "app_id");
    v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "preferred_voice_type"));
    *(_DWORD *)buf = 138414082;
    v54 = v39;
    __int16 v55 = 2112;
    v56 = v38;
    __int16 v57 = 2112;
    v58 = v37;
    __int16 v59 = 2112;
    v60 = v20;
    __int16 v61 = 2112;
    v62 = v21;
    __int16 v63 = 2112;
    v64 = v22;
    __int16 v65 = 2112;
    v66 = v24;
    __int16 v67 = 2112;
    v68 = v25;
    _os_log_impl(&dword_22B575000, v19, OS_LOG_TYPE_INFO, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', locale '%@', gender '%@', voice '%@', app_id '%@', voice_type '%@'", buf, 0x52u);
  }
  v26 = (void *)[objc_alloc(MEMORY[0x263F5B948]) initWithMethodName:@"/siri.speech.qss_fb.Tts/TextToSpeechStreaming"];
  uint64_t v27 = [(QSSTextToSpeechStreamingStreamingRequest *)v18 flatbuffData];
  [v26 setData:v27];

  v28 = (void *)[v44 mutableCopy];
  v29 = [(SFSSOspreyTTSClient *)self carryClusterId];
  BOOL v30 = [v29 length] == 0;

  if (!v30)
  {
    v31 = [(SFSSOspreyTTSClient *)self carryClusterId];
    [v28 setObject:v31 forKeyedSubscript:@"supercarry-cluster-override"];
  }
  v32 = (void *)[v28 copy];
  [v26 setHeaders:v32];

  v33 = objc_msgSend(v14, "session_id");
  [v26 setClientTraceId:v33];

  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v46[3] = &unk_26489E860;
  int v50 = v51;
  id v34 = v41;
  id v47 = v34;
  id v35 = v42;
  id v48 = v35;
  id v36 = v43;
  id v49 = v36;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_41;
  v45[3] = &unk_26489E888;
  v45[4] = v51;
  [(SFSSOspreyTTSClient *)self performCustomBidirectionalStreamingRequest:v26 handler:v46 completion:v45];

  _Block_object_dispose(v51, 8);
}

void __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke(void *a1, void *a2)
{
  v58[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [[QSSTextToSpeechStreamingStreamingResponse alloc] initWithFlatbuffData:v3];
  switch([(QSSTextToSpeechStreamingStreamingResponse *)v4 content_type])
  {
    case 0:
      v5 = SFSSGetLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[SFSSOspreyTTSClient streamNativeTTS:headers:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
        _os_log_fault_impl(&dword_22B575000, v5, OS_LOG_TYPE_FAULT, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
      }
      goto LABEL_28;
    case 2:
      v6 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
      int v7 = objc_msgSend(v6, "error_code");

      if (v7 == 200)
      {
        v8 = SFSSGetLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          objc_msgSend(v9, "stream_id");
          uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v10;
          _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);
        }
        uint64_t v11 = a1[4];
        v5 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v5);
      }
      else
      {
        uint64_t v21 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v21)
        {
          v22 = (void *)MEMORY[0x263F087E8];
          uint64_t v57 = *MEMORY[0x263F08320];
          v23 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          v24 = objc_msgSend(v23, "error_str");
          v58[0] = v24;
          v25 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
          v26 = [v22 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v25];
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v26);

          uint64_t v27 = *(void *)(a1[7] + 8);
          v28 = *(void **)(v27 + 40);
          *(void *)(v27 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v29 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSBeginTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v29, "error_code");
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);
        }
      }
      goto LABEL_28;
    case 3:
      v12 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
      int v13 = objc_msgSend(v12, "error_code");

      if (v13 == 200)
      {
        id v14 = SFSSGetLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v48 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v48, "current_pkt_number");
          _os_log_debug_impl(&dword_22B575000, v14, OS_LOG_TYPE_DEBUG, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);
        }
        uint64_t v15 = a1[5];
        v5 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v15 + 16))(v15, v5);
      }
      else
      {
        uint64_t v30 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v30)
        {
          v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v53 = *MEMORY[0x263F08320];
          v32 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          v33 = objc_msgSend(v32, "error_str");
          v54 = v33;
          id v34 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v35 = [v31 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v34];
          (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v35);

          uint64_t v36 = *(void *)(a1[7] + 8);
          v37 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v38 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSPartialTextToSpeechStreamingResponse];
          int v39 = objc_msgSend(v38, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v39;
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Error: Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);
        }
      }
      goto LABEL_28;
    case 4:
      id v16 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
      int v17 = objc_msgSend(v16, "error_code");

      if (v17 == 200)
      {
        v18 = SFSSGetLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v19, "total_pkt_number");
          _os_log_impl(&dword_22B575000, v18, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);
        }
        uint64_t v20 = a1[6];
        v5 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v5);
      }
      else
      {
        uint64_t v40 = *(void *)(*(void *)(a1[7] + 8) + 40);
        if (v40)
        {
          v41 = (void *)MEMORY[0x263F087E8];
          v42 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          v43 = objc_msgSend(v42, "error_str");
          id v52 = v43;
          id v44 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          v45 = [v41 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v44];
          (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v45);

          uint64_t v46 = *(void *)(a1[7] + 8);
          id v47 = *(void **)(v46 + 40);
          *(void *)(v46 + 40) = 0;
        }
        v5 = SFSSGetLogObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          id v49 = [(QSSTextToSpeechStreamingStreamingResponse *)v4 contentAsQSSFinalTextToSpeechStreamingResponse];
          int v50 = objc_msgSend(v49, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v50;
          _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);
        }
      }
LABEL_28:

      break;
    default:
      break;
  }
}

void __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x263F087E8];
    v6 = [v3 userInfo];
    uint64_t v7 = [v5 errorWithDomain:@"SFSpeechSynthesisServerErrorDomain" code:800 userInfo:v6];

    v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v7;
      _os_log_error_impl(&dword_22B575000, v8, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = (void *)v7;
  }
  else
  {
    v8 = SFSSGetLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22B575000, v8, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

- (void)streamTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  objc_msgSend(v21, "setSpeech_id:", self->_deviceId);
  v19 = [MEMORY[0x263F08C38] UUID];
  uint64_t v20 = [v19 UUIDString];
  objc_msgSend(v21, "setStream_id:", v20);

  if ([(SFSSOspreyTTSClient *)self useBlazar]) {
    [(SFSSOspreyTTSClient *)self streamBlazarTTS:v21 headers:v14 beginHandler:v15 chunkHandler:v16 endHandler:v17 completion:v18];
  }
  else {
    [(SFSSOspreyTTSClient *)self streamNativeTTS:v21 headers:v14 beginHandler:v15 chunkHandler:v16 endHandler:v17 completion:v18];
  }
}

- (void)performCustomBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__SFSSOspreyTTSClient_performCustomBidirectionalStreamingRequest_handler_completion___block_invoke;
  v17[3] = &unk_26489E838;
  id v11 = v8;
  id v18 = v11;
  v12 = (void *)MEMORY[0x230F4BDC0](v17);
  int v13 = [v11 methodName];
  id v14 = [(OspreyChannel *)self bidirectionalStreamingRequestWithMethodName:v13 requestBuilder:v12 streamingResponseHandler:v9 completion:v10];

  id v15 = [v11 data];

  if (v15)
  {
    id v16 = [v11 data];
    [v14 writeFrame:v16];

    [v14 finishWriting];
  }
}

void __85__SFSSOspreyTTSClient_performCustomBidirectionalStreamingRequest_handler_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) clientTraceId];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) clientTraceId];
    [v3 setClientTraceIdentifier:v5];
  }
  v6 = [*(id *)(a1 + 32) headers];

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "headers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          v12 = [*(id *)(a1 + 32) headers];
          int v13 = [v12 objectForKey:v11];
          [v3 setValue:v13 forHTTPHeaderField:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)prewarm
{
  id v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Preconnect Osprey TTS connection.", v4, 2u);
  }

  [(OspreyChannel *)self preconnect];
}

- (SFSSOspreyTTSClient)initWithURL:(id)a3
{
  return [(SFSSOspreyTTSClient *)self initWithURL:a3 useBlazar:1 enableAuthentication:1];
}

- (SFSSOspreyTTSClient)initWithURL:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v8 = (NSString *)a3;
  uint64_t v9 = SFSSGetLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    _os_log_impl(&dword_22B575000, v9, OS_LOG_TYPE_INFO, "Init TTS Osprey client with URL: %@, useBlazar=%d, enableDeviceAuthentication=%d", buf, 0x18u);
  }

  uint64_t v10 = [NSURL URLWithString:v8];
  uint64_t v11 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  v19.receiver = self;
  v19.super_class = (Class)SFSSOspreyTTSClient;
  v12 = [(OspreyChannel *)&v19 initWithURL:v10 configuration:v11];

  if (v12)
  {
    v12->_useBlazar = v6;
    int v13 = +[SFSpeechSynthesisInternalSetting sharedInstance];
    uint64_t v14 = [v13 deviceId];
    deviceId = v12->_deviceId;
    v12->_deviceId = (NSString *)v14;

    long long v16 = SFSSGetLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = v12->_deviceId;
      *(_DWORD *)buf = 138412290;
      id v21 = v17;
      _os_log_impl(&dword_22B575000, v16, OS_LOG_TYPE_INFO, "Device ID: %@", buf, 0xCu);
    }

    [(OspreyChannel *)v12 setUseCompression:0];
    [(OspreyChannel *)v12 setEnableDeviceAuthentication:v5];
    if ([(OspreyChannel *)v12 enableDeviceAuthentication]) {
      [(OspreyChannel *)v12 initializeDeviceAuthenticationSessionWithCompletion:&__block_literal_global_25];
    }
  }

  return v12;
}

void __66__SFSSOspreyTTSClient_initWithURL_useBlazar_enableAuthentication___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "initializeDeviceAuthenticationSessionWithCompletion Error: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = SFSSGetLogObject();
  BOOL v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_error_impl(&dword_22B575000, v5, OS_LOG_TYPE_ERROR, "Unable to initialize device authentication session: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "Device authentication session is initialized", (uint8_t *)&v6, 2u);
  }
}

- (SFSSOspreyTTSClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFSSOspreyTTSClient;
  id v2 = [(SFSSOspreyTTSClient *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    carryClusterId = v2->_carryClusterId;
    v2->_carryClusterId = 0;
  }
  BOOL v5 = +[SFSpeechSynthesisInternalSetting sharedInstance];
  int v6 = [v5 ospreyEndpointURL];

  id v7 = [(SFSSOspreyTTSClient *)v3 initWithURL:v6];
  return v7;
}

+ (id)sharedInstance
{
  if (+[SFSSOspreyTTSClient sharedInstance]::onceToken != -1) {
    dispatch_once(&+[SFSSOspreyTTSClient sharedInstance]::onceToken, &__block_literal_global);
  }
  id v2 = (void *)+[SFSSOspreyTTSClient sharedInstance]::__sharedInstance;
  return v2;
}

uint64_t __37__SFSSOspreyTTSClient_sharedInstance__block_invoke()
{
  +[SFSSOspreyTTSClient sharedInstance]::__sharedInstance = objc_alloc_init(SFSSOspreyTTSClient);
  return MEMORY[0x270F9A758]();
}

@end