@interface ATXProactiveSuggestionClientModel
+ (BOOL)clientModelTypeIsEligibleForShortcutConversion:(int64_t)a3;
+ (BOOL)clientModelTypeIsShortcutConversion:(int64_t)a3;
+ (id)clientModelIdFromClientModelType:(int64_t)a3;
+ (id)clientModelIdsFromClientModelTypesArray:(id)a3;
+ (int64_t)actionConversionTypeForClientModelType:(int64_t)a3;
+ (int64_t)clientModelTypeFromClientModelId:(id)a3;
+ (void)refreshBlendingLayer;
+ (void)refreshBlendingLayerWithReason:(id)a3;
- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 blendingLayerServer:(id)a4;
- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4;
- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4 blendingLayerServer:(id)a5;
- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4;
- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4 blendingLayerServer:(id)a5;
- (ATXProactiveSuggestionClientModelXPCInterface)suggestionReceiver;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)clientModelId;
- (id)blendingLayerServer;
- (id)clientModelMismatchErrorResponseForRequest:(id)a3 clientModelId:(id)a4;
- (id)emptyResponseForRequest:(id)a3;
- (id)remoteAsyncBlendingLayerServer;
- (void)dealloc;
- (void)pingWithCompletion:(id)a3;
- (void)retrieveCurrentSuggestionsWithReply:(id)a3;
- (void)setupRemoteClientXPCConnection;
- (void)setupXPCListenerWithClientModelId:(id)a3;
- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)transmitSuggestionsToReceiver:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5;
- (void)updateSuggestions:(id)a3;
- (void)updateSuggestions:(id)a3 completionHandler:(id)a4;
- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4;
- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5;
@end

@implementation ATXProactiveSuggestionClientModel

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4
{
  return [(ATXProactiveSuggestionClientModel *)self initWithClientModelId:a3 requestDelegate:0];
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ATXProactiveSuggestionClientModel *)self setupRemoteClientXPCConnection];
  v8 = [(ATXProactiveSuggestionClientModel *)self remoteAsyncBlendingLayerServer];
  if (v7)
  {
    v9 = (void *)[v6 copy];
    [(ATXProactiveSuggestionClientModel *)self setupXPCListenerWithClientModelId:v9];
  }
  v10 = [(ATXProactiveSuggestionClientModel *)self initWithClientModelId:v6 requestDelegate:v7 blendingLayerServer:v8];

  return v10;
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 notificationId:(id)a4 blendingLayerServer:(id)a5
{
  return [(ATXProactiveSuggestionClientModel *)self initWithClientModelId:a3 requestDelegate:0 blendingLayerServer:a5];
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 blendingLayerServer:(id)a4
{
  return [(ATXProactiveSuggestionClientModel *)self initWithClientModelId:a3 requestDelegate:0 blendingLayerServer:a4];
}

- (ATXProactiveSuggestionClientModel)initWithClientModelId:(id)a3 requestDelegate:(id)a4 blendingLayerServer:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl(&dword_1AE67F000, v11, OS_LOG_TYPE_DEFAULT, "Creating a ProactiveSuggestionClientModel object for clientModelId: %{public}@", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)ATXProactiveSuggestionClientModel;
  v12 = [(ATXProactiveSuggestionClientModel *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    clientModelId = v12->_clientModelId;
    v12->_clientModelId = (NSString *)v13;

    objc_storeStrong((id *)&v12->_requestDelegate, a4);
    objc_storeStrong((id *)&v12->_blendingLayerServer, a5);
  }

  return v12;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXProactiveSuggestionClientModel;
  [(ATXProactiveSuggestionClientModel *)&v3 dealloc];
}

- (void)setupRemoteClientXPCConnection
{
  objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.ProactiveSuggestionClientModel.xpc" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = ATXCreateProactiveSuggestionClientModelXPCInterface();
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];

  id v6 = (void *)[(NSString *)self->_clientModelId copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke;
  v10[3] = &unk_1E5F01118;
  id v11 = v6;
  id v7 = self->_xpcConnection;
  id v8 = v6;
  [(NSXPCConnection *)v7 setInterruptionHandler:v10];
  id v9 = [(NSXPCConnection *)self->_xpcConnection interruptionHandler];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v9];

  [(NSXPCConnection *)self->_xpcConnection resume];
}

