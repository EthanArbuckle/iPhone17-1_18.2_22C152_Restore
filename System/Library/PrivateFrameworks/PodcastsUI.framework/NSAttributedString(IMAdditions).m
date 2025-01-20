@interface NSAttributedString(IMAdditions)
+ (id)attributedStringWithTemplateString:()IMAdditions baseAttributes:snippetAttributes:snippets:;
+ (id)safeAttributedStringWithHTML:()IMAdditions attributes:;
- (id)attributedStringByTrimmingCharactersInCharacterSet:()IMAdditions;
- (id)attributedStringWithDefaultLineSpacing;
- (uint64_t)attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters;
@end

@implementation NSAttributedString(IMAdditions)

- (id)attributedStringByTrimmingCharactersInCharacterSet:()IMAdditions
{
  id v4 = a3;
  v5 = [a1 string];
  v6 = [v4 invertedSet];

  uint64_t v7 = [v5 rangeOfCharacterFromSet:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3F553C0];
  }
  else
  {
    uint64_t v9 = v7;
    uint64_t v10 = [v5 rangeOfCharacterFromSet:v6 options:4];
    uint64_t v8 = objc_msgSend(a1, "attributedSubstringFromRange:", v9, v11 - v9 + v10);
  }
  v12 = (void *)v8;

  return v12;
}

- (uint64_t)attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  if (!attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v3 = (void *)[v2 mutableCopy];

    [v3 addCharactersInString:@"\uFFFC"];
    uint64_t v4 = [v3 copy];
    v5 = (void *)attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;
  }

  return objc_msgSend(a1, "attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)attributedStringWithTemplateString:()IMAdditions baseAttributes:snippetAttributes:snippets:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v13];
  if ([v13 count])
  {
    v17 = (void *)[v13 mutableCopy];
    if ([v14 count]) {
      [v17 addEntriesFromDictionary:v14];
    }
  }
  else
  {
    v17 = v14;
  }
  v30 = (id *)&a9;
  id v18 = v15;
  v19 = v18;
  if (v18)
  {
    v20 = v18;
    do
    {
      v21 = [v16 string];
      uint64_t v22 = [v21 rangeOfString:@"%@"];
      uint64_t v24 = v23;

      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v20 attributes:v17];
        objc_msgSend(v16, "replaceCharactersInRange:withAttributedString:", v22, v24, v25);
      }
      v26 = v30++;
      id v27 = *v26;

      v20 = v27;
    }
    while (v27);
  }
  v28 = (void *)[v16 copy];

  return v28;
}

- (id)attributedStringWithDefaultLineSpacing
{
  v2 = (void *)[a1 mutableCopy];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v3 = [a1 length];
  uint64_t v4 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__NSAttributedString_IMAdditions__attributedStringWithDefaultLineSpacing__block_invoke;
  v11[3] = &unk_1E6E203C8;
  id v6 = v4;
  id v12 = v6;
  id v7 = v2;
  id v13 = v7;
  id v14 = &v15;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v3, 0, v11);
  if (!*((unsigned char *)v16 + 24)) {
    objc_msgSend(v7, "addAttribute:value:range:", v5, v6, 0, v3);
  }
  uint64_t v8 = v13;
  id v9 = v7;

  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (id)safeAttributedStringWithHTML:()IMAdditions attributes:
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*i?frame[^>]*>", &stru_1F3F553C0, 1025, 0, objc_msgSend(v6, "length"));

  uint64_t v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", @"</?\\s*img[^>]*>", &stru_1F3F553C0, 1025, 0, objc_msgSend(v7, "length"));

  v33 = v8;
  id v9 = [v8 dataUsingEncoding:10];
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = *MEMORY[0x1E4FB0708];
  uint64_t v12 = *MEMORY[0x1E4FB07D8];
  v38[0] = *MEMORY[0x1E4FB06D8];
  v38[1] = v12;
  v39[0] = v11;
  v39[1] = MEMORY[0x1E4F1CC38];
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  id v14 = (void *)[v10 initWithData:v9 options:v13 documentAttributes:0 error:0];
  uint64_t v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = [v15 length];
  uint64_t v17 = [v15 string];
  uint64_t v18 = objc_msgSend(v17, "rangeOfString:options:range:", @"\u2028", 0, 0, v16);
  uint64_t v20 = v19;

  if (v18 != 0x7FFFFFFFFFFFFFFFLL && v15)
  {
    do
    {
      objc_msgSend(v15, "replaceCharactersInRange:withString:", v18, v20, @"\n");
      uint64_t v21 = v18 + 1;
      if (v16 == v21) {
        break;
      }
      uint64_t v22 = [v15 string];
      uint64_t v18 = objc_msgSend(v22, "rangeOfString:options:range:", @"\u2028", 0, v21, v16 - v21);
      uint64_t v20 = v23;
    }
    while (v18 != 0x7FFFFFFFFFFFFFFFLL);
  }
  id v24 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v37 = *MEMORY[0x1E4FB0738];
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v26 = (void *)[v24 initWithArray:v25];

  uint64_t v27 = [v15 length];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __75__NSAttributedString_IMAdditions__safeAttributedStringWithHTML_attributes___block_invoke;
  v34[3] = &unk_1E6E203F0;
  id v28 = v15;
  id v35 = v28;
  v36 = v26;
  id v29 = v26;
  objc_msgSend(v28, "enumerateAttributesInRange:options:usingBlock:", 0, v27, 0, v34);
  if (v5) {
    objc_msgSend(v28, "addAttributes:range:", v5, 0, objc_msgSend(v28, "length"));
  }
  v30 = v36;
  id v31 = v28;

  return v31;
}

@end