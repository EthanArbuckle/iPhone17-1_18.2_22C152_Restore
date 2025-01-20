@interface ICNote
@end

@implementation ICNote

void __64__ICNote_UI__updatePKDrawingsWithHandwritingRecognitionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = (void *)MEMORY[0x1B3E9ED80]();
  v4 = [v10 attachmentModel];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    id v6 = v4;
    [v6 setHandwritingRecognitionEnabled:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v8 = *(unsigned char *)(v7 + 24) == 0;
    *(unsigned char *)(v7 + 24) = 1;
    BOOL v8 = !v8 || *(unsigned char *)(a1 + 40) == 0;
    uint64_t v9 = !v8;
    [v6 setTitleQueryEnabled:v9];
  }
}

void __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_opt_class();
  BOOL v8 = ICDynamicCast();
  char v9 = objc_msgSend(v8, "ic_isSystemTextAttachment");

  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      id v10 = [*(id *)(a1 + 32) attachmentFromObject:v7 createIfNecessary:0];
    }
    else
    {
      id v10 = 0;
    }
    objc_opt_class();
    uint64_t v11 = ICDynamicCast();
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      uint64_t v13 = ICDynamicCast();
      if (!v13) {
        goto LABEL_9;
      }
      v14 = (void *)v13;
      v15 = (objc_class *)objc_opt_class();
      if (v15 != +[ICInlineTextAttachment textAttachmentClassForAttachment:v12])
      {

LABEL_9:
        if (!v7
          || !+[ICTextAttachment textAttachmentIsContent:v7])
        {
          goto LABEL_34;
        }
        v16 = +[ICInlineTextAttachment textAttachmentWithAttachment:v12];
        if (v16) {
          goto LABEL_12;
        }
        v24 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2_cold_1(v12, a3, a4);
        }
        goto LABEL_32;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v7 && [(id)objc_opt_class() isInlineAttachment:v7])
    {
      objc_opt_class();
      v17 = [*(id *)(a1 + 32) attachmentFromObject:v7 createIfNecessary:1];
      v12 = ICDynamicCast();

      [v12 setNeedsInitialFetchFromCloud:1];
LABEL_36:

      goto LABEL_37;
    }
    objc_opt_class();
    v12 = ICDynamicCast();
    objc_opt_class();
    uint64_t v18 = ICDynamicCast();
    v14 = (void *)v18;
    if (v18 && v12)
    {
      v19 = (objc_class *)objc_opt_class();
      if (v19 == +[ICTextAttachment textAttachmentClassForAttachment:v12])goto LABEL_35; {

      }
      v14 = 0;
    }
    else if (v18 && !v12)
    {
      objc_opt_class();
      v20 = [*(id *)(a1 + 32) attachmentFromObject:v14 createIfNecessary:1];
      v12 = ICDynamicCast();

      [v14 setAttachment:v12];
      goto LABEL_35;
    }
    if (!v7 || v14) {
      goto LABEL_35;
    }
    if (!+[ICTextAttachment textAttachmentIsContent:v7]) {
      goto LABEL_34;
    }
    v21 = *(void **)(a1 + 32);
    if (v12)
    {
      v22 = [v21 attachments];
      char v23 = [v22 containsObject:v12];

      if ((v23 & 1) == 0 && ([*(id *)(a1 + 32) canAddAttachment] & 1) == 0) {
        goto LABEL_43;
      }
    }
    else
    {
      if (([v21 canAddAttachment] & 1) == 0)
      {
LABEL_43:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        v28 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v12 shortLoggingDescription];
          v39.location = a3;
          v39.length = a4;
          v30 = NSStringFromRange(v39);
          int v33 = 138412546;
          id v34 = v29;
          __int16 v35 = 2112;
          v36 = v30;
          _os_log_impl(&dword_1B08EB000, v28, OS_LOG_TYPE_DEFAULT, "Removing attachment attribute for attachment that we can't add %@ at %@", (uint8_t *)&v33, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], a3, a4);
        goto LABEL_34;
      }
      objc_opt_class();
      v25 = [*(id *)(a1 + 32) attachmentFromObject:v7 createIfNecessary:1];
      v12 = ICDynamicCast();

      if (!v12)
      {
        v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v40.location = a3;
          v40.length = a4;
          v32 = NSStringFromRange(v40);
          int v33 = 138478083;
          id v34 = v7;
          __int16 v35 = 2112;
          v36 = v32;
          _os_log_impl(&dword_1B08EB000, v31, OS_LOG_TYPE_DEFAULT, "Found an NSTextAttachment with no corresponding ICAttachment: %{private}@ at %@", (uint8_t *)&v33, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], a3, a4);
        v14 = 0;
        v12 = 0;
        goto LABEL_35;
      }
    }
    v16 = +[ICTextAttachment textAttachmentWithAttachment:v12];
    if (v16)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v16, a3, a4);
LABEL_33:

