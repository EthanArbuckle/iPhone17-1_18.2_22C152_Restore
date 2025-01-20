@interface WBSCyclerTestSuiteBookmarkAuxiliary
- (BOOL)hasPerformedOperation:(int64_t)a3;
- (WBSCyclerTestSuiteBookmarkAuxiliary)init;
- (float)operationBackoffRatio;
- (id)_attributeStringForBookmark:(id)a3 multiline:(BOOL)a4;
- (id)_descriptionForBookmark:(id)a3;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (id)_expandedDescriptionForBookmark:(id)a3;
- (id)_formattedStringForBookmark:(id)a3 indentationLevel:(unint64_t)a4;
- (id)validateBookmarks:(id)a3 expectingBookmarks:(id)a4 context:(id)a5;
- (void)_attemptCloudKitMigrationWithCompletionHandler:(id)a3;
- (void)_attemptInitialClearWithTarget:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)_attemptResetToDAVModeWithCompletionHandler:(id)a3;
- (void)_attemptToClearDataWithOptions:(id)a3 completionHandler:(id)a4;
- (void)_attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3;
- (void)fetchAndValidateBookmarksWithExpectedBookmarks:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performOperation:(int64_t)a3 withTarget:(id)a4 completionHandler:(id)a5;
- (void)performOperation:(int64_t)a3 withTarget:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)resetOperation:(int64_t)a3;
@end

@implementation WBSCyclerTestSuiteBookmarkAuxiliary

- (WBSCyclerTestSuiteBookmarkAuxiliary)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSCyclerTestSuiteBookmarkAuxiliary;
  v2 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_operationBackoffRatio = 2.0;
    v4 = v2;
  }

  return v3;
}

- (void)fetchAndValidateBookmarksWithExpectedBookmarks:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 testTarget];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__WBSCyclerTestSuiteBookmarkAuxiliary_fetchAndValidateBookmarksWithExpectedBookmarks_context_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9A988;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [v11 fetchTopLevelBookmarkList:v15];
}

void __112__WBSCyclerTestSuiteBookmarkAuxiliary_fetchAndValidateBookmarksWithExpectedBookmarks_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) validateBookmarks:a2 expectingBookmarks:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)validateBookmarks:(id)a3 expectingBookmarks:(id)a4 context:(id)a5
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 filterOutItemsWithoutTitlePrefixInList:a4];
  id v10 = [v7 filterOutItemsWithoutTitlePrefixInList:v8];

  v11 = [v9 title];
  id v12 = [v10 title];
  if (![v11 length] && !objc_msgSend(v12, "length"))
  {
    [v9 setTitle:0];
    [v10 setTitle:0];
  }
  id v13 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _formattedStringForBookmark:v9 indentationLevel:0];
  id v14 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _formattedStringForBookmark:v10 indentationLevel:0];
  v15 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:].cold.4();
  }
  id v16 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:]();
  }
  if ([v10 isEquivalent:v9])
  {
    id v17 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:]();
    }
    id v18 = [v9 pairsOfItemsWithDifferingExtraAttributesComparedTo:v10];
    if ([v18 count])
    {
      v46 = v14;
      v47 = v11;
      v51 = v13;
      v53 = v12;
      v48 = v10;
      v49 = v9;
      id v50 = v7;
      v57 = [MEMORY[0x1E4F1CA48] array];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v18 = v18;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v56 = *(void *)v62;
        id obj = v18;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v62 != v56) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v61 + 1) + 8 * v21);
            id v59 = 0;
            id v60 = 0;
            [v22 getFirst:&v60 second:&v59];
            id v23 = v60;
            id v24 = v59;
            v25 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _expandedDescriptionForBookmark:v23];
            v26 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _expandedDescriptionForBookmark:v24];
            v27 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v25;
              _os_log_debug_impl(&dword_1A6B5F000, v27, OS_LOG_TYPE_DEBUG, "Expected bookmark attributes: %{public}@", buf, 0xCu);
            }
            v28 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v26;
              _os_log_debug_impl(&dword_1A6B5F000, v28, OS_LOG_TYPE_DEBUG, "Actual bookmark attributes: %{public}@", buf, 0xCu);
            }
            v29 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            v30 = [v25 componentsSeparatedByCharactersInSet:v29];

            v31 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            v32 = [v26 componentsSeparatedByCharactersInSet:v31];

            v33 = objc_msgSend(v30, "safari_diffWithArray:", v32);
            v34 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v33;
              _os_log_error_impl(&dword_1A6B5F000, v34, OS_LOG_TYPE_ERROR, "Expected and actual attributes don't match: %{public}@", buf, 0xCu);
            }
            [v57 addObject:v33];

            ++v21;
          }
          while (v20 != v21);
          id v18 = obj;
          uint64_t v20 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v20);
      }

      v65 = @"ExpectedAttributesVersusActualAttributes";
      v66 = v57;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      v36 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _errorWithCode:0 userInfo:v35];

      id v9 = v49;
      id v7 = v50;
      v11 = v47;
      id v10 = v48;
      id v13 = v51;
      id v12 = v53;
      id v14 = v46;
    }
    else
    {
      v44 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:]();
      }
      v36 = 0;
    }
  }
  else
  {
    v54 = v12;
    v37 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v18 = [v13 componentsSeparatedByCharactersInSet:v37];

    v38 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v39 = [v14 componentsSeparatedByCharactersInSet:v38];

    v70 = @"ExpectedStateVersusActualState";
    objc_msgSend(v18, "safari_diffWithArray:", v39);
    v40 = v52 = v13;
    v71[0] = v40;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    v41 = v11;
    v43 = v42 = v14;
    v36 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _errorWithCode:0 userInfo:v43];

    id v14 = v42;
    v11 = v41;

    id v13 = v52;
    id v12 = v54;
  }

  return v36;
}

