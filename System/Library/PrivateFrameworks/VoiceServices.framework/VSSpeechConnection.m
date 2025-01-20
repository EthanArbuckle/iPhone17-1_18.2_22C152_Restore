@interface VSSpeechConnection
- (BOOL)isSystemSpeaking;
- (BOOL)isSystemSpeakingOnBehalfOfCurrentConnection;
- (BOOL)keepActive;
- (BOOL)queryPhaticCapabilityWithRequest:(id)a3;
- (NSString)identifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)threadSafeQueue;
- (VSSpeechConnection)init;
- (VSSpeechConnectionDelegate)delegate;
- (VSSpeechConnectionDelegateWrapper)delegateWrapper;
- (id)_remoteObject;
- (id)_remoteObjectSync;
- (id)_remoteObjectWithErrorHandler:(id)a3;
- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4;
- (id)availableVoicesForLanguageCode:(id)a3;
- (id)currentAudioRequest;
- (id)currentRequest;
- (void)_connectionInvalidated;
- (void)beginAudioPowerUpdateWithReply:(id)a3;
- (void)cachePresynthesizedAudioRequest:(id)a3;
- (void)cleanUnusedAssets:(id)a3;
- (void)continueSpeechRequest:(id)a3;
- (void)dealloc;
- (void)endAudioPowerUpdate;
- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4;
- (void)forwardStreamObject:(id)a3;
- (void)getAllVoiceSubscriptionsWithReply:(id)a3;
- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4;
- (void)getLocalVoiceResources:(id)a3;
- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5;
- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8;
- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4;
- (void)invokeDaemon:(id)a3;
- (void)killDaemon;
- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4;
- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateWrapper:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeepActive:(BOOL)a3;
- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5;
- (void)setThreadSafeQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5;
- (void)startPresynthesizedAudioRequest:(id)a3;
- (void)startSpeechRequest:(id)a3;
- (void)startSynthesisRequest:(id)a3;
- (void)stopPresynthesizedAudioRequest:(id)a3;
- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4;
- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4;
- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4;
@end

@implementation VSSpeechConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafeQueue, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setThreadSafeQueue:(id)a3
{
}

- (OS_dispatch_queue)threadSafeQueue
{
  return self->_threadSafeQueue;
}

- (void)setDelegateWrapper:(id)a3
{
}

- (VSSpeechConnectionDelegateWrapper)delegateWrapper
{
  return self->_delegateWrapper;
}

- (VSSpeechConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechConnectionDelegate *)WeakRetained;
}

- (BOOL)keepActive
{
  return self->_keepActive;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)killDaemon
{
  id v3 = [(VSSpeechConnection *)self xpcConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 killDaemon];
}

- (void)invokeDaemon:(id)a3
{
  id v4 = a3;
  id v6 = [(VSSpeechConnection *)self xpcConnection];
  v5 = [v6 remoteObjectProxy];
  [v5 invokeDaemon:v4];
}

- (void)forwardStreamObject:(id)a3
{
  id v4 = a3;
  id v6 = [(VSSpeechConnection *)self xpcConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_204];
  [v5 forwardStreamObject:v4];
}

void __42__VSSpeechConnection_forwardStreamObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 136315394;
    id v6 = "-[VSSpeechConnection forwardStreamObject:]_block_invoke";
    __int16 v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "%s, Error: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  id v14 = a8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__VSSpeechConnection_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke;
  v19[3] = &unk_2640E8C60;
  id v20 = v14;
  id v15 = v14;
  id v16 = a4;
  id v17 = a3;
  v18 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v19];
  [v18 getVoiceInfoForLanguageCode:v17 name:v16 footprint:a5 gender:a6 type:a7 reply:v15];
}

void __83__VSSpeechConnection_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't get voice info: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__VSSpeechConnection_getVoiceResourceForLanguage_reply___block_invoke;
  v10[3] = &unk_2640E8C60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v10];
  [v9 getVoiceResourceForLanguage:v8 reply:v7];
}

