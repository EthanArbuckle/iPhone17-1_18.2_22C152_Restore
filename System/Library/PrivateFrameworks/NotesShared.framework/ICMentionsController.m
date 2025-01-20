@interface ICMentionsController
+ (BOOL)isBeginningExplicitMentionAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5;
+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3;
+ (BOOL)isValidPrefixCharacter:(unsigned __int16)a3 languageHasSpaces:(BOOL)a4;
+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4;
+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5;
+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4;
+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4;
+ (_NSRange)rangeOfLastCharacterInRange:(_NSRange)a3;
+ (id)allKeyword;
+ (id)allUserRecordName;
- (BOOL)allowsMentions;
- (BOOL)isUpdatingKeyboard;
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICMentionsAnalyticsDelegate)analyticsDelegate;
- (ICMentionsController)initWithNote:(id)a3;
- (ICMentionsKeyboardDelegate)mentionsKeyboardDelegate;
- (ICMentionsKeyboardDelegate)mentionsTableKeyboardDelegate;
- (ICMentionsParticipantNode)participantTree;
- (ICNote)note;
- (ICTableColumnTextView)tableTextView;
- (NSMutableDictionary)participantDictionary;
- (NSMutableSet)participantNames;
- (NSMutableSet)participantRecordNames;
- (NSObject)contactsChangedObserverToken;
- (UITextView)textView;
- (_NSRange)editedRange;
- (id)checkForMentionsInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6;
- (id)participantsForKey:(id)a3;
- (unint64_t)maxNameLength;
- (void)addAllKeywordToParticipantTree;
- (void)associateParticipant:(id)a3 withKey:(id)a4;
- (void)dealloc;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setContactsChangedObserverToken:(id)a3;
- (void)setEditedRange:(_NSRange)a3;
- (void)setIsUpdatingKeyboard:(BOOL)a3;
- (void)setMaxNameLength:(unint64_t)a3;
- (void)setMentionsKeyboardDelegate:(id)a3;
- (void)setMentionsTableKeyboardDelegate:(id)a3;
- (void)setNote:(id)a3;
- (void)setParticipantDictionary:(id)a3;
- (void)setParticipantNames:(id)a3;
- (void)setParticipantRecordNames:(id)a3;
- (void)setParticipantTree:(id)a3;
- (void)setTableTextView:(id)a3;
- (void)setTextView:(id)a3;
- (void)updateMentionsAssociations;
@end

@implementation ICMentionsController

- (NSObject)contactsChangedObserverToken
{
  return self->_contactsChangedObserverToken;
}

- (void)setTextView:(id)a3
{
}

- (void)setContactsChangedObserverToken:(id)a3
{
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (ICMentionsController)initWithNote:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICMentionsController;
  v5 = [(ICMentionsController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_note, v4);
    [(ICMentionsController *)v6 updateMentionsAssociations];
    if (objc_opt_respondsToSelector()) {
      [(ICMentionsController *)v6 registerForContactsChangedNotification];
    }
  }

  return v6;
}

