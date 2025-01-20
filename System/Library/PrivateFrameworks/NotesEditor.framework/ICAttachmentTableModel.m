@interface ICAttachmentTableModel
@end

@implementation ICAttachmentTableModel

uint64_t __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v7 = [a2 attributedString];
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v7 string];
    uint64_t v11 = objc_msgSend(v8, "ic_range");
    v13 = objc_msgSend(v9, "matchesInString:options:range:", v10, 0, v11, v12);

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_18;
    v38[3] = &unk_2640BAE00;
    v38[4] = *(void *)(a1 + 40);
    id v14 = v8;
    id v39 = v14;
    id v15 = *(id *)(a1 + 48);
    char v43 = *(unsigned char *)(a1 + 72);
    __int16 v44 = *(_WORD *)(a1 + 73);
    id v40 = v15;
    uint64_t v41 = a4;
    uint64_t v42 = a3;
    v26 = [v13 ic_compactMap:v38];
    [*(id *)(a1 + 56) addObjectsFromArray:v26];
    v16 = [MEMORY[0x263EFF980] array];
    uint64_t v17 = *MEMORY[0x263F814A0];
    uint64_t v18 = objc_msgSend(v14, "ic_range");
    uint64_t v20 = v19;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2;
    v27[3] = &unk_2640BAE28;
    id v28 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 32);
    char v36 = *(unsigned char *)(a1 + 72);
    __int16 v37 = *(_WORD *)(a1 + 73);
    uint64_t v22 = *(void *)(a1 + 40);
    id v29 = v21;
    uint64_t v30 = v22;
    id v31 = v14;
    id v23 = *(id *)(a1 + 48);
    uint64_t v34 = a4;
    uint64_t v35 = a3;
    id v32 = v23;
    id v33 = v16;
    id v24 = v16;
    objc_msgSend(v31, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v20, 0, v27);
    [*(id *)(a1 + 56) addObjectsFromArray:v24];
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v46 = a3;
      __int16 v47 = 2048;
      uint64_t v48 = a4;
      _os_log_impl(&dword_20BE60000, v13, OS_LOG_TYPE_INFO, "Skipping finding in table because attributed string is nil at column %lu row %lu.", buf, 0x16u);
    }
  }

  return 0;
}

uint64_t __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_18(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 range];
  LOBYTE(v7) = *(unsigned char *)(a1 + 74);
  return objc_msgSend(v3, "textFindingResultForMatchingRange:findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:", v4, v5, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), v7, *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (v7 && [MEMORY[0x263F5ACE8] isInlineAttachment:v7])
  {
    v8 = [v7 inlineAttachmentInContext:*(void *)(a1 + 32)];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 textFindingResultsMatchingExpression:*(void *)(a1 + 40) ignoreCase:*(unsigned __int8 *)(a1 + 96) wholeWords:*(unsigned __int8 *)(a1 + 97) startsWith:*(unsigned __int8 *)(a1 + 98)];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v18 = v9;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            LOBYTE(v17) = *(unsigned char *)(a1 + 98);
            v16 = objc_msgSend(*(id *)(a1 + 48), "textFindingResultForMatchingRange:findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:", a3, a4, *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97), v17, *(void *)(a1 + 80), *(void *)(a1 + 88));
            [v16 setInlineTextFindingResult:v15];
            [*(id *)(a1 + 72) addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
        v9 = v18;
      }
    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Find");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1((uint64_t)v7, v10);
      }
    }
  }
}

void __153__ICAttachmentTableModel_TextFinding__undoablyReplaceAllOccurrencesOfQueryString_textView_ignoreCase_wholeWords_startsWith_withText_tableViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(WeakRetained, "replaceTextFindingResult:withReplacementString:tableViewController:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Unable to get inline attachment for ttAttachment: %@", (uint8_t *)&v2, 0xCu);
}

@end