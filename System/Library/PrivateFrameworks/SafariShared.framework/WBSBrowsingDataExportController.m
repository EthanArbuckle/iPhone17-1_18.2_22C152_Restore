@interface WBSBrowsingDataExportController
+ (NSArray)orderedBrowsingDataExportTypesForDisplay;
+ (NSString)defaultExportFolderName;
+ (NSString)exportDescriptionText;
+ (id)fileURLFromExportFolderURL:(id)a3 profileTitle:(id)a4 forBrowsingDataExportType:(unint64_t)a5;
+ (id)iconForBrowsingDataExportType:(unint64_t)a3;
+ (id)labelForBrowsingDataExportType:(unint64_t)a3 withCount:(unint64_t)a4;
+ (id)titleForBrowsingDataExportType:(unint64_t)a3;
- (NSSet)profileIdentifiersToExportFrom;
- (NSString)exportErrorAlertMessage;
- (NSString)exportErrorAlertTitle;
- (unint64_t)_numberOfBookmarksToBeExported;
- (unint64_t)_numberOfExtensionsToBeExported;
- (unint64_t)selectedBrowsingDataExportTypes;
- (void)_exportToTemporaryFolderWithURL:(id)a3 completionHandler:(id)a4;
- (void)computeNumberOfItemsToBeExportedForBrowsingDataExportType:(unint64_t)a3 usingBlock:(id)a4;
- (void)exportToZipArchiveAtURL:(id)a3 completionHandler:(id)a4;
- (void)setProfileIdentifiersToExportFrom:(id)a3;
- (void)setSelectedBrowsingDataExportTypes:(unint64_t)a3;
@end

@implementation WBSBrowsingDataExportController

+ (NSString)exportDescriptionText
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)defaultExportFolderName
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd"];
  v3 = [MEMORY[0x1E4F1C9C8] now];
  v4 = [v2 stringFromDate:v3];

  v5 = NSString;
  v6 = _WBSLocalizedString();
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);

  return (NSString *)v7;
}

+ (NSArray)orderedBrowsingDataExportTypesForDisplay
{
  return (NSArray *)&unk_1EFC22148;
}

+ (id)iconForBrowsingDataExportType:(unint64_t)a3
{
  id result = 0;
  switch(a3)
  {
    case 1uLL:
      id result = @"book";
      break;
    case 2uLL:
      id result = @"clock";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      id result = @"puzzlepiece.extension";
      break;
    case 8uLL:
      id result = @"creditcard";
      break;
    default:
      if (a3 == 16) {
        id result = @"key";
      }
      else {
        id result = 0;
      }
      break;
  }
  return result;
}

+ (id)titleForBrowsingDataExportType:(unint64_t)a3
{
  v4 = 0;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 8uLL:
      goto LABEL_3;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    default:
      if (a3 == 16)
      {
LABEL_3:
        v4 = _WBSLocalizedString();
      }
      break;
  }
  return v4;
}

+ (id)labelForBrowsingDataExportType:(unint64_t)a3 withCount:(unint64_t)a4
{
  v5 = 0;
  switch(a3)
  {
    case 1uLL:
      v6 = NSString;
      goto LABEL_8;
    case 2uLL:
      v6 = NSString;
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_9;
    case 4uLL:
      v6 = NSString;
      goto LABEL_8;
    case 8uLL:
      v6 = NSString;
      goto LABEL_8;
    default:
      if (a3 != 16) {
        goto LABEL_9;
      }
      v6 = NSString;
LABEL_8:
      v7 = _WBSLocalizedString();
      v5 = objc_msgSend(v6, "localizedStringWithFormat:", v7, a4);

LABEL_9:
      return v5;
  }
}

+ (id)fileURLFromExportFolderURL:(id)a3 profileTitle:(id)a4 forBrowsingDataExportType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  switch(a5)
  {
    case 1uLL:
      v11 = _WBSLocalizedString();
      v12 = [v7 URLByAppendingPathComponent:v11];
      v13 = v12;
      v14 = @"html";
      goto LABEL_11;
    case 2uLL:
      if (!v8) {
        goto LABEL_10;
      }
      v15 = NSString;
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_13;
    case 4uLL:
      if (!v8) {
        goto LABEL_10;
      }
      v15 = NSString;
LABEL_9:
      v11 = _WBSLocalizedString();
      v13 = objc_msgSend(v15, "localizedStringWithFormat:", v11, v9);
      v16 = [v7 URLByAppendingPathComponent:v13];
      v10 = [v16 URLByAppendingPathExtension:@"json"];

      goto LABEL_12;
    case 8uLL:
LABEL_10:
      v11 = _WBSLocalizedString();
      v12 = [v7 URLByAppendingPathComponent:v11];
      v13 = v12;
      v14 = @"json";
      goto LABEL_11;
    default:
      if (a5 != 16) {
        goto LABEL_13;
      }
      v11 = _WBSLocalizedString();
      v12 = [v7 URLByAppendingPathComponent:v11];
      v13 = v12;
      v14 = @"csv";
LABEL_11:
      v10 = [v12 URLByAppendingPathExtension:v14];
LABEL_12:

LABEL_13:
      return v10;
  }
}

