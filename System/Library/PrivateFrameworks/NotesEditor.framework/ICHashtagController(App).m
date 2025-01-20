@interface ICHashtagController(App)
+ (uint64_t)rangeOfUnconfirmedHashtagInTextStorage:()App;
+ (void)addUnconfirmedAttributeToTextStorage:()App atRange:;
- (BOOL)isEmoji:()App;
- (__CFString)currentUnconfirmedHashtagString:()App textStorage:;
- (uint64_t)insertHashtagWithText:()App viaAutoComplete:parentAttachment:;
- (uint64_t)isExistingHashtag:()App hashtagSuggestionsArray:;
- (uint64_t)isValidElement:()App;
- (uint64_t)isValidPostfixCharacter:()App;
- (uint64_t)isValidPostfixString:()App;
- (uint64_t)range:()App hasValidPostfixCharacterForString:;
- (unint64_t)rangeToCheckForHashtagCreation:()App;
- (void)_checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:;
- (void)clearUnconfirmedHashtagInTextStorage:()App;
- (void)createNewHashtagIfNecessary:()App textStorage:ignoreDelimiter:parentAttachment:;
- (void)dismissAutoCompletionView;
- (void)insertHashtagAttachment:()App toTextView:range:viaAutoComplete:delimiter:;
- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:;
- (void)updateAutoCompletionView:()App range:textView:ofTextStorage:;
- (void)updatePredictiveBar:()App;
- (void)updateUIWhenAutoConversionOff:()App textStorage:;
@end

@implementation ICHashtagController(App)

- (void)_checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:
{
  uint64_t v16 = a9;
  id v67 = a5;
  id v17 = a7;
  id v18 = a11;
  if ([a1 allowsHashtag])
  {
    int v19 = objc_msgSend(v67, "hasNamedStyle:inRange:", 4, a3, a4);
    if ((v19 & 1) != 0 || a4)
    {
      if (v19) {
        goto LABEL_5;
      }
    }
    else
    {
      objc_opt_class();
      v20 = [v17 typingAttributes];
      [v20 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
      id v21 = v17;
      int v22 = a8;
      v24 = id v23 = v18;
      v25 = ICDynamicCast();
      int v26 = [v25 style];

      id v18 = v23;
      a8 = v22;
      id v17 = v21;
      uint64_t v16 = a9;
      a4 = 0;

      if (v26 == 4)
      {
LABEL_5:
        [a1 clearUnconfirmedHashtagInTextStorage:v67];
        goto LABEL_31;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v27 = ICDynamicCast();
      [a1 setTableTextView:v27];
    }
    else
    {
      [a1 setTableTextView:0];
    }
    unint64_t v28 = [a1 maxLengthOfStringForCheckingHashtag] + 1;
    unint64_t v29 = a4;
    unint64_t v30 = a3;
    unint64_t v31 = v28 - a4;
    if (v28 > a4)
    {
      unint64_t v29 = a4;
      unint64_t v30 = a3;
      if ((v16 & 1) == 0)
      {
        BOOL v32 = a3 >= v31;
        unint64_t v33 = a3 - v31;
        if (v32) {
          unint64_t v30 = v33;
        }
        else {
          unint64_t v30 = 0;
        }
        uint64_t v34 = [v67 length];
        if (v28 >= v34 - v30) {
          unint64_t v29 = v34 - v30;
        }
        else {
          unint64_t v29 = v28;
        }
      }
    }
    uint64_t v35 = [v17 selectedRange];
    v37 = objc_msgSend(a1, "checkForHashtagInString:inRange:selectionRange:languageHasSpaces:", v67, v30, v29, v35, v36, a10);
    v38 = v37;
    if (v37
      && ([v37 matchingHashtagSuggestions],
          v39 = objc_claimAutoreleasedReturnValue(),
          v39,
          v39)
      && (v16 & 1) == 0)
    {
      int v40 = a8;
      uint64_t v41 = [v38 rangeOfHashtag];
      uint64_t v43 = v42;
      if (objc_msgSend(v67, "containsAttachmentsInRange:", v41, v42))
      {
        [a1 clearUnconfirmedHashtagInTextStorage:v67];
LABEL_30:

        goto LABEL_31;
      }
      id v66 = v18;
      if (v41 + v43 == a3 + a4)
      {
        v50 = [v67 string];
        if (objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", v41, v43, v50))
        {

LABEL_38:
          objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v67, v41, v43);
          v51 = [v38 matchingHashtagSuggestions];
          v52 = [v51 allObjects];
          v53 = (void *)[v52 mutableCopy];

          char v54 = [MEMORY[0x263F5AC58] shouldAutoConvertToTag];
          id v55 = v67;
          if ((v54 & 1) == 0)
          {
            v56 = [v67 string];
            v57 = objc_msgSend(v56, "substringWithRange:", a3, a4);
            v58 = [a1 currentUnconfirmedHashtagString:v57 textStorage:v67];

            if (([a1 isExistingHashtag:v58 hashtagSuggestionsArray:v53] & 1) == 0)
            {
              id v59 = objc_alloc_init(MEMORY[0x263F5AC60]);
              [v59 setDisplayText:v58];
              [v53 addObject:v59];
            }
            id v55 = v67;
          }
          objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", v53, v41, v43, v17, v55);

          id v18 = v66;
          goto LABEL_30;
        }
        uint64_t v64 = [v67 length];

        if (v41 + v43 == v64) {
          goto LABEL_38;
        }
      }
      if (a3)
      {
        v60 = [v67 attribute:*MEMORY[0x263F5AD80] atIndex:a3 - 1 effectiveRange:0];
        if (v60)
        {
          v65 = objc_opt_class();
          int v61 = [MEMORY[0x263F5AC58] shouldAutoConvertToTag];
          if (v61) {
            uint64_t v62 = v41;
          }
          else {
            uint64_t v62 = a3;
          }
          if (v61) {
            unint64_t v63 = v43;
          }
          else {
            unint64_t v63 = a4;
          }
          objc_msgSend(v65, "addUnconfirmedAttributeToTextStorage:atRange:", v67, v62, v63);
        }
      }
      if (!v40) {
        goto LABEL_30;
      }
      v45 = a1;
      unint64_t v46 = a3;
      unint64_t v47 = a4;
      id v48 = v67;
      uint64_t v49 = 0;
    }
    else
    {
      if (a3)
      {
        v44 = [v67 attribute:*MEMORY[0x263F5AD80] atIndex:a3 - 1 effectiveRange:0];
        if (v44) {
          objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v67, a3, a4);
        }
      }
      if (!a8) {
        goto LABEL_30;
      }
      v45 = a1;
      unint64_t v46 = a3;
      unint64_t v47 = a4;
      id v48 = v67;
      uint64_t v49 = v16;
    }
    objc_msgSend(v45, "createNewHashtagIfNecessary:textStorage:ignoreDelimiter:parentAttachment:", v46, v47, v48, v49, v18);
    goto LABEL_30;
  }
LABEL_31:
}

- (void)clearUnconfirmedHashtagInTextStorage:()App
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", 0, 0, 0, 0, v6);
  }
  uint64_t v4 = [(id)objc_opt_class() rangeOfUnconfirmedHashtagInTextStorage:v6];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x263F5AD80], v4, v5);
  }
}