- (void)updateMentionsAssociations
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICMentionsController updateMentionsAssociations]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if ([(ICMentionsController *)self allowsMentions])
  {
    v3 = [(ICMentionsController *)self note];
    id v4 = [v3 serverShareCheckingParent];

    v36 = v4;
    v5 = objc_msgSend(v4, "ic_acceptedParticipants");
    [(ICMentionsController *)self setMaxNameLength:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICMentionsController *)self setParticipantDictionary:v6];

    v7 = objc_alloc_init(ICMentionsParticipantNode);
    [(ICMentionsController *)self setParticipantTree:v7];

    objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    [(ICMentionsController *)self setParticipantRecordNames:v8];

    v9 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v10 = [v5 count];
    v11 = objc_msgSend(v9, "setWithCapacity:", objc_msgSend(MEMORY[0x1E4F1A3B0], "ic_mentionTokensPerParticipant") * v10);
    [(ICMentionsController *)self setParticipantNames:v11];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      obuint64_t j = v12;
      uint64_t v38 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v55 != v38) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "ic_mentionTokens");
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v18 = v17;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v51;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v51 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                v24 = (void *)MEMORY[0x1C877DB80]();
                [(ICMentionsController *)self associateParticipant:v16 withKey:v23];
                unint64_t v25 = [v23 length];
                unint64_t v26 = [(ICMentionsController *)self maxNameLength];
                if (v25 <= v26) {
                  unint64_t v27 = v26;
                }
                else {
                  unint64_t v27 = v25;
                }
                [(ICMentionsController *)self setMaxNameLength:v27];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v20);
          }
        }
        id v12 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v14);
    }

    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_28;
    }
    if (self->_contactsRequestQueue)
    {
      id contactsRequestBlock = self->_contactsRequestBlock;
      if (!contactsRequestBlock)
      {
LABEL_27:
        objc_initWeak(&location, self);
        uint64_t v43 = 0;
        v44 = &v43;
        uint64_t v45 = 0x3032000000;
        v46 = __Block_byref_object_copy__84;
        v47 = __Block_byref_object_dispose__85;
        id v48 = 0;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__ICMentionsController_updateMentionsAssociations__block_invoke;
        block[3] = &unk_1E64A5E70;
        objc_copyWeak(&v42, &location);
        v41 = &v43;
        id v40 = v12;
        dispatch_block_t v32 = dispatch_block_create((dispatch_block_flags_t)0, block);
        id v33 = self->_contactsRequestBlock;
        self->_id contactsRequestBlock = v32;

        v34 = _Block_copy(self->_contactsRequestBlock);
        v35 = (void *)v44[5];
        v44[5] = (uint64_t)v34;

        dispatch_async((dispatch_queue_t)self->_contactsRequestQueue, self->_contactsRequestBlock);
        objc_destroyWeak(&v42);
        _Block_object_dispose(&v43, 8);

        objc_destroyWeak(&location);
LABEL_28:
        [(ICMentionsController *)self addAllKeywordToParticipantTree];

        return;
      }
      dispatch_block_cancel(contactsRequestBlock);
      v29 = self->_contactsRequestBlock;
      self->_id contactsRequestBlock = 0;
    }
    else
    {
      v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v30 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.contactsRequests", v29);
      contactsRequestQueue = self->_contactsRequestQueue;
      self->_contactsRequestQueue = v30;
    }
    goto LABEL_27;
  }
}

