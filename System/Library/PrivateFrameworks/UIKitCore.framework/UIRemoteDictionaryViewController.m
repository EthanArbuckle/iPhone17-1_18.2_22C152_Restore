@interface UIRemoteDictionaryViewController
@end

@implementation UIRemoteDictionaryViewController

void __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke_2;
  v2[3] = &unk_1E52D9FC0;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  [(id)UIApp _endShowingNetworkActivityIndicator];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1032) _allAvailableDefinitionDictionaries];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 1024);
    *(void *)(v3 + 1024) = v2;

    id v5 = [*(id *)(a1 + 32) tableView];
    [v5 reloadData];
  }
}

void __59___UIRemoteDictionaryViewController__handleDownloadButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) rawAsset];
  [v2 refreshState];

  id v3 = [*(id *)(a1 + 40) tableView];
  [v3 reloadData];
}

void __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke_2;
  block[3] = &unk_1E52DAD48;
  uint64_t v11 = a2;
  id v7 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 56);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    NSLog(&cfstr_Uiremotedictio.isa, *(void *)(a1 + 40), v2);
LABEL_7:
    [*(id *)(*(void *)(a1 + 48) + 1040) removeObjectForKey:*(void *)(a1 + 56)];
    v6 = [*(id *)(a1 + 48) tableView];
    [v6 reloadData];

    return;
  }
  [*(id *)(a1 + 32) refreshState];
  [*(id *)(a1 + 40) updateAsset];
  [*(id *)(a1 + 40) setActivated:1];
  id v3 = [*(id *)(a1 + 32) attributes];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v4 = (void (*)(void *))getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr;
  v12 = getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr;
  if (!getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr)
  {
    id v5 = DictionaryServicesLibrary();
    v10[3] = (uint64_t)dlsym(v5, "DCSDictionaryAssetAttributesDownloaded");
    getDCSDictionaryAssetAttributesDownloadedSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v4 = (void (*)(void *))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v4)
  {
    v4(v3);

    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  id v8 = [NSString stringWithUTF8String:"void _DCSDictionaryAssetAttributesDownloaded(CFDictionaryRef)"];
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"UIReferenceLibraryViewController.m", 48, @"%s", dlerror());

  __break(1u);
}

void __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) rawAsset];
  [v2 refreshState];

  id v3 = [*(id *)(a1 + 40) tableView];
  [v3 reloadData];
}

void __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = (float)[v3 totalWritten];
  double v5 = (float)(v4 / (float)[v3 totalExpected]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  block[3] = &unk_1E52DA070;
  id v6 = *(id *)(a1 + 32);
  double v11 = v5;
  id v9 = v6;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgress:1 animated:*(double *)(a1 + 48)];
  uint64_t result = [*(id *)(a1 + 40) isStalled];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setIndeterminate:1];
  }
  return result;
}

void __84___UIRemoteDictionaryViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) rawAsset];
  id v3 = [v2 attributes];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  float v4 = (void (*)(void *))getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr;
  v16 = getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr;
  if (!getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr)
  {
    double v5 = DictionaryServicesLibrary();
    v14[3] = (uint64_t)dlsym(v5, "DCSDictionaryAssetAttributesWillBePurged");
    getDCSDictionaryAssetAttributesWillBePurgedSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    float v4 = (void (*)(void *))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v4)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"void _DCSDictionaryAssetAttributesWillBePurged(CFDictionaryRef)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"UIReferenceLibraryViewController.m", 49, @"%s", dlerror());

    __break(1u);
  }
  v4(v3);

  id v6 = [*(id *)(a1 + 32) rawAsset];
  BOOL v7 = [v6 purgeSync] == 0;

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) rawAsset];
    [v8 refreshState];

    id v9 = *(void **)(a1 + 40);
    v17[0] = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v9 reloadRowsAtIndexPaths:v10 withRowAnimation:100];
  }
}

@end