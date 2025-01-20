@interface SearchUIOpenMediaHandler
- (BOOL)supportsIntentPath;
- (id)actionProvider;
- (id)clientSelectedBundleIdentifier;
- (id)intent;
- (id)mediaMetadata;
@end

@implementation SearchUIOpenMediaHandler

- (id)intent
{
  id v3 = objc_alloc(MEMORY[0x1E4F306A8]);
  v4 = [(SearchUIOpenMediaHandler *)self mediaMetadata];
  v5 = +[SearchUIMediaUtilities mediaSearchForMetadata:v4];
  v6 = (void *)[v3 initWithMediaItems:0 mediaSearch:v5];

  return v6;
}

- (id)mediaMetadata
{
  v2 = [(SearchUICommandHandler *)self command];
  id v3 = [v2 mediaMetadata];

  return v3;
}

- (BOOL)supportsIntentPath
{
  v2 = [(SearchUIOpenMediaHandler *)self clientSelectedBundleIdentifier];
  BOOL v3 = +[SearchUIMediaUtilities bundleIdentifierSupportsOpenIntent:v2];

  return v3;
}

- (id)clientSelectedBundleIdentifier
{
  BOOL v3 = [(SearchUICommandHandler *)self command];
  v4 = [v3 clientSelectedBundleIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIOpenMediaHandler;
    id v6 = [(SearchUIMediaHandler *)&v9 clientSelectedBundleIdentifier];
  }
  v7 = v6;

  return v7;
}

- (id)actionProvider
{
  BOOL v3 = [(SearchUICommandHandler *)self command];
  v4 = [(SearchUICommandHandler *)self environment];
  v5 = [(SearchUICommandHandler *)self rowModel];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SearchUIOpenMediaHandler_actionProvider__block_invoke;
  aBlock[3] = &unk_1E6E73678;
  id v12 = v3;
  id v13 = v5;
  id v14 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = v3;
  objc_super v9 = _Block_copy(aBlock);

  return v9;
}

id __42__SearchUIOpenMediaHandler_actionProvider__block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  BOOL v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  double v5 = v4;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [a1[4] mediaMetadata];
  id v7 = +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:v6];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1E4FB13F0];
        id v13 = [v11 title];
        id v14 = [v11 image];
        v15 = [v14 loadImageWithScale:0 isDarkStyle:v5];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __42__SearchUIOpenMediaHandler_actionProvider__block_invoke_2;
        v24[3] = &unk_1E6E73650;
        v24[4] = v11;
        id v25 = a1[5];
        id v26 = a1[6];
        v16 = [v12 actionWithTitle:v13 image:v15 identifier:0 handler:v24];

        [v2 addObject:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  if ([v2 count])
  {
    v17 = (void *)MEMORY[0x1E4FB1970];
    v18 = [a1[4] mediaMetadata];
    v19 = [v18 disambiguationTitle];
    v20 = [v17 menuWithTitle:v19 children:v2];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __42__SearchUIOpenMediaHandler_actionProvider__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  BOOL v3 = [*(id *)(a1 + 32) command];
  [v2 setCommand:v3];

  double v4 = +[SearchUICommandHandler handlerForButton:v2 rowModel:*(void *)(a1 + 40) environment:*(void *)(a1 + 48)];
  [v4 executeWithTriggerEvent:2];

  double v5 = SearchUITapLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "tapping %@", (uint8_t *)&v6, 0xCu);
  }
}

@end