- (BOOL)allowsMentions
{
  v3 = [(ICMentionsController *)self note];
  if ([v3 isSharedViaICloud])
  {
    id v4 = [(ICMentionsController *)self note];
    int v5 = [v4 isSharedReadOnly] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  return (ICNote *)WeakRetained;
}

- (void)dealloc
{
  v3 = [(ICMentionsController *)self contactsChangedObserverToken];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v5 = [(ICMentionsController *)self contactsChangedObserverToken];
    [v4 removeObserver:v5];

    [(ICMentionsController *)self setContactsChangedObserverToken:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICMentionsController;
  [(ICMentionsController *)&v6 dealloc];
}

- (id)checkForMentionsInString:(id)a3 inRange:(_NSRange)a4 selectionRange:(_NSRange)a5 languageHasSpaces:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  id v12 = a3;
  if ([(ICMentionsController *)self allowsMentions]
    && ([v12 string],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unint64_t v14 = [v13 length],
        v13,
        v10 + v9 <= v14))
  {
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3010000000;
    v41[3] = &unk_1C3E4C23B;
    long long v42 = xmmword_1C3DD2F80;
    v16 = objc_alloc_init(ICMentionCheckResults);
    v17 = objc_opt_class();
    id v18 = [v12 string];
    int v19 = objc_msgSend(v17, "isBeginningExplicitMentionAtSelectionRange:inString:languageHasSpaces:", location, length, v18, v6);

    if (v19)
    {
      -[ICMentionCheckResults setRangeOfMention:](v16, "setRangeOfMention:", location - 1, 1);
      [(ICMentionCheckResults *)v16 setIsPartialMention:1];
      [(ICMentionCheckResults *)v16 setIsExplicitMention:1];
      [(ICMentionCheckResults *)v16 setIsAllMention:1];
      uint64_t v20 = [(ICMentionsController *)self note];
      uint64_t v21 = [v20 serverShareCheckingParent];

      v22 = (void *)MEMORY[0x1E4F1CAD0];
      v23 = objc_msgSend(v21, "ic_acceptedParticipants");
      v24 = [v22 setWithArray:v23];
      [(ICMentionCheckResults *)v16 setMatchingParticipants:v24];

      [(ICMentionCheckResults *)v16 setMentionString:&stru_1F1F2FFF8];
      v15 = v16;
    }
    else
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__16;
      v39[4] = __Block_byref_object_dispose__16;
      id v40 = [(ICMentionsController *)self participantTree];
      unint64_t v25 = [v12 string];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __90__ICMentionsController_checkForMentionsInString_inRange_selectionRange_languageHasSpaces___block_invoke;
      v33[3] = &unk_1E64A47A0;
      v36 = v39;
      v37 = v41;
      v33[4] = self;
      id v34 = v12;
      BOOL v38 = v6;
      unint64_t v26 = v16;
      v35 = v26;
      objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", v10, v9, 2, v33);

      if ([(ICMentionCheckResults *)v26 isExplicitMention])
      {
        [(ICMentionCheckResults *)v26 rangeOfMention];
        uint64_t v27 = [(ICMentionCheckResults *)v26 rangeOfMention];
        [(ICMentionCheckResults *)v26 rangeOfMention];
        -[ICMentionCheckResults setRangeOfMention:](v26, "setRangeOfMention:", v27 - 1, v28 + 1);
      }
      if ([(ICMentionCheckResults *)v26 rangeOfMention] == 0x7FFFFFFFFFFFFFFFLL
        || ([(ICMentionCheckResults *)v26 rangeOfMention], !v29))
      {
        v15 = 0;
      }
      else
      {
        v30 = [(ICMentionCheckResults *)v26 matchingParticipants];
        if ([v30 count])
        {
        }
        else
        {
          BOOL v31 = [(ICMentionCheckResults *)v26 isAllMention];

          if (!v31) {
            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"results.matchingParticipants.count > 0 || results.isAllMention" functionName:"-[ICMentionsController checkForMentionsInString:inRange:selectionRange:languageHasSpaces:]" simulateCrash:1 showAlert:0 format:@"No matching participants found for mention"];
          }
        }
        v15 = v26;
      }

      _Block_object_dispose(v39, 8);
    }

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __90__ICMentionsController_checkForMentionsInString_inRange_selectionRange_languageHasSpaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v52 = a2;
  v7 = objc_msgSend(v52, "ic_tokenSafeText");
  if ([v7 length])
  {
    objc_super v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      NSUInteger v10 = objc_msgSend(v7, "ic_substringWithRange:", v9, 1);
      v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
      id v12 = [v11 objectForKey:v10];

      if (!v12) {
        break;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
      unint64_t v13 = [v10 length];
      if (v13 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      v9 += v14;

      objc_super v8 = v12;
      if (v9 >= [v7 length]) {
        goto LABEL_10;
      }
    }
    *(_OWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = xmmword_1C3DD2F80;
    uint64_t v15 = [*(id *)(a1 + 32) participantTree];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    id v18 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
    id v12 = [v18 objectForKey:v10];

    if (!v12) {
      goto LABEL_34;
    }
LABEL_10:
    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "range:appendingSubstringRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3, a4);
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    *(void *)(v20 + 32) = v19;
    *(void *)(v20 + 40) = v21;
    v22 = objc_opt_class();
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    v24 = [*(id *)(a1 + 40) string];
    LODWORD(v22) = objc_msgSend(v22, "range:hasValidPrefixCharacterForString:languageHasSpaces:", *(void *)(v23 + 32), *(void *)(v23 + 40), v24, *(unsigned __int8 *)(a1 + 72));

    if (!v22) {
      goto LABEL_33;
    }
    unint64_t v25 = objc_opt_class();
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v27 = [*(id *)(a1 + 40) string];
    uint64_t v28 = objc_msgSend(v25, "range:isPrefixedWithAtForString:", *(void *)(v26 + 32), *(void *)(v26 + 40), v27);

    objc_msgSend(*(id *)(a1 + 48), "setRangeOfMention:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    [*(id *)(a1 + 48) setIsExplicitMention:v28];
    uint64_t v29 = [*(id *)(a1 + 40) string];
    v30 = objc_msgSend(v29, "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    [*(id *)(a1 + 48) setMentionString:v30];

    BOOL v31 = objc_opt_class();
    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    id v33 = [*(id *)(a1 + 40) string];
    LODWORD(v31) = objc_msgSend(v31, "range:hasValidPostfixCharacterForString:", *(void *)(v32 + 32), *(void *)(v32 + 40), v33);

    if (v31)
    {
      id v34 = [v12 participants];
      if ([v34 count])
      {

LABEL_26:
        [*(id *)(a1 + 48) setIsPartialMention:0];
        objc_msgSend(*(id *)(a1 + 48), "setIsAllMention:", objc_msgSend(v12, "isAll"));
LABEL_29:
        v46 = [v12 participants];
LABEL_32:
        v47 = v46;
        id v48 = (void *)[v46 copy];
        [*(id *)(a1 + 48) setMatchingParticipants:v48];

LABEL_33:
        uint64_t v49 = *(void *)(*(void *)(a1 + 56) + 8);
        long long v50 = *(void **)(v49 + 40);
        *(void *)(v49 + 40) = v12;
        id v51 = v12;

        goto LABEL_34;
      }
      if ([v12 isAll])
      {
        v35 = [v12 participants];
        uint64_t v36 = [v35 count];

        if (!v36) {
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    if (!*(unsigned char *)(a1 + 72))
    {
      v37 = [v12 children];
      uint64_t v38 = [v37 count];

      if (!v38) {
        goto LABEL_26;
      }
    }
    if (v28)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        if ((objc_msgSend(v52, "ic_containsNonWhitespaceCharacters") & 1) == 0)
        {
          [*(id *)(a1 + 48) rangeOfMention];
          if (v39 >= 2)
          {
            id v40 = [v12 possibleParticipants];
            uint64_t v41 = [v40 count];

            if (v41 == 1)
            {
              uint64_t v42 = [*(id *)(a1 + 48) rangeOfMention];
              [*(id *)(a1 + 48) rangeOfMention];
              objc_msgSend(*(id *)(a1 + 48), "setRangeOfMention:", v42, v43 - 1);
              [*(id *)(a1 + 48) setIsPartialMention:0];
LABEL_31:
              v46 = [v12 possibleParticipants];
              goto LABEL_32;
            }
          }
        }
      }
    }
    else
    {
      v44 = [v12 participants];
      uint64_t v45 = [v44 count];

      if (v45)
      {
        [*(id *)(a1 + 48) setIsPartialMention:0];
        goto LABEL_29;
      }
    }
    [*(id *)(a1 + 48) setIsPartialMention:1];
    objc_msgSend(*(id *)(a1 + 48), "setIsAllMention:", objc_msgSend(v12, "isPossibleAll"));
    goto LABEL_31;
  }
LABEL_34:
}

void __50__ICMentionsController_updateMentionsAssociations__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  if (WeakRetained && v6 == (void *)WeakRetained[2])
  {
    v7 = [WeakRetained fetchContactNamesForParticipants:*(void *)(a1 + 32)];
    objc_copyWeak(&v9, v2);
    id v8 = v7;
    performBlockOnMainThread();

    objc_destroyWeak(&v9);
  }
  else
  {
    *(void *)(v5 + 40) = 0;
  }
}

void __50__ICMentionsController_updateMentionsAssociations__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) == WeakRetained[2])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = *(id *)(v1 + 32);
    uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v6 = v1;
          v7 = [*(id *)(v1 + 32) objectForKeyedSubscript:v5];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v7);
                }
                id v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                unint64_t v13 = objc_msgSend(v12, "ic_tokenSafeText");
                [v3 associateParticipant:v5 withKey:v13];

                unint64_t v14 = [v12 length];
                unint64_t v15 = [v3 maxNameLength];
                if (v14 <= v15) {
                  unint64_t v16 = v15;
                }
                else {
                  unint64_t v16 = v14;
                }
                [v3 setMaxNameLength:v16];
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v9);
          }

          uint64_t v1 = v6;
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }

    v17 = (void *)v3[2];
    v3[2] = 0;
  }
  uint64_t v18 = *(void *)(*(void *)(v1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0;
}

- (void)associateParticipant:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && [v7 length])
  {
    uint64_t v9 = [(ICMentionsController *)self participantNames];
    [v9 addObject:v8];

    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__16;
    long long v26 = __Block_byref_object_dispose__16;
    id v27 = [(ICMentionsController *)self participantTree];
    uint64_t v10 = [v8 length];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__ICMentionsController_associateParticipant_withKey___block_invoke;
    v19[3] = &unk_1E64A47C8;
    uint64_t v21 = &v22;
    id v11 = v6;
    id v20 = v11;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, v19);
    [(id)v23[5] addParticipant:v11];
    id v12 = [v11 userIdentity];
    unint64_t v13 = [v12 userRecordID];
    unint64_t v14 = [v13 recordName];

    if ([v14 length])
    {
      unint64_t v15 = [(ICMentionsController *)self participantRecordNames];
      [v15 addObject:v14];
    }
    unint64_t v16 = [(ICMentionsController *)self participantDictionary];
    v17 = [v16 objectForKey:v8];

    if (v17) {
      [v17 addObject:v11];
    }
    else {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v11, 0);
    }
    uint64_t v18 = [(ICMentionsController *)self participantDictionary];
    [v18 setObject:v17 forKey:v8];

    _Block_object_dispose(&v22, 8);
  }
}