void __56__VSSpeechConnection_getVoiceResourceForLanguage_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't get VoiceResource: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getAllVoiceSubscriptionsWithReply:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__VSSpeechConnection_getAllVoiceSubscriptionsWithReply___block_invoke;
  v7[3] = &unk_2640E8C60;
  id v8 = v4;
  id v5 = v4;
  int v6 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v7];
  [v6 getAllVoiceSubscriptionsWithReply:v5];
}

void __56__VSSpeechConnection_getAllVoiceSubscriptionsWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't get all subscribed voice assets: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__VSSpeechConnection_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply___block_invoke;
  v13[3] = &unk_2640E8C60;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  v12 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v13];
  [v12 getSubscribedVoiceAssetsWithClientID:v11 forAccessoryID:v10 reply:v9];
}

void __80__VSSpeechConnection_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't get subscribed voice assets: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VSSpeechConnection *)self _remoteObject];
  [v8 triggerCellularDownloadedVoiceAssets:v7 withClientID:v6];
}

- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VSSpeechConnection *)self _remoteObject];
  [v11 setSubscribedVoiceAssets:v10 withClientID:v9 forAccessoryID:v8];
}

- (void)getLocalVoiceResources:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__VSSpeechConnection_getLocalVoiceResources___block_invoke;
  v7[3] = &unk_2640E8C60;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v7];
  [v6 getLocalVoiceResourcesReply:v5];
}

uint64_t __45__VSSpeechConnection_getLocalVoiceResources___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__VSSpeechConnection_getLocalVoiceAssetsForLanguage_reply___block_invoke;
  v10[3] = &unk_2640E8C60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v10];
  [v9 getLocalVoicesForLanguage:v8 reply:v7];
}

uint64_t __59__VSSpeechConnection_getLocalVoiceAssetsForLanguage_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)cleanUnusedAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 cleanUnusedAssets:v4];
}

- (void)continueSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 continueSpeechRequest:v4];
}

- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VSSpeechConnection *)self _remoteObject];
  [v7 pauseSpeechRequest:v6 atMark:a4];
}

- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VSSpeechConnection *)self _remoteObject];
  [v7 stopSpeechRequest:v6 atMark:a4];
}

- (void)startSynthesisRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 startSynthesisRequest:v4];

  id v8 = [(VSSpeechConnection *)self delegateWrapper];
  id v6 = [v8 concurrentSynthesisRequests];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "pointer"));
  [v6 setObject:v4 forKey:v7];
}

- (void)stopPresynthesizedAudioRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 stopPresynthesizedAudioRequest:v4];
}

- (void)cachePresynthesizedAudioRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObjectSync];
  [v5 cachePresynthesizedAudioRequest:v4];
}

- (void)startPresynthesizedAudioRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 startPresynthesizedAudioRequest:v4];

  if ([v4 enqueue])
  {
    id v6 = [(VSSpeechConnection *)self delegateWrapper];
    id v7 = [v6 audioRequests];
    [v7 addObject:v4];
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v8 = [(VSSpeechConnection *)self delegateWrapper];
    id v9 = [v8 audioRequests];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__VSSpeechConnection_startPresynthesizedAudioRequest___block_invoke;
    v12[3] = &unk_2640E8D00;
    v12[4] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];

    id v10 = [(VSSpeechConnection *)self delegateWrapper];
    id v11 = [v10 audioRequests];
    [v11 insertObject:v4 atIndex:v14[3]];

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __54__VSSpeechConnection_startPresynthesizedAudioRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  uint64_t result = [a2 enqueue];
  *a4 = result;
  return result;
}

