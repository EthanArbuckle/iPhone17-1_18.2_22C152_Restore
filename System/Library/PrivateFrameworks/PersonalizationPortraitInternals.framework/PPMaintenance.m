@interface PPMaintenance
+ (id)singletonWarmupQueue;
+ (uint64_t)_kValue;
+ (uint64_t)_logEngagementMetricsForDomain:(void *)a3 feedback:(int)a4 count:(void *)a5 shouldContinue:;
+ (void)_logDonationIntervalStatsForSource:(uint64_t)a3 domain:(void *)a4 lastDonationTimes:(void *)a5 lastBatchDonationTimes:;
+ (void)registerMaintenanceTasksInternal;
@end

@implementation PPMaintenance

+ (void)registerMaintenanceTasksInternal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PPMaintenance_registerMaintenanceTasksInternal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerMaintenanceTasksInternal_onceToken != -1) {
    dispatch_once(&registerMaintenanceTasksInternal_onceToken, block);
  }
}

void __49__PPMaintenance_registerMaintenanceTasksInternal__block_invoke()
{
  uint64_t v0 = self;
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  v2 = (const char *)*MEMORY[0x1E4F141C8];
  int64_t v3 = *MEMORY[0x1E4F141E8];
  xpc_dictionary_set_int64(v1, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  key = (char *)*MEMORY[0x1E4F142C8];
  string = (char *)*MEMORY[0x1E4F142D0];
  xpc_dictionary_set_string(v1, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
  v108 = (char *)*MEMORY[0x1E4F14138];
  xpc_dictionary_set_BOOL(v1, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v1, (const char *)*MEMORY[0x1E4F14318], 1);
  v109 = (char *)*MEMORY[0x1E4F141C0];
  xpc_dictionary_set_string(v1, (const char *)*MEMORY[0x1E4F141C0], "com.apple.proactive.PersonalizationPortrait");
  v107 = (char *)*MEMORY[0x1E4F141B8];
  xpc_dictionary_set_uint64(v1, (const char *)*MEMORY[0x1E4F141B8], 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __43__PPMaintenance__registerCoreRoutineImport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerCoreRoutineImport;
  v129 = (char *)v0;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.CoreRoutineImport", v1, &handler);
  v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPMaintenance: registered task CoreRoutineImport", buf, 2u);
  }

  uint64_t v5 = self;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, v2, v3);
  xpc_dictionary_set_string(v6, key, string);
  xpc_dictionary_set_BOOL(v6, v108, 0);
  xpc_dictionary_set_string(v6, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v6, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __36__PPMaintenance__registerMapsImport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerMapsImport;
  v129 = (char *)v5;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.MapsImport", v6, &handler);
  v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_INFO, "PPMaintenance: registered task MapsImport", buf, 2u);
  }

  uint64_t v8 = self;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x2020000000;
  char v123 = 1;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v116 = 3221225472;
  v117 = __41__PPMaintenance__registerHealthKitImport__block_invoke;
  v118 = &unk_1E65DC058;
  v119 = &v120;
  v9 = (void (**)(void))_Block_copy(buf);
  v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  v12 = pp_maintenance_signpost_handle();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(handler) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HealthKitDataAvailable", "", (uint8_t *)&handler, 2u);
  }

  v9[2](v9);
  v14 = pp_maintenance_signpost_handle();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(handler) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v15, OS_SIGNPOST_INTERVAL_END, v11, "HealthKitDataAvailable", " enableTelemetry=YES ", (uint8_t *)&handler, 2u);
  }

  v16 = (const char **)MEMORY[0x1E4F14310];
  if (*((unsigned char *)v121 + 24))
  {
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v17, v2, v3);
    xpc_dictionary_set_string(v17, key, string);
    xpc_dictionary_set_BOOL(v17, v108, 0);
    xpc_dictionary_set_BOOL(v17, *v16, 1);
    xpc_dictionary_set_string(v17, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v17, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __41__PPMaintenance__registerHealthKitImport__block_invoke_129;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerHealthKitImport;
    v129 = (char *)v8;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.HealthKitImport", v17, &handler);
    v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v114 = 0;
      _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_INFO, "PPMaintenance: registered task HealthKitImport", v114, 2u);
    }
  }
  _Block_object_dispose(&v120, 8);
  uint64_t v19 = self;
  v20 = (void *)MEMORY[0x1E4F93B18];
  v21 = +[PPMaintenance singletonWarmupQueue]();
  [v20 runAsyncOnQueue:v21 afterDelaySeconds:&__block_literal_global_120 block:3.0];

  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v22, v2, *MEMORY[0x1E4F14238]);
  xpc_dictionary_set_string(v22, key, string);
  xpc_dictionary_set_BOOL(v22, v108, 0);
  xpc_dictionary_set_string(v22, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v22, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __40__PPMaintenance__registerEventKitImport__block_invoke_2;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerEventKitImport;
  v129 = (char *)v19;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.EventKitImport", v22, &handler);
  v23 = pp_default_log_handle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_INFO, "PPMaintenance: registered task EventKitImport", buf, 2u);
  }

  uint64_t v24 = self;
  v25 = (void *)MEMORY[0x1E4F93B18];
  v26 = +[PPMaintenance singletonWarmupQueue]();
  [v25 runAsyncOnQueue:v26 afterDelaySeconds:&__block_literal_global_134_17358 block:3.0];

  xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v27, v2, v3);
  xpc_dictionary_set_string(v27, key, string);
  xpc_dictionary_set_BOOL(v27, v108, 0);
  xpc_dictionary_set_string(v27, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v27, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __40__PPMaintenance__registerContactsImport__block_invoke_2;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerContactsImport;
  v129 = (char *)v24;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ContactsImport", v27, &handler);
  v28 = pp_default_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_INFO, "PPMaintenance: registered task ContactsImport", buf, 2u);
  }

  uint64_t v29 = self;
  xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
  v110 = (char *)v2;
  xpc_dictionary_set_int64(v30, v2, v3);
  xpc_dictionary_set_string(v30, key, string);
  xpc_dictionary_set_BOOL(v30, v108, 0);
  xpc_dictionary_set_string(v30, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v30, v107, 1uLL);
  v31 = (const char *)*MEMORY[0x1E4F14168];
  xpc_dictionary_set_BOOL(v30, (const char *)*MEMORY[0x1E4F14168], 1);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __37__PPMaintenance__registerTopicImport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerTopicImport;
  v129 = (char *)v29;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TopicImport", v30, &handler);
  v32 = pp_default_log_handle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TopicImport", buf, 2u);
  }

  uint64_t v33 = self;
  xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v34, v2, v3);
  xpc_dictionary_set_string(v34, key, string);
  xpc_dictionary_set_BOOL(v34, v108, 0);
  xpc_dictionary_set_string(v34, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v34, v107, 1uLL);
  xpc_dictionary_set_BOOL(v34, v31, 1);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __43__PPMaintenance__registerNamedEntityImport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerNamedEntityImport;
  v129 = (char *)v33;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityImport", v34, &handler);
  v35 = pp_default_log_handle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_INFO, "PPMaintenance: registered task NamedEntityImport", buf, 2u);
  }

  uint64_t v36 = self;
  xpc_object_t v37 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v37, v2, v3);
  xpc_dictionary_set_string(v37, key, string);
  xpc_dictionary_set_BOOL(v37, v108, 0);
  xpc_dictionary_set_string(v37, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v37, v107, 1uLL);
  xpc_dictionary_set_BOOL(v37, v31, 1);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerTopicRepairAndExport;
  v129 = (char *)v36;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TopicRepairAndExport", v37, &handler);
  v38 = pp_default_log_handle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TopicRepairAndExport", buf, 2u);
  }

  uint64_t v39 = self;
  xpc_object_t v40 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v40, v2, v3);
  xpc_dictionary_set_string(v40, key, string);
  xpc_dictionary_set_BOOL(v40, v108, 0);
  xpc_dictionary_set_string(v40, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v40, v107, 1uLL);
  xpc_dictionary_set_BOOL(v40, v31, 1);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerNamedEntityRepairAndExport;
  v129 = (char *)v39;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityRepairAndExport", v40, &handler);
  v41 = pp_default_log_handle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_INFO, "PPMaintenance: registered task NamedEntityRepairAndExport", buf, 2u);
  }

  self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v42 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v42, v2, v3);
    xpc_dictionary_set_string(v42, key, string);
    xpc_dictionary_set_BOOL(v42, v108, 0);
    xpc_dictionary_set_string(v42, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v42, v107, 1uLL);
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.RTCSendLogs", v42, &__block_literal_global_177_17343);
    v43 = pp_default_log_handle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      LOWORD(handler) = 0;
      _os_log_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_INFO, "PPMaintenance: registered task RTCSendLogs", (uint8_t *)&handler, 2u);
    }
  }
  uint64_t v44 = self;
  xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v45, v2, v3);
  xpc_dictionary_set_string(v45, key, string);
  xpc_dictionary_set_BOOL(v45, v108, 0);
  xpc_dictionary_set_string(v45, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v45, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = (char *)v44;
  v129 = sel__registerDailyMetricsLogging;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DailyMetricsLogging", v45, &handler);
  v46 = pp_default_log_handle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DailyMetricsLogging", buf, 2u);
  }

  uint64_t v47 = self;
  xpc_object_t v48 = xpc_dictionary_create(0, 0, 0);
  int64_t v105 = *MEMORY[0x1E4F14228];
  xpc_dictionary_set_int64(v48, v2, *MEMORY[0x1E4F14228]);
  xpc_dictionary_set_string(v48, key, string);
  xpc_dictionary_set_BOOL(v48, v108, 0);
  xpc_dictionary_set_string(v48, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v48, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerLogNamedEntityFirstSource;
  v129 = (char *)v47;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogNamedEntityFirstSource", v48, &handler);
  v49 = pp_default_log_handle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogNamedEntityFirstSource", buf, 2u);
  }

  uint64_t v50 = self;
  xpc_object_t v51 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v51, v2, v105);
  xpc_dictionary_set_string(v51, key, string);
  xpc_dictionary_set_BOOL(v51, v108, 0);
  xpc_dictionary_set_string(v51, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v51, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerLogTopicFirstSource;
  v129 = (char *)v50;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogTopicFirstSource", v51, &handler);
  v52 = pp_default_log_handle();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogTopicFirstSource", buf, 2u);
  }

  uint64_t v53 = self;
  xpc_object_t v54 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v54, v2, v3);
  xpc_dictionary_set_string(v54, key, string);
  xpc_dictionary_set_BOOL(v54, v108, 0);
  xpc_dictionary_set_string(v54, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v54, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerLogNamedEntityPerplexity;
  v129 = (char *)v53;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogNamedEntityPerplexity", v54, &handler);
  v55 = pp_default_log_handle();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogNamedEntityPerplexity", buf, 2u);
  }

  uint64_t v56 = self;
  xpc_object_t v57 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v57, v2, v3);
  xpc_dictionary_set_string(v57, key, string);
  xpc_dictionary_set_BOOL(v57, v108, 0);
  xpc_dictionary_set_string(v57, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v57, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerLogTopicPerplexity;
  v129 = (char *)v56;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogTopicPerplexity", v57, &handler);
  v58 = pp_default_log_handle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v58, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogTopicPerplexity", buf, 2u);
  }

  uint64_t v59 = self;
  xpc_object_t v60 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v60, v2, v3);
  xpc_dictionary_set_string(v60, key, string);
  xpc_dictionary_set_BOOL(v60, v108, 0);
  xpc_dictionary_set_string(v60, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v60, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerLogLocationPerplexity;
  v129 = (char *)v59;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogLocationPerplexity", v60, &handler);
  v61 = pp_default_log_handle();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v61, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogLocationPerplexity", buf, 2u);
  }

  uint64_t v62 = self;
  xpc_object_t v63 = xpc_dictionary_create(0, 0, 0);
  v64 = v2;
  xpc_dictionary_set_int64(v63, v2, v3);
  xpc_dictionary_set_string(v63, key, string);
  xpc_dictionary_set_BOOL(v63, v108, 0);
  xpc_dictionary_set_BOOL(v63, (const char *)*MEMORY[0x1E4F14330], 1);
  xpc_dictionary_set_string(v63, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v63, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __44__PPMaintenance__registerLogSportsFavorites__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = (char *)v62;
  v129 = sel__registerLogSportsFavorites;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogSportsFavorites", v63, &handler);
  v65 = pp_default_log_handle();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v65, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogSportsFavorites", buf, 2u);
  }

  +[PPSocialHighlightMetrics registerCTSDataCollection];
  uint64_t v66 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v67 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v67, v2, v3);
    xpc_dictionary_set_string(v67, key, string);
    xpc_dictionary_set_BOOL(v67, v108, 0);
    xpc_dictionary_set_string(v67, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v67, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerTTLBasedDonationCleanup;
    v129 = (char *)v66;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TTLBasedDonationCleanup", v67, &handler);
    v68 = pp_default_log_handle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v68, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TTLBasedDonationCleanup", buf, 2u);
    }
  }
  uint64_t v69 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v70 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v70, v2, v3);
    xpc_dictionary_set_string(v70, key, string);
    xpc_dictionary_set_BOOL(v70, v108, 0);
    xpc_dictionary_set_string(v70, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v70, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerRemotelyDonatedRecordCleanup;
    v129 = (char *)v69;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.RemotelyDonatedRecordCleanup", v70, &handler);
    v71 = pp_default_log_handle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_INFO, "PPMaintenance: registered task RemotelyDonatedRecordCleanup", buf, 2u);
    }
  }
  uint64_t v72 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v73 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v73, key, string);
    xpc_dictionary_set_int64(v73, v2, v3);
    xpc_dictionary_set_BOOL(v73, v108, 0);
    xpc_dictionary_set_string(v73, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v73, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerTTLBasedDecayedFeedbackCountsCleanup;
    v129 = (char *)v72;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TTLBasedFeedbackRecordCleanup", v73, &handler);
    v74 = pp_default_log_handle();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v74, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TTLBasedFeedbackRecordCleanup", buf, 2u);
    }
  }
  uint64_t v75 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v76 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v76, key, string);
    xpc_dictionary_set_int64(v76, v2, v3);
    xpc_dictionary_set_BOOL(v76, v108, 0);
    xpc_dictionary_set_string(v76, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v76, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerDecayedFeedbackCountsCleanup;
    v129 = (char *)v75;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DecayedFeedbackCleanup", v76, &handler);
    v77 = pp_default_log_handle();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v77, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DecayedFeedbackCleanup", buf, 2u);
    }
  }
  uint64_t v78 = self;
  xpc_object_t v79 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v79, v2, v3);
  v80 = key;
  v81 = string;
  xpc_dictionary_set_string(v79, key, string);
  xpc_dictionary_set_BOOL(v79, v108, 0);
  xpc_dictionary_set_string(v79, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v79, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerNamedEntityFiltering;
  v129 = (char *)v78;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityFiltering", v79, &handler);

  uint64_t v82 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v83 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v83, v110, v105);
    xpc_dictionary_set_string(v83, key, string);
    xpc_dictionary_set_BOOL(v83, v108, 0);
    xpc_dictionary_set_BOOL(v83, (const char *)*MEMORY[0x1E4F14310], 1);
    xpc_dictionary_set_string(v83, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v83, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __40__PPMaintenance__registerDatabaseVacuum__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerDatabaseVacuum;
    v129 = (char *)v82;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.VacuumDatabase", v83, &handler);
    v84 = pp_default_log_handle();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v84, OS_LOG_TYPE_INFO, "PPMaintenance: registered task VacuumDatabase", buf, 2u);
    }

    v64 = v110;
    v81 = string;
    v80 = key;
  }
  uint64_t v85 = self;
  xpc_object_t v86 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v86, v64, v3);
  xpc_dictionary_set_string(v86, v80, v81);
  xpc_dictionary_set_BOOL(v86, v108, 0);
  xpc_dictionary_set_string(v86, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v86, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerSocialHighlightFeedbackCleanUp;
  v129 = (char *)v85;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SocialHighlightFeedbackCleanUp", v86, &handler);
  v87 = pp_default_log_handle();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v87, OS_LOG_TYPE_INFO, "PPMaintenance: registered task SocialHighlightCleanUp", buf, 2u);
  }

  self;
  xpc_object_t v88 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v88, v110, v3);
  xpc_dictionary_set_string(v88, key, string);
  xpc_dictionary_set_BOOL(v88, v108, 1);
  xpc_dictionary_set_string(v88, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v88, v107, 1uLL);
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SpotlightScoringCache", v88, &__block_literal_global_457);
  v89 = pp_default_log_handle();
  BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
  v91 = (const char **)MEMORY[0x1E4F14310];
  if (v90)
  {
    LOWORD(handler) = 0;
    _os_log_impl(&dword_1CA9A8000, v89, OS_LOG_TYPE_INFO, "PPMaintenance: registered task SpotlightScoringCache", (uint8_t *)&handler, 2u);
  }

  uint64_t v92 = self;
  xpc_object_t v93 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v93, v110, v3);
  xpc_dictionary_set_string(v93, key, string);
  xpc_dictionary_set_BOOL(v93, v108, 0);
  v106 = *v91;
  xpc_dictionary_set_BOOL(v93, *v91, 1);
  xpc_dictionary_set_string(v93, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v93, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __45__PPMaintenance__registerContactHandlesCache__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerContactHandlesCache;
  v129 = (char *)v92;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ContactHandlesCache", v93, &handler);
  v94 = pp_default_log_handle();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v94, OS_LOG_TYPE_INFO, "PPMaintenance: registered task ContactHandlesCache", buf, 2u);
  }

  uint64_t v95 = self;
  xpc_object_t v96 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v96, key, string);
  xpc_dictionary_set_int64(v96, v110, v3);
  xpc_dictionary_set_BOOL(v96, v108, 0);
  xpc_dictionary_set_string(v96, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v96, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __48__PPMaintenance__registerProcessPendingFeedback__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = (char *)v95;
  v129 = sel__registerProcessPendingFeedback;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.FeedbackProcessing", v96, &handler);
  v97 = pp_default_log_handle();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v97, OS_LOG_TYPE_INFO, "PPMaintenance: registered task FeedbackProcessing", buf, 2u);
  }

  uint64_t v98 = self;
  xpc_object_t v99 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v99, key, string);
  xpc_dictionary_set_int64(v99, v110, v3);
  xpc_dictionary_set_BOOL(v99, v108, 0);
  xpc_dictionary_set_string(v99, v109, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v99, v107, 1uLL);
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v125 = 3221225472;
  v126 = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke;
  v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v128 = sel__registerDecayedFeedbackCountsDecay;
  v129 = (char *)v98;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DecayedFeedbackCountsDecay", v99, &handler);
  v100 = pp_default_log_handle();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v100, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DecayedFeedbackCountsDecay", buf, 2u);
  }

  self;
  if (_registerNowPlayingMPRequestResponseController_onceToken != -1) {
    dispatch_once(&_registerNowPlayingMPRequestResponseController_onceToken, &__block_literal_global_173);
  }
  uint64_t v101 = self;
  if (([MEMORY[0x1E4F93B08] isAudioAccessory] & 1) == 0)
  {
    xpc_object_t v102 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v102, v110, v3);
    xpc_dictionary_set_string(v102, key, string);
    xpc_dictionary_set_BOOL(v102, v108, 0);
    xpc_dictionary_set_BOOL(v102, v106, 1);
    xpc_dictionary_set_string(v102, v109, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v102, v107, 1uLL);
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v125 = 3221225472;
    v126 = __42__PPMaintenance__registerOptimizeDatabase__block_invoke;
    v127 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v128 = sel__registerOptimizeDatabase;
    v129 = (char *)v101;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.OptimizeDatabase", v102, &handler);
    v103 = pp_default_log_handle();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v103, OS_LOG_TYPE_INFO, "PPMaintenance: registered task OptimizeDatabase", buf, 2u);
    }
  }
  self;
  xpc_activity_unregister("com.apple.proactive.PersonalizationPortrait.SocialHighlightFeedbackSync");
  v104 = +[PPSettings sharedInstance];
  [v104 registerDisabledBundleIdPurgeHandler];

  keya = +[PPSettings sharedInstance];
  [keya registerCloudKitDisabledBundleIdRewriteHandler];
}

