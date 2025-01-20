@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __55__NSUserDefaults_Workflow__systemShortcutsUserDefaults__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = [v0 initWithSuiteName:*MEMORY[0x1E4FB4BF8]];
  v2 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  systemShortcutsUserDefaults_systemShortcutsUserDefaults = v1;

  v3 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  v5[0] = @"WFSiriShortcutsMultipageDisambiguationEnabled";
  v5[1] = @"IntentsHandledBySiriOverride";
  v6[0] = MEMORY[0x1E4F1CC38];
  v6[1] = &unk_1F23173E8;
  v5[2] = @"WFShortcutsToastedBannerAutoCollapseDuration";
  v6[2] = &unk_1F23165C0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 registerDefaults:v4];
}

void __49__NSUserDefaults_Sync__syncShortcutsUserDefaults__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = [v0 initWithSuiteName:*MEMORY[0x1E4FB4BF8]];
  v2 = (void *)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
  syncShortcutsUserDefaults_syncShortcutsUserDefaults = v1;

  v3 = (void *)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
  v5[0] = @"WFShortcutsShouldSyncCoherence";
  v5[1] = @"WFSyncEventLoggingEnabled";
  v6[0] = MEMORY[0x1E4F1CC28];
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[2] = @"WFCloudKitLibraryFetched";
  void v5[3] = @"WFSyncUnavailableMessageDismissedByUser";
  v6[2] = MEMORY[0x1E4F1CC28];
  v6[3] = MEMORY[0x1E4F1CC28];
  v5[4] = @"WFSyncUnavailableMessageCount";
  void v6[4] = &unk_1F2317190;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  [v3 registerDefaults:v4];
}

void __48__NSUserDefaults_Workflow__workflowUserDefaults__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = [v0 initWithSuiteName:*MEMORY[0x1E4F5AC20]];
  v2 = (void *)workflowUserDefaults_workflowUserDefaults;
  workflowUserDefaults_workflowUserDefaults = v1;

  v3 = (void *)workflowUserDefaults_workflowUserDefaults;
  v7[0] = @"WFEmailAutomationEnabled";
  v7[1] = @"WFMessagesAutomationEnabled";
  v8[0] = MEMORY[0x1E4F1CC38];
  v8[1] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v3 registerDefaults:v4];

  if (([(id)workflowUserDefaults_workflowUserDefaults BOOLForKey:@"WFActionDefaultFavoritesAddedKey"] & 1) == 0)
  {
    [(id)workflowUserDefaults_workflowUserDefaults setBool:1 forKey:@"WFActionDefaultFavoritesAddedKey"];
    v5 = [(id)workflowUserDefaults_workflowUserDefaults arrayForKey:@"WFActionFavorites"];
    v6 = v5;
    if (!v5 || ![v5 count]) {
      [(id)workflowUserDefaults_workflowUserDefaults setValue:&unk_1F23173D0 forKey:@"WFActionFavorites"];
    }
  }
}

void __53__NSUserDefaults_Workflow__siriAssistantUserDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.assistant"];
  uint64_t v1 = (void *)siriAssistantUserDefaults_siriAssistantUserDefaults;
  siriAssistantUserDefaults_siriAssistantUserDefaults = v0;
}

@end