- (void)startSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 startSpeechRequest:v4 reply:&__block_literal_global_202];

  if ([v4 shouldWaitCurrentSpeaking])
  {
    id v6 = [(VSSpeechConnection *)self delegateWrapper];
    id v7 = [v6 requests];
    [v7 addObject:v4];
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v8 = [(VSSpeechConnection *)self delegateWrapper];
    id v9 = [v8 requests];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__VSSpeechConnection_startSpeechRequest___block_invoke_2;
    v12[3] = &unk_2640E8CD8;
    v12[4] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];

    id v10 = [(VSSpeechConnection *)self delegateWrapper];
    id v11 = [v10 requests];
    [v11 insertObject:v4 atIndex:v14[3]];

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __41__VSSpeechConnection_startSpeechRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  uint64_t result = [a2 shouldWaitCurrentSpeaking];
  *a4 = result;
  return result;
}

- (void)endAudioPowerUpdate
{
  id v2 = [(VSSpeechConnection *)self _remoteObject];
  [v2 endAudioPowerUpdate];
}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self _remoteObject];
  [v5 beginAudioPowerUpdateWithReply:v4];
}

- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__VSSpeechConnection_startPhonemesRequest_phonemeSystem_reply___block_invoke;
  v12[3] = &unk_2640E8C60;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v12];
  [v11 startPhonemesRequest:v10 phonemeSystem:a4 reply:v9];
}

void __63__VSSpeechConnection_startPhonemesRequest_phonemeSystem_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't start PhonemesRequest: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isSystemSpeakingOnBehalfOfCurrentConnection
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v3 = [(VSSpeechConnection *)self currentRequest];
  if (v3)
  {
  }
  else
  {
    id v4 = [(VSSpeechConnection *)self currentAudioRequest];

    if (!v4)
    {
      BOOL v7 = 0;
      goto LABEL_5;
    }
  }
  int v5 = [(VSSpeechConnection *)self xpcConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_196];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke_197;
  v9[3] = &unk_2640E8C88;
  v9[4] = &v10;
  [v6 getSpeechIsActiveForConnectionReply:v9];

  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
LABEL_5:
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke_197(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __65__VSSpeechConnection_isSystemSpeakingOnBehalfOfCurrentConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[VSSpeechConnection isSystemSpeakingOnBehalfOfCurrentConnection]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)isSystemSpeaking
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(VSSpeechConnection *)self xpcConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_193_3215];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__VSSpeechConnection_isSystemSpeaking__block_invoke_194;
  v5[3] = &unk_2640E8C88;
  v5[4] = &v6;
  [v3 getSpeechIsActiveReply:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__VSSpeechConnection_isSystemSpeaking__block_invoke_194(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __38__VSSpeechConnection_isSystemSpeaking__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[VSSpeechConnection isSystemSpeaking]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }
}

- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3218;
  id v17 = __Block_byref_object_dispose__3219;
  id v18 = 0;
  uint64_t v8 = [(VSSpeechConnection *)self xpcConnection];
  char v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_190];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke_191;
  v12[3] = &unk_2640E8CB0;
  void v12[4] = &v13;
  [v9 getFootprintsForVoiceName:v6 languageCode:v7 reply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke_191(uint64_t a1, void *a2)
{
}

void __63__VSSpeechConnection_availableFootprintsForVoice_languageCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error %@ asking for voice footprints", (uint8_t *)&v4, 0xCu);
  }
}

- (id)availableVoicesForLanguageCode:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3218;
  id v14 = __Block_byref_object_dispose__3219;
  id v15 = 0;
  id v5 = [(VSSpeechConnection *)self xpcConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_186];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke_187;
  v9[3] = &unk_2640E8CB0;
  v9[4] = &v10;
  [v6 getVoiceNamesForLanguage:v4 reply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke_187(uint64_t a1, void *a2)
{
}

void __53__VSSpeechConnection_availableVoicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error %@ asking for voices", (uint8_t *)&v4, 0xCu);
  }
}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(VSSpeechConnection *)self xpcConnection];
  uint64_t v8 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_184];
  [v8 estimateDurationWithRequest:v7 reply:v6];
}