void __42__PPMaintenance__registerOptimizeDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PPMaintenance__registerOptimizeDatabase__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  xpc_object_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__PPMaintenance__registerOptimizeDatabase__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OptimizeDatabase", "", buf, 2u);
  }

  v7[2](v7);
  v12 = pp_maintenance_signpost_handle();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "OptimizeDatabase", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      xpc_object_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:337 description:@"Unexpected failure of deferral"];
    }
    v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: OptimizeDatabase: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __42__PPMaintenance__registerOptimizeDatabase__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __42__PPMaintenance__registerOptimizeDatabase__block_invoke_3(uint64_t a1)
{
  v2 = +[PPSQLDatabase sharedInstance];
  id v3 = v2;
  if (!v2)
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "OptimizeDatabase failed to create database, giving up.";
      id v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([v2 optimizeDatabaseWithShouldContinueBlock:*(void *)(a1 + 32)])
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      uint64_t v5 = "OptimizeDatabase completed successfully.";
      id v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __63__PPMaintenance__registerNowPlayingMPRequestResponseController__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)_registerNowPlayingMPRequestResponseController_delegate;
  _registerNowPlayingMPRequestResponseController_delegate = v0;

  v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: _registerNowPlayingMPRequestResponseController was called!", v3, 2u);
  }
}

void __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  xpc_object_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  __int16 v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DecayedFeedbackCountsDecay", "", buf, 2u);
  }

  v7[2](v7);
  v12 = pp_maintenance_signpost_handle();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "DecayedFeedbackCountsDecay", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      xpc_object_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:1234 description:@"Unexpected failure of deferral"];
    }
    v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_3(uint64_t a1)
{
  v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: starting", v35, 2u);
  }

  id v3 = +[PPConfiguration sharedInstance];
  [v3 decayedFeedbackCountsHalfLifeDays];
  double v5 = v4;

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing topic store", v35, 2u);
    }

    __int16 v7 = +[PPLocalTopicStore defaultStore];
  }
  else
  {
    __int16 v7 = 0;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing named entity store", v35, 2u);
    }

    os_signpost_id_t v9 = +[PPLocalNamedEntityStore defaultStore];
  }
  else
  {
    os_signpost_id_t v9 = 0;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing location store", v35, 2u);
    }

    os_signpost_id_t v11 = +[PPLocalLocationStore defaultStore];
  }
  else
  {
    os_signpost_id_t v11 = 0;
  }
  double v12 = 0.693147181 / v5;
  uint64_t v13 = [v7 storage];
  if (v13)
  {
    int v14 = (void *)v13;
    int v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if (v15)
    {
      v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for topic feedback counts", v35, 2u);
      }

      xpc_object_t v17 = [v7 storage];
      char v18 = [v17 decayFeedbackCountsWithDecayRate:*(void *)(a1 + 32) shouldContinueBlock:v12];

      if ((v18 & 1) == 0)
      {
        id v19 = pp_default_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for topic feedback", v35, 2u);
        }
      }
    }
  }
  uint64_t v20 = [v9 storage];
  if (v20)
  {
    id v21 = (void *)v20;
    int v22 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if (v22)
    {
      uint64_t v23 = pp_default_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for named entity feedback counts", v35, 2u);
      }

      uint64_t v24 = [v9 storage];
      char v25 = [v24 decayFeedbackCountsWithDecayRate:*(void *)(a1 + 32) shouldContinueBlock:v12];

      if ((v25 & 1) == 0)
      {
        char v26 = pp_default_log_handle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for named entity feedback", v35, 2u);
        }
      }
    }
  }
  uint64_t v27 = [v11 storage];
  if (v27)
  {
    int v28 = (void *)v27;
    int v29 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if (v29)
    {
      xpc_object_t v30 = pp_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for location feedback counts", v35, 2u);
      }

      v31 = [v11 storage];
      char v32 = [v31 decayFeedbackCountsWithDecayRate:*(void *)(a1 + 32) shouldContinueBlock:v12];

      if ((v32 & 1) == 0)
      {
        uint64_t v33 = pp_default_log_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for location feedback", v35, 2u);
        }
      }
    }
  }
  xpc_object_t v34 = pp_default_log_handle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: finished", v35, 2u);
  }
}

void __48__PPMaintenance__registerProcessPendingFeedback__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v25 = &v26;
  id v4 = v3;
  id v24 = v4;
  double v5 = _Block_copy(aBlock);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v6 = pp_maintenance_signpost_handle();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FeedbackProcessing", "", buf, 2u);
  }

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_189;
  uint64_t v20 = &unk_1E65D8BF0;
  uint64_t v22 = *(void *)(a1 + 32);
  id v10 = v5;
  id v21 = v10;
  __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_189((uint64_t)&v17);
  os_signpost_id_t v11 = pp_maintenance_signpost_handle();
  double v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = *((unsigned __int8 *)v27 + 24);
    *(_DWORD *)buf = 67109120;
    int v31 = v13;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "FeedbackProcessing", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v27 + 24)) {
    int v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v14);

  if (*((unsigned char *)v27 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      v16 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v17, v18, v19, v20);
      [v16 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPMaintenance.m" lineNumber:1150 description:@"Unexpected failure of deferral"];
    }
    int v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: FeedbackProcessing: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v26, 8);
}

uint64_t __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_189(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t (**)(void))*(id *)(a1 + 32);
  self;
  v2 = objc_opt_new();
  id v3 = +[PPConfiguration sharedInstance];
  [v3 portraitAnalyticsSamplingRate];
  id v15 = 0;
  char v4 = objc_msgSend(v2, "constructAndSendMessageForSamplingRate:shouldContinueBlock:error:", v1, &v15);
  id v5 = v15;
  id v16 = v5;

  if ((v4 & 1) == 0)
  {
    id v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPCollaborativeFilteringSampler: failed to complete: %@", buf, 0xCu);
    }
  }
  if ((v1[2](v1) & 1) == 0)
  {
    int v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "Processing feedback deferred after data collection.";
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  os_signpost_id_t v7 = objc_opt_new();
  char v8 = [v7 processPendingFeedbackWithShouldContinueBlock:v1 error:&v16];

  if ((v8 & 1) == 0)
  {
    os_signpost_id_t v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v16;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "Feedback processing failed: %@", buf, 0xCu);
    }
  }
  if ((v1[2](v1) & 1) == 0)
  {
    id v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "Processing feedback deferred partway through processing.", buf, 2u);
    }
  }
  os_signpost_id_t v11 = objc_opt_new();
  char v12 = [v11 deleteExpiredFeedbackWithShouldContinueBlock:v1];

  if ((v12 & 1) == 0)
  {
    int v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v14 = "Processing pending feedback deferred during clean up operations.";
LABEL_19:
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
LABEL_21:
}

void __45__PPMaintenance__registerContactHandlesCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerContactHandlesCache__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  id v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__PPMaintenance__registerContactHandlesCache__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  os_signpost_id_t v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  char v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ContactHandlesCache", "", buf, 2u);
  }

  v7[2](v7);
  char v12 = pp_maintenance_signpost_handle();
  int v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ContactHandlesCache", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:292 description:@"Unexpected failure of deferral"];
    }
    id v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: ContactHandlesCache: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __45__PPMaintenance__registerContactHandlesCache__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerContactHandlesCache__block_invoke_3(uint64_t a1)
{
  id v2 = +[PPLocalContactStore defaultStore];
  [v2 rebuildCachedSignificantContactHandlesWithShouldContinue:*(void *)(a1 + 32)];
}

void __47__PPMaintenance__registerSpotlightScoringCache__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  id v18 = &v19;
  id v3 = v2;
  id v17 = v3;
  id v4 = _Block_copy(aBlock);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v5 = pp_maintenance_signpost_handle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  os_signpost_id_t v7 = pp_maintenance_signpost_handle();
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SpotlightScoringCache", "", buf, 2u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_458;
  v13[3] = &unk_1E65D8B20;
  id v9 = v4;
  id v14 = v9;
  __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_458((uint64_t)v13);
  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SpotlightScoringCache", " enableTelemetry=YES ", buf, 2u);
  }

  if (*((unsigned char *)v20 + 24)) {
    char v12 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    char v12 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v12);

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_458(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    id v2 = pp_default_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "Deferred topic scores", buf, 2u);
    }
  }
  id v3 = +[PPLocalTopicStore defaultStore];
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  int v5 = [v3 computeAndCacheTopicScoresWithShouldContinueBlock:v4 error:&v13];
  id v6 = v13;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    char v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v11 = &stru_1F253DF18;
      if (!v6) {
        os_signpost_id_t v11 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPMaintenance was unable to compute and cache topic scores: %@", buf, 0xCu);
    }

    id v9 = +[PPLocalTopicStore defaultStore];
    id v12 = v6;
    [v9 clearTopicScoresCache:&v12];
    id v10 = v12;
  }
}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  BOOL v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  char v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SocialHighlightCleanUp", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "SocialHighlightCleanUp", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:769 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: SocialHighlightCleanUp: deferred.", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_3(uint64_t a1)
{
  id v4 = (id)objc_opt_new();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[PPConfiguration sharedInstance];
  [v3 socialHighlightFeedbackDeletionInterval];
  objc_msgSend(v4, "cleanUpFeedbackWithShouldContinueBlock:ttl:onDeleteBlock:", v2, &__block_literal_global_151);
}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  +[PPSocialHighlightMetrics logMetricsForExpiringFeedback:v2];
  id v3 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v2 highlight];
    int v5 = [v4 highlightIdentifier];
    int v6 = 138412290;
    BOOL v7 = v5;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPMaintenance: removed feedback for identifier %@", (uint8_t *)&v6, 0xCu);
  }
}

void __40__PPMaintenance__registerDatabaseVacuum__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerDatabaseVacuum__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__PPMaintenance__registerDatabaseVacuum__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  BOOL v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VacuumDatabase", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "VacuumDatabase", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:383 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: VacuumDatabase: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __40__PPMaintenance__registerDatabaseVacuum__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerDatabaseVacuum__block_invoke_3(uint64_t a1)
{
  id v2 = +[PPSQLDatabase sharedInstance];
  id v3 = v2;
  if (!v2)
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v5 = "Vacuum database failed to create database, giving up.";
      id v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([v2 vacuumDatabaseWithShouldContinueBlock:*(void *)(a1 + 32)])
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      int v5 = "Vacuum database completed successfully.";
      id v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __46__PPMaintenance__registerNamedEntityFiltering__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  int v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  __int16 v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityFiltering", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityFiltering", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:669 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring named entity filtering.", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance: beginning named entity filtering.", buf, 2u);
  }

  id v3 = +[PPLocalNamedEntityStore defaultStore];
  char v4 = [v3 filterExistingNamedEntitiesWithShouldContinueBlock:*(void *)(a1 + 32)];

  if ((v4 & 1) == 0)
  {
    int v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: unable to successfully complete named entity filtering.", v6, 2u);
    }
  }
}

void __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v26 = &v27;
  id v4 = v3;
  id v25 = v4;
  int v5 = _Block_copy(aBlock);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_3;
  id v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  uint64_t v23 = &v27;
  __int16 v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DecayedFeedbackCleanup", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    int v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "DecayedFeedbackCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v28 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:1423 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCleanup: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCleanup: starting", buf, 2u);
  }

  id v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Performing topic feedback cleanup", buf, 2u);
  }

  char v23 = 0;
  *(void *)buf = 0;
  id v4 = +[PPLocalTopicStore defaultStore];
  uint64_t v5 = 0;
  int v6 = 30;
  while ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    if (([v4 pruneOrphanedTopicFeedbackCountsWithLimit:100 rowOffset:v5 deletedCount:buf isComplete:&v23] & 1) == 0)
    {
      __int16 v7 = pp_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v21 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up topic feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      uint64_t v5 = v5 - *(void *)buf + 100;
      if (--v6) {
        continue;
      }
    }
    break;
  }
  uint64_t v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "Finished topic feedback cleanup", v21, 2u);
  }

  os_signpost_id_t v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "Running location feedback cleanup", buf, 2u);
  }

  char v23 = 0;
  *(void *)buf = 0;
  id v10 = +[PPLocalLocationStore defaultStore];
  uint64_t v11 = 0;
  int v12 = 30;
  while ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    if (([v10 pruneOrphanedLocationFeedbackCountsWithLimit:100 rowOffset:v11 deletedCount:buf isComplete:&v23] & 1) == 0)
    {
      id v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v21 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up location feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      uint64_t v11 = v11 - *(void *)buf + 100;
      if (--v12) {
        continue;
      }
    }
    break;
  }
  int v14 = pp_default_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "Finished location feedback cleanup", v21, 2u);
  }

  id v15 = pp_default_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Running named entity feedback cleanup", buf, 2u);
  }

  char v23 = 0;
  *(void *)buf = 0;
  uint64_t v16 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v17 = 0;
  int v18 = 30;
  while ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    if (([v16 pruneOrphanedNamedEntityFeedbackCountsWithLimit:100 rowOffset:v17 deletedCount:buf isComplete:&v23] & 1) == 0)
    {
      uint64_t v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v21 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up named entity feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      uint64_t v17 = v17 - *(void *)buf + 100;
      if (--v18) {
        continue;
      }
    }
    break;
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v20 = pp_default_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "Finished named entity feedback cleanup", buf, 2u);
    }
  }
}

