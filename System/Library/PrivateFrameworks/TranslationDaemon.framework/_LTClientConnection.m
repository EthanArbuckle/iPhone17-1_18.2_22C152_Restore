@interface _LTClientConnection
- (_LTClientConnection)initWithConnection:(id)a3 server:(id)a4 trusted:(BOOL)a5;
- (_LTClientConnectionDelegate)delegate;
- (id)_clientDelegate;
- (void)_deleteHotfix:(id)a3;
- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_getAssetSize:(id)a3;
- (void)_offlineLanguageStatus:(id)a3;
- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4;
- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_updateAllAssets:(id)a3;
- (void)_updateHotfix:(id)a3;
- (void)addLanguages:(id)a3 useCellular:(BOOL)a4;
- (void)addSpeechAudioData:(id)a3;
- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4;
- (void)assetRequestHandler:(id)a3;
- (void)attemptToCancelRequestsWithSessionID:(id)a3;
- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3;
- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4;
- (void)cancelLanguageStatusChangeObservation:(id)a3;
- (void)cleanup;
- (void)cleanupOnDisconnect;
- (void)clearCaches;
- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5;
- (void)endAudio;
- (void)installedLocales:(id)a3;
- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4;
- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)languageForText:(id)a3 completion:(id)a4;
- (void)languagesForText:(id)a3 completion:(id)a4;
- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5;
- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6;
- (void)logRequestOfType:(id)a3 context:(id)a4;
- (void)logWithRequestData:(id)a3;
- (void)modalitiesPerLocaleWithCompletion:(id)a3;
- (void)onDeviceModeEnabled:(id)a3;
- (void)onDeviceModeSupported:(id)a3;
- (void)preheatWithContext:(id)a3 completion:(id)a4;
- (void)removeLanguages:(id)a3;
- (void)selfLoggingEventWithData:(id)a3;
- (void)selfLoggingInvocationCancelledForIDs:(id)a3;
- (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4;
- (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4;
- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldPresentSystemFirstUseConsent:(id)a3;
- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)startInstallRequest:(id)a3;
- (void)startLanguageStatusChangeObservation:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)startSpeechTranslationWithContext:(id)a3;
- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4;
- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5;
- (void)textStreamingConfigurationWithCompletion:(id)a3;
- (void)translate:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)translateParagraphs:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation _LTClientConnection

- (_LTClientConnection)initWithConnection:(id)a3 server:(id)a4 trusted:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_LTClientConnection;
  v11 = [(_LTClientConnection *)&v31 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_server, a4);
    v12->_trusted = v5;
    v13 = _LTOSLogXPC();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v14) {
        -[_LTClientConnection initWithConnection:server:trusted:]();
      }
      uint64_t v15 = _LTTranslationServiceXPCInterface();
    }
    else
    {
      if (v14) {
        -[_LTClientConnection initWithConnection:server:trusted:].cold.4();
      }
      uint64_t v15 = _LTTextTranslationServiceXPCInterface();
    }
    v16 = (void *)v15;
    [v9 setExportedInterface:v15];

    [v9 setExportedObject:v12];
    v17 = _LTTranslationServiceDelegateXPCInterface();
    [v9 setRemoteObjectInterface:v17];

    objc_initWeak(&location, v12);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57___LTClientConnection_initWithConnection_server_trusted___block_invoke;
    v28[3] = &unk_265545E20;
    objc_copyWeak(&v29, &location);
    v18 = (void *)MEMORY[0x26120C050](v28);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2;
    v26[3] = &unk_265545E48;
    id v19 = v18;
    id v27 = v19;
    [v9 setInterruptionHandler:v26];
    [v9 setInvalidationHandler:v19];
    uint64_t v20 = [v9 valueForEntitlement:@"application-identifier"];
    if (!v20)
    {
      v21 = _LTOSLogXPC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_LTClientConnection initWithConnection:server:trusted:]();
      }
    }
    v22 = _LTOSLogXPC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[_LTClientConnection initWithConnection:server:trusted:](v20, v22);
    }
    trustedClientIdentifier = v12->_trustedClientIdentifier;
    v12->_trustedClientIdentifier = (NSString *)v20;

    v24 = v12;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)_clientDelegate
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void)cleanupOnDisconnect
{
  if (self->_speechSessionID)
  {
    v3 = _LTOSLogXPC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Client disconnected, ask to cancel speech session", v5, 2u);
    }
    [(_LTTranslationServer *)self->_server cancelSpeechSessionWithID:self->_speechSessionID];
  }
  v4 = [(_LTClientConnection *)self delegate];
  [v4 clientConnectionClosed:self];
}

- (void)clearCaches
{
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"sentence" context:v9];
  [v9 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  [(_LTTranslationServer *)self->_server translateSentence:v10 withContext:v9 completion:v8];
}

