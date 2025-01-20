@interface ICDrawingHashtagsAndMentionsController
- (CKShare)share;
- (ICAttachment)attachment;
- (ICDrawingHashtagsAndMentionsController)initWithAttachment:(id)a3;
- (ICNote)note;
- (NSArray)eligibleShareParticipants;
- (NSDictionary)mentionTokensForParticipants;
- (NSManagedObjectContext)managedObjectContext;
- (id)allConfirmedHashtagsForAttachmentView:(id)a3;
- (id)allConfirmedMentionsForAttachmentView:(id)a3;
- (id)attachmentView:(id)a3 participantMatchesForMentionText:(id)a4;
- (void)allPossibleParticipantNameTokensForAttachmentView:(id)a3 completion:(id)a4;
- (void)attachmentView:(id)a3 userConfirmedHashtagWithUUID:(id)a4 displayText:(id)a5;
- (void)attachmentView:(id)a3 userConfirmedMentionWithUUID:(id)a4 participantIdentifier:(id)a5;
- (void)attachmentView:(id)a3 userDeletedHashtagWithUUID:(id)a4;
- (void)attachmentView:(id)a3 userDeletedMentionWithUUID:(id)a4;
- (void)fetchMentionTokensForParticipants:(id)a3 completion:(id)a4;
- (void)setAttachment:(id)a3;
- (void)setMentionTokensForParticipants:(id)a3;
@end

@implementation ICDrawingHashtagsAndMentionsController

- (ICDrawingHashtagsAndMentionsController)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDrawingHashtagsAndMentionsController;
  v5 = [(ICDrawingHashtagsAndMentionsController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attachment, v4);
  }

  return v6;
}

- (void)allPossibleParticipantNameTokensForAttachmentView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = objc_opt_new();
  objc_initWeak(&location, self);
  v9 = [(ICDrawingHashtagsAndMentionsController *)self eligibleShareParticipants];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke;
  v12[3] = &unk_1E5FD9F18;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(ICDrawingHashtagsAndMentionsController *)self fetchMentionTokensForParticipants:v9 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  id v4 = v3;
  id v5 = a1[4];
  id v6 = a1[5];
  performBlockOnMainThread();

  objc_destroyWeak(&v7);
}