- (void)updateUIWhenAutoConversionOff:()App textStorage:
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() rangeOfUnconfirmedHashtagInTextStorage:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    if ([v6 length]
      && (!objc_msgSend(a1, "isValidElement:", objc_msgSend(v6, "characterAtIndex:", 0))
       || [a1 isEmoji:v6]))
    {
      [a1 clearUnconfirmedHashtagInTextStorage:v7];
      [a1 updatePredictiveBar:0];
    }
    else
    {
      v12 = [v7 string];
      v13 = objc_msgSend(v12, "substringWithRange:", v10, v11);

      if ((unint64_t)[v13 length] >= 2
        && objc_msgSend(v13, "ic_containsHashtagPrefix"))
      {
        id v14 = objc_alloc_init(MEMORY[0x263F5AC60]);
        [v14 setDisplayText:v13];
        objc_msgSend(a1, "setEditedRange:", v10, v11);
        v16[0] = v14;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
        [a1 updatePredictiveBar:v15];
      }
    }
  }
}

- (__CFString)currentUnconfirmedHashtagString:()App textStorage:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() rangeOfUnconfirmedHashtagInTextStorage:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
  uint64_t v10 = v8;
  uint64_t v11 = v9;
  if ([v6 length]
    && (!objc_msgSend(a1, "isValidElement:", objc_msgSend(v6, "characterAtIndex:", 0))
     || [a1 isEmoji:v6]))
  {
    [a1 dismissAutoCompletionView];
LABEL_9:
    v13 = &stru_26C10E100;
    goto LABEL_10;
  }
  v12 = [v7 string];
  objc_msgSend(v12, "substringWithRange:", v10, v11);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[(__CFString *)v13 length] < 2
    || ([(__CFString *)v13 ic_containsHashtagPrefix] & 1) == 0)
  {

    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (void)updatePredictiveBar:()App
{
  id v8 = a3;
  uint64_t v4 = [a1 hashtagKeyboardDelegate];

  if (v4)
  {
    uint64_t v5 = [a1 hashtagKeyboardDelegate];
    [v5 updateKeyboardSuggestions:v8 hashtagController:a1];
  }
  id v6 = [a1 hashtagTableKeyboardDelegate];

  if (v6)
  {
    id v7 = [a1 hashtagTableKeyboardDelegate];
    [v7 updateKeyboardSuggestions:v8 hashtagController:a1];
  }
}

- (void)createNewHashtagIfNecessary:()App textStorage:ignoreDelimiter:parentAttachment:
{
  id v12 = a5;
  id v13 = a7;
  id v14 = [v12 string];
  v15 = objc_msgSend(v14, "substringWithRange:", a3, a4);

  if (![MEMORY[0x263F5AC58] shouldAutoConvertToTag]
    || a3 + a4 > (unint64_t)[v12 length])
  {
    [a1 updateUIWhenAutoConversionOff:v15 textStorage:v12];
    goto LABEL_4;
  }
  if ([MEMORY[0x263F5AC58] shouldAutoConvertToTag]) {
    [a1 updatePredictiveBar:0];
  }
  char v16 = [a1 isValidPostfixString:v15];
  if ([v15 length]) {
    char v17 = v16;
  }
  else {
    char v17 = 0;
  }
  if ((v17 & 1) == 0 && !a6)
  {
    if (!a3) {
      goto LABEL_4;
    }
    id v18 = [v12 string];
    int v19 = objc_msgSend(v18, "substringWithRange:", a3 - 1, 1);

    v20 = [v12 attribute:*MEMORY[0x263F5AD80] atIndex:a3 - 1 effectiveRange:0];
    if (v20)
    {
    }
    else
    {
      BOOL v32 = [v19 stringByApplyingTransform:*MEMORY[0x263EFF5A0] reverse:0];
      unint64_t v33 = objc_msgSend(NSString, "ic_hashtagCharacterString");
      int v34 = [v32 isEqualToString:v33];

      if (!v34)
      {
LABEL_24:

        goto LABEL_4;
      }
    }
    objc_msgSend((id)objc_opt_class(), "addUnconfirmedAttributeToTextStorage:atRange:", v12, a3, a4);
    goto LABEL_24;
  }
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__0;
  v48[4] = __Block_byref_object_dispose__0;
  uint64_t v49 = &stru_26C10E100;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  if ((a6 & 1) == 0) {
    uint64_t v21 = objc_msgSend(a1, "rangeToCheckForHashtagCreation:", a3, a4);
  }
  uint64_t v37 = v22;
  uint64_t v38 = v21;
  id v47 = 0;
  id v23 = [MEMORY[0x263F08770] dataDetectorWithTypes:-1 error:&v47];
  id v35 = v47;
  if (!v23)
  {
    v24 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[ICHashtagController(App) createNewHashtagIfNecessary:textStorage:ignoreDelimiter:parentAttachment:](v24);
    }
  }
  v25 = objc_msgSend(v12, "attributedString", v35);
  int v26 = [v25 string];

  uint64_t v27 = objc_msgSend(v26, "paragraphRangeForRange:", a3, a4);
  unint64_t v29 = objc_msgSend(v23, "matchesInString:options:range:", v26, 0, v27, v28);
  unint64_t v30 = [v12 string];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __101__ICHashtagController_App__createNewHashtagIfNecessary_textStorage_ignoreDelimiter_parentAttachment___block_invoke;
  v39[3] = &unk_2640B8078;
  id v31 = v29;
  id v40 = v31;
  uint64_t v41 = a1;
  v45 = v48;
  char v46 = a6;
  id v42 = v15;
  id v43 = v13;
  id v44 = v12;
  objc_msgSend(v30, "enumerateSubstringsInRange:options:usingBlock:", v38, v37, 258, v39);

  _Block_object_dispose(v48, 8);
LABEL_4:
}