void __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_blending();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)setupXPCListenerWithClientModelId:(id)a3
{
  uint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithFormat:@"com.apple.proactive.SuggestionRequest.%@", v5];

  uint64_t v6 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v8];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v6;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
}

- (id)remoteAsyncBlendingLayerServer
{
  return [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
}

void __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke_cold_1();
  }
}

- (id)blendingLayerServer
{
  return self->_blendingLayerServer;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)transmitSuggestionsToReceiver:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  blendingLayerServer = self->_blendingLayerServer;
  clientModelId = self->_clientModelId;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke;
  v12[3] = &unk_1E5F01140;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(ATXProactiveSuggestionClientModelXPCInterface *)blendingLayerServer clientModelUpdatedSuggestions:a3 feedbackMetadata:a4 clientModelId:clientModelId completion:v12];
}

void __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = __atxlog_handle_blending();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke_cold_1();
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

- (void)updateSuggestions:(id)a3
{
}

- (void)updateSuggestions:(id)a3 completionHandler:(id)a4
{
}

- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4
{
}

- (void)updateSuggestions:(id)a3 feedbackMetadata:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    int v17 = 138543618;
    id v18 = clientModelId;
    __int16 v19 = 2048;
    uint64_t v20 = [v8 count];
    _os_log_impl(&dword_1AE67F000, v11, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Updating suggestions. Client Model produced %lu new suggestions.", (uint8_t *)&v17, 0x16u);
  }

  id v13 = __atxlog_handle_blending();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_clientModelId;
    int v17 = 138543362;
    id v18 = v14;
    _os_log_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Transmiting...", (uint8_t *)&v17, 0xCu);
  }

  [(ATXProactiveSuggestionClientModel *)self transmitSuggestionsToReceiver:v8 feedbackMetadata:v10 completionHandler:v9];
  v15 = __atxlog_handle_blending();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = self->_clientModelId;
    int v17 = 138543362;
    id v18 = v16;
    _os_log_impl(&dword_1AE67F000, v15, OS_LOG_TYPE_DEFAULT, "Blending: (%{public}@) Done transmitting.", (uint8_t *)&v17, 0xCu);
  }
}

- (void)retrieveCurrentSuggestionsWithReply:(id)a3
{
  id v4 = a3;
  blendingLayerServer = self->_blendingLayerServer;
  clientModelId = self->_clientModelId;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke;
  v8[3] = &unk_1E5F01188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(ATXProactiveSuggestionClientModelXPCInterface *)blendingLayerServer retrieveSuggestionsForClientModelId:clientModelId reply:v8];
}

