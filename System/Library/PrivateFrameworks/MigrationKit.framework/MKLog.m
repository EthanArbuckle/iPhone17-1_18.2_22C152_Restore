@interface MKLog
+ (id)log;
+ (id)logForAccounts;
+ (id)logForApps;
+ (id)logForBookmarks;
+ (id)logForCalendar;
+ (id)logForCallHistory;
+ (id)logForContacts;
+ (id)logForFiles;
+ (id)logForMessages;
+ (id)logForNetwork;
+ (id)logForPhotoLibrary;
+ (id)logForSettings;
+ (id)logForUI;
+ (id)logForVoiceMemos;
@end

@implementation MKLog

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)log_log;
  return v2;
}

void __12__MKLog_log__block_invoke()
{
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_2);
  }
}

uint64_t __12__MKLog_log__block_invoke_2()
{
  log_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "network");
  return MEMORY[0x270F9A758]();
}

+ (id)logForNetwork
{
  if (logForNetwork_onceToken != -1) {
    dispatch_once(&logForNetwork_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)logForNetwork_log;
  return v2;
}

void __22__MKLog_logForNetwork__block_invoke()
{
  if (_block_invoke_2_onceToken != -1) {
    dispatch_once(&_block_invoke_2_onceToken, &__block_literal_global_7);
  }
}

uint64_t __22__MKLog_logForNetwork__block_invoke_2()
{
  logForNetwork_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "network");
  return MEMORY[0x270F9A758]();
}

+ (id)logForMessages
{
  if (logForMessages_onceToken != -1) {
    dispatch_once(&logForMessages_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)logForMessages_log;
  return v2;
}

void __23__MKLog_logForMessages__block_invoke()
{
  if (_block_invoke_3_onceToken != -1) {
    dispatch_once(&_block_invoke_3_onceToken, &__block_literal_global_11);
  }
}

uint64_t __23__MKLog_logForMessages__block_invoke_2()
{
  logForMessages_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "messages");
  return MEMORY[0x270F9A758]();
}

+ (id)logForContacts
{
  if (logForContacts_onceToken != -1) {
    dispatch_once(&logForContacts_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)logForContacts_log;
  return v2;
}

void __23__MKLog_logForContacts__block_invoke()
{
  if (_block_invoke_4_onceToken != -1) {
    dispatch_once(&_block_invoke_4_onceToken, &__block_literal_global_16);
  }
}

uint64_t __23__MKLog_logForContacts__block_invoke_2()
{
  logForContacts_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "contacts");
  return MEMORY[0x270F9A758]();
}

+ (id)logForCallHistory
{
  if (logForCallHistory_onceToken != -1) {
    dispatch_once(&logForCallHistory_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)logForCallHistory_log;
  return v2;
}

void __26__MKLog_logForCallHistory__block_invoke()
{
  if (_block_invoke_5_onceToken != -1) {
    dispatch_once(&_block_invoke_5_onceToken, &__block_literal_global_21);
  }
}

uint64_t __26__MKLog_logForCallHistory__block_invoke_2()
{
  logForCallHistory_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "call_history");
  return MEMORY[0x270F9A758]();
}

+ (id)logForCalendar
{
  if (logForCalendar_onceToken != -1) {
    dispatch_once(&logForCalendar_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)logForCalendar_log;
  return v2;
}

void __23__MKLog_logForCalendar__block_invoke()
{
  if (_block_invoke_6_onceToken != -1) {
    dispatch_once(&_block_invoke_6_onceToken, &__block_literal_global_26);
  }
}

uint64_t __23__MKLog_logForCalendar__block_invoke_2()
{
  logForCalendar_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "calendar");
  return MEMORY[0x270F9A758]();
}

+ (id)logForBookmarks
{
  if (logForBookmarks_onceToken != -1) {
    dispatch_once(&logForBookmarks_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)logForBookmarks_log;
  return v2;
}

void __24__MKLog_logForBookmarks__block_invoke()
{
  if (_block_invoke_7_onceToken != -1) {
    dispatch_once(&_block_invoke_7_onceToken, &__block_literal_global_31);
  }
}

uint64_t __24__MKLog_logForBookmarks__block_invoke_2()
{
  logForBookmarks_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "bookmarks");
  return MEMORY[0x270F9A758]();
}