void __56__VSSpeechConnection_estimateDurationWithRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = [v2 description];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error estimateDurationWithRequest:reply: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)queryPhaticCapabilityWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  int v5 = [(VSSpeechConnection *)self xpcConnection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_180];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke_181;
  v8[3] = &unk_2640E8C88;
  v8[4] = &v9;
  [v6 queryPhaticCapabilityWithRequest:v4 reply:v8];

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v5;
}

uint64_t __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke_181(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __55__VSSpeechConnection_queryPhaticCapabilityWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    int v5 = "-[VSSpeechConnection queryPhaticCapabilityWithRequest:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error at %s , %@ ", (uint8_t *)&v4, 0x16u);
  }
}

- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__VSSpeechConnection_prewarmIfNeededWithRequest_reply___block_invoke;
  v10[3] = &unk_2640E8C60;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:v10];
  [v9 prewarmIfNeededWithRequest:v8 reply:v7];
}

void __55__VSSpeechConnection_prewarmIfNeededWithRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_20CABC000, v4, OS_LOG_TYPE_ERROR, "Can't prewarm: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VSSpeechConnection *)self _remoteObjectWithErrorHandler:&__block_literal_global_178];
  [v7 updateWithConnectionIdentifier:v6 keepActive:v4];
}

void __64__VSSpeechConnection_updateWithConnectionIdentifier_keepActive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Error updateWithConnectionIdentifier: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setKeepActive:(BOOL)a3
{
  if (self->_keepActive != a3)
  {
    BOOL v3 = a3;
    self->_keepActive = a3;
    identifier = self->_identifier;
    if (identifier) {
      [(VSSpeechConnection *)self updateWithConnectionIdentifier:identifier keepActive:v3];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    delegateWrapper = self->_delegateWrapper;
    id v7 = v5;
    [(VSSpeechConnectionDelegateWrapper *)delegateWrapper setDelegate:obj];
  }
}

- (id)currentAudioRequest
{
  id v2 = [(VSSpeechConnection *)self delegateWrapper];
  BOOL v3 = [v2 audioRequests];
  int v4 = [v3 firstObject];

  return v4;
}

- (id)currentRequest
{
  id v2 = [(VSSpeechConnection *)self delegateWrapper];
  BOOL v3 = [v2 requests];
  int v4 = [v3 firstObject];

  return v4;
}

- (void)_connectionInvalidated
{
  v53[1] = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:-9 userInfo:0];
    uint64_t v6 = [(VSSpeechConnection *)self delegateWrapper];
    id v7 = [v6 requests];
    uint64_t v8 = [v7 count];

    uint64_t v9 = [(VSSpeechConnection *)self delegateWrapper];
    uint64_t v10 = v9;
    if (v8)
    {
      id v11 = [v9 requests];
    }
    else
    {
      char v12 = [v9 audioRequests];
      uint64_t v13 = [v12 count];

      if (!v13)
      {
LABEL_8:
        v31 = [(VSSpeechConnection *)self delegateWrapper];
        v32 = [v31 requests];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke;
        v51[3] = &unk_2640E8BE8;
        v51[4] = self;
        id v33 = v5;
        id v52 = v33;
        [v32 enumerateObjectsUsingBlock:v51];

        v34 = [(VSSpeechConnection *)self delegateWrapper];
        v35 = [v34 audioRequests];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke_2;
        v49[3] = &unk_2640E8C10;
        v49[4] = self;
        id v36 = v33;
        id v50 = v36;
        [v35 enumerateObjectsUsingBlock:v49];

        v37 = [(VSSpeechConnection *)self delegateWrapper];
        v38 = [v37 concurrentSynthesisRequests];
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __44__VSSpeechConnection__connectionInvalidated__block_invoke_3;
        v47[3] = &unk_2640E8C38;
        v47[4] = self;
        id v48 = v36;
        id v39 = v36;
        [v38 enumerateKeysAndObjectsUsingBlock:v47];

        id v40 = objc_loadWeakRetained((id *)p_delegate);
        [v40 connection:self invalidatedWithError:v39];

        goto LABEL_9;
      }
      uint64_t v10 = [(VSSpeechConnection *)self delegateWrapper];
      id v11 = [v10 audioRequests];
    }
    id v14 = v11;
    id v15 = [v11 firstObject];
    uint64_t v16 = [v15 siriRequestId];

    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x263F6F100]);
      id v18 = [NSNumber numberWithInt:4294967287];
      v53[0] = v18;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
      [v17 setErrorCodes:v19];

      id v20 = objc_alloc_init(MEMORY[0x263F6F0D8]);
      [v20 setFailed:v17];
      id v21 = objc_alloc(MEMORY[0x263F6EEE0]);
      v22 = [MEMORY[0x263F08C38] UUID];
      v23 = (void *)[v21 initWithNSUUID:v22];
      [v20 setContextId:v23];

      id v24 = objc_alloc_init(MEMORY[0x263F6F0C8]);
      [v24 setSpeechContext:v20];
      id v25 = objc_alloc_init(MEMORY[0x263F6F0D0]);
      [v24 setEventMetadata:v25];

      id v26 = objc_alloc(MEMORY[0x263F6EEE0]);
      v27 = [MEMORY[0x263F6C818] derivedIdentifierForComponentName:13 fromSourceIdentifier:v16];
      v28 = (void *)[v26 initWithNSUUID:v27];
      v29 = [v24 eventMetadata];
      [v29 setTtsId:v28];

      v30 = [MEMORY[0x263F6C818] sharedStream];
      [v30 emitMessage:v24];
    }
    goto LABEL_8;
  }
