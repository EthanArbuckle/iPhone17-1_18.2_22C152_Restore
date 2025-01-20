@interface NSUserDefaults(WBSStartPageSectionManagerStorage)
- (id)startPageSectionDescriptors;
- (void)setStartPageSectionDescriptors:()WBSStartPageSectionManagerStorage;
- (void)startPageSectionDescriptors;
@end

@implementation NSUserDefaults(WBSStartPageSectionManagerStorage)

- (id)startPageSectionDescriptors
{
  v1 = [a1 objectForKey:@"StartPageSections"];
  id v6 = 0;
  v2 = +[WBSStartPageSectionSerialization decodeSectionsFromData:v1 expectedFormat:0 allowingFallbackFormats:0 error:&v6];
  id v3 = v6;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(NSUserDefaults(WBSStartPageSectionManagerStorage) *)v4 startPageSectionDescriptors];
    }
  }

  return v2;
}

- (void)setStartPageSectionDescriptors:()WBSStartPageSectionManagerStorage
{
  id v7 = 0;
  v4 = +[WBSStartPageSectionSerialization encodeSectionsAsLocalData:a3 error:&v7];
  id v5 = v7;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSUserDefaults(WBSStartPageSectionManagerStorage) setStartPageSectionDescriptors:](v6, v5);
    }
  }
  [a1 setObject:v4 forKey:@"StartPageSections"];
}

- (void)startPageSectionDescriptors
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to decode section data: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)setStartPageSectionDescriptors:()WBSStartPageSectionManagerStorage .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to serialize section data: %{public}@", v7, v8, v9, v10, 2u);
}

@end