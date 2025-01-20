@interface ATXProactiveSuggestionConsumer
- (ATXProactiveSuggestionConsumer)initWithConsumerSubType:(unsigned __int8)a3;
- (id)cachedSuggestionsForClientModelType:(int64_t)a3;
- (id)layoutForRequest:(id)a3;
- (id)remoteSyncBlendingLayerServer;
- (id)suggestionLayoutFromCache;
- (id)suggestionsForRequest:(id)a3 limit:(id)a4;
- (void)dealloc;
- (void)setupRemoteClientXPCConnection;
- (void)suggestionLayoutFromCache;
@end

@implementation ATXProactiveSuggestionConsumer

- (ATXProactiveSuggestionConsumer)initWithConsumerSubType:(unsigned __int8)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ATXProactiveSuggestionConsumer;
  v4 = [(ATXProactiveSuggestionConsumer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_consumer = a3;
    uint64_t v6 = objc_opt_new();
    cacheManager = v5->_cacheManager;
    v5->_cacheManager = (ATXUICacheManager *)v6;
  }
  return v5;
}

- (id)suggestionLayoutFromCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumer];
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "Accessing Blending's suggestionLayout cache for consumer subtype: %@", (uint8_t *)&v11, 0xCu);
  }
  unsigned int consumer = self->_consumer;
  p_unsigned int consumer = &self->_consumer;
  v7 = [*((id *)p_consumer + 1) cachedLayoutForConsumerSubType:consumer expectedClass:objc_opt_class()];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(ATXProactiveSuggestionConsumer *)p_consumer suggestionLayoutFromCache];
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (id)layoutForRequest:(id)a3
{
  id v4 = a3;
  if (!self->_xpcConnection) {
    [(ATXProactiveSuggestionConsumer *)self setupRemoteClientXPCConnection];
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v5 = [(ATXProactiveSuggestionConsumer *)self remoteSyncBlendingLayerServer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXProactiveSuggestionConsumer_layoutForRequest___block_invoke;
  v8[3] = &unk_1E5F00D98;
  v8[4] = &v9;
  [v5 generateLayoutForRequest:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXProactiveSuggestionConsumer_layoutForRequest___block_invoke(uint64_t a1, void *a2)
{
}

- (id)suggestionsForRequest:(id)a3 limit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_xpcConnection) {
    [(ATXProactiveSuggestionConsumer *)self setupRemoteClientXPCConnection];
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v8 = [(ATXProactiveSuggestionConsumer *)self remoteSyncBlendingLayerServer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ATXProactiveSuggestionConsumer_suggestionsForRequest_limit___block_invoke;
  v11[3] = &unk_1E5F00DC0;
  v11[4] = &v12;
  [v8 generateRankedSuggestionsForRequest:v6 limit:v7 reply:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __62__ATXProactiveSuggestionConsumer_suggestionsForRequest_limit___block_invoke(uint64_t a1, void *a2)
{
}

- (id)remoteSyncBlendingLayerServer
{
  return [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_5];
}

void __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)setupRemoteClientXPCConnection
{
  v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "Establishing a new XPC connection to BlendingLayerServer from ATXProactiveSuggestionConsumer.", v7, 2u);
  }

  id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.ProactiveSuggestionClientModel.xpc" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  id v6 = ATXCreateProactiveSuggestionClientModelXPCInterface();
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global_12];
  [(NSXPCConnection *)self->_xpcConnection resume];
}

void __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke()
{
  v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke_cold_1(v0);
  }
}

- (id)cachedSuggestionsForClientModelType:(int64_t)a3
{
  id v4 = +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:");
  if (v4)
  {
    v5 = objc_opt_new();
    id v6 = [v5 cachedSuggestionsForClientModel:v4];
  }
  else
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestionConsumer cachedSuggestionsForClientModelType:](a3, v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXProactiveSuggestionConsumer;
  [(ATXProactiveSuggestionConsumer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
}

- (void)suggestionLayoutFromCache
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "A suggestion client tried to access cached suggestions for consumerSubType: %@, but the object type wasn't an ATXSuggestionLayout.", (uint8_t *)&v4, 0xCu);
}

void __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Blending: Error while communicating with Suggestion Receiver. Error: %@.", (uint8_t *)&v2, 0xCu);
}

void __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "Blending: Connection to Proactive Suggestion Client Model server interrupted.", v1, 2u);
}

- (void)cachedSuggestionsForClientModelType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Unrecognized clientModelType provided: %ld", (uint8_t *)&v2, 0xCu);
}

@end