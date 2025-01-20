@interface ICMentionsController(App)
- (id)moveCurrentUserToLast:()App;
- (void)insertMention:()App toTextView:atRange:viaAutoComplete:;
- (void)insertMentionAttachment:()App atRange:viaAutoComplete:;
- (void)updateAutoCompletionView:()App range:textView:mentionString:;
@end

@implementation ICMentionsController(App)

- (void)updateAutoCompletionView:()App range:textView:mentionString:
{
  id v17 = a6;
  id v12 = a7;
  id v13 = a3;
  objc_msgSend(a1, "setEditedRange:", a4, a5);
  objc_opt_class();
  v14 = ICDynamicCast();
  [a1 setTableTextView:v14];

  v15 = [a1 moveCurrentUserToLast:v13];

  if ((objc_msgSend(v17, "ic_isInSecureWindow") & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 mentionsTableKeyboardDelegate];
    }
    else {
    v16 = [a1 mentionsKeyboardDelegate];
    }
    [v16 updateKeyboardSuggestions:v15 mentionsController:a1 mentionString:v12];
  }
}

- (void)insertMentionAttachment:()App atRange:viaAutoComplete:
{
  id v10 = a3;
  v11 = [a1 attachmentInsertionController];

  if (v11)
  {
    id v12 = [a1 tableTextView];
    if (v12) {
      [a1 tableTextView];
    }
    else {
    v14 = [a1 textView];
    }
    objc_msgSend(a1, "insertMention:toTextView:atRange:viaAutoComplete:", v10, v14, a4, a5, a6);
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICHashtagController(App) insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:](v13);
    }
  }
}

- (void)insertMention:()App toTextView:atRange:viaAutoComplete:
{
  v37[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [v13 selectedRange];
  objc_opt_class();
  v15 = [v13 textStorage];
  v16 = ICDynamicCast();

  if (a5 <= [v16 length])
  {
    v18 = [a1 attachmentInsertionController];
    id v19 = (id)objc_msgSend(v18, "addInlineAttachment:atTextRange:textView:", v12, a5, a6, v13);

    if (a7)
    {
      objc_opt_class();
      v20 = ICCheckedDynamicCast();
      v21 = v20;
      if (v20 && ![v20 languageHasSpaces])
      {
        uint64_t v23 = 1;
      }
      else
      {
        v22 = [v13 textStorage];
        objc_msgSend(v22, "replaceCharactersInRange:withString:", a5 + 1, 0, @" ");

        uint64_t v23 = 2;
      }
      objc_msgSend(v13, "setSelectedRange:", a5 + v23, 0);
    }
    else if (v14 > a5)
    {
      uint64_t v24 = v14 - a6;
      if (v14 < a6) {
        uint64_t v24 = -1;
      }
      objc_msgSend(v13, "setSelectedRange:", v24 + 1, 0);
    }
    [a1 setTableTextView:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v25 = ICDynamicCast();
      v26 = [v25 cellDelegate];
      [v26 setNeedsSave];
    }
    v27 = [v12 note];
    v28 = [v12 note];
    v37[0] = v12;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    id v30 = (id)[v27 persistMentionActivityEventForObject:v28 mentionAttachments:v29];

    v31 = [a1 analyticsDelegate];

    if (v31)
    {
      v32 = [a1 analyticsDelegate];
      v33 = [v12 note];
      v34 = [v12 identifier];
      v35 = [v12 tokenContentIdentifier];
      [v32 mentionInsertedInNote:v33 mentionID:v34 participantID:v35 viaAutoComplete:a7];
    }
    v36 = [v12 note];
    [a1 sendPendingNotificationsAfterDelay:180 forNote:v36];

    [v12 accessibilityAnnounceCreationWithVoiceOver];
  }
  else
  {
    id v17 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v38.location = a5;
      v38.length = a6;
      -[ICHashtagController(App) insertHashtagAttachment:toTextView:range:viaAutoComplete:delimiter:](v38, v16, v17);
    }
  }
}

- (id)moveCurrentUserToLast:()App
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isCurrentUser", (void)v15))
        {
          id v12 = v11;

          v8 = v12;
        }
        else
        {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);

    if (v8) {
      [v4 addObject:v8];
    }
  }
  else
  {

    v8 = 0;
  }
  id v13 = objc_msgSend(v4, "copy", (void)v15);

  return v13;
}

@end