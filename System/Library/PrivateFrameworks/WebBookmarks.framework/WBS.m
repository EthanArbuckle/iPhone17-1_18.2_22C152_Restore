@interface WBS
@end

@implementation WBS

uint64_t __WBS_LOG_CHANNEL_PREFIXTabGroup_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "TabGroup");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXTabGroup_log;
  WBS_LOG_CHANNEL_PREFIXTabGroup_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXBookmarks_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Bookmarks");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXBookmarks_log;
  WBS_LOG_CHANNEL_PREFIXBookmarks_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXBookmarkSync_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "BookmarkSync");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
  WBS_LOG_CHANNEL_PREFIXBookmarkSync_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXCloudBookmarks_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "CloudBookmarks");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log;
  WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXCycler_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Cycler");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXCycler_log;
  WBS_LOG_CHANNEL_PREFIXCycler_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXDataMigration_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "DataMigration");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXDataMigration_log;
  WBS_LOG_CHANNEL_PREFIXDataMigration_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXReadingList_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "ReadingList");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXReadingList_log;
  WBS_LOG_CHANNEL_PREFIXReadingList_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXReadingListIcons_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "ReadingListIcons");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXReadingListIcons_log;
  WBS_LOG_CHANNEL_PREFIXReadingListIcons_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXTabs_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Tabs");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXTabs_log;
  WBS_LOG_CHANNEL_PREFIXTabs_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXWebsiteData_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "WebsiteData");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXWebsiteData_log;
  WBS_LOG_CHANNEL_PREFIXWebsiteData_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "WebBookmarkServer");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log;
  WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXCloudSettings_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "CloudSettings");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXCloudSettings_log;
  WBS_LOG_CHANNEL_PREFIXCloudSettings_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXProfiles_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Profiles");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXProfiles_log;
  WBS_LOG_CHANNEL_PREFIXProfiles_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXImport_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Import");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXImport_log;
  WBS_LOG_CHANNEL_PREFIXImport_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __WBS_LOG_CHANNEL_PREFIXExport_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebBookmarks", "Export");
  uint64_t v1 = WBS_LOG_CHANNEL_PREFIXExport_log;
  WBS_LOG_CHANNEL_PREFIXExport_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end