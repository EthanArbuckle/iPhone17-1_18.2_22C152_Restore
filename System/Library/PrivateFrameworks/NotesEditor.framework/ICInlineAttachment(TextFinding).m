@interface ICInlineAttachment(TextFinding)
- (id)textFindingResultsMatchingExpression:()TextFinding ignoreCase:wholeWords:startsWith:;
- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:;
@end

@implementation ICInlineAttachment(TextFinding)

- (id)textFindingResultsMatchingExpression:()TextFinding ignoreCase:wholeWords:startsWith:
{
  id v9 = a3;
  v10 = [a1 uiModel];
  v11 = [v10 attributedStringWithSurroundingAttributes:MEMORY[0x263EFFA78] formatter:0];

  v12 = [v11 string];
  uint64_t v13 = objc_msgSend(v11, "ic_range");
  v15 = objc_msgSend(v9, "matchesInString:options:range:", v12, 0, v13, v14);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __105__ICInlineAttachment_TextFinding__textFindingResultsMatchingExpression_ignoreCase_wholeWords_startsWith___block_invoke;
  v19[3] = &unk_2640BB378;
  char v22 = a5;
  char v23 = a6;
  id v20 = v11;
  v21 = a1;
  id v16 = v11;
  v17 = objc_msgSend(v15, "ic_compactMap:", v19);

  return v17;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a9;
  if (a8)
  {
    id v17 = v22;
  }
  else
  {
    id v17 = [MEMORY[0x263F08AE8] escapedPatternForString:v22];
  }
  v18 = v17;
  if (a5) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 1024;
  }
  id v20 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v17 options:v19 error:0];
  v21 = [a1 textFindingResultsMatchingExpression:v20 ignoreCase:a5 wholeWords:a6 startsWith:a7];
  if (v16) {
    v16[2](v16, v21);
  }
}

@end