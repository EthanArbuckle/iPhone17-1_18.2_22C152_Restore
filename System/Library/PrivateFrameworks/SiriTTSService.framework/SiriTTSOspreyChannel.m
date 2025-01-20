@interface SiriTTSOspreyChannel
- (OspreyChannel)grpcChannel;
- (SiriTTSOspreyChannel)initWithURL:(id)a3 configuration:(id)a4;
- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3;
- (void)preconnect;
- (void)setGrpcChannel:(id)a3;
- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 completion:(id)a6;
@end

@implementation SiriTTSOspreyChannel

- (void).cxx_destruct
{
}

- (void)setGrpcChannel:(id)a3
{
}

- (OspreyChannel)grpcChannel
{
  return self->_grpcChannel;
}

- (void)preconnect
{
}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3
{
}

- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 completion:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v25 = a4;
  id v26 = a5;
  id aBlock = a6;
  v10 = [v9 underlyingRequest];
  v11 = objc_alloc_init(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest);
  [(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *)v11 setContent_type:1];
  [(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *)v11 setContentAsOPTTSStartTextToSpeechStreamingRequest:v10];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x4810000000;
  long long v44 = 0u;
  long long v45 = 0u;
  v43[3] = &unk_19CF11BD2;
  uint64_t v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__628;
  v41[4] = __Block_byref_object_dispose__629;
  id v42 = _Block_copy(aBlock);
  v12 = TTSGetServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v10, "speech_id", v25, v26);
    v14 = objc_msgSend(v10, "session_id");
    v15 = objc_msgSend(v10, "stream_id");
    v16 = objc_msgSend(v10, "meta_info");
    v17 = objc_msgSend(v16, "app_id");
    uint64_t v18 = [v9 requestCreatedTime];
    *(_DWORD *)buf = 138413314;
    v48 = v13;
    __int16 v49 = 2112;
    v50 = v14;
    __int16 v51 = 2112;
    v52 = v15;
    __int16 v53 = 2112;
    v54 = v17;
    __int16 v55 = 2048;
    uint64_t v56 = v18;
    _os_log_impl(&dword_19CD9A000, v12, OS_LOG_TYPE_DEFAULT, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', app_id '%@', request_id '%llu'", buf, 0x34u);
  }
  grpcChannel = self->_grpcChannel;
  v20 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)v11 flatbuffData];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke;
  v39[3] = &unk_1E59202F8;
  id v40 = v10;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_2;
  v32[3] = &unk_1E5920320;
  id v21 = v40;
  id v33 = v21;
  id v34 = v9;
  v37 = v41;
  v38 = v43;
  id v22 = v25;
  id v35 = v22;
  id v23 = v26;
  id v36 = v23;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_247;
  v29[3] = &unk_1E5920348;
  id v24 = v34;
  id v30 = v24;
  v31 = v41;
  [(OspreyChannel *)grpcChannel serverStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming" requestData:v20 requestBuilder:v39 streamingResponseHandler:v32 completion:v29];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "session_id");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClientTraceIdentifier:v4];
}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[OPTTSTextToSpeechRouterStreamingStreamingResponse alloc] initAndVerifyWithFlatbuffData:v3];

  if (v4)
  {
    switch(objc_msgSend(v4, "content_type"))
    {
      case 0:
        v5 = TTSGetServiceLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          uint64_t v82 = [*(id *)(a1 + 40) requestCreatedTime];
          *(_DWORD *)buf = 136315394;
          *(void *)v99 = "-[SiriTTSOspreyChannel streamTTS:beginHandler:chunkHandler:completion:]_block_invoke";
          *(_WORD *)&v99[8] = 2048;
          *(void *)&v99[10] = v82;
          _os_log_error_impl(&dword_19CD9A000, v5, OS_LOG_TYPE_ERROR, "%s, Unknown response from Osprey for streaming TTS, request_id: %llu", buf, 0x16u);
        }

        v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v88 = *MEMORY[0x1E4F28568];
        v89 = @"Unknown response from Osprey for streaming TTS";
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        v8 = [v6 errorWithDomain:@"OspreyTTSService" code:-1 userInfo:v7];

        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v9)
        {
          (*(void (**)(uint64_t, NSObject *))(v9 + 16))(v9, v8);
          uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
          v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = 0;
        }
        goto LABEL_39;
      case 1:
        uint64_t v18 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
        int v19 = objc_msgSend(v18, "error_code");

        if (v19 == 200)
        {
          v20 = TTSGetServiceLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
            id v22 = objc_msgSend(v21, "stream_id");
            uint64_t v23 = [*(id *)(a1 + 40) requestCreatedTime];
            *(_DWORD *)buf = 138412546;
            *(void *)v99 = v22;
            *(_WORD *)&v99[8] = 2048;
            *(void *)&v99[10] = v23;
            _os_log_impl(&dword_19CD9A000, v20, OS_LOG_TYPE_DEFAULT, "Osprey streaming received Begin response %@, request_id: %llu", buf, 0x16u);
          }
          id v24 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
          id v25 = objc_msgSend(v24, "decoder_description");
          [v25 audioStreamBasicDescription];
          uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
          uint64_t v27 = v87;
          long long v28 = v86;
          *(_OWORD *)(v26 + 32) = v85;
          *(_OWORD *)(v26 + 48) = v28;
          *(void *)(v26 + 64) = v27;

          v29 = [SiriTTSOspreyStreamingBeginResponse alloc];
          id v30 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
          v8 = [(SiriTTSOspreyStreamingBeginResponse *)v29 initWithOspreyBeginResponse:v30];

          uint64_t v31 = *(void *)(a1 + 48);
          goto LABEL_21;
        }
        uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v49)
        {
          v50 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v94 = *MEMORY[0x1E4F28568];
          __int16 v51 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
          v52 = objc_msgSend(v51, "error_str");
          v95 = v52;
          __int16 v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          v54 = [v50 errorWithDomain:@"OspreyTTSService" code:-1 userInfo:v53];
          (*(void (**)(uint64_t, void *))(v49 + 16))(v49, v54);

          uint64_t v55 = *(void *)(*(void *)(a1 + 64) + 8);
          uint64_t v56 = *(void **)(v55 + 40);
          *(void *)(v55 + 40) = 0;
        }
        v8 = TTSGetServiceLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v46 = [v4 contentAsOPTTSBeginTextToSpeechStreamingResponse];
          int v57 = objc_msgSend(v46, "error_code");
          uint64_t v58 = [*(id *)(a1 + 40) requestCreatedTime];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v57;
          *(_WORD *)&v99[4] = 2048;
          *(void *)&v99[6] = v58;
          v59 = "Osprey streaming received Begin response with non 200 status: %d, request_id: %llu";
          goto LABEL_37;
        }
        goto LABEL_39;
      case 2:
        v32 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
        int v33 = objc_msgSend(v32, "error_code");

        if (v33 == 200)
        {
          id v34 = TTSGetServiceLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            int v36 = objc_msgSend(v35, "current_pkt_number");
            uint64_t v37 = [*(id *)(a1 + 40) requestCreatedTime];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v99 = v36;
            *(_WORD *)&v99[4] = 2048;
            *(void *)&v99[6] = v37;
            _os_log_impl(&dword_19CD9A000, v34, OS_LOG_TYPE_DEFAULT, "Osprey streaming received Chunk response, pkt number: %d, request_id: %llu", buf, 0x12u);
          }
          if ([*(id *)(a1 + 40) serverLogs])
          {
            v38 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            +[SiriTTSOspreyStreamingPartialResponse processServerLogs:v38];
          }
          v39 = [SiriTTSOspreyStreamingPartialResponse alloc];
          id v40 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
          v8 = [(SiriTTSOspreyStreamingPartialResponse *)v39 initWithOspreyPartialResponse:v40];

          uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
          long long v42 = *(_OWORD *)(v41 + 32);
          long long v43 = *(_OWORD *)(v41 + 48);
          uint64_t v84 = *(void *)(v41 + 64);
          v83[0] = v42;
          v83[1] = v43;
          [v8 setAsbd:v83];
          uint64_t v31 = *(void *)(a1 + 56);