LABEL_34:
      v14 = 0;
      goto LABEL_35;
    }
    v24 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v12 shortLoggingDescription];
      v38.location = a3;
      v38.length = a4;
      v27 = NSStringFromRange(v38);
      int v33 = 138412546;
      id v34 = v26;
      __int16 v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_1B08EB000, v24, OS_LOG_TYPE_DEFAULT, "Found an attachment that we could not create a text attachment for: %@ at %@", (uint8_t *)&v33, 0x16u);
    }
LABEL_32:

    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], a3, a4);
    goto LABEL_33;
  }
LABEL_37:
}

uint64_t __66__ICNote_UI__textStorage_willProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willChangeValueForKey:@"isEmpty"];
}

uint64_t __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_272(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeValueForKey:@"isEmpty"];
}

uint64_t __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willChangeValueForKey:@"isEmpty"];
}

uint64_t __65__ICNote_UI__textStorage_didProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "filterAttachmentsInTextStorage:range:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  objc_opt_class();
  v2 = ICDynamicCast();
  objc_msgSend(v2, "styleTextInRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));

  [*(id *)(a1 + 32) didChangeNoteText];
  if (objc_msgSend(*(id *)(a1 + 32), "regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:", *(void *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 72)))objc_msgSend(*(id *)(a1 + 32), "markShareDirtyIfNeededWithReason:", @"Did process editing for text storage"); {
  v3 = *(void **)(a1 + 32);
  }
  return [v3 didChangeValueForKey:@"isEmpty"];
}

void __61__ICNote_UI__checklistStyleAccessibilityDescriptionForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = [v14 style] == 103;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v8 + 24) = v9;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    char v11 = 1;
    v12 = v14;
  }
  else
  {
    BOOL v13 = [v14 style] == 103;
    v12 = v14;
    char v11 = !v13;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v10 + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a5 = 1;
  }
}

uint64_t __26__ICNote_HTML__htmlString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = @"object";
  return [MEMORY[0x1E4F83418] htmlObjectAttributesForAttachmentWithContentID:a2];
}

id __45__ICNote_HTML__htmlStringWithHTMLAttachments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [*(id *)(a1 + 32) attachmentWithIdentifier:a2];
  id v7 = [v6 attachmentModel];
  int v8 = [v7 canConvertToHTMLForSharing];

  if (v8)
  {
    BOOL v9 = [v6 attachmentModel];
    uint64_t v10 = [v9 attributesForSharingHTMLWithTagName:a3 textContent:a4];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

intptr_t __62__ICNote_HTML__mutableAttributedStringFromHTMLString_baseURL___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 mutableCopy];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v6 = a1[4];
  return dispatch_semaphore_signal(v6);
}

void __49__ICNote_HTML__fixDashedListsInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v23 = v7;
    int v8 = [v7 textLists];
    uint64_t v9 = [v8 count];

    id v7 = v23;
    if (v9)
    {
      uint64_t v10 = [v23 textLists];
      char v11 = (void *)[v10 mutableCopy];

      if ([v11 count])
      {
        uint64_t v22 = a3;
        char v12 = 0;
        unint64_t v13 = 0;
        do
        {
          id v14 = [v11 objectAtIndexedSubscript:v13];
          v15 = [v14 markerFormat];
          int v16 = [v15 isEqualToString:@"{upper-roman}"];

          if (v16)
          {
            v17 = objc_msgSend(objc_alloc((Class)fixDashedListsInAttributedString__NSTextListClass), "initWithMarkerFormat:options:", @"{hyphen}", objc_msgSend(v14, "listOptions"));
            objc_msgSend(v17, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
            [v11 setObject:v17 atIndexedSubscript:v13];

            char v12 = 1;
          }

          ++v13;
        }
        while (v13 < [v11 count]);
        if (v12)
        {
          uint64_t v18 = (void *)[v23 mutableCopy];
          [v18 setTextLists:v11];
          v19 = *(void **)(a1 + 32);
          uint64_t v20 = *MEMORY[0x1E4FB0738];
          v21 = (void *)[v18 copy];
          objc_msgSend(v19, "addAttribute:value:range:", v20, v21, v22, a4);
        }
      }

      id v7 = v23;
    }
  }
}

void __43__ICNote_HTML__fixFontsInAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7) {
    goto LABEL_21;
  }
  id v26 = v7;
  int v8 = [v7 familyName];
  if (([v8 containsString:@"Times New Roman"] & 1) == 0)
  {
    uint64_t v9 = [v26 familyName];
    if (([v9 isEqualToString:@"Times"] & 1) == 0)
    {
      uint64_t v10 = [v26 familyName];
      if (([v10 containsString:@"Helvetica"] & 1) == 0)
      {
        char v11 = [v26 familyName];
        if (([v11 containsString:@"Noteworthy"] & 1) == 0)
        {
          v24 = [v26 familyName];
          char v25 = [v24 containsString:@"Marker Felt"];

          id v7 = v26;
          if ((v25 & 1) == 0) {
            goto LABEL_21;
          }
          goto LABEL_10;
        }
      }
    }
  }
