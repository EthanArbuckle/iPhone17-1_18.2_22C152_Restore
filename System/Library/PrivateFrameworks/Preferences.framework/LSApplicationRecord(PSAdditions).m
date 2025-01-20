@interface LSApplicationRecord(PSAdditions)
- (uint64_t)supportsJournalingSuggestions;
@end

@implementation LSApplicationRecord(PSAdditions)

- (uint64_t)supportsJournalingSuggestions
{
  if (!MomentsOnboardingAndSettingsLibraryCore()) {
    return 0;
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getMOApprovedApplicationsManagerClass_softClass;
  uint64_t v12 = getMOApprovedApplicationsManagerClass_softClass;
  if (!getMOApprovedApplicationsManagerClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getMOApprovedApplicationsManagerClass_block_invoke;
    v8[3] = &unk_1E5C5D4D8;
    v8[4] = &v9;
    __getMOApprovedApplicationsManagerClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  v4 = [v3 sharedInstance];
  v5 = [a1 bundleIdentifier];
  uint64_t v6 = [v4 isJournalingSuggestionsAvailableForBundleIdentifier:v5];

  return v6;
}

@end