void __103__ICDrawingHashtagsAndMentionsController_allPossibleParticipantNameTokensForAttachmentView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = (void *)[*(id *)(a1 + 32) copy];
    [WeakRetained setMentionTokensForParticipants:v3];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = objc_msgSend(WeakRetained, "mentionTokensForParticipants", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
          id v10 = *(void **)(a1 + 40);
          id v11 = [WeakRetained mentionTokensForParticipants];
          v12 = [v11 objectForKeyedSubscript:v9];
          [v10 unionSet:v12];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    if ([*(id *)(a1 + 40) count])
    {
      id v13 = *(void **)(a1 + 40);
      id v14 = [MEMORY[0x1E4F83410] allKeyword];
      id v15 = objc_msgSend(v14, "ic_tokenSafeText");
      [v13 addObject:v15];
    }
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = (void *)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

- (id)allConfirmedMentionsForAttachmentView:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  v38 = self;
  uint64_t v5 = [(ICDrawingHashtagsAndMentionsController *)self share];

  if (v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v6 = self;
    uint64_t v7 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
    uint64_t v8 = [v7 visibleInlineAttachments];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E4F83000uLL;
    uint64_t v12 = *(void *)v42;
    uint64_t v39 = *(void *)v42;
    v37 = v8;
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v40 = v10;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
        if (objc_msgSend(v14, "isMentionAttachment", v37))
        {
          id v15 = [v14 tokenContentIdentifier];
          uint64_t v16 = [*(id *)(v11 + 1040) allUserRecordName];
          int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            id v18 = objc_alloc(MEMORY[0x1E4F29128]);
            long long v19 = [v14 identifier];
            long long v20 = (void *)[v18 initWithUUIDString:v19];

            long long v21 = [*(id *)(v11 + 1040) allKeyword];
            v22 = [MEMORY[0x1E4FB1618] tintColor];
            uint64_t v23 = [MEMORY[0x1E4F38E30] mentionWithDisplayName:v21 identifier:v15 color:v22];
            [v4 setObject:v23 forKeyedSubscript:v20];
            goto LABEL_12;
          }
          v24 = [(ICDrawingHashtagsAndMentionsController *)v6 note];
          long long v20 = [v24 participantForUserID:v15];

          if (v20)
          {
            id v25 = objc_alloc(MEMORY[0x1E4F29128]);
            v26 = [v14 identifier];
            long long v21 = (void *)[v25 initWithUUIDString:v26];

            v27 = (void *)MEMORY[0x1E4F1A3B0];
            v28 = [(ICDrawingHashtagsAndMentionsController *)v6 note];
            v22 = objc_msgSend(v27, "ic_participantNameOrFallbackForUserRecordName:note:", v15, v28);

            [(ICDrawingHashtagsAndMentionsController *)v6 note];
            v30 = v29 = v4;
            v31 = [v30 collaborationColorManager];
            v32 = [(ICDrawingHashtagsAndMentionsController *)v6 note];
            uint64_t v23 = [v31 highlightColorForUserID:v15 note:v32];

            uint64_t v6 = v38;
            id v4 = v29;
            unint64_t v11 = 0x1E4F83000;
            v33 = [MEMORY[0x1E4F38E30] mentionWithDisplayName:v22 identifier:v15 color:v23];
            [v4 setObject:v33 forKeyedSubscript:v21];

            uint64_t v8 = v37;
LABEL_12:

            uint64_t v12 = v39;
          }

          uint64_t v10 = v40;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v10)
      {
LABEL_16:

        break;
      }
    }
  }
  v34 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[ICDrawingHashtagsAndMentionsController allConfirmedMentionsForAttachmentView:]();
  }

  v35 = (void *)[v4 copy];
  return v35;
}

- (id)attachmentView:(id)a3 participantMatchesForMentionText:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_msgSend(v5, "ic_tokenSafeText");
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [(ICDrawingHashtagsAndMentionsController *)self share];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F83410] allKeyword];
    uint64_t v10 = objc_msgSend(v9, "ic_tokenSafeText");
    int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F38E30];
      uint64_t v13 = [MEMORY[0x1E4F83410] allKeyword];
      id v14 = [MEMORY[0x1E4F83410] allUserRecordName];
      id v15 = [MEMORY[0x1E4FB1618] tintColor];
      uint64_t v16 = [v12 mentionWithDisplayName:v13 identifier:v14 color:v15];

      [v7 addObject:v16];
    }
    else
    {
      long long v44 = v7;
      long long v41 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = [(ICDrawingHashtagsAndMentionsController *)self eligibleShareParticipants];
      uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v47;
        uint64_t v42 = *(void *)v47;
        id v43 = v5;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(obj);
            }
            long long v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v22 = [(ICDrawingHashtagsAndMentionsController *)self mentionTokensForParticipants];
            uint64_t v23 = [v22 objectForKeyedSubscript:v21];

            v24 = objc_msgSend(v5, "ic_tokenSafeText");
            int v25 = [v23 containsObject:v24];

            if (v25)
            {
              v26 = [(ICDrawingHashtagsAndMentionsController *)self note];
              v27 = objc_msgSend(v21, "ic_userRecordNameInNote:", v26);

              v28 = objc_msgSend(v21, "ic_participantNameMatchingString:returnFullName:", v5, 1);
              v29 = v28;
              if ((!v28 || ![v28 length])
                && (objc_msgSend(v21, "ic_cachedDisplayNameFromContacts"),
                    uint64_t v30 = objc_claimAutoreleasedReturnValue(),
                    v29,
                    (v29 = (void *)v30) == 0)
                || ![v29 length])
              {
                v31 = (void *)MEMORY[0x1E4F1A3B0];
                v32 = [(ICDrawingHashtagsAndMentionsController *)self note];
                uint64_t v33 = objc_msgSend(v31, "ic_participantNameOrFallbackForUserRecordName:note:", v27, v32);

                v29 = (void *)v33;
              }
              v34 = [(ICDrawingHashtagsAndMentionsController *)self note];
              v35 = [v34 collaborationColorManager];
              v36 = [(ICDrawingHashtagsAndMentionsController *)self note];
              v37 = [v35 highlightColorForUserID:v27 note:v36];

              v38 = [MEMORY[0x1E4F38E30] mentionWithDisplayName:v29 identifier:v27 color:v37];
              [v44 addObject:v38];

              uint64_t v19 = v42;
              id v5 = v43;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v18);
      }

      uint64_t v6 = v41;
      uint64_t v7 = v44;
    }
  }
  uint64_t v39 = (void *)[v7 copy];

  return v39;
}