void __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)clientModelIdFromClientModelType:(int64_t)a3
{
  id result = @"atx_anchor_model";
  switch(a3)
  {
    case 0:
      id v4 = __atxlog_handle_blending();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:]();
      }

      id result = @"unknown";
      break;
    case 2:
      id result = @"atx_anchor_model_action_conversion";
      break;
    case 3:
      id result = @"atx_heuristics";
      break;
    case 4:
      id result = @"atx_heuristics_action_conversion";
      break;
    case 5:
      id result = @"atx_action_relevance_model";
      break;
    case 6:
      id result = @"atx_action_predictions_spotlight";
      break;
    case 7:
      id result = @"atx_action_predictions_homescreen";
      break;
    case 8:
      id result = @"atx_action_predictions_homescreen_action_conversion";
      break;
    case 9:
      id result = @"atx_action_predictions_lockscreen";
      break;
    case 10:
      id result = @"atx_action_fallbacks_homescreen";
      break;
    case 11:
      id result = @"atx_recent_shortcuts_homescreen";
      break;
    case 12:
      id result = @"atx_recent_shortcuts_homescreen_action_conversion";
      break;
    case 13:
      id result = @"atx_app_clip_predictions";
      break;
    case 14:
      id result = @"atx_app_relevance_model";
      break;
    case 15:
      id result = @"atx_app_predictions_spotlight";
      break;
    case 16:
      id result = @"atx_app_predictions_homescreen";
      break;
    case 17:
      id result = @"atx_app_predictions_app_library";
      break;
    case 18:
      id result = @"atx_glanceable_information";
      break;
    case 19:
      id result = @"atx_timeline_donation";
      break;
    case 20:
      id result = @"atx_relevant_shortcut";
      break;
    case 21:
      id result = @"atx_first_party_offers";
      break;
    case 22:
      id result = @"tps_tips";
      break;
    case 23:
      id result = @"atx_hero_app_predictions";
      break;
    case 24:
      id result = @"atx_magical_moments";
      break;
    case 25:
      id result = @"atx_debug_high_priority";
      break;
    case 26:
      id result = @"atx_debug_medium_priority";
      break;
    case 27:
      id result = @"atx_debug_low_priority";
      break;
    case 28:
      id result = @"ck_universal_recents";
      break;
    case 29:
      id result = @"cd_calendar_interaction_suggestions";
      break;
    case 30:
      id result = @"ps_unstructured_calendar_interaction_suggestions";
      break;
    case 31:
      id result = @"ps_unstructured_reminder_interaction_suggestions";
      break;
    case 32:
      id result = @"ps_facetime_interaction_model";
      break;
    case 33:
      id result = @"ps_facetime_fallback_interaction_model";
      break;
    case 34:
      id result = @"ps_share_sheet_interaction_model";
      break;
    case 35:
      id result = @"ps_phone_call_interaction_heuristics";
      break;
    case 36:
      id result = @"ps_expanse_session_interaction_heuristics";
      break;
    case 37:
      id result = @"ps_hyper_recent_interaction_heuristics";
      break;
    case 38:
      id result = @"ps_photos_asset_present_interaction_heuristics";
      break;
    case 39:
      id result = @"ps_photos_asset_or_memory_present_interaction_heuristics";
      break;
    case 40:
      id result = @"ps_rule_mining_interaction_model";
      break;
    case 41:
      id result = @"ps_knn_interaction_model";
      break;
    case 42:
      id result = @"ps_share_sheet_fallback_interaction_model";
      break;
    case 43:
      id result = @"atx_contextual_actions";
      break;
    case 44:
      id result = @"atx_context_heuristics";
      break;
    case 45:
      id result = @"atx_hero_spotlight_poi";
      break;
    case 46:
      id result = @"atx_spotlight_recents";
      break;
    case 47:
      id result = @"atx_hourglass";
      break;
    case 48:
      id result = @"atx_action_predictions_settings";
      break;
    case 49:
      id v5 = __atxlog_handle_blending();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:]();
      }

      id result = @"atx_max";
      break;
    default:
      return result;
  }
  return result;
}

+ (id)clientModelIdsFromClientModelTypesArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

+ (int64_t)clientModelTypeFromClientModelId:(id)a3
{
  id v3 = a3;
  if (clientModelTypeFromClientModelId__onceToken != -1) {
    dispatch_once(&clientModelTypeFromClientModelId__onceToken, &__block_literal_global_175);
  }
  id v4 = [(id)clientModelTypeFromClientModelId__clientModelMap objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

void __70__ATXProactiveSuggestionClientModel_clientModelTypeFromClientModelId___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)clientModelTypeFromClientModelId__clientModelMap;
  clientModelTypeFromClientModelId__clientModelMap = v0;

  for (uint64_t i = 1; i != 49; ++i)
  {
    id v3 = [NSNumber numberWithInteger:i];
    id v4 = (void *)clientModelTypeFromClientModelId__clientModelMap;
    id v5 = +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:i];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

+ (BOOL)clientModelTypeIsEligibleForShortcutConversion:(int64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 0:
      id v4 = __atxlog_handle_blending();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXProactiveSuggestionClientModel clientModelTypeIsEligibleForShortcutConversion:]();
      }
      goto LABEL_7;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
      goto LABEL_2;
    case 49:
      id v4 = __atxlog_handle_blending();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXProactiveSuggestionClientModel clientModelTypeIsEligibleForShortcutConversion:]();
      }
