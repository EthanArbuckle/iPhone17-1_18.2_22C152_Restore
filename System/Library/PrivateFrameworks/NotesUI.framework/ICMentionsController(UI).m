@interface ICMentionsController(UI)
+ (BOOL)hasMentionInTextStorage:()UI inRange:;
+ (uint64_t)rangeOfUnconfirmedMentionInTextStorage:()UI;
- (id)fetchContactNamesForParticipants:()UI;
- (uint64_t)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:;
- (uint64_t)newlineEnteredInNote:()UI;
- (uint64_t)tableCellFirstResponderChangedInNote:()UI;
- (void)applyUnconfirmedMentionToTextStorage:()UI participants:range:textView:mentionString:;
- (void)clearUnconfirmedMentionInTextStorage:()UI;
- (void)insertMentionWithText:()UI uuidString:parentAttachment:;
- (void)registerForContactsChangedNotification;
- (void)sendPendingNotificationsAfterDelay:()UI forNote:;
@end

@implementation ICMentionsController(UI)

- (void)registerForContactsChangedNotification
{
  v2 = [a1 contactsChangedObserverToken];

  if (!v2)
  {
    objc_initWeak(&location, a1);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = objc_msgSend(MEMORY[0x1E4F1A3B0], "ic_mentionableNamesCache");
    uint64_t v5 = *MEMORY[0x1E4F83658];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v9 = __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke;
    v10 = &unk_1E5FDD6D0;
    objc_copyWeak(&v11, &location);
    v6 = [v3 addObserverForName:v5 object:v4 queue:0 usingBlock:&v7];
    objc_msgSend(a1, "setContactsChangedObserverToken:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (id)fetchContactNamesForParticipants:()UI
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"![NSThread isMainThread]" functionName:"-[ICMentionsController(UI) fetchContactNamesForParticipants:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from main thread"];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "ic_mentionTokensFromContacts", (void)v14);
        objc_msgSend(v4, "ic_setNonNilObject:forKey:", v11, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (uint64_t)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a11;
  if ([a1 allowsMentions])
  {
    uint64_t v20 = [a1 maxLengthOfStringForCheckingMention];
    unint64_t v21 = v20 + 1;
    NSUInteger v22 = a4;
    NSUInteger v23 = a3;
    if (v20 + 1 > a4)
    {
      if (a3 >= v20 + 1 - a4) {
        NSUInteger v24 = v20 + 1 - a4;
      }
      else {
        NSUInteger v24 = a3;
      }
      NSUInteger v23 = a3 - v24;
      unint64_t v25 = [v16 length] - (a3 - v24);
      if (v21 < v25) {
        unint64_t v25 = v21;
      }
      if (v25 + v23 <= a3 + a4) {
        NSUInteger v22 = v25;
      }
      else {
        NSUInteger v22 = v24 + a4;
      }
    }
    char v26 = objc_msgSend(v16, "hasNamedStyle:inRange:", 4, a3, a4);
    v81 = a1;
    if ((v26 & 1) != 0 || a4)
    {
      if ((v26 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      objc_opt_class();
      [v18 typingAttributes];
      v27 = NSUInteger v77 = v23;
      [v27 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
      v28 = NSUInteger v76 = v22;
      v29 = ICDynamicCast();
      id v30 = v19;
      id v31 = v18;
      id v32 = v16;
      id v33 = v17;
      int v34 = [v29 style];

      NSUInteger v22 = v76;
      NSUInteger v23 = v77;
      BOOL v35 = v34 == 4;
      id v17 = v33;
      id v16 = v32;
      id v18 = v31;
      id v19 = v30;
      if (!v35)
      {
LABEL_18:
        uint64_t v38 = objc_msgSend(v18, "selectedRange", v76);
        v36 = objc_msgSend(v81, "checkForMentionsInString:inRange:selectionRange:languageHasSpaces:", v16, v23, v22, v38, v39, a10);
        if (v36)
        {
          id v78 = v19;
          v40 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v84.id location = a3;
            v84.length = a4;
            -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.5(v84, v36, v40);
          }

          NSUInteger v42 = [v36 rangeOfMention];
          NSUInteger v43 = v41;
          NSUInteger v44 = a3 + a4;
          if (v42 + v41 == a3 + a4)
          {
            NSUInteger v45 = v41;
            uint64_t v46 = objc_opt_class();
            v47 = [v16 string];
            v48 = (void *)v46;
            NSUInteger v43 = v45;
            if ((objc_msgSend(v48, "range:hasValidPostfixCharacterForString:", v42, v45, v47) & 1) != 0
              || v44 == [v16 length])
            {

              if ((a9 & 1) == 0)
              {
                if ([v36 isExplicitMention])
                {
                  v49 = os_log_create("com.apple.notes", "Mentions");
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    v82.id location = v42;
                    v82.length = v45;
                    -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:](v82);
                  }
LABEL_53:

                  [v36 matchingParticipants];
                  v58 = NSUInteger v57 = v43;
                  v59 = [v36 mentionString];
                  objc_msgSend(v81, "applyUnconfirmedMentionToTextStorage:participants:range:textView:mentionString:", v16, v58, v42, v57, v18, v59);

                  char v37 = 1;
                  id v19 = v78;
                  goto LABEL_49;
                }
                if (([v36 isPartialMention] & 1) == 0)
                {
                  v49 = os_log_create("com.apple.notes", "Mentions");
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    v85.id location = v42;
                    v85.length = v45;
                    -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:].cold.4(v85);
                  }
                  goto LABEL_53;
                }
LABEL_46:
                char v37 = 0;
LABEL_47:
                id v19 = v78;
                goto LABEL_48;
              }
            }
            else
            {
            }
          }
          uint64_t v50 = [v36 rangeOfMention];
          if (v51 + v50 + 1 != v44 && !a9) {
            goto LABEL_46;
          }
          int v52 = [v36 isExplicitMention];
          if (!a8)
          {
            char v37 = 0;
            if (v52 && (a9 & 1) == 0)
            {
              v49 = os_log_create("com.apple.notes", "Mentions");
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                v83.id location = v42;
                v83.length = v43;
                -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:](v83);
              }
              goto LABEL_53;
            }
            goto LABEL_47;
          }
          if (!v52 || ([v36 isPartialMention] & 1) != 0) {
            goto LABEL_46;
          }
          v53 = v17;
          v54 = [v36 matchingParticipants];
          if ([v54 count] == 1)
          {
          }
          else
          {
            if (![v36 isAllMention])
            {
              char v37 = 0;
LABEL_75:
              id v19 = v78;

              id v17 = v53;
              goto LABEL_48;
            }
            [v36 matchingParticipants];
            v61 = NSUInteger v60 = v43;
            uint64_t v62 = [v61 count];

            NSUInteger v43 = v60;
            if (v62)
            {
              char v37 = 0;
              id v17 = v53;
              goto LABEL_47;
            }
          }
          v55 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            v86.id location = v42;
            v86.length = v43;
            -[ICMentionsController(UI) checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:](v86);
          }

          if ([v36 isAllMention])
          {
            v54 = [(id)objc_opt_class() allUserRecordName];
          }
          else
          {
            [v36 matchingParticipants];
            v64 = NSUInteger v63 = v43;
            v65 = [v64 anyObject];
            v54 = objc_msgSend(v65, "ic_userRecordNameInNote:", v53);

            NSUInteger v43 = v63;
          }
          if ([v36 isAllMention])
          {
            v66 = [(id)objc_opt_class() allKeyword];
LABEL_69:
            v74 = [MEMORY[0x1E4F833A0] createMentionAttachmentIfApplicableWithMentionText:v66 userRecordName:v54 note:v53 parentAttachment:v78];
            v75 = v74;
            if (v74)
            {
              [v74 setAnimateInsertion:1];
              [v75 setMentionNotificationState:1];
              char v37 = objc_opt_respondsToSelector();
              if (v37) {
                objc_msgSend(v81, "insertMentionAttachment:atRange:viaAutoComplete:", v75, v42, v43, 0);
              }
              [v53 save];
            }
            else
            {
              char v37 = 0;
            }

            goto LABEL_75;
          }
          NSUInteger v80 = v43;
          v67 = [v36 matchingParticipants];
          v68 = [v67 anyObject];

          v69 = [v36 mentionString];
          uint64_t v70 = [v69 length];

          if (v70)
          {
            v71 = [v36 mentionString];
            v72 = objc_msgSend(v71, "ic_trailingTrimmedString");
            v73 = objc_msgSend(v68, "ic_participantNameMatchingString:returnFullName:", v72, 0);

            if (v73)
            {
              v66 = v73;
              NSUInteger v43 = v80;
              if ([v73 length])
              {
LABEL_68:

                goto LABEL_69;
              }
LABEL_67:
              v66 = objc_msgSend(v68, "ic_shortParticipantName");

              goto LABEL_68;
            }
          }
          else
          {
            v73 = 0;
          }
          NSUInteger v43 = v80;
          goto LABEL_67;
        }