LABEL_10:
  char v12 = [a1[4] attribute:*MEMORY[0x1E4F83230] atIndex:a3 effectiveRange:0];
  unint64_t v13 = v12;
  if (v12) {
    BOOL v14 = [v12 integerValue] == 0;
  }
  else {
    BOOL v14 = 1;
  }
  [v26 pointSize];
  if (v15 < 18.0)
  {
    [a1[5] pointSize];
    double v17 = v18;
    if (!v14)
    {
      +[ICTTTextController superscriptScaleFactor];
      double v17 = round(v17 * v19);
    }
  }
  else
  {
    [v26 pointSize];
    double v17 = v16;
  }
  uint64_t v20 = [v26 fontDescriptor];
  uint64_t v21 = [v20 symbolicTraits];
  id v22 = [a1[6] fontDescriptorWithSymbolicTraits:v21];
  if (!v22)
  {
    id v22 = [a1[6] fontDescriptorWithSymbolicTraits:v21 & 0xEFFFFFFF];
    if (!v22) {
      id v22 = a1[6];
    }
  }
  id v23 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v22 size:v17];
  objc_msgSend(a1[4], "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v23, a3, a4);

  id v7 = v26;
LABEL_21:
}

uint64_t __48__ICNote_HTML__fixTextColorsInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend(a2, "ic_isBlack");
  if (result)
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = NSNumber;
    id v6 = a2;
    id v7 = [v5 numberWithUnsignedInteger:a3];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v52 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 72), "tagDictionariesForAttributes:attachmentConversionHandler:");
  uint64_t v6 = [v5 count];
  long long v76 = 0u;
  long long v77 = 0u;
  BOOL v55 = v6 == 0;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (!v7)
  {

    if (v6)
    {
      int v8 = 0;
      goto LABEL_36;
    }
    goto LABEL_21;
  }
  int v8 = 0;
  uint64_t v9 = *(void *)v77;
  do
  {
    uint64_t v10 = 0;
    char v11 = v8;
    do
    {
      if (*(void *)v77 != v9) {
        objc_enumerationMutation(obj);
      }
      char v12 = *(void **)(*((void *)&v76 + 1) + 8 * v10);
      unint64_t v13 = [v12 objectForKeyedSubscript:@"TagName"];
      uint64_t v14 = [v12 objectForKeyedSubscript:@"Attributes"];
      double v15 = (void *)v14;
      double v16 = &stru_1F0973378;
      if (v14) {
        double v16 = (__CFString *)v14;
      }
      double v17 = v16;

      if ((unint64_t)[(__CFString *)v17 length] >= 2)
      {
        double v18 = -[__CFString substringWithRange:](v17, "substringWithRange:", 0, 1);
        char v19 = [v18 isEqualToString:@" "];

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = [NSString stringWithFormat:@" %@", v17];

          double v17 = (__CFString *)v20;
        }
      }
      int v8 = [v12 objectForKeyedSubscript:@"TextContent"];

      [*(id *)(a1 + 32) appendFormat:@"<%@%@", v13, v17];
      if ([*(id *)(a1 + 40) containsObject:v13]) {
        [*(id *)(a1 + 32) appendString:@"/"];
      }
      else {
        BOOL v55 = 1;
      }
      [*(id *)(a1 + 32) appendString:@">"];

      ++v10;
      char v11 = v8;
    }
    while (v7 != v10);
    uint64_t v7 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
  }
  while (v7);

  if (v55)
  {
    if (v8)
    {
LABEL_35:
      [*(id *)(a1 + 32) appendString:v8];
      goto LABEL_36;
    }
LABEL_21:
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__3;
    v74 = __Block_byref_object_dispose__3;
    uint64_t v21 = [*(id *)(a1 + 48) string];
    objc_msgSend(v21, "substringWithRange:", a3, a4);
    id v75 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = objc_msgSend((id)v71[5], "ic_stringReplacingUnsafeHTMLCharacters");
    id v23 = (void *)v71[5];
    v71[5] = v22;

    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    char v25 = *(void **)(a1 + 56);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_3;
    v66[3] = &unk_1E5FD9748;
    long long v69 = *(_OWORD *)(a1 + 80);
    v68 = &v70;
    id v56 = v24;
    id v67 = v56;
    [v25 enumerateKeysAndObjectsUsingBlock:v66];
    if ([v56 count])
    {
      id v26 = [MEMORY[0x1E4F28E78] string];
      v27 = [v56 allKeys];
      v28 = [v27 sortedArrayUsingSelector:sel_compare_];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v54 = v28;
      uint64_t v29 = 0;
      uint64_t v30 = [v54 countByEnumeratingWithState:&v62 objects:v81 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(v54);
            }
            int v33 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            uint64_t v34 = [v33 unsignedIntegerValue] - *(void *)(a1 + 80);
            __int16 v35 = objc_msgSend((id)v71[5], "substringWithRange:", v29, v34 - v29);
            [v26 appendFormat:@"<span>%@</span>", v35];
            v36 = [v56 objectForKeyedSubscript:v33];
            [v26 appendString:v36];

            uint64_t v29 = v34 + 1;
          }
          uint64_t v30 = [v54 countByEnumeratingWithState:&v62 objects:v81 count:16];
        }
        while (v30);
      }

      uint64_t v37 = objc_msgSend((id)v71[5], "substringWithRange:", v29, objc_msgSend((id)v71[5], "length") - v29);
      if ([v37 length]) {
        [v26 appendFormat:@"<span>%@</span>", v37];
      }
      uint64_t v38 = [v26 copy];
      NSRange v39 = (void *)v71[5];
      v71[5] = v38;
    }
    NSRange v40 = (void *)v71[5];
    v41 = objc_msgSend(NSString, "ic_attachmentCharacterString");
    uint64_t v42 = [v40 stringByReplacingOccurrencesOfString:v41 withString:&stru_1F0973378];
    v43 = (void *)v71[5];
    v71[5] = v42;

    v44 = (void *)v71[5];
    v45 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    int v8 = [v44 stringByTrimmingCharactersInSet:v45];

    if (![(__CFString *)v8 length])
    {

      int v8 = @"<br>";
    }

    _Block_object_dispose(&v70, 8);
    goto LABEL_35;
  }