- (BOOL)hasPerformedOperation:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return [*((id *)&self->_initialClearOperation + a3) isFinished];
  }
}

- (void)performOperation:(int64_t)a3 withTarget:(id)a4 completionHandler:(id)a5
{
}

- (void)performOperation:(int64_t)a3 withTarget:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v12 = a4;
  id v10 = a5;
  id v11 = a6;
  switch(a3)
  {
    case 0:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attemptInitialClearWithTarget:v12 options:v10 completionHandler:v11];
      break;
    case 1:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attemptResetToDAVModeWithCompletionHandler:v11];
      break;
    case 2:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:v11];
      break;
    case 3:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attemptCloudKitMigrationWithCompletionHandler:v11];
      break;
    case 4:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attemptToClearDataWithOptions:v10 completionHandler:v11];
      break;
    default:
      break;
  }
}

- (void)resetOperation:(int64_t)a3
{
  if (-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self, "hasPerformedOperation:")
    && (unint64_t)a3 <= 4)
  {
    v5 = &self->super.isa + a3;
    Class v6 = v5[1];
    v5[1] = 0;
  }
}

- (id)_descriptionForBookmark:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  Class v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = [v4 title];
  if (isKindOfClass)
  {
    id v8 = [v4 url];
    id v9 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attributeStringForBookmark:v4 multiline:0];
    id v10 = [v6 stringWithFormat:@"<Leaf title=\"%@\" url=\"%@\" attributes=\"%@\">", v7, v8, v9];
  }
  else
  {
    id v8 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attributeStringForBookmark:v4 multiline:0];
    id v10 = [v6 stringWithFormat:@"<List title=\"%@\" attributes=\"%@\">", v7, v8];
  }

  return v10;
}

- (id)_attributeStringForBookmark:(id)a3 multiline:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  id v8 = [v6 extraAttributes];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__WBSCyclerTestSuiteBookmarkAuxiliary__attributeStringForBookmark_multiline___block_invoke;
  v13[3] = &unk_1E5C9A9B0;
  id v14 = v7;
  id v9 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];

  if (v4) {
    id v10 = @"\n";
  }
  else {
    id v10 = @", ";
  }
  id v11 = [v9 componentsJoinedByString:v10];

  return v11;
}

