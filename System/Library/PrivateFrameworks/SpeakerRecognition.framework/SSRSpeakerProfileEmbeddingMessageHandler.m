@interface SSRSpeakerProfileEmbeddingMessageHandler
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (SSRSpeakerProfileEmbeddingMessageHandler)initWithConnection:(id)a3;
- (SSRSpeakerProfileEmbeddingServiceDelegate)listenerDelegate;
- (SSRVoiceProfileManager)voiceProfileManager;
- (id)errorHandler;
- (void)refreshEmbeddingsforLanguageCode:(id)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setListenerDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVoiceProfileManager:(id)a3;
- (void)setupListenerDelegate:(id)a3;
- (void)speakerProfileUpdated:(id)a3;
@end

@implementation SSRSpeakerProfileEmbeddingMessageHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_listenerDelegate, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setListenerDelegate:(id)a3
{
}

- (SSRSpeakerProfileEmbeddingServiceDelegate)listenerDelegate
{
  return self->_listenerDelegate;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)refreshEmbeddingsforLanguageCode:(id)a3 withCompletion:(id)a4
{
  v69[3] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v34 = (void (**)(id, void))v6;
    v37 = [MEMORY[0x263EFF980] array];
    uint64_t v8 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:@"com.apple.siri" withLocale:v38];
    v36 = (void *)v8;
    if (v8)
    {
      v68[0] = @"SSRSpeakerRecognitionLocale";
      v68[1] = @"SSRSpeakerRecognitionProfileArray";
      v69[0] = v38;
      v69[1] = v8;
      v68[2] = @"SSRSpeakerRecognitionUsePayloadProfile";
      v69[2] = MEMORY[0x263EFFA88];
      v33 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];
      v9 = [MEMORY[0x263EFF9A0] dictionary];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v10 = v36;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v58 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            v15 = [v14 siriProfileId];
            v16 = [v14 profileID];
            [v9 setValue:v15 forKey:v16];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v67 count:16];
        }
        while (v11);
      }

      v32 = [[SSRSpeakerRecognitionContext alloc] initWithVoiceRecognitionContext:v33 error:0];
      v17 = [(SSRSpeakerRecognitionContext *)v32 modelsContext];
      v18 = +[SSRUtils stringForSpeakerRecognizerType:1];
      v31 = [v17 objectForKeyedSubscript:v18];

      if ([MEMORY[0x263F380D0] isExclaveHardware]) {
        [v31 voiceProfilesModelFilePathsExclave];
      }
      else {
      v40 = [v31 voiceProfilesModelFilePaths];
      }
      if (!v40 || ![v40 count])
      {
        v30 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[SSRSpeakerProfileEmbeddingMessageHandler refreshEmbeddingsforLanguageCode:withCompletion:]";
          _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s model context is nil", (uint8_t *)&buf, 0xCu);
        }
        v34[2](v34, 0);

        goto LABEL_34;
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      long long v53 = 0u;
      id obj = [v40 allKeys];
      uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (v21)
      {
        uint64_t v39 = *(void *)v54;
LABEL_21:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v53 + 1) + 8 * v22);
          v24 = objc_msgSend(v40, "objectForKeyedSubscript:", v23, v31);
          v25 = NSURL;
          v26 = [v24 path];
          v27 = [v25 fileURLWithPath:v26];

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v62 = 0x3032000000;
          v63 = __Block_byref_object_copy__3793;
          v64 = __Block_byref_object_dispose__3794;
          id v65 = 0;
          uint64_t v47 = 0;
          v48 = &v47;
          uint64_t v49 = 0x3032000000;
          v50 = __Block_byref_object_copy__3793;
          v51 = __Block_byref_object_dispose__3794;
          id v52 = 0;
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __92__SSRSpeakerProfileEmbeddingMessageHandler_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke;
          v41[3] = &unk_2644293F0;
          id v28 = v27;
          id v42 = v28;
          p_long long buf = &buf;
          id v43 = v9;
          uint64_t v44 = v23;
          v46 = &v47;
          +[SSRSpeakerProfileEmbeddingExtractor extractProfileData:v28 completion:v41];
          uint64_t v29 = v48[5];
          if (!v29) {
            [v37 addObject:*(void *)(*((void *)&buf + 1) + 40)];
          }

          _Block_object_dispose(&v47, 8);
          _Block_object_dispose(&buf, 8);

          if (v29) {
            break;
          }
          if (v21 == ++v22)
          {
            uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
            if (v21) {
              goto LABEL_21;
            }
            break;
          }
        }
      }
    }
    else
    {
      v20 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[SSRSpeakerProfileEmbeddingMessageHandler refreshEmbeddingsforLanguageCode:withCompletion:]";
        _os_log_debug_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_DEBUG, "%s voice profiles are nil", (uint8_t *)&buf, 0xCu);
      }
    }
    ((void (**)(id, void *))v34)[2](v34, v37);
