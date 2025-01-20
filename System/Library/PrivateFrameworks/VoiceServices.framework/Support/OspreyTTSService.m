@interface OspreyTTSService
+ (id)ospreyServiceEndpointURL;
+ (id)sharedInstance;
- (NSString)deviceID;
- (OspreyTTSService)init;
- (void)roundTripTTS:(id)a3 responseHandler:(id)a4;
- (void)setDeviceID:(id)a3;
- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 endHandler:(id)a6 completion:(id)a7;
@end

@implementation OspreyTTSService

- (void).cxx_destruct
{
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 endHandler:(id)a6 completion:(id)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v46 = a6;
  id v15 = a7;
  v43 = v13;
  v44 = v15;
  v45 = v14;
  v16 = objc_alloc_init(OPTTSMutableStartTextToSpeechStreamingRequest);
  v42 = self;
  v17 = [(OspreyTTSService *)self deviceID];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setSpeech_id:v17];

  v18 = [MEMORY[0x263F08C38] UUID];
  v19 = [v18 UUIDString];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setSession_id:v19];

  v20 = [v12 language];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setLanguage:v20];

  v21 = objc_msgSend(v12, "voice_name");
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setVoice_name:v21];

  v22 = [v12 gender];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setGender:v22];

  v23 = [v12 text];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setText:v23];

  -[OPTTSMutableStartTextToSpeechStreamingRequest setAudio_type:](v16, "setAudio_type:", objc_msgSend(v12, "audio_type"));
  -[OPTTSMutableStartTextToSpeechStreamingRequest setEnable_word_timing_info:](v16, "setEnable_word_timing_info:", objc_msgSend(v12, "enable_word_timing_info"));
  v24 = [MEMORY[0x263F08C38] UUID];
  v25 = [v24 UUIDString];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setStream_id:v25];

  v26 = objc_msgSend(v12, "meta_info");
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setMeta_info:v26];

  v27 = +[VSSiriServerConfiguration defaultConfig];
  v28 = [v27 experimentIdentifier];

  if (v28)
  {
    v29 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    [(OPTTSMutableTextToSpeechRequestExperiment *)v29 setExperiment_identifier:v28];
    [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 setExperiment:v29];
  }
  v30 = objc_alloc_init(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest);
  [(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *)v30 setContent_type:1];
  [(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *)v30 setContentAsOPTTSStartTextToSpeechStreamingRequest:v16];
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__2041;
  v56[4] = __Block_byref_object_dispose__2042;
  id v57 = (id)MEMORY[0x22A667CC0](v15);
  v31 = VSGetLogDefault();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 speech_id];
    v33 = [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 session_id];
    v34 = [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 stream_id];
    v35 = [(OPTTSMutableStartTextToSpeechStreamingRequest *)v16 meta_info];
    v36 = objc_msgSend(v35, "app_id");
    *(_DWORD *)buf = 138413058;
    v59 = v32;
    __int16 v60 = 2112;
    v61 = v33;
    __int16 v62 = 2112;
    v63 = v34;
    __int16 v64 = 2112;
    v65 = v36;
    _os_log_impl(&dword_226CB1000, v31, OS_LOG_TYPE_DEFAULT, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', app_id '%@'", buf, 0x2Au);
  }
  v37 = [(OPTTSTextToSpeechRouterStreamingStreamingRequest *)v30 flatbuffData];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v54[3] = &unk_2647DCB80;
  v55 = v16;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_2;
  v48[3] = &unk_2647DCBD0;
  v38 = v55;
  v49 = v38;
  v53 = v56;
  id v39 = v43;
  id v50 = v39;
  id v40 = v45;
  id v51 = v40;
  id v41 = v46;
  id v52 = v41;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_58;
  v47[3] = &unk_2647DCDF0;
  v47[4] = v56;
  [(OspreyChannel *)v42 serverStreamingRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming" requestData:v37 requestBuilder:v54 streamingResponseHandler:v48 completion:v47];

  _Block_object_dispose(v56, 8);
}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "session_id");
  [v4 setClientTraceIdentifier:v3];
}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [[OPTTSTextToSpeechRouterStreamingStreamingResponse alloc] initAndVerifyWithFlatbuffData:v3];
  v5 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "content_type"))
    {
      case 0:
        v6 = VSGetLogDefault();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[OspreyTTSService streamTTS:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
          _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
        }

        v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:MEMORY[0x263EFFA78]];
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v8)
        {
          (*(void (**)(uint64_t, NSObject *))(v8 + 16))(v8, v7);
          uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = 0;
        }
        goto LABEL_35;
      case 1:
        v17 = [v5 contentAsOPTTSBeginTextToSpeechStreamingResponse];
        int v18 = objc_msgSend(v17, "error_code");

        if (v18 == 200)
        {
          v19 = VSGetLogDefault();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = [v5 contentAsOPTTSBeginTextToSpeechStreamingResponse];
            objc_msgSend(v20, "stream_id");
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v73 = v21;
            _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);
          }
          uint64_t v22 = *(void *)(a1 + 40);
          v7 = [v5 contentAsOPTTSBeginTextToSpeechStreamingResponse];
          (*(void (**)(uint64_t, NSObject *))(v22 + 16))(v22, v7);
        }
        else
        {
          uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v33)
          {
            v34 = (void *)MEMORY[0x263F087E8];
            uint64_t v68 = *MEMORY[0x263F08320];
            v35 = [v5 contentAsOPTTSBeginTextToSpeechStreamingResponse];
            v36 = objc_msgSend(v35, "error_str");
            v69 = v36;
            v37 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
            v38 = [v34 errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:v37];
            (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v38);

            uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
            id v40 = *(void **)(v39 + 40);
            *(void *)(v39 + 40) = 0;
          }
          v7 = VSGetLogDefault();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            id v41 = [v5 contentAsOPTTSBeginTextToSpeechStreamingResponse];
            int v42 = objc_msgSend(v41, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v42;
            _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);
          }
        }
        goto LABEL_35;
      case 2:
        v23 = [v5 contentAsOPTTSPartialTextToSpeechStreamingResponse];
        int v24 = objc_msgSend(v23, "error_code");

        if (v24 == 200)
        {
          v25 = VSGetLogDefault();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = [v5 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = objc_msgSend(v26, "current_pkt_number");
            _os_log_impl(&dword_226CB1000, v25, OS_LOG_TYPE_INFO, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);
          }
          uint64_t v27 = *(void *)(a1 + 48);
          v7 = [v5 contentAsOPTTSPartialTextToSpeechStreamingResponse];
          (*(void (**)(uint64_t, NSObject *))(v27 + 16))(v27, v7);
        }
        else
        {
          uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v43)
          {
            v44 = (void *)MEMORY[0x263F087E8];
            uint64_t v66 = *MEMORY[0x263F08320];
            v45 = [v5 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            id v46 = objc_msgSend(v45, "error_str");
            v67 = v46;
            v47 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
            v48 = [v44 errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:v47];
            (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v48);

            uint64_t v49 = *(void *)(*(void *)(a1 + 64) + 8);
            id v50 = *(void **)(v49 + 40);
            *(void *)(v49 + 40) = 0;
          }
          v7 = VSGetLogDefault();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            id v51 = [v5 contentAsOPTTSPartialTextToSpeechStreamingResponse];
            int v52 = objc_msgSend(v51, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v52;
            _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);
          }
        }
        goto LABEL_35;
      case 3:
        v28 = [v5 contentAsOPTTSFinalTextToSpeechStreamingResponse];
        int v29 = objc_msgSend(v28, "error_code");

        if (v29 == 200)
        {
          v30 = VSGetLogDefault();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = [v5 contentAsOPTTSFinalTextToSpeechStreamingResponse];
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = objc_msgSend(v31, "total_pkt_number");
            _os_log_impl(&dword_226CB1000, v30, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);
          }
          uint64_t v32 = *(void *)(a1 + 56);
          v7 = [v5 contentAsOPTTSFinalTextToSpeechStreamingResponse];
          (*(void (**)(uint64_t, NSObject *))(v32 + 16))(v32, v7);
        }
        else
        {
          uint64_t v53 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v53)
          {
            v54 = (void *)MEMORY[0x263F087E8];
            v55 = objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse", *MEMORY[0x263F08320]);
            v56 = objc_msgSend(v55, "error_str");
            v65 = v56;
            id v57 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
            v58 = [v54 errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:v57];
            (*(void (**)(uint64_t, void *))(v53 + 16))(v53, v58);

            uint64_t v59 = *(void *)(*(void *)(a1 + 64) + 8);
            __int16 v60 = *(void **)(v59 + 40);
            *(void *)(v59 + 40) = 0;
          }
          v7 = VSGetLogDefault();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            __int16 v62 = [v5 contentAsOPTTSFinalTextToSpeechStreamingResponse];
            int v63 = objc_msgSend(v62, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v63;
            _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);
          }
        }
        goto LABEL_35;
      default:
        break;
    }
  }
  else
  {
    v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "stream_id");
      v61 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v61;
      _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Corrupted Osprey response, stream ID: %@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v12)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v70 = *MEMORY[0x263F08320];
      v71 = @"Corrupted Osprey response.";
      id v14 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      id v15 = [v13 errorWithDomain:@"ServerTTSErrorDomain" code:600 userInfo:v14];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      v7 = *(NSObject **)(v16 + 40);
      *(void *)(v16 + 40) = 0;