LABEL_21:
          (*(void (**)(uint64_t, NSObject *))(v31 + 16))(v31, v8);
        }
        else
        {
          uint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v60)
          {
            v61 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v92 = *MEMORY[0x1E4F28568];
            v62 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            v63 = objc_msgSend(v62, "error_str");
            v93 = v63;
            v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
            v65 = [v61 errorWithDomain:@"OspreyTTSService" code:-1 userInfo:v64];
            (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v65);

            uint64_t v66 = *(void *)(*(void *)(a1 + 64) + 8);
            v67 = *(void **)(v66 + 40);
            *(void *)(v66 + 40) = 0;
          }
          v8 = TTSGetServiceLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = [v4 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            int v68 = objc_msgSend(v46, "error_code");
            uint64_t v69 = [*(id *)(a1 + 40) requestCreatedTime];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v99 = v68;
            *(_WORD *)&v99[4] = 2048;
            *(void *)&v99[6] = v69;
            v59 = "Osprey streaming received Chunk response with non 200 status: %d, request_id: %llu";
            goto LABEL_37;
          }
        }
        goto LABEL_39;
      case 3:
        long long v44 = [v4 contentAsOPTTSFinalTextToSpeechStreamingResponse];
        int v45 = objc_msgSend(v44, "error_code");

        if (v45 == 200)
        {
          v8 = TTSGetServiceLog();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          uint64_t v46 = [v4 contentAsOPTTSFinalTextToSpeechStreamingResponse];
          int v47 = objc_msgSend(v46, "total_pkt_number");
          uint64_t v48 = [*(id *)(a1 + 40) requestCreatedTime];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v47;
          *(_WORD *)&v99[4] = 2048;
          *(void *)&v99[6] = v48;
          _os_log_impl(&dword_19CD9A000, v8, OS_LOG_TYPE_DEFAULT, "Osprey streaming received End response, total pkt: %d, request_id: %llu", buf, 0x12u);
          goto LABEL_38;
        }
        uint64_t v70 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v70)
        {
          v71 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v90 = *MEMORY[0x1E4F28568];
          v72 = [v4 contentAsOPTTSFinalTextToSpeechStreamingResponse];
          v73 = objc_msgSend(v72, "error_str");
          v91 = v73;
          v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
          v75 = [v71 errorWithDomain:@"OspreyTTSService" code:-1 userInfo:v74];
          (*(void (**)(uint64_t, void *))(v70 + 16))(v70, v75);

          uint64_t v76 = *(void *)(*(void *)(a1 + 64) + 8);
          v77 = *(void **)(v76 + 40);
          *(void *)(v76 + 40) = 0;
        }
        v8 = TTSGetServiceLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v46 = [v4 contentAsOPTTSFinalTextToSpeechStreamingResponse];
          int v78 = objc_msgSend(v46, "error_code");
          uint64_t v79 = [*(id *)(a1 + 40) requestCreatedTime];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v78;
          *(_WORD *)&v99[4] = 2048;
          *(void *)&v99[6] = v79;
          v59 = "Osprey streaming received End response with non 200 status: %d, request_id: %llu";
