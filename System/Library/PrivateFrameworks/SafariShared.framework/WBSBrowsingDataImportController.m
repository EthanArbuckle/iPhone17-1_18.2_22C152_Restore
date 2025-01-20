@interface WBSBrowsingDataImportController
+ (NSArray)allowedImportContentTypes;
+ (NSString)suggestedImportedBookmarksFolderName;
+ (id)localizedDescriptionOfTheNumberOfItems:(unint64_t)a3 exportType:(id)a4;
+ (id)localizedStringForExtensionsConflictViewWithNumberOfFailedExtensionsFailedToImport:(unint64_t)a3 appsCount:(unint64_t)a4;
+ (id)localizedStringForNumberOfItemsToBeImported:(id)a3;
+ (id)localizedStringForPasswordsConflictViewWithNumberOfPasswordsFailedToImport:(unint64_t)a3;
+ (id)localizedSuccessStringForImportedItems:(id)a3;
+ (id)uniqueImportedBookmarksFolderNameWithSuggestedName:(id)a3 existingFolderNames:(id)a4;
+ (int64_t)importedDataClassificationFromImportedItems:(id)a3;
- (NSString)importErrorAlertTitle;
- (NSString)selectedProfileIdentifierToImportInto;
- (id)importErrorAlertMessageForFailureReason:(int64_t)a3 filename:(id)a4;
- (void)_computeNumberOfBookmarksToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_computeNumberOfChromeExtensionsToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_computeNumberOfChromeHistorySitesToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_computeNumberOfCreditCardsToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_computeNumberOfExtensionsToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_computeNumberOfHistorySitesToBeImportedFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importBookmarksFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importChromeExtensionsFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importChromeHistoryFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importCreditCardsFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importExtensionsFromURL:(id)a3 completionHandler:(id)a4;
- (void)_importHistoryFromURL:(id)a3 completionHandler:(id)a4;
- (void)_removeTemporaryUnzippedDirectoryURLs:(id)a3 sandboxExtensionHandles:(id)a4;
- (void)_scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5;
- (void)computeNumberOfItemsToBeImportedFromFiles:(id)a3 withCompletionHandler:(id)a4;
- (void)importBrowsingDataFromFiles:(id)a3 withCompletionHandler:(id)a4;
- (void)scanImportURLs:(id)a3 completionHandler:(id)a4;
- (void)setSelectedProfileIdentifierToImportInto:(id)a3;
@end

@implementation WBSBrowsingDataImportController

+ (NSString)suggestedImportedBookmarksFolderName
{
  CFLocaleRef v2 = CFLocaleCopyCurrent();
  v3 = CFDateFormatterCreate(0, v2, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  CFRelease(v2);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v5 = CFDateCreate(0, Current);
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v3, v5);
  CFRelease(v5);
  CFRelease(v3);
  v7 = NSString;
  v8 = _WBSLocalizedString();
  v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, StringWithDate);

  return (NSString *)v9;
}

+ (id)uniqueImportedBookmarksFolderNameWithSuggestedName:(id)a3 existingFolderNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if ([v6 containsObject:v7])
  {
    uint64_t v9 = 2;
    v10 = v7;
    do
    {
      uint64_t v11 = v9 + 1;
      v8 = [NSString stringWithFormat:@"%@ %lu", v7, v9];

      char v12 = [v6 containsObject:v8];
      v10 = v8;
      uint64_t v9 = v11;
    }
    while ((v12 & 1) != 0);
  }

  return v8;
}

+ (NSArray)allowedImportContentTypes
{
  v9[10] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F44558];
  v9[0] = *MEMORY[0x1E4F443C8];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F44548];
  v9[2] = *MEMORY[0x1E4F44470];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F44488];
  v9[4] = *MEMORY[0x1E4F443F0];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F44360];
  v9[6] = *MEMORY[0x1E4F44418];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F443D8];
  v9[8] = *MEMORY[0x1E4F444E8];
  v9[9] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:10];
  return (NSArray *)v7;
}