LABEL_28:
        char v37 = 0;
LABEL_48:
        objc_msgSend(v81, "clearUnconfirmedMentionInTextStorage:", v16, v76);
LABEL_49:

        goto LABEL_50;
      }
    }
    v36 = 0;
    goto LABEL_28;
  }
  char v37 = 0;
LABEL_50:

  return v37 & 1;
}

+ (uint64_t)rangeOfUnconfirmedMentionInTextStorage:()UI
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3010000000;
  v12 = &unk_1B0BF84BB;
  long long v13 = xmmword_1B0B987A0;
  uint64_t v4 = *MEMORY[0x1E4F83580];
  uint64_t v5 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__ICMentionsController_UI__rangeOfUnconfirmedMentionInTextStorage___block_invoke;
  v8[3] = &unk_1E5FDA328;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 2, v8);
  uint64_t v6 = v10[4];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)clearUnconfirmedMentionInTextStorage:()UI
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:mentionString:", 0, 0, 0, 0, 0);
  }
  uint64_t v4 = [(id)objc_opt_class() rangeOfUnconfirmedMentionInTextStorage:v6];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F83580], v4, v5);
  }
}

- (void)insertMentionWithText:()UI uuidString:parentAttachment:
{
  uint64_t v8 = (void *)MEMORY[0x1E4F833A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [a1 note];
  long long v13 = [v8 createMentionAttachmentIfApplicableWithMentionText:v11 userRecordName:v10 note:v12 parentAttachment:v9];

  if (v13)
  {
    [v13 setAnimateInsertion:1];
    [v13 setMentionNotificationState:1];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [a1 editedRange];
      objc_msgSend(a1, "insertMentionAttachment:atRange:viaAutoComplete:", v13, v14, v15, 1);
    }
  }
  else
  {
    id v16 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ICMentionsController(UI) insertMentionWithText:uuidString:parentAttachment:](v16);
    }
  }
}