LABEL_9:
  [(VSSpeechConnection *)self setXpcConnection:0];
  v41 = [(VSSpeechConnection *)self delegateWrapper];
  v42 = [v41 requests];
  [v42 removeAllObjects];

  v43 = [(VSSpeechConnection *)self delegateWrapper];
  v44 = [v43 audioRequests];
  [v44 removeAllObjects];

  v45 = [(VSSpeechConnection *)self delegateWrapper];
  v46 = [v45 concurrentSynthesisRequests];
  [v46 removeAllObjects];
}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained connection:*(void *)(a1 + 32) speechRequest:v4 didStopAtEnd:0 phonemesSpoken:0 error:*(void *)(a1 + 40)];
}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained connection:*(void *)(a1 + 32) presynthesizedAudioRequest:v4 didStopAtEnd:0 error:*(void *)(a1 + 40)];
}

void __44__VSSpeechConnection__connectionInvalidated__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(*(void *)(a1 + 32) + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained connection:*(void *)(a1 + 32) synthesisRequest:v5 didFinishWithInstrumentMetrics:0 error:*(void *)(a1 + 40)];
}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(VSSpeechConnection *)self xpcConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_remoteObjectSync
{
  id v2 = [(VSSpeechConnection *)self xpcConnection];
  BOOL v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3229];

  return v3;
}

void __39__VSSpeechConnection__remoteObjectSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[VSSpeechConnection _remoteObjectSync]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "%s, error: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (id)_remoteObject
{
  id v2 = [(VSSpeechConnection *)self xpcConnection];
  BOOL v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)setXpcConnection:(id)a3
{
  id v4 = a3;
  threadSafeQueue = self->_threadSafeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__VSSpeechConnection_setXpcConnection___block_invoke;
  v7[3] = &unk_2640E8BA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(threadSafeQueue, v7);
}

void __39__VSSpeechConnection_setXpcConnection___block_invoke(uint64_t a1)
{
}

- (NSXPCConnection)xpcConnection
{
  threadSafeQueue = self->_threadSafeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__VSSpeechConnection_xpcConnection__block_invoke;
  block[3] = &unk_2640E8B78;
  block[4] = self;
  dispatch_sync(threadSafeQueue, block);
  return self->_xpcConnection;
}