+ (id)localizedDescriptionOfTheNumberOfItems:(unint64_t)a3 exportType:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F98070]])
    {
      id v7 = NSString;
LABEL_10:
      v8 = _WBSLocalizedString();
      a3 = objc_msgSend(v7, "localizedStringWithFormat:", v8, a3);

      goto LABEL_11;
    }
    if (([v6 isEqualToString:*MEMORY[0x1E4F980F8]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F98080]])
    {
      id v7 = NSString;
      goto LABEL_10;
    }
    if (([v6 isEqualToString:*MEMORY[0x1E4F980F0]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F98078]])
    {
      id v7 = NSString;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F980C0]])
    {
      id v7 = NSString;
      goto LABEL_10;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F98150]])
    {
      id v7 = NSString;
      goto LABEL_10;
    }
    a3 = 0;
  }
LABEL_11:

  return (id)a3;
}

+ (id)localizedSuccessStringForImportedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = *MEMORY[0x1E4F98080];
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F98080]];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = *MEMORY[0x1E4F980F8];
      uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F980F8]];

      if (v11)
      {
        char v12 = [v6 objectForKeyedSubscript:v10];
        v13 = [v6 objectForKeyedSubscript:v7];
        objc_msgSend(v12, "setNumberOfItemsSuccessfullyImported:", objc_msgSend(v12, "numberOfItemsSuccessfullyImported")+ objc_msgSend(v13, "numberOfItemsSuccessfullyImported"));

        v14 = [v6 objectForKeyedSubscript:v10];
        v15 = [v6 objectForKeyedSubscript:v7];
        objc_msgSend(v14, "setNumberOfItemsFailedToImport:", objc_msgSend(v14, "numberOfItemsFailedToImport") + objc_msgSend(v15, "numberOfItemsFailedToImport"));

        [v6 setObject:0 forKeyedSubscript:v7];
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__WBSBrowsingDataImportController_localizedSuccessStringForImportedItems___block_invoke;
    v22[3] = &unk_1E5C9C380;
    id v16 = v5;
    id v23 = v16;
    id v24 = a1;
    [v6 enumerateKeysAndObjectsUsingBlock:v22];
    if ([v16 count])
    {
      v17 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v16];
      v18 = NSString;
      v19 = _WBSLocalizedString();
      v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __74__WBSBrowsingDataImportController_localizedSuccessStringForImportedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 numberOfItemsSuccessfullyImported])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "localizedDescriptionOfTheNumberOfItems:exportType:", objc_msgSend(v5, "numberOfItemsSuccessfullyImported"), v8);
    [v6 addObject:v7];
  }
}

+ (id)localizedStringForNumberOfItemsToBeImported:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = *MEMORY[0x1E4F98080];
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F98080]];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = *MEMORY[0x1E4F980F8];
      uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F980F8]];

      if (v11)
      {
        char v12 = NSNumber;
        v13 = [v6 objectForKeyedSubscript:v10];
        uint64_t v14 = [v13 unsignedIntegerValue];
        v15 = [v6 objectForKeyedSubscript:v7];
        id v16 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v14);
        [v6 setObject:v16 forKeyedSubscript:v10];

        [v6 setObject:0 forKeyedSubscript:v7];
      }
    }
    uint64_t v17 = *MEMORY[0x1E4F98078];
    uint64_t v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F98078]];
    if (v18)
    {
      v19 = (void *)v18;
      uint64_t v20 = *MEMORY[0x1E4F980F0];
      v21 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F980F0]];

      if (v21)
      {
        v22 = NSNumber;
        id v23 = [v6 objectForKeyedSubscript:v20];
        uint64_t v24 = [v23 unsignedIntegerValue];
        v25 = [v6 objectForKeyedSubscript:v17];
        v26 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + v24);
        [v6 setObject:v26 forKeyedSubscript:v20];

        [v6 setObject:0 forKeyedSubscript:v17];
      }
    }
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __79__WBSBrowsingDataImportController_localizedStringForNumberOfItemsToBeImported___block_invoke;
    v33 = &unk_1E5C9C3A8;
    id v27 = v5;
    id v34 = v27;
    id v35 = a1;
    [v6 enumerateKeysAndObjectsUsingBlock:&v30];
    if (objc_msgSend(v27, "count", v30, v31, v32, v33))
    {
      v28 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v27];
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __79__WBSBrowsingDataImportController_localizedStringForNumberOfItemsToBeImported___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 unsignedIntegerValue])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "localizedDescriptionOfTheNumberOfItems:exportType:", objc_msgSend(v5, "unsignedIntegerValue"), v8);
    [v6 addObject:v7];
  }
}