void __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v26 = &v27;
  id v4 = v3;
  id v25 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_3;
  id v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  char v23 = &v27;
  __int16 v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TTLBasedFeedbackRecordCleanup", "", buf, 2u);
  }

  v7[2](v7);
  int v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    int v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TTLBasedFeedbackRecordCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v28 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:1314 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: starting", v18, 2u);
  }

  id v3 = objc_opt_new();
  id v4 = [v3 dateByAddingTimeInterval:-2592000.0];

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing topic store", v18, 2u);
    }

    id v6 = +[PPLocalTopicStore defaultStore];
  }
  else
  {
    id v6 = 0;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    __int16 v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing named entity store", v18, 2u);
    }

    uint64_t v8 = +[PPLocalNamedEntityStore defaultStore];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v10 = 0;
    if (!v6) {
      goto LABEL_26;
    }
    goto LABEL_19;
  }
  os_signpost_id_t v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing location store", v18, 2u);
  }

  id v10 = +[PPLocalLocationStore defaultStore];
  if (v6)
  {
LABEL_19:
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      uint64_t v11 = pp_default_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "Running TTL-based topic feedback cleanup", v18, 2u);
      }

      if (([v6 deleteAllTopicFeedbackCountsOlderThanDate:v4] & 1) == 0)
      {
        int v12 = pp_default_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for topic feedback", v18, 2u);
        }
      }
    }
  }
LABEL_26:
  if (v8 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "Running TTL-based named entity feedback cleanup", v18, 2u);
    }

    if (([v8 deleteAllNamedEntityFeedbackCountsOlderThanDate:v4] & 1) == 0)
    {
      int v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for named entity feedback", v18, 2u);
      }
    }
  }
  if (v10 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Running TTL-based location feedback cleanup", v18, 2u);
    }

    if (([v10 deleteAllLocationFeedbackCountsOlderThanDate:v4] & 1) == 0)
    {
      uint64_t v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for location feedback", v18, 2u);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: finished", v18, 2u);
    }
  }
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke(uint64_t a1, void *a2)
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v39 = 0;
  xpc_object_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  v38 = &v39;
  id v4 = v3;
  id v37 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_3;
  v34[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v35 = v6;
  __int16 v7 = _Block_copy(v34);
  v45[0] = v7;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_155;
  v32[3] = &unk_1E65D8B20;
  id v8 = v6;
  id v33 = v8;
  os_signpost_id_t v9 = _Block_copy(v32);
  v45[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];

  uint64_t v11 = objc_opt_new();
  int v12 = objc_msgSend(v10, "_pas_shuffledArrayUsingRng:", v11);

  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  int v28 = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_159;
  uint64_t v29 = &unk_1E65DA2E8;
  id v13 = v12;
  id v30 = v13;
  id v14 = v8;
  id v31 = v14;
  id v15 = (void (**)(void))_Block_copy(&v26);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v16 = pp_maintenance_signpost_handle();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  uint64_t v18 = pp_maintenance_signpost_handle();
  uint64_t v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RemotelyDonatedRecordCleanup", "", buf, 2u);
  }

  v15[2](v15);
  uint64_t v20 = pp_maintenance_signpost_handle();
  id v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    int v22 = *((unsigned __int8 *)v40 + 24);
    *(_DWORD *)buf = 67109120;
    int v44 = v22;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v21, OS_SIGNPOST_INTERVAL_END, v17, "RemotelyDonatedRecordCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v40 + 24)) {
    char v23 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    char v23 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v23);
  if (*((unsigned char *)v40 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      id v25 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v26, v27, v28, v29, v30);
      [v25 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:832 description:@"Unexpected failure of deferral"];
    }
    id v24 = pp_default_log_handle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v39, 8);
}

uint64_t __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting for named entity records", v5, 2u);
  }

  id v3 = +[PPLocalNamedEntityStore defaultStore];
  id v4 = [v3 storage];
  if (v4 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [v4 clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:*(void *)(a1 + 32)];
  }
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_155(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting for topic records", v5, 2u);
  }

  id v3 = +[PPLocalTopicStore defaultStore];
  id v4 = [v3 storage];
  if (v4 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [v4 clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:*(void *)(a1 + 32)];
  }
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_159(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting", buf, 2u);
  }

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
      if (!(*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40))) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
        if (v5) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    id v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: finished", buf, 2u);
    }
  }
}

void __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v26 = &v27;
  id v4 = v3;
  id v25 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_3;
  id v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  char v23 = &v27;
  uint64_t v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  long long v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  long long v10 = pp_maintenance_signpost_handle();
  long long v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TTLBasedDonationCleanup", "", buf, 2u);
  }

  v7[2](v7);
  int v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    int v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TTLBasedDonationCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v28 + 24)) {
    id v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      os_signpost_id_t v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:723 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: deferred.", buf, 2u);
    }
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: starting.", buf, 2u);
  }

  id v3 = +[PPTTLDeletionPolicy defaultPolicy];
  id v4 = pp_default_log_handle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: using policy: %@", buf, 0xCu);
    }

    id v13 = 0;
    int v6 = [v3 applyPolicyWithError:&v13 shouldContinueBlock:*(void *)(a1 + 32)];
    id v4 = v13;
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    long long v8 = pp_default_log_handle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        long long v10 = "PPMaintenance: TTLBasedDonationCleanup: deferring.";
LABEL_14:
        long long v11 = v8;
        uint32_t v12 = 2;
LABEL_15:
        _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
    else
    {
      if (!v6)
      {
        if (!v9) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        long long v10 = "PPMaintenance: TTLBasedDonationCleanup: failed with error: %@";
        long long v11 = v8;
        uint32_t v12 = 12;
        goto LABEL_15;
      }
      if (v9)
      {
        *(_WORD *)buf = 0;
        long long v10 = "PPMaintenance: TTLBasedDonationCleanup: completed successfully.";
        goto LABEL_14;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: failed to load default policy, possibly due to device lock.", buf, 2u);
  }
LABEL_17:
}

void __44__PPMaintenance__registerLogSportsFavorites__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  BOOL v5 = +[PPConfiguration sharedInstance];
  [v5 sportsMetricsSamplingRate];
  if (objc_msgSend(v4, "yesWithProbability:"))
  {

    goto LABEL_4;
  }
  char v6 = [MEMORY[0x1E4F89FC8] isInternalDevice];

  if (v6)
  {
LABEL_4:
    *(void *)uint64_t v33 = 0;
    xpc_object_t v34 = v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PPMaintenance__registerLogSportsFavorites__block_invoke_397;
    aBlock[3] = &unk_1E65D8AF8;
    int v32 = v33;
    id v7 = v3;
    id v31 = v7;
    long long v8 = _Block_copy(aBlock);
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __44__PPMaintenance__registerLogSportsFavorites__block_invoke_2;
    v22[3] = &unk_1E65D8E18;
    id v9 = v8;
    id v23 = v9;
    id v24 = &v26;
    uint64_t v25 = *(void *)(a1 + 32);
    long long v10 = (void (**)(void))_Block_copy(v22);
    PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
    long long v11 = pp_maintenance_signpost_handle();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    id v13 = pp_maintenance_signpost_handle();
    int v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LogSportsFavorites", "", buf, 2u);
    }

    v10[2](v10);
    id v15 = pp_maintenance_signpost_handle();
    uint64_t v16 = v15;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v17 = v34[24];
      *(_DWORD *)buf = 67109120;
      int v38 = v17;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v16, OS_SIGNPOST_INTERVAL_END, v12, "LogSportsFavorites", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (v34[24]) {
      uint64_t v18 = (const char **)&kPPMaintenanceJobDeferredNotification;
    }
    else {
      uint64_t v18 = (const char **)&kPPMaintenanceJobCompletedNotification;
    }
    PPPostNotification(*v18);
    if (!*((unsigned char *)v27 + 24) && v34[24])
    {
      if (!xpc_activity_set_state((xpc_activity_t)v7, 3))
      {
        id v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPMaintenance.m" lineNumber:2582 description:@"Unexpected failure of deferral"];
      }
      uint64_t v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogSportsFavorites: deferring", buf, 2u);
      }
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v33, 8);
    goto LABEL_24;
  }
  uint64_t v20 = pp_default_log_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: Sports metrics skipped due to sampling.", v33, 2u);
  }

LABEL_24:
}

uint64_t __44__PPMaintenance__registerLogSportsFavorites__block_invoke_397(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __44__PPMaintenance__registerLogSportsFavorites__block_invoke_2(uint64_t a1)
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v71 = a1;
    xpc_object_t v73 = (uint64_t (**)(void))*(id *)(a1 + 32);
    uint64_t v2 = self;
    context = (void *)MEMORY[0x1CB79D060](v2);
    id v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v133 = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "PPMaintenance: enters _logSportsFavorites", v133, 2u);
    }

    id v4 = +[PPTrialWrapper sharedInstance];
    BOOL v5 = [v4 trieForFactorName:@"tvAppSportsFavorites.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];

    if (v5)
    {
      if (v73[2]())
      {
        os_log_t oslog = (os_log_t)objc_opt_new();
        char v6 = (void *)[@"PersonalizationPortrait" copy];
        [oslog setCaller:v6];

        id v7 = dispatch_group_create();
        dispatch_group_enter(v7);
        uint64_t v112 = 0;
        v113 = &v112;
        uint64_t v114 = 0x3032000000;
        v115 = __Block_byref_object_copy__17155;
        uint64_t v116 = __Block_byref_object_dispose__17156;
        id v117 = 0;
        v109[0] = MEMORY[0x1E4F143A8];
        v109[1] = 3221225472;
        v109[2] = __35__PPMaintenance__logSportsMetrics___block_invoke;
        v109[3] = &unk_1E65D8E40;
        v111 = &v112;
        long long v8 = v7;
        v110 = v8;
        [oslog makeRequestWithCompletion:v109];
        uint64_t v69 = v8;
        int v9 = [MEMORY[0x1E4F93B18] waitForGroup:v8 timeoutSeconds:8.0];
        if ((v73[2]() & 1) == 0)
        {
          id v21 = pp_default_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v133 = 0;
            _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
          }
          int v9 = 1;
          goto LABEL_62;
        }
        if (v9 != 1)
        {
          if (v113[5])
          {
            id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
            long long v11 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend((id)v113[5], "count"));
            uint64_t v75 = objc_opt_new();
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v12 = (id)v113[5];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v105 objects:v133 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v106;
              do
              {
                uint64_t v15 = 0;
                do
                {
                  if (*(void *)v106 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v16 = *(void **)(*((void *)&v105 + 1) + 8 * v15);
                  int v17 = pp_default_log_handle();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v19 = [v16 ID];
                    uint64_t v20 = [v16 name];
                    *(_DWORD *)buf = 138740227;
                    v130 = v19;
                    __int16 v131 = 2117;
                    v132 = v20;
                    _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "PPMaintenance: TV app favorite: %{sensitive}@: \t\t %{sensitive}@", buf, 0x16u);
                  }
                  uint64_t v18 = [v16 ID];
                  [v11 addObject:v18];

                  ++v15;
                }
                while (v13 != v15);
                uint64_t v13 = [v12 countByEnumeratingWithState:&v105 objects:v133 count:16];
              }
              while (v13);
            }

            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            id v21 = v11;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v101 objects:buf count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v102;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v102 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v25 = [v5 payloadForString:*(void *)(*((void *)&v101 + 1) + 8 * i)];
                  if (v25)
                  {
                    uint64_t v26 = [NSNumber numberWithUnsignedInt:v25];
                    [v75 addObject:v26];
                  }
                }
                uint64_t v22 = [v21 countByEnumeratingWithState:&v101 objects:buf count:16];
              }
              while (v22);
            }

            uint64_t v27 = +[PPLocalTopicStore defaultStore];
            uint64_t v28 = objc_opt_new();
            id v100 = 0;
            v68 = [v27 scoresForTopicMapping:@"sirisports" query:v28 error:&v100];
            id v67 = v100;

            if (v68)
            {
              char v29 = pp_default_log_handle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(v118) = 138739971;
                *(void *)((char *)&v118 + 4) = v68;
                _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPMaintenance: Portrait siri sports predictions:\n%{sensitive}@", (uint8_t *)&v118, 0xCu);
              }

              if (v73[2]())
              {
                uint64_t v30 = [v68 keysSortedByValueUsingComparator:&__block_literal_global_413];
                id v31 = objc_opt_new();
                xpc_object_t v70 = v30;
                int v32 = +[PPConfiguration sharedInstance];
                int v65 = [v32 sportsMetricsNumberOfTeamsLogged];

                uint64_t v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamFalseNegativesTop%lu", v65);
                v64 = objc_msgSend(v33, "_pas_stringBackedByUTF8CString");

                xpc_object_t v34 = +[PPConfiguration sharedInstance];
                LODWORD(v33) = [v34 sportsMetricsNumberOfLeaguesLogged];

                unint64_t v35 = (int)v33;
                char v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueFalseNegativesTop%lu", (int)v33);
                xpc_object_t v63 = objc_msgSend(v36, "_pas_stringBackedByUTF8CString");

                id v37 = objc_opt_new();
                uint64_t v96 = 0;
                v97 = &v96;
                uint64_t v98 = 0x2020000000;
                uint64_t v99 = 0;
                uint64_t v99 = [v21 count];
                uint64_t v92 = 0;
                xpc_object_t v93 = &v92;
                uint64_t v94 = 0x2020000000;
                uint64_t v95 = 0;
                uint64_t v95 = [v21 count];
                uint64_t v88 = 0;
                v89 = &v88;
                uint64_t v90 = 0x2020000000;
                uint64_t v91 = 0;
                uint64_t v91 = [v75 count];
                uint64_t v84 = 0;
                uint64_t v85 = &v84;
                uint64_t v86 = 0x2020000000;
                uint64_t v87 = 0;
                uint64_t v87 = [v75 count];
                *(void *)&long long v118 = MEMORY[0x1E4F143A8];
                *((void *)&v118 + 1) = 3221225472;
                v119 = __35__PPMaintenance__logSportsMetrics___block_invoke_2;
                uint64_t v120 = &unk_1E65D8E68;
                id v121 = v5;
                uint64_t v128 = v65;
                id v38 = v37;
                id v122 = v38;
                id v123 = v68;
                v124 = v21;
                v126 = &v96;
                v127 = &v92;
                id v61 = v31;
                id v125 = v61;
                uint64_t v39 = [v70 enumerateObjectsUsingBlock:&v118];
                if (v65)
                {
                  for (unint64_t j = 0; j != v65; ++j)
                  {
                    uint64_t v41 = (void *)MEMORY[0x1CB79D060](v39);
                    if (j >= [v70 count])
                    {
                      char v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamScore%lu", j);
                      v43 = objc_msgSend(v42, "_pas_stringBackedByUTF8CString");
                      [v38 setObject:&unk_1F2569470 forKeyedSubscript:v43];

                      int v44 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamState%lu", j);
                      xpc_object_t v45 = objc_msgSend(v44, "_pas_stringBackedByUTF8CString");
                      [v38 setObject:&unk_1F2569488 forKeyedSubscript:v45];
                    }
                  }
                }
                uint64_t v66 = [v61 keysSortedByValueUsingComparator:&__block_literal_global_440];
                v77[0] = MEMORY[0x1E4F143A8];
                v77[1] = 3221225472;
                v77[2] = __35__PPMaintenance__logSportsMetrics___block_invoke_2_441;
                v77[3] = &unk_1E65D8E90;
                unint64_t v83 = v35;
                id v46 = v38;
                id v78 = v46;
                id v62 = v61;
                id v79 = v62;
                id v80 = v75;
                v81 = &v88;
                uint64_t v82 = &v84;
                [v66 enumerateObjectsUsingBlock:v77];
                unint64_t v47 = [v66 count];
                if (v47 < v35)
                {
                  do
                  {
                    xpc_object_t v48 = (void *)MEMORY[0x1CB79D060]();
                    v49 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueScore%lu", v47);
                    uint64_t v50 = objc_msgSend(v49, "_pas_stringBackedByUTF8CString");
                    [v46 setObject:&unk_1F2569470 forKeyedSubscript:v50];

                    xpc_object_t v51 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueState%lu", v47);
                    v52 = objc_msgSend(v51, "_pas_stringBackedByUTF8CString");
                    [v46 setObject:&unk_1F2569488 forKeyedSubscript:v52];

                    ++v47;
                  }
                  while (v35 != v47);
                }
                uint64_t v53 = [NSNumber numberWithUnsignedInteger:v97[3]];
                [v46 setObject:v53 forKeyedSubscript:@"teamFalseNegativesAll"];

                xpc_object_t v54 = [NSNumber numberWithUnsignedInteger:v93[3]];
                [v46 setObject:v54 forKeyedSubscript:v64];

                v55 = [NSNumber numberWithUnsignedInteger:v89[3]];
                [v46 setObject:v55 forKeyedSubscript:@"leagueFalseNegativesAll"];

                uint64_t v56 = [NSNumber numberWithUnsignedInteger:v85[3]];
                [v46 setObject:v56 forKeyedSubscript:v63];

                if (v73[2]())
                {
                  xpc_object_t v57 = +[PPConfiguration sharedInstance];
                  v58 = [v57 sportsMetricsEventName];
                  +[PPMetricsDispatcher logPayloadForEvent:v58 payload:v46 inBackground:1];

                  int v9 = 0;
                }
                else
                {
                  xpc_object_t v57 = pp_default_log_handle();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)xpc_object_t v76 = 0;
                    _os_log_debug_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v76, 2u);
                  }
                  int v9 = 1;
                }

                _Block_object_dispose(&v84, 8);
                _Block_object_dispose(&v88, 8);
                _Block_object_dispose(&v92, 8);
                _Block_object_dispose(&v96, 8);

                xpc_object_t v60 = v70;
                goto LABEL_61;
              }
              xpc_object_t v60 = pp_default_log_handle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v118) = 0;
                _os_log_debug_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", (uint8_t *)&v118, 2u);
              }
            }
            else
            {
              xpc_object_t v60 = pp_default_log_handle();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v118) = 138412290;
                *(void *)((char *)&v118 + 4) = v67;
                _os_log_error_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to get Portrait siri sports predictions:%@", (uint8_t *)&v118, 0xCu);
              }
            }
            int v9 = 1;