LABEL_36:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v46 = [obj reverseObjectEnumerator];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v58 objects:v80 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v46);
        }
        v50 = [*(id *)(*((void *)&v58 + 1) + 8 * j) objectForKeyedSubscript:@"TagName"];
        if (([*(id *)(a1 + 40) containsObject:v50] & 1) == 0) {
          [*(id *)(a1 + 32) appendFormat:@"</%@>", v50];
        }
      }
      uint64_t v47 = [v46 countByEnumeratingWithState:&v58 objects:v80 count:16];
    }
    while (v47);
  }
}

void __75__ICNote_HTML__htmlStringFromAttributedString_attachmentConversionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  unint64_t v6 = [v21 unsignedIntegerValue];
  unint64_t v7 = *(void *)(a1 + 48);
  BOOL v9 = v6 >= v7;
  unint64_t v8 = v6 - v7;
  BOOL v9 = !v9 || v8 >= *(void *)(a1 + 56);
  if (!v9)
  {
    unint64_t v10 = [v21 unsignedIntegerValue] - *(void *)(a1 + 48);
    if (v10 < [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
    {
      char v11 = [MEMORY[0x1E4F28E78] stringWithString:@"<picture>"];
      char v12 = [v5 imageContent];
      unint64_t v13 = [v12 base64EncodedStringWithOptions:0];

      objc_msgSend(v11, "appendFormat:", @"<source srcset=\"data:image/x-apple-adaptive-glyph;base64,%@\" type=\"image/x-apple-adaptive-glyph\">",
        v13);
      uint64_t v14 = (void *)MEMORY[0x1E4FB1818];
      double v15 = [v5 imageContent];
      double v16 = [v14 imageWithData:v15];
      double v17 = UIImagePNGRepresentation(v16);
      double v18 = [v17 base64EncodedStringWithOptions:0];

      char v19 = [v5 contentDescription];
      uint64_t v20 = objc_msgSend(v19, "ic_stringReplacingUnsafeXMLCharacters");
      [v11 appendFormat:@"<img src=\"data:image/png;base64,%@\" alt=\"%@\">", v18, v20];

      [v11 appendString:@"</picture>"];
      [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v21];
    }
  }
}

void __57__ICNote_UI__rangesModifiedAfterTimestamp_inTextStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }
}

void __51__ICNote_UI__noteDidMergeNoteDocumentWithUserInfo___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        unint64_t v8 = objc_msgSend(a1[5], "authorHighlightsController", (void)v18);
        uint64_t v9 = [v7 rangeValue];
        uint64_t v11 = v10;
        char v12 = [a1[6] textStorage];
        objc_msgSend(v8, "extendHighlightsForRange:inTextStorage:", v9, v11, v12);

        if ([a1[6] isSharedViaICloud]
          && ([a1[6] isFastSyncSessionActive] & 1) == 0)
        {
          unint64_t v13 = [a1[5] authorHighlightsController];
          uint64_t v14 = [v7 rangeValue];
          uint64_t v16 = v15;
          double v17 = [a1[6] textStorage];
          objc_msgSend(v13, "flashHighlightsForRange:withDuration:inTextStorage:", v14, v16, 0, v17);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

void __39__ICNote_UI__hasMentionForParticipant___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = a2;
  BOOL v7 = [v10 attachmentType] == 2;
  unint64_t v8 = v10;
  if (v7)
  {
    uint64_t v9 = [v10 tokenContentIdentifier];
    if (([v9 isEqualToString:a1[4]] & 1) != 0
      || [v9 isEqualToString:a1[5]])
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a5 = 1;
    }

    unint64_t v8 = v10;
  }
}

uint64_t __55__ICNote_UI__outlineControllerCollapsedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveOutlineState];
}

id __58__ICNote_UI__noteActivityItemsForSharingWithNoteExporter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isSharable])
  {
    uint64_t v3 = [WeakRetained textStorage];
    uint64_t v4 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v5 = [v3 standardizedAttributedStringFixingTextAttachmentsInContext:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __39__ICNote_UI__airDropActivityItemSource__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)[WeakRetained newAirDropDocument];

  return v2;
}