+ (id)logForPhotoLibrary
{
  if (logForPhotoLibrary_onceToken != -1) {
    dispatch_once(&logForPhotoLibrary_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)logForPhotoLibrary_log;
  return v2;
}

void __27__MKLog_logForPhotoLibrary__block_invoke()
{
  if (_block_invoke_8_onceToken != -1) {
    dispatch_once(&_block_invoke_8_onceToken, &__block_literal_global_36);
  }
}

uint64_t __27__MKLog_logForPhotoLibrary__block_invoke_2()
{
  logForPhotoLibrary_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "photo_library");
  return MEMORY[0x270F9A758]();
}

+ (id)logForVoiceMemos
{
  if (logForVoiceMemos_onceToken != -1) {
    dispatch_once(&logForVoiceMemos_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)logForVoiceMemos_log;
  return v2;
}

void __25__MKLog_logForVoiceMemos__block_invoke()
{
  if (_block_invoke_9_onceToken != -1) {
    dispatch_once(&_block_invoke_9_onceToken, &__block_literal_global_41);
  }
}

uint64_t __25__MKLog_logForVoiceMemos__block_invoke_2()
{
  logForVoiceMemos_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "voice_memo");
  return MEMORY[0x270F9A758]();
}

+ (id)logForAccounts
{
  if (logForAccounts_onceToken != -1) {
    dispatch_once(&logForAccounts_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)logForAccounts_log;
  return v2;
}

void __23__MKLog_logForAccounts__block_invoke()
{
  if (_block_invoke_10_onceToken != -1) {
    dispatch_once(&_block_invoke_10_onceToken, &__block_literal_global_46);
  }
}

uint64_t __23__MKLog_logForAccounts__block_invoke_2()
{
  logForAccounts_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "accounts");
  return MEMORY[0x270F9A758]();
}

+ (id)logForFiles
{
  if (logForFiles_onceToken != -1) {
    dispatch_once(&logForFiles_onceToken, &__block_literal_global_49);
  }
  v2 = (void *)logForFiles_log;
  return v2;
}

void __20__MKLog_logForFiles__block_invoke()
{
  if (_block_invoke_11_onceToken != -1) {
    dispatch_once(&_block_invoke_11_onceToken, &__block_literal_global_51);
  }
}

uint64_t __20__MKLog_logForFiles__block_invoke_2()
{
  logForFiles_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "files");
  return MEMORY[0x270F9A758]();
}

+ (id)logForSettings
{
  if (logForSettings_onceToken != -1) {
    dispatch_once(&logForSettings_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)logForSettings_log;
  return v2;
}

void __23__MKLog_logForSettings__block_invoke()
{
  if (_block_invoke_12_onceToken != -1) {
    dispatch_once(&_block_invoke_12_onceToken, &__block_literal_global_56);
  }
}

uint64_t __23__MKLog_logForSettings__block_invoke_2()
{
  logForSettings_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "settings");
  return MEMORY[0x270F9A758]();
}

+ (id)logForApps
{
  if (logForApps_onceToken != -1) {
    dispatch_once(&logForApps_onceToken, &__block_literal_global_59);
  }
  v2 = (void *)logForApps_log;
  return v2;
}

void __19__MKLog_logForApps__block_invoke()
{
  if (_block_invoke_13_onceToken != -1) {
    dispatch_once(&_block_invoke_13_onceToken, &__block_literal_global_61);
  }
}

uint64_t __19__MKLog_logForApps__block_invoke_2()
{
  logForApps_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "apps");
  return MEMORY[0x270F9A758]();
}

+ (id)logForUI
{
  if (logForUI_onceToken != -1) {
    dispatch_once(&logForUI_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)logForUI_log;
  return v2;
}

void __17__MKLog_logForUI__block_invoke()
{
  if (_block_invoke_14_onceToken != -1) {
    dispatch_once(&_block_invoke_14_onceToken, &__block_literal_global_66);
  }
}

uint64_t __17__MKLog_logForUI__block_invoke_2()
{
  logForUI_log = (uint64_t)os_log_create((const char *)[@"com.apple.MigrationKit" UTF8String], "ui");
  return MEMORY[0x270F9A758]();
}

@end