LABEL_61:

LABEL_62:
            goto LABEL_63;
          }
          int v9 = 1;
        }
LABEL_63:

        _Block_object_dispose(&v112, 8);
        goto LABEL_64;
      }
      pp_default_log_handle();
      os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v133 = 0;
        _os_log_debug_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
      }
    }
    else
    {
      pp_default_log_handle();
      os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v133 = 0;
        _os_log_error_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to load TV app Sports Favorites trie.", v133, 2u);
      }
    }
    int v9 = 1;
LABEL_64:

    *(unsigned char *)(*(void *)(*(void *)(v71 + 40) + 8) + 24) = v9 == 0;
    return;
  }
  uint64_t v59 = pp_default_log_handle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v133 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
  }
}

void __35__PPMaintenance__logSportsMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPMaintenance: Enters favRequest completion block.", (uint8_t *)&v11, 2u);
  }

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
    id v10 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    id v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to make WLKFavoritesRequest: %@", (uint8_t *)&v11, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __35__PPMaintenance__logSportsMetrics___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v26 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "payloadForString:");
  if (*(void *)(a1 + 88) > a3)
  {
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v26];
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamScore%lu", a3);
    id v9 = objc_msgSend(v8, "_pas_stringBackedByUTF8CString");
    [v7 setObject:v6 forKeyedSubscript:v9];
  }
  if (v5)
  {
    if ([*(id *)(a1 + 56) containsObject:v26])
    {
      --*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (*(void *)(a1 + 88) > a3)
      {
        --*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        id v10 = *(void **)(a1 + 40);
        int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamState%lu", a3);
        id v12 = objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
        uint64_t v13 = &unk_1F2569428;
LABEL_11:
        [v10 setObject:v13 forKeyedSubscript:v12];
      }
    }
    else if (*(void *)(a1 + 88) > a3)
    {
      id v10 = *(void **)(a1 + 40);
      int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamState%lu", a3);
      id v12 = objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
      uint64_t v13 = &unk_1F2569440;
      goto LABEL_11;
    }
    int v17 = NSNumber;
    uint64_t v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v26];
    [v15 doubleValue];
    double v19 = v18;
    uint64_t v20 = *(void **)(a1 + 64);
    uint64_t v16 = [NSNumber numberWithUnsignedInt:v5];
    id v21 = [v20 objectForKeyedSubscript:v16];
    [v21 doubleValue];
    uint64_t v23 = [v17 numberWithDouble:v19 + v22];
    id v24 = *(void **)(a1 + 64);
    uint64_t v25 = [NSNumber numberWithUnsignedInt:v5];
    [v24 setObject:v23 forKeyedSubscript:v25];

    goto LABEL_13;
  }
  if (*(void *)(a1 + 88) <= a3) {
    goto LABEL_14;
  }
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"teamState%lu", a3);
  uint64_t v16 = objc_msgSend(v15, "_pas_stringBackedByUTF8CString");
  [v14 setObject:&unk_1F2569458 forKeyedSubscript:v16];
LABEL_13:

LABEL_14:
}

void __35__PPMaintenance__logSportsMetrics___block_invoke_2_441(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v14 = v5;
  if (*(void *)(a1 + 72) > a3)
  {
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueScore%lu", a3);
    id v9 = objc_msgSend(v8, "_pas_stringBackedByUTF8CString");
    [v7 setObject:v6 forKeyedSubscript:v9];

    id v5 = v14;
  }
  if ([*(id *)(a1 + 48) containsObject:v5])
  {
    --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (*(void *)(a1 + 72) <= a3) {
      goto LABEL_9;
    }
    --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    id v10 = *(void **)(a1 + 32);
    int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueState%lu", a3);
    id v12 = objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
    uint64_t v13 = &unk_1F2569428;
  }
  else
  {
    if (*(void *)(a1 + 72) <= a3) {
      goto LABEL_9;
    }
    id v10 = *(void **)(a1 + 32);
    int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"leagueState%lu", a3);
    id v12 = objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
    uint64_t v13 = &unk_1F2569440;
  }
  [v10 setObject:v13 forKeyedSubscript:v12];

LABEL_9:
}

uint64_t __35__PPMaintenance__logSportsMetrics___block_invoke_438(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __35__PPMaintenance__logSportsMetrics___block_invoke_410(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v30 = &v31;
  id v4 = v3;
  id v29 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_3;
  id v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  uint64_t v23 = &v24;
  id v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogLocationPerplexity", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 67109120;
    int v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogLocationPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v32 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (!*((unsigned char *)v25 + 24) && *((unsigned char *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      int v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:2532 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogLocationPerplexity: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_3(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity location statistics.", (uint8_t *)&buf, 2u);
  }

  int v36 = +[PPLocalLocationStore defaultStore];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v3 = objc_opt_new();
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
    [v3 setToDate:v4];

    id v55 = 0;
    unint64_t v35 = [v36 locationRecordsWithQuery:v3 error:&v55];
    id v5 = v55;
    if (!v35)
    {
      int v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPMaintenance: error fetching location records: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_37;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v7 = +[PPLocationClusterID lookupTableWithRecords:v35];
    uint64_t v8 = [v7 allKeys];
    char v34 = [v6 initWithArray:v8];

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
    {
      uint64_t v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
      }
      goto LABEL_36;
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    os_signpost_id_t v9 = [v36 storage];
    int v32 = [v9 lastDonationTimeForSourcesBeforeDate:v33];

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
    {
      uint64_t v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
      }
      goto LABEL_35;
    }
    if ([MEMORY[0x1E4F89FC8] yesWithProbability:0.00999999978])
    {
      id v10 = objc_opt_new();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x2020000000;
      int v59 = 0;
      int v11 = objc_opt_new();
      xpc_object_t v54 = v5;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_386;
      v50[3] = &unk_1E65D8DC8;
      id v52 = *(id *)(a1 + 32);
      id v12 = v10;
      xpc_object_t v51 = v12;
      p_long long buf = &buf;
      [v36 iterRankedLocationsWithQuery:v11 error:&v54 block:v50];
      uint64_t v13 = v54;

      if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
      {
        uint64_t v26 = pp_default_log_handle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v49 = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", v49, 2u);
        }

        _Block_object_dispose(&buf, 8);
        id v5 = v13;
        uint64_t v16 = v12;
        goto LABEL_35;
      }

      _Block_object_dispose(&buf, 8);
      id v5 = v13;
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v31 = objc_opt_new();

    int v17 = objc_opt_new();
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
    [v31 setFromDate:v18];

    [v31 setDeviceFilter:1];
    uint64_t v19 = objc_opt_new();
    xpc_object_t v48 = v5;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_388;
    v42[3] = &unk_1E65D8DF0;
    v43 = v34;
    id v30 = v19;
    id v44 = v30;
    char v27 = v12;
    xpc_object_t v45 = v27;
    id v46 = v32;
    id v28 = v17;
    id v47 = v28;
    LOBYTE(v17) = [v36 iterLocationRecordsWithQuery:v31 error:&v48 block:v42];
    id v29 = v48;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v17;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      obunint64_t j = v30;
      uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v39;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v39 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * v22);
            uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"%@.LocationDonationAnalyzed", @"com.apple.proactive.PersonalizationPortrait"];
            +[PPMetricsDispatcher logPayloadForEvent:v24 payload:v23 inBackground:1];

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v56 count:16];
        }
        while (v20);
      }

      uint64_t v25 = pp_default_log_handle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity location statistics.", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      uint64_t v25 = pp_default_log_handle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v29;
        _os_log_error_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging location perplexity: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    id v5 = v29;
    id v3 = v31;
    uint64_t v16 = v27;
LABEL_35:

    uint64_t v15 = v33;
LABEL_36:

    int v14 = v34;
LABEL_37:

    goto LABEL_38;
  }
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
  }
LABEL_38:
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_386(uint64_t a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0) {
    *a3 = 1;
  }
  id v5 = [PPLocationClusterID alloc];
  id v6 = [v12 location];
  id v7 = [v6 placemark];
  uint64_t v8 = [(PPLocationClusterID *)v5 initWithPlacemark:v7];

  os_signpost_id_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = (void *)MEMORY[0x1CB79D060]();
    int v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v8];
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_388(uint64_t a1, void *a2)
{
  v30[6] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [PPLocationClusterID alloc];
  id v5 = [v3 location];
  id v6 = [v5 placemark];
  uint64_t v7 = [(PPLocationClusterID *)v4 initWithPlacemark:v6];

  uint64_t v8 = [*(id *)(a1 + 32) containsObject:v7] ^ 1;
  char v27 = *(void **)(a1 + 40);
  context = (void *)MEMORY[0x1CB79D060]();
  v29[0] = @"source";
  uint64_t v25 = [v3 source];
  uint64_t v24 = [v25 bundleId];
  uint64_t v23 = +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v30[0] = v23;
  v29[1] = @"algorithm";
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F89E60], "describeAlgorithm:", objc_msgSend(v3, "algorithm"));
  v30[1] = v22;
  v29[2] = @"isNew";
  uint64_t v21 = [NSNumber numberWithBool:v8];
  v30[2] = v21;
  v29[3] = @"groupId";
  uint64_t v20 = [v3 source];
  uint64_t v19 = [v20 groupId];
  os_signpost_id_t v9 = +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  id v10 = v9;
  if (!v9) {
    id v10 = objc_opt_new();
  }
  v30[3] = v10;
  v29[4] = @"isUserCreated";
  int v11 = NSNumber;
  id v12 = [v3 source];
  uint64_t v13 = [v12 metadata];
  int v14 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v30[4] = v14;
  v29[5] = @"rank";
  id v28 = (void *)v7;
  uint64_t v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
  uint64_t v16 = v15;
  if (!v15) {
    uint64_t v16 = objc_opt_new();
  }
  v30[5] = v16;
  int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];
  if (!v15) {

  }
  if (!v9) {
  [v27 addObject:v17];
  }

  uint64_t v18 = [v3 source];
  +[PPMaintenance _logDonationIntervalStatsForSource:domain:lastDonationTimes:lastBatchDonationTimes:]((uint64_t)PPMaintenance, v18, 2, *(void **)(a1 + 56), *(void **)(a1 + 64));
}