LABEL_7:

LABEL_2:
      BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)clientModelTypeIsShortcutConversion:(int64_t)a3
{
  *((void *)&v3 + 1) = a3;
  *(void *)&long long v3 = a3 - 2;
  return ((unint64_t)(v3 >> 1) < 6) & (0x2Bu >> (v3 >> 1));
}

+ (int64_t)actionConversionTypeForClientModelType:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 0xB && ((0x455u >> v3)) {
    return qword_1AE6F56A0[v3];
  }
  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[ATXProactiveSuggestionClientModel actionConversionTypeForClientModelType:]();
  }

  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int64_t v6 = __atxlog_handle_blending();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    clientModelId = self->_clientModelId;
    int v13 = 138543362;
    long long v14 = clientModelId;
    _os_log_impl(&dword_1AE67F000, v6, OS_LOG_TYPE_DEFAULT, "Client Model %{public}@ is accepting an XPC connection", (uint8_t *)&v13, 0xCu);
  }

  if (self->_requestDelegate)
  {
    uint64_t v8 = [v5 valueForEntitlement:@"com.apple.proactive.ProactiveSuggestionClientModel.xpc"];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && ([v8 BOOLValue] & 1) != 0)
    {
      id v9 = ATXProactiveSuggestionRealTimeProviderXPCInterface();
      [v5 setExportedInterface:v9];

      [v5 setExportedObject:self];
      [v5 setInterruptionHandler:&__block_literal_global_181];
      [v5 setInvalidationHandler:&__block_literal_global_184];
      [v5 resume];
      BOOL v10 = 1;
    }
    else
    {
      id v11 = __atxlog_handle_blending();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ATXProactiveSuggestionClientModel listener:shouldAcceptNewConnection:]();
      }

      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_182()
{
  uint64_t v0 = __atxlog_handle_blending();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_182_cold_1();
  }
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([(NSString *)self->_clientModelId isEqualToString:v8])
  {
    if (objc_opt_respondsToSelector())
    {
      [(ATXProactiveSuggestionRealTimeProviderDelegateProtocol *)self->_requestDelegate suggestionsForInteractionSuggestionRequest:v12 clientModelId:v8 reply:v9];
      goto LABEL_7;
    }
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self emptyResponseForRequest:v12];
  }
  else
  {
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self clientModelMismatchErrorResponseForRequest:v12 clientModelId:v8];
  }
  id v11 = (void *)v10;
  v9[2](v9, v10);

LABEL_7:
}

- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([(NSString *)self->_clientModelId isEqualToString:v8])
  {
    if (objc_opt_respondsToSelector())
    {
      [(ATXProactiveSuggestionRealTimeProviderDelegateProtocol *)self->_requestDelegate suggestionsForContextualActionSuggestionRequest:v12 clientModelId:v8 reply:v9];
      goto LABEL_7;
    }
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self emptyResponseForRequest:v12];
  }
  else
  {
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self clientModelMismatchErrorResponseForRequest:v12 clientModelId:v8];
  }
  id v11 = (void *)v10;
  v9[2](v9, v10);

LABEL_7:
}

- (void)suggestionsForIntentSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([(NSString *)self->_clientModelId isEqualToString:v8])
  {
    if (objc_opt_respondsToSelector())
    {
      [(ATXProactiveSuggestionRealTimeProviderDelegateProtocol *)self->_requestDelegate suggestionsForIntentSuggestionRequest:v12 clientModelId:v8 reply:v9];
      goto LABEL_7;
    }
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self emptyResponseForRequest:v12];
  }
  else
  {
    uint64_t v10 = [(ATXProactiveSuggestionClientModel *)self clientModelMismatchErrorResponseForRequest:v12 clientModelId:v8];
  }
  id v11 = (void *)v10;
  v9[2](v9, v10);

