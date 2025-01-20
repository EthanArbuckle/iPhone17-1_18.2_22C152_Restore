@interface NSPersistentStoreDescription(Workflow)
+ (id)wf_configurationInDirectory:()Workflow filename:;
+ (id)wf_inMemoryConfiguration;
+ (id)wf_legacyVoiceShortcutsConfiguration;
+ (id)wf_shortcutsConfiguration;
+ (id)wf_voiceShortcutsDirectoryURL;
@end

@implementation NSPersistentStoreDescription(Workflow)

+ (id)wf_shortcutsConfiguration
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_shortcutsDirectoryURL");
  v3 = objc_msgSend(a1, "wf_configurationInDirectory:filename:", v2, @"Shortcuts.sqlite");

  return v3;
}

+ (id)wf_configurationInDirectory:()Workflow filename:
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 isFileURL] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSPersistentStoreDescription+Workflow.m", 42, @"Invalid parameter not satisfying: %@", @"directoryURL.fileURL" object file lineNumber description];
  }
  if (![v8 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NSPersistentStoreDescription+Workflow.m", 43, @"Invalid parameter not satisfying: %@", @"filename.length" object file lineNumber description];
  }
  v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];
  v10 = (void *)[[a1 alloc] initWithURL:v9];

  return v10;
}

+ (id)wf_inMemoryConfiguration
{
  v1 = objc_msgSend(a1, "wf_shortcutsConfiguration");
  [v1 setType:*MEMORY[0x1E4F1BF70]];
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/dev/null" isDirectory:0];
  [v1 setURL:v2];

  return v1;
}

+ (id)wf_legacyVoiceShortcutsConfiguration
{
  v2 = objc_msgSend(a1, "wf_voiceShortcutsDirectoryURL");
  v3 = objc_msgSend(a1, "wf_configurationInDirectory:filename:", v2, @"VoiceShortcuts.sqlite");

  return v3;
}

+ (id)wf_voiceShortcutsDirectoryURL
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_realLibraryDirectoryURL");
  v1 = [v0 URLByAppendingPathComponent:@"VoiceShortcuts" isDirectory:1];

  return v1;
}

@end