@interface NUWebContentComponentDeveloperSettingsProvider
- (FCHeadlineProviding)headline;
- (NUWebContentComponentDeveloperSettingsProvider)initWithHeadline:(id)a3;
- (id)developerSettings;
@end

@implementation NUWebContentComponentDeveloperSettingsProvider

- (NUWebContentComponentDeveloperSettingsProvider)initWithHeadline:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUWebContentComponentDeveloperSettingsProvider;
  v6 = [(NUWebContentComponentDeveloperSettingsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_headline, a3);
  }

  return v7;
}

- (id)developerSettings
{
  v3 = [(NUWebContentComponentDeveloperSettingsProvider *)self headline];
  if ([v3 isDraft])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(NUWebContentComponentDeveloperSettingsProvider *)self headline];
    char v4 = [v5 isLocalDraft];
  }
  id v6 = objc_alloc(MEMORY[0x263F6C6D8]);
  if (v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = NFInternalBuild();
  }
  v8 = (void *)[v6 initWithAllowRemoteInspection:v7];

  return v8;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
}

@end