void __35__VSSpeechConnection_xpcConnection__block_invoke(uint64_t a1)
{
  v34[2] = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.voiceservices.tts" options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C1C7550];
    id v6 = (void *)MEMORY[0x263EFFA08];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    id v8 = [v6 setWithArray:v7];

    [v5 setClasses:v8 forSelector:sel_getLocalVoicesForLanguage_reply_ argumentIndex:0 ofReply:1];
    [v5 setClasses:v8 forSelector:sel_getSubscribedVoiceAssetsWithClientID_forAccessoryID_reply_ argumentIndex:0 ofReply:1];
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    id v11 = [v9 setWithArray:v10];

    [v5 setClasses:v11 forSelector:sel_getLocalVoiceResourcesReply_ argumentIndex:0 ofReply:1];
    [v5 setClasses:v11 forSelector:sel_getVoiceResourceForLanguage_reply_ argumentIndex:0 ofReply:1];
    char v12 = (void *)MEMORY[0x263EFFA08];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
    id v14 = [v12 setWithArray:v13];

    [v5 setClasses:v14 forSelector:sel_getAllVoiceSubscriptionsWithReply_ argumentIndex:0 ofReply:1];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v5];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v15 = *(void **)(*(void *)(a1 + 32) + 16);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __35__VSSpeechConnection_xpcConnection__block_invoke_2;
    v28[3] = &unk_2640E8B50;
    objc_copyWeak(&v29, &location);
    [v15 setInvalidationHandler:v28];
    uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 16);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __35__VSSpeechConnection_xpcConnection__block_invoke_3;
    v26[3] = &unk_2640E8B50;
    objc_copyWeak(&v27, &location);
    [v16 setInterruptionHandler:v26];
    id v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C1C2978];
    id v18 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    v31[3] = objc_opt_class();
    v31[4] = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
    id v20 = [v18 setWithArray:v19];

    [v17 setClasses:v20 forSelector:sel_speechRequest_didReceiveTimingInfo_ argumentIndex:1 ofReply:0];
    [v17 setClasses:v20 forSelector:sel_synthesisRequest_didReceiveTimingInfo_ argumentIndex:1 ofReply:0];
    [v17 setClasses:v20 forSelector:sel_synthesisRequest_didGenerateAudioChunk_ argumentIndex:1 ofReply:0];
    [*(id *)(*(void *)(a1 + 32) + 16) setExportedInterface:v17];
    id v21 = *(void **)(a1 + 32);
    v22 = (void *)v21[2];
    v23 = [v21 delegateWrapper];
    [v22 setExportedObject:v23];

    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    uint64_t v24 = *(void *)(a1 + 32);
    if (*(void *)(v24 + 24))
    {
      id v25 = [*(id *)(v24 + 16) remoteObjectProxy];
      [v25 updateWithConnectionIdentifier:*(void *)(*(void *)(a1 + 32) + 24) keepActive:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

void __35__VSSpeechConnection_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

void __35__VSSpeechConnection_xpcConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained xpcConnection];
  [v1 invalidate];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_20CABC000, v3, OS_LOG_TYPE_DEFAULT, "Closing xpc connection %p", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)VSSpeechConnection;
  [(VSSpeechConnection *)&v4 dealloc];
}

- (VSSpeechConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSSpeechConnection;
  uint64_t v2 = [(VSSpeechConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(VSSpeechConnectionDelegateWrapper);
    delegateWrapper = v2->_delegateWrapper;
    v2->_delegateWrapper = v3;

    [(VSSpeechConnectionDelegateWrapper *)v2->_delegateWrapper setConnection:v2];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.voiceservices.xpcconnection", 0);
    threadSafeQueue = v2->_threadSafeQueue;
    v2->_threadSafeQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end