void __56__ICNote_UI__attachmentActivityItemsForSharingForRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v20.location = a3;
  v20.length = a4;
  if (NSIntersectionRange(*(NSRange *)(a1 + 40), v20).length && ([v7 isTable] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v8 = objc_msgSend(v7, "activityItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v13 isFileURL]) {
            [*(id *)(a1 + 32) addObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void __51__ICNote_UI__appendAttributedString_options_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textStorage];
  uint64_t v3 = [v2 length];

  uint64_t v4 = [*(id *)(a1 + 32) textStorage];
  uint64_t v5 = [v4 string];
  int v6 = [v5 hasSuffix:@"\n\n"];

  if (v6)
  {
    --v3;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) textStorage];
    if ([v7 length])
    {
      unint64_t v8 = [*(id *)(a1 + 32) textStorage];
      uint64_t v9 = [v8 string];
      char v10 = [v9 hasSuffix:@"\n"];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [*(id *)(a1 + 32) textStorage];
        objc_msgSend(v11, "replaceCharactersInRange:withString:", v3, 0, @"\n");

        uint64_t v12 = v3 + 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v12 = v3;
LABEL_8:
  unint64_t v13 = [*(id *)(a1 + 32) textStorage];
  objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v12, 0, *(void *)(a1 + 40));

  id v16 = [*(id *)(a1 + 32) textStorage];
  long long v14 = [MEMORY[0x1E4F1C9C8] now];
  long long v15 = [*(id *)(a1 + 32) textStorage];
  objc_msgSend(v16, "setTimestamp:range:", v14, v3, objc_msgSend(v15, "length") - v3);
}

uint64_t __78__ICNote_UI__duplicateNote_intoFolder_isPasswordProtected_removeOriginalNote___block_invoke()
{
  return [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Saved while duplicating note"];
}

uint64_t __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isVisible])
  {
    uint64_t v3 = [v2 attachmentModel];
    uint64_t v4 = [v3 showThumbnailInNoteList];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke_246(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7)
  {
    id v17 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v17 attachmentIdentifier];
      char v10 = [v8 attachmentWithIdentifier:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v10 = [v17 attachment];
      }
      else
      {
        char v10 = 0;
      }
    }
    uint64_t v11 = [v10 attachmentModel];
    int v12 = [v11 showThumbnailInNoteList];

    if (v12)
    {
      unint64_t v13 = [v10 identifier];
      uint64_t v14 = [v13 copy];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      *a5 = 1;
    }

    id v7 = v17;
  }
}

void __140__ICNote_UI__thumbnailImageWithMinSize_scale_appearanceType_requireAppearance_imageScaling_showAsFileIcon_isMovie_movieDuration_attachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  unint64_t v8 = [v7 attachmentModel];
  int v9 = [v8 showThumbnailInNoteList];

  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    double v11 = *(double *)(a1 + 48);
    double v12 = *(double *)(a1 + 56);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 112);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 88);
    double v18 = *(double *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 96);
    obuint64_t j = *(id *)(v10 + 40);
    int v19 = objc_msgSend(v7, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", &obj, v14, v13, v15, v16, v17, v18, v11, v12, v25);
    objc_storeStrong((id *)(v10 + 40), obj);
    *a5 = v19;
    if (v19)
    {
      if (!*(void *)(a1 + 104) || (**(void **)(a1 + 104) = v7, *a5))
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
        {
          NSRange v20 = [v7 attachmentModel];
          long long v21 = [v20 genericListThumbnailCreator];

          if (v21)
          {
            uint64_t v22 = v21[2](v21, *(double *)(a1 + 56));
            uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
            v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v22;

            if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
            {
              **(void **)(a1 + 72) = 1;
              **(unsigned char **)(a1 + 80) = 0;
            }
          }
        }
      }
    }
  }
}

void __113__ICNote_UI__fetchThumbnailImageWithMinSize_scale_cache_appearanceInfo_cacheKey_processingBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v20 = a2;
  id v7 = [v20 attachmentModel];
  int v8 = [v7 showThumbnailInNoteList];

  int v9 = v20;
  if (v8)
  {
    double v10 = *(double *)(a1 + 104);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = [v20 attachmentModel];
    uint64_t v17 = [v16 genericListThumbnailCreator];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(v20, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v11, v12, v13, v14, v15, v17, *(double *)(a1 + 88), *(double *)(a1 + 96), v10, 0);

    char v18 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v18)
    {
      int v19 = [v20 identifier];
      [*(id *)(a1 + 56) setThumbnailAttachmentIdentifier:v19];

      char v18 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    *a5 = v18;
    int v9 = v20;
  }
}

