@interface SearchUIOpenFileProviderItemHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (BOOL)openFileURLInPlaceInDefaultApplicationIfPossible:(id)a3;
- (BOOL)supportsCopy;
- (BOOL)supportsShare;
- (NSURL)fileProviderURL;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)defaultSymbolName;
- (id)itemProvider;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)fetchFileProviderURLWithCompletionHandler:(id)a3;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)setFileProviderURL:(id)a3;
@end

@implementation SearchUIOpenFileProviderItemHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [v4 coreSpotlightIdentifier];
  v6 = [v4 fileProviderIdentifier];

  v7 = 0;
  if (v5 && v6)
  {
    v7 = objc_opt_new();
    [v7 setCoreSpotlightIdentifier:v5];
    [v7 setFileProviderIdentifier:v6];
  }

  return v7;
}

- (id)defaultSymbolName
{
  return @"magnifyingglass";
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke;
  v12[3] = &unk_1E6E74640;
  id v13 = v8;
  v14 = self;
  id v15 = v9;
  unint64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SearchUIOpenFileProviderItemHandler *)self fetchFileProviderURLWithCompletionHandler:v12];
}

void __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    char v5 = [v3 startAccessingSecurityScopedResource];
    uint64_t v6 = *MEMORY[0x1E4F1C628];
    uint64_t v7 = *MEMORY[0x1E4F1C658];
    v32[0] = *MEMORY[0x1E4F1C628];
    v32[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v9 = [v4 resourceValuesForKeys:v8 error:0];

    if (v9)
    {
      id v10 = [v9 objectForKeyedSubscript:v6];
      if ([v10 BOOLValue])
      {
        id v11 = [v9 objectForKeyedSubscript:v7];
        char v12 = [v11 BOOLValue] ^ 1;
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
    int v15 = [*(id *)(a1 + 32) shouldRevealFile];
    int v16 = v15;
    if ((v12 & 1) != 0
      || (v15 & 1) != 0
      || ([*(id *)(a1 + 40) openFileURLInPlaceInDefaultApplicationIfPossible:v4] & 1) == 0)
    {
      v17 = +[SearchUIUtilities bundleIdentifierForApp:6];
      if (+[SearchUIUtilities isAppInstalledWithBundleId:v17])
      {
      }
      else
      {
        int v18 = [MEMORY[0x1E4F3A650] canPreviewItem:v4];

        if (v18)
        {
          uint64_t v19 = *(void *)(a1 + 32);
          uint64_t v21 = *(void *)(a1 + 48);
          uint64_t v20 = *(void *)(a1 + 56);
          v30.receiver = *(id *)(a1 + 40);
          v30.super_class = (Class)SearchUIOpenFileProviderItemHandler;
          objc_msgSendSuper2(&v30, sel_performCommand_triggerEvent_environment_, v19, v20, v21);
          goto LABEL_21;
        }
      }
      v22 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
      [v22 setScheme:@"shareddocuments"];
      if (v16)
      {
        v23 = [MEMORY[0x1E4F290C8] queryItemWithName:@"reveal" value:@"true"];
        v31 = v23;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        [v22 setQueryItems:v24];
      }
      v25 = [v22 URL];

      v26 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v25];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_2;
      v27[3] = &unk_1E6E72758;
      char v29 = v5;
      id v4 = v25;
      id v28 = v4;
      +[SearchUIUtilities openPunchout:v26 completion:v27];
    }
  }
  else
  {
    id v13 = SearchUIGeneralLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(v13);
    }

    id v4 = (id)objc_opt_new();
    id v9 = [*(id *)(a1 + 40) rowModel];
    v14 = +[SearchUIOpenPunchoutHandler fallbackCommandForRowModel:v9 environment:*(void *)(a1 + 48)];
    [v4 performCommand:v14 triggerEvent:*(void *)(a1 + 56) environment:*(void *)(a1 + 48)];
  }
LABEL_21:
}

uint64_t __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  char v5 = objc_opt_new();
  [v5 setDataSource:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke;
  v8[3] = &unk_1E6E74668;
  id v6 = v5;
  id v9 = v6;
  [(SearchUIOpenFileProviderItemHandler *)self fetchFileProviderURLWithCompletionHandler:v8];

  return v6;
}

void __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke_2;
  v1[3] = &unk_1E6E72730;
  id v2 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:v1];
}

uint64_t __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  id v3 = [(SearchUIOpenFileProviderItemHandler *)self fileProviderURL];
  int64_t v4 = v3 != 0;

  return v4;
}

- (void)fetchFileProviderURLWithCompletionHandler:(id)a3
{
  int64_t v4 = (void (**)(id, void *))a3;
  char v5 = [(SearchUIOpenFileProviderItemHandler *)self fileProviderURL];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    id v6 = [(SearchUICommandHandler *)self command];
    uint64_t v7 = [v6 coreSpotlightIdentifier];
    id v8 = [v6 fileProviderIdentifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__SearchUIOpenFileProviderItemHandler_fetchFileProviderURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E6E74690;
    v9[4] = self;
    id v10 = v4;
    +[SearchUIUtilities fetchURLForCoreSpotlightIdentifier:v7 fileProviderIdentifier:v8 completionHandler:v9];
  }
}

void __81__SearchUIOpenFileProviderItemHandler_fetchFileProviderURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setFileProviderURL:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)openFileURLInPlaceInDefaultApplicationIfPossible:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F9F2F8] interactionControllerWithURL:v3];
    char v5 = [v4 _defaultApplication];
    int v6 = [v5 supportsOpenInPlace];

    if (v6) {
      [v4 openDocumentWithDefaultApplication];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)supportsShare
{
  return 1;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)itemProvider
{
  id v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke;
  v6[3] = &unk_1E6E74668;
  id v4 = v3;
  id v7 = v4;
  [(SearchUIOpenFileProviderItemHandler *)self fetchFileProviderURLWithCompletionHandler:v6];

  return v4;
}

void __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    char v5 = (void *)MEMORY[0x1E4F442D8];
    int v6 = [v3 pathExtension];
    id v7 = [v5 typeWithFilenameExtension:v6];
    uint64_t v8 = [v7 identifier];
    id v9 = (void *)v8;
    id v10 = &stru_1F40279D8;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    id v11 = v10;

    char v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke_2;
    v13[3] = &unk_1E6E746B8;
    id v14 = v4;
    [v12 registerFileRepresentationForTypeIdentifier:v11 fileOptions:1 visibility:0 loadHandler:v13];
  }
}

uint64_t __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (NSURL)fileProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileProviderURL:(id)a3
{
}

- (void).cxx_destruct
{
}

void __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUIOpenFileProviderItemHandler fetchFileProviderURLWithCompletionHandler returned nil URL", v1, 2u);
}

@end