+ (void)_logDonationIntervalStatsForSource:(uint64_t)a3 domain:(void *)a4 lastDonationTimes:(void *)a5 lastBatchDonationTimes:
{
  id v34 = a2;
  id v8 = a4;
  id v9 = a5;
  self;
  id v10 = objc_opt_new();
  objc_msgSend(v10, "setDomain:", +[PPMetricsUtils mapDomainForPET2:](PPMetricsUtils, "mapDomainForPET2:", a3));
  int v11 = [v34 bundleId];
  objc_msgSend(v10, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", v11));

  id v12 = [v34 bundleId];
  uint64_t v13 = [v8 objectForKeyedSubscript:v12];

  if (v13)
  {
    int v14 = [v34 date];
    uint64_t v15 = [v34 bundleId];
    uint64_t v16 = [v8 objectForKeyedSubscript:v15];
    [v14 timeIntervalSinceDate:v16];
    double v18 = fabs(v17);

    if (v18 >= 600.0)
    {
      [v10 setIsFirstDonation:0];
      uint64_t v26 = [v34 date];
      char v27 = [v34 bundleId];
      id v28 = [v9 objectForKeyedSubscript:v27];
      [v26 timeIntervalSinceDate:v28];
      LODWORD(v30) = vcvtad_u64_f64(v29 / 3600.0);
      [v10 setInterval:v30];

      uint64_t v21 = [v34 bundleId];
      [v9 removeObjectForKey:v21];
    }
    else
    {
      uint64_t v19 = [v34 bundleId];
      uint64_t v20 = [v9 valueForKey:v19];

      [v10 setIsFirstDonation:v20 == 0];
      if (!v20) {
        goto LABEL_9;
      }
      uint64_t v21 = [v34 date];
      uint64_t v22 = [v34 bundleId];
      uint64_t v23 = [v9 objectForKeyedSubscript:v22];
      [v21 timeIntervalSinceDate:v23];
      LODWORD(v25) = vcvtad_u64_f64(v24 / 3600.0);
      [v10 setInterval:v25];
    }
  }
  else
  {
    [v10 setIsFirstDonation:1];
  }
  uint64_t v31 = [v34 date];
  int v32 = [v34 bundleId];
  [v8 setObject:v31 forKeyedSubscript:v32];

LABEL_9:
  uint64_t v33 = [MEMORY[0x1E4F93728] sharedInstance];
  [v33 trackScalarForMessage:v10];
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v30 = &v31;
  id v4 = v3;
  id v29 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_3;
  uint64_t v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  uint64_t v23 = &v24;
  uint64_t v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogTopicPerplexity", "", buf, 2u);
  }

  v7[2](v7);
  id v12 = pp_maintenance_signpost_handle();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogTopicPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v32 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (!*((unsigned char *)v25 + 24) && *((unsigned char *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:2151 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogTopicPerplexity: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_3(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = pp_default_log_handle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v1, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity topic statistics.", buf, 2u);
  }

  long long v38 = +[PPLocalTopicStore defaultStore];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    os_log_t oslog = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    uint64_t v2 = [v38 storage];
    int v36 = [v2 clusterIdentifiersExistingBeforeDate:oslog];

    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
      {
        char v34 = objc_opt_new();
        [v34 setFromDate:oslog];
        [v34 setDeviceFilter:1];
        if ([MEMORY[0x1E4F89FC8] yesWithProbability:0.00999999978])
        {
          id v35 = (id)objc_opt_new();
          id v3 = objc_opt_new();
          id v62 = 0;
          id v37 = [v38 rankedTopicsWithQuery:v3 error:&v62];
          id v4 = v62;

          if ([v37 count])
          {
            uint64_t v5 = 0;
            while (1)
            {
              id v6 = (void *)MEMORY[0x1CB79D060]();
              if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0) {
                break;
              }
              uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
              id v8 = [v37 objectAtIndexedSubscript:v5];
              os_signpost_id_t v9 = [v8 item];
              id v10 = [v9 topicIdentifier];
              [v35 setObject:v7 forKeyedSubscript:v10];

              if (++v5 >= (unint64_t)[v37 count]) {
                goto LABEL_11;
              }
            }
            int v32 = pp_default_log_handle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "PPMaintenance: deferring topic ranks.", buf, 2u);
            }

            goto LABEL_52;
          }
LABEL_11:
        }
        else
        {
          id v4 = 0;
          id v35 = 0;
        }
        int v11 = objc_opt_new();
        *(void *)long long buf = 0;
        xpc_object_t v57 = buf;
        uint64_t v58 = 0x3032000000;
        int v59 = __Block_byref_object_copy__17155;
        uint64_t v60 = __Block_byref_object_dispose__17156;
        id v61 = 0;
        id v55 = v4;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_320;
        v49[3] = &unk_1E65D8D00;
        id v53 = *(id *)(a1 + 32);
        id v50 = v36;
        id v35 = v35;
        id v51 = v35;
        id v37 = v11;
        id v52 = v37;
        xpc_object_t v54 = buf;
        char v12 = [v38 iterTopicRecordsWithQuery:v34 error:&v55 block:v49];
        uint64_t v33 = v55;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          obunint64_t j = v37;
          uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v72 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v46 != v14) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                double v17 = (void *)[[NSString alloc] initWithFormat:@"%@.TopicDonationAnalyzed", @"com.apple.proactive.PersonalizationPortrait"];
                +[PPMetricsDispatcher logPayloadForEvent:v17 payload:v16 inBackground:1];
              }
              uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v72 count:16];
            }
            while (v13);
          }

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
          {
            id v4 = v33;
            if (*((void *)v57 + 5))
            {
              uint64_t v18 = pp_default_log_handle();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                LOWORD(v67) = 0;
                _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_INFO, "PPMaintenance: performing sampled logging of user created entity", (uint8_t *)&v67, 2u);
              }

              uint64_t v19 = objc_opt_new();
              uint64_t v20 = (void *)MEMORY[0x1CB79D060]();
              id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
              id v22 = objc_msgSend(v21, "initWithObjects:", *((void *)v57 + 5), 0);
              [v19 setMatchingTopicIds:v22];

              [v19 setToDate:oslog];
              *(void *)&long long v67 = 0;
              *((void *)&v67 + 1) = &v67;
              uint64_t v68 = 0x3032000000;
              uint64_t v69 = __Block_byref_object_copy__17155;
              xpc_object_t v70 = __Block_byref_object_dispose__17156;
              id v71 = 0;
              v43[4] = &v67;
              id v44 = v33;
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_342;
              v43[3] = &unk_1E65D8D28;
              char v23 = [v38 iterTopicRecordsWithQuery:v19 error:&v44 block:v43];
              id v4 = v44;

              if (v23)
              {
                if (*(void *)(*((void *)&v67 + 1) + 40))
                {
                  uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"%@.UserWroteTopic", @"com.apple.proactive.PersonalizationPortrait"];
                  uint64_t v25 = (void *)MEMORY[0x1CB79D060]();
                  v63[0] = @"source";
                  id obja = [*(id *)(*((void *)&v67 + 1) + 40) source];
                  uint64_t v26 = [obja bundleId];
                  char v27 = +[PPMetricsUtils filterBundleId:v26];
                  v63[1] = @"algorithm";
                  v64[0] = v27;
                  id v28 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(*(id *)(*((void *)&v67 + 1) + 40), "algorithm"));
                  v64[1] = v28;
                  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];

                  +[PPMetricsDispatcher logPayloadForEvent:v24 payload:v29 inBackground:1];
                }
                uint64_t v30 = pp_default_log_handle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)int v65 = 0;
                  _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of sampled user created entity", v65, 2u);
                }
              }
              else
              {
                uint64_t v30 = pp_default_log_handle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)int v65 = 138412290;
                  uint64_t v66 = v4;
                  _os_log_error_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_ERROR, "PPMaintenance: error logging sampled user creation metrics: %@", v65, 0xCu);
                }
              }

              _Block_object_dispose(&v67, 8);
              if ((v23 & 1) == 0) {
                goto LABEL_51;
              }
            }
            uint64_t v31 = pp_default_log_handle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LOWORD(v67) = 0;
              _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity topic statistics.", (uint8_t *)&v67, 2u);
            }
            uint64_t v33 = v4;
          }
          else
          {
            uint64_t v31 = pp_default_log_handle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v67) = 138412290;
              *(void *)((char *)&v67 + 4) = v33;
              _os_log_error_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging topic perplexity: %@", (uint8_t *)&v67, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v31 = pp_default_log_handle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v67) = 0;
            _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic donation analysis reporting.", (uint8_t *)&v67, 2u);
          }
        }

        id v4 = v33;
LABEL_51:

        _Block_object_dispose(buf, 8);
LABEL_52:

        goto LABEL_53;
      }
      id v4 = pp_default_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v4 = pp_default_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
LABEL_18:
        _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring topic perplexity.", buf, 2u);
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  os_log_t oslog = pp_default_log_handle();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring topic perplexity.", buf, 2u);
  }
LABEL_54:
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_320(uint64_t a1, void *a2, unsigned char *a3)
{
  v36[6] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0)
  {
    *a3 = 1;
    goto LABEL_17;
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 topic];
  id v8 = [v7 clusterIdentifier];
  int v34 = [v6 containsObject:v8];

  v35[0] = @"source";
  uint64_t v33 = [v5 source];
  int v32 = [v33 bundleId];
  uint64_t v31 = +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v36[0] = v31;
  v35[1] = @"algorithm";
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v5, "algorithm"));
  v36[1] = v30;
  v35[2] = @"isNew";
  id v29 = [NSNumber numberWithBool:v34 ^ 1u];
  v36[2] = v29;
  v35[3] = @"groupId";
  id v28 = [v5 source];
  uint64_t v26 = [v28 groupId];
  uint64_t v9 = +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  id v10 = (void *)v9;
  if (!v9) {
    uint64_t v9 = objc_opt_new();
  }
  v36[3] = v9;
  v35[4] = @"isUserCreated";
  int v11 = NSNumber;
  char v12 = objc_msgSend(v5, "source", v9);
  uint64_t v13 = [v12 metadata];
  uint64_t v14 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v36[4] = v14;
  v35[5] = @"rank";
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = [v5 topic];
  double v17 = [v16 topicIdentifier];
  uint64_t v18 = [v15 objectForKeyedSubscript:v17];
  uint64_t v19 = v18;
  if (!v18) {
    uint64_t v19 = objc_opt_new();
  }
  v36[5] = v19;
  char v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];
  if (!v18) {

  }
  if (!v10) {
  [*(id *)(a1 + 48) addObject:v27];
  }
  if (v34)
  {
    uint64_t v20 = [v5 source];
    id v21 = [v20 metadata];
    if (([v21 flags] & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    int v22 = [MEMORY[0x1E4F89FC8] yesWithProbability:0.100000001];

    if (v22)
    {
      uint64_t v20 = [v5 topic];
      uint64_t v23 = [v20 topicIdentifier];
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      id v21 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_17:
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_342(uint64_t a1, void *a2)
{
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v30 = &v31;
  id v4 = v3;
  id v29 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_3;
  id v21 = &unk_1E65D8B68;
  id v6 = v5;
  id v22 = v6;
  uint64_t v23 = &v24;
  uint64_t v7 = (void (**)(void))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogNamedEntityPerplexity", "", buf, 2u);
  }

  v7[2](v7);
  char v12 = pp_maintenance_signpost_handle();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogNamedEntityPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v32 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (!*((unsigned char *)v25 + 24) && *((unsigned char *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v18, v19, v20, v21);
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:2412 description:@"Unexpected failure of deferral"];
    }
    uint64_t v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogNamedEntityPerplexity: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_3(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity named entity statistics.", buf, 2u);
  }

  char v42 = +[PPLocalNamedEntityStore defaultStore];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    os_log_t oslog = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
    id v3 = [v42 storage];
    long long v41 = [v3 clusterIdentifiersExistingBeforeDate:oslog];

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
    {
      os_signpost_id_t v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
      }
      goto LABEL_46;
    }
    id v4 = [v42 storage];
    long long v40 = [v4 lastDonationTimeForSourcesBeforeDate:oslog];

    if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
    {
      uint64_t v7 = pp_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
      }
      goto LABEL_45;
    }
    long long v39 = objc_opt_new();
    [v39 setFromDate:oslog];
    [v39 setDeviceFilter:1];
    long long v38 = objc_opt_new();
    if ([MEMORY[0x1E4F89FC8] yesWithProbability:0.00999999978])
    {
      id v5 = objc_opt_new();
      *(void *)long long buf = 0;
      int v59 = buf;
      uint64_t v60 = 0x2020000000;
      LODWORD(v61) = 0;
      id v6 = objc_opt_new();
      id v68 = 0;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      void v64[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_365;
      v64[3] = &unk_1E65D8D50;
      id v66 = *(id *)(a1 + 32);
      id v37 = v5;
      id v65 = v37;
      long long v67 = buf;
      [v42 iterRankedNamedEntitiesWithQuery:v6 error:&v68 block:v64];
      uint64_t v7 = v68;

      if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
      {
        uint64_t v31 = pp_default_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v74) = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", (uint8_t *)&v74, 2u);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_44;
      }

      _Block_object_dispose(buf, 8);
      id v8 = v37;
    }
    else
    {
      uint64_t v7 = 0;
      id v8 = 0;
    }
    *(void *)long long buf = 0;
    int v59 = buf;
    uint64_t v60 = 0x3032000000;
    id v61 = __Block_byref_object_copy__17155;
    id v62 = __Block_byref_object_dispose__17156;
    id v63 = 0;
    id v10 = objc_opt_new();
    xpc_object_t v57 = v7;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_367;
    v50[3] = &unk_1E65D8D78;
    id v51 = v41;
    id v36 = v10;
    id v52 = v36;
    id v11 = v8;
    id v53 = v11;
    xpc_object_t v54 = v40;
    id v55 = v38;
    uint64_t v56 = buf;
    LOBYTE(v10) = [v42 iterNamedEntityRecordsWithQuery:v39 error:&v57 block:v50];
    id v37 = v11;
    char v12 = v57;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v10;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (*((void *)v59 + 5))
      {
        uint64_t v13 = pp_default_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v74) = 0;
          _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_INFO, "PPMaintenance: performing sampled logging of user created entity", (uint8_t *)&v74, 2u);
        }

        id v35 = objc_opt_new();
        int v14 = (void *)MEMORY[0x1CB79D060]();
        id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v16 = objc_msgSend(v15, "initWithObjects:", *((void *)v59 + 5), 0);
        [v35 setMatchingNames:v16];

        [v35 setToDate:oslog];
        *(void *)&long long v74 = 0;
        *((void *)&v74 + 1) = &v74;
        uint64_t v75 = 0x3032000000;
        xpc_object_t v76 = __Block_byref_object_copy__17155;
        v77 = __Block_byref_object_dispose__17156;
        id v78 = 0;
        v48[4] = &v74;
        v49 = v12;
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_376;
        v48[3] = &unk_1E65D8DA0;
        char v34 = [v42 iterNamedEntityRecordsWithQuery:v35 error:&v49 block:v48];
        uint64_t v33 = v49;

        if (v34)
        {
          if (*(void *)(*((void *)&v74 + 1) + 40))
          {
            double v17 = (void *)[[NSString alloc] initWithFormat:@"%@.UserWroteNamedEntity", @"com.apple.proactive.PersonalizationPortrait"];
            uint64_t v18 = (void *)MEMORY[0x1CB79D060]();
            v70[0] = @"source";
            int v32 = [*(id *)(*((void *)&v74 + 1) + 40) source];
            uint64_t v19 = [v32 bundleId];
            uint64_t v20 = +[PPMetricsUtils filterBundleId:v19];
            v70[1] = @"algorithm";
            v71[0] = v20;
            id v21 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(*(id *)(*((void *)&v74 + 1) + 40), "algorithm"));
            v71[1] = v21;
            id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];

            +[PPMetricsDispatcher logPayloadForEvent:v17 payload:v22 inBackground:1];
          }
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v23 = v36;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v69 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v45 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                id v28 = (void *)[[NSString alloc] initWithFormat:@"%@.NamedEntityDonationAnalyzed", @"com.apple.proactive.PersonalizationPortrait"];
                +[PPMetricsDispatcher logPayloadForEvent:v28 payload:v27 inBackground:1];
              }
              uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v69 count:16];
            }
            while (v24);
          }

          id v29 = pp_default_log_handle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v72 = 0;
            _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of sampled user created entity", v72, 2u);
          }
        }
        else
        {
          id v29 = pp_default_log_handle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v72 = 138412290;
            uint64_t v73 = v33;
            _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "PPMaintenance: error logging sampled user creation metrics: %@", v72, 0xCu);
          }
        }

        _Block_object_dispose(&v74, 8);
        char v12 = v33;
        if ((v34 & 1) == 0) {
          goto LABEL_43;
        }
      }
      uint64_t v30 = pp_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v74) = 0;
        _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity entity statistics.", (uint8_t *)&v74, 2u);
      }
    }
    else
    {
      uint64_t v30 = pp_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v74) = 138412290;
        *(void *)((char *)&v74 + 4) = v12;
        _os_log_error_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging entity perplexity: %@", (uint8_t *)&v74, 0xCu);
      }
    }

LABEL_43:
    uint64_t v7 = v12;

    _Block_object_dispose(buf, 8);
LABEL_44:

LABEL_45:
    os_signpost_id_t v9 = v40;
LABEL_46:

    goto LABEL_47;
  }
  os_log_t oslog = pp_default_log_handle();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
  }
LABEL_47:
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_365(void *a1, void *a2, unsigned char *a3)
{
  id v12 = a2;
  if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0) {
    *a3 = 1;
  }
  id v5 = (void *)MEMORY[0x1CB79D060]();
  id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v7 = (void *)a1[4];
  id v8 = (void *)MEMORY[0x1CB79D060]();
  os_signpost_id_t v9 = [v12 item];
  id v10 = [v9 name];
  id v11 = [v10 lowercaseString];

  [v7 setObject:v6 forKeyedSubscript:v11];

  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_367(void *a1, void *a2)
{
  v47[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v3 entity];
  id v6 = [v5 clusterIdentifier];
  int v44 = [v4 containsObject:v6];

  v43 = (void *)a1[5];
  context = (void *)MEMORY[0x1CB79D060]();
  v46[0] = @"source";
  long long v41 = [v3 source];
  long long v40 = [v41 bundleId];
  long long v39 = +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v47[0] = v39;
  v46[1] = @"algorithm";
  long long v38 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(v3, "algorithm"));
  v47[1] = v38;
  v46[2] = @"category";
  uint64_t v7 = (void *)MEMORY[0x1E4F89E90];
  id v37 = [v3 entity];
  id v36 = objc_msgSend(v7, "describeCategory:", objc_msgSend(v37, "category"));
  v47[2] = v36;
  v46[3] = @"dynamicCategory";
  id v35 = [v3 entity];
  char v34 = [v35 dynamicCategory];
  uint64_t v8 = objc_msgSend(v34, "_pas_stringBackedByUTF8CString");
  uint64_t v33 = (void *)v8;
  if (!v8) {
    uint64_t v8 = objc_opt_new();
  }
  id v28 = (void *)v8;
  v47[3] = v8;
  v46[4] = @"isNew";
  int v32 = [NSNumber numberWithBool:v44 ^ 1u];
  v47[4] = v32;
  v46[5] = @"groupId";
  uint64_t v31 = [v3 source];
  uint64_t v30 = [v31 groupId];
  uint64_t v9 = +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  id v10 = (void *)v9;
  if (!v9) {
    uint64_t v9 = objc_opt_new();
  }
  uint64_t v27 = (void *)v9;
  v47[5] = v9;
  v46[6] = @"isUserCreated";
  id v11 = NSNumber;
  id v12 = [v3 source];
  uint64_t v13 = [v12 metadata];
  int v14 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v47[6] = v14;
  v46[7] = @"rank";
  long long v45 = a1;
  id v15 = (void *)a1[6];
  uint64_t v16 = [v3 entity];
  double v17 = [v16 name];
  uint64_t v18 = [v17 lowercaseString];
  uint64_t v19 = [v15 objectForKeyedSubscript:v18];
  uint64_t v20 = v19;
  if (!v19) {
    uint64_t v20 = objc_opt_new();
  }
  v47[7] = v20;
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:8];
  if (!v19) {

  }
  if (!v10) {
  if (!v33)
  }

  [v43 addObject:v29];

  id v21 = [v3 source];
  +[PPMaintenance _logDonationIntervalStatsForSource:domain:lastDonationTimes:lastBatchDonationTimes:]((uint64_t)PPMaintenance, v21, 1, (void *)v45[7], (void *)v45[8]);

  if (v44)
  {
    id v22 = [v3 source];
    id v23 = [v22 metadata];
    if (([v23 flags] & 1) == 0)
    {
LABEL_17:

      goto LABEL_18;
    }
    int v24 = [MEMORY[0x1E4F89FC8] yesWithProbability:0.100000001];

    if (v24)
    {
      id v22 = [v3 entity];
      uint64_t v25 = [v22 name];
      uint64_t v26 = *(void *)(v45[9] + 8);
      id v23 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
      goto LABEL_17;
    }
  }
