@interface REMLog
+ (OS_os_log)account;
+ (OS_os_log)accountPlugin;
+ (OS_os_log)alarmEngine;
+ (OS_os_log)analytics;
+ (OS_os_log)appIntents;
+ (OS_os_log)applicationShortcut;
+ (OS_os_log)changeTracking;
+ (OS_os_log)cloudkit;
+ (OS_os_log)cloudkitCollaboration;
+ (OS_os_log)crdt;
+ (OS_os_log)dataAccess;
+ (OS_os_log)editor;
+ (OS_os_log)housekeepingingActivityScheduler;
+ (OS_os_log)inlineTagAutoConvertEngine;
+ (OS_os_log)intelligentGrocery;
+ (OS_os_log)migration;
+ (OS_os_log)notification;
+ (OS_os_log)ppt;
+ (OS_os_log)scripting;
+ (OS_os_log)siriKit;
+ (OS_os_log)suggestedAttributes;
+ (OS_os_log)suggestedAttributesAutoTrainer;
+ (OS_os_log)templates;
+ (OS_os_log)timelineEngine;
+ (OS_os_log)ui;
+ (OS_os_log)userAction;
+ (OS_os_log)utility;
+ (OS_os_log)xpc;
+ (id)search;
@end

@implementation REMLog

+ (OS_os_log)utility
{
  if (utility_onceToken != -1) {
    dispatch_once(&utility_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)utility___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1) {
    dispatch_once(&xpc_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)xpc___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)cloudkit
{
  if (cloudkit_onceToken != -1) {
    dispatch_once(&cloudkit_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)cloudkit___log;

  return (OS_os_log *)v2;
}

uint64_t __13__REMLog_xpc__block_invoke()
{
  xpc___log = (uint64_t)os_log_create("com.apple.reminderkit", "xpc");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)ui
{
  if (ui_onceToken != -1) {
    dispatch_once(&ui_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)ui___log;

  return (OS_os_log *)v2;
}

uint64_t __12__REMLog_ui__block_invoke()
{
  ui___log = (uint64_t)os_log_create("com.apple.reminderkit", "ui");

  return MEMORY[0x1F41817F8]();
}

uint64_t __20__REMLog_userAction__block_invoke()
{
  userAction___log = (uint64_t)os_log_create("com.apple.reminderkit", "userAction");

  return MEMORY[0x1F41817F8]();
}

uint64_t __19__REMLog_analytics__block_invoke()
{
  analytics___log = (uint64_t)os_log_create("com.apple.reminderkit", "analytics");

  return MEMORY[0x1F41817F8]();
}

uint64_t __17__REMLog_utility__block_invoke()
{
  utility___log = (uint64_t)os_log_create("com.apple.reminderkit", "utility");

  return MEMORY[0x1F41817F8]();
}

uint64_t __17__REMLog_siriKit__block_invoke()
{
  siriKit___log = (uint64_t)os_log_create("com.apple.reminderkit", "siriKit");

  return MEMORY[0x1F41817F8]();
}

uint64_t __13__REMLog_ppt__block_invoke()
{
  ppt___log = (uint64_t)os_log_create("com.apple.reminderkit", "ppt");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)userAction
{
  if (userAction_onceToken != -1) {
    dispatch_once(&userAction_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)userAction___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)siriKit
{
  if (siriKit_onceToken != -1) {
    dispatch_once(&siriKit_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)siriKit___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)ppt
{
  if (ppt_onceToken != -1) {
    dispatch_once(&ppt_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)ppt___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)analytics
{
  if (analytics_onceToken != -1) {
    dispatch_once(&analytics_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)analytics___log;

  return (OS_os_log *)v2;
}

+ (OS_os_log)changeTracking
{
  if (changeTracking_onceToken != -1) {
    dispatch_once(&changeTracking_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)changeTracking___log;

  return (OS_os_log *)v2;
}

uint64_t __24__REMLog_changeTracking__block_invoke()
{
  changeTracking___log = (uint64_t)os_log_create("com.apple.reminderkit", "changeTracking");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)editor
{
  if (editor_onceToken != -1) {
    dispatch_once(&editor_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)editor___log;

  return (OS_os_log *)v2;
}

uint64_t __16__REMLog_editor__block_invoke()
{
  editor___log = (uint64_t)os_log_create("com.apple.reminderkit", "editor");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)crdt
{
  if (crdt_onceToken != -1) {
    dispatch_once(&crdt_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)crdt___log;

  return (OS_os_log *)v2;
}

uint64_t __14__REMLog_crdt__block_invoke()
{
  crdt___log = (uint64_t)os_log_create("com.apple.reminderkit", "crdt");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)alarmEngine
{
  if (alarmEngine_onceToken != -1) {
    dispatch_once(&alarmEngine_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)alarmEngine___log;

  return (OS_os_log *)v2;
}

uint64_t __21__REMLog_alarmEngine__block_invoke()
{
  alarmEngine___log = (uint64_t)os_log_create("com.apple.reminderkit", "alarmEngine");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)timelineEngine
{
  if (timelineEngine_onceToken != -1) {
    dispatch_once(&timelineEngine_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)timelineEngine___log;

  return (OS_os_log *)v2;
}

uint64_t __24__REMLog_timelineEngine__block_invoke()
{
  timelineEngine___log = (uint64_t)os_log_create("com.apple.reminderkit", "timelineEngine");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)housekeepingingActivityScheduler
{
  if (housekeepingingActivityScheduler_onceToken != -1) {
    dispatch_once(&housekeepingingActivityScheduler_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)housekeepingingActivityScheduler___log;

  return (OS_os_log *)v2;
}

uint64_t __42__REMLog_housekeepingingActivityScheduler__block_invoke()
{
  housekeepingingActivityScheduler___log = (uint64_t)os_log_create("com.apple.reminderkit", "housekeepingingActivityScheduler");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)suggestedAttributesAutoTrainer
{
  if (suggestedAttributesAutoTrainer_onceToken != -1) {
    dispatch_once(&suggestedAttributesAutoTrainer_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)suggestedAttributesAutoTrainer___log;

  return (OS_os_log *)v2;
}

uint64_t __40__REMLog_suggestedAttributesAutoTrainer__block_invoke()
{
  suggestedAttributesAutoTrainer___log = (uint64_t)os_log_create("com.apple.reminderkit", "suggestedAttributesAutoTrainer");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)inlineTagAutoConvertEngine
{
  if (inlineTagAutoConvertEngine_onceToken != -1) {
    dispatch_once(&inlineTagAutoConvertEngine_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)inlineTagAutoConvertEngine___log;

  return (OS_os_log *)v2;
}

uint64_t __36__REMLog_inlineTagAutoConvertEngine__block_invoke()
{
  inlineTagAutoConvertEngine___log = (uint64_t)os_log_create("com.apple.reminderkit", "inlineTagAutoConvertEngine");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)templates
{
  if (templates_onceToken != -1) {
    dispatch_once(&templates_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)templates___log;

  return (OS_os_log *)v2;
}

uint64_t __19__REMLog_templates__block_invoke()
{
  templates___log = (uint64_t)os_log_create("com.apple.reminderkit", "templates");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)accountPlugin
{
  if (accountPlugin_onceToken != -1) {
    dispatch_once(&accountPlugin_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)accountPlugin___log;

  return (OS_os_log *)v2;
}

uint64_t __23__REMLog_accountPlugin__block_invoke()
{
  accountPlugin___log = (uint64_t)os_log_create("com.apple.reminderkit", "accountPlugin");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)suggestedAttributes
{
  if (suggestedAttributes_onceToken != -1) {
    dispatch_once(&suggestedAttributes_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)suggestedAttributes___log;

  return (OS_os_log *)v2;
}

uint64_t __29__REMLog_suggestedAttributes__block_invoke()
{
  suggestedAttributes___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "suggestedAttributes");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)intelligentGrocery
{
  if (intelligentGrocery_onceToken != -1) {
    dispatch_once(&intelligentGrocery_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)intelligentGrocery___log;

  return (OS_os_log *)v2;
}

uint64_t __28__REMLog_intelligentGrocery__block_invoke()
{
  intelligentGrocery___log = (uint64_t)os_log_create("com.apple.reminderkit.store", "intelligentGrocery");

  return MEMORY[0x1F41817F8]();
}

uint64_t __18__REMLog_cloudkit__block_invoke()
{
  cloudkit___log = (uint64_t)os_log_create("com.apple.reminderkit", "cloudkit");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)cloudkitCollaboration
{
  if (cloudkitCollaboration_onceToken != -1) {
    dispatch_once(&cloudkitCollaboration_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)cloudkitCollaboration___log;

  return (OS_os_log *)v2;
}

uint64_t __31__REMLog_cloudkitCollaboration__block_invoke()
{
  cloudkitCollaboration___log = (uint64_t)os_log_create("com.apple.reminderkit", "cloudkit.collaboration");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)migration
{
  if (migration_onceToken != -1) {
    dispatch_once(&migration_onceToken, &__block_literal_global_53);
  }
  v2 = (void *)migration___log;

  return (OS_os_log *)v2;
}

uint64_t __19__REMLog_migration__block_invoke()
{
  migration___log = (uint64_t)os_log_create("com.apple.reminderkit", "migration");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)dataAccess
{
  if (dataAccess_onceToken != -1) {
    dispatch_once(&dataAccess_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)dataAccess___log;

  return (OS_os_log *)v2;
}

uint64_t __20__REMLog_dataAccess__block_invoke()
{
  dataAccess___log = (uint64_t)os_log_create("com.apple.reminderkit", "dataAccess");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)appIntents
{
  if (appIntents_onceToken != -1) {
    dispatch_once(&appIntents_onceToken, &__block_literal_global_65);
  }
  v2 = (void *)appIntents___log;

  return (OS_os_log *)v2;
}

uint64_t __20__REMLog_appIntents__block_invoke()
{
  appIntents___log = (uint64_t)os_log_create("com.apple.reminderkit", "appIntents");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)applicationShortcut
{
  if (applicationShortcut_onceToken != -1) {
    dispatch_once(&applicationShortcut_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)applicationShortcut___log;

  return (OS_os_log *)v2;
}

uint64_t __29__REMLog_applicationShortcut__block_invoke()
{
  applicationShortcut___log = (uint64_t)os_log_create("com.apple.reminderkit", "applicationShortcut");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)notification
{
  if (notification_onceToken != -1) {
    dispatch_once(&notification_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)notification___log;

  return (OS_os_log *)v2;
}

uint64_t __22__REMLog_notification__block_invoke()
{
  notification___log = (uint64_t)os_log_create("com.apple.reminderkit", "notification");

  return MEMORY[0x1F41817F8]();
}

+ (id)search
{
  if (search_onceToken != -1) {
    dispatch_once(&search_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)search___log;

  return v2;
}

uint64_t __16__REMLog_search__block_invoke()
{
  search___log = (uint64_t)os_log_create("com.apple.reminderkit", "search");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)account
{
  if (account_onceToken != -1) {
    dispatch_once(&account_onceToken, &__block_literal_global_77);
  }
  v2 = (void *)account___log;

  return (OS_os_log *)v2;
}

uint64_t __17__REMLog_account__block_invoke()
{
  account___log = (uint64_t)os_log_create("com.apple.reminderkit", "account");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)scripting
{
  if (scripting_onceToken != -1) {
    dispatch_once(&scripting_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)scripting___log;

  return (OS_os_log *)v2;
}

uint64_t __19__REMLog_scripting__block_invoke()
{
  scripting___log = (uint64_t)os_log_create("com.apple.reminderkit", "scripting");

  return MEMORY[0x1F41817F8]();
}

@end