LABEL_35:
    }
  }
}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", buf, 0xCu);
    }

    v6 = (void *)MEMORY[0x263F087E8];
    v7 = objc_msgSend(v4, "localizedDescription", *MEMORY[0x263F08320]);
    id v15 = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v9 = [v6 errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:v8];

    v10 = (void *)v9;
  }
  else
  {
    v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", buf, 2u);
    }
    v10 = 0;
  }

  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
}

- (void)roundTripTTS:(id)a3 responseHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(OspreyTTSService *)self deviceID];
  objc_msgSend(v6, "setSpeech_id:", v8);

  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  objc_msgSend(v6, "setSession_id:", v10);

  uint64_t v11 = +[VSSiriServerConfiguration defaultConfig];
  uint64_t v12 = [v11 experimentIdentifier];

  if (v12)
  {
    id v13 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    [(OPTTSMutableTextToSpeechRequestExperiment *)v13 setExperiment_identifier:v12];
    [v6 setExperiment:v13];
  }
  uint64_t v14 = VSGetLogDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_msgSend(v6, "speech_id");
    uint64_t v16 = objc_msgSend(v6, "session_id");
    v17 = objc_msgSend(v6, "meta_info");
    uint64_t v18 = objc_msgSend(v17, "app_id");
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    int v29 = v16;
    __int16 v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_DEFAULT, "Sent Osprey grpc request with speech_id '%@', session_id '%@', app_id '%@'", buf, 0x20u);
  }
  v19 = [v6 flatbuffData];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke;
  v24[3] = &unk_2647DCB80;
  id v20 = v6;
  id v25 = v20;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke_2;
  v22[3] = &unk_2647DCBA8;
  id v21 = v7;
  id v23 = v21;
  [(OspreyChannel *)self unaryRequestWithMethodName:@"/siri.speech.qss_fb.Blazar/TextToSpeechRouter" requestData:v19 requestBuilder:v24 responseHandler:v22];
}