- (unint64_t)rangeToCheckForHashtagCreation:()App
{
  if (a3 >= 0x4C) {
    return a3 - 76;
  }
  else {
    return 0;
  }
}

- (uint64_t)isExistingHashtag:()App hashtagSuggestionsArray:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "displayText", (void)v14);
        uint64_t v11 = objc_msgSend(v5, "ic_hashtagDisplayText");
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)dismissAutoCompletionView
{
  v2 = [a1 tableTextView];

  if (v2)
  {
    id v6 = [a1 tableTextView];
    objc_opt_class();
    [a1 tableTextView];
  }
  else
  {
    id v6 = [a1 textView];
    objc_opt_class();
    [a1 textView];
  v3 = };
  uint64_t v4 = [v3 textStorage];
  id v5 = ICDynamicCast();
  objc_msgSend(a1, "updateAutoCompletionView:range:textView:ofTextStorage:", 0, 0, 0, v6, v5);
}

- (void)updateAutoCompletionView:()App range:textView:ofTextStorage:
{
  id v23 = a3;
  id v12 = a6;
  id v13 = a7;
  if (v23)
  {
    long long v14 = (void *)MEMORY[0x263F5AC60];
    long long v15 = [a1 note];
    long long v16 = [v15 managedObjectContext];
    long long v17 = [v14 sortedItems:v23 context:v16];
  }
  else
  {
    long long v17 = (void *)MEMORY[0x263EFFA68];
  }
  objc_msgSend(a1, "setEditedRange:", a4, a5);
  id v18 = [a1 textView];
  char v19 = objc_msgSend(v18, "ic_isInSecureWindow");

  if ((v19 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      v20 = ICDynamicCast();
      [a1 setTableTextView:v20];

      uint64_t v21 = [a1 hashtagTableKeyboardDelegate];
    }
    else
    {
      [a1 setTableTextView:0];
      uint64_t v21 = [a1 hashtagKeyboardDelegate];
    }
    uint64_t v22 = v21;
    [v21 updateKeyboardSuggestions:v17 hashtagController:a1];
  }
}