- (uint64_t)newlineEnteredInNote:()UI
{
  return [a1 sendPendingNotificationsAfterDelay:3 forNote:a3];
}

- (uint64_t)tableCellFirstResponderChangedInNote:()UI
{
  return [a1 sendPendingNotificationsAfterDelay:3 forNote:a3];
}

- (void)sendPendingNotificationsAfterDelay:()UI forNote:
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  if ([a1 allowsMentions])
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ICMentionsController_UI__sendPendingNotificationsAfterDelay_forNote___block_invoke;
    block[3] = &unk_1E5FD8DF0;
    id v8 = v5;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

+ (BOOL)hasMentionInTextStorage:()UI inRange:
{
  id v7 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke;
  v12[3] = &unk_1E5FDA378;
  v12[4] = &v13;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0x100000, v12);
  if (*((unsigned char *)v14 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4FB06B8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke_2;
    v11[3] = &unk_1E5FDA328;
    v11[4] = &v13;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, v11);
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)applyUnconfirmedMentionToTextStorage:()UI participants:range:textView:mentionString:
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = *MEMORY[0x1E4F83580];
  if (v14)
  {
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4F83580], v14, a5, a6);
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1CAD0] set];
    objc_msgSend(v19, "addAttribute:value:range:", v17, v18, a5, a6);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a1, "updateAutoCompletionView:range:textView:mentionString:", v14, a5, a6, v15, v16);
  }
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.1(NSRange a1)
{
  v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Explicit mention automatically confirmed at %@", v4, v5, v6, v7, v8);
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.2(NSRange a1)
{
  v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Unconfirmed explicit mention at %@, not allowed to auto convert", v4, v5, v6, v7, v8);
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.3(NSRange a1)
{
  v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Unconfirmed explicit partial mention at %@", v4, v5, v6, v7, v8);
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.4(NSRange a1)
{
  v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Unconfirmed implicit mention at %@", v4, v5, v6, v7, v8);
}

- (void)checkForMentionInEditedRange:()UI ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:.cold.5(NSRange a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromRange(a1);
  uint64_t v6 = [a2 debugDescription];
  int v7 = 138412547;
  uint8_t v8 = v5;
  __int16 v9 = 2113;
  id v10 = v6;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Mentions result at %@: %{private}@", (uint8_t *)&v7, 0x16u);
}

- (void)insertMentionWithText:()UI uuidString:parentAttachment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Cannot addInlineAttachment because mentionsAttachment is nil", v1, 2u);
}

@end