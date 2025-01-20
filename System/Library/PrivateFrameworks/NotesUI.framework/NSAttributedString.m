@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __64__NSAttributedString_IC_UI__ic_containsBlockAttachmentsInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = ICProtocolCast();
  if (v7 && ([MEMORY[0x1E4F834B0] isInlineAttachment:v7] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __74__NSAttributedString_IC_UI__ic_rangeForBaseAttachment_withTextAttachment___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v16 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v11 = v16;
    v12 = [v11 attachment];
    int v13 = [v12 isEqual:a1[4]];

    if (v13)
    {
      uint64_t v14 = *(void *)(a1[5] + 8);
      *(void *)(v14 + 32) = a3;
      *(void *)(v14 + 40) = a4;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      *a5 = 1;
    }
  }
  return MEMORY[0x1F41817F8](isKindOfClass);
}

uint64_t __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 range];
  return objc_msgSend(v2, "addIndexesInRange:", v4, v3);
}

uint64_t __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(void *)(a1 + 40), a2, a3);
}

void __55__NSAttributedString_IC_UI__ic_itemProviderDataForUTI___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 setObject:a3 forKeyedSubscript:a2];
}

id __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = ICCheckedDynamicCast();

  if (v7)
  {
    v8 = [v7 uiModel];
    v9 = [v8 attributedStringWithSurroundingAttributes:v5 formatter:*(void *)(a1 + 32)];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __92__NSAttributedString_IC_UI__ic_attributedStringByFlatteningCalculateAttachmentsWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 setObject:a3 forKeyedSubscript:a2];
}

id __92__NSAttributedString_IC_UI__ic_attributedStringByFlatteningCalculateAttachmentsWithContext___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();

  if (([v4 isCalculateResultAttachment] & 1) != 0
    || [v4 isCalculateGraphExpressionAttachment])
  {
    id v5 = [v4 displayText];
    id v6 = objc_msgSend(v5, "ic_stringByRemovingLanguageDirectionCharacters");

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __108__NSAttributedString_IC_UI__ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  uint64_t v14 = ICDynamicCast();

  if (v14)
  {
    uint64_t v8 = [MEMORY[0x1E4F834B0] isInlineAttachment:v14];
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4F833A0];
      v10 = [v14 attachmentIdentifier];
      id v11 = [v9 cloneInlineAttachmentWithIdentifier:v10 context:*(void *)(a1 + 32)];

      v12 = +[ICInlineTextAttachment textAttachmentWithAttachment:v11];
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v12, a3, a4);
      [v11 updateChangeCountWithReason:@"Copied inline attachment"];
    }
  }
  return MEMORY[0x1F41817F8](v8);
}

uint64_t __55__NSAttributedString_IC_UI__ic_containsTextAttachment___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __61__NSAttributedString_IC_UI__ic_attributedSubstringUntilLine___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  char v7 = [v6 characterIsMember:a3];

  if (v7)
  {
    char isKindOfClass = 1;
  }
  else if (a3 == 65532)
  {
    v9 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB06B8] atIndex:a2 effectiveRange:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void __73__NSAttributedString_ICTableAdditions__ic_tableSizeForTextTable_inRange___block_invoke(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 textBlocks];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    if (a1[4])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = objc_msgSend(v3, "textBlocks", 0);
      id v7 = (id)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v11 = [v10 table];
            v12 = (void *)a1[4];

            if (v11 == v12)
            {
              id v7 = v10;
              goto LABEL_14;
            }
          }
          id v7 = (id)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      objc_opt_class();
      id v6 = [v3 textBlocks];
      int v13 = [v6 objectAtIndex:0];
      ICDynamicCast();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_14:

    if (v7)
    {
      NSUInteger v14 = [v7 startingColumn];
      NSUInteger v15 = [v7 columnSpan];
      NSUInteger v16 = [v7 startingRow];
      uint64_t v17 = [v7 rowSpan];
      NSUInteger v18 = v17;
      v19 = *(NSRange **)(a1[6] + 8);
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
      {
        v19[2].location = v14;
        v19[2].length = v15;
        uint64_t v20 = *(void *)(a1[7] + 8);
        *(void *)(v20 + 32) = v16;
        *(void *)(v20 + 40) = v17;
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
      }
      else
      {
        v27.location = v14;
        v27.length = v15;
        *(NSRange *)(*(void *)(a1[6] + 8) + 32) = NSUnionRange(v19[2], v27);
        v28.location = v16;
        v28.length = v18;
        *(NSRange *)(*(void *)(a1[7] + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(a1[7] + 8) + 32), v28);
      }
    }
  }
}

void __61__NSAttributedString_ICTableAdditions__ic_textTablesInRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "textBlocks", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) table];
        if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v8] & 1) == 0)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end