- (void)attachmentView:(id)a3 userConfirmedMentionWithUUID:(id)a4 participantIdentifier:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F83410] allUserRecordName];
  char v10 = [v8 isEqualToString:v9];

  int v11 = [(ICDrawingHashtagsAndMentionsController *)self note];
  uint64_t v12 = [v11 participantForUserID:v8];

  if ((v10 & 1) != 0 || v12)
  {
    long long v41 = v12;
    id v42 = v8;
    if (v10)
    {
      uint64_t v40 = [MEMORY[0x1E4F83410] allKeyword];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F1A3B0];
      uint64_t v16 = [(ICDrawingHashtagsAndMentionsController *)self note];
      uint64_t v40 = objc_msgSend(v15, "ic_participantNameOrFallbackForUserRecordName:note:", v8, v16);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v17 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
    uint64_t v18 = [v17 inlineAttachments];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v44;
LABEL_11:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v43 + 1) + 8 * v22);
        v24 = [v23 identifier];
        int v25 = [v7 UUIDString];
        int v26 = [v24 isEqualToString:v25];

        if (v26) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v20) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      os_log_t v13 = v23;
      if ([v13 attachmentType] != 2) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"inlineAttachment.attachmentType == ICInlineAttachmentTypeMention" functionName:"-[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedMentionWithUUID:participantIdentifier:]" simulateCrash:1 showAlert:1 format:@"Found existing inline attachment for a drawing but it is not a mention"];
      }
      id v14 = (void *)v40;
      if ([v13 markedForDeletion]) {
        [v13 unmarkForDeletion];
      }

      if (v13) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_17:

      id v14 = (void *)v40;
    }
    v27 = (void *)MEMORY[0x1E4F833A0];
    v28 = [v7 UUIDString];
    v29 = [(ICDrawingHashtagsAndMentionsController *)self note];
    uint64_t v30 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
    os_log_t v13 = (os_log_t)[v27 newMentionAttachmentWithIdentifier:v28 mentionText:v14 userRecordName:v42 note:v29 parentAttachment:v30];

    [v13 setMentionNotificationState:1];
LABEL_24:
    [v13 updateChangeCountWithReason:@"Confirmed mention"];
    v31 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedMentionWithUUID:participantIdentifier:](v13);
    }

    v32 = [v13 note];
    uint64_t v33 = [v13 note];
    os_log_t v55 = v13;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    id v35 = (id)[v32 persistMentionActivityEventForObject:v33 mentionAttachments:v34];

    v36 = [(ICDrawingHashtagsAndMentionsController *)self managedObjectContext];
    objc_msgSend(v36, "ic_save");

    v37 = +[ICMentionNotificationController sharedController];
    [v37 sendPendingNotifications];

    uint64_t v12 = v41;
    id v8 = v42;
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v38 = [v7 UUIDString];
      uint64_t v39 = [(ICDrawingHashtagsAndMentionsController *)self share];
      *(_DWORD *)buf = 138413058;
      long long v48 = v38;
      __int16 v49 = 2112;
      v50 = v39;
      __int16 v51 = 2112;
      uint64_t v52 = 0;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_error_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_ERROR, "Unable to confirm mention (%@) for share (%@) participant (%@; identifier %@)",
        buf,
        0x2Au);
    }
    id v14 = v13;
  }
}