uint64_t __60__ICNote_UI__noteDidApplyAttachmentViewTypeToAllAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  objc_opt_class();
  uint64_t v13 = ICDynamicCast();

  if (v13 && [v13 supportsMultiplePresentationSizes])
  {
    [*(id *)(a1 + 32) addObject:v13];
    int v8 = *(void **)(a1 + 40);
    int v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v8 addObject:v9];

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11.location = *(void *)(v10 + 32);
    if (v11.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v10 + 32) = a3;
      *(void *)(v10 + 40) = a4;
    }
    else
    {
      v11.length = *(void *)(v10 + 40);
      v15.location = a3;
      v15.length = a4;
      *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(v11, v15);
    }
  }
  return MEMORY[0x1F4181820]();
}

void __18__ICNote_UI__save__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if ([v9 hasChanges])
  {
    id v7 = [v9 changedValues];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
}

uint64_t __36__ICNote_UI__textStorageWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willChangeValueForKey:@"isEmpty"];
}

uint64_t __35__ICNote_UI__textStorageDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didChangeValueForKey:@"isEmpty"];
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F09A5DB0])
  {
    uint64_t v4 = ICProtocolCast();
    uint64_t v5 = [v4 attachmentIdentifier];

    if (v5)
    {
      int v6 = (void *)MEMORY[0x1E4F832A0];
      id v7 = [v4 attachmentIdentifier];
      uint64_t v8 = [*(id *)(a1 + 32) managedObjectContext];
      os_log_t v9 = [v6 attachmentWithIdentifier:v7 context:v8];

      if (v9)
      {
        uint64_t v10 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(a1, v9);
        }

        [v9 updateMarkedForDeletionStateAttachmentIsInUse:*(unsigned char *)(a1 + 40) == 0];
      }
      else
      {
        NSRange v11 = (void *)MEMORY[0x1E4F833A0];
        uint64_t v12 = [v4 attachmentIdentifier];
        uint64_t v13 = [*(id *)(a1 + 32) managedObjectContext];
        uint64_t v14 = [v11 attachmentWithIdentifier:v12 context:v13];

        if (v14)
        {
          NSRange v15 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(a1, v14);
          }

          [v14 updateMarkedForDeletionStateInlineAttachmentIsInUse:*(unsigned char *)(a1 + 40) == 0];
        }
      }
    }
    else
    {
      os_log_t v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_1();
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_4();
    }
    goto LABEL_19;
  }
LABEL_20:
}

void __42__ICNote_UI__firstAttachmentInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

uint64_t __49__ICNote_UI__addHashtagToNoteBody_onlyIfMissing___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 isHashtagAttachment];
  if (result)
  {
    uint64_t v10 = [*(id *)(a1 + 32) textStorage];
    NSRange v11 = [v10 string];
    uint64_t v12 = objc_msgSend(v11, "paragraphRangeForRange:", a3, a4);
    uint64_t v14 = v13;

    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isHashtagRowAtRange:outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:", v12, v14, *(void *)(*(void *)(a1 + 40) + 8) + 32, 0, 0, 0);
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
  return result;
}

void __28__ICNote_UI__removeHashtag___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if ([v7 attachmentType] == 1)
  {
    uint64_t v8 = [v7 tokenContentIdentifier];
    os_log_t v9 = [a1[4] standardizedContent];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      uint64_t v64 = 0;
      uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
      NSRange v11 = [a1[4] displayText];
      objc_msgSend(v11, "ic_withHashtagPrefix");
      long long v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

      uint64_t v12 = [a1[5] textStorage];
      uint64_t v13 = [v12 string];
      uint64_t v14 = objc_msgSend(v13, "paragraphRangeForRange:", a3, a4);
      id v63 = v7;
      uint64_t v16 = v15;

      if (objc_msgSend(a1[5], "isHashtagRowAtRange:outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:", v14, v16, 0, &v65, v7, &v64))
      {
        if (a3)
        {
          while (1)
          {
            uint64_t v17 = a3 - 1;
            char v18 = objc_msgSend(a1[5], "textStorage", v62);
            int v19 = [v18 string];
            uint64_t v20 = [v19 characterAtIndex:a3 - 1];

            if (a3 - 2 < 0)
            {
              int v25 = 1;
            }
            else
            {
              long long v21 = [a1[5] textStorage];
              uint64_t v22 = [v21 string];
              uint64_t v23 = [v22 characterAtIndex:a3 - 2];

              v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              int v25 = [v24 characterIsMember:v23];
            }
            if (v64 == 1)
            {
              id v26 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
              int v27 = [v26 characterIsMember:v20] & v25;

              if (v27 == 1) {
                break;
              }
            }
            v28 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            int v29 = [v28 characterIsMember:v20];

            if (!v29)
            {
              uint64_t v17 = a3;
              goto LABEL_17;
            }
            ++a4;
            --a3;
            if (!v17) {
              goto LABEL_17;
            }
          }
          ++a4;
        }
        else
        {
          uint64_t v17 = 0;
        }
LABEL_17:
        char v31 = 0;
        while (1)
        {
          v32 = objc_msgSend(a1[5], "textStorage", v62);
          int v33 = [v32 string];
          unint64_t v34 = [v33 length];

          if (v17 + a4 >= v34 || (v31 & 1) != 0) {
            break;
          }
          __int16 v35 = [a1[5] textStorage];
          v36 = [v35 string];
          uint64_t v37 = [v36 characterAtIndex:v17 + a4];

          uint64_t v38 = [a1[5] textStorage];
          NSRange v39 = [v38 string];
          unint64_t v40 = [v39 length];

          if (v40 >= v17 + a4 + 2)
          {
            uint64_t v42 = [a1[5] textStorage];
            v43 = [v42 string];
            uint64_t v44 = [v43 characterAtIndex:v17 + a4 + 1];

            v45 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            char v41 = [v45 characterIsMember:v44];
          }
          else
          {
            char v41 = 1;
          }
          if (v64 == 1
            && ([MEMORY[0x1E4F28B88] newlineCharacterSet],
                v46 = objc_claimAutoreleasedReturnValue(),
                char v47 = [v46 characterIsMember:v37] & v41,
                v46,
                (v47 & 1) != 0))
          {
            char v31 = 1;
          }
          else
          {
            uint64_t v48 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            int v49 = [v48 characterIsMember:v37];

            if (!v49) {
              break;
            }
            char v31 = 0;
          }
          ++a4;
        }
        BOOL v50 = v65 == v64 - 1 || v65 == 0;
        v51 = @" ";
        if (v50) {
          v51 = &stru_1F0973378;
        }
        uint64_t v30 = v51;

        id v7 = v63;
      }
      else
      {
        uint64_t v17 = a3;
        uint64_t v30 = v62;
      }
      id v52 = objc_msgSend(a1[5], "textStorage", v62);
      objc_msgSend(v52, "replaceCharactersInRange:withString:", v17, a4, v30);

      [a1[6] addObject:v7];
      v53 = [a1[5] textStorage];
      id v54 = [v53 string];
      BOOL v55 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v56 = [v54 stringByTrimmingCharactersInSet:v55];
      uint64_t v57 = [v56 length];

      if (!v57)
      {
        long long v58 = [a1[5] textStorage];
        long long v59 = [a1[5] textStorage];
        uint64_t v60 = objc_msgSend(v59, "ic_range");
        objc_msgSend(v58, "replaceCharactersInRange:withString:", v60, v61, &stru_1F0973378);
      }
    }
  }
}

