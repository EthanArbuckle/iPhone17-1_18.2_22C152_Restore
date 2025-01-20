@interface ICInlineAttachment
@end

@implementation ICInlineAttachment

ICInlineTextFindingResult *__105__ICInlineAttachment_TextFinding__textFindingResultsMatchingExpression_ignoreCase_wholeWords_startsWith___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [*(id *)(a1 + 32) string];
    uint64_t v5 = [v3 range];
    int v7 = objc_msgSend(v4, "ic_rangeEncapsulatesWord:", v5, v6);

    if (!v7) {
      goto LABEL_6;
    }
  }
  if (*(unsigned char *)(a1 + 49)
    && ([*(id *)(a1 + 32) string],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v3 range],
        int v11 = objc_msgSend(v8, "ic_startsWithDelimeter:", v9, v10),
        v8,
        !v11))
  {
LABEL_6:
    v12 = 0;
  }
  else
  {
    v12 = objc_alloc_init(ICInlineTextFindingResult);
    [(ICInlineTextFindingResult *)v12 setAttachment:*(void *)(a1 + 40)];
    [(ICInlineTextFindingResult *)v12 setFindableString:*(void *)(a1 + 32)];
    uint64_t v13 = [v3 range];
    -[ICInlineTextFindingResult setDisplayTextRange:](v12, "setDisplayTextRange:", v13, v14);
  }

  return v12;
}

@end