@interface MOAppEngagementReporter
+ (id)sharedInstance;
- (MOAppEngagementReporter)init;
- (void)dealloc;
- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6;
@end

@implementation MOAppEngagementReporter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_engagementReporter;
  return v2;
}

uint64_t __41__MOAppEngagementReporter_sharedInstance__block_invoke()
{
  sharedInstance_engagementReporter = objc_alloc_init(MOAppEngagementReporter);
  return MEMORY[0x1F41817F8]();
}

- (MOAppEngagementReporter)init
{
  v12.receiver = self;
  v12.super_class = (Class)MOAppEngagementReporter;
  v2 = [(MOAppEngagementReporter *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2940DA8];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.momentsd" options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v4;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v3];
    [(NSXPCConnection *)v2->connection setInterruptionHandler:&__block_literal_global_7];
    [(NSXPCConnection *)v2->connection setInvalidationHandler:&__block_literal_global_10];
    uint64_t v6 = [(NSXPCConnection *)v2->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
    proxy = v2->proxy;
    v2->proxy = (MOAppEngagementXPCProtocol *)v6;

    [(NSXPCConnection *)v2->connection resume];
    v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "MOAppEngagementReporter initiate client", v11, 2u);
    }

    v9 = v2;
  }

  return v2;
}

void __31__MOAppEngagementReporter_init__block_invoke()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEFAULT, "Engagement reporter xpc interrupted", v1, 2u);
  }
}

void __31__MOAppEngagementReporter_init__block_invoke_8()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEFAULT, "Engagement reporter xpc invalidated", v1, 2u);
  }
}

void __31__MOAppEngagementReporter_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __31__MOAppEngagementReporter_init__block_invoke_11_cold_1(v2, v3);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOAppEngagementReporter;
  [(MOAppEngagementReporter *)&v3 dealloc];
}

- (void)didAppEntryUpdateUsingSuggestions:(id)a3 onEvent:(unint64_t)a4 duringInterval:(id)a5 withInfo:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count])
  {
    v14 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.7();
    }

    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 64, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: missing suggestionIdentifiers (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 64);
  }
  if ((unint64_t)[v11 count] > 0xA)
  {
    v16 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.6();
    }

    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 65, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: suggestionIdentifiers count should be up to kMOMaxAppEntrySuggestionsCount (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 65);
  }
  v18 = [v12 startDate];
  v19 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v20 = [v18 compare:v19];

  if (v20 == 1)
  {
    v21 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.5();
    }

    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 66, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: can't update entries in the future (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 66);
  }
  v23 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:].cold.4(v23);
  }

  if (a4 - 3 >= 2)
  {
    if (a4 - 1 > 1)
    {
      v30 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]();
      }

      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 81, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Unexpected update event (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 81);
      goto LABEL_28;
    }
    v24 = [v13 objectForKeyedSubscript:@"entryAddedCharacters"];

    if (!v24)
    {
      v25 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]();
      }

      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 73, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .addedCharacters key (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 73);
    }
    v27 = [v13 objectForKeyedSubscript:@"entryTotalCharacters"];

    if (!v27)
    {
      v28 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]();
      }

      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAppEngagementReporter.m", 74, @"MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .totalCharacters key (in %s:%d)", "-[MOAppEngagementReporter didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:]", 74);
LABEL_28:
    }
  }
  [(MOAppEngagementXPCProtocol *)self->proxy didAppEntryUpdateUsingSuggestions:v11 onEvent:a4 duringInterval:v12 withInfo:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __31__MOAppEngagementReporter_init__block_invoke_11_cold_1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 localizedDescription];
  v5 = [a1 localizedFailureReason];
  int v6 = 138412802;
  v7 = @"Error on remote object proxy";
  __int16 v8 = 2112;
  v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Unexpected update event (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .totalCharacters key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: Missing .addedCharacters key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:(os_log_t)log onEvent:duringInterval:withInfo:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D24AE000, log, OS_LOG_TYPE_DEBUG, "calling appEntryUpdatedForSuggestionID", v1, 2u);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: can't update entries in the future (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: suggestionIdentifiers count should be up to kMOMaxAppEntrySuggestionsCount (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D24AE000, v0, v1, "MOAppEngagementReporter:didAppEntryUpdateUsingSuggestions: missing suggestionIdentifiers (in %s:%d)", v2, v3, v4, v5, v6);
}

@end