uint64_t __101__ICNote_UI__isHashtagRowAtRange_outRangeForAppending_outIndex_forHashtagAttachment_outHashtagCount___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  objc_opt_class();
  uint64_t v12 = ICDynamicCast();

  if (v12 && ([v12 isHashtagAttachment] & 1) != 0)
  {
    uint64_t v10 = *(void *)(a1[6] + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    if (v12 == (void *)a1[4]) {
      *(void *)(*(void *)(a1[8] + 8) + 24) = *(void *)(*(void *)(a1[7] + 8) + 24) - 1;
    }
  }
  else
  {
    *a5 = 1;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  return MEMORY[0x1F41817F8]();
}

void __53__ICNote_UI__icaxGalleryViewCustomContentDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _icaxGalleryViewDescriptionForAttachment:a2 fromAttachments:*(void *)(a1 + 40) orInlineAttachments:*(void *)(a1 + 48)];
    uint64_t v8 = (void *)v7;
    id v9 = &stru_1F0973378;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    uint64_t v10 = v9;

    objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withString:", a3, a4, v10);
  }
}

void __53__ICNote_UI__icaxGalleryViewCustomContentDescription__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v6 = a2;
  id v20 = objc_alloc_init(v5);
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();

  int v8 = [v7 style];
  if (!(!v10 & v9))
  {
    switch(v8)
    {
      case 0:
        NSRange v11 = (void *)MEMORY[0x1E4F83770];
        uint64_t v12 = @"Title";
        goto LABEL_12;
      case 1:
        NSRange v11 = (void *)MEMORY[0x1E4F83770];
        uint64_t v12 = @"Heading";
        goto LABEL_12;
      case 2:
        NSRange v11 = (void *)MEMORY[0x1E4F83770];
        uint64_t v12 = @"Subheading";
        goto LABEL_12;
      case 3:
        goto LABEL_20;
      case 4:
        NSRange v11 = (void *)MEMORY[0x1E4F83770];
        uint64_t v12 = @"monostyled";
        goto LABEL_12;
      default:
        JUMPOUT(0);
    }
  }
  switch(v8)
  {
    case 'd':
      NSRange v11 = (void *)MEMORY[0x1E4F83770];
      uint64_t v12 = @"bullet";
      goto LABEL_12;
    case 'e':
      NSRange v11 = (void *)MEMORY[0x1E4F83770];
      uint64_t v12 = @"dash";
LABEL_12:
      uint64_t v13 = [v11 localizedFrameworkStringForKey:v12 value:v12 table:0 allowSiri:1];
      uint64_t v15 = (void *)[v13 mutableCopy];
      goto LABEL_18;
    case 'f':
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_icaxItemNumberForParagraphAtLocation:withStyle:inAttrString:", a3, v7, *(void *)(a1 + 40)));
      uint64_t v14 = [v20 stringFromNumber:v13];
      goto LABEL_17;
    case 'g':
      uint64_t v13 = [v7 todo];
      if ([v13 done]) {
        uint64_t v16 = @"checklist, completed";
      }
      else {
        uint64_t v16 = @"checklist, incomplete";
      }
      uint64_t v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v16 value:v16 table:0 allowSiri:1];