+ (id)localizedStringForPasswordsConflictViewWithNumberOfPasswordsFailedToImport:(unint64_t)a3
{
  id v4 = NSString;
  id v5 = _WBSLocalizedString();
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

+ (id)localizedStringForExtensionsConflictViewWithNumberOfFailedExtensionsFailedToImport:(unint64_t)a3 appsCount:(unint64_t)a4
{
  id v5 = NSString;
  uint64_t v6 = _WBSLocalizedString();
  uint64_t v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);

  return v7;
}

+ (int64_t)importedDataClassificationFromImportedItems:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F98150]];

  if (v4)
  {
    if ((unint64_t)[v3 count] <= 1) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 2;
    }
  }

  return v4;
}

- (NSString)importErrorAlertTitle
{
  return (NSString *)_WBSLocalizedString();
}

- (id)importErrorAlertMessageForFailureReason:(int64_t)a3 filename:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = NSString;
  }
  else
  {
    uint64_t v7 = NSString;
  }
  id v8 = _WBSLocalizedString();
  int64_t v4 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);

LABEL_6:
  return v4;
}

- (void)_scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28798];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:14 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v8, 0, v9);
}

- (void)scanImportURLs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_61);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_80;
  v10[3] = &unk_1E5C9C420;
  id v11 = v6;
  id v9 = v6;
  [(WBSBrowsingDataImportController *)self _scanImportURLs:v7 sandboxExtensions:v8 completionHandler:v10];
}

id __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 path];
  [v3 fileSystemRepresentation];
  int64_t v4 = (const char *)sandbox_extension_issue_file();

  if (v4)
  {
    id v5 = (void *)[[NSString alloc] initWithBytesNoCopy:v4 length:strlen(v4) encoding:4 freeWhenDone:1];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_cold_1((uint64_t)v2, v6);
    }
    id v5 = 0;
  }

  return v5;
}

void __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5C9C3D0;
  id v9 = v7;
  id v23 = v9;
  id v10 = v8;
  id v24 = v10;
  [v5 enumerateKeysAndObjectsUsingBlock:v22];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_3;
  block[3] = &unk_1E5C9C3F8;
  id v11 = *(id *)(a1 + 32);
  id v20 = v6;
  id v21 = v11;
  id v17 = v5;
  id v18 = v9;
  id v19 = v10;
  id v12 = v6;
  id v13 = v10;
  id v14 = v9;
  id v15 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  int64_t v4 = objc_msgSend(v9, "safari_URLForKey:", *MEMORY[0x1E4F98108]);
  if (v4)
  {
    objc_msgSend(v9, "safari_stringForKey:", *MEMORY[0x1E4F98100]);
    id v5 = objc_claimAutoreleasedReturnValue();
    [v5 UTF8String];
    uint64_t v6 = sandbox_extension_consume();
    [*(id *)(a1 + 32) addObject:v4];
    id v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithLongLong:v6];
    [v7 addObject:v8];
  }
}

uint64_t __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)_importChromeExtensionsFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_importHistoryFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_importBookmarksFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_importExtensionsFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_importCreditCardsFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_importChromeHistoryFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)importBrowsingDataFromFiles:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E5C9C510;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WBSBrowsingDataImportController *)self scanImportURLs:a3 completionHandler:v8];
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_cold_1(v13);
    }
    id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if ([v9 count])
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dispatch_group_t v16 = dispatch_group_create();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_86;
      v28[3] = &unk_1E5C9C4C0;
      uint64_t v17 = *(void *)(a1 + 32);
      dispatch_group_t v29 = v16;
      uint64_t v30 = v17;
      id v18 = v15;
      id v31 = v18;
      id v19 = v16;
      [v9 enumerateKeysAndObjectsUsingBlock:v28];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_105;
      v23[3] = &unk_1E5C9C4E8;
      v23[4] = *(void *)(a1 + 32);
      id v24 = v10;
      id v25 = v11;
      id v20 = *(id *)(a1 + 40);
      id v26 = v18;
      id v27 = v20;
      id v21 = v18;
      dispatch_group_notify(v19, MEMORY[0x1E4F14428], v23);

      goto LABEL_8;
    }
    v22 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_INFO, "Didn't find any importable files.", buf, 2u);
    }
    id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v14();
