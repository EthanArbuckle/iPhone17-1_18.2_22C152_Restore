@interface NSAttributedString(IC_UI)
+ (id)ic_attributedStringWithString:()IC_UI font:;
+ (id)ic_blockQuoteMenuItemAttributedString;
- (BOOL)ic_containsBlockAttachmentsInRange:()IC_UI;
- (id)_ic_attributedStringByHighlightingRegexMatches:()IC_UI withHighlightColor:attributeName:;
- (id)ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:()IC_UI;
- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()IC_UI formatter:;
- (id)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:attributeName:;
- (id)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:attributeName:;
- (id)ic_attributedSubstringUntilLine:()IC_UI;
- (id)ic_attributesByHighlightingAttributes:()IC_UI withHighlightColor:attributeName:;
- (id)ic_itemProviderDataForUTI:()IC_UI;
- (id)ic_stringByTrimmingLeadingTrailingWhitespace;
- (id)ic_stringWithoutAttachments;
- (uint64_t)ic_attributedStringByFlatteningCalculateAttachmentsWithContext:()IC_UI;
- (uint64_t)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:;
- (uint64_t)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:;
- (uint64_t)ic_containsTextAttachment:()IC_UI;
- (uint64_t)ic_rangeForAttachment:()IC_UI withTextAttachment:;
- (uint64_t)ic_rangeForBaseAttachment:()IC_UI withTextAttachment:;
- (uint64_t)ic_rangeForInlineAttachment:()IC_UI withTextAttachment:;
- (uint64_t)ic_writingDirectionAtIndex:()IC_UI;
@end

@implementation NSAttributedString(IC_UI)

- (BOOL)ic_containsBlockAttachmentsInRange:()IC_UI
{
  if (!objc_msgSend(a1, "containsAttachmentsInRange:")) {
    return 0;
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = *MEMORY[0x1E4FB06B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__NSAttributedString_IC_UI__ic_containsBlockAttachmentsInRange___block_invoke;
  v10[3] = &unk_1E5FDA328;
  v10[4] = &v11;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, a3, a4, 0, v10);
  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (id)ic_blockQuoteMenuItemAttributedString
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E48]);
  v1 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Block Quote" value:@"Block Quote" table:0 allowSiri:1];
  v2 = (void *)[v0 initWithString:v1];

  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v2 insertAttributedString:v3 atIndex:0];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"|"];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  [v5 setObject:&unk_1F09A4550 forKeyedSubscript:*MEMORY[0x1E4FB06C8]];
  BOOL v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
  v9 = objc_msgSend(v8, "ic_fontWithSymbolicBoldTrait");
  v10 = objc_msgSend(v9, "ic_fontWithRoundedDesign");

  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  objc_msgSend(v4, "addAttributes:range:", v5, 0, 1);
  [v2 insertAttributedString:v4 atIndex:0];
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v12 = [MEMORY[0x1E4FB1618] labelColor];
  [v11 setObject:v12 forKeyedSubscript:v7];

  objc_msgSend(v2, "addAttributes:range:", v11, 1, objc_msgSend(v2, "length") - 1);
  uint64_t v13 = (void *)[v2 copy];

  return v13;
}

+ (id)ic_attributedStringWithString:()IC_UI font:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v12 = *MEMORY[0x1E4FB06F8];
  v13[0] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10 = (void *)[v8 initWithString:v7 attributes:v9];
  return v10;
}

