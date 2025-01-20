@interface SFSpeechSynthesisServerVoiceConfig
+ (id)getTtsServerEndpointByCluster:(id)a3 withServiceType:(id)a4;
- (BOOL)enableAuthentication;
- (BOOL)useBlazar;
- (NSString)ospreyEndpointUrl;
- (SFSpeechSynthesisServerVoiceConfig)initWithUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5;
@end

@implementation SFSpeechSynthesisServerVoiceConfig

- (void).cxx_destruct
{
}

- (BOOL)enableAuthentication
{
  return self->_enableAuthentication;
}

- (BOOL)useBlazar
{
  return self->_useBlazar;
}

- (NSString)ospreyEndpointUrl
{
  return self->_ospreyEndpointUrl;
}

- (SFSpeechSynthesisServerVoiceConfig)initWithUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSpeechSynthesisServerVoiceConfig;
  v10 = [(SFSpeechSynthesisServerVoiceConfig *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ospreyEndpointUrl, a3);
    v11->_useBlazar = a4;
    v11->_enableAuthentication = a5;
  }

  return v11;
}

+ (id)getTtsServerEndpointByCluster:(id)a3 withServiceType:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v35 = a4;
  v5 = SFSSGetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "GetTtsServerEndpoint, cluster=%@, serverType=%@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__493;
  v49 = __Block_byref_object_dispose__494;
  id v50 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v36 = objc_alloc_init(MEMORY[0x263F089E0]);
  v7 = NSURL;
  v8 = (void *)[[NSString alloc] initWithFormat:@"https://tts-service-tts-tts-proxy-server-dev.usmsc04.app.apple.com/proxy/get_all_tts_service?cluster=%@&service=%@", v34, v35];
  id v9 = [v7 URLWithString:v8];
  [v36 setURL:v9];

  [v36 setHTTPMethod:@"GET"];
  v10 = (void *)MEMORY[0x263F08BF8];
  v11 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  v33 = [v10 sessionWithConfiguration:v11];

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __84__SFSpeechSynthesisServerVoiceConfig_getTtsServerEndpointByCluster_withServiceType___block_invoke;
  v41[3] = &unk_26489E958;
  v43 = buf;
  dispatch_semaphore_t dsema = v6;
  dispatch_semaphore_t v42 = dsema;
  v12 = [v33 dataTaskWithRequest:v36 completionHandler:v41];
  [v12 resume];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = *(id *)(*(void *)&buf[8] + 40);
    id v14 = (id)[v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v18 = [*(id *)(*(void *)&buf[8] + 40) objectForKey:v17];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v20 = [*(id *)(*(void *)&buf[8] + 40) objectForKey:v17];
            uint32_t v21 = arc4random_uniform([v20 count]);

            v22 = [*(id *)(*(void *)&buf[8] + 40) objectForKey:v17];
            v23 = [v22 objectAtIndexedSubscript:v21];

            v24 = SFSSGetLogObject();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v44 = 138412290;
              v45 = v23;
              _os_log_impl(&dword_22B575000, v24, OS_LOG_TYPE_INFO, "Selected endpoint=%@", v44, 0xCu);
            }

            v25 = [v23 componentsSeparatedByString:@":"];
            if ((unint64_t)[v25 count] > 1)
            {
              v26 = NSString;
              v27 = [v25 objectAtIndexedSubscript:0];
              v28 = [v25 objectAtIndexedSubscript:1];
              v29 = [v26 stringWithFormat:@"http://%@:%@", v27, v28];

              v30 = SFSSGetLogObject();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v44 = 138412290;
                v45 = v29;
                _os_log_impl(&dword_22B575000, v30, OS_LOG_TYPE_INFO, "Selected URL=%@", v44, 0xCu);
              }

              id v14 = v29;
              id v13 = v14;
              goto LABEL_21;
            }
          }
        }
        id v14 = (id)[v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    id v14 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

void __84__SFSpeechSynthesisServerVoiceConfig_getTtsServerEndpointByCluster_withServiceType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v6 = a4;
  if (v6)
  {
    v7 = SFSSGetLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_error_impl(&dword_22B575000, v7, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
  }
  else
  {
    id v16 = 0;
    uint64_t v8 = [MEMORY[0x263F08900] JSONObjectWithData:a2 options:0 error:&v16];
    v7 = v16;
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = SFSSGetLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_22B575000, v11, OS_LOG_TYPE_INFO, "jsonResponse: %@", buf, 0xCu);
    }

    if (v7)
    {
      id v13 = SFSSGetLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_error_impl(&dword_22B575000, v13, OS_LOG_TYPE_ERROR, "jsonError: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end