LABEL_18:
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_376(uint64_t a1, void *a2)
{
}

void __45__PPMaintenance__registerLogTopicFirstSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v19 = &v20;
  id v3 = v2;
  id v18 = v3;
  id v4 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_3;
  v15[3] = &unk_1E65D8B20;
  id v5 = v4;
  id v16 = v5;
  id v6 = (void (**)(void))_Block_copy(v15);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v7 = pp_maintenance_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = pp_maintenance_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LogTopicFirstSource", "", buf, 2u);
  }

  v6[2](v6);
  id v11 = pp_maintenance_signpost_handle();
  id v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v8, "LogTopicFirstSource", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v21 + 24)) {
    int v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v14);

  _Block_object_dispose(&v20, 8);
}

uint64_t __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_3(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = +[PPLocalTopicStore defaultStore];
  id v28 = objc_opt_new();
  id v3 = [v2 storage];
  uint64_t v29 = a1;
  id v4 = [v3 firstDonationSourceCountsWithShouldContinueBlock:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v26 = v4;
    uint64_t v27 = v2;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
    uint64_t v7 = v28;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v36;
      obuint64_t j = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (((*(uint64_t (**)(void))(*(void *)(v29 + 32) + 16))() & 1) == 0)
          {
            int v24 = pp_default_log_handle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring partially completed topic first source logging", buf, 2u);
            }

            goto LABEL_21;
          }
          id v12 = (void *)MEMORY[0x1CB79D060]();
          v41[0] = @"source";
          int v13 = [v11 bundleId];
          int v14 = +[PPMetricsUtils filterBundleId:v13];
          v42[0] = v14;
          v41[1] = @"algorithm";
          id v15 = objc_msgSend(MEMORY[0x1E4F89F98], "describeAlgorithm:", objc_msgSend(v11, "algorithm"));
          v42[1] = v15;
          v41[2] = @"matchedCount";
          id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "count"));
          v42[2] = v16;
          double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

          [v28 addObject:v17];
        }
        id v5 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v28;
    uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          char v23 = (void *)[[NSString alloc] initWithFormat:@"%@.TopicInitialDonation", @"com.apple.proactive.PersonalizationPortrait"];
          +[PPMetricsDispatcher logPayloadForEvent:v23 payload:v22 inBackground:1];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v19);
      id v2 = v27;
      uint64_t v7 = v28;
    }
    else
    {
LABEL_21:
      id v2 = v27;
    }
    id v4 = v26;
    int v25 = obj;
  }
  else
  {
    int v25 = pp_default_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring bundle counts work due to nil result", buf, 2u);
    }
    uint64_t v7 = v28;
  }
}

void __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v19 = &v20;
  id v3 = v2;
  id v18 = v3;
  id v4 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_3;
  v15[3] = &unk_1E65D8B20;
  id v5 = v4;
  id v16 = v5;
  uint64_t v6 = (void (**)(void))_Block_copy(v15);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v7 = pp_maintenance_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = pp_maintenance_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LogNamedEntityFirstSource", "", buf, 2u);
  }

  v6[2](v6);
  id v11 = pp_maintenance_signpost_handle();
  id v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v8, "LogNamedEntityFirstSource", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v21 + 24)) {
    int v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v14);

  _Block_object_dispose(&v20, 8);
}

uint64_t __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_3(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = +[PPLocalNamedEntityStore defaultStore];
  id v28 = objc_opt_new();
  id v3 = [v2 storage];
  uint64_t v29 = a1;
  id v4 = [v3 firstDonationSourceCountsWithShouldContinueBlock:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v26 = v4;
    uint64_t v27 = v2;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
    uint64_t v7 = v28;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v36;
      obuint64_t j = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (((*(uint64_t (**)(void))(*(void *)(v29 + 32) + 16))() & 1) == 0)
          {
            int v24 = pp_default_log_handle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring partially completed entity first source logging", buf, 2u);
            }

            goto LABEL_21;
          }
          id v12 = (void *)MEMORY[0x1CB79D060]();
          v41[0] = @"source";
          int v13 = [v11 bundleId];
          int v14 = +[PPMetricsUtils filterBundleId:v13];
          v42[0] = v14;
          v41[1] = @"algorithm";
          id v15 = objc_msgSend(MEMORY[0x1E4F89EA8], "describeAlgorithm:", objc_msgSend(v11, "algorithm"));
          v42[1] = v15;
          v41[2] = @"matchedCount";
          id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "count"));
          v42[2] = v16;
          double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

          [v28 addObject:v17];
        }
        id v5 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v28;
    uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          char v23 = (void *)[[NSString alloc] initWithFormat:@"%@.NamedEntityInitialDonation", @"com.apple.proactive.PersonalizationPortrait"];
          +[PPMetricsDispatcher logPayloadForEvent:v23 payload:v22 inBackground:1];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v19);
      id v2 = v27;
      uint64_t v7 = v28;
    }
    else
    {
LABEL_21:
      id v2 = v27;
    }
    id v4 = v26;
    int v25 = obj;
  }
  else
  {
    int v25 = pp_default_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring bundle counts work due to nil result", buf, 2u);
    }
    uint64_t v7 = v28;
  }
}

void __45__PPMaintenance__registerDailyMetricsLogging__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v29 = &v30;
  id v4 = v3;
  id v28 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_3;
  v19[3] = &unk_1E65D8E18;
  uint64_t v6 = *(void *)(a1 + 32);
  id v21 = &v23;
  uint64_t v22 = v6;
  id v7 = v5;
  id v20 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v9 = pp_maintenance_signpost_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = pp_maintenance_signpost_handle();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "DailyMetricsLogging", "", buf, 2u);
  }

  v8[2](v8);
  int v13 = pp_maintenance_signpost_handle();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v15 = *((unsigned __int8 *)v31 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v35 = v15;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v10, "DailyMetricsLogging", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v31 + 24)) {
    id v16 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    id v16 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v16);
  if (!*((unsigned char *)v24 + 24) && *((unsigned char *)v31 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPMaintenance.m" lineNumber:1964 description:@"Unexpected failure of deferral"];
    }
    double v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DailyMetricsLogging: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v30, 8);
}

uint64_t __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_3(uint64_t a1)
{
  v43[7] = *MEMORY[0x1E4F143B8];
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance running periodic daily metrics logging", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = self;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning daily metrics generation.", buf, 2u);
  }

  uint64_t v6 = (uint64_t (**)(void))v3;
  self;
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@.DeviceStats", @"com.apple.proactive.PersonalizationPortrait"];
  +[PPMetricsDispatcher logPayloadForEvent:v7 payload:MEMORY[0x1E4F1CC08] inBackground:1];

  if (v6[2](v6))
  {
    uint64_t v28 = a1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    void aBlock[4] = v4;
    uint64_t v8 = _Block_copy(aBlock);
    v43[0] = v8;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_2;
    v39[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v39[4] = v4;
    uint64_t v9 = _Block_copy(v39);
    v43[1] = v9;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_3;
    v38[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v38[4] = v4;
    os_signpost_id_t v10 = _Block_copy(v38);
    v43[2] = v10;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_4;
    v37[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v37[4] = v4;
    id v11 = _Block_copy(v37);
    v43[3] = v11;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_5;
    v36[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v36[4] = v4;
    id v12 = _Block_copy(v36);
    v43[4] = v12;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_6;
    v35[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v35[4] = v4;
    int v13 = _Block_copy(v35);
    void v43[5] = v13;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_7;
    v34[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    void v34[4] = v4;
    int v14 = _Block_copy(v34);
    v43[6] = v14;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];

    id v16 = objc_opt_new();
    double v17 = objc_msgSend(v15, "_pas_shuffledArrayUsingRng:", v16);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * i) + 16))()
            || (v6[2](v6) & 1) == 0)
          {
            uint64_t v25 = pp_default_log_handle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v29 = 0;
              _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_INFO, "PPMaintenance: deferring daily metrics generation", v29, 2u);
            }

            char v24 = 0;
            uint64_t v23 = v18;
            goto LABEL_21;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:buf count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = pp_default_log_handle();
    char v24 = 1;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_INFO, "PPMaintenance: completed daily metrics generation.", v29, 2u);
    }
LABEL_21:
    a1 = v28;
  }
  else
  {
    char v24 = 0;
  }

  id v26 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v24;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v27 = pp_default_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v42 = v26;
      _os_log_error_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_ERROR, "PPMaintenance failed to run periodic metrics logging operations: %@", buf, 0xCu);
    }
  }
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  self;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily database statistics.", buf, 2u);
  }

  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v6 = +[PPSQLDatabase sharedInstance];
  id v7 = [v6 stats];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"version"];
  uint64_t v9 = [v8 integerValue];

  os_signpost_id_t v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = [v7 objectForKeyedSubscript:@"rowCounts"];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v44 = 3221225472;
  long long v45 = __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke;
  long long v46 = &unk_1E65D8C28;
  uint64_t v49 = v9;
  id v12 = v4;
  id v47 = v12;
  long long v48 = &v50;
  [v11 enumerateKeysAndObjectsUsingBlock:buf];

  if (*((unsigned char *)v51 + 24)) {
    goto LABEL_5;
  }
  int v13 = (void *)MEMORY[0x1CB79D060]();
  int v14 = [v7 objectForKeyedSubscript:@"remoteRecordCounts"];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke_2;
  v39[3] = &unk_1E65D8C28;
  uint64_t v42 = v9;
  int v15 = (uint64_t (**)(void))v12;
  id v40 = v15;
  long long v41 = &v50;
  [v14 enumerateKeysAndObjectsUsingBlock:v39];

  if (*((unsigned char *)v51 + 24))
  {
LABEL_5:
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v18 = [v6 checkWithError:a2];
    uint64_t v19 = (void *)MEMORY[0x1CB79D060]();
    long long v37 = v18;
    uint64_t v20 = [v18 objectForKeyedSubscript:@"integrity_check"];
    uint64_t v21 = [v20 objectAtIndexedSubscript:0];
    if ([v21 isEqualToString:@"ok"])
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v23 = [v18 objectForKeyedSubscript:@"integrity_check"];
      uint64_t v22 = [v23 count];
    }
    char v24 = objc_opt_new();
    [v24 setSchemaVersion:v9];
    [v24 setPragmaCheckType:1];
    uint64_t v25 = +[PPTrialWrapper sharedInstance];
    id v26 = [v25 concatenatedTreatmentNames];
    [v24 setActiveTreatments:v26];

    uint64_t v27 = [MEMORY[0x1E4F93728] sharedInstance];
    [v27 trackScalarForMessage:v24 updateCount:v22];

    uint64_t v28 = v37;
    if ((v15[2](v15) & 1) == 0) {
      goto LABEL_15;
    }
    uint64_t v29 = (void *)MEMORY[0x1CB79D060]();
    long long v30 = [v37 objectForKeyedSubscript:@"foreign_key_check"];
    uint64_t v31 = [v30 count];

    long long v32 = objc_opt_new();
    [v32 setSchemaVersion:v9];
    [v32 setPragmaCheckType:2];
    long long v33 = +[PPTrialWrapper sharedInstance];
    long long v34 = [v33 concatenatedTreatmentNames];
    [v32 setActiveTreatments:v34];

    int v35 = [MEMORY[0x1E4F93728] sharedInstance];
    [v35 trackScalarForMessage:v32 updateCount:v31];

    uint64_t v28 = v37;
    if (v15[2](v15))
    {
      uint64_t v36 = pp_default_log_handle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v38 = 0;
        _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily database statistics.", v38, 2u);
      }

      uint64_t v16 = 1;
    }
    else
    {
LABEL_15:
      uint64_t v16 = 0;
    }
  }
  _Block_object_dispose(&v50, 8);

  return v16;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  self;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily named entity statistics.", buf, 2u);
  }

  id v5 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v6 = [v5 storage];
  uint64_t v7 = [v6 uniqueClusterIdentifierCount];

  if (!v3[2](v3)) {
    goto LABEL_12;
  }
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@.NamedEntityStoreStats", @"com.apple.proactive.PersonalizationPortrait"];
  uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
  long long v34 = @"uniqueItems";
  os_signpost_id_t v10 = [NSNumber numberWithInt:v7];
  *(void *)long long buf = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v34 count:1];

  +[PPMetricsDispatcher logPayloadForEvent:v8 payload:v11 inBackground:1];

  if (!v3[2](v3))
  {
LABEL_12:
    uint64_t v30 = 0;
    goto LABEL_19;
  }
  self;
  id v12 = pp_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v33 = 0;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private named entity statistics.", v33, 2u);
  }

  id v13 = [NSString alloc];
  int v14 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v15 = [v14 localeIdentifier];
  uint64_t v16 = (void *)[v13 initWithFormat:@"%@.%@.%@", @"com.apple.PersonalizationPortrait", @"namedEntityDonationSource", v15];

  double v17 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v16];
  uint64_t v18 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v19 = [v18 storage];
  uint64_t v20 = [v19 thirdPartyBundleIdsFromToday];
  uint64_t v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (v20) {
    uint64_t v22 = (void *)v20;
  }
  id v23 = v22;

  char v24 = [v17 record:v23];
  uint64_t v25 = pp_default_log_handle();
  id v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v33 = 0;
      uint64_t v27 = "PPMaintenance: Successfully logged named entity source bundle identifiers to differential privacy.";
      uint64_t v28 = v26;
      os_log_type_t v29 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_1CA9A8000, v28, v29, v27, v33, 2u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v33 = 0;
    uint64_t v27 = "PPMaintenance: unable to log named entity bundle identifiers to differential privacy.";
    uint64_t v28 = v26;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }

  uint64_t v31 = pp_default_log_handle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v33 = 0;
    _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily named entity statistics.", v33, 2u);
  }

  uint64_t v30 = 1;
LABEL_19:

  return v30;
}