- (void)attachmentView:(id)a3 userDeletedMentionWithUUID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F833A0];
  id v7 = [v5 UUIDString];
  id v8 = [(ICDrawingHashtagsAndMentionsController *)self managedObjectContext];
  uint64_t v9 = [v6 attachmentWithIdentifier:v7 context:v8];

  char v10 = os_log_create("com.apple.notes", "PencilKit");
  int v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedMentionWithUUID:]();
    }

    [MEMORY[0x1E4F833A0] deleteAttachment:v9];
    int v11 = [v9 managedObjectContext];
    objc_msgSend(v11, "ic_save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedMentionWithUUID:]();
    }
  }
}

- (id)allConfirmedHashtagsForAttachmentView:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
  uint64_t v6 = [v5 visibleInlineAttachments];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 isHashtagAttachment])
        {
          id v12 = objc_alloc(MEMORY[0x1E4F29128]);
          os_log_t v13 = [v11 identifier];
          id v14 = (void *)[v12 initWithUUIDString:v13];

          objc_msgSend(v4, "ic_addNonNilObject:", v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ICDrawingHashtagsAndMentionsController allConfirmedHashtagsForAttachmentView:]();
  }

  uint64_t v16 = (void *)[v4 copy];
  return v16;
}

- (void)attachmentView:(id)a3 userConfirmedHashtagWithUUID:(id)a4 displayText:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v26 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
  uint64_t v9 = [v8 inlineAttachments];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      id v15 = [v14 identifier];
      uint64_t v16 = [v7 UUIDString];
      int v17 = [v15 isEqualToString:v16];

      if (v17) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v19 = v14;
    if ([v19 attachmentType] != 1) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"inlineAttachment.attachmentType == ICInlineAttachmentTypeHashtag" functionName:"-[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedHashtagWithUUID:displayText:]" simulateCrash:1 showAlert:1 format:@"Found existing inline attachment for a drawing but it is not a hashtag"];
    }
    long long v18 = v26;
    if ([v19 markedForDeletion]) {
      [v19 unmarkForDeletion];
    }

    if (v19) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

    long long v18 = v26;
  }
  long long v20 = (void *)MEMORY[0x1E4F833A0];
  long long v21 = [v7 UUIDString];
  uint64_t v22 = [(ICDrawingHashtagsAndMentionsController *)self note];
  uint64_t v23 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
  id v19 = (id)[v20 newHashtagAttachmentWithIdentifier:v21 hashtagText:v18 creatingHashtagIfNecessary:1 note:v22 parentAttachment:v23];

LABEL_16:
  [v19 updateChangeCountWithReason:@"Confirmed tag"];
  v24 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[ICDrawingHashtagsAndMentionsController attachmentView:userConfirmedHashtagWithUUID:displayText:](v19);
  }

  int v25 = [(ICDrawingHashtagsAndMentionsController *)self managedObjectContext];
  objc_msgSend(v25, "ic_save");
}

- (void)attachmentView:(id)a3 userDeletedHashtagWithUUID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F833A0];
  id v7 = [v5 UUIDString];
  uint64_t v8 = [(ICDrawingHashtagsAndMentionsController *)self managedObjectContext];
  uint64_t v9 = [v6 attachmentWithIdentifier:v7 context:v8];

  uint64_t v10 = os_log_create("com.apple.notes", "PencilKit");
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedHashtagWithUUID:]();
    }

    [MEMORY[0x1E4F833A0] deleteAttachment:v9];
    uint64_t v11 = [v9 managedObjectContext];
    objc_msgSend(v11, "ic_save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICDrawingHashtagsAndMentionsController attachmentView:userDeletedHashtagWithUUID:]();
    }
  }
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
  id v3 = [v2 managedObjectContext];

  return (NSManagedObjectContext *)v3;
}