void __53__ICMentionsController_associateParticipant_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) children];
  id v4 = [v3 objectForKey:v7];

  if (!v4)
  {
    id v4 = objc_alloc_init(ICMentionsParticipantNode);
    [(ICMentionsParticipantNode *)v4 setKey:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addChild:v4];
  }
  [(ICMentionsParticipantNode *)v4 addPossibleParticipant:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)allKeyword
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All" value:@"All" table:0 allowSiri:1];
}

+ (id)allUserRecordName
{
  return (id)objc_msgSend(@"all", "ic_tokenSafeText");
}

- (void)addAllKeywordToParticipantTree
{
  v3 = [(id)objc_opt_class() allKeyword];
  id v4 = objc_msgSend(v3, "ic_tokenSafeText");

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = __Block_byref_object_copy__16;
  unint64_t v14 = __Block_byref_object_dispose__16;
  id v15 = [(ICMentionsController *)self participantTree];
  uint64_t v5 = [v4 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ICMentionsController_addAllKeywordToParticipantTree__block_invoke;
  v9[3] = &unk_1E64A5E98;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v9);
  [(id)v11[5] setIsAll:1];
  unint64_t v6 = [v4 length];
  unint64_t v7 = [(ICMentionsController *)self maxNameLength];
  if (v6 <= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  [(ICMentionsController *)self setMaxNameLength:v8];
  _Block_object_dispose(&v10, 8);
}

void __54__ICMentionsController_addAllKeywordToParticipantTree__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) children];
  id v4 = [v3 objectForKey:v7];

  if (!v4)
  {
    id v4 = objc_alloc_init(ICMentionsParticipantNode);
    [(ICMentionsParticipantNode *)v4 setKey:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addChild:v4];
  }
  [(ICMentionsParticipantNode *)v4 setIsPossibleAll:1];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)participantsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ic_tokenSafeText");
  unint64_t v6 = [(id)objc_opt_class() allKeyword];
  id v7 = objc_msgSend(v6, "ic_tokenSafeText");
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [(ICMentionsController *)self note];
    uint64_t v10 = [v9 serverShareCheckingParent];

    id v11 = [v10 participants];
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  }
  else
  {
    uint64_t v10 = [(ICMentionsController *)self participantDictionary];
    id v11 = objc_msgSend(v4, "ic_tokenSafeText");
    unint64_t v13 = [v10 objectForKey:v11];
    uint64_t v12 = (void *)[v13 copy];
  }
  return v12;
}