void __77__WBSCyclerTestSuiteBookmarkAuxiliary__attributeStringForBookmark_multiline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"%@: %@", a2, a3];
  [v3 addObject:v4];
}

- (id)_expandedDescriptionForBookmark:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v7 = [v4 title];
  id v8 = (void *)v7;
  if (isKindOfClass)
  {
    id v9 = [v4 url];
    id v10 = [v6 stringWithFormat:@"<Leaf title=\"%@\" url=\"%@\">", v8, v9];
  }
  else
  {
    id v10 = [v6 stringWithFormat:@"<List title=\"%@\">", v7];
  }

  [v10 appendString:@"\n"];
  id v11 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _attributeStringForBookmark:v4 multiline:1];
  [v10 appendString:v11];

  return v10;
}

- (id)_formattedStringForBookmark:(id)a3 indentationLevel:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _descriptionForBookmark:v6];
  id v8 = (void *)[v7 mutableCopy];

  if (a4)
  {
    unint64_t v9 = a4;
    do
    {
      [v8 insertString:@"    " atIndex:0];
      --v9;
    }
    while (v9);
  }
  [v8 appendString:@"\n"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      unint64_t v14 = a4 + 1;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v16 = -[WBSCyclerTestSuiteBookmarkAuxiliary _formattedStringForBookmark:indentationLevel:](self, "_formattedStringForBookmark:indentationLevel:", *(void *)(*((void *)&v18 + 1) + 8 * i), v14, (void)v18);
          [v8 appendString:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

- (void)_attemptInitialClearWithTarget:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_initialClearOperation)
  {
    uint64_t v11 = [WBSCyclerOperation alloc];
    *(float *)&double v12 = self->_operationBackoffRatio;
    uint64_t v13 = [(WBSCyclerOperation *)v11 initWithMaximumNumberOfAttempts:5 backoffRatio:v12];
    initialClearOperation = self->_initialClearOperation;
    self->_initialClearOperation = v13;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9A9D8;
  id v23 = v9;
  id v24 = v8;
  v15 = self->_initialClearOperation;
  id v16 = v8;
  id v17 = v9;
  [(WBSCyclerOperation *)v15 setBlock:v22];
  long long v18 = self->_initialClearOperation;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47;
  v20[3] = &unk_1E5C9AA00;
  v20[4] = self;
  id v21 = v10;
  id v19 = v10;
  [(WBSCyclerOperation *)v18 executeWithResultHandler:v20];
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Clearing all local and remote bookmarks before starting cycler", v8, 2u);
  }
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"forCloudKitTest"];
  int v6 = [v5 isEqual:MEMORY[0x1E4F1CC38]];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }
  [*(id *)(a1 + 40) clearBookmarksWithOptions:v7 completionHandler:v3];
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47_cold_2();
      }
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) _errorWithCode:1];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      break;
    case 1:
      uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    case 0:
      id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
  }
}

- (void)_attemptResetToDAVModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  resetToDAVModeOperation = self->_resetToDAVModeOperation;
  if (!resetToDAVModeOperation)
  {
    int v6 = [WBSCyclerOperation alloc];
    *(float *)&double v7 = self->_operationBackoffRatio;
    id v8 = [(WBSCyclerOperation *)v6 initWithMaximumNumberOfAttempts:5 backoffRatio:v7];
    id v9 = self->_resetToDAVModeOperation;
    self->_resetToDAVModeOperation = v8;

    [(WBSCyclerOperation *)self->_resetToDAVModeOperation setBlock:&__block_literal_global_43];
    resetToDAVModeOperation = self->_resetToDAVModeOperation;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52;
  v11[3] = &unk_1E5C9AA00;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(WBSCyclerOperation *)resetToDAVModeOperation executeWithResultHandler:v11];
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Resetting bookmark database back to DAV mode", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F97FB8] sharedProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_50;
  v6[3] = &unk_1E5C8DCF8;
  id v7 = v2;
  id v5 = v2;
  [v4 resetToDAVDatabaseWithCompletionHandler:v6];
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_50_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Reset bookmark database to DAV mode successfully", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52_cold_2();
      }
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) _errorWithCode:3];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      break;
    case 1:
      id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    case 0:
      id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
  }
}

