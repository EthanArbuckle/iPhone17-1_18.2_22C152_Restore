id __atxlog_handle_default()
{
  void *v0;
  uint64_t vars8;

  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)__atxlog_handle_default_log;
  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  __atxlog_handle_default_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)__atxlog_handle_xpc_log;
  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  __atxlog_handle_xpc_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)__atxlog_handle_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  __atxlog_handle_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__atxlog_handle_notifications_log;
  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  __atxlog_handle_notifications_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)__atxlog_handle_pmm_log;
  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  __atxlog_handle_pmm_log = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)__atxlog_handle_dailyroutines_log;
  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  __atxlog_handle_dailyroutines_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)__atxlog_handle_feedback_log;
  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  __atxlog_handle_feedback_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)__atxlog_handle_modes_log;
  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  __atxlog_handle_modes_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26);
  }
  v0 = (void *)__atxlog_handle_hero_log;
  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  __atxlog_handle_hero_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)__atxlog_handle_deletions_log;
  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  __atxlog_handle_deletions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)__atxlog_handle_gi_log;
  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  __atxlog_handle_gi_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35);
  }
  v0 = (void *)__atxlog_handle_timeline_log;
  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  __atxlog_handle_timeline_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)__atxlog_handle_relevant_shortcut_log;
  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  __atxlog_handle_relevant_shortcut_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  v0 = (void *)__atxlog_handle_relevance_model_log;
  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  __atxlog_handle_relevance_model_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)__atxlog_handle_watch_log;
  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  __atxlog_handle_watch_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)__atxlog_handle_ui_log;
  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  __atxlog_handle_ui_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)__atxlog_handle_blending_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  __atxlog_handle_blending_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)__atxlog_handle_blending_internal_cache_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  __atxlog_handle_blending_internal_cache_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  v0 = (void *)__atxlog_handle_blending_ecosystem_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  __atxlog_handle_blending_ecosystem_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59);
  }
  v0 = (void *)__atxlog_handle_home_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  __atxlog_handle_home_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62);
  }
  v0 = (void *)__atxlog_handle_sleep_schedule_log;
  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  __atxlog_handle_sleep_schedule_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  v0 = (void *)__atxlog_handle_lock_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  __atxlog_handle_lock_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)__atxlog_handle_anchor_log;
  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  __atxlog_handle_anchor_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)__atxlog_handle_app_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  __atxlog_handle_app_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)__atxlog_handle_action_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  __atxlog_handle_action_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  v0 = (void *)__atxlog_handle_app_library_log;
  return v0;
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  __atxlog_handle_app_library_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  v0 = (void *)__atxlog_handle_app_install_log;
  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  __atxlog_handle_app_install_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83);
  }
  v0 = (void *)__atxlog_handle_backup_log;
  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  __atxlog_handle_backup_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  v0 = (void *)__atxlog_handle_metrics_log;
  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  __atxlog_handle_metrics_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  v0 = (void *)__atxlog_handle_trial_assets_log;
  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  __atxlog_handle_trial_assets_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  v0 = (void *)__atxlog_handle_notification_management_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  __atxlog_handle_notification_management_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  v0 = (void *)__atxlog_handle_contextual_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  __atxlog_handle_contextual_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98);
  }
  v0 = (void *)__atxlog_handle_intents_helper_log;
  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  __atxlog_handle_intents_helper_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  v0 = (void *)__atxlog_handle_context_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  __atxlog_handle_context_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  v0 = (void *)__atxlog_handle_zkw_hide_log;
  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  __atxlog_handle_zkw_hide_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  v0 = (void *)__atxlog_handle_time_intelligence_log;
  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  __atxlog_handle_time_intelligence_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  v0 = (void *)__atxlog_handle_contextual_engine_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  __atxlog_handle_contextual_engine_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  v0 = (void *)__atxlog_handle_usage_insights_log;
  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  __atxlog_handle_usage_insights_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  v0 = (void *)__atxlog_handle_notification_categorization_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  __atxlog_handle_notification_categorization_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)__atxlog_handle_settings_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  return MEMORY[0x270F9A758]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}