LABEL_17:
      uint64_t v17 = v14;
      uint64_t v15 = (void *)[v14 mutableCopy];

LABEL_18:
      if (v15)
      {
        [v15 appendString:@", "];
        char v18 = *(void **)(a1 + 40);
        int v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
        [v18 insertAttributedString:v19 atIndex:a3];
      }
      break;
    default:
      break;
  }
LABEL_20:
}

void __75__ICNote_UI___icaxItemNumberForParagraphAtLocation_withStyle_inAttrString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v13 = a2;
  if ([v13 style] == 102
    && (uint64_t v7 = [v13 indent], v7 == objc_msgSend(*(id *)(a1 + 32), "indent")))
  {
    if ([v13 startingItemNumber]) {
      uint64_t v8 = [v13 startingItemNumber];
    }
    else {
      uint64_t v8 = 1;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v8;
    char v10 = v13;
  }
  else
  {
    BOOL v9 = [v13 style] == 102;
    char v10 = v13;
    if (!v9
      || (v11 = [v13 indent], v12 = v11 >= objc_msgSend(*(id *)(a1 + 32), "indent"), char v10 = v13, !v12))
    {
      *a5 = 1;
    }
  }
}

id __26__ICNote_UI__ic_wordCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ic_trimmedString");
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) textStorage];
  uint64_t v4 = [v3 length];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v5 textStorage];
  objc_msgSend(v5, "filterAttachmentsInTextStorage:range:", v6, 0, v4);

  uint64_t v7 = [*(id *)(a1 + 40) textStorage];
  uint64_t v8 = objc_msgSend(v7, "copyDataForUTI:range:persistenceHelper:", *(void *)(a1 + 32), 0, v4, *(void *)(a1 + 40));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  unint64_t v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = [*(id *)(a1 + 40) shortLoggingDescription];
    int v15 = 134218498;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_debug_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEBUG, "Got %ld bytes for %@ %@", (uint8_t *)&v15, 0x20u);
  }
}

uint64_t __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      uint64_t v23 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_cold_1(v13, v23);
      }
    }
    goto LABEL_16;
  }
  uint64_t v14 = [v10 textStorage];
  int v15 = [v10 textStorage];
  objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v15, "length"), v11);

  uint64_t v16 = [v10 textStorage];
  [v16 resetUndoManager];

  [v10 markAsCallNoteIfAttachmentIsCallRecording];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  __int16 v17 = [v10 attachments];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v21++) setRemoteFileURL:0];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v19);
  }

  if (!v9)
  {
    objc_opt_class();
    v24 = ICCheckedDynamicCast();
    int v25 = [v24 defaultStoreForNewNote];

    id v26 = v25;
    int v27 = [ICCopyModernNotesToLegacyAccountOperation alloc];
    id v39 = v10;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_2;
    v33[3] = &unk_1E5FDB9E0;
    uint64_t v29 = *(void *)(a1 + 32);
    id v34 = *(id *)(a1 + 40);
    uint64_t v30 = [(ICCopyModernNotesToLegacyAccountOperation *)v27 initWithNotes:v28 toFolder:v26 legacyContext:v29 didCopyBlock:v33];

    char v31 = [MEMORY[0x1E4F28F08] mainQueue];
    [v31 addOperation:v30];

LABEL_16:
    uint64_t v22 = 0;
    goto LABEL_17;
  }
  [v10 setFolder:v9];
  uint64_t v22 = 1;
LABEL_17:

  return v22;
}

uint64_t __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [MEMORY[0x1E4F83418] deleteNote:a2];
  if (v7)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    }
  }
  return MEMORY[0x1F41817F8](v5);
}

void __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2_cold_1(void *a1, NSUInteger a2, NSUInteger a3)
{
  uint64_t v5 = [a1 shortLoggingDescription];
  v13.location = a2;
  v13.length = a3;
  id v6 = NSStringFromRange(v13);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v7, v8, "Found a token text attachment that we could not create a text attachment for: %@ at %@", v9, v10, v11, v12, 2u);
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_1()
{
  objc_opt_class();
  v0 = ICDynamicCast();
  v1 = [v0 attachment];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v2, v3, "attempted to update an attachment without an identifier: %@ %@", v4, v5, v6, v7, 2u);
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_1B08EB000, v3, v4, "Ensuring markedForDeletion=%d for inline attachment %@ after finding it in an attributed string", v5, v6, v7, v8, v9);
}

void __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B08EB000, v0, OS_LOG_TYPE_ERROR, "found a non-ICTTAttachment attachment: %@", v1, 0xCu);
}

void __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) shortLoggingDescription];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Getting %@ data for %@", (uint8_t *)&v5, 0x16u);
}

void __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error copying values to note %@", (uint8_t *)&v4, 0xCu);
}

@end