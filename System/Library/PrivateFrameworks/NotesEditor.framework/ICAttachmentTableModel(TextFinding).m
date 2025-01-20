@interface ICAttachmentTableModel(TextFinding)
- (ICTableTextFindingResult)textFindingResultForMatchingRange:()TextFinding findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:;
- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:;
- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
- (void)undoablyReplaceAllOccurrencesOfQueryString:()TextFinding textView:ignoreCase:wholeWords:startsWith:withText:tableViewController:;
- (void)undoablyReplaceTextFindingResult:()TextFinding withReplacementString:tableViewController:;
@end

@implementation ICAttachmentTableModel(TextFinding)

- (ICTableTextFindingResult)textFindingResultForMatchingRange:()TextFinding findableAttributedString:queryString:ignoreCase:wholeWords:startsWith:row:column:
{
  v35[2] = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v17 = a6;
  if (a8)
  {
    v18 = [v16 string];
    int v19 = objc_msgSend(v18, "ic_rangeEncapsulatesWord:", a3, a4);

    if (!v19) {
      goto LABEL_6;
    }
  }
  if (a9
    && ([v16 string],
        v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = objc_msgSend(v20, "ic_startsWithDelimeter:", a3, a4),
        v20,
        !v21))
  {
LABEL_6:
    v29 = 0;
  }
  else
  {
    v22 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v16];
    v34[0] = @"SearchTableRow";
    v23 = [NSNumber numberWithUnsignedInteger:a10];
    v34[1] = @"SearchTableColumn";
    v35[0] = v23;
    v24 = [NSNumber numberWithUnsignedInteger:a11];
    v35[1] = v24;
    [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v26 = uint64_t v25 = a7;
    uint64_t v27 = objc_msgSend(v22, "ic_range");
    objc_msgSend(v22, "addAttributes:range:", v26, v27, v28);

    v29 = objc_alloc_init(ICTableTextFindingResult);
    v30 = [a1 attachment];
    [(ICTableTextFindingResult *)v29 setAttachment:v30];

    v31 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v22];
    [(ICTableTextFindingResult *)v29 setFindableString:v31];

    -[ICTableTextFindingResult setRangeInFindableString:](v29, "setRangeInFindableString:", a3, a4);
    [(ICTableTextFindingResult *)v29 setQueryString:v17];
    [(ICTableTextFindingResult *)v29 setIgnoreCase:v25];
    [(ICTableTextFindingResult *)v29 setRow:a10];
    [(ICTableTextFindingResult *)v29 setColumn:a11];
  }

  return v29;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v14 = a3;
  id v30 = a4;
  v15 = a9;
  if (a8)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x263F08AE8] escapedPatternForString:v14];
  }
  id v17 = v16;
  if (a5) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 1024;
  }
  int v19 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v16 options:v18 error:0];
  v20 = [a1 attachment];
  int v21 = [v20 managedObjectContext];

  v22 = [MEMORY[0x263EFF980] array];
  v23 = [a1 table];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __136__ICAttachmentTableModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
  v31[3] = &unk_2640BAE50;
  id v24 = v19;
  id v32 = v24;
  v33 = a1;
  id v25 = v14;
  id v34 = v25;
  char v37 = a5;
  char v38 = a6;
  char v39 = a7;
  id v26 = v22;
  id v35 = v26;
  id v27 = v21;
  id v36 = v27;
  [v23 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v31];

  if (v15)
  {
    uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v26];
    v15[2](v15, v28);
  }
}

- (void)undoablyReplaceAllOccurrencesOfQueryString:()TextFinding textView:ignoreCase:wholeWords:startsWith:withText:tableViewController:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  [v18 beginEditing];
  objc_initWeak(&location, a1);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __153__ICAttachmentTableModel_TextFinding__undoablyReplaceAllOccurrencesOfQueryString_textView_ignoreCase_wholeWords_startsWith_withText_tableViewController___block_invoke;
  v24[3] = &unk_2640BAE78;
  objc_copyWeak(&v27, &location);
  id v19 = v17;
  id v25 = v19;
  id v20 = v18;
  id v26 = v20;
  [a1 textFindingResultsMatchingString:v15 textView:v16 ignoreCase:a5 wholeWords:a6 startsWith:a7 usePattern:0 completion:v24];
  [v20 endEditing];
  [v20 saveOnMainThread];
  int v21 = [v20 undoManager];
  v22 = [MEMORY[0x263F086E0] mainBundle];
  v23 = [v22 localizedStringForKey:@"Replace All" value:&stru_26C10E100 table:0];
  [v21 setActionName:v23];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)undoablyReplaceTextFindingResult:()TextFinding withReplacementString:tableViewController:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 beginEditing];
  [a1 replaceTextFindingResult:v10 withReplacementString:v9 tableViewController:v8];

  [v8 endEditing];
  [v8 saveOnMainThread];
  id v13 = [v8 undoManager];

  v11 = [MEMORY[0x263F086E0] mainBundle];
  v12 = [v11 localizedStringForKey:@"Replace" value:&stru_26C10E100 table:0];
  [v13 setActionName:v12];
}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = ICDynamicCast();
  v11 = v10;
  if (v10)
  {
    if ([v10 row] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v11, "column") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentTableModel(TextFinding) replaceTextFindingResult:withReplacementString:tableViewController:]((uint64_t)v11, v12);
      }
    }
    else
    {
      id v13 = [v11 inlineTextFindingResult];

      if (v13) {
        goto LABEL_10;
      }
      v12 = [v9 table];
      uint64_t v14 = [v11 row];
      uint64_t v15 = [v11 column];
      uint64_t v21 = [v11 rangeInFindableString];
      uint64_t v17 = v16;
      id v18 = [v9 undoTarget];
      id v19 = [v9 undoManager];
      id v20 = [v12 textStorageForCellAtColumnIndex:v15 rowIndex:v14 undoTarget:v18 undoManager:v19];

      objc_msgSend(v20, "replaceCharactersInRange:withString:", v21, v17, v8);
    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICAttachmentTableModel(TextFinding) replaceTextFindingResult:withReplacementString:tableViewController:]((uint64_t)v7, v12);
    }
  }
LABEL_10:
}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Cannot cast findingResult %@ to type %@", (uint8_t *)&v6, 0x16u);
}

- (void)replaceTextFindingResult:()TextFinding withReplacementString:tableViewController:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Cannot retrieve the row and column numbers for tableFindingResult: %@", (uint8_t *)&v2, 0xCu);
}

@end