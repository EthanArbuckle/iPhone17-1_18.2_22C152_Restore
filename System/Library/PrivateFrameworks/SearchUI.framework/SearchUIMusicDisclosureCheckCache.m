@interface SearchUIMusicDisclosureCheckCache
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIMusicDisclosureCheckCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a4;
  v5 = +[SearchUIUtilities bundleIdentifierForApp:11];
  BOOL v6 = +[SearchUIUtilities isAppInstalledWithBundleId:v5];

  if (v6)
  {
    v7 = [MEMORY[0x1E4FB86E8] sharedPrivacyInfo];
    int v8 = [v7 preflightDisclosureRequiredForMusic];
    int v9 = v8 | [v7 privacyAcknowledgementRequiredForMusic];
    uint64_t v10 = v9 ^ 1u;
    v11 = SearchUIGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = @"YES";
      if (v9) {
        v12 = @"NO";
      }
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1E45B5000, v11, OS_LOG_TYPE_DEFAULT, "Disclosure approved by user: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v13 = [NSNumber numberWithBool:v10];
  v4[2](v4, v13);
}

@end