- (NSString)exportErrorAlertTitle
{
  return (NSString *)_WBSLocalizedString();
}

- (NSString)exportErrorAlertMessage
{
  return (NSString *)_WBSLocalizedString();
}

- (void)_exportToTemporaryFolderWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  unint64_t selectedBrowsingDataExportTypes = self->_selectedBrowsingDataExportTypes;
  if ((selectedBrowsingDataExportTypes & 2) != 0)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[WBSBrowsingDataExportController _exportToTemporaryFolderWithURL:completionHandler:].cold.5();
    }
    dispatch_group_enter(v8);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke;
    v29[3] = &unk_1E5C8C880;
    v30 = v8;
    [(WBSBrowsingDataExportController *)self _exportHistoryToDirectoryWithURL:v6 completionHandler:v29];

    unint64_t selectedBrowsingDataExportTypes = self->_selectedBrowsingDataExportTypes;
    if ((selectedBrowsingDataExportTypes & 1) == 0)
    {
LABEL_3:
      if ((selectedBrowsingDataExportTypes & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((selectedBrowsingDataExportTypes & 1) == 0)
  {
    goto LABEL_3;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[WBSBrowsingDataExportController _exportToTemporaryFolderWithURL:completionHandler:].cold.4();
  }
  v12 = [(id)objc_opt_class() fileURLFromExportFolderURL:v6 profileTitle:0 forBrowsingDataExportType:1];
  dispatch_group_enter(v8);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_106;
  v27[3] = &unk_1E5C8C880;
  v28 = v8;
  [(WBSBrowsingDataExportController *)self _exportBookmarksToFileWithURL:v12 completionHandler:v27];

  unint64_t selectedBrowsingDataExportTypes = self->_selectedBrowsingDataExportTypes;
  if ((selectedBrowsingDataExportTypes & 0x10) == 0)
  {
LABEL_4:
    if ((selectedBrowsingDataExportTypes & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_13:
  v13 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[WBSBrowsingDataExportController _exportToTemporaryFolderWithURL:completionHandler:]();
  }
  v14 = [(id)objc_opt_class() fileURLFromExportFolderURL:v6 profileTitle:0 forBrowsingDataExportType:16];
  v15 = [MEMORY[0x1E4F97FD0] sharedStore];
  v16 = [v14 path];
  [v15 exportContentsOfAccountStoreToCSVFileWithPath:v16];

  unint64_t selectedBrowsingDataExportTypes = self->_selectedBrowsingDataExportTypes;
  if ((selectedBrowsingDataExportTypes & 4) == 0)
  {
LABEL_5:
    if ((selectedBrowsingDataExportTypes & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
LABEL_16:
  v17 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[WBSBrowsingDataExportController _exportToTemporaryFolderWithURL:completionHandler:]();
  }
  dispatch_group_enter(v8);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_108;
  v25[3] = &unk_1E5C8C880;
  v26 = v8;
  [(WBSBrowsingDataExportController *)self _exportExtensionsToDirectoryWithURL:v6 completionHandler:v25];

  if ((self->_selectedBrowsingDataExportTypes & 8) != 0)
  {
LABEL_19:
    v18 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[WBSBrowsingDataExportController _exportToTemporaryFolderWithURL:completionHandler:]();
    }
    v19 = [(id)objc_opt_class() fileURLFromExportFolderURL:v6 profileTitle:0 forBrowsingDataExportType:8];
    v20 = +[WBSCreditCardDataController creditCardDataController];
    [v20 exportCreditCardDataToFileWithURL:v19];
  }
LABEL_22:
  v21 = dispatch_get_global_queue(25, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_110;
  v23[3] = &unk_1E5C8CDC8;
  id v24 = v7;
  id v22 = v7;
  dispatch_group_notify(v8, v21, v23);
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_106(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_106_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_108(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_108_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_110(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXExport();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_110_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exportToZipArchiveAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C2B8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v33[0] = 0;
  v4 = objc_msgSend(v2, "safari_createTemporaryDirectoryAppropriateForURL:error:", v3, v33);
  id v5 = v33[0];
  if (v4)
  {
    id v29 = v5;
    id v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", v4, 0x100000, 0, &v29);
    id v7 = v29;

    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) URLByDeletingPathExtension];
      id v9 = [v8 lastPathComponent];
      id v25 = v7;
      id v10 = objc_msgSend(v2, "safari_createDirectoryWithUniqueName:relativeToDirectoryFileHandle:error:", v9, v6, &v25);
      id v11 = v25;

      if (v10)
      {
        id v12 = *(void **)(a1 + 40);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_5;
        v16[3] = &unk_1E5C8CC70;
        v13 = &v17;
        id v17 = v2;
        id v14 = &v18;
        id v15 = v10;
        id v18 = v15;
        id v19 = *(id *)(a1 + 32);
        id v20 = v4;
        id v21 = *(id *)(a1 + 48);
        [v12 _exportToTemporaryFolderWithURL:v15 completionHandler:v16];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_4;
        v22[3] = &unk_1E5C8DDF0;
        v13 = &v24;
        id v24 = *(id *)(a1 + 48);
        id v14 = &v23;
        id v23 = v11;
        dispatch_async(MEMORY[0x1E4F14428], v22);
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_3;
      v26[3] = &unk_1E5C8DDF0;
      id v28 = *(id *)(a1 + 48);
      id v11 = v7;
      id v27 = v11;
      dispatch_async(MEMORY[0x1E4F14428], v26);

      id v10 = v28;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C8DDF0;
    id v32 = *(id *)(a1 + 48);
    id v11 = v5;
    id v31 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v6 = v32;
  }
}

uint64_t __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = 0;
  objc_msgSend(v2, "safari_zipContentsFromDirectory:toZipFileURL:error:", v3, v4, &v11);
  id v5 = v11;
  [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 56) error:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_6;
  block[3] = &unk_1E5C8DDF0;
  id v6 = *(id *)(a1 + 64);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__WBSBrowsingDataExportController_exportToZipArchiveAtURL_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)computeNumberOfItemsToBeExportedForBrowsingDataExportType:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke;
  block[3] = &unk_1E5C9C308;
  unint64_t v13 = a3;
  void block[4] = self;
  id v8 = v6;
  id v12 = v8;
  dispatch_async(v7, block);

  if ((a3 & 2) != 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_3;
    v9[3] = &unk_1E5C9C358;
    id v10 = v8;
    [(WBSBrowsingDataExportController *)self _numberOfHistorySitesToBeExportedWithCompletionHandler:v9];
  }
}

void __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    uint64_t v3 = [*(id *)(a1 + 32) _numberOfBookmarksToBeExported];
  }
  else {
    uint64_t v3 = 0;
  }
  if ((v2 & 8) != 0)
  {
    id v7 = +[WBSCreditCardDataController creditCardDataController];
    uint64_t v4 = [v7 numberOfCreditCardsToBeExported];

    if ((v2 & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = 0;
  if ((v2 & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  id v5 = [MEMORY[0x1E4F97FD0] sharedStore];
  uint64_t v6 = [v5 numberOfSavedAccountsToBeExported];

LABEL_9:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_2;
  v9[3] = &unk_1E5C9C2E0;
  BOOL v14 = (v2 & 4) != 0;
  id v8 = *(id *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  char v15 = v2 & 1;
  char v16 = (v2 & 8) >> 3;
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  char v17 = (v2 & 0x10) >> 4;
  uint64_t v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 72)) {
    id result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(result + 40) + 16))(*(void *)(result + 40), 4, [*(id *)(result + 32) _numberOfExtensionsToBeExported]);
  }
  if (*(unsigned char *)(v1 + 73)) {
    id result = (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  if (*(unsigned char *)(v1 + 74)) {
    id result = (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  if (*(unsigned char *)(v1 + 75))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

void __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_4;
  v3[3] = &unk_1E5C9C330;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __104__WBSBrowsingDataExportController_computeNumberOfItemsToBeExportedForBrowsingDataExportType_usingBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 2, *(void *)(a1 + 40));
}

- (unint64_t)_numberOfExtensionsToBeExported
{
  return 0;
}

- (unint64_t)_numberOfBookmarksToBeExported
{
  return 0;
}

- (unint64_t)selectedBrowsingDataExportTypes
{
  return self->_selectedBrowsingDataExportTypes;
}

- (void)setSelectedBrowsingDataExportTypes:(unint64_t)a3
{
  self->_unint64_t selectedBrowsingDataExportTypes = a3;
}

- (NSSet)profileIdentifiersToExportFrom
{
  return self->_profileIdentifiersToExportFrom;
}

- (void)setProfileIdentifiersToExportFrom:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_exportToTemporaryFolderWithURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Exporting Saved Credit Cards", v2, v3, v4, v5, v6);
}

- (void)_exportToTemporaryFolderWithURL:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Exporting Extensions", v2, v3, v4, v5, v6);
}

- (void)_exportToTemporaryFolderWithURL:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Exporting Passwords", v2, v3, v4, v5, v6);
}

- (void)_exportToTemporaryFolderWithURL:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Exporting bookmarks", v2, v3, v4, v5, v6);
}

- (void)_exportToTemporaryFolderWithURL:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Exporting History", v2, v3, v4, v5, v6);
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Finished exporting History", v2, v3, v4, v5, v6);
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_106_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Finished exporting bookmarks", v2, v3, v4, v5, v6);
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_108_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Finished exporting Extensions", v2, v3, v4, v5, v6);
}

void __85__WBSBrowsingDataExportController__exportToTemporaryFolderWithURL_completionHandler___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "Finished Export", v2, v3, v4, v5, v6);
}

@end