LABEL_7:
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    int64_t v3 = (void (*)(void))v4[2];
  }
  else
  {
    objc_opt_respondsToSelector();
    int64_t v3 = (void (*)(void))v4[2];
  }
  v3();
}

- (id)emptyResponseForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [[ATXSuggestionRequestResponse alloc] initWithSuggestions:0 feedbackMetadata:0 originalRequest:v3 responseCode:1 error:0];

  return v4;
}

- (id)clientModelMismatchErrorResponseForRequest:(id)a3 clientModelId:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = NSString;
  clientModelId = self->_clientModelId;
  id v7 = a3;
  id v8 = [v5 stringWithFormat:@"Wrong delegate for request. Expected %@ but found %@.", a4, clientModelId];
  id v9 = [ATXSuggestionRequestResponse alloc];
  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v18[0] = v8;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  long long v14 = [v10 errorWithDomain:v12 code:5 userInfo:v13];
  uint64_t v15 = [(ATXSuggestionRequestResponse *)v9 initWithSuggestions:0 feedbackMetadata:0 originalRequest:v7 responseCode:3 error:v14];

  return v15;
}

- (ATXProactiveSuggestionClientModelXPCInterface)suggestionReceiver
{
  return self->_suggestionReceiver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionReceiver, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_blendingLayerServer, 0);
  objc_storeStrong((id *)&self->_requestDelegate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

+ (void)refreshBlendingLayer
{
  id v2 = (const char *)[@"com.apple.duetexpertd.clientModelRefreshBlendingLayer" UTF8String];
  notify_post(v2);
}

+ (void)refreshBlendingLayerWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1AE67F000, v4, OS_LOG_TYPE_DEFAULT, "Sending refresh blending notification with reason: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F28F80] processInfo];
  int64_t v6 = [v5 processName];
  int v7 = [v6 isEqualToString:@"duetexpertd"];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"com.apple.duetexpertd.clientModelRefreshBlendingLayer" object:0];
  }
  else
  {
    notify_post((const char *)[@"com.apple.duetexpertd.clientModelRefreshBlendingLayer" UTF8String]);
  }
}

void __67__ATXProactiveSuggestionClientModel_setupRemoteClientXPCConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ATXProactiveSuggestionClientModel_remoteAsyncBlendingLayerServer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Blending: Error while communicating with Suggestion Receiver. Error: %{public}@.", v2, v3, v4, v5, v6);
}

void __102__ATXProactiveSuggestionClientModel_transmitSuggestionsToReceiver_feedbackMetadata_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Blending: Error while sending the updated cache file to the Suggestion Receiver. Error: %{public}@.", v2, v3, v4, v5, v6);
}

void __73__ATXProactiveSuggestionClientModel_retrieveCurrentSuggestionsWithReply___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(*(void *)(a1 + 32) + 8);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_1AE67F000, a2, a3, "Blending: Error retrieving suggestions for %{public}@: %{public}@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)clientModelIdFromClientModelType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Tried to access client model id for max type.", v2, v3, v4, v5, v6);
}

+ (void)clientModelIdFromClientModelType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Tried to access client model id for unknown client model type.", v2, v3, v4, v5, v6);
}

+ (void)clientModelTypeIsEligibleForShortcutConversion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Tried to access client model id for unknown client model type.", v2, v3, v4, v5, v6);
}

+ (void)clientModelTypeIsEligibleForShortcutConversion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AE67F000, v0, v1, "Tried to access client model id for max type.", v2, v3, v4, v5, v6);
}

+ (void)actionConversionTypeForClientModelType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "Tried to get action conversion type for unsupported client model type: %ld", v1, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_1AE67F000, v0, v1, "Blending: Rejecting connection %@ without entitlement %@");
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "Blending: Unexpected interruption on Proactive Suggestion Client Model XPC interface", v1, 2u);
}

void __72__ATXProactiveSuggestionClientModel_listener_shouldAcceptNewConnection___block_invoke_182_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "Blending: Connection invalidated on Proactive Suggestion Client Model XPC interface. Client went away.", v1, 2u);
}

@end