LABEL_34:

    v7 = v34;
    goto LABEL_35;
  }
  v19 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SSRSpeakerProfileEmbeddingMessageHandler refreshEmbeddingsforLanguageCode:withCompletion:]";
    _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s completion block is nil", (uint8_t *)&buf, 0xCu);
  }
LABEL_35:
}

void __92__SSRSpeakerProfileEmbeddingMessageHandler_refreshEmbeddingsforLanguageCode_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v23 = 136315394;
    v24 = "-[SSRSpeakerProfileEmbeddingMessageHandler refreshEmbeddingsforLanguageCode:withCompletion:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Extracting profile embeddings from: %@", (uint8_t *)&v23, 0x16u);
  }
  v13 = (void *)MEMORY[0x263EFF8F8];
  id v14 = v9;
  v15 = objc_msgSend(v13, "dataWithBytes:length:", objc_msgSend(v14, "bytes"), 4 * a3 * (unint64_t)a4);
  v16 = [SSRSpeakerProfileEmbedding alloc];
  v17 = [*(id *)(a1 + 40) valueForKey:*(void *)(a1 + 48)];
  uint64_t v18 = [(SSRSpeakerProfileEmbedding *)v16 initWithSiriSharedUserId:v17 embeddings:v15 numEmbedding:a3 dimension:a4 speakerRecognizerType:1];
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v10;
}

- (void)speakerProfileUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SSRSpeakerProfileEmbeddingMessageHandler_speakerProfileUpdated___block_invoke;
  v7[3] = &unk_26442A138;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __66__SSRSpeakerProfileEmbeddingMessageHandler_speakerProfileUpdated___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SSRSpeakerProfileEmbeddingMessageHandler speakerProfileUpdated:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_INFO, "%s Profile embeddings updated for languageCode: %@", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) speakerProfileEmbeddingsUpdated:*(void *)(a1 + 32)];
}

- (void)setupListenerDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__SSRSpeakerProfileEmbeddingMessageHandler_setupListenerDelegate___block_invoke;
  v7[3] = &unk_26442A138;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__SSRSpeakerProfileEmbeddingMessageHandler_setupListenerDelegate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
    int v4 = 136315394;
    int v5 = "-[SSRSpeakerProfileEmbeddingMessageHandler setupListenerDelegate:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s _listenerDelegate = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (SSRSpeakerProfileEmbeddingMessageHandler)initWithConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSRSpeakerProfileEmbeddingMessageHandler;
  __int16 v6 = [(SSRSpeakerProfileEmbeddingMessageHandler *)&v14 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = +[SSRVoiceProfileManager sharedInstance];
    voiceProfileManager = v7->_voiceProfileManager;
    v7->_voiceProfileManager = (SSRVoiceProfileManager *)v8;

    [(SSRVoiceProfileManager *)v7->_voiceProfileManager setDelegate:v7];
    dispatch_queue_t v10 = dispatch_queue_create("SSRSpeakerProfileEmbeddingMessageHandler", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v16 = "-[SSRSpeakerProfileEmbeddingMessageHandler initWithConnection:]";
      _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v7;
}

@end