LABEL_8:
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(a3, "safari_stringForKey:", *MEMORY[0x1E4F980E8]);
  if ([v6 isEqualToString:*MEMORY[0x1E4F98078]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2;
    v41[3] = &unk_1E5C9C470;
    id v7 = *(void **)(a1 + 40);
    v42 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v43 = v6;
    id v44 = *(id *)(a1 + 32);
    [v7 _importChromeExtensionsFromURL:v5 completionHandler:v41];

    id v8 = v42;
LABEL_15:

    goto LABEL_16;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F980F8]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_90;
    v37[3] = &unk_1E5C9C470;
    id v9 = *(void **)(a1 + 40);
    v38 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v39 = v6;
    id v40 = *(id *)(a1 + 32);
    [v9 _importHistoryFromURL:v5 completionHandler:v37];

    id v8 = v38;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98070]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_92;
    v33[3] = &unk_1E5C9C470;
    id v10 = *(void **)(a1 + 40);
    id v34 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v35 = v6;
    id v36 = *(id *)(a1 + 32);
    [v10 _importBookmarksFromURL:v5 completionHandler:v33];

    id v8 = v34;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F980F0]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_94;
    v29[3] = &unk_1E5C9C470;
    id v11 = *(void **)(a1 + 40);
    uint64_t v30 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v31 = v6;
    id v32 = *(id *)(a1 + 32);
    [v11 _importExtensionsFromURL:v5 completionHandler:v29];

    id v8 = v30;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F980C0]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_96;
    v25[3] = &unk_1E5C9C470;
    id v12 = *(void **)(a1 + 40);
    id v26 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v27 = v6;
    id v28 = *(id *)(a1 + 32);
    [v12 _importCreditCardsFromURL:v5 completionHandler:v25];

    id v8 = v26;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98150]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v13 = objc_alloc_init(WBSPasswordsDataImporter);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_99;
    block[3] = &unk_1E5C8CD70;
    id v20 = v13;
    id v21 = v5;
    id v22 = *(id *)(a1 + 48);
    id v23 = v6;
    id v24 = *(id *)(a1 + 32);
    id v8 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98080]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_103;
    v15[3] = &unk_1E5C9C470;
    id v14 = *(void **)(a1 + 40);
    dispatch_group_t v16 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v17 = v6;
    id v18 = *(id *)(a1 + 32);
    [v14 _importChromeHistoryFromURL:v5 completionHandler:v15];

    id v8 = v16;
    goto LABEL_15;
  }
