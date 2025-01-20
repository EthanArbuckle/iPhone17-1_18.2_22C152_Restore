@interface ICNoteSnippetUtilities
+ (_NSRange)rangeForTitleInContent:(id)a3 truncated:(BOOL *)a4;
+ (id)attributedStringByRemovingTitle:(id)a3 fromAttributedString:(id)a4;
+ (id)snippetAndTitleTrimCharacterSet;
+ (id)snippetForAttributedContent:(id)a3 attributedSnippetIfNecessary:(id *)a4;
+ (id)snippetForContent:(id)a3;
+ (id)stringByRemovingTitle:(id)a3 fromString:(id)a4;
+ (id)titleForAttributedContent:(id)a3 truncated:(BOOL *)a4 attributedTitleIfNecessary:(id *)a5;
+ (id)widgetSnippetForContent:(id)a3;
@end

@implementation ICNoteSnippetUtilities

+ (id)snippetAndTitleTrimCharacterSet
{
  return (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
}

+ (_NSRange)rangeForTitleInContent:(id)a3 truncated:(BOOL *)a4
{
  id v5 = a3;
  v6 = +[ICNoteSnippetUtilities snippetAndTitleTrimCharacterSet];
  v7 = [v6 invertedSet];
  unint64_t v8 = [v5 rangeOfCharacterFromSet:v7];

  BOOL v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v8;
  }
  unint64_t v11 = objc_msgSend(v5, "paragraphRangeForRange:", v10, 0);
  BOOL v13 = v11 < v8;
  BOOL v14 = !v9 || !v13;
  if (v9 && v13) {
    unint64_t v15 = v12 - v8 + v11;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v14) {
    NSUInteger v16 = v11;
  }
  else {
    NSUInteger v16 = v8;
  }
  if (v15 >= 0x41)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3010000000;
    v33 = &unk_20C2C2E5B;
    NSUInteger v34 = v16;
    uint64_t v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __59__ICNoteSnippetUtilities_rangeForTitleInContent_truncated___block_invoke;
    v29[3] = &unk_2640CDA20;
    v29[4] = &v30;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", v16, v15, 3, v29);
    v17 = v31;
    unint64_t v18 = v31[5];
    if (v18 <= 0x64)
    {
      if (v18)
      {
LABEL_20:
        uint64_t v20 = [v5 rangeOfComposedCharacterSequencesForRange:v17[4]];
        uint64_t v22 = v20;
        unint64_t v23 = v21;
        v24 = v31;
        v31[4] = v20;
        v24[5] = v21;
        if (a4)
        {
          BOOL v26 = v16 != v20 || v15 != v21;
          *a4 = v26;
        }
        _Block_object_dispose(&v30, 8);
        unint64_t v15 = v23;
        NSUInteger v16 = v22;
        goto LABEL_29;
      }
      v31[4] = v16;
      if (v15 >= 0x64) {
        uint64_t v19 = 100;
      }
      else {
        uint64_t v19 = v15;
      }
    }
    else
    {
      uint64_t v19 = 100;
    }
    v17[5] = v19;
    goto LABEL_20;
  }
  if (a4) {
    *a4 = 0;
  }
LABEL_29:

  NSUInteger v27 = v16;
  NSUInteger v28 = v15;
  result.length = v28;
  result.location = v27;
  return result;
}

NSUInteger __59__ICNoteSnippetUtilities_rangeForTitleInContent_truncated___block_invoke(uint64_t a1, uint64_t a2, NSRange a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  NSRange v9 = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a3);
  NSUInteger result = v9.location;
  *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) >= 0x41uLL) {
    *a6 = 1;
  }
  return result;
}

+ (id)titleForAttributedContent:(id)a3 truncated:(BOOL *)a4 attributedTitleIfNecessary:(id *)a5
{
  id v8 = a3;
  NSRange v9 = [v8 string];
  uint64_t v10 = [a1 rangeForTitleInContent:v9 truncated:a4];
  uint64_t v12 = v11;

  BOOL v13 = objc_msgSend(v8, "attributedSubstringFromRange:", v10, v12);

  BOOL v14 = +[ICNoteSnippetUtilities snippetAndTitleTrimCharacterSet];
  unint64_t v15 = objc_msgSend(v13, "ic_attributedStringByTrimmingCharactersInSet:", v14);

  NSUInteger v16 = [v15 string];
  if (a5)
  {
    objc_msgSend(v15, "ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)snippetForContent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((unint64_t)[v4 length] >= 0x100)
  {
    id v5 = objc_msgSend(v4, "ic_substringToIndex:", 255);
  }
  v6 = [a1 snippetAndTitleTrimCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = objc_msgSend(v7, "ic_whitespaceAndNewlineCoalescedString");

  return v8;
}

+ (id)snippetForAttributedContent:(id)a3 attributedSnippetIfNecessary:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if ((unint64_t)[v6 length] >= 0x100)
  {
    v7 = objc_msgSend(v6, "ic_attributedSubstringFromRange:", 0, 255);
  }
  id v8 = [a1 snippetAndTitleTrimCharacterSet];
  NSRange v9 = objc_msgSend(v7, "ic_attributedStringByTrimmingCharactersInSet:", v8);

  uint64_t v10 = objc_msgSend(v9, "ic_whitespaceAndNewlineCoalescedAttributedString");

  uint64_t v11 = [v10 string];
  uint64_t v12 = objc_msgSend(v10, "ic_attributedStringWithOnlyAdaptiveImageAttributeIfNecessary");

  if (a4) {
    *a4 = v12;
  }

  return v11;
}

+ (id)widgetSnippetForContent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ((unint64_t)[v3 length] >= 0x100)
  {
    id v4 = objc_msgSend(v3, "ic_substringToIndex:", 255);
  }
  id v5 = objc_msgSend(v4, "ic_stringByRemovingAttachmentCharacters");

  uint64_t v9 = 0;
  uint64_t v10 = (id *)&v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  BOOL v13 = __Block_byref_object_dispose__3;
  BOOL v14 = &stru_26C13B138;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ICNoteSnippetUtilities_widgetSnippetForContent___block_invoke;
  v8[3] = &unk_2640CDA48;
  v8[4] = &v9;
  [v5 enumerateLinesUsingBlock:v8];
  if (![v10[5] length]) {
    objc_storeStrong(v10 + 5, v5);
  }
  id v6 = v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__ICNoteSnippetUtilities_widgetSnippetForContent___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 isEqualToString:&stru_26C13B138] & 1) == 0)
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isEqualToString:&stru_26C13B138] & 1) == 0)
    {
      uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:@"\n"];
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

+ (id)stringByRemovingTitle:(id)a3 fromString:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3)
  {
    uint64_t v7 = [v5 rangeOfString:a3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v7 + v8;
    }
    if (v9 <= [v6 length]) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = 0;
    }
    id v11 = [v6 substringFromIndex:v10];
  }
  else
  {
    id v11 = v5;
  }
  uint64_t v12 = v11;

  return v12;
}

+ (id)attributedStringByRemovingTitle:(id)a3 fromAttributedString:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = [v6 string];
    uint64_t v9 = [v8 rangeOfString:v7];
    uint64_t v11 = v10;

    uint64_t v12 = objc_msgSend(v6, "ic_range");
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v9 + v11;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v13 - (v9 + v11);
    }
    objc_msgSend(v6, "ic_attributedSubstringFromRange:", v14, v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v5;
  }
  v17 = v16;

  return v17;
}

@end