- (void)_attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3
{
  id v4 = a3;
  generateDAVServerIDsForExistingBookmarksOperation = self->_generateDAVServerIDsForExistingBookmarksOperation;
  if (!generateDAVServerIDsForExistingBookmarksOperation)
  {
    int v6 = [WBSCyclerOperation alloc];
    *(float *)&double v7 = self->_operationBackoffRatio;
    id v8 = [(WBSCyclerOperation *)v6 initWithMaximumNumberOfAttempts:5 backoffRatio:v7];
    id v9 = self->_generateDAVServerIDsForExistingBookmarksOperation;
    self->_generateDAVServerIDsForExistingBookmarksOperation = v8;

    [(WBSCyclerOperation *)self->_generateDAVServerIDsForExistingBookmarksOperation setBlock:&__block_literal_global_54];
    generateDAVServerIDsForExistingBookmarksOperation = self->_generateDAVServerIDsForExistingBookmarksOperation;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56;
  v11[3] = &unk_1E5C9AA00;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(WBSCyclerOperation *)generateDAVServerIDsForExistingBookmarksOperation executeWithResultHandler:v11];
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Generating DAV server IDs for current bookmarks", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F97FB8] sharedProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_55;
  v6[3] = &unk_1E5C8DCF8;
  id v7 = v2;
  id v5 = v2;
  [v4 generateDAVServerIDsForExistingBookmarksWithCompletionHandler:v6];
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_55_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Generated DAV server IDs for existing bookmarks", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56_cold_2();
      }
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) _errorWithCode:4];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      break;
    case 1:
      id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    case 0:
      id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
  }
}

- (void)_attemptCloudKitMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  cloudKitMigrationOperation = self->_cloudKitMigrationOperation;
  if (!cloudKitMigrationOperation)
  {
    int v6 = [WBSCyclerOperation alloc];
    *(float *)&double v7 = self->_operationBackoffRatio;
    id v8 = [(WBSCyclerOperation *)v6 initWithMaximumNumberOfAttempts:5 backoffRatio:v7];
    id v9 = self->_cloudKitMigrationOperation;
    self->_cloudKitMigrationOperation = v8;

    [(WBSCyclerOperation *)self->_cloudKitMigrationOperation setBlock:&__block_literal_global_58];
    cloudKitMigrationOperation = self->_cloudKitMigrationOperation;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60;
  v11[3] = &unk_1E5C9AA00;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(WBSCyclerOperation *)cloudKitMigrationOperation executeWithResultHandler:v11];
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Migrating from DAV to CloudKit", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F97FB8] sharedProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_59;
  v6[3] = &unk_1E5C8DCF8;
  id v7 = v2;
  id v5 = v2;
  [v4 migrateToCloudKitWithCompletionHandler:v6];
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_59_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Migrated from DAV to CloudKit successfully", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60_cold_2();
      }
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = [*(id *)(a1 + 32) _errorWithCode:5];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      break;
    case 1:
      id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      break;
    case 0:
      id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
  }
}

- (void)_attemptToClearDataWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_clearLocalDataOperation)
  {
    id v8 = [WBSCyclerOperation alloc];
    *(float *)&double v9 = self->_operationBackoffRatio;
    id v10 = [(WBSCyclerOperation *)v8 initWithMaximumNumberOfAttempts:5 backoffRatio:v9];
    clearLocalDataOperation = self->_clearLocalDataOperation;
    self->_clearLocalDataOperation = v10;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke;
  v18[3] = &unk_1E5C9AA48;
  id v19 = v6;
  id v12 = self->_clearLocalDataOperation;
  id v13 = v6;
  [(WBSCyclerOperation *)v12 setBlock:v18];
  unint64_t v14 = self->_clearLocalDataOperation;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62;
  v16[3] = &unk_1E5C9AA00;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [(WBSCyclerOperation *)v14 executeWithResultHandler:v16];
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"includeMigrationState"];
  uint64_t v5 = [v4 isEqual:MEMORY[0x1E4F1CC38]];

  id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      id v8 = "Asking sync agent to clear local data and migration state";