- (void)translate:(id)a3 withContext:(id)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_trusted)
  {
    uint64_t v11 = [v9 sanitizedCopyForUntrustedTextTranslation];

    id v9 = (id)v11;
  }
  [(_LTClientConnection *)self logRequestOfType:@"singleParagraph" context:v9];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__0;
  v20[4] = __Block_byref_object_dispose__0;
  id v21 = 0;
  [v9 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  server = self->_server;
  v24[0] = v8;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56___LTClientConnection_translate_withContext_completion___block_invoke;
  v19[3] = &unk_265545E70;
  v19[4] = v22;
  v19[5] = v20;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56___LTClientConnection_translate_withContext_completion___block_invoke_2;
  v15[3] = &unk_265545E98;
  v17 = v20;
  v18 = v22;
  id v14 = v10;
  id v16 = v14;
  [(_LTTranslationServer *)server translateParagraphs:v13 withContext:v9 paragraphResult:v19 completion:v15];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

- (void)translateParagraphs:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_trusted)
  {
    uint64_t v11 = [v9 sanitizedCopyForUntrustedTextTranslation];

    id v9 = (id)v11;
  }
  [(_LTClientConnection *)self logRequestOfType:@"paragraphs" context:v9];
  [v9 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  v12 = [(_LTClientConnection *)self _clientDelegate];
  server = self->_server;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66___LTClientConnection_translateParagraphs_withContext_completion___block_invoke;
  v15[3] = &unk_265545EC0;
  id v16 = v12;
  id v14 = v12;
  [(_LTTranslationServer *)server translateParagraphs:v8 withContext:v9 paragraphResult:v15 completion:v10];
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"tts" context:v9];
  [v9 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  id v11 = [(_LTClientConnection *)self _clientDelegate];
  [(_LTTranslationServer *)self->_server speak:v10 withContext:v9 delegate:v11 completion:v8];
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4
{
  id v11 = a3;
  trustedClientIdentifier = self->_trustedClientIdentifier;
  id v7 = a4;
  if (-[NSString isEqual:](trustedClientIdentifier, "isEqual:", @"com.apple.TranslationUIServices.TranslationUIService"))[v11 setTaskHint:5]; {
  [(_LTClientConnection *)self logRequestOfType:@"text-to-speech" context:v11];
  }
  [v11 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  id v8 = [(_LTClientConnection *)self _clientDelegate];
  id v9 = [(_LTTranslationServer *)self->_server startTextToSpeechTranslationWithContext:v11 text:v7 delegate:v8];

  speechSessionID = self->_speechSessionID;
  self->_speechSessionID = v9;
}

- (void)startSpeechTranslationWithContext:(id)a3
{
  id v4 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"speech" context:v4];
  [v4 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  id v7 = [(_LTClientConnection *)self _clientDelegate];
  BOOL v5 = [(_LTTranslationServer *)self->_server startSpeechTranslationWithContext:v4 delegate:v7];

  speechSessionID = self->_speechSessionID;
  self->_speechSessionID = v5;
}

- (void)addSpeechAudioData:(id)a3
{
}

- (void)endAudio
{
}

- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
}

- (void)modalitiesPerLocaleWithCompletion:(id)a3
{
}

- (void)textStreamingConfigurationWithCompletion:(id)a3
{
}

- (void)preheatWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"preheat" context:v7];
  [v7 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  [(_LTTranslationServer *)self->_server preheatWithContext:v7 completion:v6];
}

- (void)shouldPresentSystemFirstUseConsent:(id)a3
{
}

- (void)languageForText:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"text-LID" context:0];
  [(_LTTranslationServer *)self->_server languageForText:v7 completion:v6];
}

- (void)languagesForText:(id)a3 completion:(id)a4
{
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  [(_LTClientConnection *)self logRequestOfType:@"text-LID" context:0];
  v12 = _LTOSLogXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "XPC languages for text call", v13, 2u);
  }
  [(_LTTranslationServer *)self->_server languagesForText:v11 usingModel:a4 strategy:a5 completion:v10];
}

- (void)cleanup
{
}

- (void)attemptToCancelRequestsWithSessionID:(id)a3
{
}

- (void)logRequestOfType:(id)a3 context:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_LTAnalyticsEvent alloc] initWithName:@"TranslateRequest"];
  trustedClientIdentifier = self->_trustedClientIdentifier;
  if (trustedClientIdentifier)
  {
    id v10 = trustedClientIdentifier;
  }
  else
  {
    id v10 = [v7 clientIdentifier];
  }
  id v11 = v10;
  v12 = @"unknown";
  if (v10) {
    v12 = v10;
  }
  v16[0] = @"processName";
  v16[1] = @"type";
  v17[0] = v12;
  v17[1] = v6;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(_LTAnalyticsEvent *)v8 addFieldsFromDictionary:v13];

  [(_LTAnalyticsEvent *)v8 sendLazy];
  if (v7) {
    uint64_t v14 = [v7 route];
  }
  else {
    uint64_t v14 = -1;
  }
  uint64_t v15 = +[_LTPowerLogger sharedInstance];
  [v15 logTranslateRequestEvent:self->_trustedClientIdentifier requestType:v6 routeType:v14];
}

- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)assetRequestHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_LTClientConnection *)self _clientDelegate];
  server = self->_server;
  id v7 = [v4 assets];
  uint64_t v8 = [v4 options];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43___LTClientConnection_assetRequestHandler___block_invoke;
  v12[3] = &unk_265545EE8;
  id v13 = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43___LTClientConnection_assetRequestHandler___block_invoke_2;
  v10[3] = &unk_265545F10;
  id v11 = v13;
  id v9 = v13;
  [(_LTTranslationServer *)server setLanguageAssets:v7 options:v8 progress:v12 completion:v10];
}

- (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
}

- (void)removeLanguages:(id)a3
{
}

- (void)startLanguageStatusChangeObservation:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_LTClientConnection *)self _clientDelegate];
  BOOL trusted = self->_trusted;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke;
  v16[3] = &unk_265545F38;
  id v17 = v10;
  unint64_t v18 = a4;
  BOOL v19 = trusted;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke_2;
  v14[3] = &unk_265545F60;
  id v15 = v8;
  id v12 = v8;
  id v13 = v10;
  +[_LTDLanguageAssetService startLanguageStatusSession:v9 observationType:a4 progress:trusted observations:v16 completion:v14];
}

- (void)cancelLanguageStatusChangeObservation:(id)a3
{
}

- (void)_offlineLanguageStatus:(id)a3
{
}

- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
}

- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
}

- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
}

- (void)_updateAllAssets:(id)a3
{
}

- (void)installedLocales:(id)a3
{
}

- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
}

- (void)startInstallRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(_LTClientConnection *)self _clientDelegate];
  [(_LTTranslationServer *)self->_server startInstallRequest:v4 delegate:v5];
}

- (void)_getAssetSize:(id)a3
{
}

- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
}

- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
}

- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
}

- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
}

- (void)logWithRequestData:(id)a3
{
  id v5 = (void *)MEMORY[0x263F08928];
  id v6 = a3;
  id v7 = _LTLoggingRequestClasses();
  id v12 = 0;
  id v8 = [v5 unarchivedObjectOfClasses:v7 fromData:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = _LTOSLogXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_LTClientConnection logWithRequestData:]((uint64_t)v9, v10);
    }
    id v11 = NSStringFromSelector(a2);
    _LTSendErrorEvent(v9, v11);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 setProcessName:self->_trustedClientIdentifier];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 setClientBundleID:self->_trustedClientIdentifier];
      }
    }
    [(_LTTranslationServer *)self->_server startLoggingRequest:v8];
  }
}

- (void)_updateHotfix:(id)a3
{
}

- (void)_deleteHotfix:(id)a3
{
}

- (void)onDeviceModeEnabled:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "XPC on-device mode call", v6, 2u);
  }
  [(_LTTranslationServer *)self->_server onDeviceModeEnabled:v4];
}

- (void)onDeviceModeSupported:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "XPC on-device support call", v6, 2u);
  }
  [(_LTTranslationServer *)self->_server onDeviceModeSupported:v4];
}

- (void)selfLoggingEventWithData:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_LTClientConnection selfLoggingEventWithData:]();
  }
  [(_LTTranslationServer *)self->_server selfLoggingEventWithData:v4];
}

- (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _LTOSLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LTClientConnection selfLoggingInvocationStartedWithData:invocationStartedTier1Data:]();
  }
  [(_LTTranslationServer *)self->_server selfLoggingEventWithData:v7];

  [v6 setTrustedClientIdentifier:self->_trustedClientIdentifier];
  [(_LTTranslationServer *)self->_server selfLoggingEventWithData:v6];
}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
}

- (void)selfLoggingInvocationCancelledForIDs:(id)a3
{
}

- (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4
{
}

- (_LTClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_LTClientConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speechSessionID, 0);
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(uint64_t)a1 server:(NSObject *)a2 trusted:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Client connection for: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithConnection:server:trusted:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "Client didn't set application-identifier entitlement", v1, 2u);
}

- (void)initWithConnection:server:trusted:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Trusted client connection", v2, v3, v4, v5, v6);
}

- (void)initWithConnection:server:trusted:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Untrusted client connection", v2, v3, v4, v5, v6);
}

- (void)logWithRequestData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize logging request: %@", (uint8_t *)&v2, 0xCu);
}

- (void)selfLoggingEventWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "XPC selfLoggingEventWithData call", v2, v3, v4, v5, v6);
}

- (void)selfLoggingInvocationStartedWithData:invocationStartedTier1Data:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "XPC selfLoggingInvocationStartedWithData:invocationStartedTier1Data call", v2, v3, v4, v5, v6);
}

@end