- (uint64_t)range:()App hasValidPostfixCharacterForString:
{
  id v8 = a5;
  uint64_t v9 = v8;
  uint64_t v10 = a3 + a4;
  if (v10 < 0 || v10 >= (unint64_t)[v8 length]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v9, "characterAtIndex:", v10));
  }

  return v11;
}

- (uint64_t)isValidPostfixCharacter:()App
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08708], "ic_hashtagAllowedCharacterSet");
  uint64_t v5 = [v4 characterIsMember:a3] ^ 1;

  return v5;
}

- (uint64_t)isValidPostfixString:()App
{
  id v4 = a3;
  if (([a1 isEmoji:v4] & 1) != 0 || !objc_msgSend(v4, "length"))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F08708], "ic_hashtagAllowedCharacterSet");
    uint64_t v6 = objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0)) ^ 1;
  }
  return v6;
}

- (BOOL)isEmoji:()App
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    uint64_t v5 = [v3 length];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__ICHashtagController_App__isEmoji___block_invoke;
    v8[3] = &unk_2640B80A0;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 258, v8);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)isValidElement:()App
{
  id v4 = objc_msgSend(MEMORY[0x263F08708], "ic_hashtagAllowedCharacterSet");
  uint64_t v5 = [v4 characterIsMember:a3];

  return v5;
}

- (uint64_t)insertHashtagWithText:()App viaAutoComplete:parentAttachment:
{
  return [a1 insertHashtagWithText:a3 viaAutoComplete:a4 delimiter:0 parentAttachment:a5];
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:
{
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263F5AC68];
  id v12 = a6;
  id v13 = a3;
  long long v14 = [a1 note];
  long long v15 = [v11 createHashtagAttachmentIfApplicableWithHashtagText:v13 creatingHashtagIfNecessary:1 note:v14 parentAttachment:v12];

  if (!v15)
  {
    id v18 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICHashtagController(App) insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:](v18);
    }
    goto LABEL_9;
  }
  long long v16 = [a1 attachmentInsertionController];

  if (!v16)
  {
    id v18 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ICHashtagController(App) insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:](v18);
    }
LABEL_9:

    goto LABEL_12;
  }
  long long v17 = [a1 tableTextView];
  if (v17) {
    [a1 tableTextView];
  }
  else {
  char v19 = [a1 textView];
  }
  uint64_t v20 = [a1 editedRange];
  objc_msgSend(a1, "insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:", v15, v19, v20, v21, a4, v10);

  [v15 accessibilityAnnounceCreationWithVoiceOver];
LABEL_12:
}