LABEL_37:
          _os_log_error_impl(&dword_19CD9A000, v8, OS_LOG_TYPE_ERROR, v59, buf, 0x12u);
LABEL_38:

          goto LABEL_39;
        }
        break;
      default:
        goto LABEL_40;
    }
    goto LABEL_39;
  }
  v12 = TTSGetServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v80 = objc_msgSend(*(id *)(a1 + 32), "stream_id");
    uint64_t v81 = [*(id *)(a1 + 40) requestCreatedTime];
    *(_DWORD *)buf = 138412546;
    *(void *)v99 = v80;
    *(_WORD *)&v99[8] = 2048;
    *(void *)&v99[10] = v81;
    _os_log_error_impl(&dword_19CD9A000, v12, OS_LOG_TYPE_ERROR, "Corrupted Osprey response, stream ID: %@, request_id: %llu", buf, 0x16u);
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v96 = *MEMORY[0x1E4F28568];
    v97 = @"Corrupted Osprey response.";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    v16 = [v14 errorWithDomain:@"OspreyTTSService" code:-1 userInfo:v15];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);

    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    v8 = *(NSObject **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
LABEL_39:
  }
LABEL_40:
}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_247(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TTSGetServiceLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) requestCreatedTime];
      int v11 = 138412546;
      uint64_t v12 = (uint64_t)v3;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      _os_log_error_impl(&dword_19CD9A000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@, request_id: %llu", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) requestCreatedTime];
    int v11 = 134217984;
    uint64_t v12 = v7;
    _os_log_impl(&dword_19CD9A000, v5, OS_LOG_TYPE_DEFAULT, "Osprey streaming invokes completion callback, request_id: %llu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

- (SiriTTSOspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriTTSOspreyChannel;
  uint64_t v8 = [(SiriTTSOspreyChannel *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F83B50]) initWithURL:v6 configuration:v7];
    grpcChannel = v8->_grpcChannel;
    v8->_grpcChannel = (OspreyChannel *)v9;

    [(OspreyChannel *)v8->_grpcChannel setUseCompression:0];
  }

  return v8;
}

@end