LABEL_16:
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      id v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_88;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_88(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_90(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_90_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      id v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_91;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_91(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_92(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_92_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      id v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_93;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_93(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_94(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_94_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      id v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_95;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_95(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_96(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_96_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      id v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_97;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_97(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_99(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E5C9C498;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 importFromCSVWithFileURL:v3 progressHandler:v4];
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_3(id *a1, uint64_t a2, long long *a3, void *a4)
{
  id v7 = a4;
  id v8 = v7;
  if (a2 == 3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3254779904;
    v14[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_100;
    v14[3] = &unk_1EFBE22A8;
    long long v19 = *a3;
    id v13 = (void *)*((void *)a3 + 3);
    uint64_t v20 = *((void *)a3 + 2);
    id v10 = &v21;
    id v21 = v13;
    id v9 = &v22;
    id v22 = *((id *)a3 + 4);
    id v11 = &v15;
    id v15 = v8;
    id v12 = &v16;
    id v16 = a1[4];
    id v17 = a1[5];
    id v18 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], v14);

    goto LABEL_5;
  }
  if (a2 == 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5C9C448;
    id v9 = &v24;
    id v24 = v7;
    id v10 = &v25;
    id v25 = a1[4];
    id v11 = &v26;
    id v26 = a1[5];
    id v12 = &v27;
    id v27 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_5:
  }
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXImport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_4_cold_1(a1, v2);
  }
  uint64_t v3 = [WBSBrowsingDataImportData alloc];
  int64_t v4 = [*(id *)(a1 + 32) localizedDescription];
  id v5 = [(WBSBrowsingDataImportData *)v3 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v4];

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v7 = [(WBSBrowsingDataImportData *)v5 combine:v6];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_100(uint64_t a1)
{
  id v2 = [WBSBrowsingDataImportData alloc];
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = [*(id *)(a1 + 88) count];
  uint64_t v5 = [*(id *)(a1 + 96) count] + v4;
  id v6 = [*(id *)(a1 + 32) localizedDescription];
  id v9 = [(WBSBrowsingDataImportData *)v2 initWithNumberOfItemsSuccessfullyImported:v3 numberOfItemsFailedToImport:v5 errorMessage:v6];

  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  id v8 = [(WBSBrowsingDataImportData *)v9 combine:v7];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:*(void *)(a1 + 48)];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_103(id *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_90_cold_1(v7);
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      id v8 = [WBSBrowsingDataImportData alloc];
      id v9 = [v6 localizedDescription];
      uint64_t v5 = [(WBSBrowsingDataImportData *)v8 initWithNumberOfItemsSuccessfullyImported:0 numberOfItemsFailedToImport:0 errorMessage:v9];
    }
  }
LABEL_5:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_104;
  v11[3] = &unk_1E5C9C448;
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v5;
  id v15 = a1[6];
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_104(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 combine:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v5 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v5);
}

uint64_t __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_105(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeTemporaryUnzippedDirectoryURLs:*(void *)(a1 + 40) sandboxExtensionHandles:*(void *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)_computeNumberOfHistorySitesToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_computeNumberOfChromeHistorySitesToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_computeNumberOfExtensionsToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_computeNumberOfBookmarksToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_computeNumberOfCreditCardsToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)_computeNumberOfChromeExtensionsToBeImportedFromURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:14 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v7, 0, v8);
}

- (void)computeNumberOfItemsToBeImportedFromFiles:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E5C9C510;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WBSBrowsingDataImportController *)self scanImportURLs:a3 completionHandler:v8];
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_cold_1(v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dispatch_group_t v15 = dispatch_group_create();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_107;
    v26[3] = &unk_1E5C9C4C0;
    uint64_t v16 = *(void *)(a1 + 32);
    dispatch_group_t v27 = v15;
    uint64_t v28 = v16;
    id v17 = v14;
    id v29 = v17;
    id v18 = v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v26];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_122;
    v21[3] = &unk_1E5C9C4E8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = v10;
    id v23 = v11;
    id v19 = *(id *)(a1 + 40);
    id v24 = v17;
    id v25 = v19;
    id v20 = v17;
    dispatch_group_notify(v18, MEMORY[0x1E4F14428], v21);
  }
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(a3, "safari_stringForKey:", *MEMORY[0x1E4F980E8]);
  if ([v6 isEqualToString:*MEMORY[0x1E4F980F8]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2;
    v41[3] = &unk_1E5C9C560;
    id v7 = *(void **)(a1 + 40);
    v42 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v43 = v6;
    id v44 = *(id *)(a1 + 32);
    [v7 _computeNumberOfHistorySitesToBeImportedFromURL:v5 completionHandler:v41];

    id v8 = v42;
LABEL_15:

    goto LABEL_16;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98070]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_110;
    v37[3] = &unk_1E5C9C560;
    id v9 = *(void **)(a1 + 40);
    v38 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v39 = v6;
    id v40 = *(id *)(a1 + 32);
    [v9 _computeNumberOfBookmarksToBeImportedFromURL:v5 completionHandler:v37];

    id v8 = v38;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F980F0]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_112;
    v33[3] = &unk_1E5C9C560;
    id v10 = *(void **)(a1 + 40);
    id v34 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v35 = v6;
    id v36 = *(id *)(a1 + 32);
    [v10 _computeNumberOfExtensionsToBeImportedFromURL:v5 completionHandler:v33];

    id v8 = v34;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F980C0]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_114;
    v29[3] = &unk_1E5C9C560;
    id v11 = *(void **)(a1 + 40);
    uint64_t v30 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v31 = v6;
    id v32 = *(id *)(a1 + 32);
    [v11 _computeNumberOfCreditCardsToBeImportedFromURL:v5 completionHandler:v29];

    id v8 = v30;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98078]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_116;
    v25[3] = &unk_1E5C9C560;
    id v12 = *(void **)(a1 + 40);
    id v26 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v27 = v6;
    id v28 = *(id *)(a1 + 32);
    [v12 _computeNumberOfChromeExtensionsToBeImportedFromURL:v5 completionHandler:v25];

    id v8 = v26;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98150]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v13 = objc_alloc_init(WBSPasswordsDataImporter);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_118;
    block[3] = &unk_1E5C8CD70;
    id v20 = v13;
    id v21 = v5;
    id v22 = *(id *)(a1 + 48);
    id v23 = v6;
    id v24 = *(id *)(a1 + 32);
    id v8 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F98080]])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_120;
    v15[3] = &unk_1E5C9C560;
    id v14 = *(void **)(a1 + 40);
    uint64_t v16 = (WBSPasswordsDataImporter *)*(id *)(a1 + 48);
    id v17 = v6;
    id v18 = *(id *)(a1 + 32);
    [v14 _computeNumberOfChromeHistorySitesToBeImportedFromURL:v5 completionHandler:v15];

    id v8 = v16;
    goto LABEL_15;
  }