- (uint64_t)ic_rangeForAttachment:()IC_UI withTextAttachment:
{
  id v9 = 0;
  uint64_t v5 = objc_msgSend(a1, "ic_rangeForBaseAttachment:withTextAttachment:", a3, &v9);
  id v6 = v9;
  id v7 = v6;
  if (a4 && v6)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ic_rangeForInlineAttachment:()IC_UI withTextAttachment:
{
  id v9 = 0;
  uint64_t v5 = objc_msgSend(a1, "ic_rangeForBaseAttachment:withTextAttachment:", a3, &v9);
  id v6 = v9;
  id v7 = v6;
  if (a4 && v6)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (uint64_t)ic_rangeForBaseAttachment:()IC_UI withTextAttachment:
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3010000000;
  v25 = &unk_1B0BF84BB;
  long long v26 = xmmword_1B0B987A0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__64;
  v20 = __Block_byref_object_dispose__64;
  id v21 = 0;
  uint64_t v7 = [a1 length];
  uint64_t v8 = *MEMORY[0x1E4FB06B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__NSAttributedString_IC_UI__ic_rangeForBaseAttachment_withTextAttachment___block_invoke;
  v12[3] = &unk_1E5FDDB48;
  id v9 = v6;
  id v13 = v9;
  char v14 = &v22;
  v15 = &v16;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v12);
  if (a4) {
    *a4 = (id) v17[5];
  }
  uint64_t v10 = v23[4];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)ic_stringByTrimmingLeadingTrailingWhitespace
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [v1 string];
  uint64_t v4 = [v3 rangeOfCharacterFromSet:v2];
  uint64_t v6 = v5;

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    do
    {
      uint64_t v8 = v1;
      id v1 = (id)[v1 mutableCopy];

      objc_msgSend(v1, "replaceCharactersInRange:withString:", 0, v6, &stru_1F0973378);
      id v9 = [v1 string];

      uint64_t v10 = [v9 rangeOfCharacterFromSet:v2];
      uint64_t v6 = v11;
    }
    while (v6 && !v10);
  }
  uint64_t v12 = [v1 string];
  uint64_t v13 = [v12 rangeOfCharacterFromSet:v2 options:4];
  uint64_t v15 = v14;

  if (v15)
  {
    while (v13 + v15 == [v1 length])
    {
      id v16 = (id)[v1 mutableCopy];

      objc_msgSend(v16, "replaceCharactersInRange:withString:", v13, v15, &stru_1F0973378);
      v17 = [v16 string];

      uint64_t v13 = [v17 rangeOfCharacterFromSet:v2 options:4];
      uint64_t v15 = v18;

      id v1 = v16;
      if (!v15) {
        goto LABEL_13;
      }
    }
  }
  id v16 = v1;
LABEL_13:

  return v16;
}

- (id)ic_stringWithoutAttachments
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:a1];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v3 = [a1 length];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = *MEMORY[0x1E4FB06B8];
    do
    {
      uint64_t v8 = [a1 attribute:v7 atIndex:v6 effectiveRange:&v12];
      uint64_t v10 = v12;
      uint64_t v9 = v13;
      if (v8)
      {
        objc_msgSend(v2, "deleteCharactersInRange:", v12 - v5, v13);
        v5 += v13;
      }
      unint64_t v6 = v9 + v10;
    }
    while (v6 < v4);
  }
  return v2;
}

- (id)ic_attributesByHighlightingAttributes:()IC_UI withHighlightColor:attributeName:
{
  id v7 = a4;
  id v8 = a5;
  if (a3) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = v10;
  if ((id)*MEMORY[0x1E4FB0700] == v8 || *MEMORY[0x1E4FB06C0] == (void)v8)
  {
    [v10 setObject:v7 forKeyedSubscript:v8];
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NSAttributedString(IC_UI) ic_attributesByHighlightingAttributes:withHighlightColor:attributeName:]((uint64_t)v8, v13);
    }
  }
  uint64_t v15 = (void *)[v11 copy];

  return v15;
}

- (uint64_t)ic_writingDirectionAtIndex:()IC_UI
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 attribute:*MEMORY[0x1E4FB0738] atIndex:a3 effectiveRange:0];
  uint64_t v6 = [v5 baseWritingDirection];
  if (v6 == -1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28DF0]);
    v15[0] = *MEMORY[0x1E4F28510];
    uint64_t v8 = v15[0];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v10 = (void *)[v7 initWithTagSchemes:v9 options:0];

    uint64_t v11 = [a1 string];
    uint64_t v12 = objc_msgSend(v11, "ic_substringWithRange:", a3, 1);
    [v10 setString:v12];

    uint64_t v13 = [v10 tagAtIndex:0 scheme:v8 tokenRange:0 sentenceRange:0];
    uint64_t v6 = [MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:v13];
  }
  return v6;
}

- (id)_ic_attributedStringByHighlightingRegexMatches:()IC_UI withHighlightColor:attributeName:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke;
    v22[3] = &unk_1E5FDDB70;
    id v23 = v11;
    id v12 = v11;
    [v8 enumerateObjectsUsingBlock:v22];
    uint64_t v13 = (void *)[a1 mutableCopy];
    uint64_t v14 = objc_msgSend(a1, "ic_attributesByHighlightingAttributes:withHighlightColor:attributeName:", MEMORY[0x1E4F1CC08], v9, v10);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __109__NSAttributedString_IC_UI___ic_attributedStringByHighlightingRegexMatches_withHighlightColor_attributeName___block_invoke_2;
    v19[3] = &unk_1E5FDDB98;
    id v20 = v13;
    id v21 = v14;
    id v15 = v14;
    id v16 = v13;
    [v12 enumerateRangesUsingBlock:v19];
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v16];
  }
  else
  {
    id v17 = a1;
  }

  return v17;
}