BOOL __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_3(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily location statistics.", buf, 2u);
  }

  uint64_t v6 = +[PPLocalLocationStore defaultStore];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v6 locationRecordsWithQuery:v7 error:a2];

  BOOL v9 = v8 != 0;
  if (!v8)
  {
    long long v34 = pp_default_log_handle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *a2;
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_ERROR, "PPMaintenance: error fetching location records: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  os_signpost_id_t v10 = +[PPLocationClusterID lookupTableWithRecords:v8];
  uint64_t v11 = [v10 count];

  if (v4[2](v4))
  {
    id v12 = (void *)[[NSString alloc] initWithFormat:@"%@.LocationStoreStats", @"com.apple.proactive.PersonalizationPortrait"];
    id v13 = (void *)MEMORY[0x1CB79D060]();
    long long v38 = @"uniqueItems";
    int v14 = [NSNumber numberWithInt:v11];
    *(void *)long long buf = v14;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v38 count:1];

    +[PPMetricsDispatcher logPayloadForEvent:v12 payload:v15 inBackground:1];

    if (v4[2](v4))
    {
      self;
      uint64_t v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v37 = 0;
        _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private location statistics.", v37, 2u);
      }

      id v17 = [NSString alloc];
      uint64_t v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v19 = [v18 localeIdentifier];
      uint64_t v20 = (void *)[v17 initWithFormat:@"%@.%@.%@", @"com.apple.PersonalizationPortrait", @"locationDonationSource", v19];

      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v20];
      uint64_t v22 = +[PPLocalLocationStore defaultStore];
      id v23 = [v22 storage];
      uint64_t v24 = [v23 thirdPartyBundleIdsFromToday];
      uint64_t v25 = (void *)v24;
      id v26 = (void *)MEMORY[0x1E4F1CBF0];
      if (v24) {
        id v26 = (void *)v24;
      }
      id v27 = v26;

      char v28 = [v21 record:v27];
      os_log_type_t v29 = pp_default_log_handle();
      uint64_t v30 = v29;
      if (v28)
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
          goto LABEL_21;
        }
        *(_WORD *)long long v37 = 0;
        uint64_t v31 = "PPMaintenance: Successfully logged location source bundle identifiers to differential privacy.";
        long long v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
      }
      else
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_WORD *)long long v37 = 0;
        uint64_t v31 = "PPMaintenance: unable to log location bundle identifiers to differential privacy.";
        long long v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      }
      _os_log_impl(&dword_1CA9A8000, v32, v33, v31, v37, 2u);
LABEL_21:

      long long v34 = pp_default_log_handle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v37 = 0;
        _os_log_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily location statistics.", v37, 2u);
      }
LABEL_16:

      goto LABEL_17;
    }
  }
  BOOL v9 = 0;
LABEL_17:

  return v9;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  self;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily topic statistics.", buf, 2u);
  }

  id v5 = +[PPLocalTopicStore defaultStore];
  uint64_t v6 = [v5 storage];
  uint64_t v7 = [v6 uniqueClusterIdentifierCount];

  if (!v3[2](v3)) {
    goto LABEL_12;
  }
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@.TopicStoreStats", @"com.apple.proactive.PersonalizationPortrait"];
  BOOL v9 = (void *)MEMORY[0x1CB79D060]();
  long long v34 = @"uniqueItems";
  os_signpost_id_t v10 = [NSNumber numberWithInt:v7];
  *(void *)long long buf = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v34 count:1];

  +[PPMetricsDispatcher logPayloadForEvent:v8 payload:v11 inBackground:1];

  if (!v3[2](v3))
  {
LABEL_12:
    uint64_t v30 = 0;
    goto LABEL_19;
  }
  self;
  id v12 = pp_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_type_t v33 = 0;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private topic statistics.", v33, 2u);
  }

  id v13 = [NSString alloc];
  int v14 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v15 = [v14 localeIdentifier];
  uint64_t v16 = (void *)[v13 initWithFormat:@"%@.%@.%@", @"com.apple.PersonalizationPortrait", @"topicDonationSource", v15];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5F488]) initWithKey:v16];
  uint64_t v18 = +[PPLocalTopicStore defaultStore];
  uint64_t v19 = [v18 storage];
  uint64_t v20 = [v19 thirdPartyBundleIdsFromToday];
  uint64_t v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (v20) {
    uint64_t v22 = (void *)v20;
  }
  id v23 = v22;

  char v24 = [v17 record:v23];
  uint64_t v25 = pp_default_log_handle();
  id v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)os_log_type_t v33 = 0;
      id v27 = "PPMaintenance: Successfully logged topic source bundle identifiers to differential privacy.";
      char v28 = v26;
      os_log_type_t v29 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_1CA9A8000, v28, v29, v27, v33, 2u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_type_t v33 = 0;
    id v27 = "PPMaintenance: unable to log topic bundle identifiers to differential privacy.";
    char v28 = v26;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }

  uint64_t v31 = pp_default_log_handle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_type_t v33 = 0;
    _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily topic statistics.", v33, 2u);
  }

  uint64_t v30 = 1;
LABEL_19:

  return v30;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily topic engagement statistics.", buf, 2u);
  }

  uint64_t v6 = objc_opt_new();
  [v6 setLimit:+[PPMaintenance _kValue]()];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v7 mappedTopicsPendingFeedbackWithShouldContinueBlock:v4];

  if (!v8)
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v52 = "PPMaintenance: unable to fetch topic engagements.";
LABEL_43:
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
    }
LABEL_44:
    uint64_t v51 = 0;
    goto LABEL_52;
  }
  if ((v4[2](v4) & 1) == 0)
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v52 = "PPMaintenance: deferring topic engagements.";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  os_signpost_id_t v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_294);
  uint64_t v11 = (void *)[v9 initWithArray:v10];

  id v65 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v83 objects:buf count:16];
  if (!v13)
  {
    uint64_t v51 = 1;
    goto LABEL_51;
  }
  int v14 = off_1E65D3000;
  uint64_t v15 = *(void *)v84;
  id v62 = v6;
  id v63 = v4;
  uint64_t v60 = v12;
  id v61 = v8;
  uint64_t v56 = a2;
  uint64_t v58 = *(void *)v84;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v57 = v13;
    do
    {
      if (*(void *)v84 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v83 + 1) + 8 * v16);
      if ((v4[2](v4) & 1) == 0)
      {
        xpc_object_t v54 = pp_default_log_handle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v82 = 0;
          _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic engagements.", v82, 2u);
        }
LABEL_49:

        uint64_t v51 = 0;
        goto LABEL_51;
      }
      uint64_t v59 = v16;
      uint64_t v18 = [(__objc2_class *)v14[1] defaultStore];
      uint64_t v72 = v17;
      uint64_t v19 = [v18 scoresForTopicMapping:v17 query:v6 error:a2];
      uint64_t v20 = [v19 allKeys];

      if (!v20)
      {
        xpc_object_t v54 = pp_default_log_handle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v82 = 0;
          _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_DEFAULT, "PPMaintenance: unable to fetch ranked items from topic store.", v82, 2u);
        }
LABEL_48:
        uint64_t v6 = v62;
        goto LABEL_49;
      }
      v64 = v20;
      xpc_object_t v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v20];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      obuint64_t j = v8;
      uint64_t v21 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
      uint64_t v22 = v72;
      if (v21)
      {
        uint64_t v23 = v21;
        uint64_t v73 = *(void *)v79;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v79 != v73) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            if ((v4[2](v4) & 1) == 0)
            {
              char v53 = pp_default_log_handle();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v82 = 0;
                _os_log_impl(&dword_1CA9A8000, v53, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic engagements.", v82, 2u);
              }

              id v12 = v60;
              uint64_t v8 = v61;
              xpc_object_t v54 = v64;
              goto LABEL_48;
            }
            id v26 = [v25 mappingId];
            int v27 = [v26 isEqual:v22];

            if (v27)
            {
              char v28 = [v25 feedbackItems];
              os_log_type_t v29 = [v28 firstObject];

              uint64_t v30 = [v29 itemString];
              if (v30)
              {
                uint64_t v31 = (void *)v30;
                long long v32 = [v29 itemString];
                int v33 = [v70 containsObject:v32];

                if (v33)
                {
                  if ([v29 itemFeedbackType] == 2
                    || [v29 itemFeedbackType] == 1)
                  {
                    BOOL v68 = 0;
                    BOOL v34 = 0;
                    uint64_t v35 = 1;
                  }
                  else
                  {
                    int v36 = [v29 itemFeedbackType];
                    uint64_t v35 = 0;
                    BOOL v68 = v36 == 5;
                    BOOL v34 = v36 != 5;
                  }
                  context = (void *)MEMORY[0x1CB79D060]();
                  v88[0] = @"rank";
                  long long v37 = NSNumber;
                  long long v67 = [v29 itemString];
                  id v66 = objc_msgSend(v37, "numberWithUnsignedInteger:", -[NSObject indexOfObject:](v64, "indexOfObject:", v67));
                  v89[0] = v66;
                  v88[1] = @"domain";
                  long long v38 = +[PPMetricsUtils stringifyDomain:0];
                  v89[1] = v38;
                  v88[2] = @"wasEngaged";
                  long long v39 = [NSNumber numberWithBool:v35];
                  v89[2] = v39;
                  v88[3] = @"wasRejected";
                  uint64_t v40 = [NSNumber numberWithBool:v34];
                  v89[3] = v40;
                  v88[4] = @"wasOffered";
                  long long v41 = [NSNumber numberWithBool:v68];
                  v88[5] = @"mappingId";
                  v89[4] = v41;
                  v89[5] = v72;
                  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:6];

                  [v65 addObject:v42];

                  id v4 = v63;
                }
              }

              uint64_t v22 = v72;
            }
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v43 = v65;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v87 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v75 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v74 + 1) + 8 * j);
            uint64_t v49 = (void *)MEMORY[0x1CB79D060]();
            uint64_t v50 = (void *)[[NSString alloc] initWithFormat:@"%@.EngagedToday", @"com.apple.proactive.PersonalizationPortrait"];
            +[PPMetricsDispatcher logPayloadForEvent:v50 payload:v48 inBackground:1];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v74 objects:v87 count:16];
        }
        while (v45);
      }

      id v12 = v60;
      uint64_t v16 = v59 + 1;
      a2 = v56;
      uint64_t v6 = v62;
      id v4 = v63;
      uint64_t v8 = v61;
      int v14 = off_1E65D3000;
      uint64_t v15 = v58;
    }
    while (v59 + 1 != v57);
    uint64_t v13 = [v60 countByEnumeratingWithState:&v83 objects:buf count:16];
    uint64_t v15 = v58;
    uint64_t v51 = 1;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_51:

LABEL_52:
  return v51;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily location engagement statistics.", buf, 2u);
  }

  uint64_t v7 = objc_opt_new();
  [v7 setLimit:+[PPMaintenance _kValue]()];
  uint64_t v8 = +[PPLocalLocationStore defaultStore];
  id v9 = [v8 rankedLocationsWithQuery:v7 clientProcessName:0 error:a2];

  if (v9)
  {
    if (v4[2](v4))
    {
      os_signpost_id_t v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_304_17290);
      uint64_t v11 = +[PPMaintenance _logEngagementMetricsForDomain:feedback:count:shouldContinue:](v5, 2, v10, [v9 count], v4);
    }
    else
    {
      os_signpost_id_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: deferring location engagement.", v13, 2u);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily named entity engagement statistics.", buf, 2u);
  }

  uint64_t v7 = objc_opt_new();
  [v7 setLimit:+[PPMaintenance _kValue]()];
  uint64_t v8 = +[PPLocalNamedEntityStore defaultStore];
  id v9 = [v8 rankedNamedEntitiesWithQuery:v7 error:a2];

  if (v9)
  {
    if (v4[2](v4))
    {
      os_signpost_id_t v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_301);
      uint64_t v11 = +[PPMaintenance _logEngagementMetricsForDomain:feedback:count:shouldContinue:](v5, 1, v10, [v9 count], v4);
    }
    else
    {
      os_signpost_id_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: deferring entity engagement.", v13, 2u);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (uint64_t)_kValue
{
  if (_kValue__pasOnceToken227 != -1) {
    dispatch_once(&_kValue__pasOnceToken227, &__block_literal_global_239);
  }
  return [(id)_kValue__pasExprOnceResult unsignedIntegerValue];
}

+ (uint64_t)_logEngagementMetricsForDomain:(void *)a3 feedback:(int)a4 count:(void *)a5 shouldContinue:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  self;
  os_signpost_id_t v10 = pp_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    int v43 = a2;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily engagement statistics for domain %d", buf, 8u);
  }

  if (v9[2](v9))
  {
    unsigned int v11 = +[PPMaintenance _kValue]();
    if (v11 > 4)
    {
      unsigned int v14 = v11 / 5;
      uint64_t v15 = objc_opt_new();
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __78__PPMaintenance__logEngagementMetricsForDomain_feedback_count_shouldContinue___block_invoke;
      v34[3] = &unk_1E65D8C58;
      uint64_t v16 = v9;
      id v37 = v16;
      char v40 = a2;
      unsigned int v38 = v14;
      id v35 = v8;
      int v39 = a4;
      id v12 = v15;
      int v36 = v12;
      [v35 enumerateObjectsUsingBlock:v34];
      uint64_t v17 = v9[2](v16);
      uint64_t v13 = v17;
      if (v17)
      {
        int v26 = a2;
        unsigned int v27 = v17;
        id v28 = v8;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        obuint64_t j = v12;
        uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v23 = (void *)[[NSString alloc] initWithFormat:@"%@.EngagedToday", @"com.apple.proactive.PersonalizationPortrait"];
              +[PPMetricsDispatcher logPayloadForEvent:v23 payload:v22 inBackground:1];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
          }
          while (v19);
        }

        char v24 = pp_default_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          int v43 = v26;
          _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily engagement statistics for domain %d.", buf, 8u);
        }
        id v8 = v28;
        uint64_t v13 = v27;
      }
      else
      {
        char v24 = pp_default_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          int v43 = a2;
          _os_log_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement before ratio.", buf, 8u);
        }
      }
    }
    else
    {
      id v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        int v43 = a2;
        _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPMaintenance: no items found in domain %d", buf, 8u);
      }
      uint64_t v13 = 1;
    }
  }
  else
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v43 = a2;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement after decayed counts.", buf, 8u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

void __78__PPMaintenance__logEngagementMetricsForDomain_feedback_count_shouldContinue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    uint64_t v52 = a3;
    unint64_t v59 = a3 / *(_DWORD *)(a1 + 56);
    if ([*(id *)(a1 + 32) count] < v59) {
      unint64_t v59 = [*(id *)(a1 + 32) count] - 1;
    }
    unsigned int v61 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v53 = a1;
    id v54 = v7;
    unsigned int v58 = *(_DWORD *)(a1 + 60);
    id v56 = v7;
    uint64_t v8 = self;
    id v9 = (void *)MEMORY[0x1CB79D060](v8);
    os_signpost_id_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F25693C8, &unk_1F25693E0, &unk_1F25693F8, &unk_1F2569410, 0);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v10;
    uint64_t v60 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v60)
    {
      unsigned int v11 = v61 - 1;
      uint64_t v57 = *(void *)v64;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v64 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v63 + 1) + 8 * v12);
          uint64_t v14 = MEMORY[0x1CB79D060]();
          uint64_t v15 = [v13 unsignedIntegerValue];
          context = (void *)v14;
          switch(v11)
          {
            case 0u:
              [v56 engagedExplicitly];
              goto LABEL_14;
            case 1u:
              [v56 engagedImplicitly];
              goto LABEL_14;
            case 2u:
              [v56 rejectedExplicitly];
              goto LABEL_14;
            case 3u:
              [v56 rejectedImplicitly];
LABEL_14:
              double v17 = v16;
              break;
            default:
              unsigned int v27 = pp_default_log_handle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109376;
                int v72 = v15;
                __int16 v73 = 1024;
                unsigned int v74 = v61;
                _os_log_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEFAULT, "PPMaintenance: attempted to log engagement metrics with unexpected feedback type %u and portrait domain %u", buf, 0xEu);
              }

              double v17 = -1.0;
              break;
          }
          uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@.FeedbackAtK", @"com.apple.proactive.PersonalizationPortrait"];
          uint64_t v19 = (void *)MEMORY[0x1CB79D060]();
          v69[0] = @"k";
          uint64_t v20 = [NSNumber numberWithUnsignedInt:+[PPMaintenance _kValue]()];
          v70[0] = v20;
          v69[1] = @"evaluatedCount";
          uint64_t v21 = [NSNumber numberWithUnsignedInt:v58];
          v70[1] = v21;
          v69[2] = @"bucket";
          uint64_t v22 = [NSNumber numberWithUnsignedInt:v59];
          void v70[2] = v22;
          v69[3] = @"domain";
          uint64_t v23 = +[PPMetricsUtils stringifyDomain:v61];
          v70[3] = v23;
          v69[4] = @"feedbackType";
          char v24 = [MEMORY[0x1E4F89E30] stringForItemFeedbackType:v15];
          v70[4] = v24;
          v69[5] = @"rate";
          uint64_t v25 = [NSNumber numberWithDouble:v17];
          v70[5] = v25;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:6];

          +[PPMetricsDispatcher logPayloadForEvent:v18 payload:v26 inBackground:1];

          ++v12;
          unsigned int v11 = v61 - 1;
        }
        while (v60 != v12);
        uint64_t v28 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
        uint64_t v60 = v28;
      }
      while (v28);
    }

    os_log_type_t v29 = [v56 latestDate];
    [v29 timeIntervalSinceNow];
    double v31 = v30;

    id v7 = v54;
    if (v31 >= -86400.0)
    {
      [v56 engagedExplicitly];
      double v33 = v32;
      uint64_t v34 = [v56 engagedImplicitly];
      double v36 = v33 + v35;
      if (v33 + v35 <= 0.0)
      {
        [v56 rejectedExplicitly];
        double v42 = v41;
        uint64_t v34 = [v56 rejectedImplicitly];
        BOOL v37 = v42 + v43 > 0.0;
        uint64_t v38 = v37;
      }
      else
      {
        BOOL v37 = 0;
        uint64_t v38 = 1;
      }
      uint64_t v44 = *(void **)(v53 + 40);
      uint64_t v45 = (void *)MEMORY[0x1CB79D060](v34);
      v67[0] = @"rank";
      uint64_t v46 = [NSNumber numberWithUnsignedInteger:v52];
      v68[0] = v46;
      v67[1] = @"domain";
      id v47 = +[PPMetricsUtils stringifyDomain:*(unsigned __int8 *)(v53 + 64)];
      v68[1] = v47;
      v67[2] = @"wasEngaged";
      uint64_t v48 = [NSNumber numberWithBool:v36 > 0.0];
      v68[2] = v48;
      v67[3] = @"wasRejected";
      uint64_t v49 = [NSNumber numberWithBool:v37];
      v68[3] = v49;
      v67[4] = @"wasOffered";
      uint64_t v50 = [NSNumber numberWithBool:v38];
      v68[4] = v50;
      uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:5];

      [v44 addObject:v51];

      id v7 = v54;
    }
  }
  else
  {
    int v39 = pp_default_log_handle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      int v40 = *(unsigned __int8 *)(a1 + 64);
      *(_DWORD *)long long v75 = 67109120;
      int v76 = v40;
      _os_log_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement in loop.", v75, 8u);
    }

    *a4 = 1;
  }
}