- (void)insertHashtagAttachment:()App toTextView:range:viaAutoComplete:delimiter:
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  objc_opt_class();
  long long v17 = [v15 textStorage];
  id v18 = ICDynamicCast();

  if (a5 <= [v18 length])
  {
    uint64_t v20 = [a1 analyticsDelegate];

    if (v20)
    {
      uint64_t v21 = [a1 analyticsDelegate];
      [a1 note];
      NSUInteger v50 = a5;
      uint64_t v22 = a1;
      NSUInteger v23 = a6;
      v24 = v18;
      int v26 = v25 = v16;
      uint64_t v27 = [v14 tokenContentIdentifier];
      [v21 hashtagInsertedInNote:v26 tokenContentIdentifier:v27 viaAutoComplete:a7];

      id v16 = v25;
      id v18 = v24;
      a6 = v23;
      a1 = v22;
      a5 = v50;
    }
    uint64_t v28 = [a1 attachmentInsertionController];
    id v29 = (id)objc_msgSend(v28, "addInlineAttachment:atTextRange:textView:", v14, a5, a6, v15);

    if (a7)
    {
      objc_opt_class();
      unint64_t v30 = ICCheckedDynamicCast();
      id v31 = v30;
      if (v30 && ![v30 languageHasSpaces])
      {
        objc_msgSend(v15, "setSelectedRange:", a5 + 1, 0);
      }
      else
      {
        v51 = v18;
        id v32 = v14;
        unint64_t v33 = [v15 textStorage];
        unint64_t v34 = [v33 length];
        id v35 = v16;
        unint64_t v36 = [v16 length] + a5 + 1;

        BOOL v37 = v34 >= v36;
        id v16 = v35;
        if (v37)
        {
          uint64_t v38 = [v15 textStorage];
          objc_msgSend(v38, "replaceCharactersInRange:withString:", objc_msgSend(v35, "length") + a5 + 1, 0, @" ");
        }
        v39 = [v15 textStorage];
        unint64_t v40 = [v39 length];
        NSUInteger v41 = a5 + 2;
        unint64_t v42 = [v35 length] + v41;

        if (v40 >= v42)
        {
          objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v35, "length") + v41, 0);
        }
        else
        {
          id v43 = [v15 textStorage];
          objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v43, "length"), 0);
        }
        id v14 = v32;
        id v18 = v51;
      }
    }
    else
    {
      id v44 = [v15 textStorage];
      unint64_t v45 = [v44 length];
      unint64_t v46 = a5 + 2;

      if (v45 <= v46)
      {
        id v47 = [v15 textStorage];
        objc_msgSend(v15, "setSelectedRange:", objc_msgSend(v47, "length"), 0);
      }
      else
      {
        objc_msgSend(v15, "setSelectedRange:", v46, 0);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v48 = ICDynamicCast();
      uint64_t v49 = [v48 cellDelegate];
      [v49 setNeedsSave];

      [a1 setTableTextView:0];
    }
    [a1 updateNoteHashtags];
    [a1 setTableTextView:0];
  }
  else
  {
    char v19 = os_log_create("com.apple.notes", "Hashtag");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v52.location = a5;
      v52.length = a6;
      -[ICHashtagController(App) insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:](v52, v18, v19);
    }
  }
}

+ (uint64_t)rangeOfUnconfirmedHashtagInTextStorage:()App
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3010000000;
  id v12 = &unk_20C1E2BF2;
  long long v13 = xmmword_20C1794E0;
  uint64_t v4 = *MEMORY[0x263F5AD80];
  uint64_t v5 = [v3 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__ICHashtagController_App__rangeOfUnconfirmedHashtagInTextStorage___block_invoke;
  v8[3] = &unk_2640B80C8;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v8);
  uint64_t v6 = v10[4];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (void)addUnconfirmedAttributeToTextStorage:()App atRange:
{
  uint64_t v7 = *MEMORY[0x263F5AD80];
  id v8 = NSNumber;
  id v9 = a3;
  id v10 = [v8 numberWithBool:1];
  objc_msgSend(v9, "addAttribute:value:range:", v7, v10, a4, a5);
}

- (void)createNewHashtagIfNecessary:()App textStorage:ignoreDelimiter:parentAttachment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Could not create NSDataDetector in ICHashtagController+App.", v1, 2u);
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Cannot addInlineAttachment because hashtagAttachment is nil", v1, 2u);
}

- (void)insertHashtagWithText:()App viaAutoComplete:delimiter:parentAttachment:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Cannot addInlineAttachment because attachmentInsertionController is nil", v1, 2u);
}

- (void)insertHashtagAttachment:()App toTextView:range:viaAutoComplete:delimiter:.cold.1(NSRange a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromRange(a1);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. textStorage length is %lu.", (uint8_t *)&v6, 0x16u);
}

@end