+ (_NSRange)rangeOfLastCharacterInRange:(_NSRange)a3
{
  NSUInteger v3 = a3.length != 0;
  if (a3.length) {
    NSUInteger v4 = a3.length + a3.location - 1;
  }
  else {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.NSUInteger length = v3;
  result.NSUInteger location = v4;
  return result;
}

+ (_NSRange)range:(_NSRange)a3 appendingSubstringRange:(_NSRange)a4
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger location = a4.location;
  }
  else {
    NSUInteger location = a3.location;
  }
  NSUInteger v5 = a4.location + a4.length - location;
  result.NSUInteger length = v5;
  result.NSUInteger location = location;
  return result;
}

+ (BOOL)isBeginningExplicitMentionAtSelectionRange:(_NSRange)a3 inString:(id)a4 languageHasSpaces:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  uint64_t v10 = v9;
  BOOL v11 = 0;
  if (location && !length)
  {
    if (location - 1 >= [v9 length])
    {
      BOOL v11 = 0;
    }
    else
    {
      BOOL v12 = [v10 characterAtIndex:location - 1] == 64
         || [v10 characterAtIndex:location - 1] == 65312;
      if (location >= [v10 length]) {
        int v13 = 1;
      }
      else {
        int v13 = objc_msgSend(a1, "range:hasValidPostfixCharacterForString:", location, 0, v10);
      }
      int v14 = v13 & objc_msgSend(a1, "range:hasValidPrefixCharacterForString:languageHasSpaces:", location - 1, 0, v10, v5);
      if (v12) {
        BOOL v11 = v14;
      }
      else {
        BOOL v11 = 0;
      }
    }
  }

  return v11;
}

+ (BOOL)range:(_NSRange)a3 isPrefixedWithAtForString:(id)a4
{
  int64_t location = a3.location;
  id v5 = a4;
  unint64_t v6 = v5;
  BOOL v7 = location < 1;
  unint64_t v8 = location - 1;
  BOOL v9 = !v7
    && v8 < [v5 length]
    && ([v6 characterAtIndex:v8] == 64
     || [v6 characterAtIndex:v8] == 65312);

  return v9;
}