- (ICNote)note
{
  v2 = [(ICDrawingHashtagsAndMentionsController *)self attachment];
  id v3 = [v2 note];

  return (ICNote *)v3;
}

- (CKShare)share
{
  v2 = [(ICDrawingHashtagsAndMentionsController *)self note];
  id v3 = [v2 serverShareCheckingParent];

  return (CKShare *)v3;
}

- (NSArray)eligibleShareParticipants
{
  v2 = [(ICDrawingHashtagsAndMentionsController *)self note];
  id v3 = [v2 serverShareCheckingParent];
  id v4 = objc_msgSend(v3, "ic_acceptedParticipants");
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = v4;

  return v6;
}

- (void)fetchMentionTokensForParticipants:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  contactsRequestQueue = self->_contactsRequestQueue;
  if (!contactsRequestQueue)
  {
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.drawingContactsRequests", v9);
    uint64_t v11 = self->_contactsRequestQueue;
    self->_contactsRequestQueue = v10;

    contactsRequestQueue = self->_contactsRequestQueue;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__ICDrawingHashtagsAndMentionsController_fetchMentionTokensForParticipants_completion___block_invoke;
  v14[3] = &unk_1E5FD8F48;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(contactsRequestQueue, v14);
}

void __87__ICDrawingHashtagsAndMentionsController_fetchMentionTokensForParticipants_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "ic_mentionTokens", (void)v14);
        uint64_t v10 = objc_msgSend(v8, "ic_mentionTokensFromContacts");
        uint64_t v11 = [v10 setByAddingObjectsFromSet:v9];
        objc_msgSend(v2, "ic_setNonNilObject:forKey:", v11, v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    id v13 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (NSDictionary)mentionTokensForParticipants
{
  return self->_mentionTokensForParticipants;
}

- (void)setMentionTokensForParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionTokensForParticipants, 0);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_contactsRequestQueue, 0);
}

- (void)allConfirmedMentionsForAttachmentView:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  id v2 = [v1 attachment];
  id v3 = [v2 shortLoggingDescription];
  uint64_t v10 = [v0 allKeys];
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "Confirmed mentions for parent attachment (%@): %@", v6, v7, v8, v9, 2u);
}

- (void)attachmentView:(void *)a1 userConfirmedMentionWithUUID:participantIdentifier:.cold.1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Created inline attachment for confirmed mention: %@", v4, v5, v6, v7, 2u);
}

- (void)attachmentView:userDeletedMentionWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  [v1 UUIDString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v4, v5, "Couldn't find inline mention attachment for deletion: %@ (parent: %@)", v6, v7, v8, v9, v10);
}

- (void)attachmentView:userDeletedMentionWithUUID:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "User deleted an inline mention attachment from drawing: %@ (parent: %@)", v6, v7, v8, v9, v10);
}

- (void)allConfirmedHashtagsForAttachmentView:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  id v1 = [v0 attachment];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Confirmed hashtags for parent attachment (%@): %@", v5, v6, v7, v8, 2u);
}

- (void)attachmentView:(void *)a1 userConfirmedHashtagWithUUID:displayText:.cold.1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Created inline attachment for confirmed hashtag: %@", v4, v5, v6, v7, 2u);
}

- (void)attachmentView:userDeletedHashtagWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  [v1 UUIDString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v4, v5, "Couldn't find inline hashtag attachment for deletion: %@ (parent: %@)", v6, v7, v8, v9, v10);
}

- (void)attachmentView:userDeletedHashtagWithUUID:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() attachment];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "User deleted an hashtag attachment from drawing: %@ (parent: %@)", v6, v7, v8, v9, v10);
}

@end