LABEL_16:
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_108;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_108(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_110(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_110_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_111;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_111(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_112(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_112_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_113;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_113(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_114(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_115;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_115(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_116(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_116_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_117;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_117(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_118(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E5C9C560;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 computeNumberOfCredentialsToBeImportedFromCSVWithFileURL:v3 completionHandler:v4];
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_3_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_119;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_119(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_120(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_cold_1(v6);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_121;
  v7[3] = &unk_1E5C9C538;
  id v8 = a1[4];
  id v9 = a1[5];
  uint64_t v11 = a2;
  id v10 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_121(uint64_t a1)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", *(void *)(a1 + 56) + objc_msgSend(v3, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v5);
}

uint64_t __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_122(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeTemporaryUnzippedDirectoryURLs:*(void *)(a1 + 40) sandboxExtensionHandles:*(void *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (void)_removeTemporaryUnzippedDirectoryURLs:(id)a3 sandboxExtensionHandles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__WBSBrowsingDataImportController__removeTemporaryUnzippedDirectoryURLs_sandboxExtensionHandles___block_invoke;
  v10[3] = &unk_1E5C8C920;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __97__WBSBrowsingDataImportController__removeTemporaryUnzippedDirectoryURLs_sandboxExtensionHandles___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v8 removeItemAtURL:v7 error:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13), "longLongValue", (void)v14);
        sandbox_extension_release();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (NSString)selectedProfileIdentifierToImportInto
{
  return self->_selectedProfileIdentifierToImportInto;
}

- (void)setSelectedProfileIdentifierToImportInto:(id)a3
{
}

- (void).cxx_destruct
{
}

void __68__WBSBrowsingDataImportController_scanImportURLs_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  int v4 = *__error();
  int v5 = 138478083;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Can't issue extension to %{private}@: %{errno}i", (uint8_t *)&v5, 0x12u);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to scan import URLs: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to import chrome extensions: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_90_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to import history: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_92_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to import bookmarks: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_94_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to import extensions: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_2_96_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to import credit cards: %{public}@", v6, v7, v8, v9, v10);
}

void __85__WBSBrowsingDataImportController_importBrowsingDataFromFiles_withCompletionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to import passwords: %{public}@", v7, v8, v9, v10, v11);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to compute the number of history sites to be imported: %{public}@", v6, v7, v8, v9, v10);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_110_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to compute the number of bookmarks to be imported: %{public}@", v6, v7, v8, v9, v10);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_112_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to compute the number of extensions to be imported: %{public}@", v6, v7, v8, v9, v10);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_2_116_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to compute the number of Chrome extensions to be imported: %{public}@", v6, v7, v8, v9, v10);
}

void __99__WBSBrowsingDataImportController_computeNumberOfItemsToBeImportedFromFiles_withCompletionHandler___block_invoke_3_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to compute the number of passwords to be imported: %{public}@", v6, v7, v8, v9, v10);
}

@end