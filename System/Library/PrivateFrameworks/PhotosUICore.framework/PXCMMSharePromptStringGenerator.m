@interface PXCMMSharePromptStringGenerator
+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4 boldFont:(id)a5 boldRange1:(_NSRange)a6 boldRange2:(_NSRange)a7;
+ (id)_stringWithComponentsCount:(unint64_t)a3 components:(id)a4 containsOtherPeople:(BOOL)a5 outBoldRange1:(_NSRange *)a6 outBoldRange2:(_NSRange *)a7;
+ (id)sharePromptStringWithAttributes:(id)a3 boldFont:(id)a4 lines:(int64_t)a5 width:(double)a6 names:(id)a7 containsUnverifiedPersons:(BOOL)a8;
@end

@implementation PXCMMSharePromptStringGenerator

+ (id)_stringWithComponentsCount:(unint64_t)a3 components:(id)a4 containsOtherPeople:(BOOL)a5 outBoldRange1:(_NSRange *)a6 outBoldRange2:(_NSRange *)a7
{
  id v13 = a4;
  unint64_t v14 = [v13 count];
  if (v14 < a3)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 110, @"Invalid parameter not satisfying: %@", @"count <= totalCount" object file lineNumber description];
  }
  v15 = PXLocalizedStringFromTable(@"PXShareWithFriends_QuestionMark", @"PhotosUICore");
  if (a3)
  {
    v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    if (a3 == 1 || a5 || v14 != a3)
    {
      v20 = objc_msgSend(v13, "subarrayWithRange:", 0, a3);
      v18 = [v20 componentsJoinedByString:@", "];

      [v16 addObject:v18];
    }
    else
    {
      v17 = objc_msgSend(v13, "subarrayWithRange:", 0, a3 - 1);
      v18 = [v17 componentsJoinedByString:@", "];

      [v16 addObject:v18];
      v19 = [v13 lastObject];
      [v16 addObject:v19];
    }
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__24985;
    v32 = __Block_byref_object_dispose__24986;
    id v33 = 0;
    if (v14 != a3 || a5)
    {
      uint64_t v22 = PXLocalizedStringFromTable(@"PXCMMSuggestionBannerSharePrompt_Others", @"PhotosUICore");
    }
    else
    {
      if (a3 == 1) {
        v21 = @"PXCMMSuggestionBannerSharePrompt_OneName";
      }
      else {
        v21 = @"PXCMMSuggestionBannerSharePrompt_TwoNames";
      }
      uint64_t v22 = PXLocalizedStringFromTable(v21, @"PhotosUICore");
    }
    v23 = (void *)v29[5];
    v29[5] = v22;

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __121__PXCMMSharePromptStringGenerator__stringWithComponentsCount_components_containsOtherPeople_outBoldRange1_outBoldRange2___block_invoke;
    v27[3] = &unk_1E5DB16A8;
    v27[4] = &v28;
    v27[5] = a6;
    v27[6] = a7;
    [v16 enumerateObjectsUsingBlock:v27];
    id v24 = (id)v29[5];

    _Block_object_dispose(&v28, 8);
    v15 = v24;
  }

  return v15;
}

void __121__PXCMMSharePromptStringGenerator__stringWithComponentsCount_components_containsOtherPeople_outBoldRange1_outBoldRange2___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(*(void *)(a1[4] + 8) + 40) rangeOfString:@"__PERSON_NAME__"];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = v8;
    uint64_t v18 = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 40), "stringByReplacingCharactersInRange:withString:", v8, v9, v7);
    uint64_t v19 = *(void *)(a1[4] + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (a3 == 1)
    {
      v21 = (uint64_t *)a1[6];
      if (!v21) {
        goto LABEL_13;
      }
    }
    else
    {
      if (a3) {
        goto LABEL_13;
      }
      v21 = (uint64_t *)a1[5];
      if (!v21) {
        goto LABEL_13;
      }
    }
    uint64_t v22 = [v7 length];
    uint64_t *v21 = v17;
    v21[1] = v22;
    goto LABEL_13;
  }
  v10 = (_OWORD *)a1[5];
  if (v10) {
    _OWORD *v10 = xmmword_1AB359BD0;
  }
  v11 = (_OWORD *)a1[6];
  if (v11) {
    _OWORD *v11 = xmmword_1AB359BD0;
  }
  v12 = PLSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(*(void *)(a1[4] + 8) + 40);
    int v23 = 138412290;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to locate marker string in localized string: \"%@\"", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v14 = PXLocalizedStringFromTable(@"PXShareWithFriends_QuestionMark", @"PhotosUICore");
  uint64_t v15 = *(void *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  *a4 = 1;
LABEL_13:
}