- (id)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:attributeName:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 string];
  id v12 = objc_msgSend(v10, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(a1, "length"));

  uint64_t v13 = objc_msgSend(a1, "_ic_attributedStringByHighlightingRegexMatches:withHighlightColor:attributeName:", v12, v9, v8);

  return v13;
}

- (uint64_t)ic_attributedStringByHighlightingRegex:()IC_UI withHighlightColor:
{
  return objc_msgSend(a1, "ic_attributedStringByHighlightingRegex:withHighlightColor:attributeName:", a3, a4, *MEMORY[0x1E4FB0700]);
}

- (uint64_t)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:
{
  return objc_msgSend(a1, "ic_attributedStringByHighlightingRegexFinderMatches:withHighlightColor:attributeName:", a3, a4, *MEMORY[0x1E4FB0700]);
}

- (id)ic_attributedStringByHighlightingRegexFinderMatches:()IC_UI withHighlightColor:attributeName:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 string];
  id v12 = [v10 matchesInDocumentWithPerTokenFallback:v11];

  uint64_t v13 = [v12 allObjects];

  uint64_t v14 = objc_msgSend(a1, "_ic_attributedStringByHighlightingRegexMatches:withHighlightColor:attributeName:", v13, v9, v8);

  return v14;
}

- (id)ic_itemProviderDataForUTI:()IC_UI
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__64;
  id v17 = __Block_byref_object_dispose__64;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__NSAttributedString_IC_UI__ic_itemProviderDataForUTI___block_invoke;
  v10[3] = &unk_1E5FDDBC0;
  id v12 = &v13;
  uint64_t v6 = v5;
  id v11 = v6;
  id v7 = (id)[a1 loadDataWithTypeIdentifier:v4 forItemProviderCompletionHandler:v10];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()IC_UI formatter:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__NSAttributedString_IC_UI__ic_attributedStringByFlatteningInlineAttachmentsWithContext_formatter___block_invoke_2;
  v10[3] = &unk_1E5FDDC08;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, 0, &__block_literal_global_77, v10);

  return v8;
}

- (uint64_t)ic_attributedStringByFlatteningCalculateAttachmentsWithContext:()IC_UI
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, 0, &__block_literal_global_44_0, &__block_literal_global_46);
}

- (id)ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext:()IC_UI
{
  id v4 = a3;
  dispatch_semaphore_t v5 = (void *)[a1 mutableCopy];
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  uint64_t v7 = [a1 length];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __108__NSAttributedString_IC_UI__ic_attributedStringByCopyingInlineAttachmentsAndUpdatingChangeCountWithContext___block_invoke;
  uint64_t v15 = &unk_1E5FDA998;
  id v16 = v4;
  id v17 = v5;
  id v8 = v5;
  id v9 = v4;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, &v12);
  id v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

- (uint64_t)ic_containsTextAttachment:()IC_UI
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v5 = objc_msgSend(a1, "ic_range");
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4FB06B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__NSAttributedString_IC_UI__ic_containsTextAttachment___block_invoke;
  v12[3] = &unk_1E5FDD460;
  id v9 = v4;
  id v13 = v9;
  uint64_t v14 = &v15;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);
  uint64_t v10 = *((unsigned __int8 *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)ic_attributedSubstringUntilLine:()IC_UI
{
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__NSAttributedString_IC_UI__ic_attributedSubstringUntilLine___block_invoke;
  v17[3] = &unk_1E5FDB078;
  v17[4] = a1;
  uint64_t v5 = objc_msgSend(a1, "ic_range");
  uint64_t v7 = objc_msgSend(a1, "ic_componentRangesSeparatedByPredicate:inRange:", v17, v5, v6);
  unint64_t v8 = [v7 count];
  if (v8 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8;
  }
  uint64_t v10 = objc_msgSend(v7, "subarrayWithRange:", 0, v9);

  id v11 = [v10 lastObject];
  uint64_t v12 = [v11 rangeValue];
  uint64_t v14 = objc_msgSend(a1, "attributedSubstringFromRange:", 0, v12 + v13);
  uint64_t v15 = (void *)[v14 mutableCopy];

  return v15;
}

- (void)ic_attributesByHighlightingAttributes:()IC_UI withHighlightColor:attributeName:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Invalid highlighting attribute: %@", (uint8_t *)&v2, 0xCu);
}

@end