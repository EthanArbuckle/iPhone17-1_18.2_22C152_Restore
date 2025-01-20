@interface CKContainer(Workflow)
+ (id)wf_shortcutsContainer;
- (void)wf_setShortcutsAppAttribution;
@end

@implementation CKContainer(Workflow)

+ (id)wf_shortcutsContainer
{
  v0 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  if ([v0 BOOLForKey:@"WFCloudKitDevEnvironment"]) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 1;
  }

  id v2 = objc_alloc(MEMORY[0x1E4F19ED8]);
  v3 = (void *)[v2 initWithContainerIdentifier:*MEMORY[0x1E4F5ABD8] environment:v1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v3];
  objc_msgSend(v4, "wf_setShortcutsAppAttribution");

  return v4;
}

- (void)wf_setShortcutsAppAttribution
{
  uint64_t v2 = *MEMORY[0x1E4FB4BE8];
  v3 = [a1 options];
  [v3 setApplicationBundleIdentifierOverrideForTCC:v2];

  v4 = [a1 options];
  [v4 setApplicationBundleIdentifierOverrideForContainerAccess:v2];

  v5 = [a1 options];
  [v5 setApplicationBundleIdentifierOverrideForNetworkAttribution:v2];

  id v6 = [a1 options];
  [v6 setApplicationBundleIdentifierOverrideForPushTopicGeneration:v2];
}

@end