+ (id)_attributedStringWithString:(id)a3 attributes:(id)a4 boldFont:(id)a5 boldRange1:(_NSRange)a6 boldRange2:(_NSRange)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_16:
    [MEMORY[0x1E4F28B00] currentHandler];
    v25 = NSUInteger v24 = length;
    [v25 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 88, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    NSUInteger length = v24;
    if (v15) {
      goto LABEL_4;
    }
LABEL_17:
    [MEMORY[0x1E4F28B00] currentHandler];
    v27 = NSUInteger v26 = length;
    [v27 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 89, @"Invalid parameter not satisfying: %@", @"boldFont" object file lineNumber description];

    NSUInteger length = v26;
    goto LABEL_4;
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v23 = NSUInteger v22 = length;
  [v23 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 87, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

  NSUInteger length = v22;
  if (!v14) {
    goto LABEL_16;
  }
LABEL_3:
  if (!v15) {
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v14];
  uint64_t v17 = (void *)v16;
  if (location == 0x7FFFFFFFFFFFFFFFLL && a7.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = (void *)v16;
  }
  else
  {
    NSUInteger v28 = length;
    uint64_t v29 = *MEMORY[0x1E4FB06F8];
    v30[0] = v15;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v20 = (void *)[v17 mutableCopy];
    uint64_t v18 = v20;
    if (location != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v20, "setAttributes:range:", v19, location, v28);
    }
    if (a7.location != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v18, "setAttributes:range:", v19, a7.location, a7.length);
    }
  }
  return v18;
}

+ (id)sharePromptStringWithAttributes:(id)a3 boldFont:(id)a4 lines:(int64_t)a5 width:(double)a6 names:(id)a7 containsUnverifiedPersons:(BOOL)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  if (!v15)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 45, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
LABEL_29:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"PXCMMSharePromptStringGenerator.m", 46, @"Invalid parameter not satisfying: %@", @"boldFont" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v16) {
    goto LABEL_29;
  }
LABEL_3:
  if (a6 <= 0.0) {
    PXAssertGetLog();
  }
  BOOL v39 = a8;
  int64_t v37 = a5;
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v38 = v17;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    char v22 = 0;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v25 length]) {
          [v18 addObject:v25];
        }
        else {
          char v22 = 1;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v21);
  }
  else
  {
    char v22 = 0;
  }

  uint64_t v26 = [v18 count];
  if (v26 < 0) {
    goto LABEL_24;
  }
  uint64_t v27 = v26;
  uint64_t v28 = (v39 | v22) & 1;
  while (1)
  {
    long long v40 = xmmword_1AB359BD0;
    *(_OWORD *)buf = xmmword_1AB359BD0;
    uint64_t v29 = [a1 _stringWithComponentsCount:v27 components:v18 containsOtherPeople:v28 outBoldRange1:buf outBoldRange2:&v40];
    uint64_t v30 = objc_msgSend(a1, "_attributedStringWithString:attributes:boldFont:boldRange1:boldRange2:", v29, v15, v16, *(void *)buf, *(void *)&buf[8], v40);
    if (!objc_msgSend(MEMORY[0x1E4FB1930], "px_isTruncatedForAttributedString:forWidth:lines:", v30, v37, a6))break; {

    }
    if (v27-- <= 0) {
      goto LABEL_24;
    }
  }

  if (!v30)
  {
LABEL_24:
    id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v33 = PXLocalizedStringFromTable(@"PXShareWithFriends_QuestionMark", @"PhotosUICore");
    uint64_t v30 = (void *)[v32 initWithString:v33];
  }
  return v30;
}

@end