id __79__PPMaintenance__logNamedEntityEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PPLocalNamedEntityStore defaultStore];
  id v4 = [v3 storage];
  uint64_t v5 = [v2 item];

  uint64_t v6 = [v5 clusterIdentifier];
  id v7 = [v4 decayedFeedbackCountsForClusterIdentifier:v6];

  return v7;
}

void __24__PPMaintenance__kValue__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = +[PPConfiguration sharedInstance];
  id v2 = [v1 engagementKValues];

  if ([v2 count])
  {
    id v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v2, "count")));
  }
  else
  {
    id v3 = &unk_1F25693B0;
  }

  id v4 = (void *)_kValue__pasExprOnceResult;
  _kValue__pasExprOnceResult = (uint64_t)v3;
}

id __76__PPMaintenance__logLocationEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PPLocalLocationStore defaultStore];
  id v4 = [v3 storage];
  uint64_t v5 = [v2 location];

  uint64_t v6 = [v5 clusterIdentifier];
  id v7 = [v4 decayedFeedbackCountsForClusterIdentifier:v6];

  return v7;
}

id __73__PPMaintenance__logTopicEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mappingId];
  id v3 = objc_msgSend(v2, "_pas_stringBackedByUTF8CString");

  return v3;
}

void __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  id v13 = (id)objc_opt_new();
  [v13 setSchemaVersion:*(unsigned int *)(a1 + 48)];
  [v13 setTableName:v8];

  id v9 = +[PPTrialWrapper sharedInstance];
  os_signpost_id_t v10 = [v9 concatenatedTreatmentNames];
  [v13 setActiveTreatments:v10];

  unsigned int v11 = [MEMORY[0x1E4F93728] sharedInstance];
  uint64_t v12 = [v7 integerValue];

  [v11 trackScalarForMessage:v13 updateCount:v12];
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  id v13 = (id)objc_opt_new();
  [v13 setSchemaVersion:*(unsigned int *)(a1 + 48)];
  [v13 setTableName:v8];

  id v9 = +[PPTrialWrapper sharedInstance];
  os_signpost_id_t v10 = [v9 concatenatedTreatmentNames];
  [v13 setActiveTreatments:v10];

  unsigned int v11 = [MEMORY[0x1E4F93728] sharedInstance];
  uint64_t v12 = [v7 integerValue];

  [v11 trackScalarForMessage:v13 updateCount:v12];
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37__PPMaintenance__registerRTCSendLogs__block_invoke()
{
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v0 = pp_maintenance_signpost_handle();
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  id v2 = pp_maintenance_signpost_handle();
  id v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "RTCSendLogs", "", buf, 2u);
  }

  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPMaintenance running sendRTCLogs", v10, 2u);
  }

  uint64_t v5 = +[PPEventMetricsLogger defaultLogger];
  [v5 sendRTCLogsWithCompletion:&__block_literal_global_184_17345];

  uint64_t v6 = pp_maintenance_signpost_handle();
  id v7 = v6;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v7, OS_SIGNPOST_INTERVAL_END, v1, "RTCSendLogs", " enableTelemetry=YES ", v8, 2u);
  }

  PPPostNotification((const char *)kPPMaintenanceJobCompletedNotification);
}

void __37__PPMaintenance__registerRTCSendLogs__block_invoke_181(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "PPMaintenance failed to send RTCLogs: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  id v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityRepairAndExport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityRepairAndExport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:950 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: starting", buf, 2u);
  }

  id v3 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v4 = [v3 storage];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    int v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if (v6)
    {
      id v7 = pp_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: fixing named entity stream", v13, 2u);
      }

      uint64_t v8 = [v3 storage];
      [v8 fixupDKEventsWithShouldContinueBlock:*(void *)(a1 + 32)];

      os_signpost_id_t v9 = [v3 storage];
      [v9 fixupDKEventsMetadataWithShouldContinueBlock:*(void *)(a1 + 32)];

      if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
      {
        os_signpost_id_t v10 = [v3 storage];
        [v10 exportRecordsToDKWithShouldContinueBlock:*(void *)(a1 + 32)];

        unsigned int v11 = pp_default_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: finished", v12, 2u);
        }
      }
    }
  }
}

void __46__PPMaintenance__registerTopicRepairAndExport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  id v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TopicRepairAndExport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TopicRepairAndExport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:892 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: starting", buf, 2u);
  }

  id v3 = +[PPLocalTopicStore defaultStore];
  uint64_t v4 = [v3 storage];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    int v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if (v6)
    {
      id v7 = pp_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: fixing topic stream", v15, 2u);
      }

      uint64_t v8 = [v3 storage];
      [v8 fixupDKEventsWithShouldContinueBlock:*(void *)(a1 + 32)];

      os_signpost_id_t v9 = [v3 storage];
      [v9 fixupDKEventsMetadataWithShouldContinueBlock:*(void *)(a1 + 32)];

      if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
      {
        os_signpost_id_t v10 = pp_default_log_handle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: exporting locally generated topics", v14, 2u);
        }

        unsigned int v11 = [v3 storage];
        [v11 exportRecordsToDKWithShouldContinueBlock:*(void *)(a1 + 32)];

        uint64_t v12 = pp_default_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: finished", v13, 2u);
        }
      }
    }
  }
}

void __43__PPMaintenance__registerNamedEntityImport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PPMaintenance__registerNamedEntityImport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__PPMaintenance__registerNamedEntityImport__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  id v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityImport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:1059 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __43__PPMaintenance__registerNamedEntityImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __43__PPMaintenance__registerNamedEntityImport__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: starting", buf, 2u);
  }

  id v3 = +[PPLocalNamedEntityStore defaultStore];
  id v4 = [v3 storage];
  if (v4)
  {
    char v7 = 0;
    while ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      objc_msgSend(v4, "importRemotelyGeneratedNamedEntityDKEventsWithLimit:isComplete:shouldContinueBlock:", objc_msgSend(v4, "duetReadBatchSize"), &v7, *(void *)(a1 + 32));
      if (v7) {
        goto LABEL_9;
      }
    }
    if (!v7) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: finished", v6, 2u);
    }
  }
LABEL_12:
}

void __37__PPMaintenance__registerTopicImport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PPMaintenance__registerTopicImport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__PPMaintenance__registerTopicImport__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  char v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TopicImport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TopicImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:1005 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __37__PPMaintenance__registerTopicImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __37__PPMaintenance__registerTopicImport__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: starting", buf, 2u);
  }

  id v3 = +[PPLocalTopicStore defaultStore];
  id v4 = [v3 storage];
  if (v4)
  {
    char v7 = 0;
    while ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
    {
      objc_msgSend(v4, "importRemotelyGeneratedTopicDKEventsWithLimit:isComplete:shouldContinueBlock:", objc_msgSend(v4, "duetReadBatchSize"), &v7, *(void *)(a1 + 32));
      if (v7) {
        goto LABEL_9;
      }
    }
    if (!v7) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: finished", v6, 2u);
    }
  }
LABEL_12:
}

+ (id)singletonWarmupQueue
{
  self;
  if (singletonWarmupQueue__pasOnceToken6 != -1) {
    dispatch_once(&singletonWarmupQueue__pasOnceToken6, &__block_literal_global_17371);
  }
  uint64_t v0 = (void *)singletonWarmupQueue__pasExprOnceResult;
  return v0;
}

void __40__PPMaintenance__registerContactsImport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerContactsImport__block_invoke_3;
  aBlock[3] = &unk_1E65D8AF8;
  uint64_t v23 = &v24;
  id v4 = v3;
  id v22 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __40__PPMaintenance__registerContactsImport__block_invoke_4;
  v19[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v20 = v6;
  char v7 = (void (**)(void))_Block_copy(v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ContactsImport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v29 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ContactsImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v25 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v25 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:625 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      double v17 = "PPContactsImporter: deferring";
LABEL_17:
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
  }
  else
  {
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      double v17 = "PPContactsImporter: import complete.";
      goto LABEL_17;
    }
  }

  _Block_object_dispose(&v24, 8);
}

uint64_t __40__PPMaintenance__registerContactsImport__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerContactsImport__block_invoke_4(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: beginning import", buf, 2u);
  }

  id v3 = +[PPContactsImporter defaultInstance];
  id v4 = v3;
  if (v3)
  {
    [v3 importContactsDataWithShouldContinueBlock:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: failed to create importer.", v6, 2u);
    }
  }
}

id __40__PPMaintenance__registerContactsImport__block_invoke()
{
  return +[PPContactsImporter defaultInstance];
}

void __37__PPMaintenance_singletonWarmupQueue__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.PersonalizationPortrait.singletonWarmupQueue" qosClass:9];
  id v2 = (void *)singletonWarmupQueue__pasExprOnceResult;
  singletonWarmupQueue__pasExprOnceResult = v1;
}

void __40__PPMaintenance__registerEventKitImport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerEventKitImport__block_invoke_3;
  aBlock[3] = &unk_1E65D8AF8;
  id v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__PPMaintenance__registerEventKitImport__block_invoke_4;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  char v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EventKitImport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "EventKitImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:520 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: EventKitImport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __40__PPMaintenance__registerEventKitImport__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerEventKitImport__block_invoke_4(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    id v2 = +[PPLocalNamedEntityStore defaultStore];
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    id v3 = +[PPLocalLocationStore defaultStore];
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    id v4 = +[PPLocalEventStore defaultStore];
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v6 = +[PPEventKitImporter defaultInstance];
    id v5 = (id)[v6 importEventDataWithShouldContinueBlock:*(void *)(a1 + 32)];
  }
}

void __40__PPMaintenance__registerEventKitImport__block_invoke()
{
  id v0 = +[PPEventKitImporter defaultInstance];
  [v0 deleteAndReimportAllData];
}

uint64_t __41__PPMaintenance__registerHealthKitImport__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v9 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getHKHealthStoreClass_block_invoke;
    v5[3] = &unk_1E65DC058;
    v5[4] = &v6;
    __getHKHealthStoreClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  uint64_t result = [v3 isHealthDataAvailable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __41__PPMaintenance__registerHealthKitImport__block_invoke_129(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPMaintenance__registerHealthKitImport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  id v22 = &v23;
  id v4 = v3;
  id v21 = v4;
  id v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__PPMaintenance__registerHealthKitImport__block_invoke_3;
  v18[3] = &unk_1E65D8B20;
  id v6 = v5;
  id v19 = v6;
  char v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  os_signpost_id_t v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HealthKitImport", "", buf, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "HealthKitImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v24 + 24)) {
    uint64_t v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    uint64_t v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v15);
  if (*((unsigned char *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:574 description:@"Unexpected failure of deferral"];
    }
    double v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __41__PPMaintenance__registerHealthKitImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __41__PPMaintenance__registerHealthKitImport__block_invoke_3(uint64_t a1)
{
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: beginning import", buf, 2u);
  }

  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    id v4 = [[PPHealthKitImporter alloc] initWithDatabase:v3];
    [(PPHealthKitImporter *)v4 importHealthKitDataWithShouldContinueBlock:*(void *)(a1 + 32)];
  }
  else
  {
    pp_default_log_handle();
    id v4 = (PPHealthKitImporter *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1CA9A8000, &v4->super, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: failed to create database, giving up.", v5, 2u);
    }
  }
}

void __36__PPMaintenance__registerMapsImport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PPMaintenance__registerMapsImport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  id v19 = &v20;
  id v4 = v3;
  id v18 = v4;
  id v5 = _Block_copy(aBlock);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  id v6 = pp_maintenance_signpost_handle();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MapsImport", "", buf, 2u);
  }

  id v10 = v5;
  +[PPMapsSupport importMapsDataWithShouldContinueBlock:v10];
  unsigned int v11 = pp_maintenance_signpost_handle();
  uint64_t v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "MapsImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((unsigned char *)v21 + 24)) {
    int v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v14);

  if (*((unsigned char *)v21 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:468 description:@"Unexpected failure of deferral"];
    }
    uint64_t v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: MapsImport: deferring", buf, 2u);
    }
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __36__PPMaintenance__registerMapsImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

uint64_t __36__PPMaintenance__registerMapsImport__block_invoke_114(uint64_t a1)
{
  return +[PPMapsSupport importMapsDataWithShouldContinueBlock:*(void *)(a1 + 32)];
}

void __43__PPMaintenance__registerCoreRoutineImport__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PPMaintenance__registerCoreRoutineImport__block_invoke_2;
  aBlock[3] = &unk_1E65D8AF8;
  char v23 = &v24;
  id v4 = v3;
  id v22 = v4;
  id v5 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__PPMaintenance__registerCoreRoutineImport__block_invoke_3;
  v18[3] = &unk_1E65D8B68;
  id v6 = v5;
  id v19 = v6;
  uint64_t v20 = &v24;
  os_signpost_id_t v7 = (void (**)(void))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  uint64_t v8 = pp_maintenance_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = pp_maintenance_signpost_handle();
  unsigned int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)double v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CoreRoutineImport", "", v17, 2u);
  }

  v7[2](v7);
  uint64_t v12 = pp_maintenance_signpost_handle();
  int v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)double v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v13, OS_SIGNPOST_INTERVAL_END, v9, "CoreRoutineImport", " enableTelemetry=YES ", v17, 2u);
  }

  if (*((unsigned char *)v25 + 24)) {
    int v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  }
  else {
    int v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  }
  PPPostNotification(*v14);
  if (*((unsigned char *)v25 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPMaintenance.m" lineNumber:432 description:@"Unexpected failure of deferral"];
    }
    uint64_t v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v17 = 0;
      _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPMaintenance: CoreRoutineImport: deferring", v17, 2u);
    }
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __43__PPMaintenance__registerCoreRoutineImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24)) {
    goto LABEL_4;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_4:
    uint64_t result = 0;
    *(unsigned char *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __43__PPMaintenance__registerCoreRoutineImport__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = 0;
  BOOL v2 = +[PPRoutineSupport importCoreRoutineDataWithError:&v5 shouldContinueBlock:*(void *)(a1 + 32)];
  id v3 = v5;
  if (!v2)
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, "PPMaintenance: CoreRoutineImport: importCoreRoutineDataWithError failed: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: CoreRoutineImport: completed successfully.", buf, 2u);
    }
LABEL_7:
  }
}

@end