+ (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4 languageHasSpaces:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  int v10 = objc_msgSend(a1, "range:isPrefixedWithAtForString:", location, length, v9);
  uint64_t v11 = -2;
  if (!v10) {
    uint64_t v11 = -1;
  }
  char v12 = 1;
  if (location)
  {
    unint64_t v13 = v11 + location;
    if ((v13 & 0x8000000000000000) == 0)
    {
      if (v13 >= [v9 length]) {
        char v12 = 0;
      }
      else {
        char v12 = objc_msgSend(a1, "isValidPrefixCharacter:languageHasSpaces:", objc_msgSend(v9, "characterAtIndex:", v13), v5);
      }
    }
  }

  return v12;
}

+ (BOOL)isValidPrefixCharacter:(unsigned __int16)a3 languageHasSpaces:(BOOL)a4
{
  if (!a4) {
    return 1;
  }
  uint64_t v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v5 characterIsMember:v4])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v6 = [v7 characterIsMember:v4];
  }
  return v6;
}

+ (BOOL)range:(_NSRange)a3 hasValidPostfixCharacterForString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  unint64_t v8 = v7;
  uint64_t v9 = location + length;
  if (v9 < 0 || v9 >= (unint64_t)[v7 length]) {
    char v10 = 0;
  }
  else {
    char v10 = objc_msgSend(a1, "isValidPostfixCharacter:", objc_msgSend(v8, "characterAtIndex:", v9));
  }

  return v10;
}

+ (BOOL)isValidPostfixCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v4 characterIsMember:v3])
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v5 = [v6 characterIsMember:v3];
  }
  return v5;
}

- (ICMentionsKeyboardDelegate)mentionsKeyboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsKeyboardDelegate);
  return (ICMentionsKeyboardDelegate *)WeakRetained;
}

- (void)setMentionsKeyboardDelegate:(id)a3
{
}

- (ICMentionsKeyboardDelegate)mentionsTableKeyboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsTableKeyboardDelegate);
  return (ICMentionsKeyboardDelegate *)WeakRetained;
}

- (void)setMentionsTableKeyboardDelegate:(id)a3
{
}

- (BOOL)isUpdatingKeyboard
{
  return self->_isUpdatingKeyboard;
}

- (void)setIsUpdatingKeyboard:(BOOL)a3
{
  self->_isUpdatingKeyboard = a3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentInsertionController);
  return (ICAttachmentInsertionController *)WeakRetained;
}

- (void)setNote:(id)a3
{
}

- (ICTableColumnTextView)tableTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableTextView);
  return (ICTableColumnTextView *)WeakRetained;
}

- (void)setTableTextView:(id)a3
{
}

- (_NSRange)editedRange
{
  NSUInteger length = self->_editedRange.length;
  NSUInteger location = self->_editedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEditedRange:(_NSRange)a3
{
  self->_editedRange = a3;
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (ICMentionsAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (ICMentionsAnalyticsDelegate *)WeakRetained;
}

- (NSMutableDictionary)participantDictionary
{
  return self->_participantDictionary;
}

- (void)setParticipantDictionary:(id)a3
{
}

- (NSMutableSet)participantRecordNames
{
  return self->_participantRecordNames;
}

- (void)setParticipantRecordNames:(id)a3
{
}

- (NSMutableSet)participantNames
{
  return self->_participantNames;
}

- (void)setParticipantNames:(id)a3
{
}

- (ICMentionsParticipantNode)participantTree
{
  return self->_participantTree;
}

- (void)setParticipantTree:(id)a3
{
}

- (unint64_t)maxNameLength
{
  return self->_maxNameLength;
}

- (void)setMaxNameLength:(unint64_t)a3
{
  self->_maxNameLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantTree, 0);
  objc_storeStrong((id *)&self->_participantNames, 0);
  objc_storeStrong((id *)&self->_participantRecordNames, 0);
  objc_storeStrong((id *)&self->_participantDictionary, 0);
  objc_storeStrong((id *)&self->_contactsChangedObserverToken, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_tableTextView);
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_mentionsTableKeyboardDelegate);
  objc_destroyWeak((id *)&self->_mentionsKeyboardDelegate);
  objc_storeStrong(&self->_contactsRequestBlock, 0);
  objc_storeStrong((id *)&self->_contactsRequestQueue, 0);
}

@end