void __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "session_id");
  [v4 setClientTraceIdentifier:v3];
}

void __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5 || ![v5 length])
    {
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      int v29 = @"Empty data";
      uint64_t v11 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      uint64_t v9 = [v10 errorWithDomain:@"ServerTTSErrorDomain" code:600 userInfo:v11];

      uint64_t v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v31 = "-[OspreyTTSService roundTripTTS:responseHandler:]_block_invoke";
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        _os_log_error_impl(&dword_226CB1000, v12, OS_LOG_TYPE_ERROR, "%s, Error: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_17;
    }
    uint64_t v8 = [[OPTTSTextToSpeechResponse alloc] initWithFlatbuffData:v5];
    uint64_t v9 = v8;
    if (v8)
    {
      if (![(OPTTSTextToSpeechResponse *)v8 error_code]
        || objc_msgSend(v9, "error_code") == 200)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_17:

        goto LABEL_18;
      }
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      uint64_t v18 = NSString;
      uint64_t v19 = objc_msgSend(v9, "error_code");
      id v20 = objc_msgSend(v9, "error_str");
      id v21 = [v18 stringWithFormat:@"Error %d in response: %@", v19, v20];
      id v25 = v21;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v15 = [v17 errorWithDomain:@"ServerTTSErrorDomain" code:601 userInfo:v22];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      uint64_t v27 = @"Invalid data";
      uint64_t v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v15 = [v13 errorWithDomain:@"ServerTTSErrorDomain" code:600 userInfo:v14];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    goto LABEL_17;
  }
  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = [v6 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v31 = "-[OspreyTTSService roundTripTTS:responseHandler:]_block_invoke_2";
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "%s, Error: %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_18:
}

- (OspreyTTSService)init
{
  id v3 = +[OspreyTTSService ospreyServiceEndpointURL];
  id v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v4 setTimeoutIntervalForRequest:5.0];
  [v4 setTimeoutIntervalForResource:60.0];
  id v5 = [NSURL URLWithString:v3];
  v11.receiver = self;
  v11.super_class = (Class)OspreyTTSService;
  id v6 = [(OspreyChannel *)&v11 initWithURL:v5 configuration:v4];

  if (v6)
  {
    [(OspreyChannel *)v6 setUseCompression:0];
    id v7 = [MEMORY[0x263F84E68] defaultInstance];
    uint64_t v8 = [v7 deviceUUID];
    deviceID = v6->_deviceID;
    v6->_deviceID = (NSString *)v8;
  }
  return v6;
}

+ (id)sharedInstance
{
  if (+[OspreyTTSService sharedInstance]::onceToken != -1) {
    dispatch_once(&+[OspreyTTSService sharedInstance]::onceToken, &__block_literal_global_2089);
  }
  v2 = (void *)+[OspreyTTSService sharedInstance]::__sharedInstance;
  return v2;
}

uint64_t __34__OspreyTTSService_sharedInstance__block_invoke()
{
  +[OspreyTTSService sharedInstance]::__sharedInstance = objc_alloc_init(OspreyTTSService);
  return MEMORY[0x270F9A758]();
}

+ (id)ospreyServiceEndpointURL
{
  v2 = [MEMORY[0x263F84E90] standardInstance];
  id v3 = [v2 ospreyEndpointURL];

  if ([v3 length])
  {
    id v4 = v3;
  }
  else if ([MEMORY[0x263F84EB8] isSeedBuild])
  {
    id v4 = @"https://seed-dejavu.siri.apple.com";
  }
  else if ([MEMORY[0x263F84EB8] isInternalBuild])
  {
    id v4 = @"https://carry-dejavu.siri.apple.com";
  }
  else
  {
    id v4 = @"https://dejavu.apple.com";
  }

  return v4;
}

@end