LABEL_6:
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    id v8 = "Asking sync agent to clear local data";
    goto LABEL_6;
  }
  double v9 = [MEMORY[0x1E4F97FB8] sharedProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_61;
  v11[3] = &unk_1E5C8DCF8;
  id v12 = v3;
  id v10 = v3;
  [v9 clearLocalDataIncludingMigrationState:v5 completionHandler:v11];
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_61_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Cleared local data successfully", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v4 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62_cold_2();
      }
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [*(id *)(a1 + 32) _errorWithCode:6];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      break;
    case 1:
      BOOL v7 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62_cold_1();
      }
      break;
    case 0:
      id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      break;
  }
}

- (id)_errorWithCode:(int64_t)a3
{
  return [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _errorWithCode:a3 userInfo:0];
}

- (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = (void *)[a4 mutableCopy];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  double v9 = v8;

  id v10 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self _descriptionForErrorCode:a3];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCyclerTestSuiteBookmarkAuxiliaryErrorDomain" code:a3 userInfo:v9];

  return v11;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Test target's bookmark state does not match the expected state";
  }
  else {
    return off_1E5C9AA68[a3 - 1];
  }
}

- (float)operationBackoffRatio
{
  return self->_operationBackoffRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearLocalDataOperation, 0);
  objc_storeStrong((id *)&self->_cloudKitMigrationOperation, 0);
  objc_storeStrong((id *)&self->_generateDAVServerIDsForExistingBookmarksOperation, 0);
  objc_storeStrong((id *)&self->_resetToDAVModeOperation, 0);
  objc_storeStrong((id *)&self->_initialClearOperation, 0);
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Extra attributes also match", v1, 2u);
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Expected and actual bookmarks' titles and URLs match. Checking extra attributes.", v1, 2u);
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Actual state: %{public}@", v1, 0xCu);
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Expected state: %{public}@", v1, 0xCu);
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v2 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_1A6B5F000, v3, v4, "Was not able to clear bookmarks. Will try again after %.2f seconds.", v5, v6, v7, v8, v9);
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_47_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to clear bookmarks too many times. Giving up.", v2, v3, v4, v5, v6);
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_50_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_8(&dword_1A6B5F000, v0, v1, "Failed to reset bookmark database to DAV mode: %{public}@", v2);
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v2 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_1A6B5F000, v3, v4, "Was not able to reset bookmark database to DAV mode. Will try again after %.2f seconds.", v5, v6, v7, v8, v9);
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_52_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to reset bookmark database to DAV mode too many times. Giving up.", v2, v3, v4, v5, v6);
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_55_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_8(&dword_1A6B5F000, v0, v1, "Failed to generate DAV server IDs for existing bookmarks: %{public}@", v2);
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v2 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_1A6B5F000, v3, v4, "Was not able to generate DAV server IDs for existing bookmarks. Will try again after %.2f seconds.", v5, v6, v7, v8, v9);
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_56_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to generate DAV server IDs for existing bookmarks too many times. Giving up.", v2, v3, v4, v5, v6);
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_59_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_8(&dword_1A6B5F000, v0, v1, "Failed to migrate from DAV to CloudKit: %{public}@", v2);
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v2 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_1A6B5F000, v3, v4, "Was not able to migrate from DAV to CloudKit. Will try again after %.2f seconds.", v5, v6, v7, v8, v9);
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_60_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to migrate from DAV to CloudKit too many times. Giving up.", v2, v3, v4, v5, v6);
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_61_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_8(&dword_1A6B5F000, v0, v1, "Failed to clear local data: %{public}@", v2);
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v2 = v1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_1A6B5F000, v3, v4, "Was not able to clear local data. Will try again after %.2f seconds.", v5, v6, v7, v8, v9);
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_62_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to clear local data too many times. Giving up.", v2, v3, v4, v5, v6);
}

@end